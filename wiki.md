## TheHolyRoger bot documentation

### Intro

#### How It Works

__TheHolyRoger bot__ allows Redditors to gift (tip) __[ROGERs](http://theholyroger.com/)__ to each other as a way of saying thanks. In order to tip others, you need to __[+register](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=register&message=%2Bregister)__ and deposit some coins into provided deposit addresses. If you've received a tip and haven't registered yet, you need to __[+accept](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=accept&message=%2Baccept)__ it first, which creates an account for you. You can then __[+withdraw](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=withdraw&message=%2Bwithdraw%20ADDRESS%20AMOUNT%20COIN)__ coins and/or send tips with __+ROGER__ command to other Redditors.

##### How Can I Get Some ROGERs?

* [Mining](http://mining.theholyroger.com) - just like mining Bitcoins
* [Tipping](/r/TheHolyRoger) - using the TheHolyRoger bot (__[see past tips](/u/TheHolyRoger)__)
* Buying with money or Bitcoins (exchange coming)

##### I Have More Questions!

Visit __[TheHolyRoger](/r/TheHolyRoger)__ subreddit or __[PM staff](/u/TheHoliestRoger)__

#### Warning

__This service is in early BETA. This service is provided "as is" without warranty of any kind, either express or implied, including, without limitation, the implied warranties of merchantability, fitness for a particular purpose, non-infringement, error-free or uninterrupted service.__ You are using this service at your own risk; in addition, the coins in your account are only as secure as your Reddit account is. __Do not hold large sums of coins here; simply withdraw or tip others.__

#### Subreddits

__[TheHolyRoger](/u/TheHolyRoger)__ is enabled in  __[TheHolyRoger](/r/TheHolyRoger)__ subreddit.__

### Commands

#### Personal Message Commands

__[+register](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=register&message=%2Bregister)__: create an account. The bot will generate a unique cryptocoin address for each supported coin, and send you that info.

__[+info](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=info&message=%2Binfo)__: get information about the account: unique coin addresses, balances.

__[+redeem](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=redeem&message=%2Bredeem%20COIN_NAME)__: redeem your karma! TheHolyRoger bot will deposit some coins to your account based on formula below. You can only do this once for each supported coin!

    amount = $0.03 + (link_karma × $0.00002) + (comment_karma × $0.000002)

__[+withdraw](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=withdraw&message=%2Bwithdraw%20ADDRESS%20AMOUNT%20COIN)__: tell the bot to send cryptocoins to a given address. Its syntax is:

    +withdraw ADDRESS [AMOUNT|KEYWORD] COIN

>__Note__: Network transaction fee is automatically added to when sending to an address. For example, if you ask to withdraw 1 Litecoin, your total withdraw amount will be 1.02 Litecoins, out of which 0.02 Litecoins will go towards transaction fee. TheHolyRoger bot does not keep transaction fees - they go to the network as a payment for processing the transaction.

__[+accept](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=accept&message=%2Baccept)__: accept all pending tips. If you've received a tip before you've registered with the bot, it's marked as pending until you +accept or +decline it. Pending tips expire in 48 hours.

__[+decline](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=decline&message=%2Bdecline)__: decline all pending tips. If you've received a tip before you've registered with the bot, it's marked as pending until you +accept or +decline it. Pending tips expire in 48 hours.

#### Tipping

__+ROGER__: The main command, used to tip other users or send tips directly to a given address. The basic syntax is:

    +ROGER [@user|ADDRESS] [AMOUNT|KEYWORD] COIN

##### Currency

In addition to specifying amount of alt-coins to tip, you could also specify a currency - US Dollar, Euro, etc. TheHolyRoger bot will automatically convert the currency amount into coin amount according to exchange rate on top cryptocoin exchanges. The syntax is:

    +ROGER [@user|ADDRESS] [$|€|R|¥|£][AMOUNT|KEYWORD] COIN

    +ROGER [@user|ADDRESS] [USD|EUR|RUB|CNY|JPY|GBP][AMOUNT|KEYWORD] COIN

##### Amount Keywords

To make tipping more fun, you can specify a keyword instead of numerical amount. Here's a table of supported keywords and their values:

keyword|value with coin|value with fiat (usd)
:---|---:|---:
all|entire balance|-
upvote|0.1|0.1
cookie|-|0.33
coffee|-|1.0
nothing|0.01|0.01
fart|0.05|0.05
gum|-|1.5
beer|-|3.5
nicebeer|-|5.0
hug|-|0.5
kiss|-|1.0
highfive|0.25|0.25
nyan|1.1111|1.1111

Notice that some of the keywords are valued only in fiat (USD). This is to avoid having someone accidentally tip 0.1 Bitcoins/Litecoins/etc. instead of 0.1 dollars.

In addition, here's some keywords which behave in random way:

keyword|value with coin|value with fiat (usd)
:---|---:|---:
flip|(min tip) * random(1..2)|0.01 * random(1..2)
megaflip|(min tip) * random(1..20)|0.01 * random(1..20)
gigaflip|(min tip) * random(1..200)|0.01 * random(1..200)
roll|(min tip) * random(1..6)|0.01 * random(1..6)
megaroll|(min tip) * random(1..60)|0.01 * random(1..60)
gigaroll|(min tip) * random(1..600)|0.01 * random(1..600)
random01|random(0..0.1)|random(0..0.1)
random05|random(0..0.5)|random(0..0.5)
random1|random(0..1)|random(0..1)
random3|random(0..3)|random(0..3)
random5|random(0..5)|random(0..5)
random10|random(0..10)|random(0..10)
random15|random(0..15)|random(0..15)
random25|random(0..25)|random(0..25)
random50|random(0..50)|random(0..50)
random100|random(0..100)|random(0..100)
random250|random(0..250)|random(0..250)
random500|random(0..500)|random(0..500)
random1000|random(0..1000)|random(0..1000)

You can see minimum tip amounts for each coin [here](/r/TheHolyRoger/wiki/coins).

##### Example Tips

    +ROGER 0.25 ROGERs

Send 0.25 ROGERs to the author of parent comment/submission

    +ROGER @myUser1 1.05 ROGERs

Send 1.05 ROGERs to user myUser1

##### Example Tips Using Keywords

    +ROGER flip ROGER

Send 0.1 or 0.2 ROGER, depending on chance!

    +ROGER all ROGERs

Send all available ROGERs

    +ROGER upvote ROGERs

Send 0.1 ROGERs

##### Tip Without Specifying Coin Type

You could tip by specifying just the fiat (dollar, euro, or ruble) value. ROGER has a stable $0.00 value so instead it will always translate the amount direct to ROGER.

    +ROGER $1.0

Send 1.0 ROGERs

### Some Notes

#### Verification Messages

##### Successful Tips

TheHolyRoger bot will verify successful tips by replying to the **+ROGER** comment (except where banned). Here's an example of verification reply:

>^(__[Verified]__:) ^/u/im14 ^-> ^/u/ThePiachu, __^1 ^ROGER(s)__&nbsp;^__($2.988)__ ^[[help]](http://www.reddit.com/r/TheHolyRoger/wiki/index)

##### Unsuccessful Tips

In case +ROGER command doesn't go through, TheHolyRoger bot _will not_ reply to the +ROGER comment. It _will_ send a personal message to the author of +ROGER command with a notice of what went wrong.

##### Tips to Un-Registered Users

In case you +ROGER a user who's not yet registered with TheHolyRoger bot, your tip becomes 'pending' until the user decides to +accept or +decline it, or the tip expires. Pending tips are substracted from your balance and are credited back when declined or expired.

When a pending tip is accepted, TheHolyRoger bot will verify it as successful and reply to the +ROGER comment with the verification message like above.

#### Balance

Your balance can be seen with [+info](http://www.reddit.com/message/compose?to=TheHolyRoger&subject=info&message=%2Binfo) command. Notice that after depositing coins to the addresses provided, there's a delay before the new balance becomes available for tipping. "Minimum number of confirmations" setting for each coin (shown above) sets how many confirmations a transaction needs before it's considered valid.

### Questions, Comments, and Suggestions

Post your general questions, comments, and suggestions [in this thread](http://www.reddit.com/r/TheHolyRoger/comments/1dzjar/questions_comments_and_suggestions_go_here_thanks/).