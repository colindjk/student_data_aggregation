// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//$.ajax({
           //type: "GET",
           //contentType: "application/json; charset=utf-8",
           //url: 'users',
           //dataType: 'json',
           //success: function (data) {
               //draw(data);
           //},
           //error: function (result) {
               //error();
           //}
       //});

//function draw(data) {

  //// set the dimensions and margins of the graph
  //var margin = {top: 20, right: 20, bottom: 30, left: 40},
      //width = 960 - margin.left - margin.right,
      //height = 500 - margin.top - margin.bottom;

  //// set the ranges
  //var x = d3.scaleBand()
            //.range([0, width])
            //.padding(0.1);
  //var y = d3.scaleLinear()
            //.range([height, 0]);

  //// append the svg object to the body of the page
  //// append a 'group' element to 'svg'
  //// moves the 'group' element to the top left margin
  //var svg = d3.select("body").append("svg")
      //.attr("width", width + margin.left + margin.right)
      //.attr("height", height + margin.top + margin.bottom)
    //.append("g")
      //.attr("transform", 
            //"translate(" + margin.left + "," + margin.top + ")");

  //// get the data
  //// format the data
  //data.forEach(function(d) {
    //d.sales = +d.sales;
  //});

  //// Scale the range of the data in the domains
  //x.domain(data.map(function(d) { return d.user_id; }));
  //y.domain([0, d3.max(data, function(d) { return d.attempts; })]);

  //// append the rectangles for the bar chart
  //svg.selectAll(".bar")
      //.data(data)
    //.enter().append("rect")
      //.attr("class", "bar")
      //.attr("x", function(d) { return x(d.user_id); })
      //.attr("width", x.bandwidth())
      //.attr("y", function(d) { return y(d.attempts); })
      //.attr("height", function(d) { return height - y(d.attempts); });

  //// add the x Axis
  //svg.append("g")
      //.attr("transform", "translate(0," + height + ")")
      //.call(d3.axisBottom(x));

  //// add the y Axis
  //svg.append("g")
      //.call(d3.axisLeft(y));

//}

//function error() {
  //console.log("error");
//}

