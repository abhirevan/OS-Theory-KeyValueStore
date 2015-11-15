CC=gcc
CFLAGS=-g

default: help

help: 
	@echo "make all - to build library and create all object files"
	@echo "make clean - to clean everything"
	@echo "make kvstore_test - to build the test case"
	@echo "make checkpoint1_test - to build the test case"
	@echo "make checkpoint_userinput1_test - to build the test case"
	@echo "make library - to create library libkvstorelib.a"
all: library checkpoint1_test kvstore_test checkpoint_userinput1_test

kvstore_test: kvstore_test.c kvstore.c kvstore.h 
	$(CC) $(CFLAGS) kvstore_test.c -o kvstore_test -L../OS-Theory-KeyValueStore -lkvstorelib
checkpoint1_test: checkpoint1_test.c kvstore.c kvstore.h
	$(CC) $(CFLAGS) checkpoint1_test.c -o checkpoint1_test -L../OS-Theory-KeyValueStore -lkvstorelib

checkpoint_userinput1_test: checkpoint_userinput1_test.c kvstore.c kvstore.h
	$(CC) $(CFLAGS) checkpoint_userinput1_test.c -o checkpoint_userinput1_test -L../OS-Theory-KeyValueStore -lkvstorelib

library: kvstore.c kvstore.h 
	$(CC) -c kvstore.c kvstore.h -I./
	ar rcs libkvstorelib.a kvstore.o	
clean:
	@echo "Cleaning everything"
	@rm -f libkvstorelib.a checkpoint1_test kvstore_test checkpoint_userinput1_test .datafile1b  .datafile1kb  .datafile1mb  .datafile512kb  .kvstoremapping  .kvstoremeta
