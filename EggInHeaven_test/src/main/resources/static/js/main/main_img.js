

//contextPath구하기
function getContextPath(){
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	console.log(hostIndex);

	const contextPath = location.href.substring(hostIndex,location.href.indexOf('/', hostIndex + 1));
	console.log(contextPath);
	
	return contextPath;
}

const contextPath = getContextPath();

const images = ["0.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"];

const chosenImage = images[Math.floor(Math.random() * images.length)]

const path = `${contextPath}/resources/main_img/${chosenImage}`;

console.log(path);

document.getElementById("random").src = path;

	

