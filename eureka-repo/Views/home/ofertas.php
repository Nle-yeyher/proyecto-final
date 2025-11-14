<div class="container mt-4">
  <h1 class="text-center">🔥 Productos en Oferta 🔥</h1>
  <div class="row">
    <?php if (!empty($data['productos'])) { ?>
      <?php foreach ($data['productos'] as $producto) { ?>
        <div class="col-lg-3 col-md-4 col-sm-6">
          <div class="box_main">
            <h4 class="shirt_text"><?php echo $producto['nombre']; ?></h4>
            <p class="price_text">
              <span style="text-decoration: line-through; color: #888;">$ <?php echo $producto['precio_original']; ?></span><br>
              <span style="color: red; font-weight:bold;">$ <?php echo $producto['precio_oferta']; ?></span>
            </p>
            <img src="<?php echo BASE_URL . $producto['imagen']; ?>" class="img-fluid">
            <div class="btn_main">
              <div class="buy_bt"><a href="#" class="btnAddcarrito" prod="<?php echo $producto['id']; ?>">Añadir</a></div>
              <div class="seemore_bt"><a href="<?php echo BASE_URL . 'home/detalle/' . $producto['id']; ?>">Leer más</a></div>
            </div>
          </div>
        </div>
      <?php } ?>
    <?php } else { ?>
      <div class="col-12 text-center">
        <h3>No hay productos en oferta actualmente 😔</h3>
      </div>
    <?php } ?>
  </div>
</div>
