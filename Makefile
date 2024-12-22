#Source files
SRCS = ./ft_base_check_fd.c ./ft_print_address_fd.c ./ft_printf_format_fd.c ./ft_printf_fd.c ./ft_putchar_fd.c\
		./ft_putnbr_base_fd.c ./ft_putstr_fd.c ./ft_strdup_printf.c ./ft_strlen_printf.c ./ft_strjoin_printf.c ./ft_memcpy_printf.c

#Object files
OBJS = ${SRCS:.c=.o}

#Library name
NAME = libftprintf.a

# Additional library paths
LIBFT_DIR			:= ./library/libft
FT_PRINTF_FD_DIR	:= ./library/ft_printf_fd

# Libraries
LIBFT				:= ${LIBFT_DIR}/libft.a
FT_PRINTF_FD		:= ${FT_PRINTF_FD_DIR}/libftprintf.a

#INCLUDE
INCLUDE				:= -I ${LIBFT_DIR} -I ${FT_PRINTF_FD_DIR}
#Default target
all :${NAME}

#Rules to compile
%.o : %.c
		cc -Wall -Wextra -Werror -c  $< -o $@ ${INCLUDE}

#Target to create library
${NAME} : ${OBJS}
		ar rcs $@ $^

#Target to clean
clean :
		rm -f ${OBJS}

#Target to clean
fclean :
		rm -rf ${NAME} ${OBJS}

#Clean and build again
re : fclean all

.PHONY : all clean fclean re