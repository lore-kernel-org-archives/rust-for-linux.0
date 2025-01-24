Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E93C00;
	Fri, 24 Jan 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705990; cv=none; b=gW62K71gaKg3y869Bcdpb66JEttJVRZzVLR4bU7tWymxctElxQV/ViTe8/TwJljMkRrGmxTm3q5328VcsdiKI0ZW1+HlcyHJL93P5kLlIZeaVka9C6IMlu4XizcKZnCGFxQYVaIcx/tEm8oDz8tvpKwtXgQDSXPKjQ5gqI7ty/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705990; c=relaxed/simple;
	bh=NVbKZI9Ivcge6Y839I7o27LpjqJYIja2PGfb3uW13IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoLo6rJHKNm/HWcj3+Ypv7hkrxmXzUx9ZtwbhwJx/jZu8I7JtT5DFwcu1FsmFGeDmHrt0ainn+DB0/KNsAk6zE/O4qwC5B7yUVlzgxkzaNK9ZA/h16FWC2VhAVJ4MS0vhm7ac2yTK15EBXF7nmc+1hiBTo63aAMl7QDk8yMDWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=io9wm/3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="io9wm/3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F329AC4CED2;
	Fri, 24 Jan 2025 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737705989;
	bh=NVbKZI9Ivcge6Y839I7o27LpjqJYIja2PGfb3uW13IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=io9wm/3/lcdc9JjNr2y5+/ZIPHbD9lHhrHJZIhWewbz0j6YYDkaAsDPGezmPv26Vj
	 kOu/rvix270Nhe3ZohKDL/QJbaJwXRvtPODbjoWwlfaYK7emPLAYn8Oi2vwtzixrP+
	 noisbLWQdrKglr+1/+P2+/jopGIAtnr7eqySaPZY=
Date: Fri, 24 Jan 2025 09:06:26 +0100
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
Message-ID: <2025012418-legwork-chug-f08c@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
 <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com>
 <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>

On Fri, Jan 24, 2025 at 08:29:38AM +0100, Alice Ryhl wrote:
> On Thu, Jan 23, 2025 at 6:57 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
> >
> > Hi Alice
> >
> > On 21.01.25 4:40 PM, Alice Ryhl wrote:
> > > On Sun, Jan 19, 2025 at 11:11 PM Christian Schrefl
> > > <chrisi.schrefl@gmail.com> wrote:
> > >>
> > >> Share the mutex stored in RustMiscDevice between all instances using an Arc
> > >> and the RegistrationData of MiscDeviceRegistration.
> > >>
> > >> This is mostly to Demonstrate the capability to share data in this way.
> > >>
> > >> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> > >
> > > This change causes all open files to share the same value, instead of
> > > it being per-fd.
> >
> > I know, if that is unwanted I'm fine with dropping this patch,
> > it is mostly here to show how patch 2 can be used.
> 
> Perhaps instead of changing the per-fd value, we could add a new
> shared value? E.g., it could have a counter for the number of open
> files.

Counters don't work, sorry (think about dup() for file handles), please,
either make it per-file handle, or a "global" thing for the specific
object, don't attempt to count open/release calls, the vfs does this for
us already.

thanks,

greg k-h
