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
 *   Objekt, který reprezentuje postavu hráče ve hře.
 */
hrac : Actor

    /*
     *   Dám postavě jméno a definuji slovník.
     */
    neme = 'Orel z Lipé'
	vocabWords = 'Orel'
    gender = 1

    /*
     *   Nechci hráče trápit tím, že by postava něco neunesla
     */
    maxSingleBulk = 10000

    desc = "Jsem obyčejný český rytíř. "

    /* Hráč začíná na popravišti před církevním tribunálem. */
    location = mistnostPopraviste
;

//+ diplom : Thing  'vysokoškolský diplom' 'diplom' *2
//"Nyní už nejsem študent, ale vyštudent. "
//;

