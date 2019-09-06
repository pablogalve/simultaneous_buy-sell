//+------------------------------------------------------------------+
//|                                      simultaneous_long&short.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

input int maxSpread = 0.2;
input int lots = 0.01;
input int slippage = 10;
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
   if((Ask - Bid) <= maxSpread)
   {
      int buy = OrderSend(Symbol(),OP_BUY,lots,Ask,slippage,0,0,NULL,magic,0,clrGreen);
      int sell = OrderSend(Symbol(),OP_BUY,lots,Bid,slippage,0,0,NULL,magic,0,clrRed);
   }     
   
  }
  