function doLike(pid,uid)
{
	console.log(pid + "," + uid)
	
	//creating object in jquery
	const d={
		uid: uid,
		pid: pid,
		operation: 'Like'
	}
	
	$.ajax({
		
		url:"LikeServlet",
		data: d,
		success: function(data, textStatus, jqXHR){
			console.log(data);
			if(data.trim()=='true')
			{
				let c=$(".like-counter").html();
				c++;
				$('.like-counter').html(c);
			}
		},
		error: function(jqHXR, textStatus, data){
			console.log(data)
		}
	})
}