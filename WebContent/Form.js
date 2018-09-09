 function Age(){
		
		var gdate=document.getElementById("BDAY").value;
		var getDate=new Date(gdate);
		var gyear=getDate.getFullYear();
		
		var today=new Date();
		var nowYear=today.getFullYear();
		
		var age=nowYear-gyear;
		
		document.getElementById("AGE").value=age;
		  
	}
	function allClear(){
		
			for(var i=0;i<=3;i++)
			{
			document.forms.STUDENT.elements[i].value="";
			}
			
			for(var i=16;i<=24;i++)
			{
			document.forms.STUDENT.elements[i].value="";
			}
		document.getElementById("GENDER_1").checked=false;
		document.getElementById("GENDER_2").checked=false;
		document.getElementById("RELEGION_1").checked=false;
		document.getElementById("RELEGION_2").checked=false;
		document.getElementById("RELEGION_3").checked=false;
		document.getElementById("RELEGION_4").checked=false;
		document.getElementById("TAMIL").checked=false;
		document.getElementById("ENGLISH").checked=false;
		document.getElementById("HINDI").checked=false;
		document.getElementById("OTHERL").checked=false;
		
		document.getElementById("BGROUP").value="";
		document.getElementById("NATIONALITY").value="";
		document.getElementById("EADDRESS").value="";
	}


	function CustomAlert(){
		
		this.render = function(dialog){
			var winW = window.innerWidth;
		    var winH = window.innerHeight;
			var dialogoverlay = document.getElementById('dialogoverlay');
		    var dialogbox = document.getElementById('dialogbox');
			dialogoverlay.style.display = "block";
		    dialogoverlay.style.height = winH+"px";
			dialogbox.style.left = (winW/2) - (550 * .5)+"px";
		    dialogbox.style.top = "100px";
		    dialogbox.style.display = "block";
			document.getElementById('dialogboxhead').innerHTML = "Acknowledge This Message";
		    document.getElementById('dialogboxbody').innerHTML = dialog;
			document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Alert.ok()">OK</button>';
		}
		this.ok = function(){
			document.getElementById('dialogbox').style.display = "none";
			document.getElementById('dialogoverlay').style.display = "none";
			allClear();
		}
			
	}
	var Alert = new CustomAlert();

	function CustomConfirm(){
		
		this.check=function(dialog){
		if(document.getElementById("ID").value=="")
		{
			document.getElementById("ID").className="CONTACT ERR";
		}
		else{
			document.getElementById("ID").className="CONTACT shadow";
			var a=dialog;
			Confirm.render(a)
		}
		}
		this.render = function(dialog){
			var winW = window.innerWidth;
		    var winH = window.innerHeight;
			var dialogoverlay = document.getElementById('dialogoverlay');
		    var dialogbox = document.getElementById('dialogbox');
			dialogoverlay.style.display = "block";
		    dialogoverlay.style.height = winH+"px";
			dialogbox.style.left = (winW/2) - (550 * .5)+"px";
		    dialogbox.style.top = "100px";
		    dialogbox.style.display = "block";
			
			document.getElementById('dialogboxhead').innerHTML = "Confirm that action";
		    document.getElementById('dialogboxbody').innerHTML = dialog;
			document.getElementById('dialogboxfoot').innerHTML = '<button name= "DELETE" onclick="Confirm.yes()">Yes    </button> <button onclick="Confirm.no()">No</button>';
		}
		this.no = function(){
			document.getElementById('dialogbox').style.display = "none";
			document.getElementById('dialogoverlay').style.display = "none";
		}
		this.yes = function(){
			document.forms["STUDENT"].submit();
			
		}
	}
	var Confirm = new CustomConfirm();
