Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E228D8D0
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758044413; cv=none; b=S2AQiWt2RZHbVOfJkcG9v6G25vHMo/j6iucNUQH/rkw0/M5nUiQHyg0ZItNj1tn/I45RxB+DmMeU0rIWxekjS3Ni99Ho+chpxeNEFg44GBNNHxrXtgcFeFMiL5e9qkN/RhsjerNYGzaz5dKfI1gBo8gQ8cFJCamrko/lTK/5l1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758044413; c=relaxed/simple;
	bh=PxvetKEOhfVbyfSpwxBKJTHQyvB2pN17CD9NoGUgrms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxMeOeVAodGIyR11IZ5YXThAojdX+0r6VSqmA0wybg3DvSFfBO5GmZ7vAZ+AtSW4qcS/2bNhbCXD32gSA/u0TYH+PlhptuqJMNNs4pOr0XQ0S+2i6VGjUZYIuzK9EB1RkNNzfFVsw0a4ePlVFyl1onhwMJjjwtZjM1SCUgd3414=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9g5BGvH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9g5BGvH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b61161c32eso71661131cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758044411; x=1758649211; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JHjtAeALUMqVAF+B7s3r/BTz86GftVTXFBmSjBBmByk=;
        b=Y9g5BGvHFJDUpPxjg0B2WJ71FjRwkSo9rlUMqvNyLZv0X4gTU0XSUGYdPZTG+M7DIL
         lpTm1zk/P9aP1XGsnrQf2e6Oy6fxUy18VveNNwosZ10p4/wjmTpSCScN/cEAKL/F/vGq
         uYp1mlPWtCl9L8NhVbuNVUuw5SiXXjitTSbP/QguEMyRRXOXPvw95098LCBi0JbOQDtc
         mnBOzdkm7d7cTZ3YvPao1fgHQOWRm/MwZVhhk1DphAjd2wKsfP2Z9bH/cM4lGwV6eyMQ
         yyLk8OST0ZdupY9Pqod1cbwU8tK2vr6LD+nVQZeKFInfxxAixeb7EGS5fjyKvxdVP8Ot
         ESiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758044411; x=1758649211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHjtAeALUMqVAF+B7s3r/BTz86GftVTXFBmSjBBmByk=;
        b=drfGMNTLZlG13IsszgkQkrNjjTiH8+9pJOJvjGUd89uTIv46GzIA2LntspV05pJIOx
         PWZn0BGbjq0funtX65JwAAxJyFX9V9Idxmjt3VDOn4IDMz3cmGKyLXxM9G4KZI9/NGlG
         Ptj7Hv8+3hWie4cJPR21p+PeCUzklw+YyMRrpei2jJH2ygDLeDON3rxuTo7inaCof/fd
         Ox+q4+IK8jn9kCJySNj3S1b8xl6CnyAIEkTaSfbmKOgDDWVgZJwQ3BxGdfZEBXmU0GrV
         x/OFZCRQmnMLfeaW/hKvRv6nrEmlhgeJQ1M7Xu1S7V82X9qRo41yItbzZJC3tk3U8tvY
         PoAA==
X-Forwarded-Encrypted: i=1; AJvYcCWWVloy0m8+mN3VH4Cf4tlDwPT3UuuqPuv+Yh/QO1Cfbr55e2VOpCx6mK66yjQgu+2YT9EoVxm0ltpcy7aXjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOMVeS00O6jEAmoBEbUvX/h3P7LF/U4HQn3fm6YiAhPn+gws/
	1l68wO3wIkwHB0qxG3PJJn3VrUwSUZbXUOKZoOMmQLHWFc0Ed6J4gSBQ
X-Gm-Gg: ASbGncuT9WCjambdzjID4Ke7Ms4gyT5xprhvU47fqvcU9DJmdOnkm2zlQXk23eriFyO
	KR1kMujjQfFiZBlswXnsZ45UEqAlmMtf/xLXhNv+MQDZCYhro2cax1nmlr2MeZoWUVqMG0grLZU
	XlodHDoucVs8ws4hUQ0/RJHkkTqcrN0hdpja2tOIi6P5FQp3AJFbQ5bpeJsoQXtxGMjRtLBNyXy
	bPJ5N6Pa79fypel1jEUAu2p/ua4hrqcqkE+PSqOx5Mn2t1qS4mlAUT3Ny7dpTduBtdVLlp/TzZH
	qytiEMfvvvGrzlC6OIzMiMjhc8fC4FHa4SQqxSJFyoQmNyX0eJuaHvKzOn6bBLSOP6+khQMDyDy
	E/HQlQwq6kVQtDgMzOAHhXTJlGZwRw2DhHUYWvCWJWB4gA3oEbQr99j55qEq4vghC1nd8KJrw8x
	2FjBqdTE2uW9A+4L2q/UhJzxbdsul9zF9oyg==
X-Google-Smtp-Source: AGHT+IELsH96NHZ4V1/i4oKsQYgGeqITcLKs9/I1AQ/N8yOvozUhQxZYMpvNpRkJ5TJD97CuaZUFlQ==
X-Received: by 2002:a05:622a:256:b0:4b5:ecc3:694b with SMTP id d75a77b69052e-4b77d014426mr178894371cf.10.1758044410811;
        Tue, 16 Sep 2025 10:40:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639decd84sm87780841cf.50.2025.09.16.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:40:10 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id CA929F40066;
	Tue, 16 Sep 2025 13:40:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 13:40:09 -0400
X-ME-Sender: <xms:-aDJaN-9Y06rbtghemJtEwjApYjwQXfGadMSyPOwxuN1CrE-iDVteQ>
    <xme:-aDJaF3UlyKibAJUrRZkx6lPGGkY2KZtqke5ygD13MB5J2ezfe9RCez85GaQJ4mvL
    G8zSRjniegfdfk3mQ>
X-ME-Received: <xmr:-aDJaIC4cdi2qF87RhsrJ487cd3nKJbmrClFmVvVw5gkxD7Gjt0nC5l_jymbko_yZU3mO8UnrOUlNxJLAsyLOuxHLCGx97GSo6sDcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehnrghrvghshhdr
    khgrmhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqd
    hlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgvghhrvg
    hsshhiohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhfthdq
    thhrihgrghgvsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehojhgvug
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:-aDJaMAqEC3lUKTN_LJI3CpkOLGxOZlDBsOzp_gnJe40i0KMGgH7-w>
    <xmx:-aDJaJOM8MF4_xwJEDkyO76VEYI_sVIvpZzwj6o8SJeoVxlKrky0gQ>
    <xmx:-aDJaGOf-8-5ZG8k0o-UXKLyPxL1UtYNwtzqzaV7Zv1IDNR6_oHsMw>
    <xmx:-aDJaNtqwgUjPsWzNHczuxJ21j4b3cRN1Z_E9GZtvXdNZDo0Tdt2ow>
    <xmx:-aDJaL9gS9abOkrDdNam2n-ylBTFpKmvor7Cznxa36tZb6immwH6ujjc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 13:40:09 -0400 (EDT)
Date: Tue, 16 Sep 2025 19:40:07 +0200
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	rust-for-linux@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
Message-ID: <aMmg97aXBLMb_4a-@tardis-2.local>
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
 <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
 <CANiq72==_ch0_7ZD8EEc2AOW7Yz1-b8i2ae0X6xDSkLJy=Dm6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72==_ch0_7ZD8EEc2AOW7Yz1-b8i2ae0X6xDSkLJy=Dm6w@mail.gmail.com>

On Tue, Sep 16, 2025 at 06:40:42PM +0200, Miguel Ojeda wrote:
> On Tue, Sep 16, 2025 at 6:26 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > Anders bisected this build regressions and found,
> >
> > # first bad commit:
> >  [eb57133305f61b612252382d0c1478bba7f57b67]
> >  rust: sync: Add basic atomic operation mapping framework
> 
> That is very useful, thanks.
> 

Yeah, if this is the bad commit, I believe the issue has been fixed.
Because that commit in linue-next indicated the problematic locking/core
branck of tip was used:

eb57133305f6 rust: sync: Add basic atomic operation mapping framework
76eeb9b8de98 (tag: v6.17-rc5) Linux 6.17-rc5

one patch was missing in that version as I mentioned here [1]

[1]: https://lore.kernel.org/lkml/aMWMVQiZxE_mv7va@tardis.local/

Regards,
Boqun

> We (Boqun and others) are in the middle of Kangrejos now, so we may
> take a bit to reply, sorry.
> 
> Cheers,
> Miguel
