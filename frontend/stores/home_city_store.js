var AppDispatcher = require('../dispatcher/dispatcher.js');
var Store = require('flux/utils').Store;

var HomeCityStore = new Store(AppDispatcher);

var _allHomeCities = [];
var _currentHomeCity = {};

HomeCityStore.__onDispatch = function (payload) {
  switch(payload.actionType) {
    case "ALL_CITITES":
    	HomeCityStore.updateAllCities(payload.index);
      break;
    case "CURRENT_CITY":
      HomeCityStore.updateCurrentCity(payload.item);
  }
};

HomeCityStore.updateAllCities = function(homeCities){
	_allHomeCities = homeCities;
  HomeCityStore.__emitChange();
};

HomeCityStore.updateCurrentCity = function(homeCity){
  _currentHomeCity = homeCity;
  HomeCityStore.__emitChange();
};

HomeCityStore.currentHomeCity = function(){
  if (_currentHomeCity) {
  	return $.extend({}, _currentHomeCity);
  }
};

HomeCityStore.all = function(){
  return [].slice.call(_allHomeCities);
};

HomeCityStore.findIdOf = function(cityName){
  var id;
  Object.keys(_allHomeCities).forEach(function(cityId){
    if (_allHomeCities[cityId].name === cityName){
      id = parseInt(cityId) + 1;
    }
  });
  return id;
};

window.HomeCityStore = HomeCityStore;

module.exports = HomeCityStore;
