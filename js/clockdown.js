/**
 * Created by Administrator on 2017/4/5.
 */
(function ($) {
    $.fn.countDown = function (option) {
        var defaults = {
            container: null,
            text: '距离开抢还剩：',
            endMsg: '活动已结束',
            startTime: 0,
            endTime: 0,
            autoShowDay: true,
            autoShowHour: true,
        },
            _this = $(this);
        var options = $.extend({}, defaults, option);
        var element = "<span class='cd_text'>" + options.text + "</span>" +
                "<em>--</em><span>天</span>" +
                "<em>--</em><span>时</span>" +
                "<em>--</em><span>分</span>" +
                "<em>--</em><span>秒</span>",
            obj = (options.container == null) ? _this:options.container;
        var diff = options.endTime - options.startTime;
        obj.html(element);
        if(diff <= 0){
            return;
        } else {
            var ems = obj.find('em'), spans = obj.find('span');
            d = new Date(), timer = null;
            d.setTime(diff + d.getTimezoneOffset() * 60000);
            var day = Math.floor(diff / (86400 * 1000)), hour = d.getHours(), minute = d.getMinutes(), second = d.getSeconds();
            if (!options.autoShowDay) {
                hour = day*24+hour;
                day = 0;
            }
            ems.eq(0).text(day < 10 ? '0'+day : day);
            ems.eq(1).text(hour < 10 ? '0'+hour : hour);
            ems.eq(2).text(minute < 10 ? '0'+minute : minute);
            ems.eq(3).text(second < 10 ? '0'+second : second);
            function go() {
                second --;
                if (second < 0) {
                    second = 59;
                    minute --;
                    if(minute < 0){
                        minute = 59;
                        hour --;
                        if(hour < 0){
                            hour = 23;
                            day --;
                            if(day < 0){
                                obj.text(options.endMsg);
                                clearTimeout(timer);
                                timer = null;
                            }
                            ems.eq(0).text(day < 10 ? '0'+day : day);
                        }
                        ems.eq(1).text(hour < 10 ? '0'+hour : hour);
                    }
                    ems.eq(2).text(minute < 10 ? '0'+minute : minute);
                }
                ems.eq(3).text(second < 10 ? '0'+second : second);
                if (!options.autoShowDay) {
                    ems.eq(0).hide();
                    spans.eq(1).hide();
                }
                if(!options.autoShowHour) {
                    ems.eq(1).hide();
                    spans.eq(2).hide();
                }
                timer = setTimeout(go, 1000);
            }
            go();
        }
    }
})(jQuery);