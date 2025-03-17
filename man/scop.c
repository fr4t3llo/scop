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


#define WIDTH 1920
#define HEIGHT 1080



typedef struct {
    float x, y, z;
} Vertex;

typedef struct {
    unsigned int v1, v2, v3;
} Face;

Vertex vertices[10000];
Face faces[10000];
int vertex_count = 0, face_count = 0;


void load_obj(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        printf("Error opening OBJ file\n");
        exit(1);
    }

    char line[128];
    while (fgets(line, sizeof(line), file)) {
        if (line[0] == 'v' && line[1] == ' ') {
            sscanf(line, "v %f %f %f", &vertices[vertex_count].x, &vertices[vertex_count].y, &vertices[vertex_count].z);
            vertex_count++;
        } else if (line[0] == 'f') {
            sscanf(line, "f %u %u %u", &faces[face_count].v1, &faces[face_count].v2, &faces[face_count].v3);
            faces[face_count].v1--; // OBJ indices start from 1, but OpenGL expects 0-based indices.
            faces[face_count].v2--;
            faces[face_count].v3--;
            face_count++;
        }
    }
    fclose(file);
}



int main(int ac, char **av)
{
    mlx_t *mlx;
    (void)ac, (void)av;
    mlx = mlx_init(WIDTH, HEIGHT, "scop", true);
    if (!mlx) {
        printf("MLX initialization failed\n");
        return EXIT_FAILURE;
    }
    // glewExperimental = GL_TRUE;
    // if (glewInit() != GLEW_OK) {
    //     printf("Failed to initialize GLEW\n");
    //     return EXIT_FAILURE;
    // }

    // Load the OBJ model
    load_obj("assets/42.obj");
    mlx_loop(mlx);
    mlx_terminate(mlx);
}
