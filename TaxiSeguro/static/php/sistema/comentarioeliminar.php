<?php
	include("conexion.php"); 
    
	$id=$_GET['id'];
	
	$query="SELECT numerotaxi, calificacion, comentario FROM comentario WHERE id='$id'";
	
	$resultado=$mysqli->query($query);
	
	$row=$resultado->fetch_assoc();
?>

<form class="form-horizontal" method="POST" action="comentarioeliminarmod.php" >
	<input type="hidden" name="id" value="<?php echo $id; ?>">
    
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ver Evento</h4>
    </div>
    
    <div class="modal-body">
        <div class="form-group">
            <label for="numerotaxi" class="col-sm-2 control-label">No. de Taxi</label>
            <div class="col-sm-10">
                <input type="text" name="numerotaxi" class="form-control" id="numerotaxi" value="<?php echo $row['numerotaxi']; ?>">
                <!--  readonly="readonly" -->
            </div>
        </div>

        <div class="form-group">
            <label for="calificacion" class="col-sm-2 control-label">Calificacion</label>
            <div class="col-sm-10">
                <input type="text" name="calificacion" class="form-control" id="calificacion" value="<?php echo $row['calificacion']; ?>">
                <!--  readonly="readonly" -->
            </div>
        </div>

        <div class="form-group">
            <label for="comentario" class="col-sm-2 control-label">Comentario</label>
            <div class="col-sm-10">
                <input type="text" name="comentario" class="form-control" id="comentario" value="<?php echo $row['comentario']; ?>">
                <!--  readonly="readonly" -->
            </div>
        </div>

        <div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10">
			  	<div class="checkbox">
					<label class="text-danger"><input type="checkbox"  name="delete"> Eliminar evento</label>
			  	</div>
			</div>
		</div onclick="history.back(-1)">
    </div>
  
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Guardar cambios</button>
    </div>
</form>

