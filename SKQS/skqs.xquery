xquery version "3.0";

import module namespace  functx = "http://www.functx.com" at 'functx.xql';

let $bu := doc("SKQSTree.xml")/listBibl/listBibl
(:
let $author := functx:distinct-deep($bu//author)
let $date := functx:distinct-deep($bu//date)
<<<<<<< HEAD
let $roleName := functx:distinct-deep($bu//author/persName/roleName)
let $start := ('作者', '書籍', '朝代')
return
    <div>
    {(:設定起始類別:)
    for $p in $start
    return
        <Declaration><Class>{attribute IRI{$start}}</Class></Declaration>}
    {(:設定起始注腳、資料屬性、物件屬性:)
    （）
    }
    {for $p in $author
=======
let $roleName := functx:distinct-deep($bu//persName/roleName)
:)
for $book in $bu//bibl
return 
    <ClassAssertion>
        <Class>{attribute IRI{"#"||$book/../head/text()}}</Class>
        <NamedIndividual>{attribute IRI{"#"||$book/title/text()||"_"||data($book/title/@xml:id)}}</NamedIndividual>
    </ClassAssertion>
    
    
(:
    <div>
    {for $leishu in $bu//listBibl
    return
        <div>
            <Declaration><Class>{attribute IRI{"#"||data($leishu/head)}}</Class></Declaration>
            <SubClassOf>
                <Class>{attribute IRI{"#"||data($leishu/head)}}</Class>
                <Class>{attribute IRI{"#"||data($leishu/../head)}}</Class>
            </SubClassOf>
            {for $book in $leishu/bibl
            return
                <div>
                    <Declaration>
                        <NamedIndividual>{attribute IRI{"#"||data($book/title)||"_"||data($book/title/@xml:id)}}</NamedIndividual>
                    </Declaration>

                    {for $author in $book/author
                    return
                    <ObjectPropertyAssertion>
                        <ObjectProperty>{attribute IRI{"#"||data($author/persName/roleName)}}</ObjectProperty>
                        <NamedIndividual>{attribute IRI{"#"||$author/persName/text()}}</NamedIndividual>
                        <NamedIndividual>{attribute IRI{"#"||data($book/title)||"_"||data($book/title/@xml:id)}}</NamedIndividual>
                    </ObjectPropertyAssertion>}
                </div>
            }
        </div>
    }
    </div>       <div>{for $p in $author
        for $pp in $p/persName/addName
>>>>>>> origin/newskqs
        return
            <div>
            <DataPropertyAssertion>
                 <DataProperty>
                    {attribute IRI{"#"||data($pp/@n)||"為"}}
                </DataProperty>
                <NamedIndividual>
                    {attribute IRI{"#"||$p/persName/text()}}
                </NamedIndividual>
                <Literal datatypeIRI="http://www.w3.org/1999/02/22-rdf-syntax-ns#string">
                    {data($pp)}
                </Literal>                
            </DataPropertyAssertion>
            </div>
    }</div>
<<<<<<< HEAD
    (:
=======
    <div>{
>>>>>>> origin/newskqs
        {for $p in $roleName
        return
            <div>
            {element Declaration{
            element ObjectProperty{
            attribute IRI {"#"||$p/text()}}}}
            {element SubObjectPropertyOf{
            element ObjectProperty{
            attribute IRI {"#"||$p/text()}},
            element ObjectProperty{
            attribute IRI {"#著述"}}}}
            </div>}
        {for $p in $date
        return
            <div>
            {element Declaration{
            element Class{
            attribute IRI {"#"||data($p)}}}}
            {element SubClassOf{
            element Class{
            attribute IRI {"#"||data($p)}},
            element Class{
            attribute IRI {"#朝代"}}}}
            {element AnnotationAssertion{
            element AnnotationProperty{
            attribute IRI {"#hasID"}},
            element IRI{"#"||data($p)},
            element Literal{
            attribute datatypeIRI {"http://www.w3.org/2001/XMLSchema#string"},
            data($p/@n)}}}
            </div>
<<<<<<< HEAD
        ()}
=======
        }
>>>>>>> origin/newskqs
        {for $p in $author
        return
            <div>
            <Declaration>
                <NamedIndividual>{attribute IRI{"#"||$p/persName/text()}}</NamedIndividual>
            </Declaration>
            <ClassAssertion>
                <NamedIndividual>{attribute IRI{"#"||$p/persName/text()}}</NamedIndividual>
                <Class IRI="#作者"/>
            </ClassAssertion>
            <DataPropertyAssertion>
                <DataProperty IRI="#id為"/>
                <NamedIndividual>{attribute IRI{"#"||$p/persName/text()}}</NamedIndividual>
                <Literal>
                    {attribute datatypeIRI {"http://www.w3.org/2001/XMLSchema#string"}}
                    {data($p/@xml:id)}
                </Literal>
            </DataPropertyAssertion>
            </div>
        }
        {for $leishu in $bu//listBibl
        return
            <div>
                <Delcaration>
                    <Class>{attribute IRI{"#"||data($leishu/head)}}</Class>
                </Delcaration>
                <SubClassOf>
                    <Class>{attribute IRI{"#"||data($leishu/head)}}</Class>
                    <Class>{attribute IRI{"#"||data($leishu/../head)}}</Class>
                </SubClassOf></div>
        }</div>
                {for $book in $leishu/bibl
                return
                    <div>{let $bk :=
                            <NamedIndividual>
                                {attribute IRI{"#"||data($book/title)||"_"||data($book/title/@xml:id)}}  
                            </NamedIndividual>
                        return
                        <div>
                            <Declaration>{$bk}</Declaration>
                            <ClassAssertion>
                                {$bk}
                                <Class>{attribute IRI{"#"||data($leishu/head)}}</Class>
                            </ClassAssertion>
                            <DataPropertyAssertion>
                                <DataProperty IRI="#id為"/>
                                {$bk}
                                <Literal>
                                    {attribute datatypeIRI {"http://www.w3.org/2001/XMLSchema#string"}}
                                    {data($book/title/@xml:id)}
                                </Literal>
                            </DataPropertyAssertion>
                            {for $au in $book/author
                            return
                                <ObjectPropertyAssertion>
                                    <ObjectProperty>
                                        {attribute IRI{"#"||data($au/persName/roleName)}}
                                    </ObjectProperty>
                                    <NamedIndividual>
                                        {attribute IRI{"#"||data($au/persName/text())}}
                                    </NamedIndividual>
                                    {$bk}
                                </ObjectPropertyAssertion>
                            }
                        </div>
                    }</div>
                }
            </div>
        }
    </div>
:)