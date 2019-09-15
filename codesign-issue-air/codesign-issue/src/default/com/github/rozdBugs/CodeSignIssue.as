/**
 * Created by max.rozdobudko@gmail.com on 9/15/19.
 */
package com.github.rozdBugs {
import com.github.rozdBugs.core.rozdBugs;

use namespace rozdBugs;

public class CodeSignIssue {

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  isSupported
    //-------------------------------------

    public static function get isSupported(): Boolean {
        return false;
    }

    //-------------------------------------
    //  sharedInstance
    //-------------------------------------

    private static var instance: CodeSignIssue;
    public static function get shared(): CodeSignIssue {
        if (instance == null) {
            new CodeSignIssue();
        }
        return instance;
    }

    //-------------------------------------
    //  extensionVersion
    //-------------------------------------

    /**
     * Returns version of extension
     * @return extension version
     */
    public static function extensionVersion(): String {
        trace("[CodeSignIssue] CodeSignIssue extension is not supported on this platform.");
        return null;
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function CodeSignIssue() {
        super();
    }
}
}
