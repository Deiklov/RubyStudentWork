document.addEventListener('DOMContentLoaded', function () {
    const container = document.querySelector('#explicit__container');

    if (!container) return;

    const form = container.querySelector('#explicit__form');
    form.addEventListener('ajax:success', function(evt) {
        const response = evt.detail[0];
        let result_div=document.querySelector('#ajax_result')
        const json_obj = JSON.parse(JSON.stringify(response));
        let table = document.querySelector('#result_table');
        switch (json_obj.key) {
            case "sort":
                result_div.innerHTML = "<h5>Result sorted array " + json_obj.arrlist + "</h5>";
                break;
            case "noknod":
                result_div.innerHTML = "<h3>NOD="+json_obj.nod+" NOK="+json_obj.nok+"</h3>";
                break;
            case "trig":
                result_div.innerHTML = "<h3>Result is "+json_obj.result+"</h3>";
                break;
            case "comb":
                result_div.innerHTML = "<h3>Reversal for n=n!="+json_obj.reversal+"  Combination CN(k)="+
                    json_obj.combination+"  Placing AN(k)="+json_obj.placing+"</h3>";
                break;
            default:
                alert( 'Я таких значений не знаю' );
        }
        // if (json_obj.key=="sort") {
        //     result_div.innerHTML = "<h3>" + json_obj.arrlist + "</h3>";
        // }
        // if (json_obj.key=="noknod") {
        //     result_div.innerHTML = "<h3>NOD="+json_obj.nod+" NOK="+json_obj.nok+"</h3>";
        // }
    });
});