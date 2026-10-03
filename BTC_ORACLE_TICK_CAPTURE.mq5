#property strict
#property version   "1.00"
#property description "Read-only BTC tick capture for BTC Oracle. Does not place trades."
input string InpOutputFile="BTC_ORACLE_TICKS.csv";
input int InpPollMs=100;
input int InpFlushEveryMs=1000;
input int InpMaxBatch=10000;
int g_file=INVALID_HANDLE; ulong g_cursor=0; int g_seen=0; ulong g_flushAt=0; bool g_ready=false;
int OnInit(){
 if(InpPollMs<50||InpMaxBatch<100)return INIT_PARAMETERS_INCORRECT;
 g_file=FileOpen(InpOutputFile,FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI|FILE_SHARE_READ|FILE_SHARE_WRITE,',');
 if(g_file==INVALID_HANDLE){PrintFormat("BTC Oracle FileOpen failed: %d",GetLastError());return INIT_FAILED;}
 if(FileSize(g_file)==0){FileWrite(g_file,"time_msc","bid","ask","last","volume","volume_real","flags");FileFlush(g_file);} FileSeek(g_file,0,SEEK_END);
 MqlTick latest; if(SymbolInfoTick(_Symbol,latest)&&latest.time_msc>0){g_cursor=(ulong)latest.time_msc;MqlTick seed[];int n=CopyTicks(_Symbol,seed,COPY_TICKS_ALL,g_cursor,(uint)InpMaxBatch);for(int i=0;i<n;i++)if((ulong)seed[i].time_msc==g_cursor)g_seen++;}
 g_flushAt=GetTickCount64();g_ready=true;EventSetMillisecondTimer(InpPollMs);PrintFormat("BTC Oracle read-only capture started: %s -> MQL5/Files/%s",_Symbol,InpOutputFile);return INIT_SUCCEEDED;
}
void OnDeinit(const int reason){EventKillTimer();if(g_file!=INVALID_HANDLE){FileFlush(g_file);FileClose(g_file);g_file=INVALID_HANDLE;}Print("BTC Oracle capture stopped.");}
void OnTick(){} // Tick history is drained by CopyTicks polling, not assumed one OnTick callback per market tick.
void OnTimer(){if(!g_ready||g_file==INVALID_HANDLE)return;DrainTicks();ulong now=GetTickCount64();if(now-g_flushAt>=(ulong)InpFlushEveryMs){FileFlush(g_file);g_flushAt=now;}}
void DrainTicks(){MqlTick ticks[];for(int pass=0;pass<20;pass++){int n=CopyTicks(_Symbol,ticks,COPY_TICKS_ALL,g_cursor,(uint)InpMaxBatch);if(n<=0)return;int wrote=0;for(int i=0;i<n;i++){ulong tm=(ulong)ticks[i].time_msc;if(tm<g_cursor)continue;if(tm==g_cursor&&g_seen>0){g_seen--;continue;}if(tm>g_cursor){g_cursor=tm;g_seen=0;}FileWrite(g_file,(long)ticks[i].time_msc,DoubleToString(ticks[i].bid,_Digits),DoubleToString(ticks[i].ask,_Digits),DoubleToString(ticks[i].last,_Digits),(long)ticks[i].volume,DoubleToString(ticks[i].volume_real,8),(long)ticks[i].flags);g_seen++;wrote++;}if(n<InpMaxBatch||wrote==0)return;}}
