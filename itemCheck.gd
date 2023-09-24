extends Panel
var nome : String
var rotulo : String
func iniciar(onome,orotulo):
	nome = onome
	rotulo = orotulo
	$lb.text = rotulo

func resultado():
	var res = "#  "+rotulo+"\n"+nome+" = "
	if($lb.pressed==false):
		res += "0"
	else:
		res+="1"
	return res
func _ready():
	rect_min_size.y=30
