# -*- coding: utf-8 -*-
module HBFav2
  class RefreshControl < UIRefreshControl
    def init
      super
      if self
        if UIDevice.currentDevice.ios7?
          self.backgroundColor = '#e2e7ed'.uicolor
        end
      end
      self
    end

    def update_title(msg = nil)
      unless UIDevice.currentDevice.ios7?
        color = "#678"
        shadow = NSShadow.new
        shadow.shadowOffset = [0, 1]
        shadow.shadowColor = UIColor.whiteColor
        if msg
          self.attributedTitle = msg.attrd.shadow(shadow).foreground_color(color)
        else
          formatter = NSDateFormatter.new
          formatter.dateFormat = "MM/dd HH:mm"
          now = formatter.stringFromDate(NSDate.new)
          self.attributedTitle = "最終更新 : #{now}".attrd.shadow(shadow).foreground_color(color)
        end
      end
    end
  end
end
