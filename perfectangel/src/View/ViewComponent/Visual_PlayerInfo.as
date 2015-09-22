package View.ViewComponent 
{
	import View.ViewBase.VisualHandler;
	import Model.valueObject.*;
	import Model.*;
	import util.*;
	import Command.*;
	
	import View.Viewutil.MultiObject;
	import Res.ResName;
	import caurina.transitions.Tweener;
	
	/**
	 * playerinfo present way
	 * @author ...
	 */
	public class Visual_PlayerInfo  extends VisualHandler
	{
		
		[Inject]
		public var _betCommand:BetCommand;
		
		public function Visual_PlayerInfo() 
		{
			
		}
		
		public function init():void
		{			
			//var bet:MultiObject = prepare("total_betcredit", new MultiObject() , GetSingleItem("_view").parent.parent);
			//bet.CustomizedFun = _regular.FrameSetting;
			//bet.CustomizedData =  [10,10,10,10,10,10,10,10,10,10];
			//bet.Create_by_list(10, [ResName.num_sefi], 0, 0, 10, 26, 0, "info_");
			//bet.container.x = 523;
			//bet.container.y = 1033;
			//
			//var win:MultiObject = prepare("win_credit", new MultiObject() , GetSingleItem("_view").parent.parent);
			//win.CustomizedFun = _regular.FrameSetting;
			//win.CustomizedData =  [10,10,10,10,10,10,10,10,10,10];
			//win.Create_by_list(10, [ResName.num_sefi], 0, 0, 10, 26, 0, "info_");
			//win.container.x = 1139;
			//win.container.y = 1033;		
		}
		
		
		[MessageHandler(type = "Model.ModelEvent", selector = "clearn")]
		public function Clean_():void
		{
			var win:MultiObject = Get("win_credit");
			win.CustomizedFun = _regular.FrameSetting;
			win.CustomizedData =  [10,10,10,10,10,10,10,10,10,10];
			win.FlushObject();
		}
		
		[MessageHandler(type = "Model.ModelEvent", selector = "updateCredit")]
		public function updateCredit():void
		{				
			//_model.getValue("after_bet_credit").toString()
			var s:int = _model.getValue("after_bet_credit");	
			if ( _model.getValue(modelName.HandShake_chanel) != null )
			{
				//var response:Function = _model.getValue(modelName.HandShake_chanel);
				//response(_model.getValue(modelName.Client_ID), ["HandShake_updateCredit", s]);
				//utilFun.Log("Hand_she asking "+ _model.getValue(modelName.Client_ID));
			}
			else 
			{
				var num:String = utilFun.Format(s, 10);
				var arr:Array = num.split("");
				for ( var i:int = 0; i < arr.length; i++)
				{
					if ( arr[i] == 0) arr[i] = 10;
				}
				
				var credit:MultiObject = Get(modelName.CREDIT);
				credit.CustomizedFun = _regular.FrameSetting;
				credit.CustomizedData =  arr;
				credit.FlushObject();
			}
			
			
			//bet credit
			s = _betCommand.all_betzone_totoal();
			num = utilFun.Format(s, 10);
			arr = num.split("");
			for ( var i:int = 0; i < arr.length; i++)
			{
				if ( arr[i] == 0) arr[i] = 10;
			}
			
			var credit:MultiObject = Get("total_betcredit");
			credit.CustomizedFun = _regular.FrameSetting;
			credit.CustomizedData =  arr;
			credit.FlushObject();
			
		}		
		
		[MessageHandler(type = "Model.ModelEvent", selector = "update_result_Credit")]
		public function update_result_Credit():void
		{	
			var s:int = _model.getValue(modelName.CREDIT);
			if ( _model.getValue(modelName.HandShake_chanel) != null )
			{
				//var response:Function = _model.getValue(modelName.HandShake_chanel);
				//response(_model.getValue(modelName.Client_ID), ["HandShake_updateCredit", s]);				
			}
			else
			{
				var num:String = utilFun.Format(s, 10);
				var arr:Array = num.split("");
				for ( var i:int = 0; i < arr.length; i++)
				{
					if ( arr[i] == 0) arr[i] = 10;
				}
				
				var credit:MultiObject = Get(modelName.CREDIT);
				credit.CustomizedFun = _regular.FrameSetting;
				credit.CustomizedData =  arr;
				credit.FlushObject();
			}
			
			//bet credit			
			var bet:MultiObject = Get("total_betcredit");
			bet.CustomizedFun = _regular.FrameSetting;
			bet.CustomizedData =  [10,10,10,10,10,10,10,10,10,10];
			bet.FlushObject();
			
			//win credit
			s =  _model.getValue(modelName.SETTLE_AMOUNT);			
			num = utilFun.Format(s, 10);
			arr = num.split("");
			for ( var i:int = 0; i < arr.length; i++)
			{
				if ( arr[i] == 0) arr[i] = 10;
			}
			
			var win:MultiObject = Get("win_credit");
			win.CustomizedFun = _regular.FrameSetting;
			win.CustomizedData =  arr;
			win.FlushObject();
			
			//utilFun.SetText(GetSingleItem(modelName.CREDIT)["credit"], .toString());
		}
		
	}

}