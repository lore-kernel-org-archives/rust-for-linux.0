Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A752D6E55
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 03:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764819667; cv=none; b=FwUKYI7v1l6TGmQWQwHCb2dhO1FA0OlPt4yWdoemRptyF6B8ZzH3H4x8d20M9qbwOzK9zKUTtzABFyjNlZpeNPj8jOD3XFgJXK63RiMtDWr9aPH6yejB2KMZU+ckYTGvn1o2QUuHChbml6P+0IBSPIHq8BwhwDtGATRo1yArJvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764819667; c=relaxed/simple;
	bh=LC4osSpGCreUa4Sh+6VWe4A6icuM/qPqxQSnre8blkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVgfZLlE8zNsNvKlTjJvLGeE8hd0Ga6fwZFGwF8a9Rsdye1ld9xRHEmuKUq5YWzEoZsuPKIdduyLgimkbbDgWJKdd75W0pK+VfOuMM+yRnZSLGzVocypc9q3IUXPBO3mF20OcCsf8lvDU/EbeFrhr+Nt3fJJEWRnWFgmUgi/em4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcpeDRhO; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcpeDRhO"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2f2c5ec36so46465285a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 19:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764819662; x=1765424462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0yI/ZMaHfMoZMYcKtIejHADkiQoo6lAfo0D4lYVaDo=;
        b=IcpeDRhOh9O/s7YT1OS4onVc0xK3wNJn+Zn0tSX0bt0bm7gIz1xlSVdE1zZqO3Y4bX
         Mqva3luXgoO4WWgCViy7965aadQQ26JhBJ3mWVKco3Gzwx1qoqBXnxjTV1jsCqQiyrMY
         RGwiYFEcWoDfqIv+vX2WOlqU7SVLvyI8Z9Ww55HalRrOmgPVNYWGMj6D6R81olCZGFoJ
         qlN+277wlG/vKYbwDKZCvyJBcdQzArltQscbd/w3rTMZh03L27iXJJGndIwRD0T6hnZU
         XBdUaRgiJUKBJwltl0o/KYuVbbrjuiwVPwWkGHNmqG1tHqPuyHgAtld34iFF0svy5+Mn
         XhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764819662; x=1765424462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0yI/ZMaHfMoZMYcKtIejHADkiQoo6lAfo0D4lYVaDo=;
        b=r/EPfQ08d8AtYLPZTizYTRUMHTfWyc56V70hJxFCOWLsoeAv6h0CD2FpwGS/euqcQO
         bgKcB7oP8KHAMDBq2mTUv7UAu1ZQAuRCTS1BNR8PHX0OuA42R8H0bT+DXMXwHO6CMkP2
         +X+aPdqMTRtORgOPEtQGaEaOztP0DMKsJFXnV4SJhIf9FmNv+myW8o4qD1NbP2Znu6On
         GYAXr9fA4UD0wB1tlqWzsy9m8fSTvrC1eD7iOhhHK8jRskLoyZnUnmNrfDYMFP05LZiK
         p4fbFweVLnH/xWzKWHIqTRviRxjpqSlJwy5fQVV/DjEKkIppXjDxX3lffbVZKVq5yGOO
         uIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJTwWDqp//QNF3kh8D1ujH1Zx4zVYrvlBVlH0siqcEyXkE2+k4ac3lIPhlJTc+NieC6wnh7PGyHkJeoBNOOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQl0t+va8xY0buCZkGylzSU06ghi25rfI8PBiR1cQ3e2M6wYly
	jM8z9P2h9igyEpGeJ/A1y0MUq/GlyACbKjj7E9UycIBe40+7Zlek6xHd
X-Gm-Gg: ASbGncsHIsci4/90/z+jjYl1dBqRnDWrvCk+rSLApY3+R0F94lo8HyAqX4XBnIgXEYa
	CltnFW5D3W8S9XEq/9VhFK0euOjI8A29jDxwQkuK2AeC+KZs7dX8qNMAX+jMfA7BCtsaWWDoNpW
	3kDISKL0FKqN8hQDa7anCBPk/Ucr7a6cY9gyAXAP90riu3QSkXDLsUcPndLMKjeT0EN2s2aSa1X
	C5RQQK+RAhwBdsVHVKVlRScdUuf7+sUnz6n+jJr7jkJhJBcmGFAleoH5LvlWcLM27V2CVMss+7N
	AEuDZxk5vWYaI2rJTA6fQ90Yx9Emtse98PfmWk5rIOfoBVvTMjVVsecVSGMPdsrszt6QdMowHt7
	7Pt+SYTYT9T1D3tWFnHbPeNayB5l1/jlcOIXp0tKbKGkGZUvl5R2EOOuylmCX9YBGdKpC1tVKgd
	elrM0e5MVtULI23uWZe/TAmlg+jYL6ERH9/oXfQIwBTTHvmTI4J558yOwNS0yKlM/w8tVJSoqC1
	7ZQJ8HK2uqeS3tICa2aIjnRcQ==
X-Google-Smtp-Source: AGHT+IHKvhUAeOJJV+XnsT1Q3Jnndj5WK+UIAoxGNhjrXHpmH75gX8NkbR05RuKNnesBUvczjFuN2A==
X-Received: by 2002:a05:620a:319f:b0:8b2:7679:4d2d with SMTP id af79cd13be357-8b5e6f7cc06mr687754185a.63.1764819662172;
        Wed, 03 Dec 2025 19:41:02 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b627a7a0b4sm49839885a.27.2025.12.03.19.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:41:01 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A516F4007C;
	Wed,  3 Dec 2025 22:41:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 03 Dec 2025 22:41:01 -0500
X-ME-Sender: <xms:zQIxafGqmhXkzARD-P0gl6AWY4HN5jbLDHxY1tnpYC-yt2AF-A2AIA>
    <xme:zQIxaQBCYVpVY_uc9QmPfyM2VhNzixll3DMvL9rryUDfVDalx5Flsn3B9qX07KsOe
    _K08AtSWsEv8awLVgEyBNu_zD-ZSzYuj0omdXGWlGLIja5OK0odtQ>
X-ME-Received: <xmr:zQIxaZxnLHwI45agjA6Aj1IPL7aQEgLIqO5Qsbt9O9IgWeb3itfv8FCquQGeZk4k0C0Q2glgQ8SzStSmF5Uu6cMj_-r5mfiT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdehtden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedu
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnoh
    hrihesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhg
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtgho
    mhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:zQIxaeeMTsBxq2Ow8X0qc4oioa_2KLseKkZfG9tFrxJhJxlDm08T2Q>
    <xmx:zQIxaWsQaMofHMHovdMb0uSs9w_awysBPwFj_QrYVelmZ-J1rHZeDg>
    <xmx:zQIxabBe0TcjNKlJhr4NWVx2Su8PCmm-3O-uXvpWnd-g5TVzUg5cOQ>
    <xmx:zQIxaWEE86vLH2pNiUCs8yL8TmAcsUB2Nxq6Utudd3tVHI5MNrwcbw>
    <xmx:zQIxaTuDtPRFwbUfFj0WIW-Pc1r4ya2N9Jg5u9kokcXL76j__c30fKqR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Dec 2025 22:41:00 -0500 (EST)
Date: Wed, 3 Dec 2025 19:40:59 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 0/4] rust: Add i8 and i16 atomic support
Message-ID: <aTECy9UTxhfz3E91@tardis.local>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
 <20251203.124148.1859835796360203240.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203.124148.1859835796360203240.fujita.tomonori@gmail.com>

On Wed, Dec 03, 2025 at 12:41:48PM +0900, FUJITA Tomonori wrote:
> On Mon, 17 Nov 2025 09:10:31 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
> > This adds Atomic<i8> and Atomic<i16> support; including
> > load/store(Relaxed) and load(Acquire)/store(Release) operations.
> > 
> > Relaxed operations are implemented in C's READ_ONCE() and
> > WRITE_ONCE() macros.
> > 
> > load(Acquire)/store(Release) use C's smp_load_acquire() and
> > smp_store_release() macros. They internally use the appropriate
> > architecture-specific instructions.
> > 
> > v2:
> > - Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
> > - Rename smp_load_acquire() and smp_store_release() helpers
> > - Simplify the macro to generate atomic methods
> > v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/
> > 
> > FUJITA Tomonori (4):
> >   rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
> >     helpers
> >   rust: helpers: Add i8/i16 relaxed atomic helpers
> >   rust: sync: atomic: Add i8/i16 load and store support
> >   rust: sync: atomic: Add store_release/load_acquire tests
> > 
> >  rust/helpers/atomic_ext.c            | 44 +++++++++++++++++++++++++
> >  rust/helpers/helpers.c               |  1 +
> >  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
> >  rust/kernel/sync/atomic/predefine.rs | 24 +++++++++++++-
> >  4 files changed, 116 insertions(+), 1 deletion(-)
> >  create mode 100644 rust/helpers/atomic_ext.c
> 
> Boqun, any thoughts on this?
> 

Sorry for the late response, the patchset looks good to me, I'm just
waiting for more reviews and some free time to take it.

Regards,
Boqun

> If we build Atomic<bool> on top of this patch's Atomic<u8> support, it
> seems we could replace all of the Rust native atomic types currently
> in use.
> 
