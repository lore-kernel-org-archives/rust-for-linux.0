Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7297425B0A4;
	Sun, 12 Jul 2026 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783839701; cv=none; b=Bb0ucf4hQsaL1bvmDy+egjbo6jS33obK8yt+9S6fgVHv8kvriTiivW14s6+ahyvw/GOGsUSoAf79XRIftpEOhsUV/3c57XN7hsAq5S5p6f+4e5xmhtzCz4EmrIYk1l+aaDfmD+WFC0mUgp9mxb/M9MqyJ2LfBv0PEfXzSLVdKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783839701; c=relaxed/simple;
	bh=Nsos5ruO9YkOqEDwpItWLMWEcA2Q2CwV8AXcq55jLeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY5f26jArB0y+I3+sdah3krQqV9d0Afjyz2xIWWVM0Q/xtMWIGM3vHGoJH1YjYfEMUse+BAI/N4KzLZspYUFdIVyqeBhwBV4CocUaXn+Xu+pJvrqQusWAjmvSLwNDLqCECNSWdDBB7IV5qLu66sNflY+cxjkqUH5oaDsSxk2LhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iyCx+umr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iyCx+umr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E09D1F000E9;
	Sun, 12 Jul 2026 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783839700;
	bh=KxQD+Jq9v474nnMTGNRACtLziLSnyet/LHxEVBTuOK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iyCx+umrsBUdNxFD5a00pUr3SXs6RxGkLognEvQFgYfNdGnVZQJISYwlGt2/lqYPR
	 S9zMGxfZyBq2yGk+Kv7kVoxxLwnqA7LxWd74hWnKe7JszG6WP5uSuaY7pHufFe+0+4
	 8GkSNbup6zBtgXI74L3HIUQ3d88fZfc22wuJD6aA=
Date: Sun, 12 Jul 2026 09:00:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jahnavi Nitheesha Mandava <jahnavimn@google.com>,
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
Subject: Re: [PATCH v2 0/7] rust_binder : Implement dynamic debug logging mask
Message-ID: <2026071234-untidy-ruined-c98d@gregkh>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <2026071046-musty-subfloor-53ec@gregkh>
 <CA+ba3EP9PO3ccBu1VK53WeR_2cT9MaGC_5dPcy9QKnvHBXX5fA@mail.gmail.com>
 <CAH5fLghOSPYA+uYmUB18VfPhc9PtDWaH0Khc=7EAN7DQt=8L4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghOSPYA+uYmUB18VfPhc9PtDWaH0Khc=7EAN7DQt=8L4w@mail.gmail.com>

On Sat, Jul 11, 2026 at 12:42:11PM +0200, Alice Ryhl wrote:
> On Sat, Jul 11, 2026 at 12:29 PM Jahnavi Nitheesha Mandava
> <jahnavimn@google.com> wrote:
> >
> > On Fri, Jul 10, 2026 at 8:31 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jul 10, 2026 at 02:32:51PM +0000, Jahnavi MN via B4 Relay wrote:
> > > > When a user-space application sends malformed data or makes a
> > > > lifecycle mistake, the driver rejects it with a generic error code
> > > > (like -EINVAL). Without internal logs, the driver acts as a
> > > > "black box," forcing developers to guess which check failed.
> > > >
> > > > In the legacy C Binder driver, this issue is solved using a dynamic
> > > > debug_mask module parameter that toggles verbose logs for specific
> > > > subsystems. This series brings the same critical capability to the
> > > > Rust Binder driver to provide developers with clear, real-time
> > > > feedback.
> > > >
> > > > Instead of rebuilds, reboots, or guessing:
> > > > - Developers can enable logs instantly on a running device by writing to
> > > >   `/sys/module/rust_binder/parameters/debug_mask`.
> > > > - It prints the exact reason for failures (such as alignment errors,
> > > >   mismatched call stacks, or invalid handle references) directly into
> > > >   `dmesg`, reducing debugging time from hours to seconds.
> > > > - It protects system logs by keeping logging off by default and only
> > > >   enabling it when developers are actively troubleshooting.
> > > >
> > > > Based on top of:
> > > > https://lore.kernel.org/rust-for-linux/20260707-upgrade-poll-v6-0-4b8fae7bf1d9@google.com/
> > > >
> > > > Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> > >
> > > Patches 5 and 7 did not apply to my tree, can you rebase against the
> > > char-misc-testing branch and send just those?  Other ones are now all
> > > queued up, nice work!
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > Thanks! I will rebase and resubmit only patches 5 and 7 as a new
> > version (v3) of this series shortly.
> >
> > Regarding the feedback I received on Patch 1 (using the BIT macro
> > and Atomic<u32>), since Patch 1 is already queued, I will send those
> > cleanups as a separate, follow-up patch. Does that sound good?
> 
> Since it's only queued in char-misc-testing and not char-misc-next, I
> don't think it's too late to change the patches themselves. So I guess
> you could also resend the entire series based on top of commit
> f8d269390cd2 ("rust_binder: update Process::node_refs to use
> SpinLock") from testing?

Yes, I messed up the application of this series to my tree as Alice
pointed out in another email.  If you could just rebase and resend a new
version, that would be great.

thanks,

greg k-h
