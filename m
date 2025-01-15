Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9451CCEF8
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736964776; cv=none; b=bDZVwJ4iIRlUOf3if+AbkIFO9UqRiK5MWZNI6FYt0sS8A7hcuCcjTNyShZmQoAYPsu8aI7O65xcSnQroM3jl9Hae1f4A4M85coJ3RBnzcrnaRPDlmqd0ZENLxb6AV/tL9fxPrCrrot+9t8GR6sWvYh0XfOy+ANlT15ZWYPGDtBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736964776; c=relaxed/simple;
	bh=uRJogkx8aeGxHxPS2llrkP2w28EXnn2hGKEJBYhRGBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKuNHtKMb1lwfXlilBi9qe9ANX1r98UM7Wl78ElR0z8FgDKzCvbheoAGqz2svNYDKhw2oRaM34tSVSBsMcGMuwGGCFmA/Z3upcyYVCoqvBeXkdHyXKua5/Oklr0TEJhpIPMiuyJD7c5xXPnPyVsrnSnGITVju2timB9hhE3RnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K885b9V1; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K885b9V1"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d88cb85987so1053926d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 10:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736964774; x=1737569574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xe2YqRjScBkbwd6TV/58xeeVygII2WCfEs2WFcQ4Acw=;
        b=K885b9V1UGC+9Ye/17w2M/sAhaQX5Aqe6LHgK0JGIYi/GQSfVmgrxH3viRtSkCyVTg
         45A4zScU5OdXoQpylAgpHJ65Nnh3KjuW0W4DNGR1gvsL/C3Rh8HR1wdFhzBwvifGfWsk
         wCfbmw5Ms2P9ybB1KS80R2Zdz/iZTEirdlq9lMtupZKoeu6BzbM5cv5USxImXU8LsrQH
         n2DPPN10Am8oWoN1GygN9hTcZ2JU7TIsGNlRz5A5+Ipz71KZguI5pgylLTVLs+EGtC0G
         s15hzYU/CZehq1GAv447jB/dLyKIFQaC19PTjPahGn/7OlIN2AxqWV+yLdpGjI3Gwz3o
         GBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736964774; x=1737569574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xe2YqRjScBkbwd6TV/58xeeVygII2WCfEs2WFcQ4Acw=;
        b=pK3YlggUzq+RZhFZBCNF7tWdcjErBeMcV+KSuko5DmpfNotlwB8z2jQCqVig5luOwn
         A/5AnjPe4FncK+IfjY0rcwl2kCp2VEmXJpieFppvvslRklJ7+ckn2EMkzMzvs/G1VxJv
         Fdtrz2YRakx3wtPnln+PgkddUAzg959UabI7igzU9iGyoSuAX+40hToE6+ORfEbY1kcg
         Rch7v4NkBIjVrBL96tZUJ6g97nKWJyZjIzwd8qD+/FeT1JQ1g9dz/uVkHCJaXoqj1HE2
         DpEKePRdc7qe24xBqlderIihQf0INnQDSnS2OCs7G3w7qKSfSZHq6rjla0ts6qq1/hpQ
         E0xg==
X-Forwarded-Encrypted: i=1; AJvYcCWPy2NN+GlHUogeEK1jfzIFdvPoPswRXPAk/btAWzxLJ6Q6YpxhRSXtEDK20orenroxsIC6pY2Cf18ZyYaUYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiqFRC/WxWRdeOsQAtJvINUosmUbHep2Za+k75SHfXWFNWJ43
	Tgo2KmOqlZo1TenQ2YVFkSXDNjrlEsph1Ib1uNGxchN2V9vz7SoM
X-Gm-Gg: ASbGncsSbCAFR11VKL3POmSdNLVsQ8+E1wEgQaU+Jvk6Zc2RXLDN/0m1tVkTxud12Gr
	9zQQRZJWeo9rrJUpmBVXYPv1ZKoxFVe6cXbB+fMPUh6W6tEMqSAFTb57pqWTKSVR/7iqvoTTAl5
	BT21A+L+EYyARm7RTsehbtCFV9wD3NOK3SZNY5vQK3V8EPUm7l62M6+hHkg709HCfSrsA9wsd8s
	TWm+d2wAIPZ/NqQk8vYFTvuPNU0V3yteI1lCvAysAznpR4i+cCAHzgNrEOdGrGqj1vr3jE8iTcV
	Qscn35+jmwId9xakm6Al3eL6/eRrwbGdMAnIJKgYl+HCKY4=
X-Google-Smtp-Source: AGHT+IGgUxe9teLygeHyRs1+BjInbNUE6dpF8u1vDrv51pb1qTij8Ej/WxBJHjbXpZkSkywVZviPjw==
X-Received: by 2002:a05:6214:230d:b0:6d4:1613:be3e with SMTP id 6a1803df08f44-6e192c74ddfmr62655536d6.22.1736964773815;
        Wed, 15 Jan 2025 10:12:53 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade73266sm67140196d6.74.2025.01.15.10.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:12:52 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0A3931200074;
	Wed, 15 Jan 2025 13:12:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 15 Jan 2025 13:12:52 -0500
X-ME-Sender: <xms:o_qHZ7TxKUpRMIFpNAdPSz6pOVqtbV--U3FBIlJx1cavfThtGAFIsg>
    <xme:o_qHZ8y96XShrY5xy3UioQELg5OZ58Ei9SQfcFiXG1zpNjUAip9Vdog4xGWvD0qYs
    pE_g94yy65HahlIDA>
X-ME-Received: <xmr:o_qHZw1we5_iJKQAtd4EHmDjV5aDG1luSgy7iaXD-oboviJgbLp8onVKwXI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgkedvucetufdoteggodetrfdotf
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
    hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopeguvghvrdhj
    shhonhdvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgt
    phhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfe
    gpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhs
    shhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:o_qHZ7DPGaWLdPrXcELk9wVVvtwWyh5Eka68K45NNYzBaW_z54-zHQ>
    <xmx:o_qHZ0hSGc8DoUcBHDA2VSMRSr1beQZylZZ0PnEOBbO2Wr249k831w>
    <xmx:o_qHZ_pU-7iU3H1Bs1RtTlHRq_kGy323HIocNG2WhEhNqWV6TuvpzA>
    <xmx:o_qHZ_hbcSZkfNTfCONuJUXSQ1soFefl1zjvhQU36ppGiLbRl4WeQw>
    <xmx:pPqHZ3TFNRjl_8mCSzXHmz7qPk0xYm6EQGvlMT6t8jBzuTf6Q1URM7Wi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 13:12:51 -0500 (EST)
Date: Wed, 15 Jan 2025 10:12:50 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jason Devers <dev.json2@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	boris.chen.czy@gmail.com
Subject: Re: [PATCH v6] rust: sync: add #[must_use] to Lock::try_lock
Message-ID: <Z4f6onexz3Nuv3u8@tardis.local>
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241212154753.139563-1-dev.json2@gmail.com>
 <CAH5fLggqU+58A0c3btSkwMRHZ+=X=cHnzy3cHbB5Oc6kUi8Z=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggqU+58A0c3btSkwMRHZ+=X=cHnzy3cHbB5Oc6kUi8Z=A@mail.gmail.com>

On Thu, Jan 09, 2025 at 02:05:41PM +0100, Alice Ryhl wrote:
> On Thu, Dec 12, 2024 at 4:48 PM Jason Devers <dev.json2@gmail.com> wrote:
> >
> > The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> > currently does not issue a warning if the return value is unused.
> > To avoid potential bugs, the `#[must_use]` annotation is added to ensure proper usage.
> >
> > Note that `T` is `#[must_use]` but `Option<T>` is not.
> > For more context, see: https://github.com/rust-lang/rust/issues/71368.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1133
> > Signed-off-by: Jason Devers <dev.json2@gmail.com>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Queued. I reworded a bit on the commit log because of the tip maintainer
guideline. Thank you both!

Regards,
Boqun
