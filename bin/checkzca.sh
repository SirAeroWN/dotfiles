#Will Norvelle
#wmn2bz
#11/02/16 
#checkzca.sh

unbalance=`curl -s 'http://zcash.flypool.org/api/miner_new/t1MEGqAZrURx8kpQi3KLSXT1fNkQqoxQsEB' | python -c "import sys, json; print(float(json.load(sys.stdin)['unpaid']) * (10**-8))"`
balance=`/home/will/zcash/src/zcash-cli getinfo | python -c "import sys, json; print(json.load(sys.stdin)['balance'])"`

zecusd=`curl -s 'https://api.coinmarketcap.com/v1/ticker/zcash/' | python -c "import sys, json; print(json.load(sys.stdin)[0]['price_usd'])"`

usd=`awk "BEGIN {print $unbalance * $zecusd}"`
busd=`awk "BEGIN {print $balance * $zecusd}"`
#usd=`echo '"$unbalance" * "$zecusd"' | bc -l`


if [ "$1" == "-m" ]; then
	printf "paid balance: $balance\nunpaid balance: $unbalance\nZEC to USD: \$$zecusd\nunpaid balance in USD: \$$usd\npaid balance in USD: $busd" | mailx -s "zcash update" willnorvelle@gmail.com
else
	echo "unpaid balance: $unbalance"
	echo "paid balance: $balance"
	echo "ZEC to USD: \$$zecusd"
	echo "unpaid balance in USD: \$$usd"
	echo "paid balance in USD: \$$busd"
fi
