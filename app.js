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

function changeColor(el){
  $("path[style]").css("fill","black");
  var name = $(el).text();
  var string = "path[id='" + name + "']";
  var $path = $(string);
  $path.css("fill","blue");
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