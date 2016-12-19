<?php
	include("conexion.php"); 
    
	$id=$_GET['id'];
	
	$query="SELECT numerotaxi, nombresocio, password, edad, tiposocio FROM socio WHERE id='$id'";
	
	$resultado=$mysqli->query($query);
	
	$row=$resultado->fetch_assoc();
?>


<form class="form-horizontal" method="POST" action="sociomodificarmod.php" >
	<input type="hidden" name="id" value="<?php echo $id; ?>">
    
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ver socio</h4>
    </div>
    
    <div class="modal-body">
        <div class="form-group">
            <label for="numerotaxi" class="col-sm-2 control-label">No. de Taxi</label>
            <div class="col-sm-10">
                <input type="text" name="numerotaxi" class="form-control" id="numerotaxi" value="<?php echo $row['numerotaxi']; ?>">
            </div>
        </div>
        
        
        <div class="form-group">
            <label for="nombresocio" class="col-sm-2 control-label">Nombre</label>
            <div class="col-sm-10">
                <input type="text" name="nombresocio" class="form-control" id="nombresocio" value="<?php echo $row['nombresocio']; ?>">
            </div>
        </div>
        
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="text" name="password" class="form-control" id="password" value="<?php echo $row['password']; ?>">
            </div>
        </div>

        <div class="form-group">
            <label for="edad" class="col-sm-2 control-label">Edad</label>
            <div class="col-sm-10">
                <input type="text" name="edad" class="form-control" id="edad" value="<?php echo $row['edad']; ?>">
            </div>
        </div>

        <div class="form-group">
            <label for="tiposocio" class="col-sm-2 control-label" required>Tipo socio</label>
            <div class="col-sm-10">
                <select name="tiposocio" class="form-control" id="tiposocio">
                    <option value="<?php echo $row['tiposocio']; ?>"><?php echo $row['tiposocio']; ?></option>
                    <option value="socio">Socio</option>
                    <option value="conductor">Conductor</option>
                </select>
            </div>
        </div>
        
    </div>
  
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Guardar cambios</button>
    </div>
</form>

