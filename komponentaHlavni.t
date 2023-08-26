#charset "utf-8"

/*
 *   A Východ Tě osvobodí
 *
 *   Česká textová hra sledující osud českého rytíře
 *   Orla z Lipé.
 */

#include <adv3.h>
#include <cs_cz.h>
#include <date.h>

#ifdef TADS_INCLUDE_NET
    #include <tadsnet.h>
#endif

/*
 *   Objekt versionInfo je povinný objekt, který každá hra musí mít. V něm lze
 *   vyplnit řadu základních informací o hře.
 */
versionInfo: GameID

    /* Jako ISBN u knížek, generátor: http://www.tads.org/ifidgen/ifidgen */
    IFID = 'C4D7E4CD-6AAA-4D33-A9E3-56CE5BFB4F69'

    name = 'A Východ Tě osvobodí'
    byline = 'napsal Kroužící orel'
    authorEmail = 'Luděk Šťastný <ludek.stastny@gmail.com>'
    desc = 'Textová hra sledující osud středověkého rytíře Orla z Lipé'
    version = '0.1'
    languageCode = 'cs-CZ'
    genreName = 'Středověké království české'
    licenseType = 'Freeware'

    /* Podle Plotkinovy stupnice: Merciful, Polite, Tough, Nasty, Cruel */
    forgivenessLevel = 'Polite'

    /* Co se má stát, když hráč zadá příkaz "o hře". */
    showAbout()
    {
        "<i>Hra A Východ Tě osvobodí</i> Vás vítá!

            <.p>Tato textová hra hráče zavede do doby středověké a sleduje osud 
            jednoho obyčejného rytíře.  

            <.p>Příběh se ovládá psaním příkazů ve formě jednoduchých vět. Níže
            uvádím základní konstrukce příkazů, kterým příběh rozumí. Ve
            skutečnosti rozumí daleko více příkazům a daleko více formám, o
            kterých se dočtete v návodu, ale účelem tohoto souhrnu je poskytnout
            stručný přehled nejdůležitějších. Místo (objekt) dosadíte název
            jakéhokoliv předmětu, který se ve hře vyskytuje. Části příkazů v
            hranatých závorkách nejsou povinné a lomítko značí alternativní
            možnosti. V rozhovorech se kromě existujících věcí dá ptát i na
            (téma) zmíněné ve hře.

            <.p>Systémové příkazy:
            <ul>
            <li>detailní skóre</li>
            <li>ulož, nahraj, vrať tah, restart</li>
            </ul>

            Pohyb a postoje hráče:
            <ul>
            <li>s, j, v, z, sv, sz, jv, jz (pohyb ve směru světových stran)</li>
            <li>nahoru, dolů, dovnitř, ven (další směry)</li>
            <li>sedni/stoupni/lehni si [na (objekt)], vstaň, slez</li>
            </ul>
    
            Manipulace s věcmi:
            <ul>
            <li>inventář</li>
            <li>vem/polož (objekt), dej (objekt) do/na/za/pod (objekt)</li>
            <li>otevři/zavři/odemkni/zamkni (objekt)</li>
            <li>oblékni/obuj/svlékni/zuj (objekt)</li>
            <li>nasaď/sundej si (objekt)</li>
            </ul>
    
            Akce:
            <ul>
            <li>rozhlédni se, prozkoumej/přečti (objekt), koukni do/skrz
                (objekt)</li>
            <li>stiskni/pohni/zatáhni/zatlač/otoč (objekt)</li>
            <li>sněz/ochutnej/očichej (objekt)</li>
            </ul>

            Rozhovor s postavou:
            <ul>
            <li>pozdrav, rozluč se (začátek a konec rozhovoru není povinný)</li>
            <li>zeptej se na (objekt/téma), řekni o (objektu/tématu), požádej o
            (objekt), ukaž/podej (objekt)</li>
            <li>ano, ne (odpovědět na otázku položenou postavou)</li>
            <li>témata (navrhne témata, o kterých můžete mluvit, ale jen
            očividná, zdaleka ne všechna)</li>
            </ul>
    
            Navíc příběh může jednorázově nabídnout zvláštní konverzační
            možnosti mimo schéma zeptej/řekni (např. <q>Mohl by ses
            omluvit.</q>). Potom lze zadat příkaz v nabízeném tvaru rozkazovacím
            způsobem (OMLUV SE), obvykle stačí jen pár prvních slov. ";
    }

    /* Co se má stát, když hráč zadá příkaz "autoři". */
    showCredit()
    {
        "<.p>A Východ Tě osvobodí je textová konverzační hra vytvořená Luďkem Šťastným.

            <.p>Hra je naprogramována v systému TADS 3 od Michaela J. Robertse,
            využívám maximum z výborného českého překladu od autora jménem Gaspoda.";
    }
;

/*
 *   Po úspěšném dohrání hry nabídneme volbu "doslov". To není standardní volba,
 *   takže ji musíme vyrobit.
 */
finishOptionAfterword: FinishOption
    doOption()
    {
        "<.p>Počítačoví pamětníci si možná všimnou, že tato hra se od běžných
            českých textových her trochu odlišuje. Zde nefunguje univerzální 
			příkaz POUŽIJ, na který je většina z nás zvyklá. Hru jsem
            naprogramoval v TADSu, jednom z nejpokročilejších systémů na tvorbu
            textových adventur, který opravdu nádherně modeluje svět kolem nás
			včetně komunikace s postavami.
 
            <.p><tab indent=4><i><tab id=t1>Kroužící orel<br>
            <tab to=t1>ČR<br>
            <tab to=t1>2023</i>";

        /* Indikujeme, že chceme opět nabídnout menu konce hry. */
        return true;
    }

    desc = "přečíst si <<aHrefAlt('doslov', 'DOSLOV', '<b>D</b>OSLOV',
        'Ukázat doslov')>>"
    responseKeyword = 'doslov'
    responseChar = 'd'
;

/*
 *   Naopak volba zajímavých možností k vyzkoušení je standardní volbou, jen
 *   musíme poskytnout její obsah.
 */

// dodělat

modify finishOptionAmusing
    doOption()
    {
        "Pár tipů, na které byste neměli při hraní zapomenout:
            <.p>
            <ul>
            \n<li>Pečlivě prozkoumat všechny objekty v místnostech a nezapomenout na dekorace.
            \n<li>V průběhu hry kreslit mapu.
            \n<li>A především nechat se unášet atmosférou hry, kterou se autor snaží přiblížit jak popisem lokací, tak pomocí rozhovorů.
            </ul>
            <.p>";

        /* Indikujeme, že chceme opět nabídnout menu konce hry. */
        return true;
    }
;

/* ------------------------------------------------------------------------ */
/*
 *   Hráč, který je zcela ztracený, by mohl zkusit požádat o nápovědu, takže se
 *   mu pokusíme pomoci. Protože máme více zdrojů informací pro pomoc v různých
 *   situacích, nabídneme mu seznam příkazů, kterými se může ke konkrétní
 *   pomoci dostat.
 */
DefineSystemAction(Help)
    execSystemAction()
    {
        "Více informací získáte kdykoliv napsáním jednoho z následujících
            příkazů na příkazové řádce:

            \b<<aHref('o hře', 'O HŘE')>> -- jak hra vznikla a stručně o jejím
            ovládání
            \n<<aHref('autor', 'AUTOR')>> -- kdo hru vytvořil a poděkování
            \n<<aHref('rady', 'RADY')>> -- vestavěné rady a nápovědy k příběhu
            \n<<aHref('návod', 'NÁVOD')>> -- podrobný návod, jak hrát
            interaktivní fikci ";
    }
;

VerbRule(Help)
    ('ukaž' | 'ukázat' | 'zobraz' | 'zobrazit' | ) ('pomoc' | 'nápověda'
    | 'nápovědu' | 'náp')
    | ('pomož' | 'napověz' | 'pomoct') ( | 'mi')
    | 'help' : HelpAction
    verbPhrase = 'ukázat/ukazu{ješ}/ukázal{a} nápovědu'
;

/* ------------------------------------------------------------------------ */
/*
 *   Objekt gameMain je další povinný objekt, který hra musí mít. Knihovna volá
 *   jeho metody při spuštění hry.
 */
gameMain: GameMainDef

    /* Který objekt představuje hráče. */
    initialPlayerChar = hrac

    /* Zobrazení intra a titulku. */
    showIntro()
    {
        "<.p>--- Léta páně 1137 ---

		 <.p>Ano, to není sen, tohle je popraviště...\b\b\b";

       	    "<b><center><font size=+2>A Východ Tě osvobodí</font></b></center>\n
            <b><center>napsal Kroužící orel</b></center>\n
            <center>Vydání <<versionInfo.version>>.</center>
			\b\b\b<center>Pomoc získáte příkazem
            <<aHref('nápověda', 'NÁPOVĚDA')>>.\n\b</center>\b\b\b";
    }

    /* Zobrazení rozloučení. */
    showGoodbye()
    {
        "<.p>Děkuji, že jste si zahráli hru <i>A Východ Tě osvobodí</i>!\b";
    }
;
