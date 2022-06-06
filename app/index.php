<?php
// Error Handling
error_reporting(-1);
ini_set('display_errors', 1);

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Slim\Routing\RouteContext;

require __DIR__ . '/../vendor/autoload.php';

require_once './db/AccesoDatos.php';
require_once './middlewares/AutentificadorJWT.php';
// require_once './middlewares/Logger.php';

require_once './controllers/UsuarioController.php';
require_once './middlewares/Logger.php';

// Load ENV
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad();

// Instantiate App
$app = AppFactory::create();
//$app->setBasePath('/app');

// Add error middleware
$app->addErrorMiddleware(true, true, true);

// Add parse body
$app->addBodyParsingMiddleware();

// Routes
$app->group('/usuarios', function (RouteCollectorProxy $group) {
    $group->get('[/]', \UsuarioController::class . ':traerTodos');
    $group->get('/{usuario}', \UsuarioController::class . ':traerUno'); 
    // {usuario} es un arg, en postman va a ser localhost:666/usuarios/franco
    $group->post('[/]', \UsuarioController::class . ':cargarUno');
    $group->put('/modificar', UsuarioController::class . ':modificarUno');
    $group->put('/desactivar', UsuarioController::class . ':borrarUno');
    $group->put('/reactivar', UsuarioController::class . ':reactivarUno');

  })->add(\Logger::class . ':LogOperacion');

  //acá como no es un grupo le tenemos que pasar request y response.
$app->get('[/]', function (Request $request, Response $response) {    
    $response->getBody()->write("Slim Framework 4 PHP");
    return $response;
});

// //Ejercicios en clase
// //
// //Ejercicio 1
// $app->group('/credenciales', function (RouteCollectorProxy $group) {
//   $group->get('[/]', \UsuarioController::class . ':TraerTodos');
//   $group->post('[/]', \UsuarioController::class . ':CargarCualquierCosa');
// })->add(\Logger::class . ':VerificarCredenciales');

// //Ejercicio 2
// $app->group('/JSON', function (RouteCollectorProxy $group) {
//   $group->get('[/]', \UsuarioController::class . ':TraerTodos');
//   $group->post('[/]', \UsuarioController::class . ':CargarCualquierCosa');
// })->add(\Logger::class . ':VerificarCredencialesJSON');


// JWT test routes. reemplazar por middlewares.
$app->group('/jwt', function (RouteCollectorProxy $group) {

  $group->post('/crearToken', function (Request $request, Response $response) {    
    $parametros = $request->getParsedBody();

    $usuario = $parametros['usuario'];
    $perfil = $parametros['perfil'];
    $alias = $parametros['alias'];

    $datos = array('usuario' => $usuario, 'perfil' => $perfil, 'alias' => $alias);

    $token = AutentificadorJWT::CrearToken($datos);
    $payload = json_encode(array('jwt' => $token));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });

  $group->get('/devolverPayLoad', function (Request $request, Response $response) {
    $header = $request->getHeaderLine('Authorization');
    $token = trim(explode("Bearer", $header)[1]);

    try {
      $payload = json_encode(array('payload' => AutentificadorJWT::ObtenerPayLoad($token)));
    } catch (Exception $e) {
      $payload = json_encode(array('error' => $e->getMessage()));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });

  $group->get('/devolverDatos', function (Request $request, Response $response) {
    $header = $request->getHeaderLine('Authorization');
    $token = trim(explode("Bearer", $header)[1]);

    try {
      $payload = json_encode(array('datos' => AutentificadorJWT::ObtenerData($token)));
    } catch (Exception $e) {
      $payload = json_encode(array('error' => $e->getMessage()));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });

  $group->get('/verificarToken', function (Request $request, Response $response) {
    $header = $request->getHeaderLine('Authorization');
    $token = trim(explode("Bearer", $header)[1]);
    $esValido = false;

    try {
      AutentificadorJWT::verificarToken($token);
      $esValido = true;
    } catch (Exception $e) {
      $payload = json_encode(array('error' => $e->getMessage()));
    }

    if ($esValido) {
      $payload = json_encode(array('valid' => $esValido));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });
});


//

//RUN
$app->run();
