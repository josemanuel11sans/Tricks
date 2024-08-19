package mx.edu.utez.tricks.model;

public class Grupo {
    private int idGrupo;
    private int estadoIdEstado;
    private String nombreGrupo;
    private String nombreDocente;
    private String apellidoDocente;
    private String carrera;
    private String divisionAcademica;
    private int idCarrera;
    private int idDocente;

    public Grupo() {
    }

    public Grupo(int idGrupo, int estadoIdEstado, String nombreGrupo, String nombreDocente, String apellidoDocente, String carrera, String divisionAcademica, int idCarrera, int idDocente) {
        this.idGrupo = idGrupo;
        this.estadoIdEstado = estadoIdEstado;
        this.nombreGrupo = nombreGrupo;
        this.nombreDocente = nombreDocente;
        this.apellidoDocente = apellidoDocente;
        this.carrera = carrera;
        this.divisionAcademica = divisionAcademica;
        this.idCarrera = idCarrera;
        this.idDocente = idDocente;
    }

    public Grupo(int idGrupo, String nombreGrupo) {
        this.idGrupo = idGrupo;
        this.nombreGrupo = nombreGrupo;
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
    public int getIdCarrera(){return idCarrera;}
    public void setIdCarrera(int idCarrera){this.idCarrera = idCarrera;}
    public int getIdDocente(){return idDocente;}
    public void setIdDocente(int idDocente){this.idDocente = idDocente;}
}

