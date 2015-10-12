package View.ViewComponent 
{
	import asunit.errors.AbstractError;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import View.ViewBase.Visual_Text;
	import View.ViewBase.VisualHandler;
	import Model.valueObject.*;
	import Model.*;
	import util.*;
	import Command.*;
	
	import View.Viewutil.*;
	import Res.ResName;
	import caurina.transitions.Tweener;
	
	/**
	 * betzone present way
	 * @author ...
	 */
	public class Visual_HistoryRecoder  extends VisualHandler
	{
		
		[Inject]
		public var _betCommand:BetCommand;
		
		[Inject]
		public var _text:Visual_Text;;
		
		public function Visual_HistoryRecoder() 
		{
			
		}
		
		public function init():void
		{			
			var historytable:MultiObject = create("Historytable", [ResName.historytable]);
			historytable.container.x = 1300;
			historytable.container.y =  140;
			historytable.Create_(1, "Historytable");
			
			//結果歷史記錄			
			var historyball:MultiObject = create("historyball",[ResName.historyball] ,   historytable.container);
			historyball.container.x = 6.35;
			historyball.container.y = 8.85;
			historyball.Posi_CustzmiedFun = _regular.Posi_Colum_first_Setting;
			historyball.Post_CustomizedData = [6,38,38 ];
			historyball.Create_(60, "historyball");
			//historyball.container.visible = true;				
			
			put_to_lsit(historytable);	
			put_to_lsit(historyball);
		}
		
		[MessageHandler(type = "Model.ModelEvent", selector = "display")]
		public function display():void
		{
			Get("Historytable").container.visible = true;			
			update_history();
		}
		
		public function update_history():void
		{			
			Get("historyball").CustomizedData = _model.getValue("history_win_list");
			Get("historyball").CustomizedFun = history_ball_Setting;
			Get("historyball").FlushObject();
		}
		
		public function history_ball_Setting(mc:MovieClip, idx:int, data:Array):void
		{			
			var info:Array =  data[idx];			
			if ( data[idx] == undefined ) return;
			var frame:int = info[0];
			if (  info[0] !=5)
			{				
				mc["_Text"].text = info[1];
			}
			mc.gotoAndStop(frame);
		}
		
		
		[MessageHandler(type = "Model.ModelEvent", selector = "hide")]
		public function opencard_parse():void
		{
			Get("Historytable").container.visible = false;			
		}
	}

}