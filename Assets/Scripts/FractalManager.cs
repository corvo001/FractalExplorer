using UnityEngine;

public class FractalManager : MonoBehaviour
{
    public Material fractalMaterial;
    public Shader mandelbrotShader;
    public Shader juliaShader;

    private string currentFractal = "Mandelbrot";

    public void SetMandelbrot()
    {
        fractalMaterial.shader = mandelbrotShader;
        currentFractal =  "Mandelbrot";
        Debug.Log("Fractal actual: Mandelbrot");
    }

    public void SetJulia()
    {
        fractalMaterial.shader = juliaShader;
        currentFractal = "Julia";
        Debug.Log("Fractal actual: Julia");
    }

    public string GetCurrentFractal()
    {
        return currentFractal;
    }
}

