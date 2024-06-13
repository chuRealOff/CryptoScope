//
//  CoinModel.swift
//  CryptoScope
//
//  Created by CHURILOV DMITRIY on 12.06.2024.
//

// CoinGecko API info
/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h

 Response:

 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 69760,
 "market_cap": 1374739491240,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 1464617338310,
 "total_volume": 27304798768,
 "high_24h": 69945,
 "low_24h": 66222,
 "price_change_24h": 3373.69,
 "price_change_percentage_24h": 5.08188,
 "market_cap_change_24h": 68807438268,
 "market_cap_change_percentage_24h": 5.26884,
 "circulating_supply": 19711312,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 73738,
 "ath_change_percentage": -5.41682,
 "ath_date": "2024-03-14T07:10:36.635Z",
 "atl": 67.81,
 "atl_change_percentage": 102753.13569,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2024-06-12T16:01:04.390Z",
 "sparkline_in_7d": {
 "price": [
 70841.58894438873,
 70979.39844584733,
 ]
 },
 "price_change_percentage_24h_in_currency": 5.081877083133561
 }
 */

struct CoinModel: Identifiable, Codable {
	let id, symbol, name: String
	let image: String
	let currentPrice: Double
	let marketCap, marketCapRank, fullyDilutedValuation: Double?
	let totalVolume, high24H, low24H: Double?
	let priceChange24H, priceChangePercentage24H: Double?
	let marketCapChange24H: Double?
	let marketCapChangePercentage24H: Double?
	let circulatingSupply, totalSupply, maxSupply, ath: Double?
	let athChangePercentage: Double?
	let athDate: String?
	let atl, atlChangePercentage: Double?
	let atlDate: String?
	let lastUpdated: String?
	let sparklineIn7D: SparklineIn7D?
	let priceChangePercentage24HInCurrency: Double?
	let currentHoldings: Double?

	enum CodingKeys: String, CodingKey {
		case id, symbol, name, image
		case currentPrice = "current_price"
		case marketCap = "market_cap"
		case marketCapRank = "market_cap_rank"
		case fullyDilutedValuation = "fully_diluted_valuation"
		case totalVolume = "total_volume"
		case high24H = "high_24h"
		case low24H = "low_24h"
		case priceChange24H = "price_change_24h"
		case priceChangePercentage24H = "price_change_percentage_24h"
		case marketCapChange24H = "market_cap_change_24h"
		case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
		case circulatingSupply = "circulating_supply"
		case totalSupply = "total_supply"
		case maxSupply = "max_supply"
		case ath
		case athChangePercentage = "ath_change_percentage"
		case athDate = "ath_date"
		case atl
		case atlChangePercentage = "atl_change_percentage"
		case atlDate = "atl_date"
		case lastUpdated = "last_updated"
		case sparklineIn7D = "sparkline_in_7d"
		case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
		case currentHoldings
	}

	func updateHoldings(amount: Double) -> CoinModel {
		CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24HInCurrency, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
	}

	var currentHoldingsValue: Double {
		(currentHoldings ?? 0) * currentPrice
	}

	var rank: Int {
		Int(marketCapRank ?? 0)
	}
}

struct SparklineIn7D: Codable {
	let price: [Double]?
}
