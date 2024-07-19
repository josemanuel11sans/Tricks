package mx.edu.utez.tricks.model;
import java.util.Date;

public class Aspirante {
    private String folioAspirante;
    private String nombre;
    private String apellidos;
    private String curp;
    private Date fechaNacimiento;
    private int grupo;
    private String grupo2;
    private int estado;

    public Aspirante() {
    }

    public Aspirante(String folioAspirante, String nombre, String apellidos, String curp, Date fechaNacimiento, int grupo, int estado) {
        this.folioAspirante = folioAspirante;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curp = curp;
        this.fechaNacimiento = fechaNacimiento;
        this.grupo = grupo;
        this.estado = estado;
    }

    public Aspirante(String folioAspirante, String nombre, String apellidos, String curp, Date fechaNacimiento) {
        this.folioAspirante = folioAspirante;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curp = curp;
        this.fechaNacimiento = fechaNacimiento;
    }

    public Aspirante(String folioAspirante, int estado) {
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

    public int getGrupo() {
        return grupo;
    }

    public void setGrupo(int grupo) {
        this.grupo = grupo;
    }
    public String getGrupo2() {
        return grupo2;
    }

    public void setGrupo2(String grupo2) {
        this.grupo2 = grupo2;
    }

    public int getEstado() {return estado;}

    public void setEstado(int estado) {this.estado = estado;}
}