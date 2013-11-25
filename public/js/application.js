var binColors = ["#F0F0E0", "#FFFFE0"];
var tagColors = ["#80D0E0"];
var rosterColors = ["#F0F0E0", "#FFFFE0"];
// var binColors = ["#F0F0E0", "#FFF8F0"];

var margin = { top: 50, right: 0, bottom: 100, left: 30 };
var width = 960 - margin.left - margin.right;
var height = 430 - margin.top - margin.bottom;

function placeLessonBinSVG() {
	var svg = d3.select(".progview-container").append("svg")
		.attr("class", "progview-main")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
		.attr("class", "lesson-bin-g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	// debugger;
	return svg;
}

function getLessonBinSVGDimensions() {
	return d3.select(".progview-container svg")[0][0].getBoundingClientRect();
}

// here we assume that data is a list of objects
function getStudents(data) {
	return _.uniq(_.map(data, function(x) { return x.user_name; }).sort(), true);
}

function getLessons(data) {
	return _.uniq(
		_.sortBy(_.map(_.filter(data, function(x) { return x.lesson_id > 0; }), 
			function(x) { return {"lesson_name": x.lesson_name, 
			"lesson_id": x.lesson_id }; } ),
		function(x) { return x.lesson_id; }),
		true, function(x) { return x.lesson_id; });
	// return _.uniq(
	// 	_.sortBy(_.map(data,
	// 				   function(x) { return {"lesson_name": x.lesson_name, 
	// 										 "lesson_id": x.lesson_id }; } ),
	// 			 function(x) { return x.lesson_id; }),
	// 	true, function(x) { return x.lesson_id; });
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
	return bin_data;

}

function byLesson(data) {
	return _.groupBy(_.filter(data, function(x) { return x.lesson_id > 0; }), 'lesson_name');
	// return _.groupBy(data, 'lesson_name');
}

function byStudent(data) {
	var grouped_data = _.groupBy(data, 'user_name');
	_.each(grouped_data, function(x) { x.sort( function(a, b) { return parseInt(a, 10) - parseInt(b, 10); } ); });
	return grouped_data;
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
	var all_lesson_data = setupLessonData(data);
	var that = this;
	var lessonParams = {
		numLessons: 3,
		numStudents: 5
	};
	var binWidth = 150;
	var binHeight = 500;
	var tagWidth = 150;
	var tagHeight = 40;
	data = data.slice(0,5);
	console.log(data);
	console.log(binColors);
	console.log("Length of data is ", data.length);
	console.log("Number of lessons is ", lessonParams.numLessons);

	// var svg = d3.select('.progview-main');
	var svg = placeLessonBinSVG(); // currently selects g inside svg
	var binXFn = function(d, i) { return (i) * binWidth; };
	var binTranslateFn = function(d, i) { return "translate(" + binXFn(d, i) + ", 0)"; };
    var lessonBins = svg.selectAll(".lesson-bin")
        .data(all_lesson_data)
        .enter().append("g")
		.attr("class", "bin-group")
		.attr("id", function(d, i) { return "lesson-bin-" + d.lesson_id; })
		.attr("transform", binTranslateFn)
		.append("rect")
        .attr("class", "bin-canvas")
        .attr("width", binWidth)
        .attr("height", binHeight)
        .style("fill", function(d, i) { return binColors[i % 2]; });
	var getStudentCssClass = function(d, i) { return "student-" + d.user_id; };
	var total_height = getLessonBinSVGDimensions().height;

	// to get the max and min time, we use the original data event array
	var getMaxTime = function(summary_data) {
		return _.max(summary_data, function(x) { return parseInt(x.latest.created_at_epoch, 10); });
	};
	var getMinTime = function(summary_data) {
		return _.min(summary_data, function(x) { return parseInt(x.earliest.created_at_epoch, 10); });
	};
	
	for (var i = 0; i < all_lesson_data.length; i++) {
		var d = all_lesson_data[i];
		var bin = d3.select("#lesson-bin-" + d.lesson_id);
		var sd = byStudent(d.lesson_data);
		all_lesson_data[i].by_student = sd;
		var sd_summary = {};
		for (var key in sd) {
			if (typeof sd_summary[key] === 'undefined') sd_summary[key] = {};
			sd_summary[key].earliest = sd[key][0];
			sd_summary[key].latest = sd[key][sd[key].length - 1];
			sd_summary[key].num_events = sd[key].length;
		}
		all_lesson_data[i].summary_by_student = sd_summary;
		console.log("summary in this bin: ", sd_summary);
		// figure out the time scale for this bin
		var maxt = getMaxTime(sd_summary).latest;
		var mint = getMinTime(sd_summary).earliest;
		 console.log("max time is ", maxt.created_at, "; min time is ", mint.created_at, "; delta is ", maxt.created_at_epoch - mint.created_at_epoch);
		var tscale = d3.scale.linear()
			.domain([mint.created_at_epoch, maxt.created_at_epoch])
			.range([0, total_height]);
	
		bin.selectAll(".student-tag")
			.data(d.lesson_data)
			.enter()
			.append("rect")
			.attr("class", getStudentCssClass)
			.style("fill", tagColors[0])
			.attr("y", function(datum) { return tscale(datum.created_at_epoch); })
			.attr("width", tagWidth)
			.attr("height", tagHeight);
	} // end bin loop

}	

$(document).ready(function() {
	this.container = d3.select('.progview-main');
	// d3.json('/responses', function(error, data) {
	// 	console.log("Length of data is ", data.length);
	// });
d3.json('/responses1', renderResponses);

//ANSWER FEED
buildAnswerFeed( testJSON );

//SIGN IN 

$('#sign-in').on('click',function(e){
	e.preventDefault()
	var loginBox = $('.sign-in')
	$(loginBox).fadeIn(300);

  // Add the mask to bo dy
  $('body').append('<div id="mask"></div>');
  $('#mask').fadeIn(300);
  })

$('#register').on('click',function(e){
	e.preventDefault()
	var loginBox = $('.sign-up')
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


