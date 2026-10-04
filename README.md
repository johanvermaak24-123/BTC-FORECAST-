# BTC Oracle R6.16.2 — Actionable Forecast

## What the first card tells you

After a scan, the card displays the 1H direction, the evidence behind it, and the exact entry reference, WRONG/stop level, and TP1–TP3. It distinguishes a forecast from an executable setup:

- With only Binance/Coinbase public pricing, it says `FORECAST BUY/SELL · KONTROLEER MT5` and gives the next step.
- To get `GAAN IN BUY/SELL · MT5`, enter the current Pepperstone BTCUSD Bid and Ask under “Enter or refresh Pepperstone MT5 Bid and Ask.” The app only shows that instruction while the manually entered quote is fresh and all forecast, candle, spread, and cost checks pass.
- If a check fails, it says WAIT and gives the reason. A fresh MT5 quote is not a connection to the Pepperstone account; the app never places orders.

## Forecast and saved history

The 1H direction uses rolling historical analogs from closed public H1 candles; 3H confirms and 6H gives context. The displayed analog UP-share is not a calibrated win probability. Historical walk-forward checks are not live performance.

Tick history is a separate entry-timing check. It can confirm or block a matching setup only after corrected mock fills, non-overlapping results, and at least 12 outcomes in the same source bucket. Old legacy outcomes that do not pass the fill checks are excluded. To reprocess local IndexedDB history once, open Brain, learning and data tools, then choose **Rebuild learning from stored ticks**. To add an exported CSV first, choose **Import saved tick CSV**; a CSV Source column is retained.

The full-app JSON export does not include IndexedDB raw ticks. The app now imports full-app snapshots as well as older forecast-brain files; it never treats a tick summary JSON as training data.

## Risk and limitations

This is a forecast and paper-learning tool, not an order manager. It does not calculate lots or account-currency risk, model your Pepperstone contract settings, or guarantee a result. Never risk your full balance on one setup. Verify the quoted price, stop, targets, and position size in MT5 yourself.

## Run

Open `index.html` in a modern browser. On a phone, keep the page open during a scan and enter the current broker Bid/Ask immediately before acting; the quote expires after 15 seconds. Internet access is required to fetch public H1 candles.
