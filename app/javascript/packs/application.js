/* app/javascript/packs/application.js */

require("@rails/ujs").start();
// require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("../purchase_card");
require("../buy_card");
require("../purchase_price");

import "stylesheets/application"; // Add this line
