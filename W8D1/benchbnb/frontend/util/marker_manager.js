
class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    if (benches) {
      Object.values(benches).map( bench => {
        if (!Object.keys(benches).includes(bench.id)) {
          this.createMarkerFromBench(bench)
        }
      })
    }
  }

  createMarkerFromBench(bench) {
    const { lat, lng } = bench;
    console.log(lat);
    this.markers[bench.id] = new google.maps.Marker({
      position: { lat, lng },
      map: this.map,
      title: bench.description
    })
  }
}

export default MarkerManager;
