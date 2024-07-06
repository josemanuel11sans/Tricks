package mx.edu.utez.tricks.model;

public class Calificaciones {
    private int idCalificacion;
    private float calificacion;
    public Calificaciones() {
    }
    public Calificaciones(int idCalificacion, float calificacion) {
        this.idCalificacion = idCalificacion;
        this.calificacion = calificacion;
    }
    public int getIdCalificacion() {
        return idCalificacion;
    }
    public void setIdCalificacion(int idCalificacion) {
        this.idCalificacion = idCalificacion;
    }
    public float getCalificacion() {
        return calificacion;
    }
    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }
}
