Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D182178F2B
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196021; cv=none; b=YK4t4QbU5fBaodOzDcOMkFjQmBaniesK0txaIsypDmKCaLnpR8CHaZ/yIV0ky+RHOGYwYlNskOzVU2nmyyM93RxHAfmf5R2w2jDlGnHE5ROMDNYcWcxUgHRYnOhCtzeZ+B9nxIPyvqZASyK5PikLSaq2aieJILghjyNPHQL9QeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196021; c=relaxed/simple;
	bh=JkBThSuYBCeGcbsIDoSX+/A/yMFC3KXC/p6bYfxrqXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiCNXZQ6K0+zSRnoCP+DG/02G/Mw2rbtUzeSwwDMjI+5KqHg7utQowBnQ7jF4jgCr6c53L4mqzHQRULbVS/MjvXAw4KnyRaLNJgpJj+YHkD8rTCBG0nquTb0elSA1oCyLRcels1x8SGEGOE1jI021Hlo9iUVYgqrDL8LK98YxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0OLUEc7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0OLUEc7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAA1C4CEED;
	Thu, 14 Aug 2025 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755196020;
	bh=JkBThSuYBCeGcbsIDoSX+/A/yMFC3KXC/p6bYfxrqXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0OLUEc7QHllhz5iPZJLWm4vZRLQNAcz6HJRsnkOG/Ebo3notX5y377B9xU1JSZifx
	 fNnwiCKfBjPywXl7a+9ZodQRuygvFQP+J21Zu8/gvn60/3TOthAv192tQt+OhQ+p1a
	 aRbuMOkmwuzTqbmS7DcbCDZqqnF511QSYDACyLbE=
Date: Thu, 14 Aug 2025 20:26:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Untrusted Data API
Message-ID: <2025081435-broker-valium-7b22@gregkh>
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
 <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
 <2025081448-creation-timid-b972@gregkh>
 <DC2BPSUKOWAX.2QTWBJM1ZQPJ3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC2BPSUKOWAX.2QTWBJM1ZQPJ3@kernel.org>

On Thu, Aug 14, 2025 at 07:23:45PM +0200, Benno Lossin wrote:
> On Thu Aug 14, 2025 at 5:42 PM CEST, Greg KH wrote:
> > On Thu, Aug 14, 2025 at 05:22:57PM +0200, Benno Lossin wrote:
> >> On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
> >> > On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
> >> >> I didn't have too much time to spend on this API, so this is mostly a
> >> >> resend of v3. There are some changes in the last commit, updating to the
> >> >> latest version of Alice's iov_iter patche series [1] & rebasing on top
> >> >> of v6.17-rc1.
> >> >> 
> >> >> I think we should just merge the first two patches this cycle in order
> >> >> to get the initial, bare-bones API into the kernel and have people
> >> >> experiment with it. The validation logic in the third patch still needs
> >> >> some work and I'd need to find some time to work on that (no idea when I
> >> >> find it though).
> >> >
> >> > Nice, thanks for reviving this!
> >> >
> >> > And we should at least add an example using it, otherwise it's not going
> >> > to help out much here.  Add it to the misc device driver api?
> >> 
> >> You mean `rust/kernel/miscdevice.rs`? What parts of that API are
> >> untrusted? 
> >
> > mmap() is, but you can't do anything about that...
> 
> Which parameter is untrusted there and why can't I do anything about it?

The whole memory range is untrusted as to what is written there, sorry,
it was a bad attempt at a joke, the kernel never gets a chance to know
what is happening.

> > ioctl() is the callback that is taking untrusted data from userspace.
> > That's one place we have had more kernel buffer overflows then I can
> > count and ALWAYS needs to be properly verified before anything can be
> > done with the data there.
> 
> Are the `cmd` & `arg` parameters the untrusted part?

Yes, especially as `arg` is usually a pointer to "something".

> If so we probably
> should have a single parameter so users can verify them at the same
> time. Or am I thinking of the wrong thing to verify? (`file` should be
> already in kernel memory, right?)

Both are usually verified at different places, first `cmd` tells what
`arg` is going to be, and then the code goes off and parses whatever
`arg` points to (or contains for simple ioctls).

And for some, `arg` is just a place to write something back, so `arg`
needs no verification for them, it depends on what `cmd` is.

thanks,

greg k-h
