[[ja:TwitteringMode-ja]]
== Description ==

twittering-mode.el is a Twitter client

[[image:TwitteringModeScreenshot]]

Home page: http://twmode.sourceforge.net/

Github page: http://github.com/hayamiz/twittering-mode/tree/master

##git clone git://github.com/hayamiz/twittering-mode.git##

== Installation Guide ==

=== For Windows users ===

* Uncompress the archive file, and add a path of a directory containing `twittering-mode.el` to your `load-path`.
: For example, if you uncompressed it under `%%C:\foo\%%`, there may be a directory `%%C:\foo\twittering-mode-X.X.X\%%` which contains `twittering-mode.el`. So add the following code to your `.emacs`
{{{
        (add-to-list 'load-path "C:/foo/twittering-mode-X.X.X")
}}}
* Proceed to **Set up your Emacs**

=== For Linux and other Unix users ===

* Uncompress the archive file, and add a path of a directory containing `twittering-mode.el` to your `load-path`.
: For example, if you uncompressed it under `/path/to/foo`, there may be a directory `/path/to/foo/twittering-mode-X.X.X/` which contains `twittering-mode.el`. So add the following code to your `.emacs`
{{{
        (add-to-list 'load-path "/path/to/foo/twittering-mode-X.X.X")
}}}
* Install cURL, wget, gnutls, or openssl for using SSL connection.
* Proceed to **Set up your Emacs**

=== Set up your Emacs ===
* Add following code to your `.emacs`:
{{{
      (require 'twittering-mode)
}}}
* (Optional) To avoid having to authorize twittering-mode everytime you run it, add this to your `.emacs`:
{{{
      (setq twittering-use-master-password t)
}}}
This requires GnuPG. And also, either EasyPG or alpaca.el (0.13) is necessary.

=== Run twittering-mode ===
# Execute `M-x twit` to run twittering-mode.
# Open OAuth authorization page with your browser, click "Allow", and enter the PIN code. If you use the master password, the PIN code is required only at the first time.
# (Optional) Input the passphrase if you use the master password. This is required only at the first time.
# Your friends' timeline will appear. You can also open other timelines by `V' with [[#timeline-spec]]. Enjoy!

== Key-bindings on View mode ==
`M-x twit', and you enter to this mode. You can see various timelines.

=== Move the cursor on the current timeline ===

; `j': Go to the next tweet. If the cursor placed on the oldest tweet, older tweets are retrieved. You can specify how many tweets will be retrieved by the variable `twittering-number-of-tweets-on-retrieval'.(`twittering-goto-next-status')
; `k': Go to the previous tweet. (`twittering-goto-previous-status')
; `n': Go to the next tweet whose author is the same as the current tweet. (`twittering-goto-next-status-of-user')
; `p': Go to the previous tweet whose author is the same as the current tweet. (`twittering-goto-previous-status-of-user')
; `l': Go to the next character. (`forward-char')
; `h': Go to the previous character. (`backward-char')
; `0': Go to the beginning of the current line. (`beginning-of-line')
; `^': Go to the beginning of the text on the current line. (`beginning-of-line-text')
; `$': Go to the end of the current line. (`end-of-line')
; `C-i': Go to the next username, URI, or timeline symbol. (`twittering-goto-next-thing')
; `M-C-i', `<backtab>': Go to the previous username, URI, or timeline symbol. (`twittering-goto-previous-thing')
; `<backspace>', `M-v': Scroll down. (`twittering-scroll-down')
; `<space>', `C-v': Scroll up. (`twittering-scroll-up')
; `H': Go to the beginning of the current buffer. (`twittering-goto-first-status')
; `G': Go to the end of the current buffer. (`end-of-buffer')

=== Apply some operation to the current timeline ===

; `g': Retrieve new tweets of the current timeline. (`twittering-current-timeline')
; `r': Display replied tweets related to the current tweet. (`twittering-toggle-show-replied-statuses')
; `C-c D': Delete the current tweet. You can delete only yours. (`twittering-delete-status')
; `C-c C-e': Remove all tweets of the current timeline from Emacs cache. (`twittering-erase-old-statuses')
; `q': Kill the current timeline buffer. (`twittering-kill-buffer')

=== Open other timeline ===

If you open a new timeline, a new buffer is generated.

; `v': Open a timeline pointed by the cursor. (`twittering-other-user-timeline')
; `V': Open a various timeline. You can specify the timeline by [[#timeline-spec]]. (`twittering-visit-timeline')
: For convenience, there are following short-cuts.
** `C-c C-f' Open your friends-timeline. (`twittering-friends-timeline')
** `C-c C-u' Open your user-timeline. (`twittering-user-timeline')
** `C-c C-r' Open your reply-timeline, which consists of replies to your tweets. (`twittering-replies-timeline')
** `C-c C-d' Open direct messages timeline, which consists of direct messages to you. (`twittering-direct-messages-timeline')
; `L': Open a timeline of a certain list. (`twittering-other-user-list-interactive')
; `C-c C-q': Search. (`twittering-search')
; `f': Switch to the next timeline buffer. (`twittering-switch-to-next-timeline')
; `b': Switch to the previous timeline buffer. (`twittering-switch-to-previous-timeline')

=== Post a tweet ===

; `u', `C-c C-s': Post a tweet. (`twittering-update-status-interactive')
; `C-m', `Enter': Post a reply to the tweet pointed by the cursor. If the cursor points a URI, invoke `browse-url' for the URI. (`twittering-enter')
; `C-c C-m', `C-c Enter': Post a non-official (organic) retweet for the tweet pointed by the cursor. (`twittering-retweet')
; `C-u C-c C-m', `C-u C-c Enter': Post a official (native) retweet for the tweet pointed by the cursor. (`twittering-retweet')
; `d': Send a direct message. (`twittering-direct-message')

=== Invoke an external browser ===

; `<mouse-1>': Open user page or URI by `browse-url'. (`twittering-click')
; `C-c C-v': Open the pointed user's page by `browse-url'. (`twittering-view-user-page')

=== Change display mode ===

; `a': Toggle automatic retrieval of the current timeline. (`twittering-toggle-activate-buffer')
; `i': Toggle displaying icons of the current timeline. (`twittering-icon-mode')
; `s': Toggle scroll mode for the current timeline. (`twittering-scroll-mode')
; `t', `C-c C-p': Toggle proxy. (`twittering-toggle-proxy')

=== Others ===

; `C-c C-t': Set the current hashtag. (`twittering-set-current-hashtag')
; `C-c C-l': Post the message "λかわいいよλ"("Lambda is cute, lambda."). (`twittering-update-lambda')
; `C-<mouse-3>': Push the current tweet to kill-ring. (`twittering-push-tweet-onto-kill-ring')
; `U': Push the URL of the current tweet to kill-ring. (`twittering-push-uri-onto-kill-ring')

== Key-bindings on Edit mode ==

; `M-p': Replace a tweet being edited with the previous tweet on history. (`twittering-edit-previous-history')
; `M-n': Replace a tweet being edited with the next tweet on history. (`twittering-edit-next-history')
; `<f4>': Shorten the URL pointed by the cursor. (`twittering-edit-replace-at-point')
; `C-c C-k': Cancel editing a tweet. (`twittering-edit-cancel-status')
; `C-c C-c': Post the current tweet. (`twittering-edit-post-status')

== Timeline spec ==
[:timeline-spec]
When pressing `V' (`twittering-visit-timeline'), you can open *any* timeline with **timeline spec**. Since twittering-mode stores the history of visited timelines, [[EmacsSession]] and incremental backward search on the prompt of `V' (`twittering-visit-timeline') may be useful when you open a timeline which you have opened.

The **timeline spec** can be used anywhere you have to specify a timeline.
=== Basic timeline ===
; <b>##:home##</b>: the home timeline.
; <b>##:mentions##</b>: the timeline consisting of tweets mentioning you.
; <b>##:public##</b>: the public timeline.
; <b>/USER/</b>: the timeline consisting of tweets posted by /USER/.
; <b>/USER/##/##/LISTNAME/</b>: the list timeline owned by /USER/ and named /LISTNAME/.
=== Direct message ===
; <b>##:direct_messages##</b>: the timeline consisting of direct messages sent to you.
; <b>##:direct_messages_sent##</b>: the timeline consisting of direct messages that you sent.
=== Favorite ===
; <b>##:favorites##</b>: the timeline consisting of tweets that you marked as a favorite.
; <b>##:favorites/##/USER/</b>: the timeline consisting of tweets that /USER/ marked as a favorite.
=== Hashtag ===
; <b>#/HASHTAG/</b>: the timeline consisting of tweets including #/HASHTAG/.
=== Retweet ===
; <b>##:retweeted_by_me##</b>: retweets that you posted.
; <b>##:retweeted_by_user/##/USER/</b>: (only on development version) retweets that /USER/ posted.
; <b>##:retweeted_to_me##</b>: retweets sent to your home timeline.
; <b>##:retweeted_to_user/##/USER/</b>: (only on development version) retweets sent to /USER/'s home timeline.
; <b>##:retweets_of_me##</b>: your tweets that have been retweeted by others.
=== Search ===
; <b>##:search/##/QUERY-STRING/##/##</b>: the timeline consisting of tweets matching /QUERY-STRING/. In /QUERY-STRING/, **/** (slash) and **\** (backslash) must be escaped as **\/** or **\\**.
== Initial timeline ==
By setting the `twittering-initial-timeline-spec-string', you can specify timelines that should be opened initially. Timelines are specified by [[#timeline-spec]] as follows.
{{{
(setq twittering-initial-timeline-spec-string
      '(":home"
        ":replies"
        ":favorites"
        ":direct_messages"
        ":search/emacs/"
        "user_name/list_name"))
}}}

== Customizing your key bindings ==

You can use `twittering-mode-hook' to customize your configuration. This example shows how to define a few key bindings:

 (add-hook 'twittering-mode-hook
           (lambda ()
             (mapc (lambda (pair)
                     (let ((key (car pair))
                           (func (cdr pair)))
                       (define-key twittering-mode-map
                         (read-kbd-macro key) func)))
                   '(("F" . twittering-friends-timeline)
                     ("R" . twittering-replies-timeline)
                     ("U" . twittering-user-timeline)
                     ("W" . twittering-update-status-interactive)))))

== Other useful options ==

 (setq twittering-icon-mode t)                ; Show icons
 (setq twittering-timer-interval 300)         ; Update your timeline each 300 seconds (5 minutes)
 (setq twittering-url-show-status nil)        ; Keeps the echo area from showing all the http processes

twittering-mode also provides hooks that are run when new tweets arrive. This example calls notify-send (included in the libnotify package) to display a message when new tweets arrive:

 (add-hook 'twittering-new-tweets-hook (lambda ()
   (let ((n twittering-new-tweets-count))
     (start-process "twittering-notify" nil "notify-send"
                    "-i" "/usr/share/pixmaps/gnome-emacs.png"
                    "New tweets"
                    (format "You have %d new tweet%s"
                            n (if (> n 1) "s" ""))))))

== Enabling Spell Check for Tweets ==
Add the hook below to enable spell checking before tweets

{{{
(add-hook 'twittering-edit-mode-hook (lambda () (ispell-minor-mode) (flyspell-mode)))
}}}

== Numbering mode ==

[https://github.com/pft/elisp-assorted/blob/master/twittering-numbering.el twittering-numbering.el] lets one navigate to links using numbers, the same way as is done in emacs-w3m.

== Discussion ==
[new:halloleo:2010-01-20 01:00 UTC]

[[halloleo]]: i'm trying this mode and it works pretty good, but i'm not sure how to completely /finish/ using twitter. does 'q' (`twittering-suspend') do this? i don't think so: it only switches to another buffer, therefore the twitter timer still retrieves tweets...

[new]
[[citizen428]]: @halloleo Have you tried `M-x twittering-stop'?

[new]
RichardRiley : What packages are needed for icon support? Also, wouldnt


      (define-key km "q" 'delete-window)


be a good addition?

[new]
For icon support, try adding ##(twittering-icon-mode)## to your ##.emacs## -- AlbertoGarcia

[new]
You need wget for icon support on Linux. it can take a while to download icons so be patient - RichardRiley.

[new]
That's a bug IMHO. The problem is that icons are downloaded while the timeline is being displayed on screen, so the first time a new user appears in your timeline, you won't see their icon because it's still being downloaded. You have to wait till the next refresh (or press "g" to force it) -- AlbertoGarcia.

[new]
I'm just wondering if I have missed something obvious. The default is to see your friends tweets. But how do I tweet to my tweet account from there? Currently I have to  go to my timeline (C-c C-u)) and then hitting return : is there a quicker way? -- RichardRiley.

[new]
You can use the somewhat non-obvious keybinding of C-c C-s (twittering-update-status-interactive).

[new]
Icon support does not work in windows.  I have gnu wget installed and in path, and the icons are downloading to twittering-tmp-dir.  However, they do not display in icon mode. --Tim Hoolihan

[new]
Icon Works on Windows needs GNU Win32 image packages (http://gnuwin32.sourceforge.net/packages.html) installed, which includes jpeg, libungif, libpng,  xpm, and zlib, etc. And the packages dir must be set into the %PATH% environment various.

BTW: I wish this code would support HTTPS and third-party API in the future. It would be very useful. --Moses

[new]
I wish twittering-mode would support socket proxy. I only use tor to connect twitter. --rix

[new]
I wrote some patches so that icon-mode works well without external programs, wget and convert.
You can get it from my repository on github http://github.com/cvmat/twittering-mode/tree/without-external-program . I confirmed it with NTEmacs on Windows XP and Emacs on Debian. -- Tadashi MATSUO

[new]
Sorry for my rudeness. At last, I found tor+privoxy can make a http proxy. privoxy's default proxy port is 8118. --rix

[new]
hayamiz has merged my patches into the main repository. The main repository http://github.com/hayamiz/twittering-mode/tree/master now supports icon-mode without external programs. --Tadashi MATSUO

[new]
Any chance we can have a count of characters while tweeting in the minibuffer? (twit.el has this, I should look at how it's done)

[new]
If you use 0.9.0, the count is displayed in default. If you use the latest version on github, you may need the following statement in your .emacs;
  (setq twittering-use-show-minibuffer-length t)
But the option is t in default... --Tadashi MATSUO

[new]
I can't see my followee's retweets. I'm following @ebertchicago(Roger Ebert, a film critik), but can't see his massive retweets. Can anybody tell me how can I fix it? -Jeongtae Roh

[new]
Do you use 0.9.0? In default, it retrieves friends timeline, which does not include native retweets unless the special option is embedded in the request (described at http://dev.twitter.com/doc/get/statuses/friends_timeline ). I recommend you to use the latest version on github. It supports home timeline, which includes native retweets. --Tadashi MATSUO

[new]
 Suddenly I get this error message from my twitteringmode client. Strange thing is it was working fine before. Any clues?

error in process sentinel: Search failed: “^M? ^M?

Thanks in advance.

[new]
The version 0.9.0 seems to have some problems on dealing of newlines. But your problem, which is also reported by other people, may be triggered by recent modification on twitter.com because this problem seems to appear recently. The latest version on github will solve the problem. --Tadashi MATSUO

[new]
How do I avoid having to authorize the app once and again when using OAuth? -- AlbertoGarcia.

[new]
With the HEAD version on github, you can store the authorized token with encryption by GnuPG.
If you have an encrypted token, you no longer need to retrieve PIN code via web browser.
Instead, you need to input a pass phrase for decryption. You can enable this function by the following code.
{{{
    (setq twittering-use-master-password t)
}}}
It requires GnuPG and either EasyPG or 'alpaca.el'. Please refer to [http://github.com/hayamiz/twittering-mode/blob/master/NEWS NEWS file on the HEAD] -- Tadashi MATSUO

[new]
I have just installed 1.0 after removing 0.8.  When I use M-x twit to enter tw-mode, I just get "Authorization via OAuth failed. Type M-x twit to retry." in the minibuffer, and an empty :home buffer.  This is unhelpful.  What can I do to actually authorize? I can't have emacs launch a browser: my emacs session lives on a distant machine and I access it strictly in text, as a dumb tty. -- Krinn
:[new]
It is because Twitter has changed the CA certificate required for server authentication of api.twitter.com and search.twitter.com. The CA certificate embedded in 1.0.0 fails. The HEAD and the most recent revision on 1.0.x branch on github have new CA certificate, which can authenticate the servers. -- Tadashi MATSUO
::[new]
2010-09-05-133600: I get just the "Authorization via..." message even with the github checkout, don't see any page to open etc. Which page should I open in an external browser? -- JJ
:::[new]
The URL must be displayed on the buffer opened just after M-x twit. Then it will be opened by `browse-url' if you allow it. I do not know how to reproduce your case. The HEAD on github may help you. -- Tadashi MATSUO
[new]
Fiddled around with the hook and wrote one I think is more useful than the suggested. I also used ToDoChiKu so it should work with growl, snarl, and libnotify.

{{{
(add-hook 'twittering-new-tweets-hook (lambda ()
  (let ((n twittering-new-tweets-count))
    (if (> n 10)
        (todochiku-message
          (twittering-timeline-spec-to-string twittering-new-tweets-spec)
          (format "You have %d new tweet%s"
            n (if (> n 1) "s" ""))
          (todochiku-icon 'social))
      (dolist (el twittering-new-tweets-statuses)
	(todochiku-message
          (twittering-timeline-spec-to-string twittering-new-tweets-spec)
	  (concat (cdr (assoc 'user-screen-name el))
	     " said: "
	     (cdr (assoc 'text el)))
          (todochiku-icon 'social)))))))
}}}

When more than 10 tweets are retrieved, it makes a message with the spec as the title and the number of tweets in the message.
If it gets less than 10, a message is made of each. Hope someone else finds it useful. -- DaveKerschner

How can this code works for display only when I receive a mention?. -- Exal

[new]
2010-09-23 I also installed v1.0 and it works fine on my Linux system but not on my Windows system (get same "Authorization via OAuth failed. Type M-x twit to retry." message). It is the same exact setup that I sync w/unison. Is there something special needed for Windows? - Ed
:[new]
For SSL connection, Emacs requires an external program. Do you have `curl', `gnutls_cli' or `openssl' in exec-path? By the way, I recommend the HEAD on github. It supports encrypted local storage of authorized key and xAuth. You need not to take a PIN code repeatedly.
Note that `curl.exe' (for Windows) distributed with twittering-mode cannot correctly perform HTTPS POST with non-empty post-body via a proxy. So, you cannot use it for xAuth via a proxy. (You can use it for OAuth and tweet retrieval.) In addition, `gnutls_cli' and `openssl' cannot be used with a proxy. -- Tadashi MATSUO

[new]
'@'-replies from people I follow which are directed to people other than myself don't show up in my :home timeline; is there any way to change this? -- Alexis
:[new]
Alias may help you. If you have the below configuration, the timeline __$me__ includes such tweets.
{{{
  (setq twittering-timeline-spec-alias
        `(("me" . "$r(YOUR-USER-NAME)")
          ("r" . ,(lambda (username) (format "$related-to(%s)" username)))
          ("related-to" .
           ,(lambda (username)
              (if username
                  (format ":search/to:%s OR from:%s OR @%s/"
                          username username username)
                ":home")))))
}}}
To read tweets related to someone, you can use the timeline __$r(HIS-OR-HER-USERNAME)__ . -- Tadashi MATSUO

[new]
Any way to add support for user switching? I.e. if you have multiple Twitter accounts. TwIt had this, but now has been discontinued, with its developer switching to TwitteringMode... -- JJ

:[new]
I like the feature in /rcirc/ that allows toggling between unread /msgs and the current coding buffer using `C-c C-@' (`@' -> space). Is there a chance of introducing this feature? -- Djui

[new]
Mar 23, 2011; I had similar problems, getting the message: "Authorization via OAuth failed. Type M-x twit to retry." on GNU Emacs (Windows), twittering-mode-1.0.0. I know SSL works because I write/use other Emacs applications that consume HTTPS content. The following steps fixed the situation for me: 1) Get the updated CA certificate from Git. 2) Save the certificate to twittering-mode-1.0.0/win-curl/equifax.cer 3) In your .emacs, add:
{{{
(setq twittering-curl-program (concat site-lisp-path "/twittering-mode-1.0.0/win-curl/curl.exe"))
(setq twittering-cert-file (concat site-lisp-path "/twittering-mode-1.0.0/win-curl/equifax.cer"))
}}}
Where site-lisp-path expands to your Emacs site-lisp directory. Now when I do M-x twit, I see the successful connection in Wireshark and get the request for my OAuth Pin. -- sboles

[new]
10 May 2011: If you'd like to filter incoming tweets so that those matching a particular pattern aren't displayed in your timeline, you might find the following code useful:
{{{
(setq twittering-tweet-filters '("example" "example phrase"))                                   
(defun twittering-filter-tweets ()                                            
  (setq non-matching-statuses '())                                            
  (dolist (status twittering-new-tweets-statuses)                             
    (setq matched-tweets 0)                                                   
    (dolist (pat twittering-tweet-filters)                                    
      (if (string-match pat (cdr (assoc 'text status)))                       
          (setq matched-tweets (+ 1 matched-tweets))))                        
    (if (= 0 matched-tweets)                                                  
        (setq non-matching-statuses (append non-matching-statuses `(,status)))))
  (setq new-statuses non-matching-statuses))                                  
(add-hook 'twittering-new-tweets-hook 'twittering-filter-tweets)
}}}
The above will not display any tweets containing the text "example" or "example phrase". A filter can consist of any regex accepted by the 'string-match' function.

Tested with emacs 23.2.

-- Alexis

[new]
Are there commands to view lists of (i) people who you're following and (ii) people who're following you? For that matter, is there any manual?

--BeSlayed

How could I expand the number of twitts retrieved on the mode startup? And why we don't have a command like `twittering-favorite-timeline`?

--FabioCosta

[new]
Does the image publishing feature being included in the TODO list?
It is a very important function for twittering...

--Cesc

----
See also: [[Twitter]] [[Identica-mode]]
