function doAjaxCall(uri,databody,successfn,errorfn,method){
	$.ajax({
		url : uri,
		data : databody,
		type : method,
		success:successfn,
        error:errorfn
	})
}