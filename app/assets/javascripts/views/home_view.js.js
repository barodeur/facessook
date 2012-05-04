(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.HomeView = (function() {

    function HomeView() {
      this.toggle = __bind(this.toggle, this);
      var _this = this;
      setTimeout(this.toggle, 3000);
      $('body').click(function() {
        return _this.toggle();
      });
    }

    HomeView.prototype.toggle = function() {
      if (!this.toggled) {
        this.toggled = true;
        $('body').unbind('click');
        return $('body').append(JST['templates/warning']());
      }
    };

    return HomeView;

  })();

}).call(this);
