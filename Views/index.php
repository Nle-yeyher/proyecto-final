<?php include_once 'Views/template/header-principal.php'; ?>

              <!-- BOTÓN MIS RESERVAS -->
              <div class="buynow_bt" style="margin-bottom: 10px;">
                <a href="<?= BASE_URL ?>reservas">Mis Reservas</a>
              </div>

<!-- banner section start -->
<div class="banner_section layout_padding">
  <div class="container">
    <div id="my_slider" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="row">
            <div class="col-sm-12">
              <h1 class="banner_taital">Empieza <br>a comprar tus dispositivos</h1>
              <div class="buynow_bt"><a href="#">compralo ya</a></div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col-sm-12">
              <h1 class="banner_taital">Empieza, <br>no te quedes sin el tuyo</h1>
              <div class="buynow_bt"><a href="#">compralo ya</a></div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col-sm-12">
              <h1 class="banner_taital">Empieza, <br>animate a comprarlos</h1>
              <div class="buynow_bt"><a href="#">compralo ya</a></div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
        <i class="fa fa-angle-left"></i>
      </a>
      <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
        <i class="fa fa-angle-right"></i>
      </a>
      
    </div>
  </div>
</div>
<!-- banner section end -->

</div>
<!-- banner bg main end -->

<!-- fashion section start -->
<?php foreach ($data['categorias'] as $categoria) { ?>
  <div class="fashion_section">
    <div class="container" id="categoria_<?php echo $categoria['id']; ?>">
      <h1 class="fashion_taital text-uppercase"><?php echo $categoria['categoria']; ?></h1>
      <div class="row <?php echo (count($categoria['productos']) > 0) ? 'multiple-items' : ''; ?>">
        <?php foreach ($categoria['productos'] as $producto) { ?>
          <div class="<?php echo (count($categoria['productos']) > 2) ? 'col-lg-4' : 'col-lg-12'; ?>">
            <div class="box_main">
              <h4 class="shirt_text"><?php echo $producto['nombre']; ?></h4>
              <?php if (!empty($producto['precio_oferta']) && !empty($producto['fecha_inicio']) && !empty($producto['fecha_fin']) && (date('Y-m-d') >= $producto['fecha_inicio'] && date('Y-m-d') <= $producto['fecha_fin'])) { ?>
                  <p class="price_text">
                    <span style="text-decoration: line-through; color: #888;">$ <?php echo $producto['precio']; ?></span><br>
                    <span style="color: red; font-weight:bold;">$ <?php echo $producto['precio_oferta']; ?> 🔥</span>
                  </p>
                  <?php
                      $descuento = round((($producto['precio'] - $producto['precio_oferta']) / $producto['precio']) * 100);
                  ?>
                  <span class="badge badge-danger" style="font-size:14px;">-<?php echo $descuento; ?>%</span>
              <?php } else { ?>
                  <p class="price_text">Precio <span style="color: #262626;">$ <?php echo $producto['precio']; ?></span></p>
              <?php } ?>
              <a href="<?php echo BASE_URL . 'reservas/agregar/' . $producto['id']; ?>" class="btn btn-warning">Reservar</a>
              <div class="text-center">
                <img data-lazy="<?php echo BASE_URL . $producto['imagen']; ?>" />
              </div>
              <div class="btn_main">
                <div class="buy_bt"><a href="#" class="btnAddcarrito" prod="<?php echo $producto['id']; ?>">Añadir</a></div>
                <div class="seemore_bt"><a href="#">Leer más</a></div>
              </div>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </div>
<?php } ?>

<?php include_once 'Views/template/footer-principal.php'; ?>

<script>
  $('.multiple-items').slick({
    lazyLoad: 'ondemand',
    dots: true,
    infinite: false,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: true,
    responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
</script>

</body>

</html>