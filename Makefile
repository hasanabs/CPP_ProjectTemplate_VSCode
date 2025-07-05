CXX = g++
CXXFLAGS = -Wall -Wextra -g -Iinclude
SRC_DIR = src
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(SRC_FILES:.cpp=.o)
TARGET = main

all: $(TARGET)

$(TARGET): main.cpp $(SRC_FILES)
	$(CXX) $(CXXFLAGS) main.cpp $(SRC_FILES) -o $(TARGET)

clean:
	rm -f $(TARGET) $(OBJ_FILES)