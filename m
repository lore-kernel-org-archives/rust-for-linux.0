Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674823EAAF
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767756388; cv=none; b=OKj7rYtt+lS+fRzuTz24ytEgyvh4qz3GZGtYPpG559UFju+XW1lXEGwgp/+rxoH1jXW7Q9BIwIev8kCkgDTRviwV9VkTpM7APO37fQDfmTmKJOKLAzmpCxHTcGK/t7MgmMS7tGrKIsXFaujFRdV8rkH5bstF3ASRbElt+X5u7uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767756388; c=relaxed/simple;
	bh=QNfB7qsFGoVzm3gTFBsOnNutw3g5i/A0OYaVZ0gAl4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIcpIwT4Jyr2bN7TyFER0+crIemQMkdh3taNZqNbXiuQsdhpqBMnPncfFhDp/FIYlpWoHOngmll6/ACe/pxXoMmhVKg2M2UapFNm5MX3wy4pP5amk/dZYlY6NEBmxdLblpIlMDBUNetfbYymjDXxlaQSnj73OUqFIAhDu64nBcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B//LLx4H; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B//LLx4H"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4fc42188805so17117851cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 19:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767756385; x=1768361185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h0+D1N2EwKstZ1cEtH04fsN9pDOjZ6UBkqKLK2OwqQk=;
        b=B//LLx4Hv0OdTYgczl2BSBU+eovyNayK6Z4j6TeuJehHFiop0k1rGNEfpSBUn9cDVO
         f6Q/wcZ2Tfvwz0mCpv640GEWt7YktYCdZj12J63EnS3ugTxmmYyj3OPYi6IHiLOX+xQP
         dRvLc5zYPZb6EPJcAHPd0wumscrq+GklkFJsgW1NHZqCBsNIL4UknwBV/8zqP0h5DXzV
         zcAgVOsNVZ7W0xTHz/wfGECz93eZDM6uFCkKMacyl75MNdwT77Tf0gqn5GP2EmKYOOxQ
         /ahFQAm8R30FQfwohRlQakLVTfVHkpFQ2o58//kYDfGAR0BrZkBlWrujq9B5P9UBNa5S
         aj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767756385; x=1768361185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0+D1N2EwKstZ1cEtH04fsN9pDOjZ6UBkqKLK2OwqQk=;
        b=d6YsUbyyqIHx/ayNtLF1PWqI5Q5icseWE4rwK27QVbvnevBy9UekWQdT+1SLvU/8Jt
         p2+RRMUWy5QXe5CA7GIRk7MlgYKkOQhoJ0UHXLE9kY3nUMJb0dqVWAJIqwRd4bJuqgc5
         beoAucPsStwYUyTF73VPTk0IXKqzB4VHkg78Mq/rFv56yjKVORbztDobFRIia4/x2hhZ
         HRJzRdzIMYmr/WURQOuHUWKc6Qfs8bnL2DlCSorcvxjl0b+PWyzUus9NHX553k8onjO3
         NX4c5AjLYJ5JqNRL6JgKIrN+Ardph2dHVqugGbE88wmuwR3/Auz0x4vdJfZBYRjK0qML
         qiVA==
X-Forwarded-Encrypted: i=1; AJvYcCViO1jiWf5M02XZC7I/s1FoY2Axt654xqBnfzLqCBzEdFxG+sJzTGR5/dN2p+BU/JvTY2fwKPTwwmipfaHjsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5bz2wqC8hksWlUAD9/VFeTAnYvVYyRKUiCrd2w2J/KWF7Y4e
	XN/RW3aVXxwfJYjT8vH5r1FYagflAALjg9PGsiZ/QnFu8lW5uBbZVvQG
X-Gm-Gg: AY/fxX6uzXcj2Vvb0eE+Ckexe2VRH8tjWVPjsA3NMxnHe7Obbv70OtvDM+UtTBXdis1
	1jCXvpskf8R8T93SbzRU5Q0kax8T7xKCmVLopqzCRWqtjqe4uz5Ki2JAJ/XyCYUrcj6Hbxlyif8
	h0oig9EA0OUxMBsl0o5AhRgXeq0Zx9/Zmp5sAXgPxieeM4noPyUbFAP+94IPaA73i1nTdRMAmWX
	oXd2rEjKqUG8+nOoUfkhxr/BcVx6WDoUzu1gmrGfmTzFWksVCYxSYwav1fixiTyT/V5wB5iJyTB
	UR6UlpNSeypeJ2gmsb5l3eg1zJLcM9sjaTdSMAksUecPLe+Ik8Sn54MyXrfTBwL3Ggjs6YfSx8L
	3dMiwU2SX14xIGKVsBGOimd7Lpg0VoYQGU2z37DgktaItQtJzDEKwOC/rkGTinhPTUbJ5Imy+YL
	OhnLQ0rSt3X+nxxHur4M+MnBdZbtKQye7yADXlhf88oRZO173FLiKfHuRD3VAvKg+xelBVswmmI
	EWYabfpw67QNDE=
X-Google-Smtp-Source: AGHT+IH9GJu9+EXUTtQe4Cld6zxjJM86QK6J7IFCcyJYBK6CzHtH8I+HuNVR/4VYN8X8s52VQMmiUw==
X-Received: by 2002:a05:622a:4a:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4ffb49e9d4emr13443651cf.56.1767756385253;
        Tue, 06 Jan 2026 19:26:25 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7a6sm25982596d6.12.2026.01.06.19.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 19:26:24 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1893BF40068;
	Tue,  6 Jan 2026 22:26:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 Jan 2026 22:26:24 -0500
X-ME-Sender: <xms:YNJdafQbBt23LSIEbz2IF1qhwqQHt0EgCbT6qJp2qIw9SeYCKXRblA>
    <xme:YNJdaRPmExH5xTVLA1Yox_Rk8dZneyZeimp9t54EEekJcyhpOJqjiSe2y3vwZIP3L
    B3kz_qznim001-lJ5WNMALvMisxRIlzGL0XQ1umX_7fqBrBiOfZ4w>
X-ME-Received: <xmr:YNJdaaRLcI7x_JFVFPRC5ydhDth-WOMpmDnV_6PNLRCXyBbAKZtfjqEq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdduleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnheptdegheelveffudejffegvdelgffhhfelkeeiieefgeevteejvdegveeuffei
    hefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheplhhinhhugidquh
    hmsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepgiekieeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrih
    gughgvghhrvgihshdrtghomhdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhl
    uhhtihhonhhsrdhnvghtpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghp
    segrlhhivghnkedruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugi
    drihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:YNJdac_jLZOivwUm7tjN7Nptb4VG4euEmqJ0Wv6HMzqlsO9NJ1p8zw>
    <xmx:YNJdacVxwWFWoylO8BmFTgUTJhaFRO9xOWd8eqh5MzVRh0DyXNyHIQ>
    <xmx:YNJdaSN2-Th14u-z9vQG5UM94-cgbE1lCeY_z36hd9pX-Mu8_WWMHQ>
    <xmx:YNJdaUekYAthEiyNR16VV_Pak0BjPHMuAIG5COTP6eMArihGZdkW8w>
    <xmx:YNJdaRxjQ3WCvid3eGgh00t0QZaZE5Gp9RhwdMrwyE4NPszKV2_kqgOG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 22:26:23 -0500 (EST)
Date: Wed, 7 Jan 2026 11:26:21 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-um <linux-um@lists.infradead.org>, x86 <x86@kernel.org>,
	anton ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	tglx <tglx@linutronix.de>, mingo <mingo@redhat.com>,
	bp <bp@alien8.de>, dave hansen <dave.hansen@linux.intel.com>,
	hpa <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	dakr <dakr@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Rust for Linux Kernel <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X86
Message-ID: <aV3SFWYUbN5t9LiW@tardis-2.local>
References: <aVxcAZe6AEXEfx3G@tardis-2.local>
 <20260106034034.60074-1-boqun.feng@gmail.com>
 <1064740857.79527.1767709243348.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1064740857.79527.1767709243348.JavaMail.zimbra@nod.at>

On Tue, Jan 06, 2026 at 03:20:43PM +0100, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "Boqun Feng" <boqun.feng@gmail.com>
> > An: "linux-um" <linux-um@lists.infradead.org>, "x86" <x86@kernel.org>
> > CC: "richard" <richard@nod.at>, "anton ivanov" <anton.ivanov@cambridgegreys.com>, "Johannes Berg"
> > <johannes@sipsolutions.net>, "tglx" <tglx@linutronix.de>, "mingo" <mingo@redhat.com>, "bp" <bp@alien8.de>, "dave
> > hansen" <dave.hansen@linux.intel.com>, "hpa" <hpa@zytor.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
> > <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Björn Roy Baron" <bjorn3_gh@protonmail.com>, "Benno Lossin"
> > <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
> > <tmgross@umich.edu>, "dakr" <dakr@kernel.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Rust for Linux Kernel"
> > <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>
> > Gesendet: Dienstag, 6. Januar 2026 04:40:34
> > Betreff: [PATCH] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X86
> 
> > x86 atomic instructions are used for um on UML_X86, therefore atomics
> > on UML_X86 support native atomic RmW as x86 does, hence select
> > ARCH_SUPPORTS_ATOMIC_RMW.
> > 
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> > UM & x86 maintainers,
> > 
> > I need this to avoid a build error for Rust atomics since Rust currently
> > only support Atomic<i8/i16> on ARCH_SUPPORTS_ATOMIC_RMW archs. I will
> > add it to my upcoming PR if I get some Acked-by, thanks!
> > 
> > arch/x86/um/Kconfig | 1 +
> > 1 file changed, 1 insertion(+)
> 
> Acked-by: Richard Weinberger <richard@nod.at>
> 

Queued with both tags applied, thank you both!

Regards,
Boqun

> Thanks,
> //richard
