<?php

   require '../MvcClientesDatabase.php';
   mysql_select_db($db_name,$connection) or die("Error de conexion a la base de datos");

		$arr = array();
		// Llamamos a la Tabla y sus datos 
		$sql = "select * from Clientes";
		 if (isset($_POST['query'])){ //Esta parte de codigo nos sirve para hacer el filtro con el SelectSearchField
		      $fields=$_POST['fields'];//Recibimos el  campo a filtrar
			  switch ($fields)
			  {
                    case 'Cliente': 
                        $sql .= " WHERE Cliente LIKE '%".$_POST['query']."%'";
					break;
                    case 'Sexo':
					    $sql .= " WHERE Sexo LIKE '%".$_POST['query']."%'";
				    break;
                }					
					
        } 
    	$result = mysql_query($sql,$connection) or die('La consulta fall&oacute;: '.mysql_error());		
		//Formamos el Array de Datos, si ejecutamos este archivo PHP veremos el array formado
		while($obj = mysql_fetch_object($result)) {
						$arr[] = $obj;
					}
					echo '{ metaData: { "root": "data"}';	
					echo ',"success":true, "data":' . json_encode($arr) . '}';


// Cerramos la conexion a la bd
 mysql_close($connection);
?>
   

   