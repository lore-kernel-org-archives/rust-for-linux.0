Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0FD21A42F
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737715179; cv=none; b=u2RE3mGCkWH9eySCcg4qHNVCXoFZfPVHaGDROKvMpbkDhSMu9FS2qIHrVY2YNFxCEppw/mey2k9memis7R/hLtjHx/lqAvM8Yh25FR1aFIEYSZKLzKIiiEX2wUNT6jM7SjEbwHRz5vXxLfuyi7iNbUM0IORBabTc+X/5SUGpzss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737715179; c=relaxed/simple;
	bh=PUX2XvWkN/JqBtmDD0itVIqN68pWAJv0m3L2656m6uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=de5R9x5xWg5hVtb9/Dsu9QgNF5n1LFqalAFToIBbMqcWp1eJu1JuPZ4h3aoY2RIfD9xGEoOuY+Txr2weyFTSuWHi8oNDO75FYaY3eYMO0+WVhO9hE77/eaU6Q+19GGgL502yl0H8yHXLr1fu+dHSptUzR0ntHSLCp2ECMjiV3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OVsXQ/CE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OVsXQ/CE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43621d27adeso12743045e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737715175; x=1738319975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7qL0Yv3S0dzutRWxF5LP6a8qreOSSMfoOsKtcxFK18=;
        b=OVsXQ/CE12lprNh8ACU8M5CaBJS3pI+ac4dOhCTKeJ9TNPdDTK1h1ipkTs8TbU4ZqP
         BqwCgbTo5woNT0ED0QtchDhBoqWSHQXFYmN8GKG0OhBygqA/qb7K6PkVTfJlIwD4VVW/
         0kU+uRfSSTvL1kgSW8e2oPrrmSFj/frEVHNphvE1Nn1tnOrLk/5iHjy3Fm5fDW4DCzqQ
         av3niqEnPB5Ue3IDly/xlBEUO0P60+4RnMMqabTfZVTXcN915bW8ObbX63VpQOHRXu5+
         l6w3c6DGCN72q35Grzv1QaGI3l/bEUfmyTq0KFpt9GK3sQ/Ean+EqCUuScbTyqcMbMs4
         wL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715175; x=1738319975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7qL0Yv3S0dzutRWxF5LP6a8qreOSSMfoOsKtcxFK18=;
        b=mu0J70xwTIE3/QS7F1Wk3WFerDIAkbTbYnR9s6xkJ2oBNjpKKpmV7pED3fGoKELSIa
         D5Knq/yNPD/X9TexQPlbIbO5/mRi80Ob8hAIIZbKb4suNkIcSJ+VZRtp0+Pt9nsskrqb
         1yWrVl001n0mvuHMY2ng4EU5e4P6ohkJuWUauX+c93UB+jYCwK7mhbtCABJDznc29uX9
         z8nKHk6gZ3d+D4uGAaQruQtV+ZRP3wgLCgUGp4yQEQEQ2778jueLI0FYiCRMvh7hiXve
         a+ywXlR83KOBzqiNKAus1/GHLtC2Lc3uwKo7OjkeAUVNnbg6Xl7gzfh9WX7cv+r2qlfe
         DXsw==
X-Forwarded-Encrypted: i=1; AJvYcCWN3jYyGM951K+Hdn419GvYbBxEdtBhgkCOVqIVafUgd3uxvlr59KbvTpnQARNGSZPaRiaU3ILOWpgQ6AELZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTB/jr4Is1ia2nC6zU5QoFeP8auP/55lQp0No5Z/vZmBqxgnc
	xiNMNpR9e5grEDXeaP8PHpGGPlE1ipv+dZxG1ZqOccg4DfimxqmuF1i3g6+TcF5KpRrwLz8xk8P
	D/pKQfqgcbph5GDMNH2USxpEbofVqauYizuem
X-Gm-Gg: ASbGncuVni4vmygkbshqqvE6tQnrgLTLppqxFEz9x6srEeHmbu8z2sY8LHyzwFHmAqC
	4VR31W6V+lM+KAVVYwUcIPqjDyJ74IgDny+MemquajACjUROXERVY5H7VfR2E5lijwHvi3suESU
	gKerSH3Xk8FxbtRx14
X-Google-Smtp-Source: AGHT+IGaAmGSSTV/q/AEJCNTZBHgBU0T8ZNZxW+46KQFwD/ZNOB3ceMG65GDXzEKNW26wrhBeHvHfxSIIoAETMeMXlU=
X-Received: by 2002:adf:fb4c:0:b0:38b:f03c:5bb8 with SMTP id
 ffacd0b85a97d-38bf5662030mr23004954f8f.14.1737715175353; Fri, 24 Jan 2025
 02:39:35 -0800 (PST)
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
 <2025012443-music-fester-b33e@gregkh>
In-Reply-To: <2025012443-music-fester-b33e@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 24 Jan 2025 11:39:23 +0100
X-Gm-Features: AWEUYZnd7Gd9OLC49VtLIYat6lO9NwXkzJ3Wtf9pSG4Tb0FJyCDTBhDgQNigYJQ
Message-ID: <CAH5fLgizP9YQZrDfpG2QW6nP_VV7SfQ1uG2LrBGeYnzv31n1LA@mail.gmail.com>
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

On Fri, Jan 24, 2025 at 11:34=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 24, 2025 at 10:42:53AM +0100, Alice Ryhl wrote:
> > On Fri, Jan 24, 2025 at 9:06=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jan 24, 2025 at 08:29:38AM +0100, Alice Ryhl wrote:
> > > > On Thu, Jan 23, 2025 at 6:57=E2=80=AFPM Christian Schrefl
> > > > <chrisi.schrefl@gmail.com> wrote:
> > > > >
> > > > > Hi Alice
> > > > >
> > > > > On 21.01.25 4:40 PM, Alice Ryhl wrote:
> > > > > > On Sun, Jan 19, 2025 at 11:11=E2=80=AFPM Christian Schrefl
> > > > > > <chrisi.schrefl@gmail.com> wrote:
> > > > > >>
> > > > > >> Share the mutex stored in RustMiscDevice between all instances=
 using an Arc
> > > > > >> and the RegistrationData of MiscDeviceRegistration.
> > > > > >>
> > > > > >> This is mostly to Demonstrate the capability to share data in =
this way.
> > > > > >>
> > > > > >> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> > > > > >
> > > > > > This change causes all open files to share the same value, inst=
ead of
> > > > > > it being per-fd.
> > > > >
> > > > > I know, if that is unwanted I'm fine with dropping this patch,
> > > > > it is mostly here to show how patch 2 can be used.
> > > >
> > > > Perhaps instead of changing the per-fd value, we could add a new
> > > > shared value? E.g., it could have a counter for the number of open
> > > > files.
> > >
> > > Counters don't work, sorry (think about dup() for file handles), plea=
se,
> > > either make it per-file handle, or a "global" thing for the specific
> > > object, don't attempt to count open/release calls, the vfs does this =
for
> > > us already.
> >
> > I mean, it's just for an example, shrug. It could also be another
> > ioctl that updates the shared value.
>
> Sure, but the number of times I've seen sample code copied into "real"
> code is way too high.  Also, getting people to stop thinking they even
> can count the number of open file handles is a good idea as that's an
> extremely common "anti-pattern" in way too many drivers even today (i.e.
> if you try to count open calls, or even restrict the number of open
> calls to attempt some sort of control, you're doing it totally wrong.)

Fair point. Do you have good ideas for some data we could put in the
data shared by all instances of the file?

Alice
