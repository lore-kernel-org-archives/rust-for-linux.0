Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379523693F
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943476; cv=none; b=tx8XIinyTxZc3GdgOPAkujbXEPvXs87oflaJdW68td2wKtm6fv0jHTr/oJUdaKiL0tuW9K24FtSssmRgbYcTjSAMNcMZTtzZR/Jlp4fb6hFTirsY8k3khXraqZ1Ad//tWVvhxzO2j3EmAPBJDsrDzDKIywmJoyGnlzzYI5zw8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943476; c=relaxed/simple;
	bh=NrtzVqIXEqwQEXdOxCUNEA7eLoDVDMP2vzzaHBn8dn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmmitVzZmF8IpUggT+Q0F+4xg9bWkBzw57tV/9Sl/52Q7Cgafc+MLDtEiF9PtxQ8AirvwqvpD5gN4pRKIte2k66b/tklhA0X9nDGQpfnQg+ra3Uet0FCwFZx42hWGd84yj6jlkliKCvT5OhDc/DgAMJrCCTrCxFu0GWsLjXDoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDwUb5EZ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDwUb5EZ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so129953085a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 10:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733943474; x=1734548274; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NClft/yXaXTRGj7pWCTs91Aen4/dOhiu2oymdOZwcwM=;
        b=WDwUb5EZggwcnS74z1Q0mCh9KX3ZRbFwbDutecPRD0gZgfhT5cq9dMk4LdrSVHUR6+
         +hgSrXTc0HHWXYgbuJJX5eMD+E8/XWTMzITEjVFx7iMpJwFfkJVF0DOlYPDM6+VAnRZ9
         +QOJbEmuFBjghb86mFOwgQ1+rBx+G/r6/VmoWum3XxtKy+cxL3AJ/F3ilEKn2bvKz+s+
         tNBXfHkY1w0p1bspfNbM4/S/Iv5yw/MhUlcZVfP1nRzb3VZa2V2tiSTm1MCnb76JWFW1
         sZq942bdCQThsmwhSQfIICd+Er0G3Q12tuK+tB2HlzL0nrLKgLznyObOzHP+2FTrc2od
         EtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733943474; x=1734548274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NClft/yXaXTRGj7pWCTs91Aen4/dOhiu2oymdOZwcwM=;
        b=JYsNOpwnyNfHTdI2rvExvK5l4wwdcSSDa4s9OYtT2Wrq5PeoUGL8mZIIpmXcGUO1A+
         zSL2cCaWqmvd8VZQAH4hS4PkAi4ApOqbFAJeeewBYFbNO3B5jYBuNXSKnVeEnKYgQdTw
         3Xkdqx9Yp6FuBRQUFqrpKJjTGBOig8JkGPa/mfj8MQVsYlaWp0J2qIU3wy01rU4ZQ9Ni
         1CmKAsfx9OCBLC5JARRZ4ev5YFzls97OCGT0Xqi+VunuqLylx0iXddFFEB0bfzwC759B
         EC3DrITBD/r6hRV9NyokSpV6xBbEeZQzVvSBTdpLKIMtj7l7mu4TNM9fKdklZNpnCuUb
         60EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7ORJ01HAbOmTQPsTAIJ+MtF7Fy9NRqzzRrBKiH+AjZCe8evuykMdijw7i9iPtOWEO8LGZsOzvy1ONyc+gVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrvioGzT6C/rXGB+zRdRf7K21EHIbV5kPj8ZE6VeyAIhiB0Jry
	euhO4dXGEPqXpvPixQMti7qZt9bqa09tx1ukc14wtl0XSnnhldth
X-Gm-Gg: ASbGnctDVIfZJrbGWc3cJXScg6mWIXZhXAJ/Z1hm+qGbjsu2v/Nxb4wVrdgB56gMXEZ
	y4kX1ktp3p/rWhLcUXFiEgbBn37b2dJetuJMub91Dn8uU1z8waEox55M8x7nhZI8WR4gm6TfnSt
	/axXDqls7A5vCQTLJhGlYEK67oNiM7R2s13QL+gfJh1lvlzJHs6PlI+qGUKexf8+9YcF4Zg2skH
	JmKYdIgq1g5/ARGojbSY2QBR6N8zV42DAQxvnxUSpweu/a6tB/zOtm3jKhuiqLUW2+jjR1mPL5a
	4NMWoqKzv7a5luELZkiE02dQr76O+VbZoQKAkU8axQRH
X-Google-Smtp-Source: AGHT+IEqeWwenq0QrqCOMq0ppt+Ih6awyLiqJvzRc6Q3f4Mcy8bqxOJF0UuWWE0cArKPm6y3/FLf6A==
X-Received: by 2002:a05:620a:6890:b0:7b6:d252:b4ef with SMTP id af79cd13be357-7b6f25a0a18mr65259885a.53.1733943473943;
        Wed, 11 Dec 2024 10:57:53 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6eb716f80sm99061485a.83.2024.12.11.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 10:57:53 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 28D551200043;
	Wed, 11 Dec 2024 13:57:53 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 11 Dec 2024 13:57:53 -0500
X-ME-Sender: <xms:seBZZz3z5LFHqa_1flr-FBnDTcOeGvkQdYMvvfI3JWDae0uDFFiqrA>
    <xme:seBZZyF7Ntvbv4Vxr3qqMz4DliU1ev5xGAJtZ2zL2KjCbSD2RNGDwnXj3qTVgjsNO
    CygyE26S357r82Trw>
X-ME-Received: <xmr:seBZZz5rnmCP5y3fjcbKaPmXmkA7fJOkqOmq1dNaI13VdDLVOXqYorSXFU4i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkedtgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepteeltdetueeiteegieekleevtdejgeffgeel
    leehudehgefhtdfhffegvedutdetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpud
    ehjeegqdhmohhrvgdqrghpihdqughotghumhgvnhhtrghtihhonhdqtghonhhvvghnthhi
    ohhnshdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeg
    hedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomh
    esfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepuggvvhdrjhhsohhnvdesghhmrghilhdrtghomhdprhgtphhtth
    hopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrd
    hgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhu
    ohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtg
    homhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgt
    phhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:seBZZ43J2F13j4q39hSArMrlQ_f-CM5lEo6KH16TtCwyzuT-q-9DuQ>
    <xmx:seBZZ2FDogrwCadM4kV2nNS3fYgpU5BU_IwI1_VuB9AbBuH8gN3CEg>
    <xmx:seBZZ59y8gu729iIPQ0KJxuwR87jPrJU5fz8W2_l8efcxI7NBRI14g>
    <xmx:seBZZzk5Z-jzWVHcJXTO1qDJjw1lk2Th0NZrm_XuX84zf5v6ID_iTA>
    <xmx:seBZZyFgmeiU9saLQaRSjs6dDhgN0W36viQL3HGlm2ItUPCF2ugZDx3n>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Dec 2024 13:57:52 -0500 (EST)
Date: Wed, 11 Dec 2024 10:57:51 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: jos <dev.json2@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, boris.chen.czy@gmail.com
Subject: Re: [PATCH v4] rust: sync: add #[must_use] to Lock::try_lock
Message-ID: <Z1ngrwGgJdg_mSFL@tardis.local>
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241211020507.103687-1-dev.json2@gmail.com>
 <CANiq72nxqdZzD-TtZbnHOdmMxMkXuafquWpsHOeW5rWFJbhKZA@mail.gmail.com>
 <CAOJvc-aJJoUh-YSNwWX21vT4O8tuLSOVb10w=WUV7cFcPJvf9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOJvc-aJJoUh-YSNwWX21vT4O8tuLSOVb10w=WUV7cFcPJvf9g@mail.gmail.com>

On Wed, Dec 11, 2024 at 09:05:32AM -0800, jos wrote:
> > Can't we use the same warning message as Guard?
> 
> > #[must_use = "the lock unlocks immediately when the guard is unused"]
> 
> That is what I originally had in my first patch and how I understood
> the annotation should be phrased, but @Boqun Feng maybe you can chime
> in with your input?
> 

Hmm... I think it was a mis-communication. In the v1, you said "..but it
currently does not issue a warning if the return value is unused. This
could result in the lock being unlocked immediately.." I thought "This"
means "not having `#[must_use]`", but you probably meant "not using the
value"? My comment is more to that commit log instead of the warning
message in the `#[must_use = ...]` block.

Anyway, I think the warning message in your v1 works for me. Again, to
be clear, my concern was on the commit log then. Hope it clarifies
things.

Regards,
Boqun

> >> +    /// Note that `T` is `#[must_use]` but `Option<T>` is not.
> >
> > Should this be a comment, i.e. `//`, rather than part of the documentation?
> 
> Agreed, after reading more documentation conventions
> (https://github.com/rust-lang/rfcs/blob/master/text/1574-more-api-documentation-conventions.md),
> this should not be part of the rustdocs.
> 
> > I would also reword to explain the "what", not just "why", e.g. something like:
> >
> >    // `Option<T>` is not `#[must_use]` even if `T` is, thus the
> > attribute is needed here.
> 
> Thank you for the insight, I can see how there is missing clarity in
> the current comment, will update in the next patch.
> 
> Thanks,
> Jason
> 
> 
> On Wed, Dec 11, 2024 at 1:45 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Wed, Dec 11, 2024 at 3:05 AM Jason Devers <dev.json2@gmail.com> wrote:
> > >
> > > +    /// Note that `T` is `#[must_use]` but `Option<T>` is not.
> >
> > Should this be a comment, i.e. `//`, rather than part of the documentation?
> >
> > I would also reword to explain the "what", not just "why", e.g. something like:
> >
> >     // `Option<T>` is not `#[must_use]` even if `T` is, thus the
> > attribute is needed here.
> >
> > Cheers,
> > Miguel
