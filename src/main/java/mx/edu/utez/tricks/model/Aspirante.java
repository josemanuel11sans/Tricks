package mx.edu.utez.tricks.model;

import java.util.Date;

public class Aspirante {
    private String folioAspirante;
    private String nombre;
    private String apellidos;
    private String curp;
    private Date fechaNacimiento;
    private String grupo;
    private String estado;

    public Aspirante() {
    }

    public Aspirante(String folioAspirante, String nombre, String apellidos, String curp, Date fechaNacimiento, String grupo, String estado) {
        this.folioAspirante = folioAspirante;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curp = curp;
        this.fechaNacimiento = fechaNacimiento;
        this.grupo = grupo;
        this.estado = estado;
    }

    public Aspirante(String folioAspirante, String nombre, String apellidos, String curp, Date fechaNacimiento, String grupo) {
        this.folioAspirante = folioAspirante;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curp = curp;
        this.fechaNacimiento = fechaNacimiento;
        this.grupo = grupo;
    }

    public Aspirante(String folioAspirante, String estado) {
        this.folioAspirante = folioAspirante;
        this.estado = estado;
    }



    public String getFolioAspirante() {
        return folioAspirante;
    }

    public void setFolioAspirante(String folioAspirante) {
        this.folioAspirante = folioAspirante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getEstado() {return estado;}

    public void setEstado(String estado) {this.estado = estado;}
}