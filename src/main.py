import cointipbot, traceback, time, sys

class Main():
  cb = None
  # shutdown = False

  def __init__(self):
    '''
    Unfortunately, we cannot instantiate CointipBot only once due to the way pifkoin works. 

    Pifkoin will open an HTTP connection to the RPC client which will eventually close when the bot completes its checks. Therefore, if we try to loop
    CointipBot.main() without reinstanting the object, httplib will throw BadStatusLine because the connection is no longer valid and cannot be used.

    May make a pull request to pifkoin to resolve this. If this does get resolved in pifkoin or you locally modify your pifkoin copy to resolve this, you can
    uncomment the following line and comment the self.cb assignment in main(). This will ensure we do not need to reinstantiate CoinbotTip in every iteration.
    '''
    self.cb = cointipbot.CointipBot()

  def main(self):
    #self.cb = cointipbot.CointipBot()

    self.cb.main()
    # self.shutdown = self.cb.shutdown

def secondary(main):
  try:
    while True:
      main.main();
  except:
    traceback.print_exc()
    print('Resuming in 7 seconds')
    time.sleep(7)
    print('Resumed')
    sys.exit(1)

# shutdown = False

# while not shutdown:
while True:
  main = Main()

  secondary(main)
  # shutdown = main.shutdown