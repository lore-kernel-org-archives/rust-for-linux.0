Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0A153502
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541543; cv=none; b=jjf2yJobJd1X64HwJFMeFvbsLlw/OFDXCzrBTRQMnSMyX5VUR9dEh0VW6laY7s/Fzu+XeKqYen1Gz4ixDQpVwDs5BR1y14owcJL9+9PPVHRlj3BV+Im/nq3RcNxlteu5iBN9H24Q2qwgX2RO1YqL4onzu3PqEkcbTjs7LXkofHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541543; c=relaxed/simple;
	bh=EYygLsLDvgnACIGgpSFkdCs0LCr2CbgD4gYlGqZiZVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFoxqIHyVl/7AYFkI2SETH6oxbpc3wKYTV4NE6Sblt3Te/9jIc/r+q179tLG/71kyPcO/97Oqpc1F4lG3fSK/M+zj4V6Wha9WxYwll9GLGSsLCFr7Yq+tnN83gAVXgRnGILNT0tD2RMWOe//EaPq6RtloFSAwsJMa/pBBk0huXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1OR8O4Tz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1OR8O4Tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6DFC433C7;
	Mon, 29 Jan 2024 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706541543;
	bh=EYygLsLDvgnACIGgpSFkdCs0LCr2CbgD4gYlGqZiZVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1OR8O4TzRT69Fz0vMMVcrEyBOlcfG7yB/V85T+nKW4NtSQQa/rLJCXe4l2IWOKhSc
	 8ZEyl3iZaTDxlXkPRUuv+HK7gS3dm4o6mno3NBgmu0TqcjdqYLEN4UFfs4tZNkHidH
	 LGqf2vLqp6e33pJhWluB2B/kRuebcpmBwt/2jPxI=
Date: Mon, 29 Jan 2024 07:19:02 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Obei Sideg <linux@obei.io>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
	"a.hindborg@samsung.com" <a.hindborg@samsung.com>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"benno.lossin@proton.me" <benno.lossin@proton.me>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
Message-ID: <2024012945-chrome-hamstring-6784@gregkh>
References: <20240129064519.7137-1-linux@obei.io>
 <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>

On Mon, Jan 29, 2024 at 06:45:27AM +0000, Obei Sideg wrote:
> Currently `ForeignOwnable::from_foreign()` only works for non-null
> pointers for the existing impls (e.g. Box, Arc). It may create a few
> duplicate code like:
> 
> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   unsafe { Some(Self::from_foreign(ptr)) }
> }
> ```
> 
> Adding a `try_from_foreign()` method that will return `None` if `ptr`
> is null, otherwsie return `Some(from_foreign(ptr))`.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1057
> Signed-off-by: Obei Sideg <linux@obei.io>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/types.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
