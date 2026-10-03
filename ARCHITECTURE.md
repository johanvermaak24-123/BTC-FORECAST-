# Architecture

```text
Pepperstone MT5 Desktop/VPS
  → Read-only CopyTicks EA
  → MQL5/Files/BTC_ORACLE_TICKS.csv
  → phone CSV import and IndexedDB raw-tick store
  → duplicate/gap/quote quality checks
  → mock-entry resolver (TP/SL/expiry)
  → outcome learning and brain export/import

Public exchange candles → BTC forecast engine → WAIT / ENTER / HOLD / EXIT display
Manual Pepperstone Bid/Ask → fresh entry revalidation
```

Tick learning and candle forecast are separate evidence streams. The tick CSV does not itself guarantee predictive performance. Browser-local brain state is stored under `btcOraclePhoneMockGodR6141`; keep deployment on the same origin or use the app's JSON/tick-package export and import.
