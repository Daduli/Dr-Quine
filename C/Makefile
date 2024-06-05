COLLEEN_SRC = Colleen.c
GRACE_SRC = Grace.c
COLLEEN_OBJ = $(COLLEEN_SRC:.c=.o)
GRACE_OBJ = $(GRACE_SRC:.c=.o)

CC = gcc
FLAGS = -Wall -Wextra -Werror	

%.c: %.o
	$(CC) $(FLAGS) $<

all: colleen grace

colleen: $(COLLEEN_OBJ)
	$(CC) $(FLAGS) $(COLLEEN_SRC) -o Colleen

grace: $(GRACE_OBJ)
	$(CC) $(FLAGS) $(GRACE_SRC) -o Grace
clean:
	rm -f *.o

fclean: clean
	rm -f Colleen Grace

re: fclean all

.PHONY: all clean fclean re