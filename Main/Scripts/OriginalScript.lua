--[[
    Deobfuscated By: @ilvarni / discord; ilvarni

    Version 1.0.3a

    Preppy-Hub.lua
    Auto-Typer for Spelling Bee.

    ----------------------------

    Small Note; i kept their ChatGPT comments, lol.
]]


local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
print("[Spelling Bee! - Preppy Hub] Script loaded!")

local wordlist = {
    ["rbxassetid://119699946181489"] = "dolphin",
    ["rbxassetid://17620333788"] = "thesis",
    ["rbxassetid://18257417645"] = "refrain",
    ["rbxassetid://17620149976"] = "comply",
    ["rbxassetid://17627837193"] = "robust",
    ["rbxassetid://17632835647"] = "burial",
    ["rbxassetid://17632805150"] = "monk",
    ["rbxassetid://17620204375"] = "random",
    ["rbxassetid://18257146758"] = "pigeon",
    ["rbxassetid://17620183873"] = "margin",
    ["rbxassetid://17704895495"] = "transaction",
    ["rbxassetid://135308613056609"] = "villain",
    ["rbxassetid://102456753847783"] = "human",
    ["rbxassetid://77466979227881"] = "echo",
    ["rbxassetid://18263817395"] = "suck",
    ["rbxassetid://80738513122758"] = "absorb",
    ["rbxassetid://17620365116"] = "workout",
    ["rbxassetid://17627896746"] = "voluntary",
    ["rbxassetid://17632830629"] = "automatic",
    ["rbxassetid://18263903610"] = "alphabet",
    ["rbxassetid://18263893180"] = "password",
    ["rbxassetid://73040937432058"] = "immobilise",
    ["rbxassetid://107611408395063"] = "quill",
    ["rbxassetid://133882847828955"] = "uncomfortable",
    ["rbxassetid://17704908669"] = "validity",
    ["rbxassetid://90727890439436"] = "photographer",
    ["rbxassetid://138150769315459"] = "translucent",
    ["rbxassetid://126203841438523"] = "rhythm",
    ["rbxassetid://17707360297"] = "practitioner",
    ["rbxassetid://18257137133"] = "duck",
    ["rbxassetid://17704818087"] = "trauma",
    ["rbxassetid://119025155438467"] = "familiar",
    ["rbxassetid://17620325241"] = "pursuit",
    ["rbxassetid://17627829602"] = "sigh",
    ["rbxassetid://18263962173"] = "gender",
    ["rbxassetid://17620519693"] = "exile",
    ["rbxassetid://99874477789348"] = "pray",
    ["rbxassetid://17627808861"] = "vein",
    ["rbxassetid://97192746411344"] = "concentration",
    ["rbxassetid://18257268915"] = "abstract",
    ["rbxassetid://101791465848329"] = "hungry",
    ["rbxassetid://17632862191"] = "debris",
    ["rbxassetid://140417801525692"] = "semicircle",
    ["rbxassetid://86409026377667"] = "excellent",
    ["rbxassetid://85723587162167"] = "transportation",
    ["rbxassetid://18263755358"] = "melancholy",
    ["rbxassetid://106985843863114"] = "adolescent",
    ["rbxassetid://18257408753"] = "nonplussed",
    ["rbxassetid://75575501402787"] = "aspiration",
    ["rbxassetid://17704873644"] = "parallel",
    ["rbxassetid://98510562083918"] = "ink",
    ["rbxassetid://108828500723259"] = "agnostic",
    ["rbxassetid://18263987667"] = "flavour",
    ["rbxassetid://88497803472729"] = "formidable",
    ["rbxassetid://131174690191810"] = "abolish",
    ["rbxassetid://84228988235837"] = "betray",
    ["rbxassetid://17704903466"] = "scholarship",
    ["rbxassetid://116481385444935"] = "reliability",
    ["rbxassetid://17620602249"] = "albeit",
    ["rbxassetid://98225180005851"] = "meditate",
    ["rbxassetid://108734885770838"] = "state",
    ["rbxassetid://17705033632"] = "magnificent",
    ["rbxassetid://18264025587"] = "chronic",
    ["rbxassetid://17707340325"] = "firefighter",
    ["rbxassetid://17713083658"] = "consumption",
    ["rbxassetid://17620700276"] = "asthma",
    ["rbxassetid://70645856927149"] = "necromancer",
    ["rbxassetid://17705282482"] = "controversial",
    ["rbxassetid://71087464810297"] = "lightning",
    ["rbxassetid://18257253087"] = "accomplishment",
    ["rbxassetid://17713017966"] = "discombobulate",
    ["rbxassetid://17705254483"] = "correspondence",
    ["rbxassetid://83560684718752"] = "hypermetropia",
    ["rbxassetid://82887742240951"] = "forbid",
    ["rbxassetid://70867787098828"] = "burger",
    ["rbxassetid://17704808351"] = "await",
    ["rbxassetid://73124320355251"] = "anatomical",
    ["rbxassetid://17704822386"] = "vague",
    ["rbxassetid://17632856701"] = "curious",
    ["rbxassetid://17627920277"] = "gastronomic",
    ["rbxassetid://99199820973488"] = "zygote",
    ["rbxassetid://122475465397699"] = "furious",
    ["rbxassetid://116018579968737"] = "ricochet",
    ["rbxassetid://18263796834"] = "participation",
    ["rbxassetid://17620609623"] = "accommodate",
    ["rbxassetid://120578183641103"] = "deleterious",
    ["rbxassetid://17713030113"] = "sentimental",
    ["rbxassetid://17627869431"] = "convey",
    ["rbxassetid://74143004708139"] = "noble",
    ["rbxassetid://17705210045"] = "integrity",
    ["rbxassetid://97227188440853"] = "circle",
    ["rbxassetid://120763790488963"] = "broccoli",
    ["rbxassetid://17713098718"] = "diplomatic",
    ["rbxassetid://17704887854"] = "revelation",
    ["rbxassetid://17707289545"] = "tremendous",
    ["rbxassetid://17628083241"] = "wednesday",
    ["rbxassetid://94790688626425"] = "solidarity",
    ["rbxassetid://18263703239"] = "counterintuitive",
    ["rbxassetid://17704857752"] = "simultaneous",
    ["rbxassetid://18257534795"] = "exponential",
    ["rbxassetid://138704636737437"] = "alliance",
    ["rbxassetid://116383900625275"] = "strategic",
    ["rbxassetid://114962550365383"] = "diesel",
    ["rbxassetid://17705151730"] = "offender",
    ["rbxassetid://17620534977"] = "expenditure",
    ["rbxassetid://86969237568134"] = "paradox",
    ["rbxassetid://18257495713"] = "abscond",
    ["rbxassetid://123500259853820"] = "stereotype",
    ["rbxassetid://18257209590"] = "transparency",
    ["rbxassetid://134166567634467"] = "probably",
    ["rbxassetid://85743131773074"] = "tangerine",
    ["rbxassetid://18257220047"] = "seldom",
    ["rbxassetid://126503711288758"] = "shareholder",
    ["rbxassetid://123035811233574"] = "thesaurus",
    ["rbxassetid://18263831025"] = "spokesperson",
    ["rbxassetid://17620374296"] = "worthwhile",
    ["rbxassetid://17627821778"] = "colonel",
    ["rbxassetid://17620542202"] = "endeavour",
    ["rbxassetid://72332633000965"] = "beneficiary",
    ["rbxassetid://17705270738"] = "attorney",
    ["rbxassetid://17707321238"] = "refugee",
    ["rbxassetid://106144085367658"] = "congratulate",
    ["rbxassetid://17620226078"] = "remarkable",
    ["rbxassetid://125209787139773"] = "portfolio",
    ["rbxassetid://82419708734232"] = "doctrine",
    ["rbxassetid://18264002127"] = "elaborate",
    ["rbxassetid://79171344178056"] = "abhorrent",
    ["rbxassetid://18257529285"] = "frolic",
    ["rbxassetid://18257481978"] = "malapropism",
    ["rbxassetid://17619435492"] = "assumption",
    ["rbxassetid://121128593595148"] = "opaque",
    ["rbxassetid://83734163825187"] = "municipal",
    ["rbxassetid://17627767018"] = "surveillance",
    ["rbxassetid://137651872335785"] = "anaphylactic",
    ["rbxassetid://99614655778679"] = "limousine",
    ["rbxassetid://140119942342374"] = "fictitious",
    ["rbxassetid://99148958188453"] = "misconception",
    ["rbxassetid://18263942591"] = "ideological",
    ["rbxassetid://81056535030917"] = "pomegranate",
    ["rbxassetid://91401812744248"] = "rye",
    ["rbxassetid://18263643124"] = "optimism",
    ["rbxassetid://17705244259"] = "residential",
    ["rbxassetid://18257182776"] = "warrior",
    ["rbxassetid://109783304461923"] = "cuisine",
    ["rbxassetid://88206521550650"] = "sapphire",
    ["rbxassetid://17620710842"] = "phlegm",
    ["rbxassetid://17628071882"] = "handkerchief",
    ["rbxassetid://18257398103"] = "dilate",
    ["rbxassetid://98428059169323"] = "liable",
    ["rbxassetid://18264037984"] = "pronunciation",
    ["rbxassetid://17707373034"] = "neighbouring",
    ["rbxassetid://81096857844980"] = "intermediate",
    ["rbxassetid://70449437840011"] = "susceptible",
    ["rbxassetid://17704831171"] = "technological",
    ["rbxassetid://17707350399"] = "exaggerate",
    ["rbxassetid://125963298456666"] = "coalescence",
    ["rbxassetid://18257335313"] = "monosyllabic",
    ["rbxassetid://18263845478"] = "passionate",
    ["rbxassetid://18257462686"] = "captious",
    ["rbxassetid://80335572225978"] = "neuroplasticity",
    ["rbxassetid://121960186073109"] = "pestilence",
    ["rbxassetid://17627928668"] = "obesity",
    ["rbxassetid://18263975679"] = "embassy",
    ["rbxassetid://18257432800"] = "oblivious",
    ["rbxassetid://17707300132"] = "significance",
    ["rbxassetid://92147310918517"] = "ravenous",
    ["rbxassetid://71717044292435"] = "personnel",
    ["rbxassetid://111287681130849"] = "guideline",
    ["rbxassetid://17627904367"] = "subsidy",
    ["rbxassetid://94765859644521"] = "imprisonment",
    ["rbxassetid://18257344093"] = "cacophony",
    ["rbxassetid://115799550003376"] = "telepathy",
    ["rbxassetid://71445957374329"] = "dauntless",
    ["rbxassetid://112855395997904"] = "ambiguous",
    ["rbxassetid://18257310148"] = "brusque",
    ["rbxassetid://17713076703"] = "vulnerability",
    ["rbxassetid://122762077142796"] = "ubiquitous",
    ["rbxassetid://17632817018"] = "appetite",
    ["rbxassetid://18257204844"] = "scrutiny",
    ["rbxassetid://103384123284811"] = "erratic",
    ["rbxassetid://18257163705"] = "legendary",
    ["rbxassetid://90620950582221"] = "hypothesis",
    ["rbxassetid://71410655886078"] = "recipient",
    ["rbxassetid://89954467034919"] = "psychological",
    ["rbxassetid://122343089169402"] = "subterranean",
    ["rbxassetid://122827915740003"] = "obituary",
    ["rbxassetid://17707384399"] = "negotiation",
    ["rbxassetid://89675342289919"] = "pygmy",
    ["rbxassetid://18257367013"] = "nauseous",
    ["rbxassetid://108024036194672"] = "myopic",
    ["rbxassetid://113818213569377"] = "monochromatic",
    ["rbxassetid://18257170998"] = "predecessor",
    ["rbxassetid://89113407015417"] = "silhouette",
    ["rbxassetid://18257293601"] = "aggrandize",
    ["rbxassetid://79379278211018"] = "kaleidoscope",
    ["rbxassetid://17707307947"] = "rehabilitation",
    ["rbxassetid://82966257065332"] = "gentrification",
    ["rbxassetid://17707273461"] = "sovereignty",
    ["rbxassetid://90499060394972"] = "reminiscence",
    ["rbxassetid://115598216153845"] = "bourgeoisie",
    ["rbxassetid://81085227021194"] = "aegis",
    ["rbxassetid://17713056403"] = "hierarchy",
    ["rbxassetid://18257542135"] = "iconoclast",
    ["rbxassetid://109297423141020"] = "sequoia",
    ["rbxassetid://70473378112394"] = "gubernatorial",
    ["rbxassetid://72672639356799"] = "subpoena",
    ["rbxassetid://18257618490"] = "abacaxi",
    ["rbxassetid://129862611252162"] = "thalassophobia",
    ["rbxassetid://17628020594"] = "fuchsia",
    ["rbxassetid://18257380431"] = "anachronistic",
    ["rbxassetid://18257356413"] = "paraphernalia",
    ["rbxassetid://124258616891836"] = "lepidopterology",
    ["rbxassetid://18257506847"] = "languid",
    ["rbxassetid://17632825637"] = "bureaucracy",
    ["rbxassetid://17627999828"] = "acquiesce",
    ["rbxassetid://124529745822252"] = "capricious",
    ["rbxassetid://85585767847749"] = "hieroglyphics",
    ["rbxassetid://112842520789035"] = "sesquipedalian",
    ["rbxassetid://17632791064"] = "incomprehensibility",
    ["rbxassetid://111879126889878"] = "soliloquy",
    ["rbxassetid://93261780878211"] = "onomatopoeia",
    ["rbxassetid://95957616756447"] = "entrepreneur",
    ["rbxassetid://17620759598"] = "paradigm",
    ["rbxassetid://124212548906430"] = "independence",
    ["rbxassetid://95282167666552"] = "procrastinate",
    ["rbxassetid://102185883621465"] = "rendezvous",
    ["rbxassetid://82352623119207"] = "glockenspiel",
    ["rbxassetid://17627975911"] = "syllepsis",
    ["rbxassetid://86033706945371"] = "liaison",
    ["rbxassetid://17620345413"] = "antidisestablishmentarianism",
    ["rbxassetid://112058503215092"] = "problematic",
    ["rbxassetid://92215948292569"] = "sequacious",
    ["rbxassetid://17628064988"] = "ingenious",
    ["rbxassetid://18257389997"] = "anemone",
    ["rbxassetid://71678595652129"] = "heritage",
    ["rbxassetid://17620505761"] = "humanitarian",
    ["rbxassetid://18257323258"] = "caustic",
    ["rbxassetid://72942600245342"] = "aerodynamic",
    ["rbxassetid://120786669970568"] = "venerate",
    ["rbxassetid://98239573833470"] = "pharaoh",
    ["rbxassetid://107315012360412"] = "polydactyly",
    ["rbxassetid://17620589321"] = "narcissistic",
    ["rbxassetid://93365154213072"] = "forthcoming",
    ["rbxassetid://17704882178"] = "separation",
    ["rbxassetid://17713066287"] = "violation",
    ["rbxassetid://18263788390"] = "notorious",
    ["rbxassetid://106543699707550"] = "pirouette",
    ["rbxassetid://72435768737741"] = "sagacious",
    ["rbxassetid://17620579985"] = "biography",
    ["rbxassetid://94700726432644"] = "eloquent",
    ["rbxassetid://17628113162"] = "minuscule",
    ["rbxassetid://17704849455"] = "prestigious",
    ["rbxassetid://18257440681"] = "supersede",
    ["rbxassetid://105732469322919"] = "reincarnation",
    ["rbxassetid://17620528227"] = "embarrassment",
    ["rbxassetid://18263664646"] = "pessimistic",
    ["rbxassetid://17627911842"] = "methodology",
    ["rbxassetid://82025751524144"] = "nutritious",
    ["rbxassetid://97611256826794"] = "pneumatic",
    ["rbxassetid://136906670235418"] = "acculturate",
    ["rbxassetid://17627937145"] = "parliamentary",
    ["rbxassetid://17707331642"] = "legislation",
    ["rbxassetid://18263742531"] = "obfuscation",
    ["rbxassetid://17705223522"] = "inhabitant",
    ["rbxassetid://105192684751247"] = "fluorescent",
    ["rbxassetid://128665658754377"] = "juxtaposition",
    ["rbxassetid://17704867480"] = "predominantly",
    ["rbxassetid://119992234251657"] = "deployment",
    ["rbxassetid://18257197694"] = "systematic",
    ["rbxassetid://17632867945"] = "commodity",
    ["rbxassetid://88356842094041"] = "supposedly",
    ["rbxassetid://139389432004640"] = "size",
    ["rbxassetid://112726533133258"] = "film",
    ["rbxassetid://113302422028204"] = "mix",
    ["rbxassetid://100067711890448"] = "pear",
    ["rbxassetid://77278723571350"] = "length",
    ["rbxassetid://115775363677306"] = "twist",
    ["rbxassetid://125555053201251"] = "filter",
    ["rbxassetid://17627875944"] = "erupt",
    ["rbxassetid://86603383226078"] = "stumble",
    ["rbxassetid://111336307566133a"] = "proof",
    ["rbxassetid://129301367618315"] = "quack",
    ["rbxassetid://106164144827690"] = "recession",
    ["rbxassetid://115907357932449"] = "syntax",
    ["rbxassetid://137931211649180"] = "exert",
    ["rbxassetid://17620089870"] = "dairy",
    ["rbxassetid://18263721867"] = "noob",
    ["rbxassetid://113296258582753"] = "hotel",
    ["rbxassetid://135518440831273"] = "clever",
    ["rbxassetid://134841673180854"] = "water",
    ["rbxassetid://116280401110349"] = "gallant",
    ["rbxassetid://73560380115539"] = "lather",
    ["rbxassetid://82235795990204"] = "oasis",
    ["rbxassetid://115567352272490"] = "town",
    ["rbxassetid://89945234291258"] = "greedy",
    ["rbxassetid://116270155445876"] = "update",
    ["rbxassetid://129568424936057"] = "pie",
    ["rbxassetid://17620726892"] = "unprecedented",
    ["rbxassetid://115301392260162"] = "mathematician",
    ["rbxassetid://127187168346802"] = "propaganda",
    ["rbxassetid://122859885984507"] = "microorganism",
    ["rbxassetid://17627757409"] = "intent",
    ["rbxassetid://17705261975"] = "breakthrough",
    ["rbxassetid://86264727885079"] = "soda",
    ["rbxassetid://131087527182954"] = "reply",
    ["rbxassetid://17620214854"] = "rally",
    ["rbxassetid://110992488713038"] = "agriculture",
    ["rbxassetid://111336307566133"] = "proof",
    ["rbxassetid://139445462509156"] = "still",
    ["rbxassetid://17632846437"] = "defy",
    ["rbxassetid://78542491010706"] = "shake",
    ["rbxassetid://127663239097832"] = "absence",
    ["rbxassetid://17627860878"] = "irony",
    ["rbxassetid://17632892861"] = "bizarre",
    ["rbxassetid://126481539910012"] = "resilience",
    ["rbxassetid://17712977280"] = "heresy",
    ["rbxassetid://80520052097207"] = "symmetrical",
    ["rbxassetid://89384242074757"] = "grub",
    ["rbxassetid://127586980434822"] = "catalogue",
    ["rbxassetid://17627887884"] = "enact",
    ["rbxassetid://70469781693470"] = "euphoria",
    ["rbxassetid://18257236422"] = "favourable",
    ["rbxassetid://18264015967"] = "accumulation",
    ["rbxassetid://86286320452222"] = "hornswoggle",
    ["rbxassetid://139833268158271"] = "surrogate",
    ["rbxassetid://80097477282865"] = "ash",
    ["rbxassetid://91248922608173"] = "ruby",
    ["rbxassetid://132283121031638"] = "wrist",
    ["rbxassetid://82709137280034"] = "gold",
    ["rbxassetid://72368123980516"] = "giant",
    ["rbxassetid://99770067131062"] = "ionise",
    ["rbxassetid://71206756354514"] = "house",
    ["rbxassetid://102020618693697"] = "overdue",
    ["rbxassetid://73476668810120"] = "power",
    ["rbxassetid://92706054312788"] = "cliff",
    ["rbxassetid://115979653696988"] = "lactose",
    ["rbxassetid://98496714233552"] = "bayonet",
    ["rbxassetid://76232469730644"] = "bingo",
    ["rbxassetid://125087918616230"] = "cabin",
    ["rbxassetid://111702628375025"] = "prank",
    ["rbxassetid://85845746014726"] = "zephyr",
    ["rbxassetid://95183391465404"] = "intermission",
    ["rbxassetid://112305751879846"] = "bandeau",
    ["rbxassetid://114349019555811"] = "polemic",
    ["rbxassetid://136487825977974"] = "therapeutic",
    ["rbxassetid://110098752229751"] = "institutionalization",
    ["rbxassetid://126794981237325"] = "commodore",
    ["rbxassetid://103405516838095"] = "bucolic",
    ["rbxassetid://136229723152982"] = "homogeneous",
    ["rbxassetid://139823199442280"] = "utilitarianism",
    ["rbxassetid://75420795836811"] = "agoraphobic",
    ["rbxassetid://105281278011169"] = "encore",
    ["rbxassetid://94708142436657"] = "sarcophagus",
    ["rbxassetid://83854783654942"] = "extraterrestrial",
    ["rbxassetid://98015030093970"] = "puerile",
    ["rbxassetid://135155597714681"] = "verbatim",
    ["rbxassetid://86238755046399"] = "colloquialism",
    ["rbxassetid://121794379441457"] = "depilatory",
    ["rbxassetid://111965000473684"] = "uncharacteristic",
    ["rbxassetid://92411985593823"] = "rambunctious",
    ["rbxassetid://107321554203993"] = "homeopathy",
    ["rbxassetid://82464790412950"] = "verisimilitude",
    ["rbxassetid://87407947157868"] = "menagerie",
    ["rbxassetid://126270946563337"] = "phenomenon",
    ["rbxassetid://99772723640742"] = "compunction",
    ["rbxassetid://110367036610316"] = "codicil",
    ["rbxassetid://76289478501081"] = "macabre",
    ["rbxassetid://100119991534791"] = "asphyxiation",
    ["rbxassetid://112582266844124"] = "calamitous",
    ["rbxassetid://109625013162241"] = "iron",
    ["rbxassetid://99657348762334"] = "chicken",
    ["rbxassetid://110476086581191"] = "indifference",
    ["rbxassetid://103682063052182"] = "combustible",
    ["rbxassetid://121504356676507"] = "capoeira",
    ["rbxassetid://79837237305146"] = "inchoate",
    ["rbxassetid://135851462066194"] = "cyrillic",
    ["rbxassetid://118565618469497"] = "pusillanimous",
    ["rbxassetid://93977641775368"] = "apocryphal",
    ["rbxassetid://132823289980578"] = "pulchritudinous",
    ["rbxassetid://80521222355609"] = "word",
    ["rbxassetid://112635032040804"] = "unintelligible",
    ["rbxassetid://117319882689305"] = "myriad",
    ["rbxassetid://79043260418341"] = "infinitesimal",
    ["rbxassetid://95877000629418"] = "abacaxi",
    ["rbxassetid://107792347333512"] = "milieu",
    ["rbxassetid://126212796300089"] = "imminent",
    ["rbxassetid://124693070835234"] = "sapphire",
    ["rbxassetid://134394182430711"] = "champagne",
    ["rbxassetid://99128331263674"] = "proclamation",
    ["rbxassetid://73135548655164"] = "clandestine",
    ["rbxassetid://138348596941715"] = "quixotry",
    ["rbxassetid://71689115838522"] = "quasquicentennial",
    ["rbxassetid://114067140591080"] = "paroxysm",
    ["rbxassetid://79634645166740"] = "compartmentalisation",
    ["rbxassetid://110331846795098"] = "deoxyribonucleic",
    ["rbxassetid://111716633397592"] = "neuropsychological",
    ["rbxassetid://102182105821013"] = "psychoneuroendocrinological",
    ["rbxassetid://112210941507084"] = "otorhinolaryngological",
    ["rbxassetid://137212544394249"] = "pneumoencephalography",
    ["rbxassetid://71790576062133"] = "psychoneuroimmunology",
    ["rbxassetid://72142085097038"] = "gobbledegook",
    ["rbxassetid://101038738333764"] = "acetaminophen",
    ["rbxassetid://102263277530690"] = "infundibulum",
    ["rbxassetid://91172066647693"] = "portmanteau",
    ["rbxassetid://102560084661584"] = "subcompartmentalisation",
    ["rbxassetid://74581123575676"] = "floccinaucinihilipilification",
    ["rbxassetid://134719010200043"] = "pseudopseudohypoparathyroidism",
    ["rbxassetid://85718140835565"] = "polyphiloprogenitive",
    ["rbxassetid://75843042273504"] = "enchantment",
    ["rbxassetid://121066316976940"] = "epiphany",
    ["rbxassetid://129558873836404"] = "sachet",
    ["rbxassetid://135050742996927"] = "serendipity",
    ["rbxassetid://138821716593962"] = "jurisprudence",
    ["rbxassetid://126053443358984"] = "labyrinthine",
    ["rbxassetid://123068157554225"] = "borborygmus",
    ["rbxassetid://87242881728306"] = "dendrochronology",
    ["rbxassetid://114029523615673"] = "absquatulate",
    ["rbxassetid://76383675691311"] = "perspicacious",
    ["rbxassetid://119316568020320"] = "batrachophobia",
    ["rbxassetid://117718949590686"] = "bourgeoisification",
    ["rbxassetid://94279664213511"] = "supercalifragilisticexpialidocious",
    ["rbxassetid://73465606584074"] = "hippopotomonstrosesquippedaliophobia",
    ["rbxassetid://70505976551063"] = "anthropomorphisation",
    ["rbxassetid://127888074763916"] = "supererogatory",
    ["rbxassetid://77710543162978"] = "susurration",
    ["rbxassetid://87548225336904"] = "gastroenterologist",
    ["rbxassetid://81226892972143"] = "ethnomethodology",
    ["rbxassetid://81545396047331"] = "antediluvian",
    ["rbxassetid://89664599913279"] = "worcestershire",
    ["rbxassetid://133120731201012"] = "rhinorrhagia",
    ["rbxassetid://111879051386379"] = "achromatophilia",
    ["rbxassetid://79084035550919"] = "prestidigitation",
    ["rbxassetid://85916284700151"] = "isthmus",
    ["rbxassetid://120354255564982"] = "prognostication",
    ["rbxassetid://80353304937521"] = "allotransplantation",
    ["rbxassetid://108750322302298"] = "syzygy",
    ["rbxassetid://136198051423044"] = "superferromagnetism",
    ["rbxassetid://103090228279374"] = "contradistinguish",
    ["rbxassetid://78729315183516"] = "fossiliferous",
    ["rbxassetid://139519420071189"] = "buckminsterfullerene",
    ["rbxassetid://75453456712920"] = "baccalaureate",
    ["rbxassetid://120654116196961"] = "hypoparathyroidism",
    ["rbxassetid://103885888979676"] = "autothaumaturgist",
    ["rbxassetid://92321736862686"] = "xylotypographic",
    ["rbxassetid://105977056425999"] = "dichotomisation",
    ["rbxassetid://92910652774687"] = "bogolanfini",
    ["rbxassetid://87257932620855"] = "achromatophil",
    ["rbxassetid://87247321856093"] = "honorificabilitudinity",
    ["rbxassetid://72713625425585"] = "glyceraldehyde",
    ["rbxassetid://81699536928237"] = "radiometeorograph",
    ["rbxassetid://105123759291275"] = "convolvulaceous",
    ["rbxassetid://132536981845673"] = "psychophysicotherapeutics",
    ["rbxassetid://95968193297116"] = "oligonucleotide",
    ["rbxassetid://112819574138692"] = "arthroereisis",
    ["rbxassetid://80398980657207"] = "quindecasyllabic",
    ["rbxassetid://132373491943811"] = "brain",
    ["rbxassetid://72033127723473"] = "cool",
    ["rbxassetid://88261145100780"] = "pasta",
    ["rbxassetid://114994367532589"] = "gradual",
    ["rbxassetid://78604127447619"] = "emoji",
    ["rbxassetid://120763306045362"] = "flower",
    ["rbxassetid://71044946603373"] = "wind",
    ["rbxassetid://110124745431034"] = "zoo",
    ["rbxassetid://102458623296489"] = "kiss",
    ["rbxassetid://115971916363494"] = "tank",
    ["rbxassetid://139255367539330"] = "secret",
    ["rbxassetid://78716954186837"] = "center",
    ["rbxassetid://81537462730819"] = "sniffle",
    ["rbxassetid://74236051984130"] = "window",
    ["rbxassetid://135422537180381"] = "twenty",
    ["rbxassetid://130783599042471"] = "congratulate",
    ["rbxassetid://92409967821987"] = "crowd",
    ["rbxassetid://104156082743487"] = "special",
    ["rbxassetid://132900887545745"] = "plethora",
    ["rbxassetid://134850790735208"] = "vexatious",
    ["rbxassetid://71736494172063"] = "incandescent",
    ["rbxassetid://80501348105375"] = "nomenclature",
    ["rbxassetid://115109094409913"] = "normal",
    ["rbxassetid://99480986785855"] = "quoddamodotative",
    ["rbxassetid://91224594266635"] = "parallelogrammatic",
    ["rbxassetid://120111225374491"] = "armor",
    ["rbxassetid://99528494242500"] = "adrenocorticotropin",
    ["rbxassetid://126493921501260"] = "machiavellian",
    ["rbxassetid://131102124047369"] = "triphosphate",
    ["rbxassetid://134868701185141"] = "brucellosis",
    ["rbxassetid://88458803959141"] = "lexicography",
    ["rbxassetid://139396434446159"] = "martyrdom",
    ["rbxassetid://90127518471765"] = "isometropia",
    ["rbxassetid://89459703586104"] = "fjord",
    ["rbxassetid://83524666922569"] = "querimony",
    ["rbxassetid://118905258701198"] = "dodecahedron",
    ["rbxassetid://132830658602644"] = "defenestration",
    ["rbxassetid://93383805575524"] = "heterozygous",
    ["rbxassetid://138093690305265"] = "astigmatism",
    ["rbxassetid://102681692035292"] = "facsimile",
    ["rbxassetid://137346416233360"] = "elision",
    ["rbxassetid://70783749900158"] = "indefatigable",
    ["rbxassetid://100277598755570"] = "consanguine",
    ["rbxassetid://111563154007908"] = "plenipotentiary",
    ["rbxassetid://77838375723230"] = "calumny",
    ["rbxassetid://121956817114946"] = "symbiosis",
    ["rbxassetid://96968674308046"] = "mellifluous",
    ["rbxassetid://138885449225212"] = "comeuppance",
    ["rbxassetid://89502754658067"] = "chauffeur",
    ["rbxassetid://111917312480616"] = "ambidextrous",
    ["rbxassetid://104661445987660"] = "glaucomatous",
    ["rbxassetid://89274543400563"] = "queen",
    ["rbxassetid://99396093625375"] = "powder",
    ["rbxassetid://90139826339126"] = "benevolence",
    ["rbxassetid://107244446944458"] = "abdomen",
    ["rbxassetid://109251818187292"] = "cooking",
    ["rbxassetid://90580036929928"] = "walnut",
    ["rbxassetid://109735990203735"] = "akin",
    ["rbxassetid://135295711012587"] = "gazebo",
    ["rbxassetid://137038697933424"] = "steadfast",
    ["rbxassetid://133330554655739"] = "bamboo",
    ["rbxassetid://117211452869325"] = "syllable",
    ["rbxassetid://110931757925124"] = "sabotage",
    ["rbxassetid://17627882118"] = "disappointment",
    ["rbxassetid://86714635724536"] = "derogatory",
    ["rbxassetid://137371985991938"] = "cognitive",
    ["rbxassetid://137675191663208"] = "hexagonal",
    ["rbxassetid://76654925909282"] = "idiom",
    ["rbxassetid://17705289473"] = "articulate",
    ["rbxassetid://86822918483420"] = "bronchitis",
    ["rbxassetid://130033626818613"] = "kangaroo",	
    ["rbxassetid://94618176013854"] = "understand",
    ["rbxassetid://105991046195281"] = "atmospheric",
    ["rbxassetid://118596569578688"] = "periodically",
    ["rbxassetid://106289257367197"] = "detrimental",
    ["rbxassetid://89565411786796"] = "excalibur",
    ["rbxassetid://133831557421362"] = "wholeheartedly",
    ["rbxassetid://104301128511856"] = "gibberish",
    ["rbxassetid://110829617178725"] = "hourglass",
    ["rbxassetid://99494906069085"] = "palatine",
    ["rbxassetid://136796468565906"] = "flamboyant",
    ["rbxassetid://112515167525878"] = "charisma",
    ["rbxassetid://82434266826799"] = "peppermint",
}

local keycodemap = {
    ["a"] = 0x41, ["b"] = 0x42, ["c"] = 0x43, ["d"] = 0x44,
    ["e"] = 0x45, ["f"] = 0x46, ["g"] = 0x47, ["h"] = 0x48,
    ["i"] = 0x49, ["j"] = 0x4A, ["k"] = 0x4B, ["l"] = 0x4C,
    ["m"] = 0x4D, ["n"] = 0x4E, ["o"] = 0x4F, ["p"] = 0x50,
    ["q"] = 0x51, ["r"] = 0x52, ["s"] = 0x53, ["t"] = 0x54,
    ["u"] = 0x55, ["v"] = 0x56, ["w"] = 0x57, ["x"] = 0x58,
    ["y"] = 0x59, ["z"] = 0x5A, ["enter"] = 0x0D,
}

local typingdelay = 0.25
local autotypeenabled = false
local lastsound = nil
local lastword = "None"
local istypingmaybe = false
local typingword = false
local pretypewait = 1.25

local typocorrections = false
local typofrequency = 20

local version = 1.3
local supportedwords = 538

local Window = Rayfield:CreateWindow({
    Name = "Spelling Bee! - Preppy Hub (discord.gg/preppyhub)",
    Icon = 128709448017056,
    LoadingTitle = "Spelling Bee! - Preppy Hub",
    LoadingSubtitle = "Thanks for using the script! <3",
    DisableRayfieldPrompts = true,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "PreppyHub-SpellingBee"
    },
    Discord = {
        Enabled = true,
        Invite = "s3nQKytVkm",
        RememberJoins = false
    },
})

local Tab = Window:CreateTab("Auto Type", "type")

Tab:CreateToggle({
    Name = "Auto Type",
    CurrentValue = false,
    Callback = function(state)
        AutoType = state
        if state then
            lastsound = nil
            spawn(function()
                while AutoType do
                    if lastword and not typingword and lastword ~= lastTypedWord then
                        typingword = true
                        wait(pretypewait)

                        local currentText = ""
                        local madeTypo = false
                        local typoIndex = nil
                        local incorrectWord = lastword
                        local extraLetters = 0

                        -- Typo mapping table (realistic replacements based on nearby keys)
                        local typoMap = {
                            A = {"Q", "W", "S", "Z"},
                            B = {"V", "G", "H", "N"},
                            C = {"X", "D", "F", "V"},
                            D = {"S", "E", "R", "F", "C", "X"},
                            E = {"W", "R", "S", "D"},
                            F = {"D", "R", "T", "G", "V", "C"},
                            G = {"F", "T", "Y", "H", "B", "V"},
                            H = {"G", "Y", "U", "J", "N", "B"},
                            I = {"U", "O", "K", "J"},
                            J = {"H", "U", "I", "K", "M", "N"},
                            K = {"J", "I", "O", "L", "M"},
                            L = {"K", "O", "P"},
                            M = {"N", "J", "K"},
                            N = {"B", "H", "J", "M"},
                            O = {"I", "P", "K", "L"},
                            P = {"O", "L"},
                            Q = {"W", "A"},
                            R = {"E", "T", "D", "F"},
                            S = {"A", "W", "E", "D", "X", "Z"},
                            T = {"R", "Y", "F", "G"},
                            U = {"Y", "I", "H", "J"},
                            V = {"C", "F", "G", "B"},
                            W = {"Q", "E", "A", "S"},
                            X = {"Z", "S", "D", "C"},
                            Y = {"T", "U", "G", "H"},
                            Z = {"A", "S", "X"}
                        }

                        -- Determine if a typo should be made
                        if typocorrections and math.random(1, 100) <= typofrequency then
                            typoIndex = math.random(2, #lastword - 1) -- Avoid first and last letter
                            local typoType = math.random(1, 2) -- 1 for duplicate, 2 for random letter replacement

                            if typoType == 1 then
                                -- Duplicate letter typo
                                incorrectWord = lastword:sub(1, typoIndex) .. lastword:sub(typoIndex, typoIndex) .. lastword:sub(typoIndex + 1)
                                print("[AutoType] Typo Type: Duplicate Letter at index", typoIndex)
                            else
                                -- Replace letter typo (realistic mistyped letter)
                                local originalLetter = lastword:sub(typoIndex, typoIndex):upper()
                                
                                if typoMap[originalLetter] then
                                    local possibleTypos = typoMap[originalLetter]
                                    local randomIndex = math.random(1, #possibleTypos)
                                    local typoLetter = possibleTypos[randomIndex]:lower() -- Convert back to lowercase
                                    
                                    incorrectWord = lastword:sub(1, typoIndex - 1) .. typoLetter .. lastword:sub(typoIndex + 1)
                                    print("[AutoType] Typo Type: Replaced Letter at index", typoIndex, "with", typoLetter)
                                end
                            end

                            madeTypo = true
                            extraLetters = math.random(2, 4)
                        end

                        local typeUntil = madeTypo and math.min(#incorrectWord, typoIndex + extraLetters) or #lastword

                        -- Typing simulation
                        for i = 1, typeUntil do
                            if not AutoType then break end
                            currentText = incorrectWord:sub(1, i)
                            game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = currentText
                            wait(typingdelay)
                        end

                        -- Typo correction process
                        if madeTypo then
                            wait(typingdelay * 2)

                            -- Backspace incorrect letters
                            while #game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text > typoIndex do
                                game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text:sub(1, -2)
                                wait(typingdelay / 2)
                            end

                            wait(typingdelay * 2)

                            -- Retype correct letters
                            for i = #game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text + 1, #lastword do
                                if not AutoType then break end
                                game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = lastword:sub(1, i)
                                wait(typingdelay)
                            end
                        end

                        -- Submit the typed word
                        if game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text == lastword:sub(1,1):upper() .. lastword:sub(2) then
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end

                        typingword = false
                        lastTypedWord = lastword
                    end
                    wait()
                end
            end)
        end
    end,
})


Tab:CreateSlider({
    Name = "Typing Speed",
    Range = {0.03, 0.25},
    Increment = 0.005,
	Suffix = "Seconds",
    CurrentValue = typingdelay,
    Flag = "TypingSpeedSlider",
    Callback = function(value)
        typingdelay = value
    end,
})

Tab:CreateSlider({
    Name = "Typing Delay",
    Range = {0.5, 2},
    Increment = 0.005,
	Suffix = "Seconds",
    CurrentValue = pretypewait,
    Flag = "TypingDelaySlider",
    Callback = function(value)
        pretypewait = value
    end,
})

Tab:CreateDivider()

local Label = Tab:CreateLabel("Current Word: None")
Tab:CreateButton({
    Name = "Copy Current Word",
    Callback = function()
        setclipboard(lastword)
        Rayfield:Notify({
            Title = "Word Copied!",
            Content = "The current word has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

Tab:CreateDivider()

Tab:CreateSection("Auto Type - Correcting Typos [Beta]")

Tab:CreateToggle({
   Name = "Auto Make Correcting Typos",
   CurrentValue = typocorrections,
   Flag = "TypoCorrectionsToggle",
   Callback = function(Value)
	typocorrections = Value
   end,
})

Tab:CreateSlider({
   Name = "Auto Typo Frequency",
   Range = {5, 100},
   Increment = 5,
   Suffix = "% Chance",
   CurrentValue = typofrequency,
   Flag = "TypoSlider",
   Callback = function(Value)
	typofrequency = Value
   end,
})

Tab:CreateSection("Auto Type - Dynamic Typing Speed [Beta]")
local dynamictyping = false

local SpeedToggle = Tab:CreateToggle({
    Name = "Dynamic Typing Speed",
    CurrentValue = false,
    Flag = "DynamicSpeedToggle",
    Callback = function(Value)
        dynamictyping = Value
    end,
})

local SpeedDropdown = Tab:CreateDropdown({
    Name = "Dynamic Typing Speed Range",
    Options = {"0.5 - 0.8", "0.3 - 0.9"},
    CurrentOption = {"0.5 - 0.8"},
    MultipleOptions = false,
    Flag = "DynamicSpeedDropdown",
    Callback = function(option)
        
    end,
})

Tab:CreateDivider()

Tab:CreateLabel("Need help or having script issues? Join our Discord to chat and get support from the script developers!", "message-circle-question")
Tab:CreateButton({
    Name = "Copy the Preppy Hub Discord invite link",
    Callback = function()
        setclipboard("https://discord.gg/s3nQKytVkm")
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The Discord invite link has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

local function updatecurrentword(word)
    if typingstatus or lastword == word then return end
    lastword = word
    local capitalizedWord = word:sub(1,1):upper() .. word:sub(2)

    print("[Preppy Hub] Found word: " .. capitalizedWord)

    Label:Set("Current Word: " .. capitalizedWord)

    if autotypeenabled then
        task.delay(typingdelay, function()
            if lastword == word and not istyping then
                autotypeword(capitalizedWord)
            end
        end)
    end
end

local function checksound()
    local detectedSound = nil

    local servicestocheck = {workspace, game.Lighting}
    
    for _, service in ipairs(servicestocheck) do
        for _, obj in ipairs(service:GetDescendants()) do
            if obj:IsA("Sound") and obj.Playing then
                local id = obj.SoundId
                if wordlist[id] then
                    detectedSound = id
                end
            end
        end
    end

    if detectedSound and detectedSound ~= lastsound then
        lastsound = detectedSound
        updatecurrentword(wordlist[detectedSound])
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")

local function createButton(tab, items, eventName)
    for _, itemData in pairs(items) do
        local difficulty, category, item = unpack(itemData)
        
        tab:CreateButton({
            Name = item .. " (" .. difficulty .. ")",
            Callback = function()
                Events:WaitForChild(eventName):FireServer(item) 
            end
        })
    end
end

local EffectTab = Window:CreateTab("Death Effects", "skull")
local EffectLabel1 = EffectTab:CreateLabel("Click on a death effect below to equip it!")
local EffectLabel2 = EffectTab:CreateLabel("Note: You can only equip death effects that you own. Earn death effects by opening crates in the Shop menu!")
local effects = {
    {"Common", "DeathEffect", "Default"}, {"Common", "DeathEffect", "Fade"}, {"Uncommon", "DeathEffect", "Hole"}, {"Uncommon", "DeathEffect", "Tomato"},
    {"Rare", "DeathEffect", "Anvil"}, {"Rare", "DeathEffect", "Boulder"}, {"Rare", "DeathEffect", "Hook"}, {"Epic", "DeathEffect", "Big Foot"},
    {"Epic", "DeathEffect", "Explosion"}, {"Epic", "DeathEffect", "Glitch"}, {"Epic", "DeathEffect", "Lightning"}, {"Golden", "DeathEffect", "Dragon"},
    {"Golden", "DeathEffect", "Helicopter"}, {"Golden", "DeathEffect", "Ascension"}, {"Godly", "DeathEffect", "Black Hole"}, {"Godly", "DeathEffect", "UFO"}
}
createButton(EffectTab, effects, "EquipDeathEffect")

local FontTab = Window:CreateTab("Fonts", "case-sensitive")
local FontLabel1 = FontTab:CreateLabel("Click on a font below to equip it!")
local FontLabel2 = FontTab:CreateLabel("Note: You can only equip fonts that you own. Earn fonts by opening crates in the Shop menu!")
local fonts = {
    {"Common", "Font", "Comic Neue Angular"}, {"Common", "Font", "Creepster"}, {"Common", "Font", "Fondamento"}, {"Common", "Font", "Kalam"},
    {"Common", "Font", "Patrick Hand"}, {"Common", "Font", "Roman Antique"}, {"Common", "Font", "Source Sans Pro"}, {"Uncommon", "Font", "Amatic SC"},
    {"Uncommon", "Font", "Grenze Gotisch"}, {"Uncommon", "Font", "Merriweather"}, {"Uncommon", "Font", "Special Elite"}, {"Rare", "Font", "Denk One"},
    {"Rare", "Font", "Fredoka One"}, {"Rare", "Font", "Permanent Marker"}, {"Epic", "Font", "Bangers"}, {"Epic", "Font", "Indie Flower"},
    {"Golden", "Font", "Luckiest Guy"}, {"Godly", "Font", "Press Start 2P"}
}
createButton(FontTab, fonts, "EquipTypeFont")

local OtherTab = Window:CreateTab("Other", "circle-ellipsis")

local ThemeOptions = {
    ["Default"] = "Default",
    ["Amber Glow"] = "AmberGlow",
    ["Amethyst"] = "Amethyst",
    ["Bloom"] = "Bloom",
    ["Dark Blue"] = "DarkBlue",
    ["Green"] = "Green",
    ["Light"] = "Light",
    ["Ocean"] = "Ocean",
    ["Serenity"] = "Serenity"
}

local ThemeDropdown = OtherTab:CreateDropdown({
    Name = "Change Menu Theme",
    Options = {"Default", "Amber Glow", "Amethyst", "Bloom", "Dark Blue", "Green", "Light", "Ocean", "Serenity"},
    CurrentOption = {"Default"},
    MultipleOptions = false,
    Flag = "ThemeDropdown",
    Callback = function(Options)
        local selectedDisplayName = Options[1]
        local themeIdentifier = ThemeOptions[selectedDisplayName]
        if themeIdentifier then
            Window.ModifyTheme(themeIdentifier)
        end
    end,
})

OtherTab:CreateDivider()

OtherTab:CreateButton({
   Name = "Execute Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

OtherTab:CreateButton({
    Name = "Copy Server Job ID",
    Callback = function()
        setclipboard(game.JobId)
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The server Job ID has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

OtherTab:CreateDivider()

OtherTab:CreateSection("Links")
OtherTab:CreateButton({
    Name = "Copy the Preppy Hub Discord invite link",
    Callback = function()
        setclipboard("https://discord.gg/s3nQKytVkm")
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The Discord invite link has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

OtherTab:CreateButton({
    Name = "Copy the Preppy Hub YouTube channel link",
    Callback = function()
        setclipboard("https://www.youtube.com/@preppyhubscripts")
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The YouTube channel link has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

OtherTab:CreateDivider()

local InformationParagraph = OtherTab:CreateParagraph({
    Title = "Debug Information",
    Content = "Loading..."
})

local player, rs, diffNames = game.Players.LocalPlayer, game:GetService("ReplicatedStorage"), {
    [1] = "Easy", [2] = "Normal", [3] = "Hard", [4] = "Extreme", [5] = "Randomiser"
}
local difficultyText = diffNames[rs.Values.ServerDifficulty.Value] or "Unknown"
local serverType = rs.Values.PrivateServer.Value and "Private Server" or "Public Server"
local maxPlayers = 10

local function formatPlaytime(seconds)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    seconds = seconds % 60
    minutes = minutes % 60

    local parts = {}

    if hours > 0 then
        table.insert(parts, hours .. (hours == 1 and " hour" or " hours"))
    end
    if minutes > 0 then
        table.insert(parts, minutes .. (minutes == 1 and " minute" or " minutes"))
    end
    if seconds > 0 and #parts == 0 then
        table.insert(parts, seconds .. (seconds == 1 and " second" or " seconds"))
    end

    return table.concat(parts, ", ")
end

local function updateDebugInfo()
    while true do
        local accountAge = player.AccountAge .. (player.AccountAge == 1 and " day" or " days")
        local playtime = formatPlaytime(player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("Playtime") and player.PlayerData.Playtime.Value or 0)
        local playerStars = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("Stars") and player.PlayerData.Stars.Value or "Unknown"
        local totalWords = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("TotalWords") and player.PlayerData.TotalWords.Value or "Unknown"
        local equippedFont = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("TypeFont") and player.PlayerData.TypeFont.Value or "Unknown"
        local equippedEffect = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("DeathEffect") and player.PlayerData.DeathEffect.Value or "Unknown"
        local serverPlayers = #game.Players:GetPlayers() .. " / " .. maxPlayers

        InformationParagraph:Set({
            Title = "Information",
            Content = "Username: " .. player.DisplayName .. " (@" .. player.Name .. ")" ..
                      "\nAccount Age: " .. accountAge ..
                      "\n\nTotal Playtime: " .. playtime ..
                      "\nPlayer Stars: " .. playerStars ..
                      "\nTotal Correct Words: " .. totalWords ..
                      "\nEquipped Font: " .. equippedFont ..
                      "\nEquipped Death Effect: " .. equippedEffect ..
                      "\n\nServer Difficulty: " .. difficultyText ..
                      "\nServer Type: " .. serverType ..
                      "\nServer Players: " .. serverPlayers ..
                      "\n\nScript Version: V" .. version ..
                      "\nSupported Words: " .. supportedwords .. " / 540"
        })

        task.wait(60)
    end
end

task.spawn(updateDebugInfo)


task.spawn(function()
    while true do
        task.wait(0.3)
        checksound()
    end
end)

Rayfield:LoadConfiguration()