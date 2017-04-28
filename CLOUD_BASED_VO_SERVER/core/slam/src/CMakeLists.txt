#FIND_PACKAGE( OpenCV REQUIRED)

#INCLUDE_DIRECTORIES(/usr/include/eigen3/)
#INCLUDE_DIRECTORIES(/home/ubuntu/CloudBasedSeg2/rapidjson-master/include/)
ADD_LIBRARY( robotJson_server SHARED robotJson_server.cpp )
TARGET_LINK_LIBRARIES( robotJson_server )


#ADD_LIBRARY(slamInterface SHARED slamInterface.cpp)
#TARGET_LINK_LIBRARIES(slamInterface
#	robotJson_server
#	slamBase_server
#	${OpenCV_LIBS}
#	)
