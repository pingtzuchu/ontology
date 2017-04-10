xquery version "3.0";

import module namespace functx="http://www.functx.com" at "functx.xql";

let $data := doc("SKQSTree.xml")/listBibl
let $IRI := ()
let $authorID := ()
let $class_bu :=
    for $bu in $data/listBibl
    return
        <div>
            {insert-before($IRI, 0, $bu/head/text())}
            {element Declaration{
            element Class {
            attribute IRI {"#"||$bu/head/text()}
            }}}
            {for $lei in $bu/listBibl
            return
                <div>
                    {insert-before($IRI, 0, $lei/head/text())}
                    {element Declaration{
                    element Class {
                    attribute IRI {"#"||$lei/head/text()}
                    }}}
                    {element SubClassOf{
                    element Class{
                    attribute IRI {"#"||$lei/head/text()}
                    },
                    element Class{
                    attribute IRI {"#"||$bu/head/text()}
                    }}}
                    {for $shu in $lei/listBibl
                    return
                        <div>
                            {insert-before($IRI, 0, $shu/head/text())}
                            {element Declaration{
                            element Class{
                            attribute IRI {"#"||$shu/head/text()}}}}
                            {element SubClassOf{
                            element Class{
                            attribute IRI {"#"||$shu/head/text()}},
                            element Class{
                            attribute IRI {"#"||$lei/head/text()}}}}
                        </div>
                    }
                    {for $bibl in $lei//bibl
                    return
                    <div>
                            {let $title :=
                                if (functx:is-value-in-sequence($bibl/title/text(), $IRI)) then $bibl/title/text()||"_"||data($bibl/title/@xml:id)
                                else $bibl/title/text()
                             return
                                <div>
                                    {element Declaration{
                                    element NamedIndividual{
                                    attribute IRI {"#"||$title}}}}
                                    {element ClassAssertion{
                                    element NamedIndividual{
                                    attribute IRI {"#"||$title}},
                                    element Class{
                                    attribute IRI {"#"||$bibl/../head/text()}}}}
                                    {for $author in $bibl/author
                                    return
                                    if (functx:is-value-in-sequence(data($author/@xml:id), $author)) then
                                        ()
                                    else
                                       let $action := insert-before(data($author/@xml:id), 0, $authorID)
                                       return
                                           <div>
                                                {element Declaration{
                                                element NamedIndividual {
                                                attribute IRI {"#"||$author/persName/text()}}}}
                                                {element ClassAssertion{
                                                element NamedIndividual{
                                                attribute IRI {"#"||$author/persName/text()}},
                                                element Class{
                                                attribute IRI {"#作者"}}}}
                                                {element ObjectPropertyAssertion{
                                                element ObjectProperty{
                                                attribute IRI {"#"||$author/persName/roleName/text()}},
                                                element NamedIndividual{
                                                attribute IRI {"#"||$author/persName/text()}},
                                                element NamedIndividual{
                                                attribute IRI {"#"||$title}}}}
                                           </div>
                                    }
                                </div>
                    }</div>
                    }
                </div>
                }
        </div>
        
return
    $class_bu