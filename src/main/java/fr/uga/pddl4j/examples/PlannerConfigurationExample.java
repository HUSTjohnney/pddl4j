/*
 * Copyright (c) 2021 by Damien Pellier <Damien.Pellier@imag.fr>.
 *
 * This file is part of PDDL4J library.
 *
 * PDDL4J is free software: you can redistribute it and/or modify * it under the terms of the GNU General Public License
 * as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * PDDL4J is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License * along with PDDL4J.  If not,
 * see <http://www.gnu.org/licenses/>
 */

package fr.uga.pddl4j.examples;

import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.planners.InvalidConfigurationException;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.htn.stn.TFD;
import fr.uga.pddl4j.planners.statespace.HSP;

import java.io.FileNotFoundException;

/**
 * The class is an example. It shows how to create a HSP planner by programming
 * and running it using the class
 * {@code PlannerConfiguration}.
 *
 * @author D. Pellier
 * @version 4.0 - 30.11.2021
 */
public class PlannerConfigurationExample {

    /**
     * The main method of the class.
     *
     * @param args the command line arguments. No argument is used.
     */
    public static void main(String[] args) {

        // The path to the benchmarks directory
        // final String benchmarks =
        // "src\\test\\resources\\benchmarks\\hddl\\ipc2020\\satellite\\";

        String path = "D:\\git workspace\\Tex_WorkSpace\\001 SpaceStationMissionPlanning\\002 Experiment&Result\\Instance2.0\\";

        // Gets the default configuration from the planner
        fr.uga.pddl4j.planners.PlannerConfiguration config = HSP.getDefaultConfiguration();
        // Sets the domain of the problem to solve
        config.setProperty(HSP.DOMAIN_SETTING, path + "domain.pddl");
        // Sets the problem to solve
        config.setProperty(HSP.PROBLEM_SETTING, path + "p01.pddl");
        // Sets the timeout allocated to the search.
        config.setProperty(HSP.TIME_OUT_SETTING, 1000);// 100s
        //  Set the level of trace of the planner: ALL, DEBUG,
        // INFO, ERROR, FATAL, OFF, TRACE (preset INFO)
        config.setProperty(HSP.LOG_LEVEL_SETTING, LogLevel.INFO); // 有几种log的level，根据需要返回需要的值

        // Sets the heuristic used to search
        // config.setProperty(TFD.HEURISTIC_SETTING, StateHeuristic.Name.MAX);
        // Sets the weight of the heuristic
        // config.setProperty(TFD.WEIGHT_HEURISTIC_SETTING, 1.2);

        // Creates an instance of the HSP planner with the specified configuration
        Planner planner = Planner.getInstance(Planner.Name.HSP, config);
        

        // Runs the planner and print the solution
        try {
            planner.solve();
            // planner.getLogLevel().toString();
            
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
        }

    }
}
