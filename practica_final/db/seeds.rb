# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(name: "Downlight circular empotrable extraplano. Luz cálida.",
               name_led: "Downlight circular empotrable extraplano 18w.",
               name_incandescent: "Downlight de 2 lámparas de 26w.",
               power_led: 18,
               power_incandescent: 52,
               price_led: 19.90)
Product.create(name: "Downlight circular de sup. extraplano. Luz cálida.",
              name_led: "Downlight circular de sup. extraplano 18w.",
              name_incandescent: "Downlight superficie de 2 lámparas de 26w.",
              power_led: 18,
              power_incandescent: 52,
              price_led: 29.79)
Product.create(name: "Lámpara estándar E-27 (40w). Luz cálida.",
              name_led: "Lámpara estándar 5w E-27.",
              name_incandescent: "Lámpara incandescente de 40w.",
              power_led: 5,
              power_incandescent: 40,
              price_led: 4.50)
Product.create(name: "Lámpara estándar E-27 (50w). Luz cálida.",
              name_led: "Lámpara estándar 7w E-27.",
              name_incandescent: "Lámpara incandescente de 50w.",
              power_led: 7,
              power_incandescent: 50,
              price_led: 5.67)
Product.create(name: "Lámpara estándar E-27 (60w). Luz cálida.",
              name_led: "Lámpara estándar 10w E-27.",
              name_incandescent: "Lámpara incandescente de 60w.",
              power_led: 10,
              power_incandescent: 60,
              price_led: 7.53)
Product.create(name: "Lámpara dicrónica GU10.",
              name_led: "Lámpara dicrónica 6w GU10.",
              name_incandescent: "Lámpara dicrónica 40w GU10.",
              power_led: 6,
              power_incandescent: 40,
              price_led: 5.43)
Product.create(name: "Lámpara de vela opal E-14",
              name_led: "Lámpara de vela opal 7w",
              name_incandescent: "Lámpara de vela incandescente 25w",
              power_led: 7,
              power_incandescent: 25,
              price_led: 5.34)
Product.create(name: "Tubo 600 mm.",
              name_led: "Tubo T-8 10w 600 mm.",
              name_incandescent: "Tuo fluorestente 18w 600 mm.",
              power_led: 10,
              power_incandescent: 18,
              price_led: 9.08)
Product.create(name: "Tubo 1200 mm. Luz fría.",
              name_led: "Tubo T-8 18w 1200 mm.",
              name_incandescent: "Tubo fluorescente 36w 1200 mm.",
              power_led: 18,
              power_incandescent: 36,
              price_led: 11.60)
Product.create(name: "Tubo 1500 mm. Luz fría.",
              name_led: "Tubo T-8 25w 1500 mm.",
              name_incandescent: "Tubo fluorescente 56w 1500 mm.",
              power_led: 25,
              power_incandescent: 56,
              price_led: 16.30)
Product.create(name: "Panel 600x600 mm.",
              name_led: "Panel opal 600x600 mm. 40w.",
              name_incandescent: "4 tubos fluorescentes de 18w 600 mm.",
              power_led: 40,
              power_incandescent: 72,
              price_led: 78.26)

Admin.create!(email: 'root@root.com', password: 'rootroot')
