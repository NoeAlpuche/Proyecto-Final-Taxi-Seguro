<section class="principalinfo">
    <aside id="login">
        <label class="inicio">Iniciar Sesion</label>
        <!-- <form action= "usuario.php" method="GET">-->
        <form method="post" action="static/php/login/validar.php">
            <label class="usuarioingresar">Numero taxi: </label>
            <input type="text" name="numerotaxi" class="form-control" autocomplete="off" required/><br>
            
            <label class="usuarioingresar">Contraseña: </label>
            <input type="password" name="password" class="form-control" autocomplete="off" required/><br><br>
            
            <input type="submit" class="btn btn-success" name="login" value="Entrar" id="vibrar"/>
        </form>
    </aside>
</section>