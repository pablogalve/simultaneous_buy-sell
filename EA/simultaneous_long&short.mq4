//+------------------------------------------------------------------+
//|                                      simultaneous_long&short.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

input double maxSpread = 200; //Max spread allowed
double spread = maxSpread + 1 ; //Just to ensure it doesn't execute. We change the value later on OnTick()
input double lots = 0.01;
input int slippage = 10;

//Number of operations that will be made. 1= 1 long + 1 short. 2= 2 longs and 2 shorts, etc 
input int rounds = 1;
int auxRounds = 0;
int magic = 4235;

int OnInit()
  {
   
  
   return(INIT_SUCCEEDED);
  }
  
void OnDeinit(const int reason)
  {
  
   
  }
  
void OnTick()
{
   if(auxRounds < rounds)
   {
      spread = SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
      if(spread <= maxSpread)
      {
         int buy = OrderSend(Symbol(),OP_BUY,lots,Ask,slippage,0,0,NULL,magic,0,clrGreen);
         int sell = OrderSend(Symbol(),OP_SELL,lots,Bid,slippage,0,0,NULL,magic,0,clrRed);
         auxRounds++;
      }     
   }
}
  