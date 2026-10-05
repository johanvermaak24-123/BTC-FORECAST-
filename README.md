# BTC Oracle R6.17.0 — Big Move Radar

## Scan and enter

1. Open `index.html` in a modern browser and tap **SCAN BTC NOW**.
2. Copy the current BTCUSD Bid and Ask from Pepperstone MT5 into the quote panel, tap **Use MT5 quote**, then scan again. The manual quote expires after 15 seconds.
3. Act only when the main card says **GAAN IN BUY** or **GAAN IN SELL**. It shows the entry, WRONG/SL, TP1, TP2 and TP3. Oracle does not send orders or calculate lot size.

Public BTC candles are used for the forecast. Pepperstone is not connected; the broker quote must be entered by hand. Confirm the actual execution in MT5.

## Big Move Radar

- **ARMED** means recent H1 ranges have contracted near the previous 20-hour high or low. The card shows the breakout level. Wait for a closed H1 candle through that level; do not enter inside the range.
- **CONFIRMED** requires a close beyond the 20H boundary, range or volume expansion, and supporting 1H plus 3H/6H forecast direction.
- **VERIFY** means price crossed the boundary but expansion or higher-timeframe confirmation is missing. Wait for another scan.
- The radar keeps a confirmed breakout in view for up to four closed H1 candles. **RETEST READY** marks price back near its former boundary while the latest H1 close still holds beyond it. **RETEST ONLY** means price ran more than 0.75 recent H1 range units past the trigger; wait near the former boundary instead of chasing. A close too far back inside the range invalidates the setup.
- TP1 and TP2 are nearer objectives. TP3 is a stretch scenario from the strongest direction-aligned 1H/3H/6H analog tail, capped at six H1 ATR. Analog tails are scenarios, not calibrated probabilities.
- After TP2, if partial profit has already been taken, the app shows a 1.25 H1 ATR trail reference. Move protection manually in MT5 and never widen the original stop.

## Open positions and screenshots

Use **READ MT5 SCREENSHOT** to read a position. Check the preview before loading it; OCR can misread numbers. The screenshot is not saved, and its displayed quote is not treated as live. Keep the app open for periodic position checks and verify every alert against MT5.

## Learning and summary audit

Tick data, mock outcomes and the signal ledger stay in this browser. **Audit tick summary** reads an exported JSON summary without importing it into learning. The audit now reports resolved favorable excursions of at least 1.5R, synthetic Last ticks, unchanged quotes, and snapshot duration so a small mock sample cannot be mistaken for proof of large-move performance. CSV and matched-package export remain available for later replay.

## Limits

The app is a manual forecast aid, not a proven strategy or broker connection. Historical analog shares are not win probabilities. Mock tick results do not include contract sizing, all commissions, extra slippage, latency, funding or a portfolio equity curve. Test the radar in paper trading and record actual MT5 fills before relying on it with money.
