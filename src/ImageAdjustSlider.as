/*
	Copyright 2012 Randy Troppmann
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

package{
	import feathers.controls.Slider;
	import feathers.display.Image;
	import feathers.display.Sprite;
	
	import starling.events.Event;
	import starling.text.TextField;
	
	public class ImageAdjustSlider extends Sprite{
		private var labelTF:TextField;
		private var slider:Slider;
		private var valLabel:TextField;
		private var image:Image;
		private var labelText:String;
		
		private var min:Number;
		private var max:Number;
		private var step:Number;
		
		private var startValue:Number = 0.001;		
		
		public function ImageAdjustSlider(p_image:Image, p_property:String, p_min:Number = 0, p_max:Number = 10, p_step:Number = 0.1){
			labelText = p_property;
			min = p_min;
			max = p_max;
			step = p_step;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(p_evt:Event):void{
			labelTF = new TextField(30, 24, labelText, "_sans");
			labelTF.hAlign = "left";
			labelTF.x = 0;
			labelTF.y = 0;
			addChild(labelTF);
			
			slider = new Slider();
			slider.minimum = min;
			slider.step = step;
			slider.maximum = max;
			slider.width = 300;
			slider.addEventListener(Event.CHANGE, onSliderChange);
			slider.y = 4;
			slider.x = labelTF.x + labelTF.width;
			addChild(slider);			
			
			valLabel = new TextField(30, 24, "0", "_sans");
			valLabel.hAlign = "left";
			valLabel.x = slider.x + slider.width + 5;
			valLabel.y = labelTF.y;
			addChild(valLabel);		
		}
		
		private function onSliderChange(p_event:Event):void{
			valLabel.text = slider.value.toString();
			dispatchEventWith(Event.CHANGE);
		}
		
		public function get value():Number{
			return slider.value;
		}
	}
}