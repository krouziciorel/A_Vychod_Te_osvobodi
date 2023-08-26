#charset "utf-8"

/*
 *   A Východ Tě osvobodí
 *
 *   Česká textová hra sledující osud českého rytíře
 *   Orla z Lipé.
 */

#include <adv3.h>
#include <cs_cz.h>

/*
 *   Církevní soudce
 */
cirkevniSoudce : Person 'církevní soudce' 'soudce' *1 @mistnostPopraviste
	"Muž, kterého před sebou vidíš, je již staršího vydání, neradno si s ním však zahrávat. "

    // inicializace zahájení rozhovoru
    specialDesc = "<<cirkevniSoudce.initiateConversation(cirkevniSoudceObzalovava, 'obzaloba')>> "
	properName = 'Benediktus' 
    globalParamName = 'stařec'
    gcName = 'soudce, soudci, soudce, soudci, soudcem'
    gcVocab = 'soudce/soudci'

;

+ cirkevniSoudceMluvi : InConversationState

    isInitState = true

    stateDesc = "Soudce vynáší ortel. " 
    specialDesc = "Soudce vznáší obžalobu. "

;

/* ------------------------------------------------------------------------ */
/*
 *   UVÍTÁNÍ NA ZÁKLADNĚ A VYSVĚTLENÍ PROBLÉMŮ
 *
 *   Tento stav a konverzační uzel 'welcome' níže je aktivován po společném
 *   výstupu z lodi (captainGuideToDomeInTravel).
 */
+ cirkevniSoudceObzalovava: ActorState
    stateDesc = "Soudce vznáší obžalobu. "

    /*
     *   Úmyslně ponecháme specialDesc prázdný, protože ho popíšeme skupinově
     *   v rámci kapitánova stavu. Tím se dosáhne skupinového efektu místo
     *   samostatného odstavce.
     */
    specialDesc = ""
;

/* ------------------------------------------------------------------------ */
/*
 *   Konverzační uzel představuje bod v konverzaci, kdy se nás velitel základny
 *   vítá a pokládá nám otázku. Uzel tedy řeší naše možné odpovědi.
 */
+ ConvNode 'obzaloba'

    /*
     *   Hráče v uzlu podržíme (isSticky) tak dlouho, dokud neodpoví. Odpovědět
     *   může jen ano či ne (YesTopic a NoTopic níže). Protože je hra určena
     *   začátečníkům, necháme vypsat doporučené odpovědi tagem <.topics> v
     *   textu a protože by mohlo být více doporučených témat, omezíme nabízené
     *   možnosti konverzace jen na ty konverzačního uzlu (limitSuggestions).
     */
    isSticky = true
    limitSuggestions = true

    /* V tomto uzlu oslovuje církevní soudce hráče hned na začátku hry. */
    npcGreetingMsg = "<.p><q>Rytíři Orle z Lipé, za zločiny proti církvi svaté jsi
                         byl odsouzen ke smrti stětím!</q> povídá hromovým hlasem soudce,
                      <q>protože však církev svatá je v co největší míře spravedlivá a milosrdná,
                         nabízí Ti možnost rozhřešení. Přijmeš-li znamení kříže a vytáhneš v boj
                         proti nevěřícím, můžeš tím odčinit veškeré své hříchy. Přijímáš tuto řeholi?</q> "

    /*
     *   Toto jsou hlášky, které se zobrazí, pokud hráč dělá něco jiného, než že
     *   by odpověděl na položenou otázku. Snažíme se ho udržet v konverzaci,
     *   kterou začal velitel.
     */
    npcContinueList: ShuffledEventList
    {
        [
            '<.p><q>Tobiáši, vnímáš nás vůbec? Ten kluk snad neslyší,</q>
                stěžuje si kapitán veliteli, <q>haló, Tobiáši!</q> ',
            '<.p><q>Koukni na toho kluka,</q> upozorňuje kapitán velitele, <q>on
                snad neslyší, že se ho na něco ptáš. Haló, Tobiáši!</q> ',
            '<.p><q>Koukni na toho kluka, on má snad klapky na uších a hraje si
                na Otíka!</q> povzdechl si kapitán, <q>a to po něm nechceš nic
                víc, než jestli proběhla cesta pohodě.</q> '
        ]

        /*
         *   Hlášky zobrazujeme s 50% pravděpodobností a poprvé je nezamícháme,
         *   protože jsou odstupňované.
         */
        eventPercent = 50
        shuffleFirst = nil
    }

    /* Nedovolíme hráči utéci z otázky tím, že by zakončil konverzaci. */
    canEndConversation(actor, reason)
    {
        switch(reason)
        {
        case endConvBye:
            /* Proc tohle nenastava? Zvoli se vzdy DefaultAnyTopic. */
            "<.p>Hodil jsi neurčitě do prostoru nashledanou, ale zastavilo tě
                ostřejší kapitánovo upozornění: <q>Tobiáši, ještě jsme
                nedomluvili, velitel Petronov se ptal, zda cesta proběhla v
                pořádku.</q> ";
            return blockEndConv;
        case endConvTravel:
            "<.p>Rád bys odešel, ale slušné vychování ti brání odejít vprostřed
                hovoru. Velitel se přece ptal, jestli cesta byla v pohodě. ";
            return blockEndConv;
        default:
            return nil;
        }
    }

;

++ YesTopic, SuggestedYesTopic
    "<.p><q>Přijímám,</q> rozhodl jsi se neodporovat. Prelát se usmívá a odpovídá:
        <.p><q>Náprava hříšníků je posláním církve svaté. Nyní se vydej splnit svůj slib, 
           daný bohu a církvi svaté. </q> a znamením kříže Ti žehná. "
;

++ NoTopic, SuggestedNoTopic
    "<.p><q>Ne, kašlu na...</q> hrdě odpovídáš, ale do řeči ti skočil prelát:
            <.p><q>Jsi nenapravitelný hříšník a takoví končí v pekle. Mistře ostrého meče, 
               konej svojí povinnost.</q> "
;
