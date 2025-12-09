{
# Make YouTube work in Russia
    services.zapret = {
	enable = true;
	params = [
	    "--dpi-desync=multisplit --dpi-desync-split-pos=10,midsld --dpi-desync-split-seqovl=1"
	    "--dpi-desync=multisplit --dpi-desync-split-pos=10,sniext+4 --dpi-desync-split-seqovl=1"
	];
	blacklist = [
    		"chat.deepseek.com"
		"genshin.hoyoverse.com"
		"genshin.hoyoverse.com/en/"
		"store.steampowered.com"
  ];

    };
}
