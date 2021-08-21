%########################################################################
%# Copyright (c) 1988-2021 $organization$
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
%#   File: t.t
%#
%# Author: $author$
%#   Date: 8/19/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_include,%(%else-then(%is_include%,%(%is_Include%)%)%)%,%
%is_file_t,%(%else-then(%is_file_t%,%(%is_File_t%)%)%)%,%
%file_t,%(%else-then(%if-no(%is_file_t%,,%(%file_t%)%)%,%(%if-no(%is_file_t%,,%(file-t.t)%)%)%)%)%,%
%File_t,%(%else-then(%if-no(%is_file_t%,,%(%File_t%)%)%,%(%if-no(%is_file_t%,,%(%file_t%)%)%)%)%)%,%
%FILE_T,%(%else-then(%FILE_T%,%(%toupper(%File_t%)%)%)%)%,%
%file_t,%(%else-then(%_file_t%,%(%tolower(%File_t%)%)%)%)%,%
%include,%(%else-then(%if-no(%is_include%,,%(%include%)%)%,%(%if-no(%is_include%,,%(%File_t%)%)%)%)%)%,%
%Include,%(%else-then(%if-no(%is_include%,,%(%Include%)%)%,%(%if-no(%is_include%,,%(%include%)%)%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_include%,%(%tolower(%Include%)%)%)%)%,%
%is_parameters_t,%(%else-then(%is_parameters_t%,%(%is_Parameters_t%)%)%)%,%
%parameters_t,%(%else-then(%if-no(%is_parameters_t%,,%(%parameters_t%)%)%,%(%if-no(%is_parameters_t%,,%(parameters-t.t)%)%)%)%)%,%
%Parameters_t,%(%else-then(%if-no(%is_parameters_t%,,%(%Parameters_t%)%)%,%(%if-no(%is_parameters_t%,,%(%parameters_t%)%)%)%)%)%,%
%PARAMETERS_T,%(%else-then(%PARAMETERS_T%,%(%toupper(%Parameters_t%)%)%)%)%,%
%parameters_t,%(%else-then(%_parameters_t%,%(%tolower(%Parameters_t%)%)%)%)%,%
%%(%
%%include(%Include_path%/%File_t%)%%
%%%with%(()%%%
%if(%if-no(%is_Include%,,%(yes)%)%,%(%
%%with(Parameters,%(Include_path=%%filepath%(()%%%input%%%())%%%)%,%
%%(%include(%include_path%/%Parameters_t%)%)%)%%
%)%)%%include(%include_path%/%Parameters_t%)%%%%%%(()%%%
%if(%if-no(%is_Include%,,%(%Include%)%)%,%(%
%%parse(%Include%,;,,,,%(%%%%include%(()%%%Include_path%%%then-if(%Include%,%(/)%)%%())%%%%%
)%,Include)%%
%)%)%%
%%%%())%%%%())%%%%
%)%)%