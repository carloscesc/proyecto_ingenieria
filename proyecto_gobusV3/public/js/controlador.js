$(document).ready(function(){
    $('#btn-registrar').click(function () {
        var parametros = `username=${$("#txt-nombre").val()}&password=${$("#txt-password").val()}&acerca=${$("#txt-acerca").val()}&ubicacion=${$("#txt-ubicacion").val()}`;

        console.log(parametros);
        $.ajax({
            url: "/guardar",
            method: "POST",
            data: parametros,
            dataType: "json",
            success: function (respuesta) {
                console.log(respuesta);
            },
            error: function (error) {
                console.error(error);
            }
        });
    });
});