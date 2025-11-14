<?php

class ReservasModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }

    public function agregarReserva($idCliente, $idProducto, $cantidad)
    {
        $sql = "SELECT id, cantidad FROM reservas WHERE id_cliente = ? AND id_producto = ? AND estado = 'pendiente'";
        $reserva = $this->select($sql, [$idCliente, $idProducto]);

        if ($reserva) {
            $nuevaCantidad = $reserva['cantidad'] + $cantidad;
            $sqlUpdate = "UPDATE reservas SET cantidad = ? WHERE id = ?";
            return $this->save($sqlUpdate, [$nuevaCantidad, $reserva['id']]);
        } else {
            $sqlInsert = "INSERT INTO reservas (id_cliente, id_producto, cantidad) VALUES (?, ?, ?)";
            return $this->save($sqlInsert, [$idCliente, $idProducto, $cantidad]);
        }
    }

    public function getReservasCliente($idCliente)
    {
        $sql = "SELECT r.*, p.nombre AS producto
                FROM reservas r
                INNER JOIN productos p ON r.id_producto = p.id
                WHERE r.id_cliente = $idCliente";
        return $this->selectAll($sql);
    }

    public function pagarReserva($idReserva)
    {
        $sql = "UPDATE reservas SET estado = 'pagada' WHERE id = ?";
        return $this->save($sql, [$idReserva]);
    }
}

?>