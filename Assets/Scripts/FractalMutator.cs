using UnityEngine;
using UnityEngine.UI;

public class FractalMutator : MonoBehaviour
{
    public Material fractalMaterial;
    public FractalManager manager;

    public float mutationInterval = 2.0f;
    private float timer = 0f;
    private bool isMutating = false;

    public Slider speedSlider;
    public Button toggleMutationButton;

    void Start()
    {
        if (speedSlider != null)
        {
            speedSlider.onValueChanged.AddListener((v) => mutationInterval = Mathf.Max(0.1f, v));
            mutationInterval = speedSlider.value;
        }

        if (toggleMutationButton != null)
        {
            toggleMutationButton.onClick.AddListener(ToggleMutation);
        }
    }

    void Update()
    {
        if (!isMutating) return;

        timer += Time.deltaTime;
        if (timer >= mutationInterval)
        {
            MutateFractal();
            timer = 0f;
        }
    }

    void ToggleMutation()
    {
        isMutating = !isMutating;
        Debug.Log("Mutación " + (isMutating ? "activada" : "detenida"));
    }

    public void MutateFractal()
    {
        // Cambia aleatoriamente entre Mandelbrot y Julia
        if (Random.value > 0.5f)
        {
            manager.SetMandelbrot();
            MutateMandelbrot();
        }
        else
        {
            manager.SetJulia();
            MutateJulia();
        }
    }

    void MutateMandelbrot()
    {
        fractalMaterial.SetFloat("_ColorShift", Random.Range(0f, 3.14f));
        fractalMaterial.SetFloat("_ColorStrength", Random.Range(0.5f, 2.5f));
        fractalMaterial.SetFloat("_Iterations", Random.Range(50, 200));
        Debug.Log("Mutado Mandelbrot");
    }

    void MutateJulia()
    {
        Vector2 c = new Vector2(Random.Range(-1.5f, 1.5f), Random.Range(-1.5f, 1.5f));
        fractalMaterial.SetVector("_C", new Vector4(c.x, c.y, 0, 0));
        fractalMaterial.SetFloat("_GlowIntensity", Random.Range(0.5f, 2.5f));
        fractalMaterial.SetFloat("_Saturation", Random.Range(0.5f, 2.0f));
        fractalMaterial.SetFloat("_Iterations", Random.Range(50, 200));
        Debug.Log("Mutado Julia: " + c);
    }
}

