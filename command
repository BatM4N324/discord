async function getCars(count = 100) {
  const cars = [];

  for (let i = 0; i < count; i++) {
    const res = await fetch(
      "https://en.wikipedia.org/api/rest_v1/page/random/summary"
    );
    const data = await res.json();

    if (data.thumbnail && data.thumbnail.source) {
      cars.push({
        img: data.thumbnail.source,
        name: data.title
      });
    } else {
      i--; // retry if no image
    }
  }

  return cars;
}

getCars(100).then(console.log);
