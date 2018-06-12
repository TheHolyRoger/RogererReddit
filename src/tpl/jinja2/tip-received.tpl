{% set user_from = a.u_from.name %}
{% set user_to = a.u_to.name %}
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
Hey {{ user_to | replace('_', '\_') }}, you have received a __{{ coinval_fmt }} ({{ fiatval_fmt }})__ tip from /u/{{ user_from }}.

{% set user = user_to %}
{% include 'footer.tpl' %}
