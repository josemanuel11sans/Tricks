package mx.edu.utez.tricks.model;

public class Grupo {
    private int idGrupo, estadoIdEstado;
    private String  nombreGrupo;
    private String docente, carrera, divisionAcademica;

    public Grupo() {
    }

    public Grupo(int idGrupo, int estadoIdEstado, String nombreGrupo, String docente, String carrera, String divisionAcademica) {
        this.idGrupo = idGrupo;
        this.estadoIdEstado = estadoIdEstado;
        this.nombreGrupo = nombreGrupo;
        this.docente = docente;
        this.carrera = carrera;
        this.divisionAcademica = divisionAcademica;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public int getEstadoIdEstado() {
        return estadoIdEstado;
    }

    public void setEstadoIdEstado(int estadoIdEstado) {
        this.estadoIdEstado = estadoIdEstado;
    }

    public String getNombreGrupo() {
        return nombreGrupo;
    }

    public void setNombreGrupo(String nombreGrupo) {
        this.nombreGrupo = nombreGrupo;
    }

    public String getDocente() {
        return docente;
    }

    public void setDocente(String docente) {
        this.docente = docente;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getDivisionAcademica() {
        return divisionAcademica;
    }

    public void setDivisionAcademica(String divisionAcademica) {
        this.divisionAcademica = divisionAcademica;
    }
}
