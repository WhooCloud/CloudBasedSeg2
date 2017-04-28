#include "slamBase.h"
#include "robotBase.h"
void uploadFileHTTP(const char* file_path, const char* url);
void uploadIDFileHTTP(const char* file_path, const char* url, const char* id);
string CompressString(string in_str);
string DecompressString(string in_str);

int main(int argc, char** argv)
{
    //Read Parameters
    ParameterReader PR;
    string ws_url = PR.getData("ws_url");
    string upload_http_url = PR.getData("upload_http_url");
    string download_http_url = PR.getData("download_http_url");
    string images_path = PR.getData("images_path");
    string results_path = PR.getData("results_path");
    string robot_id = PR.getData("robot_id");
    //Connect to the cloud (WebSocket)
    RobotClient Client;
    Client.setURL(ws_url);
    Client.connect();
    //Send initial message
    string DataSend = PR.getData("initial_message");
    RobotJson InitMessageJson;
    InitMessageJson.setString(DataSend);
    InitMessageJson.setDocString("robot_id", robot_id);
    DataSend = InitMessageJson.getString();
    string CDataSend = CompressString(DataSend);
    Client.setDataSend(CDataSend);
    Client.sendBinaryData();
    //Receive initial result
    Client.receiveBinaryData();
    string DataReceive;
    string DDataReceive;
    DataReceive = Client.getDataReceive();
    DDataReceive = DecompressString(DataReceive);
    cout<<"main: "<<"DStrDataReceive :"<<DDataReceive<<endl;

    int index;
    for(index = 1; index < 10; index ++)
    {
        //Upload image
        stringstream ss;
        ss<<index;
        ss<<"_carpet.jpg";
        string ImageName = ss.str();
        //ss.release();
        string ImagePath = images_path + ImageName;
        cv::Mat src = cv::imread(ImagePath);
        if(src.data == NULL)
        {
            cout<<"Warning: Image "<<ImagePath<<" does not exist.";
            continue;
        }
        uploadIDFileHTTP(ImagePath.c_str(), upload_http_url.c_str(), robot_id.c_str());
        //Send Command Message
        DataSend = PR.getData("command_message");
        RobotJson CommandMessageJson;
        CommandMessageJson.setString(DataSend);
        CommandMessageJson.setDocString("filename", ImageName );
        DataSend = CommandMessageJson.getString();
        CDataSend = CompressString(DataSend);
        Client.setDataSend(CDataSend);
        Client.sendBinaryData();
        //Receive information
        Client.receiveBinaryData();
        DataReceive = Client.getDataReceive();
        DDataReceive = DecompressString(DataReceive);
        cout<<"main: "<<"DStrDataReceive :"<<DDataReceive<<endl;
        RobotJson ResultMessageJson;
        ResultMessageJson.setString(DDataReceive);
        string Message = ResultMessageJson.getDocString("message");
        if (Message == "OK")
        {
            //if OK, download result from the cloud
            string ResultPath = results_path+ ImageName;
            string DownloadURL = download_http_url + "/" + robot_id + "/" + "inference.jpg";
            string CMD = string("wget ") +  DownloadURL + string(" -O ") + ResultPath;
            cout<<CMD<<endl;
            int err = system(CMD.c_str());
            cv::Mat src2 = cv::imread(ResultPath);
            cv::imshow("src", src);
            cv::imshow("src2", src2);
            cvWaitKey(10);
        }
        cout<<ImageName<<" Done."<<endl;
    }
	return 0;
}