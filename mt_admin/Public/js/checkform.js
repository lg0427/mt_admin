String.prototype.isMobile = function(){
	return /^1[34578]\d{9}$/.test(this);
}
String.prototype.isTel = function(){
	return /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/.test(this);
}
String.prototype.isEmail = function(){
	return /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(this);
}
String.prototype.isQQ = function(){
	return /^[1-9][0-9]{4,11}$/.test(this);
}
String.prototype.isUrl = function(){
	return /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/.test(this);
}
String.prototype.isIDCard = function(){
	return /(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(this);
}
String.prototype.isUserEasy = function(){
	return /^[a-z0-9_-]{3,16}$/.test(this);
}
String.prototype.isPwdEasy = function(){
	return /^[a-zA-Z0-9_-]{6,18}$/.test(this);
}
String.prototype.gblen = function(){ 
	var len = 0;  
	for(var i=0; i<this.length; i++){
		if(this.charCodeAt(i) > 127 || this.charCodeAt(i) == 94){
			len += 2;
       	}else{
     		len ++;
       	}
    }
    if(len < 10 || len > 200)
    {
    	return false;
    }
    return true;
}