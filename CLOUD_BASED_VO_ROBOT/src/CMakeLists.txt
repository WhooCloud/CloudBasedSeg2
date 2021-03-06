LIST( APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules )
SET( RAPIDJSON_ROOT /home/yun/Code/CPP/rapidjson-master/include )
FIND_PACKAGE( GTestSrc REQUIRED )
INCLUDE_DIRECTORIES(/usr/include/eigen3/)  
# 增加opencv的依赖
FIND_PACKAGE( OpenCV REQUIRED )

# 增加PCL库的依赖
#FIND_PACKAGE( PCL REQUIRED COMPONENTS common io visualization filters)
#list(REMOVE_ITEM PCL_LIBRARIES "vtkproj4") # use this in Ubuntu 16.04

# 添加头文件和库文件
#ADD_DEFINITIONS( ${PCL_DEFINITIONS} )
#INCLUDE_DIRECTORIES( ${PCL_INCLUDE_DIRS}  )
#LINK_LIBRARIES( ${PCL_LIBRARY_DIRS} )

ADD_LIBRARY( robot_ SHARED robot_.cpp )
TARGET_LINK_LIBRARIES( robot_ 
	z
	curl
	boost_system
	${OpenCV_LIBS})

ADD_LIBRARY( robotJson SHARED robotJson.cpp )
TARGET_LINK_LIBRARIES( robotJson )

ADD_LIBRARY( robotWS SHARED robotWS.cpp )
TARGET_LINK_LIBRARIES( robotWS
	boost_system
	crypto
	ssl
	cpprest)

ADD_EXECUTABLE( basic_client basic_client.cpp )
TARGET_LINK_LIBRARIES( basic_client 
	robotJson
	robotWS
	robot_
	${OpenCV_LIBS}
	)

ADD_EXECUTABLE( train train.cpp )
TARGET_LINK_LIBRARIES( train 
	robotJson
	robotWS
	robot_
	${OpenCV_LIBS}
	)

ADD_EXECUTABLE(test test.cpp)
TARGET_LINK_LIBRARIES(test curl)

