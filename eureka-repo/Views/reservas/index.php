<?php include_once 'Views/template/header-principal.php'; ?>
<?php $reservas = $data['reservas']; ?>

<style>
  .table {
    background-color: #87878744 !important;
  }

  .table thead th,
  .table tbody td {
    color: white !important;
  }

  .table-dark th {
    background-color: #87878744 !important;
    color: white !important;
  }
</style>

<div class="container mt-4">
  <h1 class="text-center mb-4">Mis Reservas</h1>

  <div class="table-responsive">
    <table class="table table-striped table-hover text-center">
      <thead class="table-dark">
        <tr>
          <th>Producto</th>
          <th>Cantidad</th>
          <th>Estado</th>
          <th>Acción</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($reservas as $reserva): ?>
          <tr>
            <td><?= $reserva['producto']; ?></td>
            <td><?= $reserva['cantidad']; ?></td>
            <td>
              <?php if($reserva['estado'] == 'pendiente'): ?>
                <span class="badge bg-warning text-dark">Pendiente</span>
              <?php elseif($reserva['estado'] == 'pagada'): ?>
                <span class="badge bg-success">Pagada</span>
              <?php else: ?>
                <span class="badge bg-danger">Cancelada</span>
              <?php endif; ?>
            </td>
            <td>
              <?php if($reserva['estado'] == 'pendiente'): ?>
                <a href="<?= BASE_URL . 'reservas/pagar/' . $reserva['id']; ?>" class="btn btn-success btn-sm">💳 Pagar</a>
              <?php endif; ?>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<?php include_once 'Views/template/footer-principal.php'; ?>
