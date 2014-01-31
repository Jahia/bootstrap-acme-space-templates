CKEDITOR.addTemplates('default',
    {
        // The name of the subfolder that contains the preview images of the templates.
        imagesPath:((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap-acme-space-templates/icons/templates/',
        // Template definitions.
        templates:[
            {
                title:'',
                image:'alert_default.png',
                description:'',
                html:'<div class="alert">' +
                    '<button type="button" class="close" data-dismiss="alert">×</button>' +
                    '<strong>Warning!</strong> Best check yo self, you\'re not looking too good.' +
                    '</div>'
            },
            {
                title:'',
                image:'alert_error.png',
                description:'',
                html:'<div class="alert alert-error">' +
                    '<button type="button" class="close" data-dismiss="alert">×</button>' +
                    '<strong>Oh snap!</strong> Change a few things up and try submitting again.' +
                    '</div>'
            },
            {
                title:'',
                image:'alert_success.png',
                description:'',
                html:'<div class="alert alert-success">' +
                    '<button type="button" class="close" data-dismiss="alert">×</button>' +
                    '<strong>Well done!</strong> You successfully read this important alert message.' +
                    '</div>'
            },
            {
                title:'',
                image:'alert_info.png',
                description:'',
                html:'<div class="alert alert-info">' +
                    '<button type="button" class="close" data-dismiss="alert">×</button>' +
                    '<strong>Heads up!</strong> This alert needs your attention, but it\'s not super important.' +
                    '</div>'
            },
            {
                title:'',
                image:'well.png',
                description:'',
                html:'<div class="well">' +
                    'Look, I\'m in a well!' +
                    '</div>'
            },
            {
                title:'',
                image:'well-white.png',
                description:'',
                html:'<div class="well well-white">' +
                    'Look, I\'m in a well white!' +
                    '</div>'
            },
            {
                title:'',
                image:'btn.png',
                description:'',
                html:'<a href="#" class="btn">' +
                    'Standard button' +
                    '</a>'
            },
            {
                title:'',
                image:'btn-primary.png',
                description:'',
                html:'<a href="#" class="btn btn-primary">' +
                    'Primary button' +
                    '</a>'
            },
            {
                title:'',
                image:'btn-info.png',
                description:'',
                html:'<a href="#" class="btn btn-info">' +
                    'Info button' +
                    '</a>'
            },
            {
                title:'',
                image:'btn-success.png',
                description:'',
                html:'<a href="#" class="btn btn-success">' +
                    'Success button' +
                    '</a>'
            },
            {
                title:'',
                image:'btn-warning.png',
                description:'',
                html:'<a href="#" class="btn btn-warning">' +
                    'Warning button' +
                    '</a>'
            },
            {
                title:'',
                image:'btn-danger.png',
                description:'',
                html:'<a href="#" class="btn btn-danger">' +
                    'Danger button' +
                    '</a>'
            },
            {
                title:'',
                image:'btn-inverse.png',
                description:'',
                html:'<a href="#" class="btn btn-inverse">' +
                    'Inverse button' +
                    '</a>'
            },
            {
                title:'',
                image:'media.png',
                description:'',
                html:'<div class="media">' +
                    '<a class="pull-left" href="#">' +
                    '<img href="#" src="#" />' +
                    '</a>'+
                    '<div class="media-body">'+
                    '<h4 class="media-heading">'+
                    'Media heading'+
                    '</h4>'+
                    'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.'+
                    '</div>'+
                    '</div>'
            },
            {
                title:'',
                image:'ul-example.png',
                description:'',
                html:'<ul class="fa-ul">' +

                    '<li>' +
                    '<i class="fa-li fa fa-chevron-circle-right">&nbsp;</i> ' +
                    'New bulleted lists' +
                    '</li>'+

                    '<li>' +
                    '<i class="fa-li fa fa-chevron-circle-right">&nbsp;</i> ' +
                    '<a target="_blank" href="http://fortawesome.github.io/Font-Awesome/examples/#list">' +
                    'Bulleted Lists Examples'+
                    '</a>'+
                    '</li>'+

                    '<li>' +
                    '<i class="fa-li fa fa-chevron-circle-right">&nbsp;</i> ' +
                    '<a target="_blank" href="http://fortawesome.github.io/Font-Awesome/icons/"> ' +
                    'Icons Complete liste here'+
                    '</a>'+
                    '</li>'+

                    '<li>' +
                    '<i class="fa-li fa fa-chevron-circle-right">&nbsp;</i> ' +
                    'New bulleted lists' +
                    '</li>'+
                    '</ul>'
            },
            {
                title:'',
                image:'table.png',
                description:'',
                html:'<table class="table table-bordered table-striped">' +
                    '<thead><tr><th>#</th><th>First Name</th><th>Last Name</th></tr></thead>'+
                    '<tbody><tr><td>1</td><td>Mark</td><td>Otto</td></tr><tr><td>2</td><td>Jacob</td><td>Thornton</td></tr><tr><td>3</td><td>Larry</td><td>the Bird</td></tr></tbody>' +
                    '</table>'
            },
            {
                title:'',
                image:'contact.png',
                description:'',
                html:'<p><strong>Mr. John Smith</strong><br/>' +
                    '<i class="fa fa-envelope"></i> <a href="mailto:john@anydomain.com" title="email">john@anydomain.com</a><br/>' +
                    '<i class="fa fa-phone"></i> +1 (234) 456-8900<br/>' +
                    '<i class="fa fa-external-link"></i> <a href="http://www.anydomain.com" title="web">www.anydomain.com</a><br/>' +
                    '<i class="fa fa-globe"></i> 1234 Main Street, 12345 Anytown, USA</p>'
            },
            {
                title:'',
                image:'definition.png',
                description:'',
                html:'<dl class="dl-horizontal">' +
                    '<dt>Rest</dt>' +
                    '<dd>REST (REpresentational State Transfer) est un style d’architecture pour les systèmes hypermédia distribués, créé par Roy Fielding en 2000 dans le chapitre 5 de sa thèse de doctorat1.</dd>' +
                    '</dl>'
            },
            {
                title:'',
                image:'blockquote.png',
                description:'',
                html:'<blockquote>' +
                    '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere tincidunt molestie. Ut ullamcorper rhoncus tristique. Etiam ac mattis felis. Phasellus egestas leo sed suscipit tempor. Sed eu consequat turpis. Maecenas ac nisl laoreet arcu ullamcorper convallis in vel arcu. Praesent suscipit nisi in elementum feugiat.</p>' +
                    '<small><strong>Author</strong>, Praesent venenatis libero eget sagittis pretium</small></blockquote>'
            },
            {
                title:'',
                image:'blockquote-right.png',
                description:'',
                html:'<blockquote class="pull-right clearfix">' +
                    '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere tincidunt molestie. Ut ullamcorper rhoncus tristique. Etiam ac mattis felis. Phasellus egestas leo sed suscipit tempor. Sed eu consequat turpis. Maecenas ac nisl laoreet arcu ullamcorper convallis in vel arcu. Praesent suscipit nisi in elementum feugiat.</p>' +
                    '<small><strong>Author</strong>, Praesent venenatis libero eget sagittis pretium</small></blockquote>'
            }
         ]
    });
