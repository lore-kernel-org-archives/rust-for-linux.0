Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2911AAA3D
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737718638; cv=none; b=Yc4pyUNRDDTyfY+1T94lxMLjclJSS7+uYq169tjaIX64TntmWS+hZOgOudBGKwMbcZKcZKw/zFJBnEwUYW+Va2CaPiaujIHCpAe/IN0vQ8nT4jv8+Q/oqnq1L/m23cOnJ9xskP5naho8HTOuyg1nxKwBMVa5bhDWM5y87qVe14g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737718638; c=relaxed/simple;
	bh=/RscSDkj+SBtLIDRBBjHrslqYxBYocIWJ/aLOlvsX2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTlFLut+JZQYJ3knCuua8ELnQ+46bzqf2uuOLJmEbzfvqjSY6CSsnsEW0PS/BOPxW/bfhf5H3sD+0xwoROJZ1rdFSDydh956ANmh4AEd9g+//mNkmk6QkbN1Eg04NFmABusqb2eh+jW7I4lvRcnunnnTXAiFsp2Pxm0Y5DrGY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XomC3GRA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XomC3GRA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385eed29d17so1067086f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 03:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737718634; x=1738323434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lXAa8DsluPp9LNusFtQU3YAF6gCAgEmvMKEZi8o3bg=;
        b=XomC3GRAK1rRvsufLE86s1e4/gcyk6RbLVFwEzWcevgJabTCKiT9FHYrgXzGjyxKIn
         GNZ7Uu9Mubn3J+8l8tks13xBxpiyFEA0yEFSNCZdpoNTgTWs/845IbXZaia8cjNztNzi
         mam3fJylIB1uzuhF7zBYTIAyI4sCJ/TSk9r4RJjMQpF2ZTN3+XvS7gl46rBQrEQwYyGG
         DqeuzqXr3dSNgmPUZWxl/MNUHOSOJ2y5+K4xknKDpoVZEUki5BoWtc9HE4gilsUTPflw
         eKDeintqw9czYHPCrVhWyPvF1o7jctnPl5aONxDaEB0T5nWwjiVmw79YOnCtm7o+gUmw
         Mi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737718634; x=1738323434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lXAa8DsluPp9LNusFtQU3YAF6gCAgEmvMKEZi8o3bg=;
        b=h/Y53Bgbcgetp3fDvsQqQ9NgWdb/Da/xXMD1XWLHH/VX9lub6/r+48zM1LTdfuxGHy
         4O4Ofmc68Q4xC+8URBUaAOJr6xlGHeu4NdDIGV7PBUxLoaDd4ES3E4soisZ+oJm3q96Z
         xzzhtT/nasC1CKRcqkpG+V78idlZPq3imVZ745QP6NvP0mLrV88ya8lQY+ANrdS4/Zx8
         lyY4DJa4MWKhouEdWR0Hk9BYiKxQHFEtKwkddDemoE0LcPC93VlpUTJy91nNWj8b+RHY
         1xo/8gbIXx2GINxqYuiax3/DR5RNA1RoEEYl94GR45TMyPqmrO8qLjDhD7arx+uDmMqq
         KXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Cmrk0gTDMkyBdwhXR+oBf7N9yji/f2DmR5g9EUdBYcSFtW517FBjrxL1skVLT9Aq0Cyn6oVuDiB4/Drctw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkZ3GyRsXpHX3eHtLKtJgA9ek6UWtOwfTOcgQOibOD7fIJKbf
	H/TlWCFDQ2m1r8yH0vOfhd7W3v6ho+cytEk8m8pnMpDIbKsVr3X3hlr3yEPUV7vX0xhjIzmkiia
	VAhbckP9QwHx39kqxRAL+Zvu8ih9W1zJhhqVo
X-Gm-Gg: ASbGnctE5XwjGStr0ysdjaV53mHwCRpepLC1n6iMoRU5Z4o0Bf7c10G9jMvQfvc88v/
	ny6x0J0FbBvq15YdoFU4E0J3cs3glIcj9kkBZ7bvzhPGBE93xvbQwmsB3bwwdYhYiNmfb0CCH6k
	uvSOoZVGFR9CdJtYGT
X-Google-Smtp-Source: AGHT+IHwD+a2uXOopLvpNZ1djcHe+r+ON0huM+RBFfbud/JJw7nwfMaOaa3W4YFJ/XdHKJn8fYcs+xmWsyRMdyFtR4o=
X-Received: by 2002:a5d:47c7:0:b0:388:da10:ff13 with SMTP id
 ffacd0b85a97d-38c11e4af44mr19182772f8f.21.1737718634195; Fri, 24 Jan 2025
 03:37:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
 <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com> <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>
 <2025012418-legwork-chug-f08c@gregkh> <CAH5fLggCLSRfiAGnb9ZDRdUsMrBxWDjbVSxVqtdduDi5D1vQtA@mail.gmail.com>
 <2025012443-music-fester-b33e@gregkh> <CAH5fLgizP9YQZrDfpG2QW6nP_VV7SfQ1uG2LrBGeYnzv31n1LA@mail.gmail.com>
 <2025012401-paradox-hypnoses-b717@gregkh>
In-Reply-To: <2025012401-paradox-hypnoses-b717@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 24 Jan 2025 12:37:02 +0100
X-Gm-Features: AWEUYZnLoh3pN5EsK2xk2-8cvXZhHE7m1BKlURnmGQU0Fs_xO8Ow9GfmlNiSkRQ
Message-ID: <CAH5fLghKx9Z-Gn8z_rZfxSy8tTFkOza9KPhGawwLdDqHbTnFEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 12:22=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 24, 2025 at 11:39:23AM +0100, Alice Ryhl wrote:
> > On Fri, Jan 24, 2025 at 11:34=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jan 24, 2025 at 10:42:53AM +0100, Alice Ryhl wrote:
> > > > On Fri, Jan 24, 2025 at 9:06=E2=80=AFAM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Jan 24, 2025 at 08:29:38AM +0100, Alice Ryhl wrote:
> > > > > > On Thu, Jan 23, 2025 at 6:57=E2=80=AFPM Christian Schrefl
> > > > > > <chrisi.schrefl@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Alice
> > > > > > >
> > > > > > > On 21.01.25 4:40 PM, Alice Ryhl wrote:
> > > > > > > > On Sun, Jan 19, 2025 at 11:11=E2=80=AFPM Christian Schrefl
> > > > > > > > <chrisi.schrefl@gmail.com> wrote:
> > > > > > > >>
> > > > > > > >> Share the mutex stored in RustMiscDevice between all insta=
nces using an Arc
> > > > > > > >> and the RegistrationData of MiscDeviceRegistration.
> > > > > > > >>
> > > > > > > >> This is mostly to Demonstrate the capability to share data=
 in this way.
> > > > > > > >>
> > > > > > > >> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com=
>
> > > > > > > >
> > > > > > > > This change causes all open files to share the same value, =
instead of
> > > > > > > > it being per-fd.
> > > > > > >
> > > > > > > I know, if that is unwanted I'm fine with dropping this patch=
,
> > > > > > > it is mostly here to show how patch 2 can be used.
> > > > > >
> > > > > > Perhaps instead of changing the per-fd value, we could add a ne=
w
> > > > > > shared value? E.g., it could have a counter for the number of o=
pen
> > > > > > files.
> > > > >
> > > > > Counters don't work, sorry (think about dup() for file handles), =
please,
> > > > > either make it per-file handle, or a "global" thing for the speci=
fic
> > > > > object, don't attempt to count open/release calls, the vfs does t=
his for
> > > > > us already.
> > > >
> > > > I mean, it's just for an example, shrug. It could also be another
> > > > ioctl that updates the shared value.
> > >
> > > Sure, but the number of times I've seen sample code copied into "real=
"
> > > code is way too high.  Also, getting people to stop thinking they eve=
n
> > > can count the number of open file handles is a good idea as that's an
> > > extremely common "anti-pattern" in way too many drivers even today (i=
.e.
> > > if you try to count open calls, or even restrict the number of open
> > > calls to attempt some sort of control, you're doing it totally wrong.=
)
> >
> > Fair point. Do you have good ideas for some data we could put in the
> > data shared by all instances of the file?
>
> "shared_cookie"?  Read/write and let readers and writers access it.  But
> I thought that was what the misc example did already, but I might be
> getting confused here, it's been a while since I looked at the code,
> sorry.

Makes sense to me.

The existing cookie is per `struct file`, but this series is about
making it possible to have data shared by all instances of a
miscdevice. But having two cookies, one that is per `struct file` and
one that is global makes sense to me.

Alice
