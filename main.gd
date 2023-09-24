extends Control
var linhaCheck = preload("res://itemCheck.tscn")
var linhaCor = preload("res://itemColor.tscn")

onready var grid = $scrollC/grid

func addCheck(nome,rotulo):
	var novo = linhaCheck.instance()
	novo.iniciar(nome,rotulo)
	grid.add_child(novo)
func addColor(nome,rotulo,padrao="#000000"):
	var novo = linhaCor.instance()
	novo.iniciar(nome,rotulo,padrao)
	grid.add_child(novo)	
func _ready():
	addColor("gpu_color","cor do uso da gpu",Color("#57f542"))
	addColor("cpu_color","cor do uso da cpu",Color("#42c5f5"))
	addColor("vram_color","cor da vram",Color("#57f542"))
	addColor("ram_color","cor da ram",Color("#42c5f5"))
	addColor("io_color","cor do disco",Color("#b942f5"))
	addColor("engine_color","engine_color",Color("#ffffff"))
	addColor("frametime_color","cor do grafico",Color("#00ff95"))
	addColor("background_color","background_color",Color("#000000"))
	addColor("text_color","text_color",Color("#ffffff"))



	addCheck("fps","frames por segundo")
	addCheck("gpu_name","nome da gpu")
	addCheck("vram","ram gpu")
	addCheck("ram","ram cpu")
	addCheck("gpu_stats","uso da gpu")
	addCheck("gpu_temp","temp gpu")
	addCheck("cpu_stats","uso da cpu")
	addCheck("cpu_temp","temp cpu")
	addCheck("resolution","resolução")
	addCheck("frametime","frametime")
	addCheck("frame_timing","grafico do frame time")
	addCheck("vulkan_driver"," versao do driver vulkan")
	addCheck("wine","versao do wine")
	addCheck("gamemode","estado do \"gamemode\"")
	addCheck("cpu_mhz","freq cpu")
	addCheck("core_load","uso dos nucleos")
	addCheck("io_stats","estado do disco")
	addCheck("io_read","leitura do disco")
	addCheck("io_write","escrita do disco")
#	addCheck("","")
#	addCheck("","")
#	addCheck("ram","ram cpu")
#	addCheck("gpu_text","")


func _on_btSalvar_pressed():
	var texto:String="##################\n#\n#- Wed Sep 13\n# Gilson Marques Alves Junior/Pirapora/MG/Brazil \n##################\n\n"
	for i in grid.get_children():
		texto+=i.resultado()+"\n\n"
	$TextEdit.text = texto
	var file = File.new()
	print(file.open($edtPath.text, File.WRITE))
	file.store_string(texto)
	file.close()

