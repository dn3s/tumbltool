###GLOBAL

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{Title} | The HTML-safe title of your blog.|yes|no|
|{Description} | The description of your blog. (may include HTML)|yes|no|
|{MetaDescription} | The HTML-safe description of your blog.e.g., &lt;meta name="description" content="{MetaDescription}" />|yes|no|
|{BlogURL} | Main URL for your blog.|yes|no|
|{RSS} | RSS feed URL for your blog.|yes|no|
|{Favicon} | Favicon URL for your blog.|yes|no|
|{CustomCSS} | Any custom CSS code added on your Customize page.|yes|no|
|{block:PermalinkPage}{/block:PermalinkPage} | Rendered on post permalink pages.Useful for embedding comment widgets
|{block:IndexPage}{/block:IndexPage} | Rendered on index (post) pages.|yes|no|
|{block:PostTitle}{PostTitle}{/block:PostTitle} | Rendered on permalink pages.(Useful for displaying the current post's title in the page title)Example: &lt;title>{Title}{block:PostTitle} | - {PostTitle}{/block:PostTitle}&lt;/title>|yes|no|
|{block:PostSummary}{PostSummary}{/block:PostSummary} | Identical to {PostTitle}, but will automatically generate a summary if a title doesn't exist.|yes|no|
|{PortraitURL-16} | Portrait photo URL for your blog. 16-pixels by 16-pixels.|no|no|
|{PortraitURL-24} | Portrait photo URL for your blog. 24-pixels by 24-pixels.|no|no|
|{PortraitURL-30} | Portrait photo URL for your blog. 30-pixels by 30-pixels.|no|no|
|{PortraitURL-40} | Portrait photo URL for your blog. 40-pixels by 40-pixels.|no|no|
|{PortraitURL-48} | Portrait photo URL for your blog. 48-pixels by 48-pixels.|no|no|
|{PortraitURL-64} | Portrait photo URL for your blog. 64-pixels by 64-pixels.|no|no|
|{PortraitURL-96} | Portrait photo URL for your blog. 96-pixels by 96-pixels.|no|no|
|{PortraitURL-128} | Portrait photo URL for your blog. 128-pixels by 128-pixels.|no|no|
|{CopyrightYears} | Displays the span of years your blog has existed.|yes|no|

###SETTINGS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{TitleFont} | The font used for your blog title.|yes|no|
|{TitleFontWeight} | The weight of your title font ("normal" or "bold").|yes|no|
|{BackgroundColor} | The background color of your blog.|yes|no|
|{TitleColor} | The title color of your blog.|yes|no|
|{AccentColor} | The accent color of your blog.|yes|no|
|{HeaderImage} | URL of your header image in all its glory. This will always have a value, even if it's a default header image.|yes|no|
|{AvatarShape} | The display shape of your avatar ("circle" or "square").|yes|no|
|{block:ShowTitle}{/block:ShowTitle} | Rendered if you have "Show title" enabled.|yes|no|
|{block:HideTitle}{/block:HideTitle} | Rendered if you have "Show title" disabled.|yes|no|
|{block:ShowDescription}{/block:ShowDescription} | Rendered if you have "Show description" enabled.|yes|no|
|{block:HideDescription}{/block:HideDescription} | Rendered if you have "Show description" disabled.|yes|no|
|{block:ShowAvatar}{/block:ShowAvatar} | Rendered if you have "Show avatar" enabled.|yes|no|
|{block:HideAvatar}{/block:HideAvatar} | Rendered if you have "Show avatar" disabled.|yes|no|
|{block:ShowHeaderImage}{/block:ShowHeaderImage} | Rendered if you have "Show header image" enabled.|yes|no|
|{block:HideHeaderImage}{/block:HideHeaderImage} | Rendered if you have "Show header image" disabled.|yes|no|

###VISIBILITY/FEATURES

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Pagination}{/block:Pagination} | Rendered if there is a "previous" or "next" page.|yes|no|
|{block:PreviousPage}{/block:PreviousPage} | Rendered if there is a "previous" page (newer posts) to navigate to.|yes|no|
|{block:NextPage}{/block:NextPage} | Rendered if there is a "next" page (older posts) to navigate to.|yes|no|
|{PreviousPage} | URL for the "previous" page (newer posts).|yes|no|
|{NextPage} | URL for the "next" page (older posts).|yes|yes|
|{CurrentPage} | Current page number.|yes|yes|
|{TotalPages} | Total page count.|yes|yes|
|{block:SubmissionsEnabled} | {/block:SubmissionsEnabled} | Rendered if Submissions are enabled.|yes|no|
|{SubmitLabel} | The customizable label for the Submit link.Example: "Submit"|yes|no|
|{block:AskEnabled}{/block:AskEnabled} | Rendered if asking questions is enabled.|yes|no|
|{AskLabel} | The customizable label for the Ask link.Example: "Ask me anything"|yes|no|

###JUMP CONTENT???

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:JumpPagination length="5"} | {/block:JumpPagination} | Rendered for each page greater than the current page minus one-half length up to current page plus one-half length.|yes|no|
|{block:CurrentPage} | {/block:CurrentPage} | Rendered when jump page is the current page.|yes|no|
|{block:JumpPage} | {/block:JumpPage} | Rendered when jump page is not the current page.|yes|no|
|{PageNumber} | Page number for jump page.|yes|no|
|{URL} | URL for jump page.|yes|no|

###CUSTOM PAGES

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:HasPages} | {/block:HasPages} | Rendered if you have defined any custom pages.|yes|no|
|{block:Pages} | {/block:Pages} | Rendered for each custom page.|yes|no|
|{URL} | The URL for this page.|yes|no|
|{Label} | The label for this page.|yes|no|

###NEXT/PREV PAGE LINKS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:PermalinkPagination} | Rendered if there is a "previous" or "next" post.|yes|no|
|{block:PreviousPost} | {/block:PreviousPost} | Rendered if there is a "previous" post to navigate to.|yes|no|
|{block:NextPost} | {/block:NextPost} | Rendered if there is a "next" post to navigate to.|yes|no|
|{PreviousPost} | URL for the "previous" (newer) post.|yes|no|
|{NextPost} | URL for the "next" (older) post.|yes|no|

###POST STUFF

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Posts} | {/block:Posts} | This block gets rendered for each post in reverse chronological order. The number of posts that appear per-page can be configured in the Customize area for the blog on the Advanced tab.|yes|yes|
|{block:Posts inlineMediaWidth="500"} | {/block:Posts} | Width for inline media in the post body.Minimum: 250px|no|no|
|{block:Posts inlineNestedMediaWidth="250"} | {/block:Posts} | Width for inline media in the reblog chain.Minimum: 250px (must be smaller than or same as inlineMediaWidth)|no|no|
|{block:Text} | {/block:Text} | Rendered for Text posts.|yes|yes|
|{block:Photo} | {/block:Photo} | Rendered for Photo posts.|yes|no|
|{block:Panorama} | {/block:Panorama} | Rendered for Panorama posts.|yes|no|
|{block:Photoset} | {/block:Photoset} | Rendered for Photoset posts.|yes|no|
|{block:Quote} | {/block:Quote} | Rendered for Quote posts.|yes|no|
|{block:Link} | {/block:Link} | Rendered for Link posts.|yes|no|
|{block:Chat} | {/block:Chat} | Rendered for Conversation posts.|yes|no|
|{block:Audio} | {/block:Audio} | Rendered for Audio posts.|yes|no|
|{block:Video} | {/block:Video} | Rendered for Video posts.|yes|no|
|{block:Answer} | {/block:Answer} | Rendered for Answer posts.|yes|no|
|{PostType} | The name of the current post type.|yes|partial|
|{Permalink} | The permalink for a post.Example: "http://sample.tumblr.com/post/123"|yes|no|
|{ShortURL} | A shorter URL that redirects to this post.Example: "http://tumblr.com/xpv5qtavm"|yes|no|
|{PostID} | The numeric ID for a post.Example: 1234567 |no|no|
|{TagsAsClasses} | An HTML class-attribute friendly list of the post's tags.Example: "humor office new_york_city"By "HTML class-attribute friendly," we mean that it conforms to HTML specifications for class-attributes. Mostly, it should begin with a letter, followed by letters, digits, hyphens, or underscores. Letters need to be from the English alphabet, as international or non-English characters may give unexpected results. For posts imported from other sites, an HTML-friendly version of the source domain will also be included, with periods in the domain replaced by underscores.Example: "twitter_com", "digg_com", etc.The class-attribute "reblog" will be included automatically if the post was reblogged from another post.|no|no|
|{block:Post[1-15]} | {/block:Post[1-15]} | Rendered for the post at the specified offset.This makes it possible to insert an advertisement or design element in the middle of your posts.Example: {block:Post5}I'm the fifth post!{/block:Post5} | will only be rendered on the fifth post being displayed.|no|no|
|{block:Odd} | {/block:Odd} | Rendered for every one of the current page's odd-numbered posts.|no|no|
|{block:Even} | {/block:Even} | Rendered for every one of the current page's even-numbered posts.|no|no|
|{block:More} | {/block:More} | Rendered on index pages for posts with Read More breaks.|no|no|
|{PostNotesURL} | URL to an HTML partial of this post's Notes. Useful for loading Notes via AJAX.|no|no|

###REBLOGS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:RebloggedFrom} | {/block:RebloggedFrom} | Rendered if a post was reblogged from another post.|yes|no|
|{ReblogParentName} | The username of the blog this post was reblogged from.|yes|no|
|{ReblogParentTitle} | The title of the blog this post was reblogged from.|yes|no|
|{ReblogParentURL} | The URL for the blog this post was reblogged from.|yes|no|
|{ReblogParentPortraitURL-16} | Portrait photo URL for the blog this post was reblogged from. 16-pixels by 16-pixels.|yes|no|
|{ReblogParentPortraitURL-24} | Portrait photo URL for the blog this post was reblogged from. 24-pixels by 24-pixels.|yes|no|
|{ReblogParentPortraitURL-30} | Portrait photo URL for the blog this post was reblogged from. 30-pixels by 30-pixels.|yes|no|
|{ReblogParentPortraitURL-40} | Portrait photo URL for the blog this post was reblogged from. 40-pixels by 40-pixels.|yes|no|
|{ReblogParentPortraitURL-48} | Portrait photo URL for the blog this post was reblogged from. 48-pixels by 48-pixels.|yes|no|
|{ReblogParentPortraitURL-64} | Portrait photo URL for the blog this post was reblogged from. 64-pixels by 64-pixels.|yes|no|
|{ReblogParentPortraitURL-96} | Portrait photo URL for the blog this post was reblogged from. 96-pixels by 96-pixels.|yes|no|
|{ReblogParentPortraitURL-128} | Portrait photo URL for the blog this post was reblogged from. 128-pixels by 128-pixels.|yes|no|
|{ReblogRootName} | The username of the blog this post was created by.|yes|no|
|{ReblogRootTitle} | The title of the blog this post was created by.|yes|no|
|{ReblogRootURL} | The URL for the blog this post was created by.|yes|no|
|{ReblogRootPortraitURL-16} | Portrait photo URL for the blog this post was created by. 16-pixels by 16-pixels.|yes|no|
|{ReblogRootPortraitURL-24} | Portrait photo URL for the blog this post was created by. 24-pixels by 24-pixels.|yes|no|
|{ReblogRootPortraitURL-30} | Portrait photo URL for the blog this post was created by. 30-pixels by 30-pixels.|yes|no|
|{ReblogRootPortraitURL-40} | Portrait photo URL for the blog this post was created by. 40-pixels by 40-pixels.|yes|no|
|{ReblogRootPortraitURL-48} | Portrait photo URL for the blog this post was created by. 48-pixels by 48-pixels.|yes|no|
|{ReblogRootPortraitURL-64} | Portrait photo URL for the blog this post was created by. 64-pixels by 64-pixels.|yes|no|
|{ReblogRootPortraitURL-96} | Portrait photo URL for the blog this post was created by. 96-pixels by 96-pixels.|yes|no|
|{ReblogRootPortraitURL-128} | Portrait photo URL for the blog this post was created by. 128-pixels by 128-pixels.|yes|no|
|{block:NotReblog} | {/block:NotReblog} | Rendered if a post was not reblogged from another post.|yes|no|

###TEXT POSTS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Title} | {/block:Title} | Rendered if there is a title for this post.|yes|yes|
|{Title} | The title of this post.|yes|yes|
|{Body} | The content of this post.|yes|yes|

###PHOTO POSTS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{PhotoAlt} | The HTML-safe version of the caption (if one exists) of this post.|yes|no|
|{block:Caption} | {/block:Caption} | Rendered if there is a caption for this post.|yes|no|
|{Caption} | The caption for this post.|yes|no|
|{block:LinkURL} | Rendered if this photo has a click-through set.|yes|no|
|{LinkURL} | A click-through URL for this photo.Defaults to media permalink if one is not set.|yes|no|
|{LinkOpenTag} | An HTML open anchor-tag including the click-through URL if set.Example: &lt;a href="http://...">|yes|no|
|{LinkCloseTag} | A closing anchor-tag output only if a click-through URL is set.Example: &lt;/a>|yes|no|
|{PhotoURL-500} | URL for the photo of this post.No wider than 500-pixels.|yes|no|
|{PhotoWidth-500} | Width for the 500px size photo.|yes|no|
|{PhotoHeight-500} | Height for the 500px size photo.|yes|no|
|{PhotoURL-400} | URL for the photo of this post.No wider than 400-pixels.|yes|no|
|{PhotoWidth-400} | Width for the 400px size photo.|yes|no|
|{PhotoHeight-400} | Height for the 400px size photo.|yes|no|
|{PhotoURL-250} | URL for the photo of this post.No wider than 250-pixels.|yes|no|
|{PhotoWidth-250} | Width for the 250px size photo.|yes|no|
|{PhotoHeight-250} | Height for the 250px size photo.|yes|no|
|{PhotoURL-100} | URL for the photo of this post.No wider than 100-pixels.|yes|no|
|{PhotoWidth-100} | Width for the 100px size photo.|yes|no|
|{PhotoHeight-100} | Height for the 100px size photo.|yes|no|
|{PhotoURL-75sq} | URL for a square version of the photo of this post.75-pixels by 75-pixels.|yes|no|
|{block:HighRes} | {/block:HighRes} | Rendered if there is a high-res or panorama photo for a post.|yes|no|
|{PhotoURL-HighRes} | URL for the high-res or panorama sized photo of this post. No wider than 1280px or 2560px respectively.Use {PhotoURL-1280}, {PhotoWidth-1280}, and {PhotoHeight-1280} | to access the 1280 media directly.|yes|no|
|{PhotoWidth-HighRes} | Width for the high-res size photo.|yes|no|
|{PhotoHeight-HighRes} | Height for the high-res size photo.|yes|no|
|{block:Exif} | {/block:Exif} | Rendered if this photo has Exif data.|yes|no|
|{block:Camera}{Camera}{/block:Camera} | Rendered if this photo's Exif data contains camera info.|yes|no|
|{block:Aperture}{Aperture}{/block:Aperture} | Rendered if this photo's Exif data contains aperture info.|yes|no|
|{block:Exposure}{Exposure}{/block:Exposure} | Rendered if this photo's Exif data contains exposure info.|yes|no|
|{block:FocalLength}{FocalLength}{/block:FocalLength} | Rendered if this photo's Exif data contains focal length.|yes|no|

###LINK POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{LinkOpenTag} | An HTML open anchor-tag with Javascript to activate the Panorama lightbox.|no|no|
|{LinkCloseTag} | A closing anchor-tag.|no|no|

###PANORAMA POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{PhotoURL-Panorama} | URL for the panorama photo of this post.These images can be very big. (2560+ pixels wide)|yes|no|
|{PhotoWidth-Panorama} | Width for the panorama size photo.|yes|no|
|{PhotoHeight-Panorama} | Height for the panorama size photo.|yes|no|

###PHOTOSET POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Caption} | {/block:Caption} | Rendered if there is a caption for this post.|yes|no|
|{Caption} | The caption for this post.|yes|no|
|{Photoset} | Embed code for a responsive Photoset that shrinks to fit the container (max. 700-pixels wide).|no|no|
|{Photoset-700} | Embed code for a 700-pixel wide photoset.|no|no|
|{Photoset-500} | Embed code for a 500-pixel wide photoset.|no|no|
|{Photoset-400} | Embed code for a 400-pixel wide photoset.|no|no|
|{Photoset-250} | Embed code for a 250-pixel wide photoset.||no|
|{PhotoCount} | The number of photos in the Photoset.|no|no|
|{PhotosetLayout} | An integer representation of the Photoset layout.|no|no|
|{JSPhotosetLayout} | JavaScript array of the Photoset column counts.|no|no|
|{block:Photos} | {/block:Photos} | Rendered for each of the Photoset photos. Each contains the same variables as {block:Photo}

###QUOTE POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{Quote} | The content of this post.|yes|no|
|{block:Source} | {/block:Source} | Rendered if there is a source for this post.|yes|no|
|{Source} | The source for this post.May contain HTML|yes|no|
|{Length} | "short", "medium", or "long", depending on the length of the quote.|yes|no|

###LINK POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{URL} | The URL of this post.|yes|no|
|{Name} | The name of this post.Defaults to the URL if no name is entered.|yes|no|
|{Target} | Should be included inside the A-tags of Link posts.Output target="_blank" if you've enabled "Open links in new window".|yes|no|
|{block:Host} | {/block:Host} | Rendered if there is a host for this post (if both URL and name exists).|yes|no|
|{Host} | The host name of the URL, sans 'www'. For example tumblr.com |no|no|
|{block:Thumbnail} | {/block:Thumbnail} | Rendered if there is an image thumbnail for the post.|yes|no|
|{Thumbnail} | Link thumbnail URL.|yes|no|
|{block:Description} | {/block:Description} | Rendered if there is a description for this post.|yes|no|
|{Description} | The description for this post.|yes|no|

###CHAT POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Title} | {/block:Title} | Rendered if there is a title for this post.|yes|no|
|{Title} | The title of this post.|yes|no|
|{block:Lines} | {/block:Lines} | Rendered for each line of this post.|yes|no|
|{block:Label} | {/block:Label} | Rendered if a label was extracted for the current line of this post.|yes|no|
|{Label} | The label (if one was extracted) for the current line of this post.|yes|no|
|{Name} | The username (if one was extracted) for the current line of this post.|yes|no|
|{Line} | The current line of this post.|yes|no|
|{UserNumber} | A unique identifying integer representing the user of the current line of this post.|yes|no|
|{Alt} | "odd" or "even" for each line of this post.|no|no|

###AUDIO POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Caption} | {/block:Caption} | Rendered if there is a caption for this post.|yes|no|
|{Caption} | The caption for this post.|yes|no|
|{block:AudioEmbed} | {/block:AudioEmbed} | Rendered if an embedded audio player is available.|no|no|
|{AudioEmbed} | Embed-code for the content of this post. Defaults to 500-pixels wide.|no|no|
|{AudioEmbed-250} | Embed-code for the content of this post. 250-pixels wide.|no|no|
|{AudioEmbed-400} | Embed-code for the content of this post. 400-pixels wide.|no|no|
|{AudioEmbed-500} | Embed-code for the content of this post. 500-pixels wide.|no|no|
|{AudioEmbed-640} | Embed-code for the content of this post. 640-pixels wide.|no|no|
|{block:AudioPlayer} | {/block:AudioPlayer} | Rendered if a native audio player is available|no|no|
|{AudioPlayer} | Default audio player.|no|no|
|{RawAudioURL} | URL for this post's audio file.iPhone Themes only.|no|no|
|{block:PlayCount} | {/block:PlayCount} | Rendered if there is a play count for the audio.|yes|no|
|{PlayCount} | The number of times this post has been played.|yes|no|
|{FormattedPlayCount} | The number of times this post has been played, formatted with commas.e.g., "12,309"|no|no|
|{PlayCountWithLabel} | The number of times this post has been played, formatted with commas and pluralized labele.g., "12,309 plays"|no|no|
|{block:ExternalAudio} | {/block:ExternalAudio} | Rendered if this post uses an externally hosted MP3.Useful for adding a "Download" link|yes|no|
|{ExternalAudioURL} | The external MP3 URL, if this post uses an externally hosted MP3.|yes|no|
|{block:AlbumArt}{AlbumArtURL}{/block:AlbumArt} | Rendered if this audio file's ID3 info contains album art.|yes|no|
|{block:Artist}{Artist}{/block:Artist} | Rendered if this audio file's ID3 info contains the artist name.|yes|no|
|{block:Album}{Album}{/block:Album} | Rendered if this audio file's ID3 info contains the album title.|yes|no|
|{block:TrackName}{TrackName}{/block:TrackName} | Rendered if this audio file's ID3 info contains the track name.|yes|no|

###VIDEO POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Caption} | {/block:Caption} | Rendered if there is a caption for this post.|yes|no|
|{Caption} | The caption for this post.|yes|no|
|{Video-700} | Embed-code for the content of this post.700-pixels wide.|no|no|
|{Video-500} | Embed-code for the content of this post.500-pixels wide.|no|no|
|{Video-400} | Embed-code for the content of this post.400-pixels wide.|no|no|
|{Video-250} | Embed-code for the content of this post.250-pixels wide.|no|no|
|{VideoEmbed-700} | Same as {Video-700}, but removes the lightbox effect from directly uploaded video.700-pixels wide.|no|no|
|{VideoEmbed-500} | Same as {Video-500}, but removes the lightbox effect from directly uploaded video.500-pixels wide.|no|no|
|{VideoEmbed-400} | Same as {Video-400}, but removes the lightbox effect from directly uploaded video.400-pixels wide.|no|no|
|{VideoEmbed-250} | Same as {Video-250}, but removes the lightbox effect from directly uploaded video.250-pixels wide.|no|no|
|{PlayCount} | The number of times this post has been played.|no|no|
|{FormattedPlayCount} | The number of times this post has been played, formatted with commas.e.g., "12,309"|no|no|
|{PlayCountWithLabel} | The number of times this post has been played, formatted with commas and pluralized labele.g., "12,309 plays"|no|no|
|{block:VideoThumbnail}{VideoThumbnailURL}{/block:VideoThumbnail} | Rendered if there is a video thumbnail available.|no|no|
|{block:VideoThumbnails}{VideoThumbnailURL}{/block:VideoThumbnails} | Rendered for each video thumbnail when there are multiple.|no|no|

###QA POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{Question} | The question for this post.May contain heavily filtered HTML|yes|no|
|{Answer} | The answer for this post.May contain HTML|yes|no|
|{Asker} | Simple HTML text link with the asker's username and URL, or the plain text string "Anonymous".|yes|no|
|{AskerPortraitURL-16} | Portrait photo URL for the asker. 16-pixels by 16-pixels.|yes|no|
|{AskerPortraitURL-24} | Portrait photo URL for the asker. 24-pixels by 24-pixels.|yes|no|
|{AskerPortraitURL-30} | Portrait photo URL for the asker. 30-pixels by 30-pixels.|yes|no|
|{AskerPortraitURL-40} | Portrait photo URL for the asker. 40-pixels by 40-pixels.|yes|no|
|{AskerPortraitURL-48} | Portrait photo URL for the asker. 48-pixels by 48-pixels.|yes|no|
|{AskerPortraitURL-64} | Portrait photo URL for the asker. 64-pixels by 64-pixels.|yes|no|
|{AskerPortraitURL-96} | Portrait photo URL for the asker. 96-pixels by 96-pixels.|yes|no|
|{AskerPortraitURL-128} | Portrait photo URL for the asker. 128-pixels by 128-pixels.|yes|no|
|{block:Answerer}{/block:Answerer} | Rendered if post contains a reblogged answer.|yes|no|
|{Answerer} | Simple HTML text link with the reblogged answerer's username and URL.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-16} | Portrait photo URL for the reblogged answerer. 16-pixels by 16-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.')|yes|no|
|{AnswererPortraitURL-24} | Portrait photo URL for the reblogged answerer. 24-pixels by 24-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-30} | Portrait photo URL for the reblogged answerer. 30-pixels by 30-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-40} | Portrait photo URL for the reblogged answerer. 40-pixels by 40-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-48} | Portrait photo URL for the reblogged answerer. 48-pixels by 48-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-64} | Portrait photo URL for the reblogged answerer. 64-pixels by 64-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-96} | Portrait photo URL for the reblogged answerer. 96-pixels by 96-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{AnswererPortraitURL-128} | Portrait photo URL for the reblogged answerer. 128-pixels by 128-pixels.Only exists within {block:Answerer}{/block:Answerer} | and if post has been reblogged.|yes|no|
|{Replies} | Reblog chain. If not a reblog {Replies} | is an alias for {Answer}|yes|no|

###POST DATE

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Date} | {/block:Date} | Rendered for all posts.Always wrap dates in this block so they will be properly hidden on non-post pages.|no|no|
|{block:NewDayDate} | {/block:NewDayDate} | Rendered for posts that are the first to be listed for a given day.|no|no|
|{block:SameDayDate} | {/block:SameDayDate} | Rendered for subsequent posts listed for a given day.|no|no|
|{DayOfMonth} | "1" to "31"|no|no|
|{DayOfMonthWithZero} | "01" to "31"|no|no|
|{DayOfWeek} | "Monday" through "Sunday"|no|no|
|{ShortDayOfWeek} | "Mon" through "Sun"|no|no|
|{DayOfWeekNumber} | "1" through "7"|no|no|
|{DayOfMonthSuffix} | "st", "nd", "rd", "th"|no|no|
|{DayOfYear} | "1" through "365"|no|no|
|{WeekOfYear} | "1" through "52"|no|no|
|{Month} | "January" through "December"|no|no|
|{ShortMonth} | "Jan" through "Dec"|no|no|
|{MonthNumber} | "1" through "12"|no|no|
|{MonthNumberWithZero} | "01" through "12"|no|no|
|{Year} | "2007"|no|no|
|{ShortYear} | "07"|no|no|
|{AmPm} | "am" or "pm"|no|no|
|{CapitalAmPm} | "AM" or "PM"|no|no|
|{12Hour} | "1" through "12"|no|no|
|{24Hour} | "0" through "23"|no|no|
|{12HourWithZero} | "01" through "12"|no|no|
|{24HourWithZero} | "00" through "23"|no|no|
|{Minutes} | "0" through "59"|no|no|
|{Seconds} | "0" through "59"|no|no|
|{Beats} | "0" through "999"|no|no|
|{Timestamp} | "1172705619"|no|no|
|{TimeAgo} | A contextual time.e.g., "1 minute ago", "2 hours ago", "3 weeks ago", etc.|no|no|

###POST NOTES

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:PostNotes} | {/block:PostNotes} | Rendered on permalink pages if this post has notes.|no|no|
|{PostNotes} | Standard HTML output of this post's notes. Only rendered on permalink pages.|no|no|
|{PostNotes-16} | Standard HTML output of this post's notes with 16x16 sized avatars. Only rendered on permalink pages.|no|no|
|{PostNotes-64} | Standard HTML output of this post's notes with 64x64 sized avatars. Only rendered on permalink pages.|no|no|
|{block:NoteCount} | {/block:NoteCount} | Rendered if this post has notes.Always wrap note counts in this block so they will be properly hidden on non-post pages.|no|no|
|{NoteCount} | The number of this post's notes.|yes|no|
|{NoteCountWithLabel} | The number of this post's notes with pluralized label.e.g., "24 notes"|no|no|

###POST TAGS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:HasTags} | {/block:HasTags} | Rendered inside {block:Posts} | if post has tags.|no|no|
|{block:Tags} | {/block:Tags} | Rendered for each of a post's tags.|yes|yes|
|{Tag} | The name of this tag.|yes|yes|
|{URLSafeTag} | A URL safe version of this tag.|no|no|
|{TagURL} | The tag page URL with other posts that share this tag.|yes|yes|
|{TagURLChrono} | The tag page URL with other posts that share this tag in chronological order.|yes|no|

###POST SOURCE

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:ContentSource} | {/block:ContentSource} | Rendered if a source is specified for a post's content.|yes|no|
|{SourceURL} | URL of the attributed source.|yes|no|
|{block:SourceLogo} | {/block:SourceLogo} | Rendered if a logo exists for the content source.|yes|no|
|{BlackLogoURL} | URL of the source's logo.|yes|no|
|{LogoWidth} | Width of the source's logo.|yes|no|
|{LogoHeight} | Height of the source's logo.|yes|no|
|{SourceTitle} | Title of the content source.|yes|no|
|{block:NoSourceLogo} | {/block:NoSourceLogo} | Rendered if no source logo exists.|no|no|

###SUBMITTED POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Submission} | {/block:Submission} | Rendered if a post is a submission.|yes|no|
|{Submitter} | The name of the submitting blog.|yes|no|
|{SubmitterURL} | URL to submitter's blog.|yes|no|
|{SubmitterPortraitURL-16} | Portrait photo URL for the submitter. 16-pixels by 16-pixels.|yes|no|
|{SubmitterPortraitURL-24} | Portrait photo URL for the submitter. 24-pixels by 24-pixels.|yes|no|
|{SubmitterPortraitURL-30} | Portrait photo URL for the submitter. 30-pixels by 30-pixels.|yes|no|
|{SubmitterPortraitURL-40} | Portrait photo URL for the submitter. 40-pixels by 40-pixels.|yes|no|
|{SubmitterPortraitURL-48} | Portrait photo URL for the submitter. 48-pixels by 48-pixels.|yes|no|
|{SubmitterPortraitURL-64} | Portrait photo URL for the submitter. 64-pixels by 64-pixels.|yes|no|
|{SubmitterPortraitURL-96} | Portrait photo URL for the submitter. 96-pixels by 96-pixels.|yes|no|
|{SubmitterPortraitURL-128} | Portrait photo URL for the submitter. 128-pixels by 128-pixels.|yes|no|

###GROUP POST

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:GroupMembers} | {/block:GroupMembers} | Rendered on additional public group blogs.|yes|no|
|{block:GroupMember} | {/block:GroupMember} | Rendered for each additional public group blog member.|yes|no|
|{GroupMemberName} | The username of the member's blog.|yes|no|
|{GroupMemberTitle} | The title of the member's blog.|yes|no|
|{GroupMemberURL} | The URL for the member's blog.|yes|no|
|{GroupMemberPortraitURL-16} | Portrait photo URL for the member. 16-pixels by 16-pixels.|yes|no|
|{GroupMemberPortraitURL-24} | Portrait photo URL for the member. 24-pixels by 24-pixels.|yes|no|
|{GroupMemberPortraitURL-30} | Portrait photo URL for the member. 30-pixels by 30-pixels.|yes|no|
|{GroupMemberPortraitURL-40} | Portrait photo URL for the member. 40-pixels by 40-pixels.|yes|no|
|{GroupMemberPortraitURL-48} | Portrait photo URL for the member. 48-pixels by 48-pixels.|yes|no|
|{GroupMemberPortraitURL-64} | Portrait photo URL for the member. 64-pixels by 64-pixels.|yes|no|
|{GroupMemberPortraitURL-96} | Portrait photo URL for the member. 96-pixels by 96-pixels.|yes|no|
|{GroupMemberPortraitURL-128} | Portrait photo URL for the member. 128-pixels by 128-pixels.|yes|no|

###POST AUTHOR

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{PostAuthorName} | The username of the author of a post to an additional group blog.|yes|no|
|{PostAuthorTitle} | The title of the author's blog for a post to an additional group blog.|yes|no|
|{PostAuthorURL} | The blog URL for the author of a post to an additional group blog.|yes|no|
|{PostAuthorPortraitURL-16} | The portrait photo URL for the author of a post to an additional group blog. 16-pixels by 16-pixels.|yes|no|
|{PostAuthorPortraitURL-24} | The portrait photo URL for the author of a post to an additional group blog. 24-pixels by 24-pixels.|yes|no|
|{PostAuthorPortraitURL-30} | The portrait photo URL for the author of a post to an additional group blog. 30-pixels by 30-pixels.|yes|no|
|{PostAuthorPortraitURL-40} | The portrait photo URL for the author of a post to an additional group blog. 40-pixels by 40-pixels.|yes|no|
|{PostAuthorPortraitURL-48} | The portrait photo URL for the author of a post to an additional group blog. 48-pixels by 48-pixels.|yes|no|
|{PostAuthorPortraitURL-64} | The portrait photo URL for the author of a post to an additional group blog. 64-pixels by 64-pixels.|yes|no|
|{PostAuthorPortraitURL-96} | The portrait photo URL for the author of a post to an additional group blog. 96-pixels by 96-pixels.|yes|no|
|{PostAuthorPortraitURL-128} | The portrait photo URL for the author of a post to an additional group blog. 128-pixels by 128-pixels.|yes|no|

###DAY PAGE

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:DayPage} | {/block:DayPage} | Rendered on day pages.|no|no|
|{block:DayPagination} | {/block:DayPagination} | Rendered if there is a "previous" or "next" day page.|no|no|
|{block:PreviousDayPage} | {/block:PreviousDayPage} | Rendered if there is a "previous" day page to navigate to.|no|no|
|{block:NextDayPage} | {/block:NextDayPage} | Rendered if there is a "next" day page to navigate to.|no|no|
|{PreviousDayPage} | URL for the "previous" day page.|no|no|
|{NextDayPage} | URL for the "next" day page.|no|no|

###TAG PAGE

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:TagPage} | {/block:TagPage} | Rendered on tag pages.|no|no|
|{Tag} | The name of this tag.|no|no|
|{URLSafeTag} | A URL safe version of this tag.|no|no|
|{TagURL} | The tag page URL with other posts that share this tag.|no|no|
|{TagURLChrono} | The tag page URL with other posts that share this tag in chronological order.|no|no|

###SEARCH PAGE

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{SearchQuery} | The current search query.|no|no|
|{URLSafeSearchQuery} | A URL-safe version of the current search query for use in links and Javascript.|no|no|
|{block:SearchPage} | Rendered on search pages.|no|no|
|{SearchResultCount} | The number of results returned for the current search query.|no|no|
|{block:NoSearchResults} | Rendered if no search results were returned for the current search query.|no|no|

###FOLLOWS

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Following} | {/block:Following} | Rendered if you're following other blogs.|yes|no|
|{block:Followed} | {/block:Followed} | Rendered for each blog you're following.|yes|no|
|{FollowedName} | The username of the blog you're following.|yes|no|
|{FollowedTitle} | The title of the blog you're following.|yes|no|
|{FollowedURL} | The URL for the blog you're following.|yes|no|
|{FollowedPortraitURL-16} | Portrait photo URL for the blog you're following. 16-pixels by 16-pixels.|yes|no|
|{FollowedPortraitURL-24} | Portrait photo URL for the blog you're following. 24-pixels by 24-pixels.|yes|no|
|{FollowedPortraitURL-30} | Portrait photo URL for the blog you're following. 30-pixels by 30-pixels.|yes|no|
|{FollowedPortraitURL-40} | Portrait photo URL for the blog you're following. 40-pixels by 40-pixels.|yes|no|
|{FollowedPortraitURL-48} | Portrait photo URL for the blog you're following. 48-pixels by 48-pixels.|yes|no|
|{FollowedPortraitURL-64} | Portrait photo URL for the blog you're following. 64-pixels by 64-pixels.|yes|no|
|{FollowedPortraitURL-96} | Portrait photo URL for the blog you're following. 96-pixels by 96-pixels.|yes|no|
|{FollowedPortraitURL-128} | Portrait photo URL for the blog you're following. 128-pixels by 128-pixels.|yes|no|

###LIKES

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Likes} | {/block:Likes} | Rendered if you are sharing your likes.|no|no|
|{Likes} | Standard HTML output of your likes.|no|no|
|{Likes limit="5"} | Standard HTML output of your last 5 likes.Maximum: 10
|{Likes width="200"} | Standard HTML output of your likes with Audio and Video players scaled to 200-pixels wide.Scale images with CSS max-width or similar.|no|no|
|{Likes summarize="100"} | Standard HTML output of your likes with text summarized to 100-characters.Maximum: 250

###LIKE BUTTON?

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{LikeButton} | Default Like button.|no|no|
|{LikeButton color="grey"} | Like button color.Grey, White, or Black. Like button will always be red if visitor has liked the post.|no|no|
|{LikeButton size="20"} | Like button size.Maximum: 100|no|no|

###REBLOG BUTTON

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{ReblogButton} | Default Reblog button.|no|no|
|{ReblogButton color="grey"} | Reblog button color.Grey, White, or Black.|no|no|
|{ReblogButton size="20"} | Reblog button size.Maximum: 100|no|no|

###TWITTER

|Tag|Description|Supported|Exists in Example Content|
|---|---|---|---|
|{block:Twitter} | {/block:Twitter} | Rendered if you have Twitter integration enabled.|no|no|
|{TwitterUsername} | Your Twitter username.|no|no|


###PREFIXES

|Prefix|Supported|Exists in Example Content|
|---|---|---|
|Plaintext Prefix any theme variable with Plaintext to output the string with HTML-tags stripped and appropriate characters converted to HTML-entities so they’re safe to include in HTML attributes, etc.|no|
|Javascript Prefix any theme variable with JS to output a Javascript string (wrapped in quotes).|no|
|Javascript Plaintext Prefix any theme variable with JSPlaintext to output a Javascript string (wrapped in quotes) with HTML-tags stripped and appropriate characters converted to HTML-entities.|no|
|URLEncoded Prefix any theme variable with URLEncoded to output a URL encoded string.|no|
|RGB Prefix a color variable with RGB to convert the hex output to RGB.|no|
