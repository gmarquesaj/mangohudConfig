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
	
	addLabel("PROCESSADOR")
	addText("cpu_text","rotulo da cpu","CPU")
	addCheck("cpu_stats","uso da cpu")
	addCheck("cpu_temp","temp cpu")
	addColor("cpu_color","cor do uso da cpu",("#42c5f5"))
	addCheck("cpu_mhz","freq cpu")
	addCheck("core_load","uso dos nucleos")
	addCheck("ram","ram cpu")
	addColor("ram_color","cor da ram",("#42c5f5"))
	
	addLabel("PLACA DE VIDEO")
	addText("gpu_text","rotulo da gpu","GPU")
	addCheck("gpu_stats","uso da gpu")
	addCheck("gpu_name","nome da gpu")
	addCheck("gpu_temp","temp gpu")
	addColor("gpu_color","cor do uso da gpu",("#57f542"))
	addCheck("vram","ram gpu")
	addColor("vram_color","cor da vram",("#57f542"))
	
	addLabel("MONITORAMENTO")
	addCheck("fps","frames por segundo")
	addCheck("frametime","frametime")
	addCheck("frame_timing","grafico do frame time")
	addColor("frametime_color","cor do grafico",("#00ff95"))
	
	addLabel("HUD")
	addColor("background_color","background_color",("#000000"))
	addNumber("background_alpha","background alpha",0.3)
	addColor("text_color","text_color",("#ffffff"))
	addNumber("font_scale","escala fonte",1.0)
	addNumber("font_size","tamanho fonte",20.0)
	addNumber("offset_x","offset x",15.0)
	addNumber("offset_y","offset y",15.0)	
	addNumber("round_corners","angulo dos cantos",5.0)
	addNumber("text_outline_thickness","contorno",1.5)
	addCheck("text_outline","usar contorno")
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
	var texto:String="##################\n#\n#- Wed Sep 13\n# Gilson Marques Alves Junior/Pirapora/MG/Brazil \n##################\n\n"
	for i in grid.get_children():
		texto+=i.resultado()+"\n\n"
	$TextEdit.text = texto
	var file = File.new()
	print(file.open($edtPath.text, File.WRITE))
	file.store_string(texto)
	file.close()

