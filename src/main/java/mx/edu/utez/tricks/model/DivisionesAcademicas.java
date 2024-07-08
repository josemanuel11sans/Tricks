package mx.edu.utez.tricks.model;

public class DivisionesAcademicas {
    private int idDivision;
    private String nombreDivision;
    private String coordinadorDivision;

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
}
