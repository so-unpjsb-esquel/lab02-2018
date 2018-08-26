CC=gcc
BIN=./bin
CFLAGS=-Wall -Werror -g -lpthread

PROG=ej1 ej2 ej3 forkthread sh

LIST=$(addprefix $(BIN)/, $(PROG))

.PHONY: all
all: $(LIST)

$(BIN)/%: %.c
	$(CC) -o $@ $< $(CFLAGS)

%: %.c
	$(CC) -o $(BIN)/$@ $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(BIN)/ej* $(BIN)/forkthread $(BIN)/sh
