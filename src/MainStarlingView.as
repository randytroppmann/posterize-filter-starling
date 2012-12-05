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
	import feathers.display.Image;
	import feathers.themes.MinimalMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class MainStarlingView extends Sprite{		
		[Embed(source="/assets/images/venice.jpg")]
		private static var sampleImage:Class;
		public static var sampleImageTexture:Texture;
		private var image:Image;
		private var slider1:ImageAdjustSlider;
		private var slider2:ImageAdjustSlider;
		private var slider3:ImageAdjustSlider;
		private var theme:MinimalMobileTheme;
		private var captionTF:TextField;
		
		public function MainStarlingView(){
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			sampleImageTexture = Texture.fromBitmap(new sampleImage());
			slider1 = new ImageAdjustSlider(image, "R", 0, 16, 1);
			slider1.addEventListener(Event.CHANGE, handlePosterizeSliderChange);
			slider2 = new ImageAdjustSlider(image, "G", 0, 16, 1);
			slider2.addEventListener(Event.CHANGE, handlePosterizeSliderChange);
			slider3 = new ImageAdjustSlider(image, "B", 0, 16, 1);
			slider3.addEventListener(Event.CHANGE, handlePosterizeSliderChange);			
		}
		
		private function onAddedToStage(p_event:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			theme = new MinimalMobileTheme(this.stage);
			
			image = new Image(sampleImageTexture);
			image.x = 20;
			image.y = 20;
			addChild(image);
			
			captionTF = new TextField(500, 34, "Posterize Filter: enabled by Starling", "_sans", 14);
			captionTF.hAlign = "left";
			captionTF.x = image.x;
			captionTF.y = image.y + image.height + 5;
			addChild(captionTF);		
			
			slider1.x = image.x;
			slider1.y = captionTF.y + 30;
			addChild(slider1);
			
			slider2.x = slider1.x;
			slider2.y = slider1.y + 30;
			addChild(slider2);
			
			slider3.x = slider1.x;
			slider3.y = slider2.y + 30;
			addChild(slider3);			

		}
		
		private function handlePosterizeSliderChange(p_evt:Event):void{
			var imageFilter:PosterizeFilter = new PosterizeFilter(slider1.value, slider2.value, slider3.value);
			image.filter = imageFilter;
		}
	}
}