// Vertex Shader - acts at a per-vertex level
#version 120

uniform mat4 projectionMatrix, viewMatrix, modelMatrix;
uniform mat3 normalMatrix;
uniform vec3 materialAmbient, materialDiffuse;
uniform vec3 lightAmbient, lightDiffuse, lightPosition, lightGlobal;

attribute vec3 vertex_position, vertex_normal;
varying vec3 ambientGlobal, ambient, diffuse, position, normal;

void main(void) {
    vec4 vertex = vec4(vertex_position, 1.0);
    vec3 L = normalize(lightPosition);

    normal = normalize(normalMatrix * vertex_normal);
    position = vec3(viewMatrix * modelMatrix * vertex);

    ambient = materialAmbient * lightAmbient;
    diffuse = materialDiffuse * lightDiffuse;
    ambientGlobal = materialAmbient * lightGlobal;

    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vertex;
}
