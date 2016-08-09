 $(document).ready(function()
      {
        $("#multipleupload").uploadFile({
        url:"http://dierection url/file.php",
        multiple:true,
        allowedTypes:"doc,docx,xlsx,xls,pdf",
        fileName:"myfile"
        });
      });