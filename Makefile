# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/10 02:19:43 by skasmi            #+#    #+#              #
#    Updated: 2025/03/12 01:04:44 by skasmi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror -arch arm64
NAME = scop
HEADER = includes/scop.h

SRCS = man/main.c
OBJCTS = $(SRCS:%.c=%.o)

BREW_PREFIX = /Users/skasmi/Desktop/1337projects/scop
BREW_PREFIXX = /Users/skasmi/homebrew
MLX_PATH = $(BREW_PREFIX)/MLX42/build
GLFW_PATH = $(BREW_PREFIXX)/opt/glfw

MLX_LIB = $(MLX_PATH)/libmlx42.a
GLFW_LIB = -L$(GLFW_PATH)/lib -lglfw

MACOS_FRAMEWORKS = -framework Cocoa -framework OpenGL -framework IOKit

INCLUDES = -I$(BREW_PREFIX)/MLX42/include -I$(GLFW_PATH)/include

%.o: %.c $(HEADER)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@





$(NAME): $(OBJCTS) $(HEADER)
	$(CC) $(CFLAGS) $(OBJCTS) $(MLX_LIB) $(GLFW_LIB) $(MACOS_FRAMEWORKS) -o $(NAME)
	@echo "\033[31m░█████╗░\033[31m██╗░░░██╗\033[31m██████╗░  \033[32m██████╗░\033[32m██████╗░"
	@echo "\033[31m██╔══██╗\033[31m██║░░░██║\033[31m██╔══██╗  \033[32m╚════██╗\033[32m██╔══██╗"
	@echo "\033[31m██║░░╚═╝\033[31m██║░░░██║\033[31m██████╦╝  \033[32m░█████╔╝\033[32m██║░░██║"
	@echo "\033[31m██║░░██╗\033[31m██║░░░██║\033[31m██╔══██╗  \033[32m░╚═══██╗\033[32m██║░░██║"
	@echo "\033[31m╚█████╔╝\033[31m╚██████╔╝\033[31m██████╦╝  \033[32m██████╔╝\033[32m██████╔╝"
	@echo "\033[31m░╚════╝░\033[31m░╚═════╝░\033[31m╚═════╝░  \033[32m╚═════╝░\033[32m╚═════╝░"

all: $(NAME)

clean:
	rm -f $(OBJCTS)

fclean: clean
	rm -f $(NAME)

re: fclean all