extends Panel

var nome : String
var rotulo : String
func iniciar(onome,orotulo,textoPadrao):
	nome = onome
	rotulo = orotulo
	$lb.text = rotulo
	$edtText.text = textoPadrao

func resultado():
	var res = "#  "+rotulo+"\n"
	var txt = nome+"="+$edtText.text
	if($lb.pressed==false):
		res += "#"+txt
	else:
		res+=txt
	return res
func _ready():
	rect_min_size.y=30
