unit class LinearAlgebra::Vector;
also does Positional;

has Real @.components handles <elems>;

#
# Operators
#

multi infix:<·>(LinearAlgebra::Vector:D \u, LinearAlgebra::Vector:D \v) is export {
    unless u.elems == v.elems {
        die "Vectors must've the same length."
    }

    [+] u.components »*« v.components
}

multi infix:<×>(LinearAlgebra::Vector:D \u, LinearAlgebra::Vector:D \v) is export {
    if 3 == (u, v)».elems.all {
        return LinearAlgebra::Vector.new: components => (
            u[2] * v[3] - u[3] * v[2], # i
            u[3] * v[1] - u[1] * v[3], # j
            u[1] * v[2] - u[2] * v[1], # k
        )
    }
    elsif 7 == (u, v)».elems.all {
        return LinearAlgebra::Vector.new( components => 0 xx 7);
    }
    else {
        die "Vector's size not supported"
    }
}

multi circumfix:<⎡ ⎤>(LinearAlgebra::Vector:D \u) is export {
    u.components.map(* ** 2).sum.sqrt
}

multi infix:<∠>(LinearAlgebra::Vector:D \u, LinearAlgebra::Vector:D \v) is export {
    acos((u · v) / (⎡v⎤ * ⎡u⎤))
}

multi infix:<+>(LinearAlgebra::Vector:D \u, LinearAlgebra::Vector:D \v) is export {
    unless u.elems == u.elems {
        die "Vectors must've the same length"
    }

    LinearAlgebra::Vector.new: components => u.components »+« v.components
}

multi infix:<->(LinearAlgebra::Vector:D \u, LinearAlgebra::Vector:D \v) is export {
    unless u.elems == u.elems {
        die "Vectors must've the same length"
    }

    LinearAlgebra::Vector.new: components => u.components »-« v.components
}

#
# Methods
#

method dot-product(::?CLASS:D \u : LinearAlgebra::Vector:D \v) {
    u · v 
}

method cross-product(::?CLASS:D \u : LinearAlgebra::Vector:D \v) {
    u × v 
}

method angle(::?CLASS:D \u : LinearAlgebra::Vector:D \v) {
    u ∠ v
}

method length(::?CLASS:D \u:) {
    ⎡u⎤
}

method is-perpendicular(::?CLASS:D \u : LinearAlgebra::Vector:D \v --> Bool:D) {
    (u · v) == 0
}

method is-parallel(::?CLASS:D \u : LinearAlgebra::Vector:D \v --> Bool:D) {
    ⎡(u × v)⎤ == 0
}

method normalize {
    my @normed-comps = @!components.map(* / self.length);
    self.new: components => @normed-comps;
}

#
# Access
#

method AT-POS(UInt $i) {
    unless 1 ≤ $i ≤ @!components {
        die X::OutOfRange.new:
            what  => 'vector index',
            got   => $i,
            range => "1..{@!components.elems}",
        ;
    }
    @!components[$i-1];
}

#
# String representation
#

method gist {
    @!components.elems > 10
    ?? '(' ~ @!components.head(10).join(', ') ~ ', ...)'
    !! '(' ~ @!components.join(', ') ~ ')'
}

method Str {
    @!components.join(' ')
}
