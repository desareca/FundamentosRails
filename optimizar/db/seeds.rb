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

# Modificacion en open, se le debe agregar URI para no generar conflictos.

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

# Guarda informacion de los equipos en un array.
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

# Devuelve array de jugadores de la información scrapeada de cada equipo
def jug_array team
  jug = []
  team.xpath("//td//div//a").each do |link| # El nombre de los jugadores está en un link dentro de una tabla, puede cambiar en el futuro
    if link.text.length >0
      jug.push(link.text)
    end  
  end
  return jug
end
  
jugadores.each_with_index do |nomina, index|
  Equipo.create(nombre: equipos[index][0], mascota: equipos[index][1], estadio: equipos[index][2]) # creamos registro de equipo en Equipo
  jug_array(jugadores[index]).each do |jugador|
    Jugador.create(nombre: jugador, equipo: Equipo.last) # Creamos registro de jugador en Jugador (por equipo)
  end
end 
