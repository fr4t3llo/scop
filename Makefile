# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/10 02:19:43 by skasmi            #+#    #+#              #
#    Updated: 2025/03/12 06:27:34 by skasmi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = scop
HEADER = includes/scop.h

SRCS = man/scop.c
OBJCTS = $(SRCS:%.c=%.o)

GLEW_PATH = /Users/skasmi/homebrew/opt/glew
GLFW_PATH = /Users/skasmi/homebrew/opt/glfw
MLX_PATH = /Users/skasmi/Desktop/1337projects/scop/MLX42/build

# Include paths
INCLUDES = -I$(MLX_PATH)/include -I$(GLFW_PATH)/include -I$(GLEW_PATH)/include

# Library paths and libraries
LIBS = -L$(GLFW_PATH)/lib -L$(GLEW_PATH)/lib -lglfw -lGLEW

MACOS_FRAMEWORKS = -framework Cocoa -framework OpenGL -framework IOKit

# Rule to compile .c to .o
%.o: %.c $(HEADER)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Build the final executable
$(NAME): $(OBJCTS)
	$(CC) $(CFLAGS) $(OBJCTS) $(MLX_PATH)/libmlx42.a $(LIBS) $(MACOS_FRAMEWORKS) -o $(NAME)
	@echo "\033[31m░█████╗░\033[31m██╗░░░██╗\033[31m██████╗░  \033[32m██████╗░\033[32m██████╗░"
	@echo "\033[31m██╔══██╗\033[31m██║░░░██║\033[31m██╔══██╗  \033[32m╚════██╗\033[32m██╔══██╗"
	@echo "\033[31m██║░░╚═╝\033[31m██║░░░██║\033[31m██████╦╝  \033[32m░█████╔╝\033[32m██║░░██║"
	@echo "\033[31m██║░░██╗\033[31m██║░░░██║\033[31m██╔══██╗  \033[32m░╚═══██╗\033[32m██║░░██║"
	@echo "\033[31m╚█████╔╝\033[31m╚██████╔╝\033[31m██████╦╝  \033[32m██████╔╝\033[32m██████╔╝"
	@echo "\033[31m░╚════╝░\033[31m░╚═════╝░\033[31m╚═════╝░  \033[32m╚═════╝░\033[32m╚═════╝░"

# Default target
all: $(NAME)

# Clean object files
clean:
	rm -f $(OBJCTS)

# Clean everything (including executable)
fclean: clean
	rm -f $(NAME)

# Rebuild everything
re: fclean all
