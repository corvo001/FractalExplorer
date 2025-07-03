using UnityEngine;

public class FractalController : MonoBehaviour
{
    public Material fractalMaterial;
    public float panSpeed = 0.005f;
    public float zoomSpeed = 0.5f;
    private Vector2 offset = Vector2.zero;
    private float zoom = 1.0f;

    void Update()
    {
        // Zoom con rueda del ratón
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        if (scroll != 0f)
        {
            zoom *= 1f - scroll * zoomSpeed;
            zoom = Mathf.Clamp(zoom, 0.01f, 10f);
            fractalMaterial.SetFloat("_Zoom", zoom);
        }

        // Pan (arrastrar con clic izquierdo)
        if (Input.GetMouseButton(0))
        {
            Vector2 delta = new Vector2(-Input.GetAxis("Mouse X"), -Input.GetAxis("Mouse Y")) * panSpeed * zoom;
            offset += delta;
            fractalMaterial.SetVector("_Offset", new Vector4(offset.x, offset.y, 0, 0));
        }
    }
}
