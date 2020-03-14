<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
        <?php echo $content_top; ?>
        <?php echo $content_bottom; ?>

        <div class="col-xs-12 col-md-3">
          <p class="header1"><?=$text_publications?></p>
            <?php foreach ($publications as $publication) { ?>
              <a href="<?=$publication['link']?>" target="_blank" title="<?=$publication['name']?>">
                  <div class="row publication">
                    
                    <div class="col-md-3">
                      <img src="/catalog/view/theme/default/image/publ.png">
                    </div>
                    
                    <div class="col-md-9">
                      <div class="head_publication"><?=$publication['name']?></div>
                      <div class="date_publication"><?=date("d.m.y",$publication['updated'])?></div> 
                    </div>       
                    
                  </div>
              </a>
            <?php } ?>

            <a href="<?=$all_publications_link?>">
              <div class="event_more">
                <?=$text_all_publications?>
              </div>
            </a>
        </div>

    </div>
    <?php echo $column_right; ?>
       
    </div>

    <div class="row">
      <p class="header1"><?=$text_top_university?></p>
        <div class="slider">
          <div class="slider__wrapper">
            <div class="slider__item">
              <div class="univ1"></div>
            </div>
              <div class="slider__item">
              <div class="univ2"></div>
            </div>
              <div class="slider__item">
              <div class="univ1"></div>
            </div>
              <div class="slider__item">
              <div class="univ2"></div>
            </div>
              <div class="slider__item">
              <div class="univ1"></div>
            </div>
                    <div class="slider__item">
              <div class="univ2"></div>
            </div>

          </div>
          <a class="slider__control slider__control_left" href="#" role="button"></a>
          <a class="slider__control slider__control_right" href="#" role="button"></a>
        </div>

        <script>
    'use strict';
    var multiItemSlider = (function () {

      function _isElementVisible(element) {
        var rect = element.getBoundingClientRect(),
          vWidth = window.innerWidth || doc.documentElement.clientWidth,
          vHeight = window.innerHeight || doc.documentElement.clientHeight,
          elemFromPoint = function (x, y) { return document.elementFromPoint(x, y) };
        if (rect.right < 0 || rect.bottom < 0
          || rect.left > vWidth || rect.top > vHeight)
          return false;
        return (
          element.contains(elemFromPoint(rect.left, rect.top))
          || element.contains(elemFromPoint(rect.right, rect.top))
          || element.contains(elemFromPoint(rect.right, rect.bottom))
          || element.contains(elemFromPoint(rect.left, rect.bottom))
        );
      }

      return function (selector, config) {
        var
          _mainElement = document.querySelector(selector),
          _sliderWrapper = _mainElement.querySelector('.slider__wrapper'),
          _sliderItems = _mainElement.querySelectorAll('.slider__item'),
          _sliderControls = _mainElement.querySelectorAll('.slider__control'),
          _sliderControlLeft = _mainElement.querySelector('.slider__control_left'),
          _sliderControlRight = _mainElement.querySelector('.slider__control_right'),
          _wrapperWidth = parseFloat(getComputedStyle(_sliderWrapper).width),
          _itemWidth = parseFloat(getComputedStyle(_sliderItems[0]).width),
          _html = _mainElement.innerHTML,
          _positionLeftItem = 0,
          _transform = 0,
          _step = _itemWidth / _wrapperWidth * 100,
          _items = [],
          _interval = 0,
          _states = [
            { active: false, minWidth: 0, count: 1 },
            { active: false, minWidth: 576, count: 2 },
            { active: false, minWidth: 992, count: 3 },
            { active: false, minWidth: 1200, count: 4 },
          ],
          _config = {
            isCycling: false,
            direction: 'right',
            interval: 5000,
            pause: true
          };

        for (var key in config) {
          if (key in _config) {
            _config[key] = config[key];
          }
        }

        _sliderItems.forEach(function (item, index) {
          _items.push({ item: item, position: index, transform: 0 });
        });

        var _setActive = function () {
          var _index = 0;
          var width = parseFloat(document.body.clientWidth);
          _states.forEach(function (item, index, arr) {
            _states[index].active = false;
            if (width >= _states[index].minWidth)
              _index = index;
          });
          _states[_index].active = true;
        }

        var _getActive = function () {
          var _index;
          _states.forEach(function (item, index, arr) {
            if (_states[index].active) {
              _index = index;
            }
          });
          return _index;
        }

        var position = {
          getItemMin: function () {
            var indexItem = 0;
            _items.forEach(function (item, index) {
              if (item.position < _items[indexItem].position) {
                indexItem = index;
              }
            });
            return indexItem;
          },
          getItemMax: function () {
            var indexItem = 0;
            _items.forEach(function (item, index) {
              if (item.position > _items[indexItem].position) {
                indexItem = index;
              }
            });
            return indexItem;
          },
          getMin: function () {
            return _items[position.getItemMin()].position;
          },
          getMax: function () {
            return _items[position.getItemMax()].position;
          }
        }

        var _transformItem = function (direction) {
          var nextItem;
          if (!_isElementVisible(_mainElement)) {
            return;
          }
          if (direction === 'right') {
            _positionLeftItem++;
            if ((_positionLeftItem + _wrapperWidth / _itemWidth - 1) > position.getMax()) {
              nextItem = position.getItemMin();
              _items[nextItem].position = position.getMax() + 1;
              _items[nextItem].transform += _items.length * 100;
              _items[nextItem].item.style.transform = 'translateX(' + _items[nextItem].transform + '%)';
            }
            _transform -= _step;
          }
          if (direction === 'left') {
            _positionLeftItem--;
            if (_positionLeftItem < position.getMin()) {
              nextItem = position.getItemMax();
              _items[nextItem].position = position.getMin() - 1;
              _items[nextItem].transform -= _items.length * 100;
              _items[nextItem].item.style.transform = 'translateX(' + _items[nextItem].transform + '%)';
            }
            _transform += _step;
          }
          _sliderWrapper.style.transform = 'translateX(' + _transform + '%)';
        }

        var _cycle = function (direction) {
          if (!_config.isCycling) {
            return;
          }
          _interval = setInterval(function () {
            _transformItem(direction);
          }, _config.interval);
        }

        var _controlClick = function (e) {
          if (e.target.classList.contains('slider__control')) {
            e.preventDefault();
            var direction = e.target.classList.contains('slider__control_right') ? 'right' : 'left';
            _transformItem(direction);
            clearInterval(_interval);
            _cycle(_config.direction);
          }
        };

        var _handleVisibilityChange = function () {
          if (document.visibilityState === "hidden") {
            clearInterval(_interval);
          } else {
            clearInterval(_interval);
            _cycle(_config.direction);
          }
        }

        var _refresh = function () {
          clearInterval(_interval);
          _mainElement.innerHTML = _html;
          _sliderWrapper = _mainElement.querySelector('.slider__wrapper');
          _sliderItems = _mainElement.querySelectorAll('.slider__item');
          _sliderControls = _mainElement.querySelectorAll('.slider__control');
          _sliderControlLeft = _mainElement.querySelector('.slider__control_left');
          _sliderControlRight = _mainElement.querySelector('.slider__control_right');
          _wrapperWidth = parseFloat(getComputedStyle(_sliderWrapper).width);
          _itemWidth = parseFloat(getComputedStyle(_sliderItems[0]).width);
          _positionLeftItem = 0;
          _transform = 0;
          _step = _itemWidth / _wrapperWidth * 100;
          _items = [];
          _sliderItems.forEach(function (item, index) {
            _items.push({ item: item, position: index, transform: 0 });
          });
        }

        var _setUpListeners = function () {
          _mainElement.addEventListener('click', _controlClick);
          if (_config.pause && _config.isCycling) {
            _mainElement.addEventListener('mouseenter', function () {
              clearInterval(_interval);
            });
            _mainElement.addEventListener('mouseleave', function () {
              clearInterval(_interval);
              _cycle(_config.direction);
            });
          }
          document.addEventListener('visibilitychange', _handleVisibilityChange, false);
          window.addEventListener('resize', function () {
            var
              _index = 0,
              width = parseFloat(document.body.clientWidth);
            _states.forEach(function (item, index, arr) {
              if (width >= _states[index].minWidth)
                _index = index;
            });
            if (_index !== _getActive()) {
              _setActive();
              _refresh();
            }
          });
        }

        // инициализация
        _setUpListeners();
        if (document.visibilityState === "visible") {
          _cycle(_config.direction);
        }
        _setActive();

        return {
          right: function () {
            _transformItem('right');
          },
          left: function () {
            _transformItem('left');
          },
          stop: function () {
            _config.isCycling = false;
            clearInterval(_interval);
          },
          cycle: function () {
            _config.isCycling = true;
            clearInterval(_interval);
            _cycle();
          }
        }

      }
    }());

    var slider = multiItemSlider('.slider', {
      isCycling: true
    })
  </script>
    </div>
</div>
<?php echo $footer; ?>


