CC = gcc -g
CFLAGS = -Wall -Werror
OBJECTS = main.o dungeonGeneration.o perlin.o saveLoad.o fibonacciHeap.o pathFinding.o

dungeon: $(OBJECTS)
	$(CC) $(OBJECTS) -o dungeon $(CFLAGS) -lm

main.o: main.c dungeon.h saveLoad.h pathFinding.h
	$(CC) -c main.c -o main.o $(CFLAGS)

dungeonGeneration.o: dungeonGeneration.c dungeon.h perlin.h pathFinding.h
	$(CC) -c dungeonGeneration.c -o dungeonGeneration.o $(CFLAGS)

perlin.o: perlin.c dungeon.h
	$(CC) -c perlin.c -o perlin.o $(CFLAGS)

saveLoad.o: saveLoad.c dungeon.h
	$(CC) -c saveLoad.c -o saveLoad.o $(CFLAGS)

fibonacciHeap.o: fibonacciHeap.c dungeon.h fibonacciHeap.h
	$(CC) -c fibonacciHeap.c -o fibonacciHeap.o $(CFLAGS)

pathFinding.o: pathFinding.c dungeon.h fibonacciHeap.h
	$(CC) -c pathFinding.c -o pathFinding.o $(CFLAGS)

clean:
	rm -f dungeon *.o *~
