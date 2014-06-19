define([
  'jquery',
  'transit',
  'underscore',
  'backbone',
  'text!templates/home/homeTemplate.html',
  'router',
  'scrollspy',
  'bootstrap'
], function($, transit, _, Backbone, homeTemplate,Scroolspy,Bootstrap){

  var HomeView = Backbone.View.extend({
    el: $("#page"),

    render: function(){

      this.$el.html(homeTemplate);
 
    }

  });

  return HomeView;
  
});
