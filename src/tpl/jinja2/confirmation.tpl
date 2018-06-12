{% set title_fmt = "**^(\[%s\])**" % title %}
{% set user_from_fmt = " ^/u/%s" % a.u_from.name %}
{% set arrow_fmt = " tipped" %}
{% if a.u_to: %}
{%   set user_to_fmt = " ^/u/%s" % a.u_to.name %}
{%   if ctb.conf.reddit.stats.enabled: %}
{%   set stats_user_to_fmt = " ^^[[stats]](%s_%s)" % (ctb.conf.reddit.stats.url, a.u_to.name) %}
{%   endif %}
{% endif %}
{% if a.addr_to: %}
{%   set ex = ctb.conf.coins[a.coin].explorer %}
{%   set user_to_fmt = " ^[%s](%s%s)" % (a.addr_to, ex.address, a.addr_to) %}
{%   set arrow_fmt = " ^[->](%s%s)" % (ex.transaction, a.txid) %}
{% endif %}
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
{%   set coin_amount_fmt = " __%.6g %ss__" % (coin_amount, coin_symbol) %}
{% endif %}
{% if a.fiatval: %}
{%   set fiat_amount = a.fiatval %}
{%   set fiat_symbol = ctb.conf.fiat[a.fiat].symbol %}
{%   set fiat_amount_fmt = "&nbsp;**^(%s%.4f)**" % (fiat_symbol, fiat_amount) %}
{% endif %}
{% if ctb.conf.reddit.stats.enabled: %}
{%   set stats_user_from_fmt = " ^^[[stats]](%s_%s)" % (ctb.conf.reddit.stats.url, a.u_from.name) %}
{%   set stats_link_fmt = " ^[[global_stats]](%s)" % ctb.conf.reddit.stats.url %}
{% endif %}
{% if ctb.conf.reddit.help.enabled: %}
{%   set help_link_fmt = " ^[[help]](%s)" % ctb.conf.reddit.help.url %}
{% endif %}
{% if a.type == 'givetip' and a.keyword and ctb.conf.keywords[a.keyword].message %}
{%   set txt = ctb.conf.keywords[a.keyword].message %}
{%   if stats_user_from_fmt %}
{%   set txt = txt | replace("{USER_FROM}", user_from_fmt + stats_user_from_fmt) %}
{%   else %}
{%   set txt = txt | replace("{USER_FROM}", user_from_fmt) %}
{%   endif %}
{%   if stats_user_to_fmt %}
{%   set txt = txt | replace("{USER_TO}", user_to_fmt + stats_user_to_fmt) %}
{%   else %}
{%   set txt = txt | replace("{USER_TO}", user_to_fmt) %}
{%   endif %}
{%   if fiat_amount_fmt %}
{%   set txt = txt | replace("{AMOUNT}", coin_amount_fmt + fiat_amount_fmt) %}
{%   else %}
{%   set txt = txt | replace("{AMOUNT}", coin_amount_fmt) %}
{%   endif %}
{{   txt }}
{% else %}
{{   title_fmt }}{{ user_from_fmt }}{{ stats_user_from_fmt }}{{ arrow_fmt }}{{ user_to_fmt }}{{ stats_user_to_fmt }}{{ coin_amount_fmt }}{{ fiat_amount_fmt }}{{ help_link_fmt }}{{ stats_link_fmt }}
{% endif %}
