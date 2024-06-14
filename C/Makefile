NAME = dr_quine_c
NAME1 = Colleen
NAME2 = Grace
NAME3 = Sully

COLLEEN_SRC += Colleen.c
GRACE_SRC += Grace.c
SULLY_SRC += Sully.c
COLLEEN_OBJ = $(COLLEEN_SRC:%.c=%.o)
GRACE_OBJ = $(GRACE_SRC:%.c=%.o)
SULLY_OBJ = $(SULLY_SRC:%.c=%.o)

CC = gcc
FLAGS = -Wall -Wextra -Werror	

all: $(NAME)

$(NAME): $(NAME1) $(NAME2) $(NAME3)

$(NAME1): $(COLLEEN_OBJ)
	$(CC) $(FLAGS) -o $@ $^

$(NAME2): $(GRACE_OBJ)
	$(CC) $(FLAGS) -o $@ $^

$(NAME3): $(SULLY_OBJ)
	$(CC) $(FLAGS) -o $@ $^

%.o: %.c
	$(CC) $(FLAGS) -c -o $@ $<

clean:
	@rm -f *.o Grace_kid.c Sully_*

fclean: clean
	@rm -f $(NAME1) $(NAME2) $(NAME3)

re: fclean all

.PHONY: all clean fclean re