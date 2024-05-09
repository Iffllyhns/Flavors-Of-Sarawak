//
//  RecipeModel.swift
//  Flavors Sarawak
//
//  Created by Iffllyhns Azharri on 08/09/2023.
//

import Foundation

enum Category: String, CaseIterable, Identifiable, Equatable {
    
    var id: String { self.rawValue }
    
    case main = "Main"
    case side = "Side"
    case snack = "Snack"
    case soup = "Soup"
}

struct Recipe: Identifiable, Codable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var ingredients: [String]
    var directions: String
    var arAssetName: String
    var category: Category.RawValue
}

extension Recipe {
    static let all: [Recipe] = [
        
        Recipe(
            name: "Crispy Mee Tomato",
            image: "crispymee",
            description: "Crispy Mee Tomato is a unique dish popular in certain parts of Asia, where crispy noodles are served with a tangy tomato sauce.",
            ingredients: [
                "Yellow Noodles", "Chicken","Tomatoes", "Tomato Sauce/Ketchup", "Garlic", "Prawns", "Onions", "Salt", "Chilies", "Oyster Sauce", "Sugar", "White Pepper", "Chicken Stock", "Cornstarch", "Vegetables", "Spring Onions", "Red Chili", "Eggs", "Fried Shallots"
            ],
            directions: """
            1. Yellow noodles are deep-fried in oil until they are crispy and golden brown. Set aside.
            2. In a separate pan, sauté garlic and onions, followed by the ground meat and prawns.
            3. Once cooked, add tomatoes, tomato sauce, chilies, oyster sauce, sugar, salt, and pepper.
            4. Add chicken stock or water to make a gravy. Thicken the gravy using the cornstarch slurry.
            5. The gravy is poured over the crispy noodles just before serving to maintain the crispiness.
            6. Garnish with spring onions, chili, eggs, blanched vegetables, and fried shallots.
            """,
            arAssetName: "crispyMee1.usdz",
            category: "Main"
        ),
        
        Recipe(
            name: "Laksa Sarawak",
            image: "laksa",
            description: "A spicy and flavorful noodle soup with a shrimp based broth, rice vermicelli, prawns, and chicken, garnished with fresh coriander and lime.",
            ingredients: [
                "Prawn Shells & Heads", "Chicken Carcass","Water","Galangal (Lengkuas)", "Lemongrass (Serai)","Dried Chillies","Fresh Red Chillies", "Shrimp Paste (Belacan)", "Garlic", "Shallots", "Tamarind Paste", "Salt", "Sugar", "Coconut Milk", "Eggs", "Bean Sprouts", "Coriander", "Lime", "Chicken", "Prawns", "Laksa Noodles"
            ],
            directions: """
            1. Boil prawn shells, heads, and a chicken carcass in water to create a stock, then strain.
            2. Blend dried and fresh chillies, lemongrass, galangal, garlic, shallots, and other spices to produce a laksa paste.
            3. Fry the paste until aromatic before adding the stock, tamarind paste, coconut milk, salt, and sugar, allowing the mixture to simmer.
            4. Serve by placing noodles in a bowl, ladling the hot broth over them, and garnishing with shredded chicken, prawns, sliced eggs, bean sprouts, and other toppings.
            5. Accompany with lime slices and sambal belacan on the side.
            """,
            arAssetName: "laksaSarawak1.usdz",
            category: "Soup"
        ),
        
        Recipe(
            name: "Manok Pansoh",
            image: "pansoh",
            description: "Manok Pansoh is a traditional Iban dish from the state of Sarawak in Malaysia. It's chicken cooked in bamboo tubes over an open flame, which infuses the dish with a unique bamboo aroma. The chicken is marinated in a blend of aromatic ingredients and then sealed inside bamboo tubes before cooking.",
            ingredients: [
                "Chicken pieces", "Lemongrass", "Torch ginger flower (bunga kantan)", "Red onions or shallots", "Garlic", "Fresh ginger", "Salt", "Ground white pepper", "Water or chicken stock", "Bird's eye chili (optional for added heat)", "Bamboo tubes (for cooking)"
            ],
            directions: """
            1. To prepare Manok Pansoh, start by marinating chicken pieces with finely pounded lemongrass, torch ginger flower, red onions (or shallots), garlic, and ginger.
            2. Season this mix with salt and ground white pepper. If you like some heat, you can add chopped bird's eye chili.
            3. Once your chicken is well-marinated, stuff the mixture into bamboo tubes, adding a little water or chicken stock to ensure it remains moist while cooking.
            4. Seal the bamboo tubes by plugging the open end with banana leaves or any similar leaf.
            5. Place the bamboo tubes over an open flame or grill, ensuring they are frequently turned to cook the chicken evenly.
            6. Cook until the bamboo turns black and you can smell the aromatic infusion of herbs and bamboo.
            7. Once done, remove the contents from the bamboo tube and serve hot. If bamboo tubes aren't available, wrap the marinated chicken in banana leaves and either steam or bake until thoroughly cooked.
            """,
            arAssetName: "manokPansoh1.usdz",
            category: "Side"
        ),
        
        Recipe(
            name: "Kolo Mee",
            image: "kolomee",
            description: "Egg noodles served with minced beef, chicken, vegetables, and sometimes seafood, flavored with garlic.",
            ingredients: [
                "Beef", "Carrot", "Chicken", "Cornstarch", "Egg Noodles", "Garlic" , "Green Onions", "Green Bell Pepper", "Oyster Sauce", "Red Onion", "Red Chili", "Prawns", "Salt", "Sugar", "Soy Sauce" , "Tomatoes", "Tomato Ketchup"
            ],
            directions: """
            1. First, boil 500g of fresh yellow noodles until al dente and drain.
            2. In a pan, heat 2 tablespoons of vegetable oil and sauté minced garlic from 4 cloves until golden brown.
            3. Add 200g of minced chicken or beef, breaking it apart as it cooks.
            4. Once the meat is nearly cooked, stir in 2 tablespoons of oyster sauce, 1 tablespoon of light soy sauce, a tablespoon of dark soy sauce for coloring, and season with salt and pepper.
            5. In a separate bowl, mix together 2 tablespoons of light soy sauce, 1 tablespoon of oyster sauce, 2 teaspoons of sesame oil, a pinch of sugar, and a pinch of white pepper to form the noodle sauce.
            6. Toss the drained noodles in this sauce until well coated.
            7. Serve the noodles topped with the cooked meat, a sprinkle of finely chopped green onions, and optionally garnished with fried shallots and slices of red chili.
            8. If you desire a richer flavor, consider using halal beef or chicken bouillon in the noodle sauce.
            """,
            arAssetName: "koloMee1.usdz",
            category: "Main"
        ),
        
        Recipe(
            name: "Mee Sapi",
            image: "meesapi",
            description: "Mee Sapi translates to beef noodles in English. It's a popular dish in many parts of Asia, including Malaysia and Indonesia. The dish typically consists of noodles served in a beef broth, often accompanied by pieces of beef, vegetables, and sometimes meatballs. The recipe and preparation can vary by region and personal preference.",
            ingredients: [
                "Beef bones", "Beef brisket or any tender cut", "Garlic cloves", "Onion", "Star anise", "Cinnamon stick", "Water", "Salt and pepper", "Yellow noodles", "Bok choy or choy sum", "Spring onions", "Fried shallots", "Red chili slices or chili paste"
            ],
            directions: """
            1. In a large pot, combine beef bones, sliced beef brisket, smashed garlic cloves, quartered onion, star anise, and cinnamon stick with water, bringing it to a boil.
            2. Once boiling, lower the heat to let it simmer, skimming off any impurities for about 2-3 hours, ensuring the broth develops a rich flavor.
            3. Season the broth with salt and pepper.
            4. Separately, prepare your yellow noodles as per the packet instructions, ensuring they are al dente.
            5. In individual serving bowls, place the cooked noodles and ladle the hot beef broth over them.
            6. Make sure to include beef slices.
            7. Garnish with blanched greens like bok choy or choy sum, sprinkle some chopped spring onions and fried shallots on top, and add red chili slices or chili paste for an extra kick, if desired.
            8. Serve immediately while it's hot. Adjustments can be made to this basic recipe based on regional and personal tastes, such as adding beef meatballs or different herbs.
            """,
            arAssetName: "meeSapi1.usdz",
            category: "Main"
        ),
        
        Recipe(
            name: "Midin Belacan",
            image: "midin",
            description: "Midin is a type of fern popularly consumed in the state of Sarawak, Malaysia. Known for its crunchy texture, it is often stir-fried with various ingredients, one of the favorites being belacan (shrimp paste). Midin Belacan refers to the stir-fried fern with shrimp paste.",
            ingredients: [
                "Midin (fern)", "Belacan (shrimp paste)", "Red chilies", "Garlic", "Oil", "Salt"
            ],
            directions: """
            1. Clean and trim the midin by removing the hard stems and keeping the tender curly fronds.
            2. Prepare a paste by pounding together belacan, red chilies, and garlic.
            3. In a wok or large frying pan, heat the oil and sauté the pounded paste until aromatic.
            4. Add the midin to the wok and stir-fry for a few minutes until it's well-coated with the belacan mixture and cooked yet retaining its crunch.
            5. Season with salt according to taste, and serve immediately.
            """,
            arAssetName: "midinBelacan1.usdz",
            category: "Side"
        ),
        
        Recipe(
            name: "Kubuk Belacan",
            image: "paku",
            description: "Kubuk is another type of fern widely consumed in Malaysia, especially in states like Sarawak. Paku Belacan is a dish where the fern is stir-fried with shrimp paste, which is belacan in Malay.",
            ingredients: [
                "Paku (fern)", "Belacan (shrimp paste)", "Red chilies", "Garlic", "Oil", "Salt", "Lime juice or tamarind paste (optional for some tanginess)"
            ],
            directions: """
            1. Clean the paku fern by washing and trimming off any hard stems, retaining the tender parts.
            2. Create a paste by pounding together belacan, red chilies, and garlic.
            3. In a wok or frying pan, heat oil and fry the pounded paste until it's fragrant.
            4. Add the paku fern to the wok, stir-frying it until it's well mixed with the belacan paste and cooked while still maintaining its crunchy texture.
            5. Optionally, you can add a splash of lime juice or a bit of tamarind paste for an added tang.
            6. Season with salt to taste, stir well, and serve while it's hot.
            """,
            arAssetName: "kubukBelacan1.usdz",
            category: "Side"
        ),
        
        Recipe(
            name: "Tebaloi",
            image: "tebaloi",
            description: "Tebaloi, also known as Melanau Sago Biscuits, is a traditional snack from the Melanau community in Sarawak, Malaysia. It's made from sago flour and is commonly enjoyed with tea or coffee.",
            ingredients: [
                "Sago Flour", "Sugar","Grated Coconut", "Salt", "Pandan Leaves"
            ],
            directions: """
            1. Mix sago flour, sugar, grated coconut, and salt until well combined.
            2. The mixture is then flattened and shaped into thin sheets or patties.
            3. Traditionally, these patties are wrapped in pandan leaves and then baked or roasted over an open flame. This method gives tebaloi its unique aroma and slightly crispy texture.
            4. Once baked or roasted, the tebaloi can be further sliced into smaller pieces and air-dried to achieve its characteristic crunchy texture.
            """,
            arAssetName: "tebaloi1.usdz",
            category: "Snack"
        ),
        
        Recipe(
            name: "Terung Dayak Sardines",
            image: "terungdayak",
            description: "Terung Dayak with sardines is a fusion of traditional Bornean flavor with the convenience and taste of canned sardines. It's a straightforward dish that capitalizes on the sourness of Terung Dayak to complement the sardines.",
            ingredients: [
                "Terung Dayak", "Canned Sardines","Lemongrass (Serai)", "Water", "Garlic", "Shallots", "Salt", "Red Chili Sauce", "Oil", "Sugar", "Spring Onions", "Bird's Eye Chillies (Cili Padi)"
            ],
            directions: """
            1. In a pan, heat the oil and sauté the garlic, shallots, and chilies until aromatic.
            2. Add the Terung Dayak and stir-fry for a few minutes.
            3. Next, pour the canned sardines along with their sauce into the pan.
            4. Add lemongrass, salt, and sugar.
            5. Add water and let it simmer until the Terung Dayak softens and the flavors meld.
            6. Adjust seasoning if necessary, garnish if desired, and serve with rice.
            """,
            arAssetName: "terungDayak1.usdz",
            category: "Soup"
        )
    ]
}
