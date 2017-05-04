#include "slamBase.h"
#include "robotBase.h"
#include <vector>
void uploadFileHTTP(const char* file_path, const char* url);
void uploadIDFileHTTP(const char* file_path, const char* url, const char* id);
string CompressString(string in_str);
string DecompressString(string in_str);
void downloadFileHTTP(const char* url,const char* outfilename);
double getCurrentTime();
vector<string> readFileinLine(const char* filepath);

int main(int argc, char** argv)
{
    //Read Parameters
    ParameterReader PR("parameters_train.txt");
    string ws_url = PR.getData("ws_url");
    string upload_http_url = PR.getData("upload_http_url");
    string dataset_path = PR.getData("dataset_path");
    string robot_id = PR.getData("robot_id");
    int iter=atoi(PR.getData("iter").c_str());
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

    
    vector<string> v_s = readFileinLine(string(dataset_path+"train.txt").c_str());
    for(vector<string>::iterator it = v_s.begin(); it != v_s.end(); it++)
    {
        string ImageName = *it;
        uploadIDFileHTTP(string(dataset_path + "/img/" + ImageName + ".jpg").c_str(), upload_http_url.c_str(), robot_id.c_str());
        uploadIDFileHTTP(string(dataset_path + "/cls/" + ImageName + ".mat").c_str(), upload_http_url.c_str(), robot_id.c_str());
        cout<<ImageName<<endl;
    }
    uploadIDFileHTTP(string(dataset_path + "train.txt").c_str(),upload_http_url.c_str(), robot_id.c_str());
    
    DataSend = PR.getData("command_message");
    RobotJson CommandMessageJson;
    CommandMessageJson.setString(DataSend);
    CommandMessageJson.setDocString("robot_id", robot_id);
    CommandMessageJson.setDocInt("iter", iter);
    DataSend = CommandMessageJson.getString();
    CDataSend = CompressString(DataSend);
    Client.setDataSend(CDataSend);
    Client.sendBinaryData();
	return 0;
}