/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let id : Int?
	let name : String?
	let tagline : String?
	let first_brewed : String?
	let description : String?
	let image_url : String?
	let abv : Double?
	let ibu : Int?
	let target_fg : Int?
	let target_og : Int?
	let ebc : Int?
	let srm : Int?
	let ph : Double?
	let attenuation_level : Int?
	let volume : Volume?
	let boil_volume : Boil_volume?
	let method : Method?
	let ingredients : Ingredients?
	let food_pairing : [String]?
	let brewers_tips : String?
	let contributed_by : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case tagline = "tagline"
		case first_brewed = "first_brewed"
		case description = "description"
		case image_url = "image_url"
		case abv = "abv"
		case ibu = "ibu"
		case target_fg = "target_fg"
		case target_og = "target_og"
		case ebc = "ebc"
		case srm = "srm"
		case ph = "ph"
		case attenuation_level = "attenuation_level"
		case volume = "volume"
		case boil_volume = "boil_volume"
		case method = "method"
		case ingredients = "ingredients"
		case food_pairing = "food_pairing"
		case brewers_tips = "brewers_tips"
		case contributed_by = "contributed_by"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
		first_brewed = try values.decodeIfPresent(String.self, forKey: .first_brewed)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		abv = try values.decodeIfPresent(Double.self, forKey: .abv)
		ibu = try values.decodeIfPresent(Int.self, forKey: .ibu)
		target_fg = try values.decodeIfPresent(Int.self, forKey: .target_fg)
		target_og = try values.decodeIfPresent(Int.self, forKey: .target_og)
		ebc = try values.decodeIfPresent(Int.self, forKey: .ebc)
		srm = try values.decodeIfPresent(Int.self, forKey: .srm)
		ph = try values.decodeIfPresent(Double.self, forKey: .ph)
		attenuation_level = try values.decodeIfPresent(Int.self, forKey: .attenuation_level)
		volume = try values.decodeIfPresent(Volume.self, forKey: .volume)
		boil_volume = try values.decodeIfPresent(Boil_volume.self, forKey: .boil_volume)
		method = try values.decodeIfPresent(Method.self, forKey: .method)
		ingredients = try values.decodeIfPresent(Ingredients.self, forKey: .ingredients)
		food_pairing = try values.decodeIfPresent([String].self, forKey: .food_pairing)
		brewers_tips = try values.decodeIfPresent(String.self, forKey: .brewers_tips)
		contributed_by = try values.decodeIfPresent(String.self, forKey: .contributed_by)
	}

}