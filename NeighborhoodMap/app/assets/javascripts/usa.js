$(function(){
    
     var width = 960,
        height = 500;

    var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height);

    var path = d3.geo.path();

    var color = d3.scale.category20b();

    var g = svg.append("g");

    // path data
    d3.json("assets/us.json", function(unitedState) {
      debugger;
      var data = topojson.feature(unitedState, unitedState.objects.states).features;
      neighbors = topojson.neighbors(unitedState.objects.states.geometries);
      // our names
      d3.tsv("assets/us-state-names.tsv", function(tsv){
        // create hash of the names and ids
        var names = {};
        tsv.forEach(function(d,i){
          names[d.id] = d.name;
        });
    
   
    // build paths
    g.append("g")
      .attr("class", "states-bundle")
      .selectAll("path")
      .data(data)
      .enter()
      .append("path")
      .attr("d", path)
      .style("fill", function(d, i) { return color(d.color = d3.max(neighbors[i], function(n) { return data[n].color; }) + 1 | 0); })
      .attr("stroke", "white")
      .attr("class", "states");

    // add state names
     g.append("g")
      .attr("class", "states-names")
      .selectAll("text")
      .data(data)
      .enter()
      .append("svg:text")
      .text(function(d){
        return names[d.id];
      })
      .attr("x", function(d){
          return path.centroid(d)[0];
      })
      .attr("y", function(d){
          return  path.centroid(d)[1];
      })
      .attr("text-anchor","middle")
      .attr('fill', 'white');
         })
     })

    
});

// END MAP

