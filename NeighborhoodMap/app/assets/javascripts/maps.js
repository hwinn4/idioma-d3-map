// MAP
$(function(){

// set width and height vars
var width = 1000,
   height = 1000;

// creates the root svg element

// (basically the canvas)
var svg = d3.select("#map").append("svg")
    .attr("width", width)
    .attr("height", height);

// callback
// nyb is the entire json collection
  d3.json('assets/nycneighborhoods.geojson', function(error, nyb) {

    console.log(nyb)

    // projects spherical coordinate to the Cartesian plane
    var projection = d3.geo.mercator()
            .center([-73.94, 40.70])
            .scale(90000)
            .translate([(width) / 2, (height)/2]);

    // formats the projects for SVG 
    var path = d3.geo.path()
        .projection(projection);

    // "g" is a container el for grouping
    // related graphics elements
    // Grouped objects can be transformed together
    // like a single shape
    // THIS LINE: appends a g tag to the 
    // root svg el
    var g = svg.append("g");

    // appends another g tag
    // to the previous one
    g.append("g")
      .attr("id", "nyc")
      .selectAll(".row") // select all rows in feature collection
      .data(nyb.features) // bind data to each row?
      .enter().append("path") // create path element for each feature
      .attr("d", path) // "d" = path
      .on('click', function(){
        // What is the default?
        d3.event.preventDefault();
        var el = $(this);
        changeColor(el);
        }); 
  });
})

// LISTENERS

$(function(){
  $('.n_name').click(function(){
    var el = $(this);
    changeColor(el);
  });
});


$(function(){
  $('body').on('click', '#hide', (function(){
    $('#deets').remove();
    $('#neighborhood_details').show();
    $("path[style]").css("fill","black");
  })
  )
});

// HELPER FUNCTIONS

function changeColor(el){
  $("path[style]").css("fill","black");
  var name = $(el).text();
  var string = "path[id='" + name + "']";
  var $path = $(string);
  $path.css("fill","green");
  $('#neighborhood_details').hide();
  showData(name);
}

function showData(name){
    var url = "https://data.cityofnewyork.us/resource/w5g7-dwbx.json?geographic_area_neighborhood_tabulation_area_nta_name=" + name;
    $.ajax({
      url: url,
      method: "GET",
      dataType: "JSON"
    }).success(function(data){
      var data_attributes = data[0];
      if (data_attributes){
        var name = data_attributes.geographic_area_neighborhood_tabulation_area_nta_name;
        var borough = data_attributes.geographic_area_borough;
        var pop2010 = data_attributes.total_population_2010_number;
        var html = "<div id='deets' class='neighborhood_info'><p id='hide'>hide</p><h2>" + name + "</h2><h3>Borough: " + borough + "</h3><h3><h3>Population 2010: " + pop2010 + "</h3></div>";
      } else {
        var html = "<div id='deets' class='neighborhood_info'><p id='hide'>hide</p><h2>Sorry! The city forgot about this neighborhood!</h2></div>"
      }
      if ($('#deets')){
          $('#deets').remove();
        }
      $('#info').prepend(html);     
    }) 
}
