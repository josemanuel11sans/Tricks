package mx.edu.utez.tricks.model;

import java.util.Date;

public class Usuario {
    private int id_usuario;
    private String nombre;
    private String apellido;
    private String mail;
    private String contra;
    private int estado;
    private int rol;
    private int grupos_id_grupo;
    private Date fecha_creacion;
    private String codigo;

    public Usuario(int id_usuario, String nombre, String apellido, String mail, String contra, int estado, int rol, int grupos_id_grupo, Date fecha_creacion, String codigo) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
        this.estado = estado;
        this.rol = rol;
        this.grupos_id_grupo = grupos_id_grupo;
        this.fecha_creacion = fecha_creacion;
        this.codigo = codigo;
    }

    public Usuario() {
    }

    public Usuario(String nombre, String contra) {
        this.nombre = nombre;
        this.contra = contra;
    }

    public Usuario(int id_usuario, int estado) {
        this.id_usuario = id_usuario;
        this.estado = estado;
    }

    public Usuario(int id_usuario, String nombre, String apellido, String mail, String contra) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
    }

    // Getters y setters
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public int getGrupos_id_grupo() {
        return grupos_id_grupo;
    }

    public void setGrupos_id_grupo(int grupos_id_grupo) {
        this.grupos_id_grupo = grupos_id_grupo;
    }

    public Date getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Date fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
}
