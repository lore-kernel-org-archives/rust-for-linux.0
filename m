Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC614830F;
	Mon, 20 Jan 2025 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737410605; cv=none; b=sNCOumI+QsLkcka0wSy35U/wfo42UocVNazN7ln7LopJnNY9aLLv/qplcoXN7wn5iGFCnFL9Pc1OcBCaFpM7uByH1ZmG3es2hfvwB5D0WgwuiRjOTrNBmcN5DwTopSCtbFi3HAGLyJ5ehTCqyPebNWQs5T9XdaDBDiOinQaeTJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737410605; c=relaxed/simple;
	bh=1twK2f8h2/5+VxDpvBcj+VWKLMotwhd1khNQepMBWXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8Zes6bmEb2rt39sjXg9eglQLbrBkD214o/zdOreFzJw8l/ySEamJ86KOoc5mxtYRBBSQ31xpSySlkhw7w549A4IItFMt0qhrhC0aQ5tsgbWdr0BTJokwBD/pISjB9It5WsfJeM4SrhOfG6aynOGxp/Dppqy4mAb1nLzvEtpDVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id E7082231D340; Mon, 20 Jan 2025 23:03:19 +0100 (CET)
Date: Mon, 20 Jan 2025 23:03:19 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
Message-ID: <Z47IJ-2tPDIVzMA4@desktop>
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
 <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Jabber-ID: linkmauve@linkmauve.fr

On Mon, Jan 20, 2025 at 10:52:48PM +0100, Miguel Ojeda wrote:
> Hi Emmanuel,

Hi Miguel,

> 
> On Mon, Jan 20, 2025 at 1:45 PM Emmanuel Gil Peyrot
> <linkmauve@linkmauve.fr> wrote:
> >
> > In C, the char type is specified with “The implementation shall define char to
> > have the same range, representation, and behavior as either signed char or
> > unsigned char.”
> >
> > On x86 it defaults to signed char, and on ARM it defaults to unsigned char.
> > This carries over to Rust’s FFI, which aliases its c_char type to i8 on x86,
> > and to u8 on ARM.
> 
> In the kernel `-funsigned-char` is used, see commit 3bc753c06dd0
> ("kbuild: treat char as always unsigned").
> 
> In any case, the change is fine, because we want to use the proper
> type, but this is already in the Rust PR for this cycle, which should
> land in mainline in some days, see commit 27c7518e7f1c ("rust: finish
> using custom FFI integer types") in rust-next.

Oh I see, I hadn’t read that merge request before submitting this fix, I
just tried to build the current kernel and it failed and I identified it
as a common issue I’ve already experienced in userspace.

> 
> However, I am nevertheless confused, because in mainline
> `crate::ffi::c_char` is `core::ffi::c_char` which is `i8` in both
> arm64 and x86_64 and thus there is no build issue there.

That’s weird, I clearly see the error I mentioned in my first email,
when building with today’s nightly compiler (maybe that’s relevant?).

> 
> If by ARM you mean 32-bit, then we don't have support for it yet in
> mainline, so you shouldn't be able to see it there either.

I am building an AArch64 kernel from an amd64 build computer.

> 
> Could you please clarify? Are you using patches on top of mainline,
> e.g. the 32-bit arm support one?

Nope, I was building a 6.13.0 kernel straight from torvalds’s master
branch, so the issue will likely be present on the 6.13.y branch as
well.  Perhaps my patch can be applied to that branch only, if rust-next
will be merged soon.  Otherwise I guess we could also live without
drm_panic support on AArch64 for the 6.13 kernel.

> 
> Thanks!
> 
> Cheers,
> Miguel

-- 
Link Mauve
