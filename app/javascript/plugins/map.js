// import { injectCoordinates, injectMap } from './geocoder';

// const mapTool = () => {
//   window.addEventListener('load', (event) => {
//     // prevent form's default behavior
//     event.preventDefault();

//     // get input value
//     const location = document.getElementById('location')
//     if (location) {

//     }
//     const mapboxKey = 'pk.eyJ1IjoianBhdWwyNCIsImEiOiJjanpqeHNncW0wZHZwM2lxaW12azV3OXZlIn0.fvB8AM5mA7k4OIvXWF6g2A';
//     // trigger request to Google Maps API
//     fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${location}.json?access_token=${mapboxKey}`)
//       .then(response => response.json())
//       .then((data) => {
//         const coordinates = {
//           lng: data.features[0].geometry.coordinates[0],
//           lat: data.features[0].geometry.coordinates[1]
//         };
//         injectCoordinates(coordinates);
//         injectMap(coordinates);
//       });
//   });
// }

// export { mapTool }

