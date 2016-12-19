<?php
	include("conexion.php"); 
    
	$id=$_GET['id'];
	
	$query="SELECT origen, destino, costo FROM tabulador WHERE id='$id'";
	
	$resultado=$mysqli->query($query);
	
	$row=$resultado->fetch_assoc();
?>


<form class="form-horizontal" method="POST" action="tarifamodificarmod.php" >
	<input type="hidden" name="id" value="<?php echo $id; ?>">
    
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ver socio</h4>
    </div>
    
    <div class="modal-body">
            
        <div class="form-group">
            <label for="origen" class="col-sm-2 control-label">Lugar de Origen</label>
            <div class="col-sm-10">
                <select name="origen" class="form-control" id="origen" required>
                    <option value="<?php echo $row['origen']; ?>"><?php echo $row['origen']; ?></option>
                    <option value="Centro">Centro</option>
                    <option value="Dina">Dina</option>
                    <option value="Fovissste 5 Etapa">Fovissste 5 Etapa</option>
                    <option value="Clinica de la mujer">Clinica de la mujer</option>
                    <option value="Expofer">Expofer</option>
                    <option value="Residencial Marsella">Residencial Marsella</option>
                    <option value="Forjadores">Forjadores</option>
                    <option value="Jardines">Jardines</option>
                    <option value="8 Octubre">8 Octubre</option>
                    <option value="Las casitas">Las casitas</option>
                    <option value="Lopez Mateos">Lopez Mateos</option>
                    <option value="Proterritorio">Proterritorio</option>
                    <option value="Solidaridad">Solidaridad</option>
                    <option value="Magisterial">Magisterial</option>
                    <option value="Payo Obispo">Payo Obispo</option>
                    <option value="Lagunitas los monos">Lagunitas los monos</option>
                    <option value="Nuevo Progreso">Nuevo Progreso</option>
                    <option value="Lazaro Cardenas">Lazaro Cardenas</option>
                    <option value="Arboledas">Arboledas</option>
                    <option value="Santa Maria">Santa Maria</option>
                    <option value="Caribe">Caribe</option>
                    <option value="Las Americas 1 y 2">Las Americas 1 y 2</option>
                    <option value="Las Americas 3 y 4">Las Americas 3 y 4</option>
                    <option value="Pacto Obrero">Pacto Obrero</option>
                    <option value="Calderitas">Calderitas</option>
                </select>
            </div>
        </div>
            
        <div class="form-group">
            <label for="destino" class="col-sm-2 control-label">Lugar de Destino</label>
            <div class="col-sm-10">
                <select name="destino" class="form-control" id="destino" required>
                    <option value="<?php echo $row['destino']; ?>"><?php echo $row['destino']; ?></option>
                    <option value="Centro">Centro</option>
                    <option value="Dina">Dina</option>
                    <option value="Fovissste 5 Etapa">Fovissste 5 Etapa</option>
                    <option value="Clinica de la mujer">Clinica de la mujer</option>
                    <option value="Expofer">Expofer</option>
                    <option value="Residencial Marsella">Residencial Marsella</option>
                    <option value="Forjadores">Forjadores</option>
                    <option value="Jardines">Jardines</option>
                    <option value="8 Octubre">8 Octubre</option>
                    <option value="Las casitas">Las casitas</option>
                    <option value="Lopez Mateos">Lopez Mateos</option>
                    <option value="Proterritorio">Proterritorio</option>
                    <option value="Solidaridad">Solidaridad</option>
                    <option value="Magisterial">Magisterial</option>
                    <option value="Payo Obispo">Payo Obispo</option>
                    <option value="Lagunitas los monos">Lagunitas los monos</option>
                    <option value="Nuevo Progreso">Nuevo Progreso</option>
                    <option value="Lazaro Cardenas">Lazaro Cardenas</option>
                    <option value="Arboledas">Arboledas</option>
                    <option value="Santa Maria">Santa Maria</option>
                    <option value="Caribe">Caribe</option>
                    <option value="Las Americas 1 y 2">Las Americas 1 y 2</option>
                    <option value="Las Americas 3 y 4">Las Americas 3 y 4</option>
                    <option value="Pacto Obrero">Pacto Obrero</option>
                    <option value="Calderitas">Calderitas</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="costo" class="col-sm-2 control-label">Costo</label>
            <div class="col-sm-10">
                <input type="text" name="costo" class="form-control" id="costo" value="<?php echo $row['costo']; ?>">
            </div>
        </div>
        
    </div>
  
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Guardar cambios</button>
    </div>
</form>

