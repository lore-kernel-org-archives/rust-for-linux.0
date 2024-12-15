Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE8175BF
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Dec 2024 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734293106; cv=none; b=UanKungt35+hCPin+W5vY6nGZQqtgDO0942L23XdDmWvmf6dexcPei+MYhE7Ti9rEXAHzQMDY3kwJLZiwDMX8ZnCmaXWZ+JnD7RQPL7AW2fc7tuccNOJueQ2jE7ig/VMUSv4FZCUI49OovSB2sbidpOMFGYC8745N7fLD2abwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734293106; c=relaxed/simple;
	bh=3i3k/RfSdfNauo283P075fOQ8dFKl0tQ45bqOsX2YMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNO5xM/WjBIF7QDD2mT3ntXvvnyaCE9NsCz5POV7bH7c68PM6jwwGUvIr9BQ2rrAn63pugnKgaqX2rmtOAi5vaoIom051qxTObuPHQaTaov+ouWW9RNaRi2yzkYmjKZr4+fRraIW15oGYtqHzQ0BY2qfUsXAC2G4lm6r2q0570Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEXVyNkw; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEXVyNkw"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dcc42b5e30so32903176d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Dec 2024 12:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734293104; x=1734897904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gZT12jRK6wac2ep7eV6NJ4XZ+3e3+Gku4PwhW2hLRY=;
        b=mEXVyNkwMI3ZZuc7BGLP7EXdAtgWIyd+WJ4n6kUhNtkiMfbrWWQ6vPsDDeWoXeCu0g
         h9nDN6SrRu7emYt9+Ij3SDpUu7tC4/k1D4Ooz3ufFc20pB4tMpzvW3rvBoquyP+1K/KR
         HhhetmUOX6nCatTSM7tUmDfp12kmKOjlB9AYQHW3JRkUnGJv5eqoPAYp5OwHOGhlLdyG
         ugWMvkl0PWJmPjRpXpotebIt8IQrFh7lmglO1QAUzuKTOhYRLtIsFNQIiadFseZlibWi
         q/wOxyWAyWQ1sxc6brEqqH+mx77yayeVZvk1+q0dgPcv5JGY1QmMkEtnj+fLBrPpbpxI
         dJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734293104; x=1734897904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gZT12jRK6wac2ep7eV6NJ4XZ+3e3+Gku4PwhW2hLRY=;
        b=kSAUyFVW3GTfPu5c628G/yZNtx8jHCCaFht+dqjkL30LhdNEsHW2/dTyqdClLN8ak9
         9uh3fYYT6/DbRlUGm8J9sJ1K4SKLJ2vZiZhYV4rvdBwYNbSXG/gq0ydk9izvfa9p6tD5
         xnmOknfvVvKDqx/P8/c/LJNmqGrg+2tefTEXbRvuaPvplM+GDruQZ2hlJ2TjvRZ2/Kpv
         5ga5drnu2JeQX0A5S9PNniaJgIr9+zQuZj2gjyhCsXvWIihQfjfaILBhpCJwOEs5s+Vx
         3E8AJFp0wGphQf6irEnBCSAj29x2W0wF/FJ5EAce7xnJqWZgikZk/Zo+b4Pq1lht4xQ1
         5jmg==
X-Forwarded-Encrypted: i=1; AJvYcCUhiCsDsXUGHG8m14rHnXSyb8umJlfiRuDBPJPHenDFmMFZlu17UPtGTGYPB9ndXCvQGplTsYoc2yhiYU5GSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPGh/oRrC5DIfOhUCgb2OVGmng806ZT5O1HLfTuCgsRDCH1t6
	9WxHfYTq5KjLc3jZ1rR9XOt027EtPoBXZFrss9MMe+4G2fLoAc7a
X-Gm-Gg: ASbGncuv2SQgVfUbTRqo7di52H3QPhsr62acBpbUnQIuycD0K7sITXgiSKwNc9tZZFV
	v7gJlehiW4zn0BA9REibKh19mm/3sQFVc1YMMQ/QxYbnHtTzKoBFBJUnWYBOz2aLHo+jaIoHs2r
	Kz79XI9KVlk0TPprb2v/YYTZIHirfOqYvY9uNNUZppW2BbLXY7OIND6or8UN1G/+qmuK9Te1kXn
	bV3ArkyR5ZfXAArps5JgDv+SH3nNBJmjblgAy22u6WzSh7CKU2mF8hJ0iF72T6jlDedPoPJI/YB
	LCw3aec9GGl6QA/jjy7V8yzYPhpZEktSYO6VOp6Tj7v7trE=
X-Google-Smtp-Source: AGHT+IEyKF7Au9ptWA3NIA9DCowlN6p3qaKBT0pF0ywOPBQ08mcSoEZUNTSyO88CnuY5eRYqNB1BQA==
X-Received: by 2002:ad4:4eaf:0:b0:6d8:8e16:7c29 with SMTP id 6a1803df08f44-6dc8ca55871mr187336776d6.14.1734293103677;
        Sun, 15 Dec 2024 12:05:03 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd38078fsm19384896d6.119.2024.12.15.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 12:05:03 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id CD67F1200066;
	Sun, 15 Dec 2024 15:05:02 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 15 Dec 2024 15:05:02 -0500
X-ME-Sender: <xms:bjZfZ5R9qnjKwL2h7QWqpWGr1iwm7qMtPGL7zU7J9kPLCdypsPl9SA>
    <xme:bjZfZyyM0PFXkqMrnXEItvBTLPiranQNmDDdteEKEdTcKzvdL3em-3fZmBchJHUt9
    HATmiSmPLPaae82Gw>
X-ME-Received: <xmr:bjZfZ-2Oq6ua51RejpdKZq80lJQ-Xa89Evz-T6lzV7V5jKldCzK6xc1ManOo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrledugddufedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeetgedujeejudehveekteetfeefhfffheetgfeu
    gfetffekieetiedtudehgfffgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeile
    dvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgt
    ohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopeguvghvrdhjshhonhdvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
    dprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhm
    ihgthhdrvgguuh
X-ME-Proxy: <xmx:bjZfZxA11McLxhiZPCTYtnIq4KzIBU98OabqKoWu7Xdn4C60w5rz-Q>
    <xmx:bjZfZyi8CsRo1kN9m0SwemvOyOcCQ5eakJMJH7YMlSDP7hZReHuaEg>
    <xmx:bjZfZ1qpZMOcEXIXsKg8nioIQMmX3epJxFhiALXxwuZEjVcuEDtgzA>
    <xmx:bjZfZ9iImD_43H8zMw-KG77aND5vbouxGBT9ZF4rPot0bMEAbMklGg>
    <xmx:bjZfZ9QgtZ6vaefl7jFZDCYMMt5RT_5F_Q5h2d5Flyf4SuNYJwd4eNTN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Dec 2024 15:05:02 -0500 (EST)
Date: Sun, 15 Dec 2024 12:05:01 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, boris.chen.czy@gmail.com
Subject: Re: [PATCH v6] rust: sync: add #[must_use] to Lock::try_lock
Message-ID: <Z182bbTgdGPEAb01@tardis.local>
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241212154753.139563-1-dev.json2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212154753.139563-1-dev.json2@gmail.com>

Hi Jason,

On Thu, Dec 12, 2024 at 10:47:53AM -0500, Jason Devers wrote:
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused.
> To avoid potential bugs, the `#[must_use]` annotation is added to ensure proper usage.
> 
> Note that `T` is `#[must_use]` but `Option<T>` is not.
> For more context, see: https://github.com/rust-lang/rust/issues/71368.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1133

I think you could add Alice's Reviewed-by from the previous version:

	https://lore.kernel.org/rust-for-linux/CAH5fLghjR4fctjoLT9Zom3drNMQ6vdE9hUTnZZ4Ms1qQHGFe=A@mail.gmail.com/

or you have any reason that you need another "Reviewed-by" tag?

(No need to send a new version, I'm just making sure you and Alice both
agree the "Reviewed-by" tag still applies to this patch.)

Regards,
Boqun

> Signed-off-by: Jason Devers <dev.json2@gmail.com>
> ---
>  rust/kernel/sync/lock.rs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 41dcddac69e2..aacc227536cb 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -147,6 +147,8 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>      /// Tries to acquire the lock.
>      ///
>      /// Returns a guard that can be used to access the data protected by the lock if successful.
> +    // `Option<T>` is not `#[must_use]` even if `T` is, thus the attribute is needed here.
> +    #[must_use = "if unused, the lock will be immediately unlocked"]
>      pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>          // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
>          // that `init` was called.
> -- 
> 2.44.2
> 
