extends Control
var linhaCheck = preload("res://itemCheck.tscn")
var linhaCor = preload("res://itemColor.tscn")
var linhaTexto = preload("res://itemText.tscn")
var linhaNumero= preload("res://itemNumber.tscn")
var linhaRotulo= preload("res://itemLabel.tscn")


onready var grid = $scrollC/grid

func addCheck(nome,rotulo):
	var novo = linhaCheck.instance()
	novo.iniciar(nome,rotulo)
	grid.add_child(novo)

func addColor(nome,rotulo,padrao="#000000"):
	var novo = linhaCor.instance()
	novo.iniciar(nome,rotulo,padrao)
	grid.add_child(novo)

func addText(nome,rotulo,padrao="#NAO PREENCHIDO#"):
	var novo = linhaTexto.instance()
	novo.iniciar(nome,rotulo,padrao)
	grid.add_child(novo)

func addNumber(nome,rotulo,padrao=1.0):
	var novo = linhaNumero.instance()
	novo.iniciar(nome,rotulo,padrao)
	grid.add_child(novo)

func addLabel(rotulo):
	var novo = linhaRotulo.instance()
	novo.iniciar(rotulo)
	grid.add_child(novo)

func _ready():
	_on_btFecharSaida_pressed()
	addLabel("PROCESSADOR/RAM")
	addText("cpu_text","rotulo da cpu","CPU")
	addCheck("cpu_stats","exibir o uso")
	addCheck("cpu_temp","temperatura")
	addColor("cpu_color","cor do uso da cpu",("#42c5f5"))
	addCheck("cpu_mhz","exibir frequencia")
	addCheck("core_load","exibir o uso de cada um dos nucleos/threads")
	addCheck("ram","exibir uso de memoria ram")
	addColor("ram_color","cor da ram",("#42c5f5"))
	
	addLabel("PLACA DE VIDEO")
	addCheck("gpu_stats","Exibir o uso")
	addText("gpu_text","rotulo da gpu","GPU")
	addCheck("gpu_name","exibir nome")
	addCheck("gpu_temp","temperatura")
	addColor("gpu_color","cor do \"uso da gpu\"",("#57f542"))
	addCheck("vram","exibir uso da memoria de video")
	addColor("vram_color","cor da vram",("#57f542"))
	
	addLabel("MONITORAMENTO")
	addCheck("fps","frames por segundo")
	addCheck("frametime","frametime")
	addCheck("frame_timing","grafico do frameTime")
	addColor("frametime_color","cor do grafico frameTime",("#00ff95"))
	
	addLabel("HUD")
	addColor("background_color","cor de fundo",("#000000"))
	addNumber("background_alpha","transparencia",0.3)
	addColor("text_color","cor do texto",("#ffffff"))
	addNumber("font_scale","escala da fonte",1.0)
	addNumber("font_size","tamanho da fonte",20.0)
	addNumber("offset_x","offset no eixo X",15.0)
	addNumber("offset_y","offset no eixo Y",15.0)	
	addNumber("round_corners","angulo dos cantos",5.0)
	addCheck("text_outline","usar contorno")
	addNumber("text_outline_thickness","contorno",1.5)
	addColor("text_outline_color","cor do contorno",("#ff0000"))

	addLabel("ENGINE")
	addColor("engine_color","cor das informaçoes",("#ffffff"))
	addCheck("resolution","resolução")
	addCheck("vulkan_driver"," versao do driver vulkan")
	addCheck("wine","versao do wine")
	addCheck("gamemode","estado do \"gamemode\"")
	
	addLabel("DISCO")
	addCheck("io_stats","estado do disco")
	addColor("io_color","cor do disco",("#b942f5"))
	addCheck("io_read","leitura do disco")
	addCheck("io_write","escrita do disco")



func _on_btSalvar_pressed():
	#gerar o texto
	var texto:String="##################\n#\n#- Wed Sep 13\n# Gilson Marques Alves Junior/Pirapora/MG/Brazil \n##################\n\n"
	for i in grid.get_children():
		texto+=i.resultado()+"\n\n"
	$edtSaida.text = texto
	#salvar texto para arquivo
	var file = File.new()
	print(file.open($edtPath.text, File.WRITE))
	file.store_string(texto)
	file.close()
	# exibir o texto gerado
	$lb2.visible=true
	$edtSaida.visible=true
	$btFecharSaida.visible=true
	$scrollC.rect_size.y=390



func _on_btFecharSaida_pressed():
	#esconder o texto gerado
	$lb2.visible=false
	$edtSaida.visible=false
	$btFecharSaida.visible=false
	$scrollC.rect_size.y=550
