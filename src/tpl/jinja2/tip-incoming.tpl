{% set user_from = a.u_from.name %}
{% set user_to = a.u_to.name %}
{% set user_bot = ctb.conf.reddit.auth.user %}
{% if a.coinval: %}
{%   set coin_name = ctb.conf.coins[a.coin].name %}
{%   set coin_symbol = ctb.conf.coins[a.coin].symbol %}
{%   if a.coinval < 0.0001 %}
{%     set coin_amount = ( a.coinval * 100000000.0 ) %}
{%     set coin_symbol = ctb.conf.coins[a.coin].satoshi %}
{%   elif a.coinval < 1.0 %}
{%     set coin_amount = ( a.coinval * 1000.0 ) %}
{%     set coin_symbol = ctb.conf.coins[a.coin].milli %}
{%   elif a.coinval >= 1000.0 %}
{%     set coin_amount = ( a.coinval / 1000.0 ) %}
{%     set amount_prefix_short = "K" %}
{%     set coin_symbol = "%s%s" % (amount_prefix_short, coin_symbol) %}
{%   else %}
{%     set coin_amount = a.coinval %}
{%   endif %}
{% endif %}
{% set coin_amount_fmt = " **^(%.6g%ss)**" % (coin_amount, coin_symbol) %}
{% set fiatval_fmt = "%s%.4f" % (ctb.conf.fiat[a.fiat].symbol, a.fiatval) %}
{% set expire_days_fmt = "%.2g" % ( ctb.conf.misc.times.expire_pending_hours / 24.0 ) %}
Hey {{ user_to | replace('_', '\_') }}, /u/{{ user_from }} sent you a __{{ coinval_fmt }} ({{ fiatval_fmt }})__ tip, reply with __[+accept](http://www.reddit.com/message/compose?to={{ user_bot }}&subject=accept&message=%2Baccept)__ to claim it. Reply with __[+decline](http://www.reddit.com/message/compose?to={{ user_bot }}&subject=decline&message=%2Bdecline)__ to decline it. __Pending tips expire in {{ expire_days_fmt }} days.__

{% set user = user_to %}
{% include 'footer.tpl' %}
