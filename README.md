# Examen Técnico

Mi entorno de prueba posee las siguientes características:

* Linux Mint 21 Cinnamon

* Ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [x86_64-linux]

* Rails 7.0.5

* psql (PostgreSQL) 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

* Redis 6.0

## Gemas

* gem "bootstrap", "~> 5.2"
* gem "jquery-rails", "~> 4.5"
* gem "popper_js", "~> 2.11"
* gem "figaro" , "~> 1.2"
* gem "chartkick", "~> 5.0"
* ~~gem "whenever", "~> 1.0"~~ Tiempo mínimo: 1min
* gem 'sidekiq', "~> 6.0.7"
* gem 'sidekiq-scheduler', '~> 3.0'

## Instalación

Lo primero es descargar el proyecto con el entorno previamente mencionado o similar

Lo siguiente es ejecutar un:

```bash
bundle install
```

en la terminal al estar puesto en la carpeta del proyecto para que instale o actualice todas las gemas con las versiones especificadas.

--------------------------------------------------------------------------------

También es necesario generar el archivo de entorno con la gema Figaro, la cual, utiliza el siguiente comando en terminal:

```bash
bundle exec figaro install
```

el cual crea un archivo "application.yml" en donde se deben introducir las siguientes variables de entorno para el correcto funcionamiento:

| Key                    | Value                                                |
| :--------------------- | :--------------------------------------------------- |
| `db_development`       | Nombre de la base de datos de desarrollo             |
| `db_production`        | Nombre de la base de datos de producción             |
| `db_test`              | Nombre de la base de datos de testing                |
| `db_usuario`           | Usuario con acceso a la base de datos                |
| `db_pw`                | Contraseña del usuario para la base de datos         |


Un ejemplo de cómo debería verse un valor es:

```yml
db_development: nftechtest_development
db_production: nftechtest_production
```

Una vez realizado estos pasos puedes usar:

```bash
rails db:create
rails db:migrate
rails db:seed
rails s
```

para crear la base de datos, insertar un usuario base (también se puede registrar dentro del sistema) e inicializar el proyecto y probarlo en la url base (http://127.0.0.1:300).

Una vez el servidor esté corriendo, puedes usar el siguiente comando para realizar las actualizaciones cada 30s (requiere primero que pase un minuto para que funcione según la documentación de Sidekiq)

```bash
bundle exec sidekiq -C config/sidekiq.yml
```

## Changelog

* 29/08/23 - Creación de proyecto. Versionamiento e instalación de gemas. README base. Diseño y creación de base de datos (migraciones). API base. Dashboard. Alertas.

* 30/08/23 - Test de whenever. Test de Sidekiq. Self-Ping con Sidekiq-scheduler. Funcionamiento OK de la tarea programada.

### TO-DO:

* ~~Crear las tareas programadas para la actualización de data de la API cada 30s (ping api cada 30s).~~