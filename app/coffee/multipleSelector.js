// Generated by CoffeeScript 1.7.1
(function() {
  var multipleSelector,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  jQuery.fn.multipleSelector = function(options) {
    return this.each(function(i, element) {
      return new multipleSelector($(element), options);
    });
  };

  multipleSelector = (function() {
    multipleSelector.prototype.defaults = {
      parentSelector: 'ul',
      itemSelector: 'li'
    };

    function multipleSelector(element, options) {
      this.element = element;
      this.switchStatus = __bind(this.switchStatus, this);
      this.options = _.extend(this.defaults, options);
      this.parent = this.element.children(this.options.parentSelector);
      this.item = this.element.children(this.options.itemSelector);
    }

    multipleSelector.prototype.initialize = function() {
      return this.item.on('click', this.switchStatus(this, event));
    };

    multipleSelector.prototype.switchStatus = function(obj, event) {
      event.stopPropagation() && event.preventDefault();
      if ($(obj).hasClass(active)) {
        return $(obj).removeClass(active);
      }
    };

    return multipleSelector;

  })();

}).call(this);
