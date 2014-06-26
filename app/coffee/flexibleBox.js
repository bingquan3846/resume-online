// Generated by CoffeeScript 1.7.1
(function() {
  var $;

  $ = jQuery;

  this.parent = $(this).is("body") ? $(window) : $(this);

  this.objectHeight = [];

  this.objectTop = [];

  this.totalNumber = 0;

  $.fn.flexibleBox = function(options) {
    var arrangeObjects, calculateColumnWith, objects, process, setCssObject, settings;
    objects = $(this).children(".box");
    settings = $.extend({
      maxColumns: 3,
      breakingWidth: [300, 700, 1024],
      minColumnWidth: "300",
      maxWidth: "1024",
      gapWidth: "10",
      columnWidth: 0,
      column: 4
    }, options);
    calculateColumnWith = function() {
      var breaking, i, pwidth, _i, _len, _ref;
      pwidth = $(this.parent).width();
      if (pwidth >= settings.maxWidth) {
        settings.column = settings.maxColumns;
        settings.columnWidth = (settings.maxWidth - settings.maxColumns * settings.gapWidth) / settings.column;
      } else {
        pwidth = $(window).width();
        _ref = settings.breakingWidth;
        for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
          breaking = _ref[i];
          if (pwidth > settings.breakingWidth[i] && pwidth < settings.breakingWidth[i + 1] && settings.breakingWidth[i + 1]) {
            settings.column = i + 1;
          }
        }
        settings.columnWidth = (pwidth - settings.gapWidth * settings.column) / settings.column;
      }
      return null;
    };
    setCssObject = function(obj, i) {
      var col, j, k, n, ratio, top, tops, _i, _j, _k, _l;
      ratio = $(obj).attr("data-ratio") ? parseInt($(obj).attr("data-ratio")) : 0;
      col = $(obj).attr("data-column") ? parseInt($(obj).attr("data-column")) : 1;
      if (col >= settings.column) {
        col = settings.column;
      }
      k = Math.floor(this.totalNumber / settings.column);
      j = (this.totalNumber - col) % settings.column;
      console.log(this.totalNumber + col);
      console.log((k + 1) * settings.column);
      if (this.totalNumber + col > (k + 1) * settings.column) {
        col = (k + 1) * settings.column - this.totalNumber;
      }
      this.totalNumber += col;
      $(obj).css("position", "absolute");
      if (ratio === 1) {
        $(obj).height(settings.columnWidth * col);
      } else {
        $(obj).height($(obj).attr("data-height"));
      }
      $(obj).width(settings.columnWidth * col + settings.gapWidth * (col - 1));
      for (i = _i = 1; 1 <= col ? _i <= col : _i >= col; i = 1 <= col ? ++_i : --_i) {
        this.objectHeight.push(parseInt($(obj).height()));
      }
      k = Math.floor((this.totalNumber - 1) / settings.column);
      j = (this.totalNumber - col) % settings.column;
      $(obj).css('left', (settings.gapWidth / 2) + j * settings.columnWidth + j * settings.gapWidth);
      if (k !== 0) {
        tops = [];
        for (n = _j = col; col <= 1 ? _j <= 1 : _j >= 1; n = col <= 1 ? ++_j : --_j) {
          tops.push(parseInt(this.objectTop[this.totalNumber - settings.column - n]) + this.objectHeight[this.totalNumber - settings.column - n]);
        }
        top = Math.max.apply(Math, tops) + parseInt(settings.gapWidth);
        $(obj).css('top', top);
        for (n = _k = col; col <= 1 ? _k <= 1 : _k >= 1; n = col <= 1 ? ++_k : --_k) {
          this.objectTop.push(top);
        }
      } else {
        $(obj).css('top', 0);
        for (n = _l = col; col <= 1 ? _l <= 1 : _l >= 1; n = col <= 1 ? ++_l : --_l) {
          this.objectTop.push(0);
        }
      }
      console.log(this.objectTop);
      return null;
    };
    arrangeObjects = function() {
      var i, object, _i, _len;
      this.objectHeight = [];
      this.objectTop = [];
      this.totalNumber = 0;
      for (i = _i = 0, _len = objects.length; _i < _len; i = ++_i) {
        object = objects[i];
        setCssObject(object, i);
      }
      return null;
    };
    process = function() {
      calculateColumnWith();
      return arrangeObjects();
    };
    return process();
  };

}).call(this);
