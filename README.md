# README

This README would normally document whatever steps are necessary to get the
application up and running.
name: José Javier Liscano
email: jose8javier@gmail.com
link del proyecto en github: https://github.com/liscanojose/beetrack_app
Esta prueba hara uso del api de google map para mostrar la ubicación mas reciente de un vehiculo dada su longitude y latitude

cada request debe llegar el siguiente endpoint /api/v1/gps that accepts GPS waypoints associated to a vehicle. The following format must be used:
{
  "latitude": 20.23,
  "longitude": -0.56,
  "sent_at": 2016-06-02 20:45:00",
  "vehicle_identifier": "HA-3452"
}

se puede hacer uso de postman para enviar los request aca un ejemplo
usando el port 3000 que usa por defecto rails
http://localhost:3000/api/v1/gps?latitude=-33.116889&longitude=-70.106705&sent_at=2020-05-18 19:49:00&vehicle_identifier=HASD24

la ruta de root http://localhost:3000
te mostrara el mapa con la localización mas reciente de los vehiculos con un icono de un carro en color azul, al hacer hover con el mouse en el icono se vusualizara su identifier


Things you may want to cover:

* Ruby version 2.4.1p111

* System dependencies
tener redist instalado

* Configuration
Configurar el archivo local_env.yml asignando una API_KEY de google la variable en el proyecto se llama GOOGLE_MAPS_API_KEY

* Database creation postgresql
user postgres
password postgres
rake db:create
rake db:migrate
* Database initialization
se iniciara con 3 vehiculos cada uno de ellos con 3 localizaciones
rake db:seed

* How to run the test suite
para correr el suite de test
ejecutar el comando: rspec spec
* Services (job queues, cache servers, search engines, etc.)
ubicarse en la carpeta donde se tenga redis y ejecutar el siguiente comando src/redis-server
Iniciar sidekiq
bundle exec sidekiq
* Deployment instructions

* ...
