Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E419004E
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755267603; cv=none; b=F9hZuRKeIAy4cII7PtPB4VztnYpI9s6NcStshAA4m8sO0fqjChOmiQcD4OcmcjSb8H9m1vFWxTz2Dtypt4RY29gDN/queLGYKN9Z7jIQiRxaBDvIIVEAyaUwVbwi10v6d9x8inCwIdCyXcieGI+HeahD/bgfajD+r0X6vRoeeg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755267603; c=relaxed/simple;
	bh=QGvfVWzHBTfWclAZOwAE767S8vMtX7qZcgo6CTnG7JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NT/ZHB60coMFmsh4XFHMlXIz9b5FU2TfoDtQL8ifaAgkrK6DuSNZ5gb6JcwNLCu0OCjTgjYJgCYvM8SXdRzTcg+2bMslTw1WTHWXDh/O9ujVeT5GlH+r9cCwYhpM3N2QoNt4VdlHP9b2NIFZULFo2p6URhEBpO9fHeqKG9ditSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m8Ch7K4p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m8Ch7K4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312FDC4CEEB;
	Fri, 15 Aug 2025 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755267602;
	bh=QGvfVWzHBTfWclAZOwAE767S8vMtX7qZcgo6CTnG7JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8Ch7K4pBSo4/wAFeU8fPu1WLQjON+WokTEDtb1er3MNag1VYOGS/rcvOAQ2cObXy
	 6zgpXHn+rt0E1RRPv2LbjYyWg79Wmq85H+9kkUUomut9leR6fFizf7/hJL6Le5gIHc
	 yEKOGihimj8Lqw/FJBtGVrfi38avAZvVRAEKwsM4=
Date: Fri, 15 Aug 2025 16:19:59 +0200
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
Message-ID: <2025081505-facial-cyclic-af25@gregkh>
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
 <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
 <2025081448-creation-timid-b972@gregkh>
 <DC2BPSUKOWAX.2QTWBJM1ZQPJ3@kernel.org>
 <2025081435-broker-valium-7b22@gregkh>
 <DC2TOYQG9QEI.2TZ4GFFZGF05W@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC2TOYQG9QEI.2TZ4GFFZGF05W@kernel.org>

On Fri, Aug 15, 2025 at 09:28:59AM +0200, Benno Lossin wrote:
> On Thu Aug 14, 2025 at 8:26 PM CEST, Greg KH wrote:
> > On Thu, Aug 14, 2025 at 07:23:45PM +0200, Benno Lossin wrote:
> >> On Thu Aug 14, 2025 at 5:42 PM CEST, Greg KH wrote:
> >> > On Thu, Aug 14, 2025 at 05:22:57PM +0200, Benno Lossin wrote:
> >> >> On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
> >> >> > On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
> >> >> >> I didn't have too much time to spend on this API, so this is mostly a
> >> >> >> resend of v3. There are some changes in the last commit, updating to the
> >> >> >> latest version of Alice's iov_iter patche series [1] & rebasing on top
> >> >> >> of v6.17-rc1.
> >> >> >> 
> >> >> >> I think we should just merge the first two patches this cycle in order
> >> >> >> to get the initial, bare-bones API into the kernel and have people
> >> >> >> experiment with it. The validation logic in the third patch still needs
> >> >> >> some work and I'd need to find some time to work on that (no idea when I
> >> >> >> find it though).
> >> >> >
> >> >> > Nice, thanks for reviving this!
> >> >> >
> >> >> > And we should at least add an example using it, otherwise it's not going
> >> >> > to help out much here.  Add it to the misc device driver api?
> >> >> 
> >> >> You mean `rust/kernel/miscdevice.rs`? What parts of that API are
> >> >> untrusted? 
> >> >
> >> > mmap() is, but you can't do anything about that...
> >> 
> >> Which parameter is untrusted there and why can't I do anything about it?
> >
> > The whole memory range is untrusted as to what is written there, sorry,
> > it was a bad attempt at a joke, the kernel never gets a chance to know
> > what is happening.
> 
> Ahh that flew over my head :) So we'd either build `Untrusted` directly
> into the `VmaNew`/`VmaRef` abstractions -- or if there is a way to have
> a trusted `VmaNew`, we can wrap it in `mmap`.

Nah, I wouldn't worry about that, mmap() doesn't seem to cause security
issues as by definition it is just allowing userspace to read/write
anything to that device or memory, and the kernel doesn't even see it.
Because of that, the kernel can't really be "broken" with invalid data
there (hardware can, of course, but that's userspace's fault the kernel
is just setting up a pipe here.)

> >> If so we probably
> >> should have a single parameter so users can verify them at the same
> >> time. Or am I thinking of the wrong thing to verify? (`file` should be
> >> already in kernel memory, right?)
> >
> > Both are usually verified at different places, first `cmd` tells what
> > `arg` is going to be, and then the code goes off and parses whatever
> > `arg` points to (or contains for simple ioctls).
> >
> > And for some, `arg` is just a place to write something back, so `arg`
> > needs no verification for them, it depends on what `cmd` is.
> 
> I still think grouping them together makes sense, since in the
> validation function you'd want access to both, right? And these use
> cases seem perfect for enums:
> 
>     enum MyIoctlArgs {
>         WriteFoo(UserPtr<Foo>),
>         VerifyBar(UserPtr<Bar>),
>         // ...
>     }
> 
> And then in the validation function you can do:
> 
>     const WRITE_FOO_CMD: u32 = ...;
> 
>     fn validate(cmd: u32, arg: usize) -> Result<MyIoctlArgs> {
>         Ok(match cmd {
>             WRITE_FOO_CMD => MyIoctlArgs::WriteFoo(UserPtr::from_addr(arg)),
>             VERIFY_BAR_CMD => MyIoctlArgs::VerifyBar(UserPtr::from_addr(arg)),
>             _ => return Err(EINVAL),
>         })
>     }
> 
> So when wrapping them together we could have:
> 
>     pub struct IoctlArgs {
>         pub cmd: u32,
>         pub arg: usize,
>     }
> 
> And then change the `MiscDevice::ioctl` function to:
> 
>     fn ioctl(
>         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
>         _file: &File,
>         _args: Untrusted<IoctlArgs>,
>     ) -> Result<isize>

I think the problem with this is you now end up with the "I verified
this is ok, so now I will copy it" bug, where userspace will race with
the kernel and modify the data after verification but before copying.

Note, Windows is full of these types of bugs as they don't do a call to
copy_from_user(), but usually just poke at the data directly.  Linux at
least forces a copy_from_user() call, but it doesn't always work in that
you still have to validate the data is correct and people forget.

So as long as we can copy the data from userspace first, and then
validate it, and keep that validated copy around to use, that's great.
I can't really determine above if that is the case or not, sorry.

thanks,

greg k-h
