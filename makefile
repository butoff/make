vpath %.c src
vpath %.l src
vpath %.h include

CPPFLAGS = -I include

count_words: count_words.o counter.o lexer.o -lfl
	gcc $^ -o $@

count_words.o: count_words.c counter.h
	gcc $(CPPFLAGS) -c $<

counter.o: counter.c counter.h lexer.h
	gcc $(CPPFLAGS) -c $<

lexer.o: lexer.c lexer.h
	gcc $(CPPFLAGS) -c $<

lexer.c: lexer.l
	flex -t $< > $@

.PHONY: clean
clean:
	rm -f *.o lexer.c count_words
