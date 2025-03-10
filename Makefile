# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/10 02:19:43 by skasmi            #+#    #+#              #
#    Updated: 2025/03/10 14:41:49 by skasmi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC=cc
CFLAGS=  -Wall -Wextra -Werror
NAME=scop
HEADER=includes/scop.h

SRCS=man/main.c

OBJCTS=$(SRCS:%.c=%.o)

# Path to MiniLibX build folder (update this to the correct path)
MLX_PATH=MLX42/build
# Specify the correct library name (libmlx42.a)
MLX_LIB=-L$(MLX_PATH) -lmlx42

# GLFW link flags (update this based on your system setup)
GLFW_LIB=-lglfw

# MacOS specific framework flags
MACOS_FRAMEWORKS=-framework Cocoa -framework OpenGL -framework IOKit

%.o: %.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME) : $(OBJCTS) $(HEADER)
	@$(CC) $(CFLAGS) $(OBJCTS) $(MLX_LIB) $(GLFW_LIB) $(MACOS_FRAMEWORKS) -o $(NAME)
	@echo "\033[31m░█████╗░\033[31m██╗░░░██╗\033[31m██████╗░  \033[32m██████╗░\033[32m██████╗░"
	@echo "\033[31m██╔══██╗\033[31m██║░░░██║\033[31m██╔══██╗  \033[32m╚════██╗\033[32m██╔══██╗"
	@echo "\033[31m██║░░╚═╝\033[31m██║░░░██║\033[31m██████╦╝  \033[32m░█████╔╝\033[32m██║░░██║"
	@echo "\033[31m██║░░██╗\033[31m██║░░░██║\033[31m██╔══██╗  \033[32m░╚═══██╗\033[32m██║░░██║"
	@echo "\033[31m╚█████╔╝\033[31m╚██████╔╝\033[31m██████╦╝  \033[32m██████╔╝\033[32m██████╔╝"
	@echo "\033[31m░╚════╝░\033[31m░╚═════╝░\033[31m╚═════╝░  \033[32m╚═════╝░\033[32m╚═════╝░"

all:   $(NAME)

clean:
	rm -f $(OBJCTS)

fclean: clean
	rm -f $(NAME)

re: fclean all
