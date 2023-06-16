// Module electrodes flexibles
// Mesures en millimètres

// Dimensions
diamBoule = 11; // Diamètre de la boule de stainless et/ou du terminal (prendre le plus gros des deux pour que ça rentre bien)
profondeurTrou = 8; // Profondeur du trou où la boule et le terminal sont insérés

largeurTrouVelcro = 25.4; // Largeur de la fente dans laquelle le velcro passe
hauteurTrouVelcro = 2; // Hauteur de la fente dans laquelle le velcro passe

diamModule = largeurTrouVelcro+8; // Diamètre global du module
epaisseurModule = diamBoule*1.5; // Épaisseur du module (excluant la partie de la boule qui sort)

// Nombres de "faces" sur les cercles (+ élevé = + long à faire le rendu)
$fn = 100;


// ********
// Logique de modelisation
// Cylindre du module global - cylindre diamBoule - cylindre sortie terminal - prisme fente velcro - petit plat pour faciliter l'impression

rotate([-90,0,0])
difference(){
// Module principal
cylinder(d=diamModule, h=epaisseurModule);

// Trou boule
cylinder(d=diamBoule, h=profondeurTrou);
    
// Trou pour passer le terminal et le fil
translate([0,0,profondeurTrou]) rotate([90, 0, 0]) cylinder(r=3, h=100);
    
// Fente pour velcro
translate([0,0,epaisseurModule-hauteurTrouVelcro]) cube([1000, largeurTrouVelcro, hauteurTrouVelcro], center=true);
    
// Face plate pour faciliter l'impression
translate([0, 50+diamModule/2-1, 0]) cube([100, 100, 100], center=true);

}