# Helpdesk segéd

Helyben futó segédprogram helpdeskeseknek. Egyetlen HTML oldal, ami a saját gépeden fut, internetre semmit nem küld.

## Indítás
1. Töltsd le a repót (vagy csak az `index.html` fájlt és a `lib` mappát), és tartsd őket egy mappában.
2. Nyisd meg az `index.html`-t Edge-ben vagy Chrome-ban.

## Modulok
- **Hibajegy-sablonok:** válassz sablont, töltsd ki a mezőket, és másold a kész szöveget. A sablonok a „Sablonok szerkesztése” gombbal módosíthatók (`### Név` sorral kezdődik egy sablon, a mezők `{{Mező}}` alakúak).
- **Mellékek:** a jobb oldali panel mindig látszik. Szerkesztés soronként: `Név;Osztály;Mellék`. Kattintásra a mellék a vágólapra kerül.
- **PC-tulajdonos kereső:** a „Hardverlista betöltése” gombbal válaszd ki a `\\smbclust\db\Hardverlista2025_-_Ezt_használd.xlsb` fájlt. A böngésző helyben olvassa be, a licenszkulcsok rejtve maradnak, amíg rájuk nem kattintasz.
- **Távoli gép parancsok:** gépnév megadása után kész admin cmd parancsok másolhatók (C$ megnyitása, utolsó bejelentkezett user stb.).

A sablonok és a mellékek a böngésző helyi tárhelyén maradnak.

## Biztonság
A hardverlistát és más céges adatot **soha ne töltsd fel ide**. A `.gitignore` kizárja az Excel- és CSV-fájlokat.

Az Excel-olvasó a [SheetJS](https://sheetjs.com) (Apache 2.0, `lib/` mappa).
