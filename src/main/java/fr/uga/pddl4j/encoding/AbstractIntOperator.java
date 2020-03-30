/*
 * Copyright (c) 2010 by Damien Pellier <Damien.Pellier@imag.fr>.
 *
 * This file is part of PDDL4J library.
 *
 * PDDL4J is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PDDL4J is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PDDL4J.  If not, see <http://www.gnu.org/licenses/>
 */

package fr.uga.pddl4j.encoding;

import fr.uga.pddl4j.parser.Connective;
import fr.uga.pddl4j.util.IntExp;

import java.util.Arrays;

/**
 * This abstract class implements the common part of an operator (action of method) with integer representation.
 *
 * @author D. Pellier
 * @version 1.0 - 07.06.2010
 */
public abstract class AbstractIntOperator extends AbstractGroundOperator {

    /**
     * The expression that represents the preconditions of the operator.
     */
    private IntExp preconditions;

    /*
    * Creates a new operator from an other.
    *
    * @param other the other operator.
    */
    protected AbstractIntOperator(final AbstractIntOperator other) {
        super(other);
        this.preconditions = other.getPreconditions();
    }

    /**
     * Creates a new operator with. The precondition is initialized with OR expression.
     *
     * @param name  the name of the operator.
     * @param arity the arity of the operator.
     */
    protected AbstractIntOperator(final String name, final int arity) {
        super(name, arity);
        this.preconditions = new IntExp(Connective.OR);
    }

    /**
     * Creates a new operator. The length of the parameters and the length of instantiations must be the same.
     *
     * @param name           the name of the operator.
     * @param parameters     the types of the parameters.
     * @param instantiations the values of the parameters.
     * @param preconditions  the preconditions of the operator.
     */
    protected AbstractIntOperator(final String name, final int[] parameters, final int[] instantiations,
                                  final IntExp preconditions) {
        super(name, parameters, instantiations);
        this.preconditions = preconditions;
    }

    /**
     * Return the preconditions of the operator.
     *
     * @return the preconditions of the operator.
     */
    public final IntExp getPreconditions() {
        return this.preconditions;
    }

    /**
     * Set the precondition of the operator.
     *
     * @param preconditions the preconditions to set.
     */
    public final void setPreconditions(final IntExp preconditions) {
        this.preconditions = preconditions;
    }
}

