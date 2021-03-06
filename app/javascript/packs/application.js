import "bootstrap";
import { mapTool } from "../plugins/map";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import "../plugins/flatpickr";
import { initStarRating } from "../plugins/init_star_rating";

initMapbox();
mapTool();
initStarRating();

