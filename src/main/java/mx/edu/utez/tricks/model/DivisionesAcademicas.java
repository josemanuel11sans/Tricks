package mx.edu.utez.tricks.model;

public class DivisionesAcademicas {
    private int idDivision;
    private String nombreDivision;
    private String siglas;
    private String coordinadorDivision;
    private int estado;

    // Constructor con todos los campos
    public DivisionesAcademicas(String nombreDivision, String siglas, String coordinadorDivision, int estado) {
        this.nombreDivision = nombreDivision;
        this.siglas = siglas;
        this.coordinadorDivision = coordinadorDivision;
        this.estado = estado;
    }

    public DivisionesAcademicas() {
        // Constructor vacío
    }

    // Getters y setters
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

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public String getCoordinadorDivision() {
        return coordinadorDivision;
    }

    public void setCoordinadorDivision(String coordinadorDivision) {
        this.coordinadorDivision = coordinadorDivision;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
