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
%#   File: QtCreator-exe-pri.t
%#
%# Author: $author$
%#   Date: 8/22/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_out,%(%else-then(%is_out%,%(%is_Out%)%)%)%,%
%out,%(%else-then(%if-no(%is_out%,,%(%out%)%)%,%(%if-no(%is_out%,,%(exe)%)%)%)%)%,%
%Out,%(%else-then(%if-no(%is_out%,,%(%Out%)%)%,%(%if-no(%is_out%,,%(%out%)%)%)%)%)%,%
%OUT,%(%else-then(%OUT%,%(%toupper(%Out%)%)%)%)%,%
%out,%(%else-then(%_out%,%(%tolower(%Out%)%)%)%)%,%
%is_output,%(%else-then(%is_output%,%(%is_Output%)%)%)%,%
%output,%(%else-then(%if-no(%is_output%,,%(%output%)%)%,%(%if-no(%is_output%,,%(executable)%)%)%)%)%,%
%Output,%(%else-then(%if-no(%is_output%,,%(%Output%)%)%,%(%if-no(%is_output%,,%(%output%)%)%)%)%)%,%
%OUTPUT,%(%else-then(%OUTPUT%,%(%toupper(%Output%)%)%)%)%,%
%output,%(%else-then(%_output%,%(%tolower(%Output%)%)%)%)%,%
%%(%
%%include(%Include_path%/QtCreator-file-pri-pro.t)%%
%%include(%Include_path%/target-QtCreator-pri.t)%%
%)%)%