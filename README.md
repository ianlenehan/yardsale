# Yard Sale

[Web Link](https://yardsale-irl.herokuapp.com)
(<i>Best viewed on Chrome browser on Mobile</i>)

Yard Sale is a mobile app designed to allow users to easily list items for sale or free. Each listing is geolocated with either the user's current location or a saved default location.

Any user can browse the listed items in the neighbourhood or in the neighbourhood or their saved default location.

#### Digits

User verification is managed through Twitter's Fabric Digits integration. No passwords are ever needed with Digits, as the user receives an SMS with a 6 digit code after they enter their phone number. This validates the login.

After logging in for the first time, the new user must fill in their name, email and assign a default location to their account.

#### Location

When browsing for items, the default search radius is 5km, and items are listed by proximity to either the user's default location or their current location (this is selected by the user from the bottom nav bar). The search radius can be increased by 5km any number of times when at the bottom of the search results.

NB If no items are present after logging in and completing the account details, a greater search radius may be required.  

#### Favourites

When browsing, a user may mark an item as a favourite by swiping left on the image. A star should appear to signal that the item has been favourited. A user can access their favourites through the Favourites link on the bottom nav bar. An item can be removed from Favourites by swiping right.

#### Transacting

More details on the listed item can be found by tapping on the information overlay on each image. Through here, a user can contact the item owner via an email link to arrange collection etc.

### Gems, plugins, languages, libraries and frameworks
* Ruby
* Rails
* JavaScript
* jQuery
* jQuery Mobile
* Fabric / Digits SDK
* Cloudinary
* HTTParty
* Geocoder
* Font Awesome
