// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require highcharts
//= require twitter/bootstrap


$(document).ready(function() {
	var names = ['home', 'sprints','projects', 'tasks', 'statuses','responsibles','points'];
	var url = document.URL;
	
	for (var i = 0; i < names.length; i++){
		var page = url.lastIndexOf(names[i]);
		if (page != -1){
			$("#" + names[i]).addClass("active");
		}
	}
});