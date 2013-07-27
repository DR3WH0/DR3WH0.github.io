function cantload()
{
  img = document.getElementById("clustrMapsImg");
  img.onerror = null;
  img.src = "http://clustrmaps.com/images/clustrmaps-back-soon.jpg";
  document.getElementById("clustrMapsLink").href = "http://clustrmaps.com";
}
img = document.getElementById("clustrMapsImg");
img.onerror = cantload;
