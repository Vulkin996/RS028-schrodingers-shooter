CC=g++
GLFLAGS= -std=c++17 -lBox2D -lGL -lglut -lGLU
CFLAGS=-lm

all: SchShooter

SchShooter: main.o image.o player.o geometry.o weapon.o item.o bullet.o gameScene.o
	$(CC) main.o image.o player.o geometry.o weapon.o item.o bullet.o gameScene.o -o SchShooter.out $(GLFLAGS) $(CFLAGS)
	
main.o: source/main.cpp
	$(CC) -c source/main.cpp $(GLFLAGS) $(CFLAGS)
	
image.o: source/image.cpp header/image.h
	$(CC) -c source/image.cpp $(CFLAGS)
	
player.o: source/player.cpp header/player.h
	$(CC) -c source/player.cpp $(CFLAGS)

geometry.o: source/geometry.cpp header/geometry.h
	$(CC) -c source/geometry.cpp $(CFLAGS)

weapon.o: source/weapon.cpp header/weapon.h
	$(CC) -c source/weapon.cpp $(CFLAGS)
	
item.o: source/item.cpp header/item.h
	$(CC) -c source/item.cpp $(CFLAGS)

bullet.o: source/bullet.cpp header/bullet.h
	$(CC) -c source/bullet.cpp $(CFLAGS)

gameScene.o: source/gameScene.cpp header/gameScene.h
	$(CC) -c source/gameScene.cpp $(CFLAGS)
	
clean:
	rm -rf *.o *.out
