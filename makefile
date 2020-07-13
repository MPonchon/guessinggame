MYDATE:=$(shell date)
NBLINES:=$(shell wc -l guessinggame.sh)
readme.md:  getdate.sh

	touch	readme.md
	ls readme.md -lct
	echo "* Guessinggame *" > readme.md
	echo "created on $(MYDATE)" >> readme.md
	echo "number of lines : $(NBLINES)" >> readme.md
clean :
	rm readme.md
