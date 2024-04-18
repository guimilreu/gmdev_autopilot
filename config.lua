--------------------------
-- GM Dev - Notify -------
--------------------------

-- Esse script é COMPLETAMENTE GRATUITO, se você adquiriu ele de forma paga, denuncie em nosso Discord: https://discord.gg/nBteuHPYgg

Config = {}

-- Lista com carros liberados para utilizar o piloto automático.
Config.WHITELISTED_VEHICLES = {
	"neon",
	"voltic",
	"cyclone",
	"raiden",
	-- Adicione mais veículos aqui seguindo o padrão dos demais...
}


-- Está utilizando nosso script de Notify? Se sim, troque para true para desbloquear todas suas funcionalidades!
-- Ainda não conhece a Notify da GM Dev? Conheça e adquira GRATUITAMENTE no Discord: https://discord.gg/nBteuHPYgg
Config.USING_GMDEV_NOTIFY = true


-- Variáveis de precisão e controle do piloto automático:
-- Velocidade máxima que o veículo pode atingir durante o piloto automático.
Config.MAX_SPEED = 200.0

-- Velocidade mínima que o veículo pode atingir durante o piloto automático.
Config.MIN_SPEED = 5.0

-- Velocidade padrão quando o piloto automático é ativado.
Config.DEFAULT_SPEED = 80.0

-- Incremento de velocidade ao ajustar durante o piloto automático.
Config.SPEED_INCREMENT = 5.0

-- Distância de parada do veículo durante o piloto automático.
Config.STOP_DISTANCE = 50
