<?php include_once 'Views/template/header-admin.php'; ?>

<div class="row">
    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
        <div class="card">
            <div class="card-header p-3 pt-2">
                <div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                    <i class="material-icons opacity-10">weekend</i>
                </div>
                <div class="text-end pt-1">
                    <p class="text-sm mb-0 text-capitalize">Pendientes</p>
                    <h4 class="mb-0"><?php echo $data['pendientes']['total']; ?></h4>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
        <div class="card">
            <div class="card-header p-3 pt-2">
                <div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                    <i class="material-icons opacity-10">person</i>
                </div>
                <div class="text-end pt-1">
                    <p class="text-sm mb-0 text-capitalize">Proceso</p>
                    <h4 class="mb-0"><?php echo $data['procesos']['total']; ?></h4>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
        <div class="card">
            <div class="card-header p-3 pt-2">
                <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                    <i class="material-icons opacity-10">person</i>
                </div>
                <div class="text-end pt-1">
                    <p class="text-sm mb-0 text-capitalize">Finalizados</p>
                    <h4 class="mb-0"><?php echo $data['finalizados']['total']; ?></h4>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6">
        <div class="card">
            <div class="card-header p-3 pt-2">
                <div class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
                    <i class="material-icons opacity-10">weekend</i>
                </div>
                <div class="text-end pt-1">
                    <p class="text-sm mb-0 text-capitalize">Productos</p>
                    <h4 class="mb-0"><?php echo $data['productos']['total']; ?></h4>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-12 col-lg-4">
        <div class="card radius-10">
        <div class="card-header bg-transparent">
                    <div class="d-flex align-items-center">
                        <div>
                            <h6 class="mb-0">Pedidos</h6>
                        </div>
                    </div>
                </div>
            <div class="card-body">                
                <div class="chart-container-2">
                    <canvas id="reportePedidos"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-lg-4">
        <div class="card radius-10 w-100">
            <div class="card-header bg-transparent">
                <div class="d-flex align-items-center">
                    <div>
                        <h6 class="mb-0">Productos con Stock Mínimo</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-container-1">
                    <canvas id="chart4"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-lg-4">
        <div class="card radius-10 w-100">
            <div class="card-header bg-transparent">
                <div class="d-flex align-items-center">
                    <div>
                        <h6 class="mb-0">Productos más vendidos</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-container-1">
                    <canvas id="topProductos"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include_once 'Views/template/footer-admin.php'; ?>

<script>
    // === HISTOGRAMA DE PEDIDOS (AGRANDADO) ===

    const canvas = document.getElementById("reportePedidos");
    const ctx = canvas.getContext("2d");

    // 🔹 Aumentamos el tamaño del canvas directamente
    canvas.height = 420; // antes estaba alrededor de 300

    // 🔹 Colores con degradado
    const gradient1 = ctx.createLinearGradient(0, 0, 0, 400);
    gradient1.addColorStop(0, '#fc4a1a');
    gradient1.addColorStop(1, '#f7b733');

    const gradient2 = ctx.createLinearGradient(0, 0, 0, 400);
    gradient2.addColorStop(0, '#4776e6');
    gradient2.addColorStop(1, '#8e54e9');

    const gradient3 = ctx.createLinearGradient(0, 0, 0, 400);
    gradient3.addColorStop(0, '#42e695');
    gradient3.addColorStop(1, '#3bb2b8');

    // 🔹 Crear el gráfico
    new Chart(ctx, {
        type: 'bar', // Histograma vertical
        data: {
            labels: ["Pendientes", "Proceso", "Finalizados"],
            datasets: [{
                label: 'Cantidad de pedidos',
                data: [
                    <?php echo $data['pendientes']['total']; ?>,
                    <?php echo $data['procesos']['total']; ?>,
                    <?php echo $data['finalizados']['total']; ?>
                ],
                backgroundColor: [gradient1, gradient2, gradient3],
                borderColor: '#fff',
                borderWidth: 1,
                borderRadius: 6
            }]
        },
        options: {
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                title: {
                    display: true,
                    text: 'Histograma de Pedidos',
                    font: { size: 18, weight: 'bold' },
                    color: '#333'
                },
                tooltip: {
                    callbacks: {
                        label: (context) => ` ${context.label}: ${context.raw}`
                    }
                }
            },
            scales: {
                x: {
                    title: { display: true, text: 'Estado del pedido' },
                    ticks: { font: { size: 14 } }
                },
                y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Cantidad' },
                    ticks: { stepSize: 1, font: { size: 14 } }
                }
            }
        }
    });
</script>


<script src="<?php echo BASE_URL; ?>assets/js/index.js"></script>

</body>

</html>