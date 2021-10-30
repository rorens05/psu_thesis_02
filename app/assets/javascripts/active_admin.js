//= require active_admin/base
//= require active_admin_flat_skin
//= require select2
//= require select2-full
//= require jquery
//= require jquery_ujs
//= require game_timer
//= require google_map
//= require chartkick
//= require Chart.bundle

jQuery(function() { 
  $("#quiz_game_status, #quiz_game_city_id, #quiz_game_sponsor_id, #quiz_game_radio_station_id").select2({
    height: "1000px"
  })
  $("#coastal_area_barangay_id").select2()
  $("#user_province_id").select2()
  $("#user_city_id").select2()
  $("#radio_station_city_id").select2()
  $(".station_city_select").select2()
  $("#roulette_city_id").select2()
  $("#roulette_radio_station_id").select2()
  $("#roulette_dj_id").select2()
  $("#roulette_sponsor_id").select2()
  $("#roulette_city_ids").select2()
})

document.addEventListener("turbolinks:load", function() {
  
});

$(document).on('ready turbolinks:load', function() {
  console.log("testing")
});


document.addEventListener("DOMContentLoaded", function() {

  let filter = document.querySelector("#diplay-filter");
  console.log({filter})
  $("#coastal_area_barangay_id").select2()

  $("#notify-user").on("change", (e) => {
    const checked = $("#notify-user").is(':checked')
    console.log({checked})
    if(checked){
      $("#force-update").removeClass("hide")
    }else{
      $("#force-update").addClass("hide")
    }
  })

  
  $("#roulette_location_restriction").on("change", (e) => {
    if($("#roulette_location_restriction").is(':checked')){
      $("#roullete_location_restriction").removeClass("hide")
    }else{
      $("#roullete_location_restriction").addClass("hide")
    }
  })
  
  initLobby()
});

