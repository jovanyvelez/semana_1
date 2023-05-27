export function jovanyActions (node,params){
        
    node.innerHTML = params;

    return {

        update(newParams){
            node.innerHTML = newParams;
        },
        destroy(){
            //console.log('Me voy del Dom');
        }
    }
}