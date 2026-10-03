from pathlib import Path
import csv, re, subprocess, unittest
ROOT=Path(__file__).resolve().parents[1]
class ProjectTests(unittest.TestCase):
 def test_root_index_is_full_btc_app(self):
  h=(ROOT/'index.html').read_text()
  for marker in ['BTC ORACLE R6.16.1','btcOraclePhoneMockGodR6141','BTCUSD','Import MT5 CSV','exportMatchedPackage']:
   self.assertIn(marker,h)
 def test_sample_tick_contract(self):
  with (ROOT/'samples/sample_ticks.csv').open() as f: rows=list(csv.DictReader(f))
  self.assertEqual(list(rows[0]),['time_msc','bid','ask','last','volume','volume_real','flags'])
  self.assertTrue(all(float(r['ask'])>=float(r['bid'])>0 for r in rows))
 def test_capture_is_read_only_copyticks(self):
  ea=(ROOT/'mt5/BTC_ORACLE_TICK_CAPTURE.mq5').read_text()
  self.assertIn('CopyTicks(',ea)
  self.assertNotRegex(ea,r'\b(OrderSend|CTrade|trade\.Buy|trade\.Sell)\b')
 def test_inline_script_syntax(self):
  h=(ROOT/'index.html').read_text(); scripts=re.findall(r'<script>(.*?)</script>',h,re.S)
  self.assertTrue(scripts)
  for s in scripts: subprocess.run(['node','--check'],input=s,text=True,capture_output=True,check=True)
if __name__=='__main__': unittest.main()
