#include "robotBase_server.h"

extern "C" char* FFISLAMInterface(const char* data)
{
	RobotJson JsonData;
	//Initiallize Json Object
	JsonData.setString(string(data));
	//Read Json Object
	cerr<<"type: "<<JsonData.getDocString("type")<<endl;
	cerr<<"data: "<<JsonData.getDocString("data")<<endl;
	cerr<<"camera_cx: "<<JsonData.getDocDouble("camera_cx")<<endl;
	cerr<<"camera_cy: "<<JsonData.getDocDouble("camera_cy")<<endl;
	cerr<<"camera_fx: "<<JsonData.getDocDouble("camera_fx")<<endl;
	cerr<<"camera_fx: "<<JsonData.getDocDouble("camera_fy")<<endl;
	cerr<<"camera_scale: "<<JsonData.getDocDouble("camera_scale")<<endl;

	//Modify Json Object
	string StrType = "zyc";
	JsonData.setDocString("type", StrType);

	string StrData = "0,1,1,1,1,0";
	JsonData.setDocString("data", StrData);

	JsonData.setDocDouble("camera_cx", 3.5);
	JsonData.setDocDouble("camera_cy", 3.5);
	JsonData.setDocDouble("camera_fx", 3.5);
	JsonData.setDocDouble("camera_fy", 3.5);
	JsonData.setDocDouble("camera_scale", 3.5);
	//System Call "python xxx.py"
	system("python /home/yun/lalala.py > /home/yun/lalala.txt");
	cerr<< ifstream("/home/yun/lalala.txt").rdbuf();
	//Return result
	string StrResult;
	StrResult = JsonData.getString();
	return strdup(StrResult.c_str());
}
