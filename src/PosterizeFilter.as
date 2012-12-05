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

	This work is a derivative of the AS3 framework for GPU-based image processing
	by Eugene Zatepyakin https://github.com/inspirit/GPUImage

	This work is also a derivative of the Starling filters class by Gamua OG:
	https://github.com/PrimaryFeather/Starling-Framework
*/

package{
	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.display3D.Program3D;
	
	import starling.filters.FragmentFilter;
	import starling.textures.Texture;
	
	public class PosterizeFilter extends FragmentFilter{		
		private var mShaderProgram:Program3D;
		private var _params:Vector.<Number>;
		
		public function PosterizeFilter(p_r:Number = 16, p_g:Number = 16, p_b:Number = 16){
			super();
			_params = new Vector.<Number>();
			_params.length = 4;			
			_params[0] = p_r;
			_params[1] = p_g;
			_params[2] = p_b;
		}	
		
		protected override function createPrograms():void{			
			var fragmentProgramCode:String = 
				"tex ft0, v0, fs0 <2d,linear,mipnone,clamp>	\n" +
				"mul ft0.xyz, ft0.xyz, fc0.xyz \n" +
				"frc ft1.xyz, ft0.xyz \n" +
				"sub ft0.xyz, ft0.xyz, ft1.xyz \n" +
				"div ft0.xyz, ft0.xyz, fc0.xyz \n" +
				// output the color
				"mov oc, ft0			    \n";
			
			mShaderProgram = assembleAgal(fragmentProgramCode);
		}
		
		protected override function activate(pass:int, context:Context3D, texture:Texture):void{	
			context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, _params, 1);
			context.setProgram(mShaderProgram);
		}
		
		public override function dispose():void{
			if (mShaderProgram) mShaderProgram.dispose();
			super.dispose();
		}

	}
}

