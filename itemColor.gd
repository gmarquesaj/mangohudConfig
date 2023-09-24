extends Panel


var nome : String
var rotulo : String
func iniciar(onome,orotulo,corPadrao):
	nome = onome
	rotulo = orotulo
	$lb.text = rotulo
	$btCor.color = corPadrao

func resultado():
	var res = "#  "+rotulo+"\n"
	if($lb.pressed==false):
		res += "# "
	res+=nome+ " = "+$btCor.color.to_html(false)
	return res
func _ready():
	rect_min_size.y=30
