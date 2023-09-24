extends Panel



var rotulo : String
func iniciar(orotulo):
	rotulo = orotulo
	$lb.text = rotulo


func resultado():
	var res = "\n\n# ----------------> "+rotulo+"<------------------------\n"
	return res
func _ready():
	rect_min_size.y=50
