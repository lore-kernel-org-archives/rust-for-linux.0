Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C57CF16;
	Mon, 27 Jan 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737997156; cv=none; b=MIaKnBFsS16SJCqum32jymkX5C4gN+eVHt5WFAKsqGtL5+mu0SRtU7vY1UTTZjtnd9YNR1//OS2KdNTQGrH4qN0OBkuqZfrdmXEoUbAqzjYtaawCooWDWIrhrtqazZOnNHLAOLfsk8Qq+HlXWbmP8sRx7wsHzTtkHWRjpckwt5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737997156; c=relaxed/simple;
	bh=IyhY8Nc5rHINPUEfT+qN2JUY9ihr8tk6OU1St5qmS0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLCY0vwg2u24VGe2ZbZX3jOVbRlA1mpJOg+PgdQs7CjGcoaIYxT5T5RdXowu67KTdq5M8Y1sO2oc6RmfVJJww70rH/pKxA4p8ebxSNg45dEmUgSsi5619NVZoD5t7mBIKxZygHdRZ9wM0AHDcOTpiNlp01FuqVCEngPvlKfamaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoioORkS; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoioORkS"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dd0d09215aso38005646d6.2;
        Mon, 27 Jan 2025 08:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737997153; x=1738601953; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nboNSWpa+9naq6E3adySsjqNVG3tF96PrADTuFIhRe4=;
        b=UoioORkSuqifhqQCXcLDxRj270SZMF9XiaUz2GuyENuZ49Bj0HevLZ5WzfnxUb3dBI
         7p4kgQouRcLNEfnAkDWbYkwopGmb1d9EWZ2z0wmXcw+v4cJwq6qI0pltD9mVDbbBrg6f
         N0i63gzw2VrCEWm/551+8PJtC4Rk+0ori19ywdO0k0AgHirnIYtqatNVhieWXaPxeaal
         yxXY6Ja+lOxE3O6M1qkuokCUsDDwseuAOs6G4hn7lENC35t+b1PxhcwlQzIzJ+62mFGK
         YO6FgJygigIN0il53VZ2gkNil7ea6gDc6xuGyJm+f3bqFbIkeVxi8BSOP4pz7hcZMN3n
         5muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737997153; x=1738601953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nboNSWpa+9naq6E3adySsjqNVG3tF96PrADTuFIhRe4=;
        b=AxK6HexAlZhhG9Rwkfh2KEikAzM8Qtd8iOgsnG6FLpAqeEN+ghrGT6rDBuyf0McKSh
         sP0BMnTTTCnDexejLF7dm8VCQTjFQsvo6PN6fNOQBiUhJM19mQmjyrZezFuc9xOsVwpL
         uWk50pZNycY6xpFt8fZAnRuQ7LaZHSdohk1w3zJxET658UjVmTLL5B1XnDleXd36p1cG
         PLckMC/3C9LEwDak37AupnHhmMLYei28yfwsRN3yVQ0kPuyV5yXuyMmCC9jOnMY9mhR0
         S+1j/1f+o7e+0BojTxW7Akq7UU2G8IXarA6aKdsQDIYhfglh7tV1CTch2PpXkvwOOLs/
         n0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyKrK0/4p2ZGovdjZSyNpJ61WfZ2vLAtkvbxoATjm6VWbZx1BWsxwlqDa64mKQSHdLBfkXIEdTEb03dBk=@vger.kernel.org, AJvYcCVp/D0v5ojbKm6hXqqWwq6H9Rts7mhc6aW7TpiXi/jzfWf5gNDy/Yn0bbzs6BCLe0UVpE9a4uCQEYLLCjaXVYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzV6YsIuOjx7xmLA2qGhKA9tHkE9kiWOKEpU9HSdxAYne+jM38
	0URThPrzcSF85L/4ZPoxqm3BDbBINjjufESuMPxbMdP8naIjFDM6
X-Gm-Gg: ASbGncsCJeRCgJbpYVfnN9WL2lpYhGsmWkd4uDEF+v7n9DF9YoLTI7PqIgiFOMgvyYu
	qvXmE8fpe19SD0XfM6ZxGjhyMZBakpB5NYoahG/EvbR/5h/0lEVuA6TNBZZ1OvobcCmqBcX2ujC
	Zt102zw6UGO/TwAaBNDwke4+sNgJkySe+zKkyuh6AmixYo4T2GVneW6oOMM1sPfD68T2bwhor2W
	L4mwVJGBi6R8p/gdeXD0e2OQ890CWlsxcHnnxPcfvA3mhxQoPFETEcB0gxMxzHtOOWxfjAshQ3r
	JTm/vCH4pnkSa7EZJE+/+AtFUTIlDLBgQVlivf8d/WK8nhJUZg5CvXZkGzRhwbe1YSpBnq2QVw7
	ppYzKEA==
X-Google-Smtp-Source: AGHT+IGn3n3gALW0Hqd7/opgdSZz56Kb4U7C9/AHgmAhhPjyRkjUZEVHawjbykmTYdWBahkcmZd78w==
X-Received: by 2002:a05:6214:240a:b0:6e1:715f:cdd0 with SMTP id 6a1803df08f44-6e1b215a5bemr645850396d6.16.1737997153215;
        Mon, 27 Jan 2025 08:59:13 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e205ac48dcsm36347816d6.123.2025.01.27.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 08:59:12 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1DB291200084;
	Mon, 27 Jan 2025 11:59:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 27 Jan 2025 11:59:12 -0500
X-ME-Sender: <xms:X7uXZ4uimpxfeozUASjBH_HlkrWcuAd5kKMqZGGUgMOazR3bbnLDGg>
    <xme:X7uXZ1cz-kUQ_Ic03shGAecfkeA79XxQySZCeARSSCQif8xbRvugZuC98IIJaJaqq
    ECYUtQYgTK6XB60bw>
X-ME-Received: <xmr:X7uXZzxePFMKL-eygBJGnJn6EFtsTURx2ZftXhjAhNlHWI6AljKP9kw3NLCIXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeel
    tdfhgfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrsgguihgvlhdrjhgrnhhulhhguhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprh
    hushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpth
    htoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggu
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:YLuXZ7NzkdnQaJwCdwpyI5PF2T5LLI7umgbIm_n1J0evrrTueiaeTg>
    <xmx:YLuXZ4_ZKHBiySGWY4953KLLB1URc4E74IX7yMkKY7vtKHPvsd-L8w>
    <xmx:YLuXZzW4lYeslH6Cw3RKigl_54mIRdCDaM6hm6R45EV1zj5gAvzmDw>
    <xmx:YLuXZxeeuHdjS322o-C92OAmGud_IPu3ymd0hUngGPvmeaJXrKn5fw>
    <xmx:YLuXZ6fGiI8j5BX2XPFArSCT_1G3t2GzHvQDQO6saJoIKJEahX1gUeQ2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jan 2025 11:59:11 -0500 (EST)
Date: Mon, 27 Jan 2025 08:59:10 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
Message-ID: <Z5e7Xv4Y9007Ia0a@tardis.local>
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com>
 <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <Z5dh6cSnNxwbefJX@pollux>
 <CAH5fLggMSiHZwHJ3md0eH7smyDNVL3L=Sre7F0SXSSnPrJiO-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggMSiHZwHJ3md0eH7smyDNVL3L=Sre7F0SXSSnPrJiO-A@mail.gmail.com>

On Mon, Jan 27, 2025 at 11:43:39AM +0100, Alice Ryhl wrote:
> On Mon, Jan 27, 2025 at 11:37 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri, Jan 24, 2025 at 08:27:36AM +0100, Alice Ryhl wrote:
> > > On Thu, Jan 23, 2025 at 11:43 AM Abdiel Janulgue
> > > <abdiel.janulgue@gmail.com> wrote:
> > > > +    /// Reads data from the region starting from `offset` as a slice.
> > > > +    /// `offset` and `count` are in units of `T`, not the number of bytes.
> > > > +    ///
> > > > +    /// Due to the safety requirements of slice, the data returned should be regarded by the
> > > > +    /// caller as a snapshot of the region when this function is called, as the region could
> > > > +    /// be modified by the device at anytime. For ringbuffer type of r/w access or use-cases
> > > > +    /// where the pointer to the live data is needed, `start_ptr()` or `start_ptr_mut()`
> > > > +    /// could be used instead.
> > > > +    ///
> > > > +    /// # Safety
> > > > +    ///
> > > > +    /// Callers must ensure that no hardware operations that involve the buffer are currently
> > > > +    /// taking place while the returned slice is live.
> > > > +    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
> > >
> > > You were asked to rename this function because it returns a slice, but
> > > I wonder if it's better to take an `&mut [T]` argument and to have
> > > this function copy data into that argument. That way, we could make
> > > the function itself safe. Perhaps the actual copy needs to be
> > > volatile?
> >
> > Why do we consider the existing one unsafe?
> >
> > Surely, it's not desirable that the contents of the buffer are modified by the
> > HW unexpectedly, but is this a concern in terms of Rust safety requirements?
> >
> > And if so, how does this go away with the proposed approach?
> 
> In Rust, it is undefined behavior if the value behind an immutable
> reference changes (unless the type uses UnsafeCell / Opaque or
> similar). That is, any two consecutive reads of the same immutable
> reference must return the same byte value no matter what happened in
> between those reads.
> 
> If we manually perform the read as a volatile read, then it is
> arguably allowed for the value to be modified by the hardware while we
> read the value.
> 

Do you also assume that volatile read/write provide some sort of
atomicity? Because otherwise even though the read/write may not be
considered as UB, then results can be load/store teared.

I asked because I think in case that we need atomicity, we should just
use atomic APIs.

Regards,
Boqun

> > > Well ... I understand that we did this previously and that we want to
> > > avoid it because it causes too much reading if T is a struct and we
> > > just want to read one of its fields. How about an API like this?
> > >
> > > dma_read!(my_alloc[7].foo)
> > >
> > > which expands to something that reads the value of the foo field of
> > > the 7th element, and
> > >
> > > dma_write!(my_alloc[7].foo = 13);
> >
> > I really like how this turns out.
> 
> Yes, I think it would be a nice API.
> 
> Alice
