var createSlug = function(stateName){
  return stateName.toLowerCase().split(" ").join("-");
};

$(function(){


     var width = 960,
        height = 500;

    var svg = d3.select("#usaMap").append("svg")
            .attr("width", width)
            .attr("height", height);

    var path = d3.geo.path();

    var color = d3.scale.category20b();

    var g = svg.append("g");



    // path data
    d3.json("assets/us.json", function(unitedState) {
      var num = 0;
      var data = topojson.feature(unitedState, unitedState.objects.states).features;
      neighbors = topojson.neighbors(unitedState.objects.states.geometries);
      // our names
      d3.tsv("assets/us-state-names.tsv", function(tsv){
        // create hash of the names and ids
        var names = {};
        tsv.forEach(function(d,i){
          // uses the names hash from the tsv file
          var sluggedName = createSlug(d.name);
          names[d.id] = sluggedName;
        });


    // build paths
    g.append("g")
      .attr("class", "states-bundle")
      .selectAll("path")
      .data(data)
      .enter()
      .append("path")
      .attr("id", (function(d){
        // d is the json file
        for (var i = 0; i < 53; i++){
          return names[d.id];
        }

      }))
      .attr("d", path)
      .style("fill", "gray")
        // function(d, i) { return color(d.color = d3.max(neighbors[i], function(n) { return data[n].color; }) + 1 | 0); })
      .attr("stroke", "black")
      // .attr("class", "states")
      .on('click', function(){
        // $('.state_name').text(this.id);
        // debugger;
        displayStateInfo(this.id);
        $('#key').hide();
        $('path').css('fill', 'gray');
        $(this).css("fill", "turquoise");
        });

    // add state names
     // g.append("g")
     //  .attr("class", "states-names")
     //  .selectAll("text")
     //  .data(data)
     //  .enter()
     //  .append("svg:text")
      // .text(function(d){
      //   // debugger;
      //   return names[d.id];
      // })
      // .attr("x", function(d){
      //     return path.centroid(d)[0];
      // })
      // .attr("y", function(d){
      //     return  path.centroid(d)[1];
      // })
      // .attr("text-anchor","middle")
      // .attr('fill', 'white');
         })
     })


});

// END MAP

// LISTENERS

$(function(){

 $('.state-choice').on('click', function(){
  console.log("click");
    var state = $(this).text();
    displayStateInfo(state);
    $('path').css('fill', 'gray');
    var selector = "#" + createSlug(state);
    $(selector).css("fill", "turquoise");
    });


  $('.view_option').click(function(){
    var id = this.id;
    colorCodeMap(id);
  });

  $('body').on('click','#reset', function(){
    $('path').css("fill", "gray");
    $("#display-key").empty();
    $("#state_data").empty();
    $('#about').show();
  })

  $('.dropdown-toggle').dropdown();

  // Fix input element click problem
  $('.dropdown input, .dropdown label').click(function(e) {
    e.stopPropagation();
  });



});
