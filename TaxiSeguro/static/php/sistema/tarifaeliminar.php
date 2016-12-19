<?php
	include("conexion.php"); 
    
	$id=$_GET['id'];
	
	$query="SELECT origen, destino, costo FROM tabulador WHERE id='$id'";
	
	$resultado=$mysqli->query($query);
	
	$row=$resultado->fetch_assoc();
?>

<form class="form-horizontal" method="POST" action="tarifaeliminarmod.php" >
	<input type="hidden" name="id" value="<?php echo $id; ?>">
    
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ver Evento</h4>
    </div>
    
    <div class="modal-body">
        <div class="form-group">
            <label for="origen" class="col-sm-2 control-label">Lugar de Origen</label>
            <div class="col-sm-10">
                <input type="text" name="origen" class="form-control" id="origen" value="<?php echo $row['origen']; ?>">
                <!--  readonly="readonly" -->
            </div>
        </div>

        <div class="form-group">
            <label for="destino" class="col-sm-2 control-label">Lugar de Destino</label>
            <div class="col-sm-10">
                <input type="text" name="destino" class="form-control" id="destino" value="<?php echo $row['destino']; ?>">
                <!--  readonly="readonly" -->
            </div>
        </div>

        <div class="form-group">
            <label for="costo" class="col-sm-2 control-label">Costo</label>
            <div class="col-sm-10">
                <input type="text" name="costo" class="form-control" id="costo" value="<?php echo $row['costo']; ?>">
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

