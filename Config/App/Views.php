<?php
class Views{

    public function getView($controller, $view, $data = "")
    {
        // Si el controlador es un objeto, obtener su nombre
        if (is_object($controller)) {
            $controller = get_class($controller);
        }

        // Convertir a minúsculas y quitar namespace si existe
        $controller = strtolower($controller);

        // Si la vista es de HOME (página principal)
        if ($controller == "home") {
            $file = "Views/" . $view . ".php";
        } else {
            $file = "Views/" . $controller . "/" . $view . ".php";
        }

        // Cargar la vista
        require $file;
    }
}
?>
