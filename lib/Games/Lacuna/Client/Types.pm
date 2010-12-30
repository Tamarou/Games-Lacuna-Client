###################################################
#
# This is a generated file DO NOT EDIT
# generated by data/build_types.pl using data/Types.tt2
#
###################################################
#
# Any structural changes should be made to data/Types.tt2
#
# Any informational changes should be made to one of:
#
#     data/types.yml
#     data/building.yml
#
# All changes should be followed by running data/build_types.pl
#
###################################################

package Games::Lacuna::Client::Types;

use strict;
use warnings;
use List::MoreUtils qw(any);

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw( food_types ore_types get_tags tag_list meta_building_list meta_type meta_type_list );
our %EXPORT_TAGS = (
    list => [qw( food_types ore_types )],
    tag  => [qw( get_tags tag_list )],
    meta => [qw( meta_building_list meta_type meta_type_list )],
    all  => [@EXPORT],
);

{
    my @food = qw( algae apple bean beetle bread burger cheese chip cider corn fungus lapis meal milk pancake pie potato root shake soup syrup wheat );
    sub food_types {
        return @food;
    }
}

{
    my @ore = qw( anthracite bauxite beryl chalcopyrite chromite fluorite galena goethite gold gypsum halite kerogen magnetite methane monazite rutile sulfur trona uraninite zircon );
    sub ore_types {
        return @ore;
    }
}

{
    my %meta_types = (
        command => [qw(
            Archaeology
            Capitol
            CloakingLab
            Development
            Embassy
            Espionage
            GasGiantLab
            GasGiantPlatform
            GeneticsLab
            Intelligence
            MissionCommand
            MunitionsLab
            Network19
            Observatory
            Oversight
            Park
            PilotTraining
            PlanetaryCommand
            Propulsion
            SAW
            Security
            Shipyard
            SpacePort
            Stockpile
            TerraformingLab
            TerraformingPlatform
            Trade
            Transporter
            University
        )],
        energy => [qw(
            Fission
            Fusion
            Geo
            HydroCarbon
            Singularity
            WasteEnergy
        )],
        food => [qw(
            Algae
            Apple
            Bean
            Beeldeban
            Bread
            Burger
            Cheese
            Chip
            Cider
            Corn
            CornMeal
            Dairy
            Denton
            Lapis
            Malcud
            Pancake
            Pie
            Potato
            Shake
            Soup
            Syrup
            Wheat
        )],
        glyph => [qw(
            CrashedShipSite
            Crater
            EssentiaVein
            GeoThermalVent
            Grove
            InterDimensionalRift
            KalavianRuins
            Lagoon
            Lake
            LibraryOfJith
            MassadsHenge
            NaturalSpring
            OracleOfAnid
            Ravine
            RockyOutcrop
            Sand
            TempleOfTheDrajilites
            Volcano
        )],
        happiness => [qw(
            Entertainment
            GreatBallOfJunk
            JunkHengeSculpture
            LuxuryHousing
            MetalJunkArches
            PyramidJunkSculpture
            SpaceJunkPark
        )],
        ore => [qw(
            Mine
            MiningMinistry
            OreRefinery
            WasteDigester
        )],
        storage => [qw(
            EnergyReserve
            FoodReserve
            OreStorage
            WasteSequestration
            WaterStorage
        )],
        waste => [qw(
            WasteRecycling
            WasteTreatment
        )],
        water => [qw(
            AtmosphericEvaporator
            WaterProduction
            WaterPurification
            WaterReclamation
        )],
    );

    sub meta_type {
        my( $building ) = @_;
        return unless $building;
        for my $k ( keys %meta_types ){
            if( any {$_ eq $building} @{$meta_types{$k}} ){
                return $k;
            }
        }
        return;
    }
    sub meta_type_list{
        return keys %meta_types if wantarray;
        return [keys %meta_types];
    }
    sub meta_building_list {
        my( $type ) = @_;
        return unless $type;
        my $buildings = $meta_types{$type};
        return @$buildings if wantarray;
        return [@$buildings];
    }
}
{
    my @tags = qw(alliance colony command decoration defense energy essentia food glyph happiness infrastructure intelligence ore sculpture ship storage trade waste water);
    sub tag_list {
        return @tags;
    }
}
{
    my %tags = (
        Algae => [qw(food)],
        Apple => [qw(food)],
        Archaeology => [qw(command glyph infrastructure)],
        AtmosphericEvaporator => [qw(water)],
        Bean => [qw(food)],
        Beeldeban => [qw(food)],
        Bread => [qw(food)],
        Burger => [qw(food)],
        Capitol => [qw(command infrastructure)],
        Cheese => [qw(food)],
        Chip => [qw(food)],
        Cider => [qw(food)],
        CloakingLab => [qw(command infrastructure ship)],
        Corn => [qw(food)],
        CornMeal => [qw(food)],
        CrashedShipSite => [qw(glyph ship)],
        Crater => [qw(decoration glyph)],
        Dairy => [qw(food)],
        Denton => [qw(food)],
        Development => [qw(command infrastructure)],
        Embassy => [qw(alliance command infrastructure)],
        EnergyReserve => [qw(energy storage)],
        Entertainment => [qw(happiness infrastructure)],
        Espionage => [qw(command infrastructure intelligence)],
        EssentiaVein => [qw(essentia glyph)],
        Fission => [qw(energy)],
        FoodReserve => [qw(food storage)],
        Fusion => [qw(energy)],
        GasGiantLab => [qw(command infrastructure ship)],
        GasGiantPlatform => [qw(command infrastructure ship)],
        GeneticsLab => [qw(command infrastructure)],
        Geo => [qw(energy)],
        GeoThermalVent => [qw(energy glyph)],
        GreatBallOfJunk => [qw(happiness infrastructure sculpture waste)],
        Grove => [qw(glyph)],
        HydroCarbon => [qw(energy)],
        Intelligence => [qw(command infrastructure intelligence)],
        InterDimensionalRift => [qw(glyph storage)],
        JunkHengeSculpture => [qw(happiness infrastructure sculpture waste)],
        KalavianRuins => [qw(glyph)],
        Lagoon => [qw(glyph)],
        Lake => [qw(decoration glyph)],
        Lapis => [qw(food)],
        LibraryOfJith => [qw(glyph infrastructure)],
        LuxuryHousing => [qw(happiness infrastructure)],
        Malcud => [qw(food)],
        MassadsHenge => [qw(glyph)],
        MetalJunkArches => [qw(happiness infrastructure sculpture waste)],
        Mine => [qw(ore)],
        MiningMinistry => [qw(ore ship)],
        MissionCommand => [qw(command infrastructure)],
        MunitionsLab => [qw(command infrastructure ship)],
        NaturalSpring => [qw(glyph water)],
        Network19 => [qw(command happiness infrastructure)],
        Observatory => [qw(command infrastructure)],
        OracleOfAnid => [qw(glyph infrastructure)],
        OreRefinery => [qw(ore)],
        OreStorage => [qw(ore storage)],
        Oversight => [qw(command infrastructure)],
        Pancake => [qw(food)],
        Park => [qw(command happiness infrastructure)],
        Pie => [qw(food)],
        PilotTraining => [qw(command infrastructure ship)],
        PlanetaryCommand => [qw(command infrastructure)],
        Potato => [qw(food)],
        Propulsion => [qw(command infrastructure ship)],
        PyramidJunkSculpture => [qw(happiness infrastructure sculpture waste)],
        Ravine => [qw(glyph storage waste)],
        RockyOutcrop => [qw(decoration glyph)],
        SAW => [qw(command defense infrastructure)],
        Sand => [qw(decoration glyph)],
        Security => [qw(command infrastructure)],
        Shake => [qw(food)],
        Shipyard => [qw(command infrastructure ship)],
        Singularity => [qw(energy)],
        Soup => [qw(food)],
        SpaceJunkPark => [qw(happiness infrastructure sculpture waste)],
        SpacePort => [qw(command ship)],
        Stockpile => [qw(command storage)],
        Syrup => [qw(food)],
        TempleOfTheDrajilites => [qw(glyph)],
        TerraformingLab => [qw(colony command infrastructure)],
        TerraformingPlatform => [qw(colony command infrastructure)],
        Trade => [qw(command infrastructure ship trade)],
        Transporter => [qw(command infrastructure trade)],
        University => [qw(command infrastructure)],
        Volcano => [qw(glyph ore)],
        WasteDigester => [qw(ore waste)],
        WasteEnergy => [qw(energy waste)],
        WasteRecycling => [qw(waste)],
        WasteSequestration => [qw(storage waste)],
        WasteTreatment => [qw(waste)],
        WaterProduction => [qw(water)],
        WaterPurification => [qw(water)],
        WaterReclamation => [qw(water)],
        WaterStorage => [qw(storage water)],
        Wheat => [qw(food)],
    );
    sub get_tags{
        my( $building ) = @_;
        return @{ $tags{$building} };
    }
}
1;

__END__

=head1 NAME

Games::Lacuna::Client::Types

=head1 SYNOPSIS

    use Games::Lacuna::Client::Types;

=head1 FUNCTIONS

=over 4

=item food_types

=item ore_types

=item get_tags

=item tag_list

=item meta_building_list

=item meta_type

=item meta_type_list

=back

=cut
