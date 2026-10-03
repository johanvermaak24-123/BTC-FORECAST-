# BTC Oracle R6.16.1 setup

## GitHub Pages
1. Upload the contents of this ZIP to a new repository with `index.html` in the repository root.
2. Enable GitHub Pages for the branch and root folder.
3. Open the Pages URL in iPhone Safari. Use Share → Add to Home Screen.
4. Keep the same site origin to retain browser storage. Export the brain and matched tick package before changing domain or clearing Safari website data.

## Pepperstone MT5 tick capture
1. On MT5 Desktop, open File → Open Data Folder → `MQL5/Experts`.
2. Copy `mt5/BTC_ORACLE_TICK_CAPTURE.mq5` there and compile it in MetaEditor.
3. Attach it to the exact Pepperstone BTC symbol chart (for example `BTCUSD` or broker-specific suffix), then allow Algo Trading so the EA can run. The source has no order-send/trade methods; it only reads ticks and writes CSV.
4. File output is `MQL5/Files/BTC_ORACLE_TICKS.csv`. Leave MT5 and the computer/VPS running to capture broker ticks.
5. Transfer the CSV to the phone; Oracle → Import MT5 CSV. Use Export matched package to back up the exact tick summary and CSV pair.

The browser cannot directly access the MT5 desktop file or Pepperstone's private feed. The public exchange data used for forecast candles is a proxy; manual Pepperstone Bid/Ask is still required for entry revalidation. R6.16.1 does not submit orders.
