# FractalExplorer
Fractal Explorer es una aplicación interactiva desarrollada en Unity que permite visualizar, mutar y capturar fractales dinámicos como Mandelbrot y Julia en tiempo real.
El enfoque está en lograr transiciones visuales fluidas y coherentes entre distintos tipos de fórmulas fractales, combinando arte generativo con precisión matemática.

Características
-Sistema híbrido de mutación fractal (Mandelbrot ↔ Julia) con interpolación estable
-Control de cámara con ratón: zoom, desplazamiento y navegación fluida
-Interfaz interactiva para cambiar parámetros, activar modo mutación o captura
-Captura automatizada de imágenes y metadata en PNG + JSON
-Shader visual con animación de color y estructura fractal personalizada
-Preparado para exportar datasets visuales de alto valor estético

Tecnologías utilizadas
-Unity + URP
-Shaders HLSL personalizados
-Scripts C# para control visual, mutación, y captura por lotes
-Exportación estructurada de imágenes + datos en paralelo

Cómo empezar
-Clona el repositorio
-Abre la escena principal en Unity (FractalScene.unity)
-Dale al Play y empieza a explorar con el ratón
-Usa la UI para mutar o exportar frames

Estado del proyecto
Este proyecto está en fase activa de desarrollo.
El enfoque actual está en:
-Añadir interpolación visual avanzada basada en sistemas híbridos (tipo IFS)
-Mejorar el sistema de mutación con lógica adaptativa
-Expandir a builds exportables para Windows y Android

