function randomValueFromSelect(htmlId) {
  return _.sample(
    $(htmlId + " > option").map(
      function() {
        return this.value;
     })
    .get())
}


