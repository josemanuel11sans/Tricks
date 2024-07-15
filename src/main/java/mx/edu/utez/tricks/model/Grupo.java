package mx.edu.utez.tricks.model;

public class Grupo {
    private int idGrupo, estadoIdEstado;
    private String  nombreGrupo;
    private String nombreDocente,apellidoDocente, carrera, divisionAcademica;

    public Grupo() {
    }

    public Grupo(int idGrupo, int estadoIdEstado, String apellidoDocente, String carrera, String nombreDocente, String nombreGrupo, String divisionAcademica) {
        this.idGrupo = idGrupo;
        this.estadoIdEstado = estadoIdEstado;
        this.apellidoDocente = apellidoDocente;
        this.carrera = carrera;
        this.nombreDocente = nombreDocente;
        this.nombreGrupo = nombreGrupo;
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

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getApellidoDocente() {
        return apellidoDocente;
    }

    public void setApellidoDocente(String apellidoDocente) {
        this.apellidoDocente = apellidoDocente;
    }
}
