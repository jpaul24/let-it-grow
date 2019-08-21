// TODO: Write your JS code in here
import mapboxgl from 'mapbox-gl';

const injectCoordinates = (coordinates) => {
  const paragraphElement = document.getElementById('coordinates');
  paragraphElement.innerText = `${coordinates.lat}, ${coordinates.lng}`;
};

const injectMap = (coordinates) => {
  const lng = coordinates.lng;
  const lat = coordinates.lat;

  mapboxgl.accessToken = 'pk.eyJ1IjoianBhdWwyNCIsImEiOiJjanpqeHNncW0wZHZwM2lxaW12azV3OXZlIn0.fvB8AM5mA7k4OIvXWF6g2A';
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [ lng, lat ],
    zoom: 12
  });
  new mapboxgl.Marker()
    .setLngLat([ lng, lat ])
    .addTo(map);
};

export { injectCoordinates, injectMap };

