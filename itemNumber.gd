extends Panel


var nome : String
var rotulo : String
func iniciar(onome,orotulo,valorPadrao):
	nome = onome
	rotulo = orotulo
	$lb.text = rotulo
	$spBox.value = valorPadrao

func resultado():
	var res = "#  "+rotulo+"\n"
	if($lb.pressed==false):
		res += "# "
	res+="%s=%f"%[nome,$spBox.value]
	return res
func _ready():
	rect_min_size.y=30
