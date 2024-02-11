CC = ${CROSS_COMPLE}gcc
CFLAGS = -Wall -Wextra

.PHONY: all clean

all: writer

writer: writer.c
	$(CC) $(CFLAGS) -o writer writer.c

clean:
	rm -f writer