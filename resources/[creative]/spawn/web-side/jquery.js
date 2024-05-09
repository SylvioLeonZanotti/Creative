// -------------------------------------------------------------------------------------------
window.addEventListener("message",function(event){
	switch (event["data"]["Action"]){
		case "Spawn":
			if ($(".SpawnSelected").css("display") === "none"){
				$(".SpawnSelected").css("display","block");
				$(".SpawnMessage").css("display","block");
			}

			var Characters = event["data"]["Table"].sort((a,b) => (a["Passport"] > b["Passport"]) ? 1 : -1);

			$(".SpawnSelected").html(`
				<div class="SpawnCreateTitle">Personagem</div>
				<div class="SpawnCreateSubtitle">Selecione abaixo o personagem desejado</div>

				${Characters.map((info) => (`
					<div class="SpawnSelectedCharacter" data-passport="${info["Passport"]}">
						<i class="mdi mdi-arrow-up-bold-circle"></i>
						<b>Nome:</b> ${info["Nome"]}<br>
						<b>Sexo:</b> ${info["Sexo"] === "M" ? "Masculino":"Feminino"}<br>
						<b>Banco:</b> $${info["Banco"]}
				</div>`)).join("")}

				<div class="SpawnSelectedNew">+</div>
			`);
		break;

		case "Location":
			if ($(".SpawnLocation").css("display") === "none"){
				$(".SpawnLocation").css("display","block");
			}

			var locate = event["data"]["Table"].sort((a,b) => (a["name"] > b["name"]) ? 1 : -1);

			$(".SpawnLocation").html(`
				${locate.map((info) => (`
					<div class="SpawnLocationBox" data-hash="${info["hash"]}">${info["name"]}</div>
				`)).join("")}

				<div class="SpawnLocationSubmit" data-hash="spawn">Confirmar</div>
			`);
		break;

		case "Close":
			$(".SpawnMessage").css("display","none");
			$(".SpawnCreate").css("display","none");
		break;
	}
});
// -------------------------------------------------------------------------------------------
$(document).on("click",".SpawnSelectedCharacter",function(event){
	$.post("http://spawn/CharacterChosen",JSON.stringify({ passport: parseInt(event["currentTarget"]["dataset"]["passport"]) }));
	$(".SpawnSelected").css("display","none");
	$(".SpawnMessage").css("display","none");
});
// -------------------------------------------------------------------------------------------
$(document).on("click",".SpawnLocationBox",function(event){
	$.post("http://spawn/Chosen",JSON.stringify({ hash: parseInt(event["currentTarget"]["dataset"]["hash"]) }));
});
// -------------------------------------------------------------------------------------------
$(document).on("click",".SpawnLocationSubmit",function(event){
	$.post("http://spawn/Chosen",JSON.stringify({ hash: "spawn" }));
	$(".SpawnLocation").css("display","none");
});
// -------------------------------------------------------------------------------------------
$(document).on("click",".SpawnCreateSubmit",function(event){
	var Nome = $("#SpawnNome").val();
	var Sobrenome = $("#SpawnSobrenome").val();
	var Sexo = $(".SpawnCreate").find(".SpawnCreateButtonActive").attr("id");

	if (Nome != "" && Sobrenome != ""){
		$.post("http://spawn/NewCharacter",JSON.stringify({ name: Nome, name2: Sobrenome, sex: Sexo }));
	}
});
// -------------------------------------------------------------------------------------------
$(document).on("click",".SpawnSelectedNew",function(event){
	$(".SpawnSelected").css("display","none");
	$(".SpawnCreate").css("display","block");
});
// -------------------------------------------------------------------------------------------
$(document).on("click",".SpawnCreateCancel",function(event){
	$(".SpawnSelected").css("display","block");
	$(".SpawnCreate").css("display","none");
});
// -------------------------------------------------------------------------------------------
$(document).ready(() => {
	$(".SpawnCreate > button").on("click",function(){
		$(this).parent().find("button").removeClass("SpawnCreateButtonActive");
		$(this).addClass("SpawnCreateButtonActive");
	});
});