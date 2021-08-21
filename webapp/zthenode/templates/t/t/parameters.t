%########################################################################
%# Copyright (c) 1988-2020 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: parameters.t
%#
%# Author: $author$
%#   Date: 2/16/2020, 8/19/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_parameters_t,%(%else-then(%is_parameters_t%,%(%is_Parameters_t%)%)%)%,%
%parameters_t,%(%else-then(%if-no(%is_parameters_t%,,%(%parameters_t%)%)%,%(%if-no(%is_parameters_t%,,%(parameters-t.t)%)%)%)%)%,%
%Parameters_t,%(%else-then(%if-no(%is_parameters_t%,,%(%Parameters_t%)%)%,%(%if-no(%is_parameters_t%,,%(%parameters_t%)%)%)%)%)%,%
%PARAMETERS_T,%(%else-then(%PARAMETERS_T%,%(%toupper(%Parameters_t%)%)%)%)%,%
%parameters_t,%(%else-then(%_parameters_t%,%(%tolower(%Parameters_t%)%)%)%)%,%
%is_parameters,%(%else-then(%is_parameters%,%(%is_Parameters%)%)%)%,%
%parameters,%(%else-then(%if-no(%is_parameters%,,%(%parameters%)%)%,%(%if-no(%is_parameters%,,%(%parameters(,,;,,%(%name%%then-if(%value%,=)%)%,name,value)%)%)%)%)%)%,%
%Parameters,%(%else-then(%if-no(%is_parameters%,,%(%Parameters%)%)%,%(%if-no(%is_parameters%,,%(%parameters%)%)%)%)%)%,%
%PARAMETERS,%(%else-then(%PARAMETERS%,%(%toupper(%Parameters%)%)%)%)%,%
%parameters,%(%else-then(%_parameters%,%(%tolower(%Parameters%)%)%)%)%,%
%%(%
%%include(%include_path%/%Parameters_t%)%%
%)%)%