<?php
class Reservas extends Controller
{
    public function __construct()
    {
        session_start();
        parent::__construct();
    }

    public function agregar($idProducto)
    {
        if (!isset($_SESSION['idCliente'])) {
            header('Location: ' . BASE_URL . 'home/login');
            exit;
        }

        $idCliente = $_SESSION['idCliente'];
        $cantidad = 1;

        $this->model->agregarReserva($idCliente, $idProducto, $cantidad);
        header('Location: ' . BASE_URL . 'reservas');
    }

    public function index()
    {
        if (!isset($_SESSION['idCliente'])) {
            header('Location: ' . BASE_URL . 'login');
            exit;
        }

        $idCliente = $_SESSION['idCliente'];
        $data['reservas'] = $this->model->getReservasCliente($idCliente);

        $this->views->getView($this, "index", $data);
    }

    public function pagar($idReserva)
    {
        $reserva = $this->model->select("SELECT * FROM reservas WHERE id = ?", [$idReserva]);
        $this->model->save("UPDATE productos SET cantidad = cantidad - ? WHERE id = ?", [$reserva['cantidad'], $reserva['id_producto']]);
        $this->model->pagarReserva($idReserva);

        header('Location: ' . BASE_URL . 'reservas');
    }
}
?>
