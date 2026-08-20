CXX      := g++
CXXFLAGS := -std=c++17 -O2 -Wall -Wextra

TARGET := cvfs

all: $(TARGET)

$(TARGET): cvfs.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -f $(TARGET)

.PHONY: all clean
