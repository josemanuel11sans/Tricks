package mx.edu.utez.tricks.model;


public class Carrera {
    private int idCarrera;
    private String nombreCarrera;
    private int idDivisionAcademica;
    private int idEstado;
    private String nombreDivision; // Nuevo campo


    // Constructor sin el campo nuevo
    public Carrera(int idCarrera, String nombreCarrera, int idDivisionAcademica, int idEstado) {
        this.idCarrera = idCarrera;
        this.nombreCarrera = nombreCarrera;
        this.idDivisionAcademica = idDivisionAcademica;
        this.idEstado = idEstado;
    }


    // Constructor con todos los campos
    public Carrera(int idCarrera, String nombreCarrera, int idDivisionAcademica, int idEstado, String nombreDivision) {
        this.idCarrera = idCarrera;
        this.nombreCarrera = nombreCarrera;
        this.idDivisionAcademica = idDivisionAcademica;
        this.idEstado = idEstado;
        this.nombreDivision = nombreDivision;
    }


    // Constructor vacío
    public Carrera() {
    }


    // Getters y setters


    public int getIdCarrera() {
        return idCarrera;
    }


    public void setIdCarrera(int idCarrera) {
        this.idCarrera = idCarrera;
    }


    public String getNombreCarrera() {
        return nombreCarrera;
    }


    public void setNombreCarrera(String nombreCarrera) {
        this.nombreCarrera = nombreCarrera;
    }


    public int getIdDivisionAcademica() {
        return idDivisionAcademica;
    }


    public void setIdDivisionAcademica(int idDivisionAcademica) {
        this.idDivisionAcademica = idDivisionAcademica;
    }


    public int getIdEstado() {
        return idEstado;
    }


    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }


    public String getNombreDivision() {
        return nombreDivision;
    }


    public void setNombreDivision(String nombreDivision) {
        this.nombreDivision = nombreDivision;
    }
}

