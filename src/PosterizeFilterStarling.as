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
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DProfile;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	[SWF(width="600",height="500",frameRate="60",backgroundColor="#ffffff")]
	public class PosterizeFilterStarling extends Sprite{
		private var _starling:Starling;
		public function PosterizeFilterStarling(){
			this.mouseEnabled = this.mouseChildren = false;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.mouseChildren = false;
			var viewPort:Rectangle = new Rectangle(0, 0, 600, 500);
			_starling = new Starling(MainStarlingView, stage, viewPort,null,Context3DRenderMode.AUTO, Context3DProfile.BASELINE);
			_starling.stage.stageWidth = 600;
			_starling.stage.stageHeight = 500;
			_starling.start();
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
	}
}