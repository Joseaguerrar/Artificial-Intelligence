CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2

# Files inside src/
SRC = $(wildcard src/*.cpp)
OBJ = $(SRC:.cpp=.o)

# Executable
TARGET = puzzle

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)
