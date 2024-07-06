package mx.edu.utez.tricks.model;

public class DivicionesAcademicas {
    private int idDivision;
    private  String nombreDivision;
    private String coordinadorDivision;
    public DivicionesAcademicas() {
    }
    public DivicionesAcademicas(int idDivision, String nombreDivision, String coordinadorDivision) {
        this.idDivision = idDivision;
        this.nombreDivision = nombreDivision;
        this.coordinadorDivision = coordinadorDivision;
    }
    public String getCoordinadorDivision() {
        return coordinadorDivision;
    }
    public void setCoordinadorDivision(String coordinadorDivision) {
        this.coordinadorDivision = coordinadorDivision;
    }
    public String getNombreDivision() {
        return nombreDivision;
    }
    public void setNombreDivision(String nombreDivision) {
        this.nombreDivision = nombreDivision;
    }
    public int getIdDivision() {
        return idDivision;
    }
    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }
}
