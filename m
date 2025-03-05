Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FD2505BF
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741189150; cv=none; b=JtExLAPoIotbyK32EkHQjHZEfGAHrkpVqeHNlO0KEH/y6HghfsTdJ6I3op7s72Yl6oAhc4WHPAyi/V9xRGaDjqRJtnggOskLMoNMxgi7oyO/76PMz8LNCucsypj+I4CIXwcyDyjoEHPwNLdo8tK9DZtwqsDLEwZai9/W3rn/6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741189150; c=relaxed/simple;
	bh=BrHdXvHSPWRJ3MD8aYkzbkcZWybHWriEIPVdRYTqv1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiP0rK+m8nfgnND4hsVl4E4q4lsFe5q24b729TNGCqDUBLPFtFuUA4HVvopTBcPFWbo56fBkAjswrWiQQmo2C7zlZY3IbNz7g89ye8muc+FEseUlEYGaGn/aWqNpF5eMgKFraJovLKPLX+EW4bK8kiWVxOv6taCJcdhoPmpFW0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdyK/Hnp; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdyK/Hnp"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47509ac80cbso6531651cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741189148; x=1741793948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQcrmmnBeLqXUXpuBLL10NjLRuEwOJfUod6uCxLV1iQ=;
        b=GdyK/HnpklnYg6CT80nZEq5AyHL998RQjvy74/OP571JnlzI3J1FKpMMcecBbnIlaI
         +1hrIKhhssxvXJ2WagHar7jWlpO5wT9hfkuyso4+/s3VvEje2nerQO2F7mrIHZ9Sbjp6
         XErWBr4MF18MNZF+8BpHOW2MxwNHbHoiT5WMAo8voPDuNYiHGB6cnVnsTCazm6nevqkb
         tlcpn/yw622ozPx39dnB3e/TjMaEOw8LrmRaBcgs4z3C/iCy4sOWj5CazVxBfnG8Se1T
         eA2xO6oBx98rHtsWQsIV7Ip3e9X8M1FNcPGzysdnkjqfakolzzQRaaJ9RQCiE/LBfv/E
         2Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741189148; x=1741793948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQcrmmnBeLqXUXpuBLL10NjLRuEwOJfUod6uCxLV1iQ=;
        b=q6T/Hr327Qy2VzfGj4gb9B35XggliieKH3VrSmtU0/U5R/XW7ezYdducoTIlTygGuY
         GUh2oF7LAJ4UcMxVeLfWGVD2SOQsqsVtZER2ZURwhzaf5iShEIOXokhtC3J/gr8AXbZL
         lDFDMOcxk2rXOAvU/uOt8wNn14JygsJTKzKjiBTLTJjyuoh8VzXkM9kXF/2Artl0FRrU
         M8dOH/ON96clR3Z4E5uY/TPO2WozPawO/CyVAGbGIdex8H9YbENAWPdDs35Eo+2gH3St
         epCdhEUWtMM+wlh4njHwGVEAEwGJB07Hc1EulOHvjv7CHbCyGrMUyNmF3stz45J+QjH0
         889w==
X-Forwarded-Encrypted: i=1; AJvYcCWRc2cafJ0D4dk2EijgJPsxRP85/sQWbR+T9xseCpKzS4b3Cn2PGg4OPFO0nOP/QnTEK1ElEIFyvGQYrrRqyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUCyXLAQoCW+J/xW9tfKrpBZVyiIM7smQ8NOUYRHt3DOLxmop
	EQ2+jIfwSAKiVER7xeLfty3XiU2+G9S5t5KJVx6sGe0DZpgpOql1
X-Gm-Gg: ASbGnctdbhLvjc5zV4OPLAFggjgWXiC90EWVtpxL7y7bfKq7o+PzRB1F4q6mPGf1Hzr
	tt7IY0yBHtb23lbN8S/0Db+Oh5vNwUbc5aLFM5IeXBhRE5/tvTg8j2sSAJxN3R/tWIuTgDr1adU
	tnC6Z67V9AByzydPBPq0pILDVLlAQIW5cCar/I7o66XPJURO1ZdeNLUa6T7aj9E3zJue5drqPNF
	iAvGVCdcF/SxL8rPze5ytMhi+H/Vc4CPXPmPd8VneGXJLc7uwfIumc/3umT+JEI0KFv6XIBSxQ6
	SVeRysWd9etF2gsjJ1JK1Lywm9xpZTZKSBdyGJuTcwFYePlkX8k/vJJJKVXIjd0oMOaNq27NgGC
	cEdRQ18l0NiHTVczYsjjitDgrU2R7rpj/6Lk=
X-Google-Smtp-Source: AGHT+IGw9yPByvdxZyX3gXUjLYwTQY8DX7r3GeWWJPx9RA7+NNb6ZBSMrOsg1J9M31HKfEKnbRnBgQ==
X-Received: by 2002:a05:622a:1212:b0:474:f484:1b4b with SMTP id d75a77b69052e-4750b464aafmr48670541cf.23.1741189147560;
        Wed, 05 Mar 2025 07:39:07 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474fbed5465sm27703591cf.39.2025.03.05.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:39:07 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id C46E4120007A;
	Wed,  5 Mar 2025 10:39:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 05 Mar 2025 10:39:06 -0500
X-ME-Sender: <xms:GnDIZ7bHOJsnuNuV8WRz1l9tWDGX7_xbLXT9TeCDO5AzOlT9BSh-Bw>
    <xme:GnDIZ6aoWFISPZFQO5oScKJk3yACEcY0uIOp9pOCpwffvqmZkiYmyOP6KrXPl9eyE
    rbhxIhQXp0B7mBRTA>
X-ME-Received: <xmr:GnDIZ99KrRsCZoTH16zMp-0R9w5L1bKNbG46IpeYz8GAzhRSJ7JjjT1qOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
    rhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeeuohhquhhnuc
    fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
    vghrnhephffggeejkeduhfdtuedtvddugfevffehueduhedttdefjedtkeehuefhkeetff
    dunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdhiohenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
    hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
    hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguihhrkhdrsggvhh
    hmvgesuggvrdgsohhstghhrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhn
    uhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgr
    sghorhgrrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhm
    ghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopegsohhquhhnsehfihigmhgvrd
    hnrghmvg
X-ME-Proxy: <xmx:GnDIZxqnhCa9qTWcKvi_nnN1C0j5zJHPL1esxFmVLDBLp9VI0tWCng>
    <xmx:GnDIZ2pG2GjFwanYEtCUOrG_IXb54mYcm6IN4VjmyoxDwCvX9Taqbg>
    <xmx:GnDIZ3TT90kUzHq6cWAwdcdSk0-fcqPkroHC4YZoGwGWP86NESdVQA>
    <xmx:GnDIZ-rRDCA7KDa2mkzJ_6PYH3bNE9Zme9u8HYXUXN8iODvHOJerQw>
    <xmx:GnDIZ35pdqIU5ycGxrIwUI9deToS_dvTlGjD9uYBCLKLKdWzV0YZumnb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Mar 2025 10:39:06 -0500 (EST)
Date: Wed, 5 Mar 2025 07:39:04 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, daniel.almeida@collabora.com,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
Message-ID: <Z8hwGGn9huDjyDWN@tardis>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
 <20250305053438.1532397-2-dirk.behme@de.bosch.com>
 <871pvbhqap.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <871pvbhqap.fsf@kernel.org>

On Wed, Mar 05, 2025 at 08:47:42AM +0100, Andreas Hindborg wrote:
> "Dirk Behme" <dirk.behme@de.bosch.com> writes:
>=20
> > In the discussion [1] some `Opaque` documentation updates have
> > been proposed. In that discussion it was clarified that `Opaque`
> > is intended to be used for (partial) uninitialized or changing C
> > structs. And which consequences this has for using raw pointers
> > or the destruction. Improve the `Opaque` documentation by adding
> > these conclusions from that discussion.
> >
> > Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C=
79D65B53A1@collabora.com/ [1]
> > Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> >
> > ---
> > Changes in v3:
> >    * Add the "terse" proposals.
> >    * Move the non-linkage artifact from patch 1/2 to here.
> >
> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index af30e9c0ebccb..f370cdb48a648 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
> >
> >  /// Stores an opaque value.
> >  ///
> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are never =
interpreted by Rust code.
> > +/// [`Opaque<T>`] opts out of the following Rust language invariants f=
or the contained `T`
> > +/// by using [`UnsafeCell`]:
> >  ///
> > -/// It is used to wrap structs from the C side, like for example `Opaq=
ue<bindings::mutex>`.
> > -/// It gets rid of all the usual assumptions that Rust has for a value:
> > +/// * Initialization invariant - the contained value is allowed to be =
uninitialized and
> > +///   contain invalid bit patterns.
> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mutabilit=
y.
> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared r=
eferences.
>=20
> This last one is wrong (I know it's probably my fault, sorry). It should =
be:
>=20
>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusi=
ve** references.
>=20

Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
noalias" here? If so I feel the wording might be confusing. I would
suggest we don't use "uniqueness" here. Maybe something like:

* Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily a
  unique pointer, and thus the compiler cannot just make aliasing
  assumptions.

(I use the wording from UnsafePinned[1], maybe there could be better
wording)

[1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary

Regards,
Boqun

> > +///
> > +/// Further, [`Opaque<T>`] is `!Unpin` and will not run the drop metho=
d of the contained `T`
> > +/// when dropped.
>=20
> Could you link `Unpin` here?
>=20
> >  ///
> > -/// * The value is allowed to be uninitialized (for example have inval=
id bit patterns: `3` for a
> > -///   [`bool`]).
> > +/// [`Opaque<T>`] is meant to be used with FFI objects that are never =
interpreted by Rust code.
> > +/// It is used to wrap structs from the C side, like for example `Opaq=
ue<bindings::mutex>`.
> > +/// This is useful for C structs that are not fully initialized (yet) =
or might change their
> > +/// content from C side at runtime. [`Opaque<T>`] gets rid of all the =
usual assumptions that
> > +/// Rust has for a value of type `T`:
> > +///
> > +/// * The value is allowed to be uninitialized or invalid (for example=
 have invalid bit patterns:
> > +///   `3` for a [`bool`]).
> > +/// * By dereferencing a raw pointer to the value you are unsafely ass=
erting that the value is
> > +///   valid *right now*.
> >  /// * The value is allowed to be mutated, when a `&Opaque<T>` exists o=
n the Rust side.
> >  /// * No uniqueness for mutable references: it is fine to have multipl=
e `&mut Opaque<T>` point to
> >  ///   the same value.
> >  /// * The value is not allowed to be shared with other threads (i.e. i=
t is `!Sync`).
>=20
> Link `Sync` here. You might need a [`!Sync`]: `Sync` at the bottom for
> it to work.
>=20
> > +/// * The destructor of [`Opaque<T>`] does *not* run the destructor of=
 `T`, as `T` may
> > +///   be uninitialized, as described above.
>=20
>=20
> Best regards,
> Andreas Hindborg
>=20
>=20
>=20
