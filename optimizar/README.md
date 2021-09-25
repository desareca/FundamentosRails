# README

En este archivo se encuentra el detalle de las actividades Optimizar Consultas I y Optimizar Consultas II.

## Optimizar Consultas I

Antes de comenzar a hablar sobre la optimización de consultas, necesitamos crear una aplicación con algunos datos para que podamos ejecutar consultas. A menudo las aplicaciones necesitan tener algunos datos predeterminados en la base de datos. Por ejemplo, una aplicación de viaje necesitaría cargar los principales destinos del mundo en su base de datos. Entonces, ¿cómo podemos resolver este problema? Por lo que sabemos hasta ahora, esta tarea en particular no suena demasiado agradable. Después de crear los modelos, tenemos que ir a la consola e ingresar toda la información en nuestras tablas manualmente. Si eso no suena ya lo suficientemente malo, ¿qué pasa si alguien más quiere usar el mismo esquema? También tendría que escribir la misma información en su consola. Uf, no es una buena solución como puedes imaginar. Bueno, como con la mayoría de las cosas, Active Record nos proporciona una solución.

Datos Semilla (Seed Data)

Cree una nueva aplicación de Rails con el nombre 'optimizar', con los siguientes modelos.

  ~~~
rails new optimizar
rails generate scaffold Equipo nombre:string mascota:string estadio:string
rails generate scaffold Jugador nombre:string equipo:references
rake db:migrate
~~~

Asegúrate de tener las relaciones de belongs_to :equipo y has_many :jugadores configuradas en tus modelos de Jugador y Equipo respectivamente.

A continuación, navegue hasta db/seeds.rb y copie el siguiente código:
Nota: modifiqué el código para que funcionara, queda como sigue:

  ~~~
# se requiere 'open-uri' para solicitar los archivos html
require 'open-uri'
equipos = [
  ["Atlanta Hawks", "Skyhawk", "Philips Arena"],
  ["Boston Celtics", "Lucky the Leprechaun", "TD Garden"],
  ["Brooklyn Nets", "BrooklyKnight", "Barclays Center"],
  ["Charlotte Hornets", "Hugo the Hornet", "Spectrum Center"],
  ["Chicago Bulls", "Benny the Bull", "United Center"],
  ["Cleveland Cavaliers", "Moondog", "Quicken Loans Arena"],
  ["Dallas Mavericks", "Champ", "American Airlines Center"],
  ["Denver Nuggets", "Rocky the Mountain Lion", "Pepsi Center"],
  ["Detroit Pistons", "Hooper", "The Palace of Auburn Hills"],
  ["Golden State Warriors", "Thunder", "Oracle Arena"],
  ["Houston Rockets", "Clutch", "Toyota Center"],
  ["Indiana Pacers", "Boomer the Panther", "Bankers Life Fieldhouse"],
  ["Los Angeles Clippers", "Chuck", "Staples Center"],
  ["Los Angeles Lakers", "Jack Nicholson", "Staples Center"],
  ["Memphis Grizzlies", "Griz", "FedExForum"],
  ["Miami Heat", "Burnie", "American Airlines Arena"],
  ["Milwaukee Bucks", "Bango", "BMO Harris Bradley Center"],
  ["Minnesota Timberwolves", "Crunch the Wolf", "Target Center"],
  ["New Orleans Pelicans", "Pierre the Pelican", "Smoothie King Center"],
  ["New York Knicks", "Spike Lee", "Madison Square Garden"],
  ["Oklahoma City Thunder", "Rumble the Bison", "Chesapeake Energy Arena"],
  ["Orlando Magic", "Stuff the Magic Dragon", "Amway Center"],
  ["Philadelphia 76ers", "Franklin the Dog", "Wells Fargo Center Philadelphia"],
  ["Phoenix Suns", "The Suns Gorilla", "Talking Stick Resort Arena"],
  ["Portland Trail Blazers", "Blaze the Trail Cat", "Moda Center"],
  ["Sacramento Kings", "Slamson the Lion", "Golden 1 Center"],
  ["San Antonio Spurs", "The Coyote", "AT&T Center"],
  ["Toronto Raptors", "Raptor", "Air Canada Centre"],
  ["Utah Jazz", "Jazz Bear", "Vivint Smart Home Arena"],
  ["Washington Wizards", "G. Wiz", "Verizon Center"]
]
# Aquí vamos a utilizar la gema Nokogiri (ya viene con Rails), para obtener del sitio web ESPN la lista de jugadores.
# Para más información sobre Nokogiri, puede consultar la documentación o visitar http://www.nokogiri.org/
atlanta_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/atl/atlanta-hawks"))
boston_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/bos/boston-celtics"))
brooklyn_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/bkn/brooklyn-nets"))
charlotte_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/cha/charlotte-hornets"))
chicago_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/chi/chicago-bulls"))
cleveland_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/cle/cleveland-cavaliers"))
dallas_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/dal/dallas-mavericks"))
denver_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/den/denver-nuggets"))
detroit_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/det/detroit-pistons"))
warriors_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/gs/golden-state-warriors"))
houston_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/hou/houston-rockets"))
indiana_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/ind/indiana-pacers"))
clippers_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/lac/la-clippers"))
lakers_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/lal/los-angeles-lakers"))
memphis_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/mem/memphis-grizzlies"))
miami_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/mia/miami-heat"))
milwaukee_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/mil/milwaukee-bucks"))
minnesota_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/min/minnesota-timberwolves"))
nola_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/no/new-orleans-pelicans"))
knicks_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/ny/new-york-knicks"))
okc_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/okc/oklahoma-city-thunder"))
orlando_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/orl/orlando-magic"))
phili_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/phi/philadelphia-76ers"))
phoenix_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/phx/phoenix-suns"))
portland_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/por/portland-trail-blazers"))
sacramento_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/sac/sacramento-kings"))
spurs_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/sa/san-antonio-spurs"))
toronto_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/tor/toronto-raptors"))
utah_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/utah/utah-jazz"))
washington_players = Nokogiri::HTML(URI.open("http://www.espn.com/nba/team/roster/_/name/wsh/washington-wizards"))

jugadores = [
  atlanta_players,
  boston_players,
  brooklyn_players,
  charlotte_players,
  chicago_players,
  cleveland_players,
  dallas_players,
  denver_players,
  detroit_players,
  warriors_players,
  houston_players,
  indiana_players,
  clippers_players,
  lakers_players,
  memphis_players,
  miami_players,
  milwaukee_players,
  minnesota_players,
  nola_players,
  knicks_players,
  okc_players,
  orlando_players,
  phili_players,
  phoenix_players,
  portland_players,
  sacramento_players,
  spurs_players,
  toronto_players,
  utah_players,
  washington_players]

def jug_array team
  jug = []
  team.xpath("//td//div//a").each do |link|
    if link.text.length >0
      jug.push(link.text)
    end  
  end
  return jug
end
  
jugadores.each_with_index do |nomina, index|
  Equipo.create(nombre: equipos[index][0], mascota: equipos[index][1], estadio: equipos[index][2])
  jug_array(jugadores[index]).each do |jugador|
    Jugador.create(nombre: jugador, equipo: Equipo.last)
  end
end  
~~~

Ahora puedes ejecutar:

```rake db:seed```

Este comando ejecutará el código del archivo en db/seeds.rb. Ya deberías tener todos los equipos de la NBA y sus nóminas en la base de datos. Navega a la consola de Rails y ejecuta:

### Ahora algunas pruebas:

```Equipo.all``` (Muestra solo algunos registros)

| id | nombre                 | mascota                 | estadio                         | created_at              | updated_at              |
|----|------------------------|-------------------------|---------------------------------|-------------------------|-------------------------|
| 1  | Atlanta Hawks          | Skyhawk                 | Philips Arena                   | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 2  | Boston Celtics         | Lucky the Leprechaun    | TD Garden                       | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 3  | Brooklyn Nets          | BrooklyKnight           | Barclays Center                 | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 4  | Charlotte Hornets      | Hugo the Hornet         | Spectrum Center                 | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 5  | Chicago Bulls          | Benny the Bull          | United Center                   | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
| 6  | Cleveland Cavaliers    | Moondog                 | Quicken Loans Arena             | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
| 7  | Dallas Mavericks       | Champ                   | American Airlines Center        | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
| 8  | Denver Nuggets         | Rocky the Mountain Lion | Pepsi Center                    | 2021-07-22 04:26:00 UTC | 2021-07-22 04:26:00 UTC |
| 9  | Detroit Pistons        | Hooper                  | The Palace of Auburn Hills      | 2021-07-22 04:26:00 UTC | 2021-07-22 04:26:00 UTC |
| 10 | Golden State Warriors  | Thunder                 | Oracle Arena                    | 2021-07-22 04:26:00 UTC | 2021-07-22 04:26:00 UTC |
| 11 | Houston Rockets        | Clutch                  | Toyota Center                   | 2021-07-22 04:26:01 UTC | 2021-07-22 04:26:01 UTC |
| 12 | Indiana Pacers         | Boomer the Panther      | Bankers Life Fieldhouse         | 2021-07-22 04:26:01 UTC | 2021-07-22 04:26:01 UTC |
| 13 | Los Angeles Clippers   | Chuck                   | Staples Center                  | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 14 | Los Angeles Lakers     | Jack Nicholson          | Staples Center                  | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 15 | Memphis Grizzlies      | Griz                    | FedExForum                      | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |

```Jugador.all``` (Muestra solo algunos registros)

| id  | nombre                   | equipo_id | created_at              | updated_at              |
|-----|--------------------------|-----------|-------------------------|-------------------------|
| 1   | Bogdan Bogdanovic        | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 2   | Clint Capela             | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 3   | John Collins             | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 4   | Kris Dunn                | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 5   | Bruno Fernando           | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 6   | Danilo Gallinari         | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 7   | Brandon Goodwin          | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 8   | Solomon Hill             | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 9   | Kevin Huerter            | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 10  | De'Andre Hunter          | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 11  | Nathan Knight            | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 12  | Skylar Mays              | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 13  | Onyeka Okongwu           | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 14  | Cam Reddish              | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 15  | Tony Snell               | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |
| 16  | Lou Williams             | 1         | 2021-07-22 04:25:57 UTC | 2021-07-22 04:25:57 UTC |

```Equipo.third.jugadors``` (Muestra solo algunos registros | jugadores del tercer equipo)

| id | nombre                  | equipo_id | created_at              | updated_at              |
|----|-------------------------|-----------|-------------------------|-------------------------|
| 36 | Bruce Brown             | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 37 | Chris Chiozza           | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 38 | Nicolas Claxton         | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 39 | Spencer Dinwiddie       | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 40 | Kevin Durant            | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 41 | Jeff Green              | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 42 | Blake Griffin           | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 43 | James Harden            | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 44 | Joe Harris              | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 45 | Kyrie Irving            | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 46 | Mike James              | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 47 | Alize Johnson           | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 48 | Tyler Johnson           | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 49 | DeAndre Jordan          | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 50 | Timothe Luwawu-Cabarrot | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 51 | Reggie Perry            | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |




## Optimizar Consultas II

En esta sección, trabajaremos con el mismo proyecto Rails de la sección anterior.

### El Problema N+1

Digamos que queremos mostrar la casa estadio de 10 jugadores aleatorios de nuestra base de datos. En la consola de Rails, podemos ejecutar algo como esto:

  ~~~
jugadores = Jugador.limit(10).order("RANDOM()")
jugadores.each do |jugador|
  puts jugador.equipo.estadio
end
~~~

¡Increíble! Fuimos capaz de mostrar exitosamente el estadio para cada jugador. Pero, ¿cuántas consultas ejecutamos? Bien, 1 consulta para obtener los 10 jugadores + 10 consultas para obtener la información del estadio, para un total de 11.  10 + 1 (N + 1). Puede que ahora no parezca un problema, pero a medida que las aplicaciones crecen, estos tipos de consultas pueden afectar negativamente el rendimiento.

  ~~~
Jugador Load (3.9ms)  SELECT "jugadors".* FROM "jugadors" ORDER BY RANDOM() LIMIT ?  [["LIMIT", 10]]
  Equipo Load (3.0ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 7], ["LIMIT", 1]]
American Airlines Center
  Equipo Load (2.7ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 15], ["LIMIT", 1]]
FedExForum
  Equipo Load (3.3ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 23], ["LIMIT", 1]]
Wells Fargo Center Philadelphia
  Equipo Load (2.8ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 24], ["LIMIT", 1]]
Talking Stick Resort Arena
  Equipo Load (2.7ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 9], ["LIMIT", 1]]
The Palace of Auburn Hills
  Equipo Load (2.3ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 18], ["LIMIT", 1]]
Target Center
  Equipo Load (2.5ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
Barclays Center
  Equipo Load (2.3ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
TD Garden
  Equipo Load (2.6ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 6], ["LIMIT", 1]]
Quicken Loans Arena
  Equipo Load (2.8ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
Barclays Center
~~~


| id  | nombre            | equipo_id | created_at              | updated_at              |
|-----|-------------------|-----------|-------------------------|-------------------------|
| 116 | JJ Redick         | 7         | 2021-07-22 04:26:00 UTC | 2021-07-22 04:26:00 UTC |
| 245 | Tyus Jones        | 15        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 383 | Mike Scott        | 23        | 2021-07-22 04:26:06 UTC | 2021-07-22 04:26:06 UTC |
| 401 | Cameron Payne     | 24        | 2021-07-22 04:26:06 UTC | 2021-07-22 04:26:06 UTC |
| 142 | Killian Hayes     | 9         | 2021-07-22 04:26:00 UTC | 2021-07-22 04:26:00 UTC |
| 290 | Malik Beasley     | 18        | 2021-07-22 04:26:04 UTC | 2021-07-22 04:26:04 UTC |
| 39  | Spencer Dinwiddie | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 34  | Grant Williams    | 2         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |
| 87  | Jarrett Allen     | 6         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
| 44  | Joe Harris        | 3         | 2021-07-22 04:25:58 UTC | 2021-07-22 04:25:58 UTC |


Active Record creó un método para resolver este problema. El método **includes** nos permite hacer una carga apresurada (lo que significa que carga todos los detalles al mismo tiempo) de las asociaciones que necesitas. La carga apresurada consiste en guardar primero las tablas asociadas en memoria para reducir las consultas que se requieren para recuperar cualquier información de las tablas. Ejecuta el siguiente código:

  ~~~
jugadores = Jugador.includes(:equipo).limit(10).order("RANDOM()")
jugadores.each do |jugador|
  puts jugador.equipo.estadio
end
~~~

En este código, Active Record solo realiza 2 consultas. Una consulta para recuperar los 10 jugadores aleatorios + 1 consulta para recuperar la información de equipo para esos jugadores. Guarda la información en memoria, así cuando solicitamos el estadio para cada jugador, Active Record no necesita hacer ninguna consulta a la base de datos. ¡Ya tiene esta información! 

~~~
Jugador Load (3.3ms)  SELECT "jugadors".* FROM "jugadors" ORDER BY RANDOM() LIMIT ?  [["LIMIT", 10]]
  Equipo Load (3.0ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" IN (?, ?, ?, ?, ?, ?, ?, ?)  [["id", 26], ["id", 9], ["id", 10], ["id", 28], ["id", 29], ["id", 3], ["id", 13], ["id", 11]]
Golden 1 Center
The Palace of Auburn Hills
Oracle Arena
Air Canada Centre
Vivint Smart Home Arena
Air Canada Centre
Barclays Center
Staples Center
Toyota Center
Barclays Center
~~~


### Joins

Al especificar condiciones en nuestras consultas, Active Record recomienda que utilicemos el método **joins** en su lugar.

> Aunque Active Record le permite especificar las condiciones en la carga apresurada, al igual que los join, la forma recomendada es utilizar joins en su lugar. - [Active Record Docs](http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations)

En el proceso de carga apresurada, la SEGUNDA sentencia select siempre depende de la PRIMERA sentencia select. Esto dificulta ejecutar sentencia con condiciones especificar. Sin embargo, si es necesario, puedes escribir algo como:

```Jugador.includes(:equipo).where("equipos.nombre = 'Los Angeles Lakers'").references(:equipo)```

  ~~~
SQL (3.1ms)  SELECT "jugadors"."id" AS t0_r0, "jugadors"."nombre" AS t0_r1, "jugadors"."equipo_id" AS t0_r2, "jugadors"."created_at" AS t0_r3, "jugadors"."updated_at" AS t0_r4, "equipos"."id" AS t1_r0, "equipos"."nombre" AS t1_r1, "equipos"."mascota" AS t1_r2, "equipos"."estadio" AS t1_r3, "equipos"."created_at" AS t1_r4, "equipos"."updated_at" AS t1_r5 FROM "jugadors" LEFT OUTER JOIN "equipos" ON "equipos"."id" = "jugadors"."equipo_id" WHERE (equipos.nombre = 'Los Angeles Lakers')
~~~

| id  | nombre                   | equipo_id | created_at              | updated_at              |
|-----|--------------------------|-----------|-------------------------|-------------------------|
| 221 | Kostas Antetokounmpo     | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 222 | Devontae Cacok           | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 223 | Kentavious Caldwell-Pope | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 224 | Alex Caruso              | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 225 | Anthony Davis            | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 226 | Andre Drummond           | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 227 | Jared Dudley             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 228 | Marc Gasol               | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 229 | Montrezl Harrell         | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 230 | Talen Horton-Tucker      | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 231 | LeBron James             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 232 | Kyle Kuzma               | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 233 | Wesley Matthews          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 234 | Alfonzo McKinnie         | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 235 | Ben McLemore             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 236 | Markieff Morris          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 237 | Dennis Schroder          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |


Observe que la sentencia anterior ejecuta un **LEFT OUTER JOIN** de jugadores a equipos. Si queremos un **INNER JOIN**, podemos utilizar el método **join** y especificar cualquier condición que queramos.

```Jugador.joins(:equipo).where("equipos.nombre = 'Los Angeles Lakers'")```

  ~~~
Jugador Load (2.8ms)  SELECT "jugadors".* FROM "jugadors" INNER JOIN "equipos" ON "equipos"."id" = "jugadors"."equipo_id" WHERE (equipos.nombre = 'Los Angeles Lakers')
~~~

| id  | nombre                   | equipo_id | created_at              | updated_at              |
|-----|--------------------------|-----------|-------------------------|-------------------------|
| 221 | Kostas Antetokounmpo     | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 222 | Devontae Cacok           | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 223 | Kentavious Caldwell-Pope | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 224 | Alex Caruso              | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 225 | Anthony Davis            | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 226 | Andre Drummond           | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 227 | Jared Dudley             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 228 | Marc Gasol               | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 229 | Montrezl Harrell         | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 230 | Talen Horton-Tucker      | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 231 | LeBron James             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 232 | Kyle Kuzma               | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 233 | Wesley Matthews          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 234 | Alfonzo McKinnie         | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 235 | Ben McLemore             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 236 | Markieff Morris          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
| 237 | Dennis Schroder          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |


### Ejercicio

Tenga en cuenta que tanto Jugador como Equipo tienen el atributo nombre. Esto podría complicar las cosas cuando esté intentando lo siguiente:

* Obtenga todos los jugadores, luego escriba un programa que recorra cada jugador y muestre el nombre de su equipo, la mascota y el estadio. ¿Cuántas consultas hemos realizado?

    ~~~
  jugadores = Jugador.all
  jugadores.each do |jugador|
    puts "equipo: #{jugador.equipo.nombre}, mascota: #{jugador.equipo.mascota}, estadio: #{jugador.equipo.estadio}"
  end
  ~~~

    ~~~
  Jugador Load (5.9ms)  SELECT "jugadors".* FROM "jugadors"
    Equipo Load (3.2ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  equipo: Atlanta Hawks, mascota: Skyhawk, estadio: Philips Arena
    Equipo Load (3.0ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  equipo: Atlanta Hawks, mascota: Skyhawk, estadio: Philips Arena
    Equipo Load (2.7ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  equipo: Atlanta Hawks, mascota: Skyhawk, estadio: Philips Arena
    Equipo Load (2.4ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  equipo: Atlanta Hawks, mascota: Skyhawk, estadio: Philips Arena
    Equipo Load (1.7ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  .......
  .......
  ~~~

  ```jugadores.length => 502``` N = 502

  Se realizaron 503 consultas, 502 para obtener información de cada jugado y 1 para obtener los jugadores. 

* Obtenga todos los jugadores y escriba un programa que recorra cada jugador y muestre el nombre de su equipo, la mascota y el estadio utilizando .includes. ¿Cuántas consultas hemos realizado?

    ~~~
  jugadores = Jugador.includes(:equipo).all
  jugadores.each do |jugador|
    puts "equipo: #{jugador.equipo.nombre}, mascota: #{jugador.equipo.mascota}, estadio: #{jugador.equipo.estadio}"
  end
  ~~~

    ~~~
  Jugador Load (9.0ms)  SELECT "jugadors".* FROM "jugadors"
  Equipo Load (3.7ms)  SELECT "equipos".* FROM "equipos" WHERE "equipos"."id" IN (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 
  ?, ?, ?, ?)  [["id", 1], ["id", 2], ["id", 3], ["id", 4], ["id", 5], ["id", 6], ["id", 7], ["id", 8], ["id", 9], ["id", 10], ["id", 11], ["id", 12], ["id", 13], ["id", 14], ["id", 15], ["id", 16], ["id", 17], ["id", 18], ["id", 19], ["id", 20], ["id", 21], ["id", 22], ["id", 23], ["id", 24], ["id", 25], ["id", 26], ["id", 27], ["id", 28], ["id", 29], ["id", 30]]
  ~~~

  Se realizaron 2 consultas, una para los jugadores y otra para recuperar la información guardada de los equipos de los jugadores.

* Obtenga todos los jugadores de 'Chicago Bulls' usando .includes.

  ```Jugador.includes(:equipo).where("equipos.nombre = 'Chicago Bulls'").references(:equipo)```

  | id | nombre            | equipo_id | created_at              | updated_at              |
  |----|-------------------|-----------|-------------------------|-------------------------|
  | 70 | Al-Farouq Aminu   | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 71 | Ryan Arcidiacono  | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 72 | Troy Brown Jr.    | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 73 | Devon Dotson      | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 74 | Cristiano Felicio | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 75 | Javonte Green     | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 76 | Zach LaVine       | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 77 | Lauri Markkanen   | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 78 | Adam Mokoka       | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 79 | Tomas Satoransky  | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 80 | Garrett Temple    | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 81 | Daniel Theis      | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 82 | Denzel Valentine  | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 83 | Nikola Vucevic    | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 84 | Coby White        | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 85 | Patrick Williams  | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
  | 86 | Thaddeus Young    | 5         | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |

* Obtenga todos los jugadores junto con el nombre del equipo que juegan en el 'Staples Center'.  

  ```Jugador.includes(:equipo).where("equipos.estadio = 'Staples Center'").references(:equipo)```

  | id  | nombre                   | equipo_id | created_at              | updated_at              |
  |-----|--------------------------|-----------|-------------------------|-------------------------|
  | 204 | Nicolas Batum            | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 205 | Patrick Beverley         | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 206 | Amir Coffey              | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 207 | DeMarcus Cousins         | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 208 | Yogi Ferrell             | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 209 | Paul George              | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 210 | Serge Ibaka              | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 211 | Reggie Jackson           | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 212 | Luke Kennard             | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 213 | Kawhi Leonard            | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 214 | Terance Mann             | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 215 | Marcus Morris Sr.        | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 216 | Daniel Oturu             | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 217 | Patrick Patterson        | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 218 | Rajon Rondo              | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 219 | Jay Scrubb               | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 220 | Ivica Zubac              | 13        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 221 | Kostas Antetokounmpo     | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 222 | Devontae Cacok           | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 223 | Kentavious Caldwell-Pope | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 224 | Alex Caruso              | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 225 | Anthony Davis            | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 226 | Andre Drummond           | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 227 | Jared Dudley             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 228 | Marc Gasol               | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 229 | Montrezl Harrell         | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 230 | Talen Horton-Tucker      | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 231 | LeBron James             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 232 | Kyle Kuzma               | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 233 | Wesley Matthews          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 234 | Alfonzo McKinnie         | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 235 | Ben McLemore             | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 236 | Markieff Morris          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  | 237 | Dennis Schroder          | 14        | 2021-07-22 04:26:02 UTC | 2021-07-22 04:26:02 UTC |
  |-----|--------------------------|-----------|-------------------------|-------------------------|
  34 rows in set

* Obtenga todos los equipos que tengan jugadores con nombres que empiezan por la letra Z. Utilice .includes y .joins.
  * .includes:
    
    ```Equipo.includes(:jugador).where("jugadors.nombre like 'Z%'").references(:jugador)```

      ~~~
    SQL (1.6ms)  SELECT "equipos"."id" AS t0_r0, "equipos"."nombre" AS t0_r1, "equipos"."mascota" AS t0_r2, "equipos"."estadio" AS t0_r3, "equipos"."created_at" AS t0_r4, "equipos"."updated_at" AS t0_r5, "jugadors"."id" AS t1_r0, "jugadors"."nombre" AS t1_r1, "jugadors"."equipo_id" AS t1_r2, "jugadors"."created_at" AS t1_r3, "jugadors"."updated_at" AS t1_r4 FROM "equipos" LEFT OUTER JOIN "jugadors" ON "jugadors"."equipo_id" = "equipos"."id" WHERE (jugadors.nombre like 'Z%')
    ~~~
  * .join:

    ```Equipo.joins(:jugador).where("jugadors.nombre like 'Z%'")```

      ~~~
    Equipo Load (1.9ms)  SELECT "equipos".* FROM "equipos" INNER JOIN "jugadors" ON "jugadors"."equipo_id" = "equipos"."id" WHERE (jugadors.nombre like 'Z%')
    ~~~

  * Resultados de ambs métodos:

    | id | nombre                 | mascota                 | estadio              | created_at              | updated_at              |
    |----|------------------------|-------------------------|----------------------|-------------------------|-------------------------|
    | 5  | Chicago Bulls          | Benny the Bull          | United Center        | 2021-07-22 04:25:59 UTC | 2021-07-22 04:25:59 UTC |
    | 8  | Denver Nuggets         | Rocky the Mountain Lion | Pepsi Center         | 2021-07-22 04:26:00 UTC | 2021-07-22 04:26:00 UTC |
    | 19 | New Orleans Pelicans   | Pierre the Pelican      | Smoothie King Center | 2021-07-22 04:26:04 UTC | 2021-07-22 04:26:04 UTC |
    | 25 | Portland Trail Blazers | Blaze the Trail Cat     | Moda Center          | 2021-07-22 04:26:06 UTC | 2021-07-22 04:26:06 UTC |

