Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAB23B0;
	Fri, 24 Jan 2025 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717728; cv=none; b=DuUWx31esJu0U/gKD5AgbEiYjcvYDmS9koBOMXieScsr+k5PMC2vTzXq2osZl6fnsvd2QKW2nyTIA9UbZ5hblFh1VVuM5MI7ELoaVVrv9fjRnjQFdaaxY5MbnN/up3YQHVvRMShm3yv1NH7l9IPZ78VRaiZDNUiF1wa+XygeyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717728; c=relaxed/simple;
	bh=WkWPNaeQshJCyE/rkwYSz1hru46Yvp15v9gJmB/mZ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2zGjuhp9fQuYjJKpAJRYbcYAifHI5DYxluz8aRPMqfy2yyBb2UPygaJu7iGCPQrxeG37SadBRYu0CsYOO/AaCIOLh3CXSkM1asMVyLhcgsgJi/3sbEZXeSfr8AaUQ4swAqSIrqqvXtV6von96tA70RAYZHH7QoMS4wMZxktDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fGp8+VHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fGp8+VHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE39C4CED2;
	Fri, 24 Jan 2025 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737717727;
	bh=WkWPNaeQshJCyE/rkwYSz1hru46Yvp15v9gJmB/mZ9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGp8+VHOpaJFZvrfbMP2IY5SKIoaXzDw5a2G4lMzkgoD1S+frrWkP3WleMqOAubeN
	 0BKSm52t2oqcyL0++UZ2iHrOzPtPCDo/CjOaUTdX+fuaUsWknpfH+Vw94a8TPFYweZ
	 rgfGpxEAfg/k4PV+/E2ZHM7vlcPVpHMuegJpAXgg=
Date: Fri, 24 Jan 2025 12:22:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
	Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
Message-ID: <2025012401-paradox-hypnoses-b717@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
 <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com>
 <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>
 <2025012418-legwork-chug-f08c@gregkh>
 <CAH5fLggCLSRfiAGnb9ZDRdUsMrBxWDjbVSxVqtdduDi5D1vQtA@mail.gmail.com>
 <2025012443-music-fester-b33e@gregkh>
 <CAH5fLgizP9YQZrDfpG2QW6nP_VV7SfQ1uG2LrBGeYnzv31n1LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgizP9YQZrDfpG2QW6nP_VV7SfQ1uG2LrBGeYnzv31n1LA@mail.gmail.com>

On Fri, Jan 24, 2025 at 11:39:23AM +0100, Alice Ryhl wrote:
> On Fri, Jan 24, 2025 at 11:34 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jan 24, 2025 at 10:42:53AM +0100, Alice Ryhl wrote:
> > > On Fri, Jan 24, 2025 at 9:06 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Jan 24, 2025 at 08:29:38AM +0100, Alice Ryhl wrote:
> > > > > On Thu, Jan 23, 2025 at 6:57 PM Christian Schrefl
> > > > > <chrisi.schrefl@gmail.com> wrote:
> > > > > >
> > > > > > Hi Alice
> > > > > >
> > > > > > On 21.01.25 4:40 PM, Alice Ryhl wrote:
> > > > > > > On Sun, Jan 19, 2025 at 11:11 PM Christian Schrefl
> > > > > > > <chrisi.schrefl@gmail.com> wrote:
> > > > > > >>
> > > > > > >> Share the mutex stored in RustMiscDevice between all instances using an Arc
> > > > > > >> and the RegistrationData of MiscDeviceRegistration.
> > > > > > >>
> > > > > > >> This is mostly to Demonstrate the capability to share data in this way.
> > > > > > >>
> > > > > > >> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> > > > > > >
> > > > > > > This change causes all open files to share the same value, instead of
> > > > > > > it being per-fd.
> > > > > >
> > > > > > I know, if that is unwanted I'm fine with dropping this patch,
> > > > > > it is mostly here to show how patch 2 can be used.
> > > > >
> > > > > Perhaps instead of changing the per-fd value, we could add a new
> > > > > shared value? E.g., it could have a counter for the number of open
> > > > > files.
> > > >
> > > > Counters don't work, sorry (think about dup() for file handles), please,
> > > > either make it per-file handle, or a "global" thing for the specific
> > > > object, don't attempt to count open/release calls, the vfs does this for
> > > > us already.
> > >
> > > I mean, it's just for an example, shrug. It could also be another
> > > ioctl that updates the shared value.
> >
> > Sure, but the number of times I've seen sample code copied into "real"
> > code is way too high.  Also, getting people to stop thinking they even
> > can count the number of open file handles is a good idea as that's an
> > extremely common "anti-pattern" in way too many drivers even today (i.e.
> > if you try to count open calls, or even restrict the number of open
> > calls to attempt some sort of control, you're doing it totally wrong.)
> 
> Fair point. Do you have good ideas for some data we could put in the
> data shared by all instances of the file?

"shared_cookie"?  Read/write and let readers and writers access it.  But
I thought that was what the misc example did already, but I might be
getting confused here, it's been a while since I looked at the code,
sorry.


greg k-h
