TARGET := bienvenue
MODULE := fonction-bienvenue

CXX = g++
LD = g++
RM = rm -f

CXXFLAGS = -Wall -std=c++11
LDFLAGS =

$(info Fabrication du programme : $(TARGET))

# Règle par défaut
all: $(TARGET)

$(TARGET): $(TARGET).o $(MODULE).o
	$(LD) -o $@ $^ $(LDFLAGS)

$(TARGET).o: $(TARGET).cpp $(MODULE).h
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(MODULE).o: $(MODULE).cpp $(MODULE).h
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: clean cleanall rebuild

clean:
	$(RM) *.o

cleanall: clean
	$(RM) $(TARGET).exe

rebuild: clean all

