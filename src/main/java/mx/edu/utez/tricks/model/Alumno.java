package mx.edu.utez.tricks.model;

public class Alumno {
    private String folio;
    private String nombre;
    private String carrera;
    private int estado;
    private double calificacion;
    private  int idgrupo;

    // Getters y setters


    public Alumno() {
        this.folio = folio;
        this.idgrupo = idgrupo;
        this.calificacion = calificacion;
        this.estado = estado;
        this.carrera = carrera;
        this.nombre = nombre;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(double calificacion) {
        this.calificacion = calificacion;
    }

    public int getIdgrupo() {
        return idgrupo;
    }

    public void setIdgrupo(int idgrupo) {
        this.idgrupo = idgrupo;
    }
}