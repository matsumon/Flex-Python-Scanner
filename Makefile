all: scan

scan: scanner.cpp
	g++ scanner.cpp -o scan

scanner.cpp: scanner.l
	flex -o scanner.cpp scanner.l

clean:
	rm -f scan scanner.cpp
