var binColors = ["#F0F0E0", "#FFFFE0"];
var rosterColors = ["#F0F0E0", "#FFFFE0"];
// var binColors = ["#F0F0E0", "#FFF8F0"];

// here we assume that data is a list of objects
function getStudents(data) {
	// debugger;
	return _.uniq(_.map(data, function(x) { return x.user_name; }).sort(), true);
}

function getLessons(data) {
	// debugger;
	return _.uniq(
		_.sortBy(_.map(_.filter(data, function(x) { return x.lesson_id > 0; }), 
			function(x) { return {"lesson_name": x.lesson_name, 
			"lesson_id": x.lesson_id }; } ),
		function(x) { return x.lesson_id; }),
		true, function(x) { return x.lesson_id; });
}

// we will use this to generate data we will be binding
// to the lesson bins
// Returns an array of data extending the array of objects returned by getLessons with
// num_students and lesson_data
function setupLessonData(data) {
	var bin_data = getLessons(data);
	var lesson_data_hash = byLesson(data);
	_.each(bin_data, function(x) { 
		x.num_students = _.uniq(lesson_data_hash[x.lesson_name], false, function(y) { return y.user_name; }).length;
		x.lesson_data = lesson_data_hash[x.lesson_name];
	});
	// debugger;
}

function byLesson(data) {
	return _.groupBy(_.filter(data, function(x) { return x.lesson_id > 0; }), 'lesson_name');
}

function renderRoster(error, data) {
}

function renderResponses(error, data) {
	var students = getStudents(data);
	console.log("uniq student names ", students);
	var lessons = getLessons(data);
	console.log("uniq lesson names ", lessons);
	var bylesson = byLesson(data);
	console.log("student data by lesson ", bylesson);
	var lesson_data = setupLessonData(data);
	
	var that = this;
	var lessonParams = {
		numLessons: 3,
		numStudents: 5
	};
	var binWidth = 150;
	var binHeight = 500;
	data = data.slice(0,5);
	console.log(data);
	console.log(binColors);
	console.log("Length of data is ", data.length);
	console.log("Number of lessons is ", lessonParams.numLessons);
	var svg = d3.select('.progview-main');
	var lessonBins = svg.select(".lesson-bin-g").selectAll(".lesson-bin")
	.data(data)
	.enter().append("rect")
	.attr("x", function(d, i) { return (i) * binWidth; })
	.attr("class", "hour bordered")
	.attr("width", binWidth)
	.attr("height", binHeight)
	.style("fill", function(d, i) { return binColors[i % 2]; });
}	

$(document).ready(function() {
	this.container = d3.select('.progview-main');
	// d3.json('/responses', function(error, data) {
	// 	console.log("Length of data is ", data.length);
	// });
d3.json('/responses1', renderResponses);

$('#sign-in').on('click',function(e){
	e.preventDefault()
	var loginBox = $('.login-popup')
	$(loginBox).fadeIn(300);

  // Add the mask to body
  $('body').append('<div id="mask"></div>');
  $('#mask').fadeIn(300);
  })

$('a.close, #mask').on('click', function(e) { 
	e.preventDefault();
	$('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
});


});


