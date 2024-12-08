Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668946B8
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733688169; cv=none; b=tzCVia5ldiZvbXEOxoVOSE1I9tYhoL7iBKt26IHvM9evk47L8OUqVBzJl2UwUeBuqPTCf6aZjTQ/IiwJ0lZLTNmMaCvZ/tpg0Go13dKwR/hXGgrcQ04qE6q8M3YOdPfaEJKA3gvjpvXnU5IADyZDe+7787Q4oHeUfY+ddwmjJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733688169; c=relaxed/simple;
	bh=gz6PCo4Tt0zAFnKMZJsdpK12HiUr8GTkiN22/buzjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWHm7EuFC/OrDrqgmF7u7pNHldHMz+DDnwMfE9Tbx0IswVxowwCxrTgUUAGoTeIiZ/rUSL14YhVV9D8zcOwiemuknV3DibAv2q9NYAi7xP3rlSmw/UA0tCD+0QLsd34D06mOSFtLD7jg/bjC5ahaEUyAKviEEHWop0yXu6pT9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0gZHQDp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0gZHQDp"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b678da9310so323409085a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 12:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733688167; x=1734292967; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eV7IX/xmEIYt4sjsSR266zBqR8r8eLy+4Mrz22uamn8=;
        b=W0gZHQDpWfgk95oGnnzc9JfrLhXI/cxH/2hv60UQkp0HRgIn1NhZ4JqrxGzccnG734
         nd9VtKgLe7U1dtFRYIn55pE36XxWqTkEoYfNF4leCDUghgpfw8mB1jN99Gu5FGJQfEWh
         0FbznZO4NXxN6fqLUhVlQY9aX4M0CW2lv0Bfap5Q1/DsYUhCEM/2EE/izRaafqGdv7OT
         fxM4TTkyVr4C+RSqzHIS7uoB5WiFd9WMntSUiTgpNFk6RQijyhbWw4WreYMIIh/+/QLt
         pfWcg8mpX8StA8seykWQP9IKLibDAl0Sg2n41SaPsz4Ty64aDB7q8rfYA5e8WJ1B3efm
         IQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733688167; x=1734292967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV7IX/xmEIYt4sjsSR266zBqR8r8eLy+4Mrz22uamn8=;
        b=mZVx2i0fz4K1eJuvgUiyzOxoADtZbOV/G09bIE9CfnqCtC3AK7siGdaD8oTj3EYh8+
         nrAnVBXokmWPYBH0ZgdUaDf9luZsiVWH87R4wclwER6CwcASsJgfbWI2X3ZTsP7Pu1CG
         WOqF/vnskpdkM5fS1M4G4aRcANtJaYERbIBn7TFmJdYCaWNjx5XAvNqTVbmpsgnt7KwT
         FJlPrkqjSCHk73LPLxOIa4c3Ol/M0pGka7Q6jpE4L5M+GzAnhEZ/jrYEafMUiW5eg7lP
         8YLEXF/ekyvICW89SyJxAbLXxohEJNRiqAz7pEvcHmY1a8L88+70QovhF3cccQ9vTf9p
         OMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsDxhW7ZzvpgDAQxp75fsWipexOGOrvaHQf2BlYYWGfsgYl/vijjujH/w5MMvYPiLQv958pvGzJMpX3t2gyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgwGziGPk/A4ikwzBdrO74hx+sBcaf/vTN7kVC8hGMg7Vxfuf
	za5f+oHTBym99tusSSq1SRrlpvW6p5hv47OVKSH3aLIE0g2qGPWd
X-Gm-Gg: ASbGnctjSZMElwAXO3XqwveVUVvjgDD1D4vgwttrJZIUTx82Cvjhl1QRi1f4pwb/2EV
	bQCnCDtKd8u2XtlXk008Qq9MgJ4y2fd7EOjtDk+Uz/9HO6wSDUgJe+wKpTMgQdLAwkkUf6aHJGL
	BhsTIDZu5x7+PZR9QxwsTTNbbJcW3sTamwWMzOvEBbV2TiiRd/c/bDpqIcXR2/8kuSqG9JI5aGK
	6t5l/R4K4PpEYMBT8GU+q9SDg/Jyq4dcfaPwonN0Bohqj4MdhnUkntQmdsPhFvNnyFCt3Q+TAXk
	yglpxVzo0Rg15XESGrzVfnMJeTkUQADR0qBo0tzM
X-Google-Smtp-Source: AGHT+IGb98MtFNOXGCv+JKvMr16utrZ1Hnc04TK3kZ4FPsdcqNOM/qL+JDI1MWmoMCNM1vSEPN4sYA==
X-Received: by 2002:a05:620a:24c2:b0:7b6:d70a:86d6 with SMTP id af79cd13be357-7b6d70a8803mr171455385a.36.1733688166924;
        Sun, 08 Dec 2024 12:02:46 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a9ffacsm372633285a.114.2024.12.08.12.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 12:02:46 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id CD2321200043;
	Sun,  8 Dec 2024 15:02:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 08 Dec 2024 15:02:45 -0500
X-ME-Sender: <xms:ZftVZ_T0j-XNYHPk0ef3MWpk2XZyCIgD5cX1__b14njb3Qdel-W4PQ>
    <xme:ZftVZwygRMVECOMz8ORBcZpxgST1hkaNTWLC-ej0NuFX9aCwlckKLR0tkd_BzkVir
    TTgdHU9ZBhRcSKTdw>
X-ME-Received: <xmr:ZftVZ01Fc5BWnCvl3vvhhXWWMvCl8v7SQiX6uw9XsZHYsrO4PuXh2AumC6NM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeefgddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgeekgeettdelffekfedtveelueeiudevjeeg
    ieekvdegkedufeetfeeiiedvueelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopeguvghvrdhjshhonhdvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
    drtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthho
    pegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvg
    hnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggs
    ohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:ZftVZ_AbN_9-jtBFsmRdr1B5CS5uzv7mqCfZ2sMPNfLyQI-94Kyv8A>
    <xmx:ZftVZ4hJFEvGnsM-ij1ip64O-UeK8TDCVhaAV2vE5BKCE6bUaVEUmQ>
    <xmx:ZftVZzob-muTzpIvGEvGsiKW7Yt36pgt9UX-2bgv7N7nH5txVeoSGQ>
    <xmx:ZftVZzhFCYbQHW8XNVU4mEX7k3omf4BH6BoOMOyIB-Apx7LI5_NRuw>
    <xmx:ZftVZ7SVc85guRByOPUW_KmMzInL_ZxqDSIIs2PfUJhsg8gjXBJbRDvW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Dec 2024 15:02:45 -0500 (EST)
Date: Sun, 8 Dec 2024 12:02:44 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: jos <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, Alice Ryhl <alice@ryhl.io>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
Message-ID: <Z1X7ZO0wd5XEFFvC@tardis.local>
References: <20241208184834.50212-1-dev.json2@gmail.com>
 <Z1XvdgQOzx3A4LSf@tardis.local>
 <CAOJvc-bi6ym6ZMAbDSh4H_L6LQXoTs8oNY07SZ1crzXxY9BodQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOJvc-bi6ym6ZMAbDSh4H_L6LQXoTs8oNY07SZ1crzXxY9BodQ@mail.gmail.com>

On Sun, Dec 08, 2024 at 11:40:04AM -0800, jos wrote:
> Hi Boqun,
> 
> Thank you for the feedback, I am new to kernel development and appreciate
> the response.
> 
> To answer your question(s):
> 
> > I don't think not having `#[must_use]` will result in the locking being
> > unlocked immediately, do you have an example?
> 
> You're correct that the absence of `#[must_use]` itself does not directly
> result in the lock being unlocked immediately, my mistake.
> 
> How I understand the issue arises when the result of `Lock::try_lock` is
> called and its return value can be ignored, the lock is never acquired, and
> no guard is created. Making the caller assume the lock was successfully
> acquired and proceeding with operations as if the data is safely protected,
> e.g. calling `lock.try_lock()` and proceeding with critical section code.
> 

Well, in most cases, locking is data-oriented, i.e. you have to have the
`Guard` to access locked data, so the "issue" you mention could not
happen. Besides, it's relatively easy to "get around" `#[must_use]` by
doing:

	let _ = l.try_lock()?;

Overall, `#[must_use]` here should be the tool to avoid some code that
obviously doesn't make sense (like acquring and releasing lock without
any code in between), rather than silver bullets for a serious safety
issue. So I think you should reword the commit log to reflect this.

> The use of the `#[must_use]` macro annotation will ensure the caller cannot
> silently ignore its return value. I believe the annotation can be revised
> to:
> `#[must_use = "if unused, return value may be unhandled, leading to
> potential race conditions"]` ?
> 

I would just say "if unused, leading to an empty critical section", i.e.
it's bad but not a correct-or-wrong issue. Does this make sense?

Regards,
Boqun

> But would love to hear your thoughts?
> 
> Best,
> Jason
> 
> On Sun, Dec 8, 2024 at 11:11 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > Hi Jason,
> >
> > Thanks for the patch.
> >
> > On Sun, Dec 08, 2024 at 01:48:34PM -0500, Jason Devers wrote:
> > > The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> > > currently does not issue a warning if the return value is unused. This
> > > could result in the lock being unlocked immediately, which is unsafe
> >
> > I don't think not having `#[must_use]` will result in the locking being
> > unlocked immediately, do you have an example?
> >
> > > and unintended. This patch adds a `#[must_use]` annotation to
> >
> > Are you sure this is unsafe? Again do you have an example showing this?
> >
> > Regards,
> > Boqun
> >
> > > `Lock::try_lock` to prevent this.
> > >
> > > Suggested-by: Alice Ryhl <alice@ryhl.io>
> > > Link: https://github.com/Rust-for-Linux/linux/issues/1133
> > > Signed-off-by: Jason Devers <dev.json2@gmail.com>
> > > ---
> > >  rust/kernel/sync/lock.rs | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > > index 41dcddac69e2..f6a5e83ff685 100644
> > > --- a/rust/kernel/sync/lock.rs
> > > +++ b/rust/kernel/sync/lock.rs
> > > @@ -147,6 +147,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
> > >      /// Tries to acquire the lock.
> > >      ///
> > >      /// Returns a guard that can be used to access the data protected
> > by the lock if successful.
> > > +    #[must_use = "if unused, the lock will be immediately unlocked"]
> > >      pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
> > >          // SAFETY: The constructor of the type calls `init`, so the
> > existence of the object proves
> > >          // that `init` was called.
> > > --
> > > 2.44.2
> > >
> >
