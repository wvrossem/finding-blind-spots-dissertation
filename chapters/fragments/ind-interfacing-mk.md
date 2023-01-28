#### Interfacing with other partners {-}

<!-- 
BVV: https://www.ensie.nl/dienst-terugkeer-en-vertrek/ensies/Begrippenlijst%20Dienst%20Terugkeer%20en%20Vertrek%20/1 Vreemdelingenketen: https://www.ensie.nl/dienst-terugkeer-en-vertrek/vreemdelingenketen
https://web.archive.org/web/20210116203510/http://verblijfblog.nl/de-vreemdelingenketen-en-de-zaak-dolmatov/
-->

<!-- Migratieketen -->

Another important aspect of the INDiGO system is its connections to other organizations through the ‘migratieketen’ (MK). Roughly speaking, the MK is a formal collaboration between various organizations and ministerial agencies in The Netherlands — called ‘ketenpartners’ (KP) — that play a role in the processes that foreign nationals go through: from entering the Netherlands to obtaining a residence permit or departure or expulsion. Important aspects of this collaboration are coordination of migration policy and information exchange.

<!-- Protocol identificatie labelling -->

An example of coordination mechanisms in migration policy and information exchange can be seen in the standardized way of identifying persons described in the document ‘Protocol identificatie labelling (PIL)’ [@ministerievanjustititieenveiligheidProtocolIdentificatieLabeling2020]. First and foremost, this document defines standardized methods for identifying and registering foreign nationals in the MK. Second, it describes data governance processes such as how this identity data may be modified or when data must be destroyed. Third, the document describes the various partners, their links in the information architecture and role in the MK. The interactions between the different systems and databases are important for establishing identities. For example, for various tasks users of the INDiGO system are required to search another external database called the ‘Basisvoorziening Vreemdelingen’ (BVV).

The BVV is, in this respect, the central component in the MK. The information system stores all basic data of people who have a relation with the Dutch government in the context of the aliens act (‘Vreemdelingenwet’). The system allows digital exchange of identity data, information about travel and identity documents, biometric characteristics and status data between the partners. Various ministries and organizations in The Netherlands use this BVV system to share and consult information about foreign nationals. As such, it acts as a kind of single source of truth. That is, although other partners may have their database and information about a person, the data needs to be kept aligned [@InformatievoorzieningVreemdelingenketen2015]. This can also be seen due to the fact that through the BVV all foreigners receive a unique identification number — the _v-number_. In practice then, processes of establishing identity involves an interplay of multiple systems. In fact, INDiGO users searching for person matches always need to consider result from the BVV as well. It is therefore important to consider the search and match functionalities of both systems — the interfaces, the behaviour of the match engines, and how users interpret results.

<!-- Partners MK -->

Through the BVV and other interfacing mechanisms the IND is further connected to partners in the MK. Figure \@ref(fig:migratieketen) (adapted from [@veiligheidSamenwerkingKetenMigratieketen2018]) shows these various partners, and inner and outer ‘layers’ can be distinguished. The inner layer consists of the ministerial agencies and the outer layer consists of other governmental, non-governmental and international organizations.

<!-- Findings -->

Interactions between the IND and other organizations from the MK were also highlighted by respondents during the user interviews. The mentioned partners include, for example, the department of the Dutch police, Afdeling Vreemdelingenpolitie, Identificatie en Mensenhandel (AVIM), which can conduct searches on the identity and residence status of people to oversee compliance with the Vreemdelingenwet. Another mentioned partner is the Royal Netherlands Marechaussee (KMar) which is involved with border control of the external border of the Schengen area.[^frontex] In the context of visas, Buitenlandse Zaken (BZ) is pivotal. For the IND in particular, the exchange of information with municipalities is done to keep, for example, residency data up-to-date. When searching for a person INDiGO users will, in principle, first consult the BVV system though a screen in INDiGO. A match may then indicate that the person has already been registered by one of these other partners. This short description of the systems show the important role it plays in making possible this distributed collaborative work of applying the policies regarding foreign nationals.

There are many similarities in the categories of data. However, there are differences in the way the search works — which complicate the use of the tools.

<!-- gemeente -->

[^frontex]: In The Netherlands this means border control at airports, seaports and along the coast. Furthermore, through the KMAR participates in the European agency for border surveillance, the European Border and Coast Guard Agency (also known as Frontex) with knowledge, expertise, equipment, and personnel. Personnel from the Marechaussee are therefore also involved in border surveillance at the external borders of the Schengen area in other Member States. Both of these may create records in the BVV or consult them in identity investigations.

However, there are differences in the way the IND and BVV searches work — which complicate the use of the tools. An often mentioned suggestion from the interviewees was therefore to integrate these searches somehow. This would make sense since, as mentioned previously, the interactions between the BVV and IND systems are important to establish the identity of a person.
