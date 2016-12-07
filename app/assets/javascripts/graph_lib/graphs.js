// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function simple_bar_graph(data) {

  // set the dimensions and margins of the graph
  var margin = {top: 20, right: 20, bottom: 30, left: 40},
      width = 960 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  // set the ranges
  var x = d3.scaleBand()
            .range([0, width])
            .padding(0.1);
  var y = d3.scaleLinear()
            .range([height, 0]);

  // append the svg object to the body of the page
  // append a 'group' element to 'svg'
  // moves the 'group' element to the top left margin
  var svg = d3.select("body").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", 
            "translate(" + margin.left + "," + margin.top + ")");

  // Scale the range of the data in the domains
  x.domain(data.map(function(d) { return d.day_of; }));
  y.domain([0, d3.max(data, function(d) { return d.attempts; })]);

  // append the rectangles for the bar chart
  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.day_of); })
      .attr("width", x.bandwidth())
      .attr("y", function(d) { return y(d.attempts); })
      .attr("height", function(d) { return height - y(d.attempts); });

  // add the x Axis
  svg.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  // add the y Axis
  svg.append("g")
      .call(d3.axisLeft(y));

}

// BELOW Helper function section

function is_date(value) {
  var val = parseFloat(value);
  // complicated logic but evaluates to true if NOT number format.
  // In this case that means we have a date.
  return !(!isNaN(value) && (val | 0) === val);
}

// Compares two pieces of data based on their X values.
function compare_x(a, b) {
  if (a.x < b.x)
    return -1;
  if (a.x > b.x)
    return 1;
  return 0;
}

function entitle(object, title) {

}

// ABOVE Helper function section

// 
// note: x and y params refer to margins. 
function compareWithBar(svg, data, x, y) {
  var formatTime = x => x; // TODO: take care of format time which is placed everywhere.
  var div = d3.select("body").append("div")   
    .attr("class", "tooltip")               
    .style("opacity", 0);

  // append the rectangles for the bar chart

  svg.selectAll("dot")
    .data(data)         
    .enter().append("circle")                               
    .attr("r", 5)       
    .attr("cx", function(d) { return x(d.x); })       
    .attr("cy", function(d) { return y(d.y); })     
    .on("mouseover", function(d) {
      div.transition()        
        .duration(100)      
        .style("opacity", 1);      
      div.html(" x: " + formatTime(d.x) + "<br/>" + " y: " + d.y)
        .style("left", (d3.event.pageX) + "px")     
        .style("top", (d3.event.pageY - 28) + "px");    
    })                  
    .on("mouseout", function(d) {       
      div.transition()        
        .duration(300)      
        .style("opacity", 0);   
    })
    .attr("fill", old => "red");
}

// Assumes "x" and "y" are of same length.
// Param x_data is the data for x-axis.
// Param y_data for y-axis.
// Param "tag" is a JSON object array which will be the data displayed on-hover if
// such data is given.
function bar_graph_basic(title, x_data, y_data, config) {
  // --- BELOW --- Copy-able between current graphs.
  // TODO: Turn contained into separate function?
  var data = [];
  var formatTime = x => x;

  for (var i = 0; i < x_data.length; i++) {
    var d = { x : "", y : "" };
    d.x = x_data[i];
    d.y = y_data[i];
    data.push(d);
  }

  // set the dimensions and margins of the graph
  var margin = {top: 20, right: 20, bottom: 30, left: 40},
      width = 960 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  // set the ranges
  var x = d3.scaleBand()
            .range([0, width])
            .padding(0.1);
  var y = d3.scaleLinear()
            .range([height, 0]);

  // append the svg object to the body of the page
  // append a 'group' ('g') element to 'svg'
  // moves the 'group' element to the top left margin
  var svg = d3.select("body").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", 
            "translate(" + margin.left + "," + margin.top + ")");

  // Scale the range of the data in the domains
  x.domain(x_data);
  y.domain([0, d3.max(y_data)]);

  var div = d3.select("body").append("div")   
    .attr("class", "tooltip")               
    .style("opacity", 0);

  // --- ABOVE --- Copy-able between current graphs.

  // append the rectangles for the bar chart
  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.x); }) // uses 'x' as function
      .attr("width", x.bandwidth())
      .attr("y", function(d) { return y(d.y); })
      .attr("height", function(d) { return height - y(d.y); })
      // --- BELOW --- code is temporary (shared) until a working d3-tip is resolved.
      .on("mouseover", function(d) {
        div.transition()        
          .duration(100)      
          .style("opacity", 1);      
        div.html(" x: " + formatTime(d.x) + "<br/>" + " y: " + d.y)  
          .style("left", (d3.event.pageX) + "px")     
          .style("top", (d3.event.pageY - 28) + "px");    
      })                  
      .on("mouseout", function(d) {       
        div.transition()        
          .duration(300)      
          .style("opacity", 0);   
      });
      // --- ABOVE --- 

  // --- BELOW --- Sync 

  // add the x Axis
  svg.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  // add the y Axis
  svg.append("g")
      .call(d3.axisLeft(y));

  svg.append("text")
      .attr("x", (width / 2))             
      .attr("y", 0 - (margin.top / 2))
      .attr("text-anchor", "middle")  
      .style("font-size", "14px") // larger fonts cause breakage.
      .style("text-decoration", "underline")  
      .text(title);


  svg.compareWith = function(x_data, y_data) {
    var data = [];

    for (var i = 0; i < x_data.length; i++) {
      var d = { x : "", y : "" };
      d.x = x_data[i];
      d.y = y_data[i];
      data.push(d);
    }

    compareWithBar(this, data, x, y);
  };

  return svg;
  // --- ABOVE --- Sync 
}

// 
// note: x and y params refer to margins. 
function compareWithPlot(svg, data, x, y) {
  var formatTime = x => x; // TODO: take care of format time which is placed everywhere.
  var div = d3.select("body").append("div")   
    .attr("class", "tooltip")               
    .style("opacity", 0);

  svg.selectAll("dot")
    .data(data)         
    .enter().append("circle")                               
    .attr("r", 5)       
    .attr("cx", function(d) { return x(d.x); })       
    .attr("cy", function(d) { return y(d.y); })     
    .on("mouseover", function(d) {
      div.transition()        
        .duration(100)      
        .style("opacity", 1);      
      div.html(" x: " + formatTime(d.x) + "<br/>" + " y: " + d.y)
        .style("left", (d3.event.pageX) + "px")     
        .style("top", (d3.event.pageY - 28) + "px");    
    })                  
    .on("mouseout", function(d) {       
      div.transition()        
        .duration(300)      
        .style("opacity", 0);   
    })
    .attr("fill", old => "red");
}

// Basic x / y plot graph
function plot_graph_sorted(title, x_data, y_data, tag) {
  // --- BELOW --- Copy-able between current graphs.
  // TODO: Turn contained into separate function?
  var data = [];
  var formatTime;
  if (is_date(x_data[0])) {
    x_data.map(x => Date.parse(x));
    formatTime = d3.timeFormat("%e %B");
  }

  for (var i = 0; i < x_data.length; i++) {
    var d = { x : "", y : "" };
    d.x = x_data[i];
    d.y = y_data[i];
    data.push(d);
    formatTime = x => x;
  }

  data = data.sort(compare_x);
  var outlier = data.pop();

  // set the dimensions and margins of the graph
  var margin = {top: 20, right: 20, bottom: 30, left: 40},
      width = 960 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  // set the ranges
  var x = d3.scaleBand()
            .range([0, width])
            .padding(0.1);
  var y = d3.scaleLinear()
            .range([height, 0]);

  // append the svg object to the body of the page
  // append a 'group' ('g') element to 'svg'
  // moves the 'group' element to the top left margin
  var svg = d3.select("body").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", 
            "translate(" + margin.left + "," + margin.top + ")");

  // Scale the range of the data in the domains
  x.domain(data.map(d => d.x));
  y.domain([0, d3.max(data.map(d => d.y))]);

  var div = d3.select("body").append("div")   
    .attr("class", "tooltip")               
    .style("opacity", 0);

  // --- ABOVE --- Copy-able between current graphs.

  svg.selectAll("dot")    
    .data(data)         
      .enter().append("circle")                               
      .attr("r", 5)       
      .attr("cx", function(d) { return x(d.x); })       
      .attr("cy", function(d) { return y(d.y); })     
      // --- BELOW --- code is temporary (shared) until a working d3-tip is resolved.
      .on("mouseover", function(d) {
        div.transition()        
          .duration(100)      
          .style("opacity", 1);      
        div.html(" x: " + formatTime(d.x) + "<br/>" + " y: " + d.y)  
          .style("left", (d3.event.pageX) + "px")     
          .style("top", (d3.event.pageY - 28) + "px");    
      })                  
      .on("mouseout", function(d) {       
        div.transition()        
          .duration(300)      
          .style("opacity", 0);   
      });
      // --- ABOVE --- 

  // --- BELOW --- Sync 

  // add the x Axis
  svg.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  // add the y Axis
  svg.append("g")
      .call(d3.axisLeft(y));

  svg.append("text")
      .attr("x", (width / 2))             
      .attr("y", 0 - (margin.top / 2))
      .attr("text-anchor", "middle")  
      .style("font-size", "14px") // larger fonts cause breakage, to fix this increase top margin.
      .style("text-decoration", "underline")  
      .text(title);

  svg.compareWith = function(x_data, y_data) {
    var data = [];

    for (var i = 0; i < x_data.length; i++) {
      var d = { x : "", y : "" };
      d.x = x_data[i];
      d.y = y_data[i];
      data.push(d);
    }

    compareWithPlot(this, data, x, y);
  };

  return svg;
  // --- ABOVE --- Sync 
}

function error() {
  console.log("error");
}

//  var tip = d3.tip()
//    .attr('class', 'd3-tip')
//    .offset([-10, 0])
//    .html(function(d) {
//      return "<strong>Date:</strong> <span style='color:red'>" + d.x + "</span>";
//  });
//
//  svg.call(tip);
//
//  svg.selectAll("...")
//    .on('mouseover', tip.show)
//    .on('mouseout', tip.hide);
