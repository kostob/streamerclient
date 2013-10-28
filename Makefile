TARGET = streamerClient
GRAPES = ../GRAPES2
LDLIBS = -lm -lGRAPES2 -lpthread
CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -L$(GRAPES)/dist/Debug/GNU-Generic
CPPFLAGS = -I$(GRAPES)/include

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) $(CPPFLAGS)  -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) -Wall -s -Wl -rpath=. -o $@ $(OBJECTS) $(LDLIBS) $(LDFLAGS)

clean:
	-rm -f *.o
	-rm -f $(TARGET)