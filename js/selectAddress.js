// created By zshejxing@163.com
(function($){
    $.fn.selectAddress = function(config){
        config = $.extend({
            addressBook: $.fn.selectAddress.addressBook[0],
            level: 4,
            mustSelect: true,
            name: 'address_name',
            value: 'address_value',
            slave: [],
            master: null,
            changeAfter: $.noop
        }, config);
        var sels = [], selectBox = $(this), self = this, form = selectBox.closest('form');
        this.config = config;
        this.id = $.fn.selectAddress.getId();
        if(!(selectBox.addressName = $('input[name="'+config.name+'"]', form)).length){
            selectBox.addressName = $('<input type="hidden" value="" name="'+config.name+'">');
            selectBox.append(selectBox.addressName);
        }
        if(!(selectBox.addressValue = $('input[name="'+config.value+'"]', form)).length){
            selectBox.addressValue = $('<input type="hidden" value="" name="'+config.value+'">');
            selectBox.append(selectBox.addressValue);
        }
        var notEmpty = function(l){
            for(var i in l){
                return true;
            }
            return false;
        }, getFirstIndex = function(l){
            for(var i in l){
                return i;
            }
        };
        var add = function(arear){
            var mustStr = '';
            if(config.mustSelect){
                mustStr += ' minlength="1"';
                mustStr += ' errmsg="该项必选"';
                mustStr += ' validate=".+"';
            }
            selectBox.append('<select name="address_'+sels.length+'"'+mustStr+'></select>');
            var sel = $("select:last", selectBox)[0];
            $.extend(sel, {
                clear: function(){
                    this.length = 0;
                },
                del: function(){
                    this.disabled = true;
                    if(this.options.length)this.options[0].selected = true;
                    $(this).hide();
                },
                push: function(al){
                    var p = function(t, v){
                        sel.options[sel.options.length] = new Option(t, v);
                    };
                    this.clear();
                    this.add();
                    if(notEmpty(al)){
                        if(getFirstIndex(al) != '')p('...', '');
                        for(var i in al){
                            p(al[i], i);
                        }
                        if(sel.options.length == 2){
                            sel.del();
                            sel.options[1].selected = true;
                            sel.alter();
                        }
                    }else{
                        sel.del();
                    }
                },
                add: function(){
                    this.disabled = false;
                    $(this).stop(true, true).show('fast');
                },
                refresh: function(){
                    if(!config.level || this.index <= config.level){
                        var data = this.getChildData();
                        if(this.index < sels.length){
                            for(var i = this.index+1;i<sels.length;i++){
                                sels[i].del();
                            }
                            sels[sel.index].push(data);
                        }else{
                            add(data);
                        }
                    }
                    if(self._v)self.setValue(self._v);
                },
                getChildData: function(){
                    if($.fn.selectAddress.addressBook[this.value])return $.fn.selectAddress.addressBook[this.value];
                    $.fn.selectAddress.getAlFromServer(this);
                    return {'': '请稍侯...'};
                },
                getText: function(){
                    var text = (this.options.length == 1 || this.value == "" || this.selectedIndex <= 0 || $(this)[0].disabled)?"": this.options[this.selectedIndex].text;
                    if(text == '直辖区域')text = '';
                    return text;
                },
                getValue: function(){
                    return (this.options.length == 1 || this.value == "" || this.selectedIndex <= 0)?"": this.value;
                },
                alter: function(){
                    if(this.value == ""){
                        for(var i=this.index;i<sels.length;i++)sels[i].del();
                    }else{
                        sel.refresh();
                    }
                    selectBox.addressName.val(self.getString());
                    selectBox.addressValue.val(self.getValue());
                    config.changeAfter.apply(self);
                }
            });
            $(sel).bind('change.address_select', function(){
                sel.alter();
                self.controlSlave();
            });
            sel.index = sels.push(sel);
            sel.push(arear);
        };
        $.extend(this, {
            clear: function(){
                sels[0].push(config.addressBook);
            },
            setString: function(s){

            },
            setValue: function(v){
                var value = (v || '').split(/ *, */);
                self._v = null;
                var set = function(i){
                    if(!sels[i] || i >= value.length)return false;
                    if(sels[i].value == value[i] && i < value.length - 1)return set(++i);
                    for(var o = sels[i].options.length - 1;o > 0; o--){
                        if(sels[i].options[o].value == value[i]){
                            sels[i].options[o].selected = true;
                            sels[i].alter();
                            return set(++i);
                        }
                    }
                    if(sels[i].options.length == 1)self._v = v;
                    return false;
                };
                if(sels.length == 0){
                    setTimeout((function(s){return function(){s.setValue(v);};})(this), 500);
                }else{
                    set(0);
                }
            },
            getString: function(){
                var str = '';
                for(var i = 0;i<sels.length;i++){
                    str += sels[i].getText();
                }
                return str;
            },
            getValue: function(){
                var l = sels.length, v = '';
                for(var i=0;i<l;i++){
                    if(!sels[i].getValue()){
                        break;
                    }else{
                        v += ', '+sels[i].getValue();
                    }
                }
                return v.replace(/^, /, '');
            },
            freeSlave: function(slave){
                for(var i in config.slave){
                    if(config.slave[i].id === slave.id){
                        config.slave.splice(i, 1);
                    }
                }
            },
            addSlave: function(slave){
                config.slave.push(slave);
                slave.master = this;
            },
            getFree: function(){
                this.master.freeSlave(this);
            },
            getMaster: function(master){
                master.addSlave(this);
            },
            controlSlave: function(){
                for(var i in config.slave){
                    config.slave[i].setValue(self.getValue());
                    config.slave[i].controlSlave();
                }
            }
        });
        if(config.slave){
            for(var i in config.slave){
                config.slave[i].master = this;
            }
        }
        if(config.master){
            config.master.config.slave.push(this);
        }
        setTimeout(function(){add(config.addressBook);}, 0);
        return this;
    };
    $.extend($.fn.selectAddress, {
        addressBook: {
            "0": {"1": "\u4e2d\u534e\u4eba\u6c11\u5171\u548c\u56fd"},
            "1": {"2":"北京市","7120":"天津市","12749":"河北省","67350":"山西省","100310":"内蒙古","115281":"辽宁省","134900":"吉林省","147195":"黑龙江","162163":"上海市","167997":"江苏省","192198":"浙江省","228907":"安徽省","250628":"福建省","268573":"江西省","291266":"山东省","378750":"河南省","432136":"湖北省","465640":"湖南省","516545":"广东省","546066":"广西","564026":"海南省","567559":"重庆市","580117":"四川省","638826":"贵州省","660898":"云南省","678148":"西藏","685186":"陕西省","715747":"甘肃省","734622":"青海省","739642":"宁夏","743027":"新疆"}
        },
        loading: {},
        loadList: [],
        curId: 0,
        url: 'address/selectCity.php',
        getId: function(){
            return $.fn.selectAddress.curId++;
        },
        getAlFromServer: function(sel){
            var load = function(){
                var sel = this.loadList.shift(), self = this;
                $.getJSON(jt.getAPP(this.url),{"p":sel.value,"rand":Math.random()}, function(json){
                    var al = {};
                    for(var i in json){
                        al[json[i].id] = json[i].name;
                    }
                    self.addressBook[sel.value] = al;
                    for(var i in self.loading[sel.value]){
                        self.loading[sel.value][i].refresh();
                    }
                    delete self.loading[sel.value];
                    if(self.loadList.length)load.apply(self);
                });
            };
            if(this.loading[sel.value]){
                this.loading[sel.value].push(sel);
            }else{
                this.loading[sel.value] = [sel];
                this.loadList.push(sel);
                if(this.loadList.length == 1)load.apply(this);
            }
        }
    });
})(jQuery);
