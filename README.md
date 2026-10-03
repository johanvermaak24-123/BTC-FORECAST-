# BTC Oracle R6.16.1 — complete project package

Root `index.html` is the iPhone-first BTC Oracle app. This package includes the forecast engine, broker quote revalidation, position awareness, signal ledger, mock tick learning/resolution, tick CSV import/export, brain portability, and a read-only MT5 BTC tick capture EA.

## Files
- `index.html` — working no-build web app; keep at repository root for GitHub Pages.
- `mt5/BTC_ORACLE_TICK_CAPTURE.mq5` — tick-history polling capture, no trade execution.
- `docs/` — deployment, setup, data flow and storage notes.
- `samples/sample_ticks.csv` — synthetic CSV contract example.
- `tests/` — package integrity and syntax checks.

Public exchange candle data is only a proxy for Pepperstone. Exact broker ticks require MT5 Desktop/VPS and CSV transfer to the phone. This app is a forecast and manual trading assistant; it does not place live orders. Compile the EA in MetaEditor before use.
