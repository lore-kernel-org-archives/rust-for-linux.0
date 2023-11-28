Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFh4j00t"
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A04B7
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Nov 2023 10:31:22 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-423a9cb7e80so17123861cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Nov 2023 10:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701196281; x=1701801081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PTFy/ub85wR/nyvzrzcV4Xaa4IQTkz8R54DFVrDccF8=;
        b=dFh4j00tgo7EHOid2fI4iq4EVhT2rFolro2oM/szVGbQyKeU1SjTNCTIaHPrw/34KL
         0aNBTVE2BsPlORqV/D2MFBzaUAHGXSSpn9XI82mlVxgTIWUiWamWBl/XLvr9TwSPPP/W
         OGwhXG7a+J5SMJfy4uyTNuxLhAT/H++jFZjC+tONMaxepKfayhq7bbYlrCEp351g1c/n
         Uk1lg2lIgclwgVVEZYRauDiMStT8yKk5VuJHXTXUvcjcPlfTBiKSHxrJJ5qO9FpLQEOx
         +U4pHmcdu/2DTIz582UUrTX55PycAgkruqbnDUtVXRDOT3Rx9XI7AGruGWrxGuXLKPEB
         PRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701196281; x=1701801081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTFy/ub85wR/nyvzrzcV4Xaa4IQTkz8R54DFVrDccF8=;
        b=aEiORXOUyzv8AosScK13QJu7iAgqnHNDkyv7fCrCVi3CNOmPOusKSOPmHebA/xHi75
         2Kkq85GiXTryii9Mn8wMcPnWYwuEK2Z6s21dl0ppnlgFGESjJh4XYt+tk7bK9xpJZRWW
         ivofGbJjth8rSqHutnBOtBXaes82RcFn7t8q+d6GkKoUw8IZ8ffaYrVgzjtx2Y+abV3Y
         O+l8ydg8oCFXaYKjGOJZ2kpvonYDIx/1G4aPTymLmnTwF3X6wWi2aGLPio3tY+VTvrlD
         4E0/wEjamcl/jobslw7fixYFdsYbo9JHu7SEGe7wr2cZZQmS8SnxSekjU7/+gisApfus
         yF8Q==
X-Gm-Message-State: AOJu0YybjfsV4W6JGYHMtOvsgxIJOB+scyzHaH+xFtPHoCxvPrW9IfRd
	LU3osWs1g1zCiZOUfvYc/Mw=
X-Google-Smtp-Source: AGHT+IFG64qfNI9q/GwZ9p7+9sNh8gph4L1z9xLic5/aAWIqpY6W1w7dfP8dKrNSgME49dv6D+/Mtg==
X-Received: by 2002:a05:622a:60e:b0:423:93cf:8a92 with SMTP id z14-20020a05622a060e00b0042393cf8a92mr20373448qta.21.1701196281376;
        Tue, 28 Nov 2023 10:31:21 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id j13-20020ac8404d000000b0040399fb5ef3sm4780657qtl.0.2023.11.28.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 10:31:20 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 8556927C007D;
	Tue, 28 Nov 2023 13:30:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 28 Nov 2023 13:30:17 -0500
X-ME-Sender: <xms:uTFmZQ4nPFLQvxWApve2YBhkQrkPDbWMC_ifXfNKwMy9SwEFnYm44g>
    <xme:uTFmZR5RkXs11uLUD7sr3HDi23he4e7maiadXyX4_5K90XCRHsToAjFJ3cWFWD1dA
    MIia9AxiANF6SFGEg>
X-ME-Received: <xmr:uTFmZffVyO6VP4B42Gpbgp5bs2KOUuqSV0v1MOy8QxbBJF-P7NHYUW9RyDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeifedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepueho
    qhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtf
    frrghtthgvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfel
    feehvdegkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqh
    hunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:uTFmZVJwVtIRe7QV6gGx7YuM5mr4nR9GJV-U6xUfvFH4jNn1sfQ6JA>
    <xmx:uTFmZUJDkxtjxsz128RxrP1VF1MRzJT3x9vcE0621LGjtBBIKdMLNw>
    <xmx:uTFmZWyL38mccyoMJz1kEcVcZqDdK9_Zk8ck9hDXgoyJDnvn1z_WQQ>
    <xmx:uTFmZZVJENdom7OAusGM7_Ari5lue18glIwNBXnoq8Pe3uLOmYHeig>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Nov 2023 13:30:16 -0500 (EST)
Date: Tue, 28 Nov 2023 10:29:34 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, andrew@lunn.ch
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZWYxjiGRI2Ln8avn@boqun-archlinux>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com>

On Tue, Oct 31, 2023 at 11:31:14AM -0700, Matthew Maurer wrote:
> On Fri, Oct 20, 2023 at 8:53 AM Jamie Cunliffe <Jamie.Cunliffe@arm.com> wrote:
> > +KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
> If I have aarch64-unknown-none target support already installed in my
> local Rust compiler (either build a custom compiler and enable the
> target, as is my real case, or as the common case, run `rustup target
> add aarch64-unknown-none`), this produces a build error I didn't get
> from the previous target.json approach:
> 
> error[E0464]: multiple candidates for `rmeta` dependency `core` found
>   |
>   = note: candidate #1:
> /usr/local/google/home/mmaurer/android/linux/out/cache/65c6e8ea/common/rust/libcore.rmeta
>   = note: candidate #2:
> /usr/local/google/home/mmaurer/android/linux/prebuilts/rust/linux-x86/1.72.1/lib/rustlib/aarch64-unknown-none/lib/libcore-690113bb4de6f7fb.rlib
> 
> Are we sure that we want to try to use `--target=aarch64-unknown-none`
> rather than a custom target.json? If our libcore and their libcore may
> be compiled differently (and they can be, because we are controlling
> additional compilation options), it seems to me that we ought to be
> defining our own target.
> 

FWIW, the discussion around this:

	https://lore.kernel.org/rust-for-linux/20230126163552.GD29438@willie-the-truck/	

> If we really do want to go ahead with using targets directly form
> rustc, this patch should add `--sysroot=/dev/null` or a similar
> override to `rustc_library_cmd` and `rust_common_cmd` to prevent rustc
> from picking up any already installed sysroot libraries.
> 

Agreed.

Regards,
Boqun
