CC = $(CROSS_COMPILE)gcc

CFLAGS := -Wall -Wextra

TARGET := writer

SRCS := writer.c

OBJS := $(SRCS:.c=.o)

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS)
