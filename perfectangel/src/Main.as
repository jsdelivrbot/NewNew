package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.spicefactory.parsley.core.context.Context;
	
	import org.spicefactory.parsley.core.events.ContextEvent;
	import org.spicefactory.parsley.asconfig.*;
	
	import com.hexagonstar.util.debug.Debug;
	import util.utilFun;
	import View.GameView.*;
	
	
	/**
	 * ...
	 * @author hhg
	 */
	[SWF(backgroundColor = "#000000")]
	public class Main extends MovieClip 
	{
		private var _context:Context;
		
		public var result:Object ;
		
		private var _appconfig:appConfig = new appConfig();
		
		private var _par:MovieClip;
		
		private var _credit:Number =-1;
		private var _clientidx:Number =-1;
		private var _handshake:Function = null;
		private var _uuid:String = "";
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function pass(pass:Object):void
		{
			result = pass;
		}
		
		//public function handshake(credit:Number,Clientidx:int,handshake:Function,playerinfo:Object):void
		public function handshake(credit:Number,Clientidx:int,handshake:Function,uuid:String):void
		{
			_credit = credit;
			_clientidx = Clientidx;
			_handshake = handshake;
			//result = playerinfo;
			_uuid = uuid;
			utilFun.Log("_credit = " + _credit + " client id = " +_clientidx + "_handshake = "+_handshake+ "_uuid = "+_uuid);
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			if ( CONFIG::debug ) 
			{
				Debug.monitor(stage);
				utilFun.Log("welcome to perfect alcon");
			}			
			
			
			
			
			//no thing ,ok
			_context  = ActionScriptContextBuilder.build(appConfig);
			
			addChild(_context.getObjectByType(LoadingView) as LoadingView);			
			addChild(_context.getObjectByType(betView) as betView);
			addChild(_context.getObjectByType(HudView) as HudView);			
			
			var Enter:LoadingView = _context.getObject("Enter") as LoadingView;
			utilFun.Log("Enter = "+Enter);
			//Enter.FirstLoad([result,_credit,_clientidx,_handshake]);
			Enter.FirstLoad([_uuid,_credit,_clientidx,_handshake]);
		}
	}
	
}