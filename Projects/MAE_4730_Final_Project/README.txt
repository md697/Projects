Mitchell Dominguez (md697)
MAE 4730
README for Final Computation Project

I:		TRIPLE PENDULUM

		i) 		md697_triple_pendulum_DEMO

				- This script is the only user interface for basic demonstrations of the triple pendulum. 
				- Initial conditions and pendulum parameters are already defined, so all the user has to do is hit run.
				- Parameters of the system, initial conditions, and output parameters are clearly labeled. To set these,
					all one has to do is change them in this script. All parameters are clearly defined here.
				- This script calls md697_run_triple_pendulum(p,t,z0,rederive,plots,animate), where p is 
					the parameters struct, t is the integration duration, and z0 is the initial state. 
				- If when running, an error is thrown saying Amat_XXX and bvec_XXX are missing, set rederive to 1 to
					rederive the MATLAB functions that represent the equations of motion.


II:		FOUR BAR LINKAGE

		i)		md697_four_bar_DEMO

				- This script is the only user interface for basic demonstrations of the four bar linkage
				- Initial conditions and pendulum parameters are already defined, so all the user has to do is hit run.
				- For initial conditions, the user should specify the initial theta vector and one initial 
					theta dot, and let the program calculate the other two angular velocities 
				- If no initial theta dots are supplied, the code will assume they are all zero
				- If too many theta dots are supplied, the code will pick the first one that is given and calculate 
					the others based on that one.
				- Parameters of the system, initial conditions, and output parameters are clearly labeled. To set these,
					all one has to do is change them in this script. All parameters are clearly defined here.
				- This script calls md697_run_four_bar_linkage(p,t,z0,rederive,plots,animate), where p is 
					the parameters struct, t is the integration duration, and z0 is the initial state. 
				- If when running, an error is thrown saying Amat_DAE_4bar and bvec_DAE_4bar are missing, set rederive 
					to 1 to rederive the MATLAB functions that represent the equations of motion.

III:		N-LINK PENDULUM

		i) 		md697_n_pend_DEMO

				- This script is the only user interface for basic demonstrations of the n-link pendulum. 
				- Initial conditions and pendulum parameters are already defined, so all the user has to do is hit run.
				- Parameters of the system, initial conditions, and output parameters are clearly labeled. To set these,
					all one has to do is change them in this script. All parameters are clearly defined here.
				- This script calls md697_run_n_pend(p,t,z0,rederive,plots,animate), where p is 
					the parameters struct, t is the integration duration, and z0 is the initial state. 
				- If when running, an error is thrown saying Amat_LAG_n_link and bvec_LAG_n_link are missing, where
					n is the amount of links that are desired to be simulated, set rederive to 1 to rederive 
					the MATLAB functions that represent the equations of motion.
				- Once the n-link pendulum's EOMs are derived for a certain n, the corresponding Amat and bvec functions 
					are saved and named after the n value. Thus, before setting rederive to 1, first check the 
					directory to see if the EOMs for the desired n value have been derived already. This saves a 
					significant amount of time, especially for higher n values.