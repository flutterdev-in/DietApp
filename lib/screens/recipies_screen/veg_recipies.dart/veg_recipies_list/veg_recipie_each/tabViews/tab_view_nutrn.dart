import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/custom_row_for_nutri.dart';
import 'package:flutter/material.dart';

class TabViewNutrn extends StatelessWidget {
  const TabViewNutrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ExpansionTile(
            title: CustomRowforNutri.forE(
              nID: "Net Energy",
              unit: "kCal",
            ),
            children: [
              CustomRowforNutri.forSE(
                nID: "Gross Energy",
                unit: "kCal",
              ),
            ]),
        ExpansionTile(
          title: CustomRowforNutri.forE(nID: "Net Carbs"),
          children: [
            CustomRowforNutri.forSE(
              nID: "Total Carbs",
            ),
            CustomRowforNutri.forSE(
              nID: "Starch",
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: CustomRowforNutri.forNE(
                nID: "Free Sugars",
                startSize: 22,
                endSize: 10,
                textSizefact: 1,
              ),
              children: [
                CustomRowforNutri.forSE(
                  nID: "Fructose",
                  startSize: 60,
                  endSize: 80,
                ),
                CustomRowforNutri.forSE(
                  nID: "Glocose",
                  startSize: 60,
                  endSize: 80,
                ),
                CustomRowforNutri.forSE(
                  nID: "Sucrose",
                  startSize: 60,
                  endSize: 80,
                ),
                //CustomRowforNutri.forSE(nID: "Maltose"),
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: CustomRowforNutri.forE(nID: "Protine"),
          initiallyExpanded: false,
          children: [
            ExpansionTile(
              title: CustomRowforNutri.forSE(
                nID: "Essential Amino Acids",
                startSize: 25,
                endSize: 10,
                textSizefact: 1.1,
                precision: 2,
              ),
              children: [
                CustomRowforNutri.forSE(
                  nID: "Histidine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Isoleucine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Luecine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Lysine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Methionine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Phenylalanine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Threonine",
                  startSize: 55,
                ),
                CustomRowforNutri.forSE(
                  nID: "Tryptophan",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Valine",
                  startSize: 55,
                  precision: 2,
                ),
              ],
            ),
            ExpansionTile(
              title: CustomRowforNutri.forSE(
                nID: "Conditionally Essential Amino Acids",
                startSize: 25,
                endSize: 10,
                textSizefact: 1.1,
                precision: 2,
              ),
              children: [
                CustomRowforNutri.forSE(
                  nID: "Cystine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Arginine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Glycine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Proline",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Serine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Tyrosine",
                  startSize: 55,
                  precision: 2,
                ),
              ],
            ),
            ExpansionTile(
              title: CustomRowforNutri.forSE(
                nID: "Non Essential Amono Acids",
                startSize: 25,
                endSize: 10,
                textSizefact: 1.1,
                precision: 2,
              ),
              children: [
                CustomRowforNutri.forSE(
                  nID: "Alanine",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Aspartic Acid",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Glutamic Acid",
                  startSize: 55,
                  precision: 2,
                ),
                CustomRowforNutri.forSE(
                  nID: "Misc NE",
                  startSize: 55,
                  precision: 2,
                ),
              ],
            ),
          ],
        ),
        ExpansionTile(
            title: CustomRowforNutri.forE(
              nID: "Total Fibre",
            ),
            children: [
              CustomRowforNutri.forSE(
                nID: "Insoluble Fibre",
              ),
              CustomRowforNutri.forSE(
                nID: "Soluble Fibre",
              ),
            ]),
        ExpansionTile(
          title: CustomRowforNutri.forE(nID: "Total Fat"),
          children: [
            ExpansionTile(
              title: CustomRowforNutri.forNE(
                nID: "Saturated Fat",
                unit: "mg",
                startSize: 22,
                endSize: 10,
                textSizefact: 1,
              ),
              children: [
                CustomRowforNutri.forSE(
                  nID: "Butyric",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Caproic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Caprylic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Capric",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Lauric",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Myristic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Palmitic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Stearic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Arachidic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Behenic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Lignoceric",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                CustomRowforNutri.forSE(
                  nID: "Undecanoic",
                  unit: "mg",
                  startSize: 60,
                  endSize: 77,
                ),
                //CustomRowforNutri.forSE(nID: "Maltose"),
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: CustomRowforNutri.forNE(
                nID: "Mono Unsaturated Fat",
                unit: "mg",
                startSize: 22,
                endSize: 10,
                textSizefact: 1,
              ),
              children: [
                ExpansionTile(
                  initiallyExpanded: false,
                  title: CustomRowforNutri.forE(
                    nID: "Omega 9",
                    unit: "",
                    startSize: 40,
                    endSize: 19,
                  ),
                  children: [
                    CustomRowforNutri.forSE(
                      nID: "Elcosenoic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Oleic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Elaidic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Erucic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Nervonic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                  ],
                ),
                ExpansionTile(
                  title: CustomRowforNutri.forE(
                    nID: "Remaining",
                    unit: "",
                    startSize: 40,
                    endSize: 19,
                  ),
                  children: [
                    CustomRowforNutri.forSE(
                      nID: "Myristoleic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Palmitoleic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: CustomRowforNutri.forNE(
                nID: "Poly Unsaturated Fat",
                unit: "mg",
                startSize: 22,
                endSize: 10,
                textSizefact: 1,
              ),
              children: [
                ExpansionTile(
                  title: CustomRowforNutri.forE(
                    nID: "Omega 3",
                    unit: "mg",
                    startSize: 40,
                    endSize: 19,
                  ),
                  children: [
                    CustomRowforNutri.forSE(
                      nID: "α-Linolenic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Eicosadienoic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Docosa-hexaenoic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: CustomRowforNutri.forE(
                    nID: "Omega 6+",
                    unit: "",
                    startSize: 40,
                    endSize: 19,
                  ),
                  children: [
                    CustomRowforNutri.forSE(
                      nID: "Omega 6",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Elcosatrienoic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                    CustomRowforNutri.forSE(
                      nID: "Arachidonic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                  ],
                ),
                ExpansionTile(
                  title: CustomRowforNutri.forE(
                    nID: "Remaining",
                    unit: "",
                    startSize: 40,
                    endSize: 19,
                  ),
                  children: [
                    CustomRowforNutri.forSE(
                      nID: "Eicosa-pentaenoic",
                      unit: "mg",
                      startSize: 80,
                      endSize: 86,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        ExpansionTile(
          title: CustomRowforNutri.forE(
            nID: "Water Soluble Vitamins",
            unit: "µg",
          ),
          children: [
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Vitamin B",
                  unit: "µg",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B1",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B2",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B3",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B5",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B6",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B7",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B9",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin B12",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                ]),
            CustomRowforNutri.forSE(
              nID: "Vitamin C",
              unit: "µg",
              startSize: 41,
              endSize: 65,
              textSizefact: 1.15,
              precision: 2,
            ),
          ],
        ),
        ExpansionTile(
          title: CustomRowforNutri.forE(
            nID: "Fat Soluble Vitamins",
            unit: "µg",
          ),
          children: [
            CustomRowforNutri.forSE(
              nID: "Vitamin A",
              unit: "µg",
            ),
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Vitamin A*",
                  unit: "µg",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Lutein",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Zeaxanthin",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Lycopene",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Lutein",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "β-Cryptoxanthin",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "γ-Carotene",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "α-Carotene",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "β-Carotene",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                ]),
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Vitamin D",
                  unit: "µg",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Vitamin D2",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin D3",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin D3 (25OH)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                ]),
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Vitamin E",
                  unit: "µg",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T Alpha)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T Beta)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T Gamma)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T Delta)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T3 Alpha)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T3 Beta)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T3 Gamma)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin E (T3 Delta)",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                ]),
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Vitamin K",
                  unit: "µg",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Vitamin K1",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Vitamin K2",
                    startSize: 55,
                    precision: 2,
                    unit: "µg",
                  ),
                ]),
          ],
        ),
        ExpansionTile(
            title: CustomRowforNutri.forE(
              nID: "Total Minerals",
              unit: "mg",
            ),
            children: [
              CustomRowforNutri.forSE(
                nID: "Calcium (Ca)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Iron (Fe)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Sodium (Na)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "",
                unit: "",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Aluminium (Al)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Arsenic (As)",
                unit: "µg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Cadmium (Cd)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Chromium (Cr)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Cobalt (Co)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Copper (Cu)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Lead (Pb)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Lithium (Li)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Magnesium (Mg)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Manganese (Mn)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Mercury (Hg)",
                unit: "µg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Molebdeum (Mo)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Nickle (Ni)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Phosphorus (P)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Potassium (K)",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Selenium (Se)",
                unit: "µg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Zinc (Zn)",
                unit: "mg",
                precision: 2,
              ),
            ]),
        ExpansionTile(
            title: CustomRowforNutri.forE(
              nID: "Antioxidants",
              unit: "mg",
            ),
            children: [
              CustomRowforNutri.forSE(
                nID: "3,4- Dehydroxy benzoic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "3-Hydroxy benzaldehyde",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Protocatechuic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Vanillic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Gallic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Cinnamic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "O-Coumaric acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "P-Coumaric acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Caffeic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Chlorogenic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Ferulic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Apigenin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Apigenin-6-C-gluoside",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Apigenin-7-O-neohesperidoside",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Luteolin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Kamemferol",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Quercetin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Quercetin-3-β-D-glucoside",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Quercetin-3-O-rutinoside",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Quercetin-3-β‐galactoside",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Isorhamnetin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Myricetin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Resveratrol",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Hesperetin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Naringenin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Hesperdin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Daidzein",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Genistein",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Epicatechin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Epigallo catechin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Epigallo catechin 3-gallate",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Catechin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Gallocatechin gallate",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Gallo catechin",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Syringic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Sinapinic acid",
                unit: "mg",
                precision: 3,
              ),
              CustomRowforNutri.forSE(
                nID: "Ellagic acid",
                unit: "mg",
                precision: 3,
              ),
            ]),
        ExpansionTile(
            title: CustomRowforNutri.forE(
              nID: "Organic Acids",
              unit: "mg",
            ),
            children: [
              CustomRowforNutri.forSE(
                nID: "Total Oxalate",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Soluble Oxalate",
                unit: "mg",
                precision: 2,
                startSize: 60,
                endSize: 77,
              ),
              CustomRowforNutri.forSE(
                nID: "Insoluble Oxalate",
                unit: "mg",
                precision: 2,
                startSize: 60,
                endSize: 77,
              ),
              CustomRowforNutri.forSE(
                nID: "Cis-Aconitic Acid",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Citric Acid",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Fumaric Acid",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Mallic Acid",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Quinic Acid",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Succinic Acid",
                unit: "mg",
                precision: 2,
              ),
              CustomRowforNutri.forSE(
                nID: "Tartaric Acid",
                unit: "mg",
                precision: 2,
              ),
            ]),
        ExpansionTile(
          title: CustomRowforNutri.forE(
            nID: "Oligosaccharides, Phytosterols, Saponins and Phytates",
            unit: "",
          ),
          children: [
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Oligosaccharides",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Raffinose",
                    startSize: 55,
                    precision: 2,
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Stachyose",
                    startSize: 55,
                    precision: 2,
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Verbascose",
                    startSize: 55,
                    precision: 2,
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Ajugose",
                    startSize: 55,
                    precision: 2,
                  ),
                ]),
            ExpansionTile(
                title: CustomRowforNutri.forSE(
                  nID: "Phytosterols",
                  startSize: 25,
                  endSize: 10,
                  textSizefact: 1.05,
                  precision: 2,
                  unit: "mg",
                ),
                children: [
                  CustomRowforNutri.forSE(
                    nID: "Campesterol",
                    startSize: 55,
                    precision: 2,
                    unit: "mg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "Stigmasterol",
                    startSize: 55,
                    precision: 2,
                    unit: "mg",
                  ),
                  CustomRowforNutri.forSE(
                    nID: "β-Sitosterol",
                    startSize: 55,
                    precision: 2,
                    unit: "mg",
                  ),
                ]),
            CustomRowforNutri.forSE(
              nID: "Phytate",
              startSize: 41,
              endSize: 65,
              textSizefact: 1.15,
              precision: 2,
              unit: "mg",
            ),
            CustomRowforNutri.forSE(
              nID: "Saponin",
              startSize: 41,
              endSize: 65,
              textSizefact: 1.15,
              precision: 2,
            ),
          ],
        ),
      ]),
    );
  }
}
