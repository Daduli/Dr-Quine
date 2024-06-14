NAME = dr_quine_asm
NAME1 = Colleen
NAME2 = Grace
NAME3 = Sully

COLLEEN_SRC = Colleen.s
GRACE_SRC = Grace.s
SULLY_SRC = Sully.s
COLLEEN_OBJ = $(COLLEEN_SRC:.s=.o)
GRACE_OBJ = $(GRACE_SRC:.s=.o)
SULLY_OBJ = $(SULLY_SRC:.s=.o)

ASM = nasm
FLAGS = -f elf64
LINK = ld
LFLAGS = -lc -I /lib64/ld-linux-x86-64.so.2

%.o: %.s
	$(ASM) $(FLAGS) $< -o $@

all: $(NAME)

$(NAME): $(NAME1) $(NAME2) $(NAME3)

$(NAME1): $(COLLEEN_OBJ)
	$(LINK) $(LFLAGS) $^ -o $@

$(NAME2): $(GRACE_OBJ)
	$(LINK) $(LFLAGS) $^ -o $@

$(NAME3): $(SULLY_OBJ)
	$(LINK) $(LFLAGS) $^ -o $@

clean:
	@rm -f *.o Grace_kid.s Sully_*

fclean: clean
	@rm -f $(NAME1) $(NAME2) $(NAME3)

re: fclean all

.PHONY: all clean fclean re