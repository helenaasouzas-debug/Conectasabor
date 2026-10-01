/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private static final String URL = "jdbc:mysql://localhost:3307/flashbite";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    public static Connection conectar() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USUARIO, SENHA);

            System.out.println("Conectado com sucesso!");

        } catch (Exception e) {
            e.printStackTrace();

        }

        return con;

    }

}