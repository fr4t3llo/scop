/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   matrix.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/12 06:19:55 by skasmi            #+#    #+#             */
/*   Updated: 2025/03/12 06:19:57 by skasmi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <math.h>

typedef struct {
    float m[4][4];
} Matrix;

Matrix identity_matrix() {
    Matrix m = { .m = {{1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {0, 0, 0, 1}} };
    return m;
}

Matrix translate_matrix(float tx, float ty, float tz) {
    Matrix m = identity_matrix();
    m.m[3][0] = tx;
    m.m[3][1] = ty;
    m.m[3][2] = tz;
    return m;
}

Matrix rotate_matrix(float angle, char axis) {
    Matrix m = identity_matrix();
    float rad = angle * (M_PI / 180.0);
    if (axis == 'x') {
        m.m[1][1] = cos(rad);
        m.m[1][2] = -sin(rad);
        m.m[2][1] = sin(rad);
        m.m[2][2] = cos(rad);
    }
    else if (axis == 'y') {
        m.m[0][0] = cos(rad);
        m.m[0][2] = sin(rad);
        m.m[2][0] = -sin(rad);
        m.m[2][2] = cos(rad);
    }
    else if (axis == 'z') {
        m.m[0][0] = cos(rad);
        m.m[0][1] = -sin(rad);
        m.m[1][0] = sin(rad);
        m.m[1][1] = cos(rad);
    }
    return m;
}

Matrix scale_matrix(float sx, float sy, float sz) {
    Matrix m = identity_matrix();
    m.m[0][0] = sx;
    m.m[1][1] = sy;
    m.m[2][2] = sz;
    return m;
}
