// Fragment Shader - acts at a per-pixel level
#version 120

uniform vec3 lightPosition;

varying vec3 position, vertex_color, normal;

void main(void) {
    vec3 N = normalize(normal);
    vec3 L = normalize(lightPosition - position);

    float intensity = max(dot(N, L), 0.0);

    vec3 discrete_color;
    if (intensity > 0.98) {
        discrete_color = vec3(1.0, 1.0, 1.0);
    } else if (intensity > 0.95) {
        discrete_color = vertex_color;
    } else if (intensity > 0.5) {
        discrete_color = vertex_color * 0.7;
    } else if (intensity > 0.05) {
        discrete_color = vertex_color * 0.35;
    } else {
        discrete_color = vertex_color * 0.2;
    }

    gl_FragColor = vec4(discrete_color, 1.0);
}
