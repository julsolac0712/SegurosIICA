Imports System.Data.SqlClient
Imports System.Data

Public Class Seguros_Utility : Inherits Utility.Common
#Region "Generales"

    Public Sub New(ByVal connectionString As String)
        MyBase.New(connectionString)
    End Sub

#End Region

    Public Function ActualizaRol(ByVal Indice As Integer, ByVal Operacion As Integer, ByVal Rol As Integer, ByVal Valor As Integer) As Integer
        Dim cmd As New SqlCommand("SEGIICA_SEG_Man_Roles_Opciones", Conexion)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("Operacion", Operacion)
        cmd.Parameters.AddWithValue("Indice", Indice)
        cmd.Parameters.AddWithValue("Rol", Rol)
        cmd.Parameters.AddWithValue("Valor", Valor)
        Return Ejecutar_Consulta_NQ(cmd)
    End Function

    Public Function Get_OpcionesRoles(ByVal Rol As Integer, ByVal Operacion As Integer) As Data.DataSet
        Dim cmd As New SqlCommand("SEGIICA_SEG_Get_Lista_Opciones", Conexion)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("Rol", Rol)
        cmd.Parameters.AddWithValue("Operacion", Operacion)
        Return Ejecutar_Consulta_DS(cmd)
    End Function

End Class
