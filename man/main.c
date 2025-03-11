// /* ************************************************************************** */
// /*                                                                            */
// /*                                                        :::      ::::::::   */
// /*   main.c                                             :+:      :+:    :+:   */
// /*                                                    +:+ +:+         +:+     */
// /*   By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+        */
// /*                                                +#+#+#+#+#+   +#+           */
// /*   Created: 2025/03/10 02:13:12 by skasmi            #+#    #+#             */
// /*   Updated: 2025/03/10 14:15:18 by skasmi           ###   ########.fr       */
// /*                                                                            */
// /* ************************************************************************** */

#include "../includes/scop.h"

int main()
{

    void *mlx;

    mlx = mlx_init(1920, 1080, "salam", true);

    mlx_loop(mlx);
    // int obj;
    // if (ac != 2)
    // {
    //     exit(EXIT_FAILURE);
    // }
    // else
    // {
    //     obj = open(av[1], O_RDONLY, 0777);
    //     if (obj == -1)
    //     {
    //         printf("Error Opening file");
    //         perror("Program");
    //     }
    // }
}

