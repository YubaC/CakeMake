# Makefile for cake
CC = gcc
CFLAGS = -Wall -Wno-main -Wno-shift-op-parentheses

OBJS = milk.o sugar.o eggs.o cake.o
TARGET = cake

MESSAGE = HAPPY BIRTHDAY CATIL
VERSION = $(shell date +%Y.%m.%d)

all: $(TARGET)

$(TARGET): $(OBJS)
	@echo "[LINK] baking_cake..."
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)
	@sleep 5
	@echo "[DONE] Cake v$(VERSION) ready!"

milk.o: milk.c
	@echo "[BUILD] pouring_milk..."
	$(CC) -c milk.c -o milk.o
	@sleep 0.3

sugar.o: sugar.c
	@echo "[BUILD] whisking_sugar..."
	$(CC) -c sugar.c -o sugar.o
	@sleep 1

eggs.o: eggs.c
	@echo "[BUILD] cracking_eggs..."
	$(CC) -c eggs.c -o eggs.o
	@sleep 0.3

cake.o: cake.c
	@echo "[BUILD] blending_cake_mix..."
	$(CC) $(CFLAGS) -c cake.c -o cake.o -DM="\"$(MESSAGE)\""
	@sleep 2

clean:
	@echo "[CLEAN] kitchen_reset"
	rm -f $(OBJS) $(TARGET)