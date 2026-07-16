Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E4234994;
	Thu, 16 Jul 2026 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181945; cv=none; b=PQlI2ZaxjC3kNk25VUcLXRZb1/s7dfKyZajlnPgnSBG2anDzJpW+wKTsWyl7H5broxVPe0ad5FTeAjlWJmgc2/ngOhMzrVymzRP3b3okJC4PNPYcC/5IuW7LQt5GWE8rM/+8dt/qgBsybOgfAVx++2UDJ1aJRzci4ZN0RKG/PU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181945; c=relaxed/simple;
	bh=bR6WVAsahFMmtPiCbnu98hpSD1IPdjtDFnemb0OJ2Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/eKBH9VCOMNYF2OfV4E/3Hhg76RngsEiSifze2G6KUvWCeO9toHJ4djNK/H6z+kCZmxrIwzw2qTkxQVNutL0LR02i889asIS7OeC/vsHyN7KkzIgqeYOrd3iXpzbJMWO6A5cwXpsw3VmzzvdVtps5gebGhUc0PV7JRW4fxTu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t9jHxyFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t9jHxyFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE451F000E9;
	Thu, 16 Jul 2026 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784181943;
	bh=oTXNHGJMAll/a3CZ/dTJS0+/07UHSM/QlrTdQWy5Y3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t9jHxyFk9gWevapmmJb6PXP2pOJG4gNWAvXCTvW8W3NBJZ8Qw5h3+XkQjEqu+AL3e
	 VTowVmmX9L+pLTciuZbPVYm49jh8piYVpAGBaJEWRiXwiH90DyYwsoYIDB4vYa6oYH
	 6yNVXQoc6TSRs4hXvX9lYSxuL/NiTRSFMndYB5zA=
Date: Thu, 16 Jul 2026 08:04:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: jahnavimn@google.com,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/7] rust_binder : Implement dynamic debug logging mask
Message-ID: <2026071634-democracy-elves-5686@gregkh>
References: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
 <ald6JiykrvSDxzWj@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ald6JiykrvSDxzWj@google.com>

On Wed, Jul 15, 2026 at 12:16:38PM +0000, Alice Ryhl wrote:
> On Mon, Jul 13, 2026 at 12:35:22PM +0000, Jahnavi MN via B4 Relay wrote:
> > base-commit: f8d269390cd2a7a9fb5a31f153e7c7b709defea0
> 
> Greg, a quick practical question. This doesn't apply anymore because of
> the merge commit, and it actually also has a conflict with the fix
> "rust_binder: only print failure if error has source". (Both conflicts
> are in the same chunk of code.)
> 
> The rebase of this series that I'm currently using for my development is
> this one:
> https://github.com/Darksonn/linux/commits/rust-binder-base/
> 
> That rebase happens to fix the conflict with the merge commit in a way
> that implicitly fixes the same issue as "rust_binder: only print failure
> if error has source". So with that rebase, the fix patch is only
> relevant for 7.2 and the stable backports. (i.e. merge conflict fix is
> to keep char-misc-next side)
> 
> Do you want a resend of this that looks like that?

Yes please send a new series that I can actually apply.

> As for my other series, the netlink series [1] applies cleanly on
> char-misc-next both before and after applying the debug mask changes (or
> at least, they cherry-pick cleanly after 'git am'ing on the original
> base commit).

Are they ready to be applied?  If so, I'll pick them up.

> And the ratelimited printing [2] and synchronize_rcu() series [3] both
> need new versions with changes, but I'd like to base them on top of the
> debug mask and netlink patchsets.

No problems, just send those again too please.

thanks,

greg k-h
