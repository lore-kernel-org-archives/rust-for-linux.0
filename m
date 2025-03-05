Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0D1C863A
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200648; cv=none; b=ln3c4uZkAtAYNrIeCPhAyCAt+iBxajJbnDSAM18b2VcpXWFKf4xdv04FOli0z4AjLhRDjqcMSGnuiK9szcfCadmQlqPX7c+DCx4qilv+ty87+S5EFQ27MRaGOLrE4HAjiDDTEl1N7NovO2HG7FcPH93j66IjXlRHlDEUvFU7xUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200648; c=relaxed/simple;
	bh=mQt9Rqmij3CQF7N6ySNKJqrP8+a4QSDrp1i2hvVtTCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMhy6fyFogfL1V3CBlBI8AJVMgR+Xvt/f/nNhr8SIGnQsY8t6QB4BSAv4rorQphkgN3p9oKp8I4J4vkG1s9b+GA6PCBoaxoQsduMS9JuAHYwpvhBD5F/3WvKTyAfIt8ei3xS1soJvPvF2IwVKzzRKo5jQ//vtS5OFOBYn1uVj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfxWRpFY; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfxWRpFY"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c081915cf3so923939485a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 10:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200645; x=1741805445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE8aeUm1HAZoT11uP6QOZFS2isTobDRBSeUb4PRdKy4=;
        b=dfxWRpFYl2gkhzWq94+k5DwHMCZniejZTOOKLAX6RjKsmzMjneGAI9HkkcgLYhnvV6
         b8nfu63NSx1QMLv09SKbrUDEugoTbIH+FcPKdSWOYeh1p4rr4+9bVGSFDwD4OgpwV9Xd
         OJoajNXaDY94wprmCV8y9f5dKYiUNiVuI28xGySGPvQtJS11BKua6OctG1brgUileVUi
         drkOfE3GJS1TzSvnLNbPjIn94GYLFA/K4Gh3r5NbmZZTerLXcDizRrJd9kQf0yaU4j9Q
         vnJQgrv7ULpxXmdm/cLHA9XsqejL2mE5ajuUcoOI9+lQ5oN8lGXkB0n37MpycyTejOFf
         9L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200645; x=1741805445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hE8aeUm1HAZoT11uP6QOZFS2isTobDRBSeUb4PRdKy4=;
        b=UItOthzKLlkS4gfpPNskSyNwQEY6pQcbgrYycy/6C5dRRFter4xe4gfflGltO3uDfE
         7VSx/1yxVtmuH/i3JwflERo6XvwUSOONL8EfgMCjaaalgXx1wgvvwlhlet7T4d7KT/Wr
         4kHTD5Ovv4zCULhje2/ubYiNJUTk5iQUZ5PEPRd3DEBujkxFs0QovM6FY4NKaBxgEhDP
         qcTx77DrH/I13AVi8a1ToXlpqepmHdVx5I8bG/rT0hAcCIGwWK6u/eRpHQTPAaRHKkbU
         q8uLKdV3x25iR0G5+VfoD+xbPDz9Nb39SnYK/mF7SuEAYhpufsNoQ/f9e/ksn+1x0yNs
         kukw==
X-Forwarded-Encrypted: i=1; AJvYcCVGTPy57VxK1UxEkYUhkdzejBfrTUfW7euPF5ol5kRdltbiLplP78beQ5uInmBN8oBOB3kC34OLx/Eydb3p3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUNIQICT86QvfbCAhD35on6alzc9f9ldkfs+TF7gaGW4/NkXO
	nQVU02e5uXxCfBgMlkLf9B6OtggbtGPD5y2zOOurA5qYaC6vaEvm
X-Gm-Gg: ASbGncvO+RwUlkPvUk8KF4wKUzqbze1W2D1ctiN2LVjLsDCLOsmDvayiFqqoF8+i5q9
	dWvI5nnfIriWfK68uSBLoDtegU8pdrvMoJ/4XDQ9KgapBHKR0GRAFPyq5MHLqTqWIqm2LZByTfM
	MBR3badUYCn5uD1TkfVhVrn0jBRRyFFGVc0D9gt7wGVjvRrfRJ+z77vDE8fScRzMKpuxOfMgOyw
	XN9ExJROc6CpHaA+5l0MSWlVOQP/1kbiaO3Ekwy1kAyuCi8g+wUzrtvop2A7PJTXfiFyTQyMniz
	eS34be56rt9eIzCWb8uAEE5QqQfcWMFFosZAnr8jKjbzYLAxPH7I7UMgNpR/5Lx37h27O/pueLx
	K/1Q+uiMZLofcLZL6IMo8KF+K33xP/77kJiQ=
X-Google-Smtp-Source: AGHT+IHeQBMUjOeC+guANSVWdiGUEpoj//y6NgU+OIMri74mujecNQAddoUn67eZqZ8gcr+NiiDC9Q==
X-Received: by 2002:a05:620a:86cd:b0:7c3:d078:133a with SMTP id af79cd13be357-7c3d8eb15f7mr555860985a.35.1741200645239;
        Wed, 05 Mar 2025 10:50:45 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3b8e25308sm458508785a.51.2025.03.05.10.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:50:44 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 73BE2120007C;
	Wed,  5 Mar 2025 13:50:44 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 05 Mar 2025 13:50:44 -0500
X-ME-Sender: <xms:BJ3IZ7hhITWWrae2QOi1aUV0S-XmSXF0-2fj2oPYr8n-2R_l4xIXYg>
    <xme:BJ3IZ4AHmIo7fm4OWeTbmCIo2u4s6J5CzX1iG3K85IXi9YtsuuyiH4SLdB13AN5_7
    q8mNlDJU8gMELshJw>
X-ME-Received: <xmr:BJ3IZ7GJ2HoPGpXkoYA2FA6o1u0lqt0c6SYNboDeCtv6dfZojMBff5_UMsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
    rhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhf
    gvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgv
    rhhnpeeiuefhgfdulefhvedtteelffehfffgudejvedtudfhueevfedtteeukeeuvdffgf
    enucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrihhonecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvsh
    hmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheeh
    vddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhh
    ihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughirhhkrdgsvghhmh
    gvseguvgdrsghoshgthhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhu
    giesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggs
    ohhrrgdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhg
    rhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnh
    grmhgv
X-ME-Proxy: <xmx:BJ3IZ4QS94sob4lV_JawJl6t2l_YC_RyGhrYnm9NwuVACstfwJhbaA>
    <xmx:BJ3IZ4w-yVgqCLjlz3zRpOhBWj2N2VmQocB7jqH12T9iLUve0OCuXA>
    <xmx:BJ3IZ-4F2C3wwoM-LUZPO9RYqLOEbAPqTbkHvsEdFwDdRs3LTkuTxQ>
    <xmx:BJ3IZ9zrU-hAC8wJG4HjV8v_2eUvs0u1AwUSJjLYN__Otkawuiz5aQ>
    <xmx:BJ3IZ4jhI5FAnJrPzki5GwKs-o-3niyZNbH2Y_Y4kjiE9T3wv7kRlWzj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Mar 2025 13:50:43 -0500 (EST)
Date: Wed, 5 Mar 2025 10:49:38 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, daniel.almeida@collabora.com,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
Message-ID: <Z8icwtIpZ3PO9YcZ@boqun-archlinux>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
 <20250305053438.1532397-2-dirk.behme@de.bosch.com>
 <871pvbhqap.fsf@kernel.org>
 <eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
 <Z8hwGGn9huDjyDWN@tardis>
 <87v7sn759g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7sn759g.fsf@kernel.org>

On Wed, Mar 05, 2025 at 06:32:11PM +0100, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
> > On Wed, Mar 05, 2025 at 08:47:42AM +0100, Andreas Hindborg wrote:
> >> "Dirk Behme" <dirk.behme@de.bosch.com> writes:
> >>
> >> > In the discussion [1] some `Opaque` documentation updates have
> >> > been proposed. In that discussion it was clarified that `Opaque`
> >> > is intended to be used for (partial) uninitialized or changing C
> >> > structs. And which consequences this has for using raw pointers
> >> > or the destruction. Improve the `Opaque` documentation by adding
> >> > these conclusions from that discussion.
> >> >
> >> > Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> > Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/ [1]
> >> > Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> >> >
> >> > ---
> >> > Changes in v3:
> >> >    * Add the "terse" proposals.
> >> >    * Move the non-linkage artifact from patch 1/2 to here.
> >> >
> >> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
> >> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >> > index af30e9c0ebccb..f370cdb48a648 100644
> >> > --- a/rust/kernel/types.rs
> >> > +++ b/rust/kernel/types.rs
> >> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
> >> >
> >> >  /// Stores an opaque value.
> >> >  ///
> >> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
> >> > +/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
> >> > +/// by using [`UnsafeCell`]:
> >> >  ///
> >> > -/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
> >> > -/// It gets rid of all the usual assumptions that Rust has for a value:
> >> > +/// * Initialization invariant - the contained value is allowed to be uninitialized and
> >> > +///   contain invalid bit patterns.
> >> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
> >> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.
> >>
> >> This last one is wrong (I know it's probably my fault, sorry). It should be:
> >>
> >>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive** references.
> >>
> >
> > Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
> > noalias" here? If so I feel the wording might be confusing. I would
> > suggest we don't use "uniqueness" here. Maybe something like:
> >
> > * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily a
> >   unique pointer, and thus the compiler cannot just make aliasing
> >   assumptions.
> >
> > (I use the wording from UnsafePinned[1], maybe there could be better
> > wording)
> >
> > [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary
> 
> I like my wording better. It says the same with fewer words, and we have
> a more wordy section below anyway. We could combine:
> 
>  * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive**
>    references. That is, `&mut` [`Opaque<T>`] is not necessarily a unique
>    pointer.
> 
> 
> How is that?
> 

I think my biggest problem is the word "allows", the phrase "allows
aliasing" sounds like Opaque<T> provide something *optional*, however,
as I understand it, Opaque<T> here just disallows certain optimization
from compiler, in other words, programmers want to use `Opaque<T>` to
forbid something, hence "allows" may not be the good word to use here?

How about:

  * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
    made by compiler on an *exclusive* references.

Thoughts?

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
