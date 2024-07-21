package mx.edu.utez.tricks.model;

public class DivisionesAcademicas {
    private int idDivision;
    private String nombreDivision;
    private String coordinadorDivision;
    private String siglas;
    private int estado;
    private String fecha_creacion;

    // Constructores
    public DivisionesAcademicas() {}

    public DivisionesAcademicas(String nombreDivision, String coordinadorDivision) {
        this.nombreDivision = nombreDivision;
        this.coordinadorDivision = coordinadorDivision;
    }

    public DivisionesAcademicas(int idDivision, String nombreDivision, String coordinadorDivision) {
        this.idDivision = idDivision;
        this.nombreDivision = nombreDivision;
        this.coordinadorDivision = coordinadorDivision;
    }

    public DivisionesAcademicas(int idDivision, String nombreDivision, String coordinadorDivision, String siglas, int estado, String fecha_creacion) {
        this.idDivision = idDivision;
        this.nombreDivision = nombreDivision;
        this.coordinadorDivision = coordinadorDivision;
        this.siglas = siglas;
        this.estado = estado;
        this.fecha_creacion = fecha_creacion;
    }

    // Getters y Setters
    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public String getNombreDivision() {
        return nombreDivision;
    }

    public void setNombreDivision(String nombreDivision) {
        this.nombreDivision = nombreDivision;
    }

    public String getCoordinadorDivision() {
        return coordinadorDivision;
    }

    public void setCoordinadorDivision(String coordinadorDivision) {
        this.coordinadorDivision = coordinadorDivision;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }
}
