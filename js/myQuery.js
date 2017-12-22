function $(selector){
	return document.querySelectorAll(selector);
}
HTMLElement.prototype.fimd=function(selector){
	return this.querySelectorAll(selector)
}