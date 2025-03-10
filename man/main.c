/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/10 02:13:12 by skasmi            #+#    #+#             */
/*   Updated: 2025/03/10 04:55:39 by skasmi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/scop.h"

int main(int ac, char **av)
{
    void *mlx_ptr = NULL;
    mlx_new_window(mlx_ptr, 1080, 1920, "scop");

    int obj;
    if (ac != 2)
    {
        exit(EXIT_FAILURE);
    }
    else
    {
        obj = open(av[1], O_RDONLY, 0777);
        if (obj == -1)
        {
            printf("Error Opening file");
            perror("Program");
        }
    }
}