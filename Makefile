# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/17 15:06:05 by rgilles           #+#    #+#              #
#    Updated: 2021/09/26 14:40:56 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = clang
CFLAGS = -Wall -Wextra -Werror -pthread -g3
INCL = includes

%.o : 		%.c ${INCL}/philosophers.h Makefile
			${CC} -c ${CFLAGS} -I${INCL} $< -o $@

all :		philo

philo :     srcs/main.o srcs/philo_runtime.o \
			srcs/populate_data.o srcs/utils.o srcs/end.o srcs/watcher_runtime.o \
			srcs/sanitize_input.o
			${CC} ${CFLAGS} -I${INCL} -o $@ $^

clean :
			rm -rf **/**.o

fclean :	clean
			rm -rf philo

re :		fclean all