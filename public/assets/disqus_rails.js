(function() {
  this.DisqusRails = (function() {
    function DisqusRails(attributes) {
      var reset;
      this.short_name = attributes['short_name'];
      this.public_key = attributes['public_key'];
      this.sso = attributes['sso'];
      if (attributes['remote_auth_s3']) {
        this.remote_auth_s3 = attributes['remote_auth_s3'];
      }
      if (attributes['reset']) {
        reset = attributes['reset'];
      }
      this.registerDisqusConfig();
      if (reset) {
        this.isResetting = false;
        this.registerResetFunction();
      }
    }

    DisqusRails.prototype.reset = function() {
      var that;
      if (!this.isResetting) {
        this.isResetting = true;
        that = this;
        return DISQUS.reset({
          reload: true,
          config: function() {
            this.page.identifier = that.disqusable_id;
            return this.page.title = that.disqusable_title;
          }
        });
      }
    };

    DisqusRails.prototype.registerResetFunction = function() {
      return $(document).on("disqus:on_ready", (function(_this) {
        return function() {
          return _this.reset();
        };
      })(this));
    };

    DisqusRails.prototype.registerDisqusConfig = function() {
      var that;
      that = this;
      return window.disqus_config = function() {
        if (that.remote_auth_s3 && that.sso) {
          this.page.remote_auth_s3 = that.remote_auth_s3;
          this.page.api_key = that.public_key;
          this.sso = that.sso;
        }
        this.callbacks.afterRender = [
          function() {
            return $(document).trigger("disqus:after_render");
          }
        ];
        this.callbacks.onInit = [
          function() {
            return $(document).trigger("disqus:on_init");
          }
        ];
        this.callbacks.onNewComment = [
          function() {
            return $(document).trigger("disqus:on_new_comment");
          }
        ];
        this.callbacks.onPaginate = [
          function() {
            return $(document).trigger("disqus:on_paginate");
          }
        ];
        this.callbacks.onReady = [
          function() {
            return $(document).trigger("disqus:on_ready");
          }
        ];
        this.callbacks.preData = [
          function() {
            return $(document).trigger("disqus:pre_data");
          }
        ];
        this.callbacks.preInit = [
          function() {
            return $(document).trigger("disqus:pre_init");
          }
        ];
        return this.callbacks.preReset = [
          function() {
            return $(document).trigger("disqus:pre_reset");
          }
        ];
      };
    };

    DisqusRails.prototype.draw_thread = function(disqusable_id, disqusable_title) {
      this.disqusable_id = disqusable_id;
      this.disqusable_title = disqusable_title;
      window.disqus_shortname = this.short_name;
      window.disqus_title = this.disqusable_title || document.title;
      return (function() {
        var dsq;
        dsq = document.createElement("script");
        dsq.type = "text/javascript";
        dsq.async = true;
        dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js";
        return (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(dsq);
      })();
    };

    return DisqusRails;

  })();

}).call(this);
