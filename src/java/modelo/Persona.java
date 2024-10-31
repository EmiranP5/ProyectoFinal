/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author JDani
 */
abstract public class Persona {
    
    private String nombres, apellidos, nit, direccion, telefono;

    public Persona(){}
    public Persona(String nombres, String apellidos, String nit, String direccion, String telefono) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public Persona(String nombres, String apellidos, String nit, String telefono) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.nit = nit;
        this.telefono = telefono;
    }
    
    
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int agregar(){return 0;}
    public int modificar(){return 0;}
    public int eliminar(){return 0;}
    
    
}
