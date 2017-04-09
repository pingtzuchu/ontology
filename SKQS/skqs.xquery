xquery version "3.0";

import module namespace functx="http://www.functx.com" at "functx.xql";

let $data := doc("SKQSTree.xml")
let $date := functx:distinct-deep($data//date)
for $dynasty in $date
return
    <Declaration><NamedIndividual>{attribute IRI {"#"||data($dynasty)}}</NamedIndividual></Declaration>
    
