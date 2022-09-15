$('#item_form').validate({
    rules: {
        name: { 
				required: true 
        },
        price: { 
				required: true 
        },
       stock: { 
				required: true ,
				maxlength:255
        },
        setumei: { 
				required: true ,
				maxlength:255
        },
        syousai: { 
				required: true,
				maxlength:255 
        },
        picture: { 
				required: true 
        },
        
    },
	messages: {
            name: {
                required: '入力してください'
            },
            price: {
                required: '入力してください'
            },
            stock: {
                required: '入力してください'
                },
            setumei: {
                required: '入力してください',
                maxlength:'255文字までです'
            },
            syousai: {
                required: '入力してください',
                maxlength:'255文字までです'
            },
            picture: {
                required: '入力してください'
               
            },
           
        },
});

$('#inquery_form').validate({
    rules: {
        name: { 
				required: true 
        },
        email: { 
				required: true 
        },
        inquery: { 
				required: true ,
				maxlength:255
        }
    },
	messages: {
            name: {
                required: '入力してください'
            },
            email: {
                required: '入力してください'
            },
           	inquery: {
                required: '入力してください',
                maxlength:'文字数オーバー'
            },
        }
});

$('#review_form').validate({
    rules: {
        comment: { 
				maxlength:255
        },
    },
	messages: {
           	comment: {
                maxlength:'文字数オーバー'
            },
        }
});

$('#edit_user').validate({
    rules: {
        name: { 
				required: true 
        },
        name_kana: { 
				required: true ,
				myregex: '^[ァ-ヶー　]*$'
        },
        nickname: { 
				required: true 
        },
        zipcode : { 
				number: true,
				required: false 
        },
        email: { 
				email: true 
        },
        pass: { 
				required: true 
        },
    },
	messages: {
            name: {
                required: '入力してください'
            },
            name_kana: {
                required: '入力してください',
                myregex: 'カタカナで入力してください'
            },
            nickname: {
                required: '入力してください'
            },
            zipcode: {
                number: '半角数字で入力してください'
            },
            email: {
                zipcode: '正しくありません'
            },
           	pass: {
                required: '入力してください'
            },
        },
        errorPlacement: function(error, element){
            // data-error_placementで指定された要素に追加
            error.appendTo(element.data('error_placement'));
        },
        
});

$.validator.addMethod("myregex", function(value, element, reg_str) {
	var re = new RegExp(reg_str);
	return re.test(value);
}, "入力値が正しくありません");
