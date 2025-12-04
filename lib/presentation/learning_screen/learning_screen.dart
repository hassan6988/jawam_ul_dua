import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late final List<Map<String, String>> allahNames;

  @override
  void initState() {
    super.initState();
    allahNames = baseNames;
  }

  void _nextPage() {
    if (_currentIndex < allahNames.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You have reached the last name.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF9),
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          "Names of Allah",
          style: AppStyles.w500f18poppins.copyWith(color: kWhiteColor),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: allahNames.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final name = allahNames[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // 🔹 Wrap main content in Expanded + SingleChildScrollView
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      name["arabic"] ?? "",
                                      style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: kScaffoldColor,
                                        fontFamily: 'ScheherazadeNew',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      name["name"] ?? "",
                                      style: AppStyles.w700f20poppins.copyWith(
                                        color: kSecondaryColor,
                                        fontSize: 24,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      name["meaning"] ?? "",
                                      style: AppStyles.w600f16poppins.copyWith(
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      name["summary"] ?? "",
                                      style: AppStyles.w400f14poppins.copyWith(
                                        color: Colors.black54,
                                        height: 1.5,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              "(${index + 1}/${allahNames.length})",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    _currentIndex == allahNames.length - 1
                        ? "Completed"
                        : "Next",
                    style: AppStyles.w600f16poppins.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> baseNames = [
  {
    "arabic": "ٱللَّٰهُ",
    "name": "Allah",
    "meaning": "The God",
    "summary":
        "The one and only deity worthy of worship; encompassing all attributes of perfection. This is the supreme name that includes all the divine attributes and characteristics. It is the name by which God refers to Himself in the Qur'an and is unique to Him alone. No other being can be called by this name, as it signifies the totality of divine perfection and absolute existence.",
  },
  {
    "arabic": "ٱلرَّحْمَـٰنُ",
    "name": "Ar-Rahman",
    "meaning": "The Most Compassionate",
    "summary":
        "He whose mercy is vast and encompasses all creation, without distinction or limit. This name emphasizes the all-encompassing nature of God's mercy that extends to every living being, believer and non-believer alike. Ar-Rahman's mercy is evident in the sustenance, provision, and blessings given to all creatures in this world. It is a mercy so vast that it precedes His wrath and touches everything in existence, from the smallest insect to the greatest celestial body.",
  },
  {
    "arabic": "ٱلرَّحِيمُ",
    "name": "Ar-Raheem",
    "meaning": "The Most Merciful",
    "summary":
        "He who bestows mercy especially upon the believers, both in this world and the hereafter. While Ar-Rahman's mercy is universal, Ar-Raheem refers to the specific, continuous mercy granted to those who believe and follow divine guidance. This mercy manifests in forgiveness of sins, acceptance of repentance, and the ultimate reward of Paradise. It is an active, ongoing mercy that responds to faith and righteous deeds throughout one's life and extends eternally in the afterlife.",
  },
  {
    "arabic": "ٱلْمَلِكُ",
    "name": "Al-Malik",
    "meaning": "The King",
    "summary":
        "He who owns and governs the entire universe with complete authority and justice. Al-Malik possesses absolute sovereignty over all creation, and His dominion is eternal and unshakeable. Unlike earthly kings whose power is limited and temporary, His kingship extends over the seen and unseen realms, from the beginning of time until eternity. Every atom in existence is under His command, and He rules with perfect wisdom, justice, and mercy.",
  },
  {
    "arabic": "ٱلْقُدُّوسُ",
    "name": "Al-Quddus",
    "meaning": "The Most Holy",
    "summary":
        "He who is pure, perfect, and free from any imperfection or defect. Al-Quddus is absolutely transcendent, beyond any human conception or limitation, untouched by any shortcoming or need. His holiness means He is completely separate from and above all creation, yet intimately aware of it. He is free from the attributes of created beings, such as weakness, ignorance, or injustice. The angels constantly glorify Him with the words 'Subhan' (Glory be) and 'Quddus' (Most Holy).",
  },
  {
    "arabic": "ٱلسَّلَامُ",
    "name": "As-Salam",
    "meaning": "The Source of Peace",
    "summary":
        "He who grants peace, safety, and well-being to His creation. As-Salam is free from all defects and flaws, and He is the source of all peace and security in the universe. Those who turn to Him find tranquility in their hearts and minds, even amidst life's trials. He protects His servants from harm and grants them safety in this life and the next. True peace can only be found through connection with As-Salam, as He removes anxiety and brings serenity to troubled souls.",
  },
  {
    "arabic": "ٱلْمُؤْمِنُ",
    "name": "Al-Mu'min",
    "meaning": "The Giver of Faith",
    "summary":
        "He who provides security and faith to those who believe in Him. Al-Mu'min grants believers confidence in His promises and removes fear from their hearts. He is trustworthy and never breaks His word, fulfilling every promise made to His servants. This name also signifies that He testifies to the truth of His own oneness and the truthfulness of His messengers. Through His guidance, He illuminates the path of faith and grants certainty to those who seek Him sincerely.",
  },
  {
    "arabic": "ٱلْمُهَيْمِنُ",
    "name": "Al-Muhaymin",
    "meaning": "The Protector",
    "summary":
        "He who watches over and protects everything with His supreme knowledge. Al-Muhaymin is the guardian and overseer of all creation, maintaining and sustaining everything in existence. Nothing escapes His watchful gaze, and He is aware of every detail, no matter how minute. He protects His servants from harm, preserving their well-being while they may be completely unaware. This name provides comfort knowing that an all-powerful, all-knowing protector is constantly watching over us with care and wisdom.",
  },
  {
    "arabic": "ٱلْعَزِيزُ",
    "name": "Al-Aziz",
    "meaning": "The Almighty",
    "summary":
        "He who is mighty and unconquerable; no one can overpower His will. Al-Aziz possesses ultimate strength and honor, and His decisions cannot be reversed or challenged by any force. He grants victory and might to whom He wills and humbles those who oppose His commands. His power is absolute, yet He uses it with perfect wisdom and justice. Nothing can diminish His glory or prevent Him from accomplishing His purpose, making Him the source of all true strength and dignity.",
  },
  {
    "arabic": "ٱلْجَبَّارُ",
    "name": "Al-Jabbar",
    "meaning": "The Compeller",
    "summary":
        "He who restores the broken and compels the arrogant to His will. Al-Jabbar has the power to mend what is broken, whether hearts, lives, or circumstances, and He compels all creation to submit to His supreme authority. This name reflects both His gentleness in healing the brokenhearted and His might in subduing the tyrants and oppressors. No one can resist His decree, and all arrogance melts away before His majesty. He rights all wrongs and ensures justice prevails, even when it seems delayed.",
  },
  {
    "arabic": "ٱلْمُتَكَبِّرُ",
    "name": "Al-Mutakabbir",
    "meaning": "The Supreme",
    "summary":
        "He who is supremely great and rejects every imperfection. Al-Mutakabbir possesses greatness that is appropriate only for Him, as He alone is worthy of ultimate pride and majesty. While arrogance is a vice in creation, this attribute is perfect for the Creator who is infinitely greater than all things. He is exalted above all limitations and deficiencies that affect created beings. His supreme greatness is not born of insecurity but is the natural expression of His absolute perfection and transcendence over all creation.",
  },
  {
    "arabic": "ٱلْخَالِقُ",
    "name": "Al-Khaliq",
    "meaning": "The Creator",
    "summary":
        "He who creates all things from nothing, determining their existence and nature. Al-Khaliq brings into being everything that exists, from the vast galaxies to the smallest particles. He creates with perfect planning and purpose, and nothing comes into existence except through His creative power. Every creature bears the marks of His intelligent design and wisdom. His creation is continuous, as He constantly creates new forms, situations, and circumstances according to His divine plan.",
  },
  {
    "arabic": "ٱلْبَارِئُ",
    "name": "Al-Bari",
    "meaning": "The Maker",
    "summary":
        "He who fashions and shapes creation into distinct forms. While Al-Khaliq refers to the planning and determination of creation, Al-Bari specifically refers to the execution and bringing forth of creation into actual existence. He brings things from the state of non-existence into existence, perfectly formed and proportioned. Every being is fashioned according to His will, perfectly suited for its purpose and environment. His making is flawless, with each creation bearing witness to His infinite artistry and precision.",
  },
  {
    "arabic": "ٱلْمُصَوِّرُ",
    "name": "Al-Musawwir",
    "meaning": "The Fashioner",
    "summary":
        "He who shapes and forms His creation in different forms and images. Al-Musawwir gives each creature its unique appearance, distinguishing one from another. He fashions everything with perfect proportions and beauty, from the intricate patterns of a snowflake to the complex features of a human face. No two creations are exactly alike, demonstrating His infinite creativity. He designed every form to be perfectly suited to its function, combining aesthetic beauty with practical purpose in ways that inspire wonder and reflection.",
  },
  {
    "arabic": "ٱلْغَفَّارُ",
    "name": "Al-Ghaffar",
    "meaning": "The Oft-Forgiving",
    "summary":
        "He who repeatedly forgives sins, no matter how many times His servants repent. Al-Ghaffar's forgiveness is not limited or conditional upon the magnitude of the sin or the number of times it has been committed. He covers and erases sins completely, restoring His servants to a state of purity. His door of repentance remains open until the last breath, inviting sinners to return to Him. This name encourages hope and dispels despair, reminding believers that no sin is too great for His forgiveness when genuine repentance is offered.",
  },
  {
    "arabic": "ٱلْقَهَّارُ",
    "name": "Al-Qahhar",
    "meaning": "The Subduer",
    "summary":
        "He who dominates and subdues all creation with His absolute power. Al-Qahhar has complete control over everything, and all submit to His will, whether willingly or unwillingly. The entire universe operates under His laws and commands, unable to deviate from His decree. Death, which overtakes all living things, is a manifestation of His subduing power. Despite humanity's temporary feeling of independence, we are all utterly dependent upon Him, and eventually, all resistance crumbles before His overwhelming authority.",
  },
  {
    "arabic": "ٱلْوَهَّابُ",
    "name": "Al-Wahhab",
    "meaning": "The Bestower",
    "summary":
        "He who gives abundantly and generously without expecting anything in return. Al-Wahhab bestows His gifts freely upon all creation, from physical sustenance to spiritual guidance. His giving is continuous and encompasses both material and immaterial blessings. He grants to the deserving and undeserving alike, as His generosity flows from His nature rather than the merit of the recipients. Every blessing we enjoy, from the air we breathe to the talents we possess, is a gift from Al-Wahhab, given without obligation or diminishment of His infinite treasures.",
  },
  {
    "arabic": "ٱلرَّزَّاقُ",
    "name": "Ar-Razzaq",
    "meaning": "The Provider",
    "summary":
        "He who provides sustenance and all means of support to every living creature. Ar-Razzaq ensures that every being receives what it needs to survive and thrive, often through means we never anticipated. His provision extends beyond just food and water to include knowledge, opportunities, health, and spiritual nourishment. He has guaranteed sustenance for every creature before its creation, and His provision never fails. Trusting in Ar-Razzaq brings peace of mind, as He provides through both expected and unexpected channels, often when we least expect it.",
  },
  {
    "arabic": "ٱلْفَتَّاحُ",
    "name": "Al-Fattah",
    "meaning": "The Opener",
    "summary":
        "He who opens the doors of mercy, provision, and knowledge to His servants. Al-Fattah removes obstacles and opens pathways where none seemed to exist, granting solutions to seemingly impossible problems. He opens hearts to faith and understanding, unlocking spiritual insight and wisdom. As the ultimate judge, He opens the way to truth and justice, deciding between people with perfect fairness. Calling upon Al-Fattah when facing closed doors or difficulties brings hope, as He has the power to open any door and create opportunities where there were none.",
  },
  {
    "arabic": "ٱلْعَلِيمُ",
    "name": "Al-Aleem",
    "meaning": "The All-Knowing",
    "summary":
        "He whose knowledge encompasses everything, past, present, and future. Al-Aleem knows every thought, intention, and action of every creature, as well as everything that could have been but never occurred. Nothing is hidden from Him, whether in the depths of the earth or the expanses of the heavens. His knowledge is perfect, eternal, and unchanging, requiring no learning or discovery. He knows what has been, what is, what will be, and what would have been if things were different—a knowledge so comprehensive that it is beyond human imagination.",
  },
  {
    "arabic": "ٱلْقَابِضُ",
    "name": "Al-Qabid",
    "meaning": "The Withholder",
    "summary":
        "He who withholds and restricts according to His wisdom. Al-Qabid may withhold provision, opportunities, or blessings, but this withholding is never arbitrary or cruel. Sometimes He restricts to protect us from harm, to test our patience, or to prepare us for something greater. He may withhold material wealth to enrich spiritual wealth, or restrict ease to build resilience and character. Understanding that Al-Qabid acts with perfect wisdom helps us accept life's restrictions with patience, knowing that what is withheld may be a hidden blessing or protection from something harmful.",
  },
  {
    "arabic": "ٱلْبَاسِطُ",
    "name": "Al-Basit",
    "meaning": "The Extender",
    "summary":
        "He who expands and grants abundance according to His wisdom. Al-Basit opens His hands generously, providing sustenance, opportunities, and blessings abundantly when He wills. He expands provision for some and restricts it for others, but both expansion and restriction come from His perfect knowledge and wisdom. He may expand material wealth, health, happiness, or spiritual understanding. Together with Al-Qabid (The Withholder), this name reminds us that all conditions—whether abundance or restriction—come from the same divine source and serve His wise purpose in our lives.",
  },
  {
    "arabic": "ٱلْخَافِضُ",
    "name": "Al-Khafid",
    "meaning": "The Abaser",
    "summary":
        "He who lowers and humbles whom He wills with perfect justice. Al-Khafid brings down the arrogant and those who transgress boundaries, removing the honor of those who misuse their status. This humbling serves as a form of justice and correction, bringing pride back to proper limits. He may lower someone's status, wealth, or power when it has led them astray from truth and justice. This abasement is not cruelty but rather a manifestation of divine justice and sometimes a mercy that redirects people toward humility and righteousness before it is too late.",
  },
  {
    "arabic": "ٱلرَّافِعُ",
    "name": "Ar-Rafi",
    "meaning": "The Exalter",
    "summary":
        "He who raises and elevates whom He wills in status and honor. Ar-Rafi lifts up the humble and righteous, granting them dignity, honor, and elevated positions. He raises believers in ranks through their faith and good deeds, elevating them both in this world and the hereafter. This elevation can be physical, social, or spiritual—sometimes visible to others, sometimes known only between the servant and the Lord. Together with Al-Khafid (The Abaser), this name teaches that all honor and humiliation come from God alone, not from human effort or circumstance.",
  },
  {
    "arabic": "ٱلْمُعِزُّ",
    "name": "Al-Mu'izz",
    "meaning": "The Giver of Honor",
    "summary":
        "He who bestows honor, dignity, and strength upon whom He wills. Al-Mu'izz grants might and respect to His servants, elevating them in the eyes of others and in their own reality. True honor comes only from Him, and those whom He honors cannot be humiliated by anyone. He may grant honor through wealth, knowledge, righteousness, or influence, and this honor brings with it responsibility. This name reminds us that seeking honor from other than God is futile, and that lasting dignity comes only through His favor and through living in accordance with His guidance.",
  },
  {
    "arabic": "ٱلْمُذِلُّ",
    "name": "Al-Mudhill",
    "meaning": "The Giver of Dishonor",
    "summary":
        "He who humiliates and disgraces whom He wills with perfect justice. Al-Mudhill removes honor from those who abuse it or who deserve humiliation through their arrogance and transgression. This dishonor serves divine justice, bringing to account those who oppress others or reject truth. No worldly power can protect someone whom God has decided to humiliate, just as no force can humiliate one whom He has honored. This name reminds us that ultimate honor and disgrace rest in His hands alone, encouraging us to seek His pleasure and avoid the arrogance that leads to humiliation.",
  },
  {
    "arabic": "ٱلسَّمِيعُ",
    "name": "As-Sami",
    "meaning": "The All-Hearing",
    "summary":
        "He who hears everything, from the loudest sounds to the quietest whispers and unspoken thoughts. As-Sami hears all voices simultaneously, in all languages, and in all places without confusion or difficulty. He hears the prayers of those who call upon Him and the cries of those in distress. No sound escapes His hearing, whether spoken aloud, whispered in secret, or expressed only in the heart. This name brings comfort that our prayers are always heard and accountability that our words are never unnoticed, encouraging us to guard our speech and to call upon Him confidently.",
  },
  {
    "arabic": "ٱلْبَصِيرُ",
    "name": "Al-Baseer",
    "meaning": "The All-Seeing",
    "summary":
        "He who sees everything, visible and invisible, in perfect clarity. Al-Baseer perceives all things simultaneously, from the largest galaxy to the smallest particle, missing nothing. He sees what is apparent and what is hidden, what exists in light and in darkness, in the depths of the ocean and in the hearts of people. His vision is not limited by distance, obstacles, or dimensions. This name reminds us that we are always in His sight, bringing both comfort (that He sees our struggles) and accountability (that He sees our actions), encouraging sincerity and righteousness in all circumstances.",
  },
  {
    "arabic": "ٱلْحَكَمُ",
    "name": "Al-Hakam",
    "meaning": "The Judge",
    "summary":
        "He who judges with ultimate authority and perfect justice. Al-Hakam is the supreme arbitrator whose judgment is final and cannot be appealed or overturned. He judges between people in their disputes with complete fairness, knowing every hidden detail and motivation. His verdicts are based on perfect knowledge and absolute justice, free from any bias, corruption, or error. In this world, He may judge through His revealed law, and in the hereafter, He will judge all of creation. His judgment brings truth to light and ensures that justice ultimately prevails, even when earthly courts fail.",
  },
  {
    "arabic": "ٱلْعَدْلُ",
    "name": "Al-Adl",
    "meaning": "The Just",
    "summary":
        "He who is absolutely just and places everything in its proper place. Al-Adl never wrongs anyone, even by the weight of an atom, and His justice pervades all of creation. He has established perfect balance in the universe and ensures that everyone receives exactly what they deserve—no more, no less. His justice means that good is rewarded and evil is punished, though the timing may be delayed to His perfect wisdom. This name provides hope to the oppressed that justice will ultimately be served and serves as a warning to oppressors that they cannot escape divine accountability.",
  },
  {
    "arabic": "ٱللَّطِيفُ",
    "name": "Al-Lateef",
    "meaning": "The Subtle",
    "summary":
        "He who is kind, gentle, and works in ways that are imperceptible to His creation. Al-Lateef is aware of the finest, most subtle details and works through gentle means to guide His servants toward what is best for them. His kindness often manifests in ways we don't immediately recognize—a closed door that leads to a better path, a difficulty that builds character, or a delay that prevents harm. He is so subtle in His workings that we may only recognize His gentle care in hindsight. This name brings comfort during difficulties, reminding us that His gentle wisdom is at work even when we cannot see or understand it.",
  },
  {
    "arabic": "ٱلْخَبِيرُ",
    "name": "Al-Khabeer",
    "meaning": "The All-Aware",
    "summary":
        "He who is completely aware of the inner nature and hidden aspects of all things. Al-Khabeer has intimate knowledge of every detail, understanding not just what happens but why and how. He knows the inner workings of all creation, from the functioning of atoms to the motivations of hearts. His awareness extends to hidden qualities, secret intentions, and concealed realities that no one else can perceive. This comprehensive awareness means nothing can be hidden from Him, and He fully understands the context and circumstances of every situation, making His decisions always perfectly informed and His guidance always perfectly suited to our needs.",
  },
  {
    "arabic": "ٱلْحَلِيمُ",
    "name": "Al-Haleem",
    "meaning": "The Forbearing",
    "summary":
        "He who is patient and does not hasten to punish despite having the power to do so. Al-Haleem allows time for His servants to repent and reform, delaying punishment even when it is deserved. Despite witnessing continuous disobedience and ingratitude, He remains patient, giving people opportunity after opportunity to turn back to Him. His forbearance is not weakness but a display of mercy and wisdom, allowing time for growth and change. This name encourages us never to despair of His mercy, no matter how long we have persisted in error, and to emulate His forbearance in our dealings with others.",
  },
  {
    "arabic": "ٱلْعَظِيمُ",
    "name": "Al-Azeem",
    "meaning": "The Magnificent",
    "summary":
        "He who is supremely great in every aspect, beyond any comparison or limitation. Al-Azeem's greatness encompasses all attributes of perfection—His knowledge, power, mercy, and wisdom are all infinitely vast. He is greater than anything the human mind can conceive, and His magnificence inspires awe in all of creation. The angels constantly glorify Him with the words 'Subhana Rabbi Al-Azeem' (Glory be to my Lord, the Magnificent). Understanding His magnificence puts our problems in perspective and reminds us that nothing is too great for Him to handle or too small for Him to care about.",
  },
  {
    "arabic": "ٱلْغَفُورُ",
    "name": "Al-Ghafoor",
    "meaning": "The Most Forgiving",
    "summary":
        "He who forgives extensively and completely, covering sins and erasing them entirely. Al-Ghafoor not only pardons sins but also conceals them, protecting the dignity of His servants. His forgiveness is vast enough to cover all sins, no matter how great, when sincere repentance is offered. He forgives repeatedly, never tiring of His servants' return to Him, and never holds grudges or keeps record of past sins once they are forgiven. This name is one of the most frequently mentioned in the Qur'an, emphasizing the centrality of divine forgiveness and encouraging believers to always maintain hope in His mercy.",
  },
  {
    "arabic": "ٱلشَّكُورُ",
    "name": "Ash-Shakoor",
    "meaning": "The Most Appreciative",
    "summary":
        "He who appreciates and rewards even the smallest good deed manifold. Ash-Shakoor is grateful for the efforts of His servants, multiplying the reward for their good actions far beyond what they deserve. A small act of kindness or devotion receives immense reward from Him, and He never allows any good deed to go unrecognized or unrewarded. He appreciates not just the action but the intention behind it, rewarding sincerity even when the deed itself is imperfect. This name encourages us to perform good deeds, no matter how small, knowing they are valued and will be generously rewarded by the Most Appreciative.",
  },
  {
    "arabic": "ٱلْعَلِيُّ",
    "name": "Al-Aliyy",
    "meaning": "The Most High",
    "summary":
        "He who is exalted above all creation in His essence, attributes, and authority. Al-Aliyy is supreme in every way—in status, power, and majesty. Nothing and no one is above Him or equal to Him, and He is elevated far beyond any human comprehension or description. His highness is not merely physical elevation but encompasses His absolute transcendence over all limitations of creation. Despite His exaltedness, He remains intimately aware of and close to His creation. This name reminds us of His supreme authority and inspires humility, as we recognize that the Most High is yet mindful of us in our lowly state.",
  },
  {
    "arabic": "ٱلْكَبِيرُ",
    "name": "Al-Kabeer",
    "meaning": "The Most Great",
    "summary":
        "He who is infinitely great, with greatness that has no limits or bounds. Al-Kabeer's greatness exceeds all measure and comparison—everything else is small in relation to Him. His greatness is evident in the vastness of His creation, from the endless expanse of the universe to the intricate complexity of a single cell. He is greater than any description, greater than any imagination, and greater than any need. The declaration 'Allahu Akbar' (God is Greater) acknowledges that He is greater than anything we can conceive or anything that might distract us from Him. This name puts all worldly concerns in proper perspective.",
  },
  {
    "arabic": "ٱلْحَفِيظُ",
    "name": "Al-Hafeedh",
    "meaning": "The Preserver",
    "summary":
        "He who guards and preserves everything He has created with perfect care. Al-Hafeedh watches over all creation, protecting it from harm and maintaining its existence moment by moment. He preserves the records of all deeds, words, and intentions, nothing being lost or forgotten. He guards the believers from harm, both seen and unseen, and preserves His divine message through the generations. The entire universe would cease to exist if He withdrew His preservation even for an instant. This name brings peace of heart, knowing that we are under the protection and care of the ultimate Guardian who never sleeps, forgets, or neglects.",
  },
  {
    "arabic": "ٱلْمُقِيتُ",
    "name": "Al-Muqeet",
    "meaning": "The Sustainer",
    "summary":
        "He who provides and maintains all creation, giving each being what it needs to survive. Al-Muqeet ensures that every creature receives its necessary sustenance and that the entire system of creation continues to function harmoniously. He distributes provisions according to His wisdom, maintaining perfect balance in the ecosystem of life. His sustaining power extends beyond physical nourishment to include spiritual and emotional sustenance as well. He has power over all things and ensures that no creature is forgotten or neglected in His vast creation, demonstrating that His care is both universal and particular to each individual being.",
  },
  {
    "arabic": "ٱلْحَسِيبُ",
    "name": "Al-Haseeb",
    "meaning": "The Reckoner",
    "summary":
        "He who takes account of all things with perfect accuracy and swiftness. Al-Haseeb will call all creation to account for their deeds on the Day of Judgment, and He is sufficient as a reckoner, needing no witnesses or helpers. He counts and records everything—every action, word, and thought—with absolute precision. Those who trust in Al-Haseeb find Him sufficient in all their affairs, as He manages and takes care of all matters for those who rely on Him. This name reminds us of accountability while also encouraging us to depend on Him, as He is sufficient as both a judge and a guardian of our interests.",
  },
  {
    "arabic": "ٱلْجَلِيلُ",
    "name": "Al-Jaleel",
    "meaning": "The Majestic",
    "summary":
        "He who possesses supreme majesty, grandeur, and dignity beyond description. Al-Jaleel is magnificent in His attributes and awe-inspiring in His presence. His majesty commands reverence and respect from all creation, and nothing can diminish His splendor or glory. Despite His majestic greatness, He is not distant or unapproachable; rather, His majesty is combined with mercy and kindness toward His servants. Contemplating His majesty inspires worship and humility, as we recognize our own insignificance before His infinite grandeur, yet we also find comfort in knowing that this Majestic Being cares for us and listens to our prayers.",
  },
  {
    "arabic": "ٱلْكَرِيمُ",
    "name": "Al-Kareem",
    "meaning": "The Most Generous",
    "summary":
        "He who is infinitely generous, giving abundantly without expecting anything in return. Al-Kareem's generosity is boundless and continuous, showering His creation with countless blessings, both recognized and unrecognized. He gives before being asked and grants more than what is requested, and His generosity never diminishes no matter how much He gives. He is generous in forgiving sins, generous in accepting minimal good deeds, and generous in rewarding them manifold. His generosity extends to all—the grateful and the ungrateful, the obedient and the disobedient—demonstrating that giving is His nature, not contingent on our worthiness but flowing from His perfect character.",
  },
  {
    "arabic": "ٱلرَّقِيبُ",
    "name": "Ar-Raqeeb",
    "meaning": "The Watchful",
    "summary":
        "He who watches over all creation constantly with perfect awareness. Ar-Raqeeb observes everything at all times, and nothing escapes His watchful eye. He is aware of every movement, word, thought, and intention, watching over His creation with care and vigilance. This constant watchfulness serves both as protection for the righteous and accountability for the wrongdoers. Knowing that Ar-Raqeeb is always watching encourages believers to maintain good character even in private, as they are never truly alone or unobserved. His watchfulness is not intrusive but protective, ensuring that justice is maintained and that His servants are guided and guarded.",
  },
  {
    "arabic": "ٱلْمُجِيبُ",
    "name": "Al-Mujeeb",
    "meaning": "The Responsive",
    "summary":
        "He who responds to the prayers and supplications of those who call upon Him. Al-Mujeeb hears every prayer and answers in the way that is best for His servant, though the response may not always be in the form or timing we expect. He responds to those in distress, even when they have no one else to turn to, and His door is always open to those who call upon Him. The response may be granting what is asked, giving something better, averting a harm, or saving the reward for the hereafter. This name encourages us to persist in prayer and to trust that our calls are never ignored.",
  },
  {
    "arabic": "ٱلْوَاسِعُ",
    "name": "Al-Wasi",
    "meaning": "The All-Encompassing",
    "summary":
        "He whose knowledge, mercy, and power are vast and all-encompassing. Al-Wasi contains all things, and nothing is outside His grasp or beyond His capacity. His vastness is evident in the boundless universe He created and in His unlimited ability to provide, forgive, and care for infinite numbers of creatures simultaneously. His mercy and generosity are so vast that they encompass all creation without being diminished. No matter how much we ask of Him, His treasures never decrease, and no matter how many turn to Him, His attention to each remains perfect and complete, demonstrating that His vastness is truly infinite.",
  },
  {
    "arabic": "ٱلْحَكِيمُ",
    "name": "Al-Hakeem",
    "meaning": "The All-Wise",
    "summary":
        "He who possesses perfect wisdom in all His actions, decisions, and decrees. Al-Hakeem creates and commands with complete wisdom, placing everything in its proper place and time for the best possible purpose. His wisdom is evident in the intricate design of creation, the balance of the universe, and the laws He has prescribed for humanity. Even when we cannot understand the wisdom behind certain trials or decrees, we can trust that Al-Hakeem's wisdom is perfect and that every matter has a profound purpose. His wisdom ensures that nothing He does is random, meaningless, or without benefit, even if that benefit is hidden from our limited understanding.",
  },
  {
    "arabic": "ٱلْوَدُودُ",
    "name": "Al-Wadud",
    "meaning": "The Most Loving",
    "summary":
        "He who loves His righteous servants and is beloved by them. Al-Wadud's love is pure, constant, and unconditional for those who turn to Him in faith and obedience. He loves those who love Him, and His love manifests in the countless blessings, guidance, and protection He provides. Unlike human love which can be fickle or self-serving, His love is perfect and seeks only the best for His beloved servants. He plants love for the believers in the hearts of others and creates bonds of affection between people. Drawing near to Al-Wadud through worship and good deeds causes Him to draw near to us with His love, mercy, and special care.",
  },
  {
    "arabic": "ٱلْمَجِيدُ",
    "name": "Al-Majeed",
    "meaning": "The Glorious",
    "summary":
        "He who is most glorious and praiseworthy in His essence and attributes. Al-Majeed possesses ultimate glory and honor, and all glory belongs to Him alone. His majesty and magnificence are absolute, and He is exalted above all creation in His perfection. He is generous in His giving and noble in His treatment of His servants, granting honor to those who follow His path. His glory is eternal and unchanging, unaffected by the praise of those who glorify Him or the denial of those who reject Him. All true glory and honor in creation are merely reflections of His infinite glory, and ultimately all praise returns to Him.",
  },
  {
    "arabic": "ٱلْبَاعِثُ",
    "name": "Al-Ba'ith",
    "meaning": "The Resurrector",
    "summary":
        "He who will resurrect all creation on the Day of Judgment for accountability. Al-Ba'ith will bring every person back to life after death, gathering all souls for the final reckoning. Just as He created us the first time from nothing, He will recreate us again, restoring every cell and atom to account for what was done in life. He sends messengers to awaken people spiritually during their earthly lives, calling them from heedlessness to awareness. This resurrection is not difficult for Him, as He who created the heavens and earth can easily recreate human beings. This name reminds us that death is not the end but rather a transition to eternal accountability.",
  },
  {
    "arabic": "ٱلشَّهِيدُ",
    "name": "Ash-Shaheed",
    "meaning": "The Witness",
    "summary":
        "He who witnesses all things at all times with perfect knowledge. Ash-Shaheed is present everywhere and aware of everything, serving as the ultimate witness to all actions, words, and thoughts. Nothing happens in creation without His witnessing it, and His testimony is the truest and most reliable of all testimonies. On the Day of Judgment, He will testify regarding what people did, as He was witness to every moment of their lives. This constant divine witnessing encourages believers to maintain integrity and consciousness of God in all situations, knowing that even in complete solitude, Ash-Shaheed is present and observing everything.",
  },
  {
    "arabic": "ٱلْحَقُّ",
    "name": "Al-Haqq",
    "meaning": "The Truth",
    "summary":
        "He who is the ultimate reality and absolute truth. Al-Haqq is real in the most complete sense, while everything else is contingent and temporary. His existence is necessary and eternal, unlike creation which is dependent on Him. Everything He says is true, everything He promises comes to pass, and His religion is the truth. All truth in the universe stems from Him, and all reality is established by Him. While falsehood may appear strong temporarily, Al-Haqq ensures that truth ultimately prevails. Those who align themselves with His truth find certainty and stability, while those who chase falsehood find only confusion and disappointment.",
  },
  {
    "arabic": "ٱلْوَكِيلُ",
    "name": "Al-Wakeel",
    "meaning": "The Trustee",
    "summary":
        "He who is the ultimate guardian and manager of all affairs. Al-Wakeel is completely reliable and trustworthy, managing the affairs of those who place their trust in Him. When we delegate our concerns to Him, He handles them with perfect wisdom and care, better than we ever could ourselves. He is sufficient as a protector and helper, needing no assistance from anyone. Those who truly rely on Al-Wakeel experience peace of heart, as they know their affairs are in the hands of the One who has power over all things. Trusting in Him doesn't mean abandoning effort, but rather doing our part while relying on Him for the outcome.",
  },
  {
    "arabic": "ٱلْقَوِيُّ",
    "name": "Al-Qawiyy",
    "meaning": "The Most Strong",
    "summary":
        "He who possesses absolute and unlimited strength and power. Al-Qawiyy is never weak, tired, or overpowered, and His strength never diminishes regardless of what He does. Creating and maintaining the entire universe requires not even an iota of effort from Him, and He never experiences fatigue or strain. His strength is perfect and complete, unmatched and unshakeable by any force. When believers feel weak or overwhelmed, they can draw strength from Al-Qawiyy, knowing that His power is infinite and available to those who seek His help. All strength in creation is derived from His strength, and without His empowerment, nothing would have any power at all.",
  },
  {
    "arabic": "ٱلْمَتِينُ",
    "name": "Al-Mateen",
    "meaning": "The Firm",
    "summary":
        "He whose strength is firm, unwavering, and unbreakable. Al-Mateen possesses strength that is not only immense but also constant and reliable, never fluctuating or failing. His power is firmly established and cannot be overcome, challenged, or diminished by anything. While Al-Qawiyy emphasizes His great strength, Al-Mateen emphasizes the firmness and steadfastness of that strength. He maintains the universe with firm, unshakeable power, and His decrees are firmly established and cannot be altered by anyone. This name provides assurance that His support is dependable and His promises are certain, as they rest on His firm and unshakeable power.",
  },
  {
    "arabic": "ٱلْوَلِيُّ",
    "name": "Al-Waliyy",
    "meaning": "The Protecting Friend",
    "summary":
        "He who is the guardian, protector, and helper of the believers. Al-Waliyy is close to His righteous servants, managing their affairs, protecting them from harm, and guiding them to success. He is a friend in the truest sense—one who supports, loves, and cares for those under His protection. His friendship brings honor, security, and guidance, and those who are under His wilayah (protection) are truly fortunate. He helps believers overcome their enemies and obstacles, both external and internal. Taking Al-Waliyy as one's protector means distancing oneself from false protectors and placing complete trust in the One whose protection never fails and whose friendship brings both worldly and eternal benefits.",
  },
  {
    "arabic": "ٱلْحَمِيدُ",
    "name": "Al-Hameed",
    "meaning": "The Praiseworthy",
    "summary":
        "He who is worthy of all praise in every situation and from every perspective. Al-Hameed deserves praise not only for His blessings and favors but also for His perfect essence and attributes. Every act He performs is praiseworthy, even when it involves difficulty or trial for His servants, because His wisdom and mercy underlie all His actions. All praise in existence originates from Him and returns to Him, as He alone is truly and completely praiseworthy. Whether people praise Him or not does not affect His perfection, but those who praise Him benefit themselves by recognizing His perfection and drawing closer to Him. Every blessing we enjoy calls us to praise Al-Hameed, and every trial is an opportunity to trust in His praiseworthy wisdom.",
  },
  {
    "arabic": "ٱلْمُحْصِي",
    "name": "Al-Muhsee",
    "meaning": "The Reckoner",
    "summary":
        "He who has counted and recorded everything with perfect precision. Al-Muhsee has enumerated all of creation, accounting for every atom, every moment, and every deed with absolute accuracy. He has complete statistics of everything that has occurred, is occurring, and will occur. Not a single word is spoken, thought is conceived, or action is performed without it being recorded in His perfect knowledge. On the Day of Judgment, He will present these accounts to people, and they will find everything recorded without the smallest detail missing. This comprehensive accounting serves justice, ensuring that no good deed goes unrewarded and no evil deed goes unaccounted for, while also reminding us that our lives are not random but precisely observed and recorded.",
  },
  {
    "arabic": "ٱلْمُبْدِئُ",
    "name": "Al-Mubdi",
    "meaning": "The Originator",
    "summary":
        "He who originates and begins all creation from nothing. Al-Mubdi brought everything into existence for the first time without any prior model or example to follow. He initiated creation by His command 'Be,' and it came into being. His origination is not limited to the physical universe but includes the beginning of time itself, the souls of all creatures, and every new thing that comes into existence. Unlike human creation which requires pre-existing materials and models, His origination is absolute—creating from pure non-existence. Understanding this name deepens our appreciation for His unique creative power and reminds us that He who began our existence can easily recreate us after death.",
  },
  {
    "arabic": "ٱلْمُعِيدُ",
    "name": "Al-Mu'id",
    "meaning": "The Restorer",
    "summary":
        "He who will restore and recreate all creation after its end. Al-Mu'id will bring everything back into existence on the Day of Resurrection, restoring every human being to life for judgment. Just as He created us the first time, He will recreate us—a task that is easy for Him despite seeming impossible to human understanding. This restoration also applies to His renewal of creation in cycles—seasons returning, life emerging from apparent death, and His ability to restore people from ruin to prosperity. The one who restores life can also restore broken hearts, lost hope, and devastated circumstances. This name provides certainty in the resurrection and hope for restoration in all aspects of life.",
  },
  {
    "arabic": "ٱلْمُحْيِي",
    "name": "Al-Muhyi",
    "meaning": "The Giver of Life",
    "summary":
        "He who gives life to all living things and brings the dead back to life. Al-Muhyi initiated life on earth and continues to grant life to every new being born. He brings life in both the physical sense (animating bodies) and the spiritual sense (enlightening hearts with faith and knowledge). He brings the earth to life after its death through rain, and He will bring all humanity back to life on the Day of Resurrection. Life in all its forms—biological, spiritual, and intellectual—comes only from Him. When our hearts feel dead from sin or our situations seem lifeless, Al-Muhyi has the power to revive them, breathing new life into what seemed permanently lost.",
  },
  {
    "arabic": "ٱلْمُمِيتُ",
    "name": "Al-Mumeet",
    "meaning": "The Bringer of Death",
    "summary":
        "He who causes all living things to die at their appointed time. Al-Mumeet has decreed death for every soul, and when the appointed time arrives, nothing can delay it even by a moment. Death is not the end but a transition He has designed as part of His perfect plan, moving souls from temporary worldly life to eternal existence. He brings death to the physical body but also to false desires, egos, and attachments that prevent spiritual growth. Understanding that He controls death removes fear of other than Him and helps us prepare for the inevitable meeting with Him. No one can escape death, making it the one certainty that should motivate us to live purposefully and righteously.",
  },
  {
    "arabic": "ٱلْحَيُّ",
    "name": "Al-Hayy",
    "meaning": "The Ever-Living",
    "summary":
        "He who is eternally alive with life that has no beginning and no end. Al-Hayy's life is perfect, necessary, and independent—He does not need food, sleep, or anything else to sustain His existence. His life is the source of all other life in creation, and everything that lives does so because He grants it life. Unlike created beings whose life is temporary and fragile, His life is eternal and unchanging. He never dies, never sleeps, never becomes weak or tired. This perfect life means He is always present, always aware, and always capable of responding to His servants. While everything else perishes, Al-Hayy remains, making Him the only truly reliable being to depend upon.",
  },
  {
    "arabic": "ٱلْقَيُّومُ",
    "name": "Al-Qayyum",
    "meaning": "The Self-Subsisting",
    "summary":
        "He who is self-sufficient and sustains all of existence. Al-Qayyum depends on nothing and no one for His existence, while everything else depends entirely on Him for its continued existence. He maintains the entire universe, and if He withdrew His sustaining power for even an instant, everything would collapse into nothingness. He never sleeps, rests, or requires any support, standing eternally firm while upholding all creation. This name is often paired with Al-Hayy (The Ever-Living), as together they represent the perfect, independent existence that belongs to God alone. Understanding Al-Qayyum helps us recognize our complete dependence on Him and the futility of relying on anything other than the Self-Subsisting One.",
  },
  {
    "arabic": "ٱلْوَاجِدُ",
    "name": "Al-Wajid",
    "meaning": "The Finder",
    "summary":
        "He who finds and lacks nothing, possessing all that He needs and wants. Al-Wajid is completely self-sufficient, finding everything He desires within His own perfect nature without needing to seek it from outside Himself. He lacks no knowledge, power, or perfection, as all attributes of excellence are found in Him in their complete form. He finds and discovers those who seek Him, never losing track of anyone in His vast creation. When His servants seek something, He is the one who helps them find it, guiding them to what they need. This name reminds us that while we are always in need and searching, He is the complete opposite—fully satisfied and needing nothing from His creation.",
  },
  {
    "arabic": "ٱلْمَاجِدُ",
    "name": "Al-Majid",
    "meaning": "The Most Glorious",
    "summary":
        "He who is glorious in His essence, attributes, and actions beyond any comparison. Al-Majid possesses ultimate nobility, honor, and dignity, and His glory encompasses both majesty and generosity. He is glorious in His power yet generous in His treatment of creation, combining might with kindness. His glory is not diminished by giving to others; rather, His generosity is itself a manifestation of His glory. Everything glorious in creation is merely a reflection of His glory, like the sun's rays reflecting His light. Those who recognize His glory naturally humble themselves before Him while simultaneously feeling honored that such a glorious being cares for them and listens to their prayers.",
  },
  {
    "arabic": "ٱلْوَاحِدُ",
    "name": "Al-Wahid",
    "meaning": "The One, The Indivisible",
    "summary":
        "He who is absolutely one, unique, and without any partners, equals, or rivals. Al-Wahid is singular in His essence, attributes, and actions—there is no deity but Him, and nothing resembles Him in any way. His oneness means He alone deserves worship, He alone created the universe, and He alone controls all affairs. This is not merely numerical oneness but absolute uniqueness—He is one-of-a-kind in every sense. Understanding His oneness transforms our worldview, directing all worship, hope, and fear to Him alone rather than dispersing it among created things. This tawhid (oneness) is the foundation of Islamic faith and the key to paradise, as recognizing Al-Wahid means freeing oneself from servitude to anything other than the One true God.",
  },
  {
    "arabic": "ٱلْأَحَدُ",
    "name": "Al-Aḥad",
    "meaning": "The Unique, The Only One",
    "summary":
        "He who is absolutely one, unique, and without any partners, equals, or rivals. Al-Wahid is singular in His essence, attributes, and actions—there is no deity but Him, and nothing resembles Him in any way. His oneness means He alone deserves worship, He alone created the universe, and He alone controls all affairs. This is not merely numerical oneness but absolute uniqueness—He is one-of-a-kind in every sense. Understanding His oneness transforms our worldview, directing all worship, hope, and fear to Him alone rather than dispersing it among created things. This tawhid (oneness) is the foundation of Islamic faith and the key to paradise, as recognizing Al-Wahid means freeing oneself from servitude to anything other than the One true God.",
  },
  {
    "arabic": "ٱلصَّمَدُ",
    "name": "As-Samad",
    "meaning": "The Eternal Refuge",
    "summary":
        "He who is the ultimate goal of all needs and the one upon whom everything depends. As-Samad is completely independent and self-sufficient, requiring nothing from anyone, while everything and everyone requires Him. He is the refuge to whom all turn in their needs—in times of difficulty, when seeking provision, when making decisions, or when needing help. He is eternal and absolute, containing all perfections within Himself without any deficiency or need. Unlike created beings who have needs, weaknesses, and dependencies, As-Samad is perfectly complete and unaffected by anything. Turning to As-Samad with our needs acknowledges the reality of our dependence and His sufficiency, bringing peace through reliance on the only truly reliable source.",
  },
  {
    "arabic": "ٱلْقَادِرُ",
    "name": "Al-Qadir",
    "meaning": "The Capable",
    "summary":
        "He who has power over all things and can do whatever He wills. Al-Qadir is capable of bringing any matter into existence or preventing it from occurring, and nothing is difficult or impossible for Him. His capability extends to all things, including those that seem impossible to human understanding, like creating the universe from nothing or resurrecting the dead. Every ability and power in creation is derived from His power, and without His enabling, nothing would have any capability whatsoever. When we feel incapable or overwhelmed, remembering Al-Qadir reminds us that He can do what we cannot, and turning to Him opens doors that seemed permanently closed. His capability assures us that no situation is beyond remedy when He wills.",
  },
  {
    "arabic": "ٱلْمُقْتَدِرُ",
    "name": "Al-Muqtadir",
    "meaning": "The Omnipotent",
    "summary":
        "He whose power is perfect, complete, and overwhelming. While Al-Qadir emphasizes capability, Al-Muqtadir emphasizes the perfection and totality of that power. His might is absolute, and He has complete dominion over everything He created. He can accomplish whatever He wills without any delay, difficulty, or need for assistance. His power is perfectly balanced with His wisdom, so He uses His omnipotence only in ways that serve His wise purposes. Nothing can resist His will or prevent Him from executing His plans. This name inspires both awe and comfort—awe at His overwhelming might, and comfort knowing that this omnipotent being is merciful and just, using His power for the ultimate good according to His perfect wisdom.",
  },
  {
    "arabic": "ٱلْمُقَدِّمُ",
    "name": "Al-Muqaddim",
    "meaning": "The Expediter",
    "summary":
        "He who brings forward and advances whom and what He wills. Al-Muqaddim promotes people in rank, hastens events, or brings things to the forefront according to His wisdom. He may advance someone in knowledge, status, righteousness, or opportunity, giving them precedence over others. In His creation, He has given precedence to certain things over others—humans over animals, prophets over ordinary people, and some prophets over others—all according to His perfect wisdom. When something arrives earlier than expected or someone is unexpectedly promoted, it is Al-Muqaddim at work. This advancement is always deserved and wise, serving purposes that may be clear or hidden but are always perfectly just.",
  },
  {
    "arabic": "ٱلْمُؤَخِّرُ",
    "name": "Al-Mu'akhkhir",
    "meaning": "The Delayer",
    "summary":
        "He who delays and defers according to His wisdom. Al-Mu'akhkhir postpones things, holding them back until the proper time or keeping them in their appropriate place. What seems like delay is actually divine timing—He knows the perfect moment for everything. He may delay something to protect us from harm, to prepare us for a greater blessing, to test our patience, or for reasons beyond our comprehension. Together with Al-Muqaddim (The Expediter), this name teaches us that timing is entirely in His hands, and both advancement and delay serve His wise purposes. Accepting His delays with patience demonstrates trust in His wisdom and understanding that He sees what we cannot see.",
  },
  {
    "arabic": "ٱلْأَوَّلُ",
    "name": "Al-Awwal",
    "meaning": "The First",
    "summary":
        "He who has no beginning and existed before everything else. Al-Awwal is eternally first, with nothing before Him—He was when nothing else was. Time itself is His creation, so He exists outside of time, unaffected by its passage. Every chain of causation ultimately leads back to Him as the First Cause, the uncaused cause of all that exists. While everything in creation has a beginning, He is the Beginning without a beginning, the originator who Himself was never originated. Understanding that He is Al-Awwal helps us grasp that everything we know is contingent, temporary, and dependent on Him, while He alone is necessary, eternal, and independent.",
  },
  {
    "arabic": "ٱلْآخِرُ",
    "name": "Al-Akhir",
    "meaning": "The Last",
    "summary":
        "He who has no end and will remain after everything else perishes. Al-Akhir is eternally last, outlasting all of creation—He will be when nothing else remains. When the universe ends and all created things cease to exist, He will remain exactly as He has always been, unaffected by the end of creation just as He was unaffected by its beginning. His existence has no terminus, no conclusion, no final chapter. After the Day of Judgment, when all affairs are settled, it is to Him that everything returns. This name brings comfort knowing that while we and everything around us is temporary, there is an eternal, unchanging reality to which we will return—Al-Akhir who was, is, and always will be.",
  },
  {
    "arabic": "ٱلظَّاهِرُ",
    "name": "Adh-Dhahir",
    "meaning": "The Manifest",
    "summary":
        "He whose existence is evident through His signs in creation. Adh-Dhahir is manifest and apparent, with His presence made clear through the countless signs visible throughout the universe. Every aspect of creation—from the vastness of galaxies to the complexity of DNA—points to His existence, power, and wisdom. His attributes are manifest in His creation, with His mercy evident in provision, His power evident in natural phenomena, and His wisdom evident in the perfect balance of the universe. Though He cannot be seen with physical eyes in this world, His effects and signs are everywhere, making His existence undeniable to those who reflect. He is more apparent than anything else, yet many remain heedless of the obvious signs surrounding them.",
  },
  {
    "arabic": "ٱلْبَاطِنُ",
    "name": "Al-Batin",
    "meaning": "The Hidden",
    "summary":
        "He whose essence is hidden and cannot be fully comprehended by creation. While His signs are manifest (Adh-Dhahir), His true essence remains hidden (Al-Batin) beyond human perception and understanding. We see His effects but cannot see Him, we know His attributes but cannot fully grasp His essence. He is nearer to us than our jugular vein, yet His reality transcends our complete comprehension. This hiddenness is not due to weakness or absence but rather to His transcendence beyond the limitations of created perception. He knows all hidden things—concealed intentions, secret actions, and invisible realities—while remaining Himself the ultimate hidden reality. Together, Adh-Dhahir and Al-Batin teach that He is both immanent (close and evident) and transcendent (beyond and hidden).",
  },
  {
    "arabic": "ٱلْوَالِي",
    "name": "Al-Wali",
    "meaning": "The Governor",
    "summary":
        "He who governs and manages all affairs with supreme authority. Al-Wali is the ultimate ruler and administrator of the universe, managing everything according to His perfect wisdom and knowledge. He governs the affairs of individuals, communities, nations, and the entire cosmos with complete control and awareness. His governance is just, wise, and merciful, ensuring that everything unfolds according to His plan. Unlike human rulers whose governance is imperfect and limited, His rule is absolute, extending to every detail of existence. He is the governor of hearts, turning them as He wills, and the governor of circumstances, directing events toward His intended purposes. Those who recognize His governance submit willingly to His decrees, finding peace in His wise management of all affairs.",
  },
  {
    "arabic": "ٱلْمُتَعَالِي",
    "name": "Al-Muta'ali",
    "meaning": "The Most Exalted",
    "summary":
        "He who is supremely high and exalted above all creation and all imperfections. Al-Muta'ali transcends everything—He is high above any description, comparison, or imagination. His exaltedness encompasses His essence, attributes, and actions, placing Him infinitely beyond any created thing. He is exalted above the limitations that affect creation, such as weakness, need, ignorance, or injustice. No matter how high our understanding reaches, He remains higher still, beyond complete comprehension. His exaltedness does not mean distance or indifference; rather, while being supremely high, He remains intimately aware and close to His creation. This name inspires profound humility, as we recognize the infinite distance between His exalted perfection and our humble imperfection.",
  },
  {
    "arabic": "ٱلْبَرُّ",
    "name": "Al-Barr",
    "meaning": "The Source of Goodness",
    "summary":
        "He who is perfectly good and kind, showering goodness upon His creation. Al-Barr is the source of all goodness, righteousness, and kindness in existence, and every good thing comes from Him. He treats His servants with gentleness and benevolence, providing for them, guiding them, and forgiving them. His goodness extends to all creation, believer and non-believer alike, though believers receive special care and attention. He is good to those who are good and even to those who are not, demonstrating that His kindness flows from His nature rather than the merit of recipients. Recognizing Al-Barr as the source of all goodness should make us grateful, humble, and motivated to reflect His goodness in our character and treatment of others.",
  },
  {
    "arabic": "ٱلتَّوَّابُ",
    "name": "At-Tawwab",
    "meaning": "The Acceptor of Repentance",
    "summary":
        "He who repeatedly accepts repentance and continuously turns His servants back to Him. At-Tawwab not only accepts repentance but also enables it, inspiring His servants to turn back to Him after they have strayed. His acceptance of repentance is constant and unlimited—He accepts repentance from the same sin multiple times, from great sins and small sins alike. He loves those who repent and draws them close to Him, often granting them a station even higher than they had before sinning. The door of repentance remains open until the soul reaches the throat at death or until the sun rises from the west. This name is one of the greatest sources of hope, assuring us that no matter how far we have strayed or how many times we have fallen, At-Tawwab is always ready to accept our sincere return.",
  },
  {
    "arabic": "ٱلْمُنْتَقِمُ",
    "name": "Al-Muntaqim",
    "meaning": "The Avenger",
    "summary":
        "He who takes retribution from those who persist in wrongdoing and oppression. Al-Muntaqim exacts justice from criminals and tyrants, ensuring that wrong is not left unpunished forever. His vengeance is not hasty or excessive but perfectly measured, coming only after repeated warnings, opportunities for repentance, and clear evidence of willful persistence in evil. He avenges the oppressed and holds oppressors accountable, though His punishment may be delayed to allow for repentance or to serve greater wisdom. This name serves as a warning to wrongdoers and a comfort to the oppressed, assuring that ultimate justice will be served. His vengeance is always just, never motivated by emotion but by the requirements of perfect justice and the protection of His divine order.",
  },
  {
    "arabic": "ٱلْعَفُوُّ",
    "name": "Al-'Afuww",
    "meaning": "The Pardoner",
    "summary":
        "He who pardons and erases sins completely, as if they never occurred. Al-'Afuww goes beyond forgiveness (Al-Ghafoor) to completely erase the effects and consequences of sins, wiping the slate clean. When He pardons, it is as though the sin never happened—no record remains, no consequence follows, and no trace is left. His pardon is vast and generous, and He loves to pardon His servants. The Night of Power (Laylat al-Qadr) is especially associated with this name, as believers are encouraged to ask: 'O Allah, You are Al-'Afuww, You love to pardon, so pardon me.' This complete erasure of sins demonstrates a mercy beyond human comprehension, offering believers a fresh start and renewed hope regardless of their past.",
  },
  {
    "arabic": "ٱلرَّءُوفُ",
    "name": "Ar-Ra'uf",
    "meaning": "The Most Kind",
    "summary":
        "He who is extremely compassionate and gentle with His servants. Ar-Ra'uf possesses a tender, caring kindness that seeks to prevent harm and hardship from touching His creation. His gentleness is evident in how He eases difficulties, provides for needs, and guides His servants gradually rather than overwhelming them with obligations all at once. He is kind even when disciplining, ensuring that trials serve a beneficial purpose without being unnecessarily harsh. His kindness extends to warning people before punishing them, giving countless opportunities for repentance, and making His religion easy to practice. This profound kindness should inspire deep love and gratitude, as we recognize that every aspect of our lives is touched by the tender care of Ar-Ra'uf.",
  },
  {
    "arabic": "مَالِكُ ٱلْمُلْكِ",
    "name": "Malik-ul-Mulk",
    "meaning": "Master of the Kingdom",
    "summary":
        "He who owns and controls all dominion, sovereignty, and power. Malik-ul-Mulk possesses absolute ownership of everything that exists—every kingdom, every authority, every resource, and every being. He grants power to whom He wills and removes it from whom He wills, raises nations and brings them down, all according to His perfect wisdom. Unlike earthly rulers whose power is temporary and limited, His dominion is eternal, absolute, and unshakeable. Every king, president, and leader holds their position only by His permission and for a period He has determined. Recognizing Him as the Master of all Kingdom puts worldly power in perspective and reminds us that ultimate authority belongs to Him alone, making Him the only one truly worthy of our complete submission and obedience.",
  },
  {
    "arabic": "ذُو ٱلْجَلَالِ وَٱلْإِكْرَامِ",
    "name": "Dhul-Jalali wal-Ikram",
    "meaning": "Owner of Majesty and Honor",
    "summary":
        "He who possesses perfect majesty and boundless generosity simultaneously. This name combines His awe-inspiring greatness (Jalal) with His gracious generosity (Ikram), demonstrating that He is both majestic and kind. His majesty inspires reverence and humility, while His generosity inspires love and hope. He is too great to be fully comprehended, yet generous enough to care for the smallest needs of His humblest servants. This combination makes Him uniquely worthy of worship—powerful enough to help us and kind enough to want to. The Prophet (peace be upon him) specifically recommended repeating this name in remembrance, as it encompasses His perfection beautifully. Those who reflect on this name find the balance between fear of His majesty and hope in His generosity.",
  },
  {
    "arabic": "ٱلْمُقْسِطُ",
    "name": "Al-Muqsit",
    "meaning": "The Equitable",
    "summary":
        "He who is perfectly just and establishes justice among His creation. Al-Muqsit judges with absolute fairness, giving each person exactly what they deserve without any favoritism, bias, or error. He ensures justice prevails in all matters, balancing rights and obligations with perfect equity. His justice is not merely punitive but also distributive—allocating resources, opportunities, and blessings according to His perfect wisdom. He establishes justice through His laws and through the natural order of cause and effect He has embedded in creation. On the Day of Judgment, His justice will be fully manifest when every soul receives its precise due. This name assures the oppressed that justice will ultimately be served and warns the oppressor that no injustice escapes divine accountability, encouraging believers to pursue justice in all their affairs.",
  },
  {
    "arabic": "ٱلْجَامِعُ",
    "name": "Al-Jami",
    "meaning": "The Gatherer",
    "summary":
        "He who gathers and brings together all things according to His will. Al-Jami will gather all of humanity on the Day of Judgment for the final reckoning, assembling every soul that has ever lived without exception. He brings together scattered things, unites hearts, and combines different elements to create harmony. He gathers the righteous into paradise and unites believers in brotherhood. In this world, He may gather people in certain places or times for purposes known to Him. He also gathers all perfections within Himself, as no attribute of excellence exists except that it is found in Him in its most complete form. Understanding this name reminds us that our current separation from loved ones or from ultimate truth is temporary, and that all will eventually be gathered before Him.",
  },
  {
    "arabic": "ٱلْغَنِيُّ",
    "name": "Al-Ghaniyy",
    "meaning": "The Self-Sufficient",
    "summary":
        "He who is completely free from all need and perfectly independent. Al-Ghaniyy requires nothing from anyone or anything—He needs no food, sleep, shelter, help, or worship. His existence, knowledge, and power are self-sustaining, depending on nothing outside Himself. While all creation is utterly dependent on Him for every moment of existence, He would not be diminished in the slightest if all creation ceased to exist. Our worship does not benefit Him, and our disobedience does not harm Him; rather, these actions affect only ourselves. His self-sufficiency is absolute and eternal, making Him the only being truly free from need. Recognizing Al-Ghaniyy humbles us by highlighting our complete dependence and His absolute independence, yet also demonstrates His generosity, as He gives to needy creatures without benefiting from them.",
  },
  {
    "arabic": "ٱلْمُغْنِي",
    "name": "Al-Mughni",
    "meaning": "The Enricher",
    "summary":
        "He who grants wealth and sufficiency to whomever He wills. Al-Mughni enriches people in multiple ways—providing material wealth, granting contentment that makes one feel sufficient despite having little, or bestowing spiritual richness that transcends worldly measures. True enrichment comes from Him alone, and He can make someone feel wealthy with little or poor despite great possessions. He enriches through both giving and through creating contentment in the heart. The greatest enrichment He provides is self-sufficiency through Him—when one's heart is rich with faith and reliance on Him, worldly poverty becomes bearable and even preferable to wealth that distracts from Him. Turning to Al-Mughni with sincere need opens doors to enrichment in ways we might never have imagined, as His treasures are infinite and His generosity knows no bounds.",
  },
  {
    "arabic": "ٱلْمَانِعُ",
    "name": "Al-Mani",
    "meaning": "The Preventer",
    "summary":
        "He who withholds and prevents according to His wisdom and protection. Al-Mani prevents harm from reaching His servants, blocking dangers they may not even be aware of. He may prevent someone from obtaining something they desire, not out of cruelty but because obtaining it would harm them or because He has something better in store. He prevents the enemies of truth from achieving their harmful goals and protects believers from falling into temptation or error. Sometimes what appears as deprivation is actually divine protection in disguise. Together with Al-Mughni (The Enricher), this name teaches that both giving and withholding come from the same wise and caring source. Trusting in Al-Mani means accepting that what is prevented from us is prevented for our benefit, even when we cannot immediately see the wisdom behind it.",
  },
  {
    "arabic": "ٱلضَّارُّ",
    "name": "Ad-Dharr",
    "meaning": "The Distresser",
    "summary":
        "He who can cause difficulty and harm by His will and permission. Ad-Dharr has the power to afflict with hardship, illness, or distress, though He only does so with perfect wisdom and justice. No harm can befall anyone without His permission, and every difficulty serves a purpose—whether as a test, purification, punishment, or redirection. Understanding that all harm ultimately comes from Him (rather than from people, circumstances, or bad luck) brings peace, as it means every difficulty is measured, meaningful, and from a source that also possesses infinite mercy and wisdom. This name is always mentioned alongside An-Nafi (The Benefiter), reminding us that both benefit and harm come from the same divine source, and that He who can harm can also heal, and often uses temporary harm to bring about greater and lasting benefit.",
  },
  {
    "arabic": "ٱلنَّافِعُ",
    "name": "An-Nafi",
    "meaning": "The Benefiter",
    "summary":
        "He who benefits and brings advantage to His creation. An-Nafi provides all that is beneficial and useful, granting advantages both worldly and spiritual. Every benefit we receive—health, knowledge, opportunities, relationships, or faith—comes ultimately from Him. He benefits people through His blessings, His guidance, and even through the trials He sends, which ultimately strengthen and purify. True and lasting benefit can only come from Him, while what seems beneficial from other sources is actually flowing from His will and permission. He benefits the believers especially, granting them advantages in this world and eternal benefit in the hereafter. Recognizing Him as the source of all benefit directs our gratitude to the right place and helps us seek benefit only through means that please Him, as He alone can make things truly beneficial.",
  },
  {
    "arabic": "ٱلنُّورُ",
    "name": "An-Nur",
    "meaning": "The Light",
    "summary":
        "He who is the light of the heavens and the earth, illuminating all existence. An-Nur is light in the most complete sense—He illuminates hearts with faith and guidance, minds with knowledge and understanding, and the universe with physical light. Through His light, hidden things become visible, truth becomes distinct from falsehood, and the path forward becomes clear. He is light Himself, and from Him emanates all light in creation, both physical and metaphorical. Hearts darkened by ignorance or sin are illuminated when they turn to Him, finding clarity where there was confusion and hope where there was despair. His light never dims or fades, and those who walk in His light never stumble in darkness. Seeking An-Nur means seeking guidance, knowledge, and enlightenment from the ultimate source of all illumination.",
  },
  {
    "arabic": "ٱلْهَادِي",
    "name": "Al-Hadi",
    "meaning": "The Guide",
    "summary":
        "He who guides to the truth and to the straight path. Al-Hadi shows the way to those who seek guidance, illuminating the path of righteousness and making it accessible to sincere seekers. He guides through revelation, through inspiration in the heart, through signs in creation, and through the examples of righteous people. His guidance is both general—providing the means and signs for all to find the truth—and specific, writing faith in the hearts of those who genuinely seek Him. Without His guidance, no one can find the right path, and with His guidance, the path becomes clear even to the simple. He guides whom He wills based on His perfect knowledge of who truly seeks Him. Calling upon Al-Hadi with sincerity brings divine guidance that transforms confusion into clarity and darkness into light.",
  },
  {
    "arabic": "ٱلْبَدِيعُ",
    "name": "Al-Badi",
    "meaning": "The Incomparable Originator",
    "summary":
        "He who creates in the most unique and marvelous ways without precedent or example. Al-Badi originates creation with unprecedented design and beauty, inventing novel forms and systems that never existed before. His creativity is infinite, as evidenced by the incredible diversity and uniqueness found throughout creation—no two fingerprints, no two snowflakes, no two souls exactly alike. He creates without needing a model or blueprint to follow, as He is the originator of all models and designs. His innovation is perfect, combining beauty, function, and wisdom in ways that inspire wonder. Every aspect of creation bears witness to His incomparable creativity, from the vast cosmos to the microscopic world. Contemplating Al-Badi fills us with awe at His creative power and reminds us that He who created such wonders can certainly handle our problems and create solutions we never imagined.",
  },
  {
    "arabic": "ٱلْبَاقِي",
    "name": "Al-Baqi",
    "meaning": "The Everlasting",
    "summary":
        "He who remains forever, never perishing or ceasing to exist. Al-Baqi is eternally permanent while everything else is temporary and passing away. After all creation has perished and time itself has ended, He will remain exactly as He has always been, unchanged and unaffected. His existence has no end, just as it had no beginning, and His perfection is eternal. While we and everything around us is transient—our lives, possessions, achievements, and even the universe itself will all pass away—He alone remains forever. This name comforts us by reminding us that there is something permanent to hold onto in this impermanent world, and that our investment in pleasing Al-Baqi brings eternal returns, while investment in temporary things yields only temporary results. Clinging to Him means clinging to the only thing that will never leave or perish.",
  },
  {
    "arabic": "ٱلْوَارِثُ",
    "name": "Al-Warith",
    "meaning": "The Inheritor",
    "summary":
        "He who remains after all creation perishes and inherits everything. Al-Warith will outlast all of creation, and when everything and everyone has passed away, all that existed will return to Him alone. He is the ultimate inheritor who inherits the earth and everything on it, not because He needs it but because everything came from Him and returns to Him. In reality, everything already belongs to Him, and our temporary possession of things is merely a trust or test. Understanding this name changes our relationship with possessions—we are not true owners but merely temporary trustees, and everything we have will eventually return to its true owner. This recognition should make us generous with what we temporarily possess, knowing that we will ultimately inherit nothing except our deeds, while Al-Warith will inherit all.",
  },
  {
    "arabic": "ٱلرَّشِيدُ",
    "name": "Ar-Rasheed",
    "summary":
        "He who is righteous in His actions and guides to righteousness. Ar-Rasheed is perfectly wise and mature in all His affairs, directing everything toward the right outcome. He guides His servants to what is right and beneficial, showing them the path of wisdom and righteousness. His guidance is always correct, His decisions always wise, and His way always leads to the best outcomes. He combines perfect knowledge with perfect action, knowing what is right and always doing it. He guides through gentle means, gradually leading His servants from where they are to where they need to be. Those who follow His guidance walk the path of righteousness that leads to success in this life and the next. Seeking Ar-Rasheed's guidance means asking for direction that is not only correct but also leads to spiritual maturity and sound judgment in all affairs.",
  },
  {
    "arabic": "ٱلصَّبُورُ",
    "name": "As-Sabur",
    "meaning": "The Most Patient",
    "summary":
        "He who is perfectly patient, never hastening to punish despite having the power to do so. As-Sabur delays punishment to give people time to repent and reform, demonstrating infinite patience with His disobedient servants. Despite witnessing countless sins and acts of ingratitude, He continues to provide, sustain, and give opportunities for change. His patience is not due to inability or unawareness but is a manifestation of His mercy and wisdom. He is patient with those who deny Him, patient with those who disobey Him, and patient with those who associate partners with Him, all while maintaining perfect justice that will eventually be served. This name should inspire us to be patient with difficulties, knowing they come from As-Sabur who has a wise purpose, and to be patient with others as He is patient with us, giving people time and space to grow and change.",
  },
];
