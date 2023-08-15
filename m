Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51937156D9
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 18:00:23 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09B8138
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 11:00:21 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5254f9eda36so4049986a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692122420; x=1692727220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJHoZ8X1h4xQ7tm8+zzTZx4Mu33LU7nB2/qAWxhLsrU=;
        b=DvNY5E7BXWahcqxJMVztS4K3eYUTrBJEE84kuaVw/OPWAPesxw2sXnROHQVfuWMqd2
         Me1LmCRSLPjppo2fKyjsf/So+ub41pam9MQEhJAgVxkThAfI5zjHxGIys8u2O+zbhkLr
         SXxbyezvZy9gsU7nZHjZdbi4aoKc+jSE7rRDLN39AIRwo2q35Cl0lwXqFKPMnHqMXIYy
         6WF4ocCllgYm6OyhW7iRi6JxT7Ifxys/uu1pYVwK84iTJIKpbpZa/ZM2Ri6qb9BCtcHR
         ArINKVMlSHKCcOPp1xRQirgO9i4DR9vA9Ynj+UYzJ4QGrJmaXdiO9dSOD4Oho6hzEDgL
         ymDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692122420; x=1692727220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJHoZ8X1h4xQ7tm8+zzTZx4Mu33LU7nB2/qAWxhLsrU=;
        b=dqK9mDCDuHn9RWiqLV8ZrS3L+CpChQIcjTiFVmPMHduvrS9nZz0dND63ZMqfpZvWhR
         QGuNJ37+jpg3h3gXlCf41JNF7Gw4x0wHbOY8ZJ/dFjmzhpJxTg9uznFkWk5D5+wrjCdx
         TmHjqTV0j0bMmb03tZWALmxYkTYX2BnCumFRR0qEqjGXdbREQCz8UVafZ7N1F0m8yhHu
         jkb4RKVndJEbpfMx1QHY9adfAJcCmS64JzM08kSGPEZ86aDApEqGM6qgkAUSJ2yxV8tj
         76QeFXfqrxPLDR51etBA+kA6qpixBsLKwIkjjfUNoPJM9JAwXTOqbKE4qQZ1n+ocgzkP
         Y/MQ==
X-Gm-Message-State: AOJu0Yx5M9g7IFmFtSG1+DhuJ/A4XdJyauOBPEReBVzwomWaFKwhRe9Y
	ofn3/PbOOay5NbNJyoDWZykpAs8a0q8=
X-Google-Smtp-Source: AGHT+IHZzOIaP6b1JU7Kcdr9eMRGF33o608qyiE4X2mzVGN+HH+e0rUfhCMANfTYOR0Zf/ncr0vovw==
X-Received: by 2002:a05:6402:326:b0:522:2af1:1ffe with SMTP id q6-20020a056402032600b005222af11ffemr10000623edw.9.1692122419926;
        Tue, 15 Aug 2023 11:00:19 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id l15-20020a056402124f00b005227ead61d0sm7132357edw.83.2023.08.15.11.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 11:00:19 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 5A99927C0054;
	Tue, 15 Aug 2023 14:00:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 15 Aug 2023 14:00:17 -0400
X-ME-Sender: <xms:L73bZMUHXeI-qs9MeFOZSrtHb4nZuW_vE1kGnFo-rylkKyFdOaHIiA>
    <xme:L73bZAlpKT4OZM_n39AQRzNIh59ouFCodOHLF5AUgyeLyQRhcw8-4Te1V9rSG9aK1
    JDqmFMCZdb8fJWxzA>
X-ME-Received: <xmr:L73bZAYnrEUaAWBMSwiGagyIEo2Lb10xiJ5qAyyO-bmzEUPLVzMFvxtNfWCM3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepveekffduvddtieegveegheelkeetudelieeuvdekledvtefgleeuhefg
    gfffgedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpd
    hgihhthhhusghushgvrhgtohhnthgvnhhtrdgtohhmpdgrrghrtghhieeguhhnkhhnohif
    nhhnohhnvgdrrhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieel
    vdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtg
    homhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:L73bZLVtx8ff1ny454WVWBMAMOYzxuOygPQ35KlQIBKZnP-G44kDSA>
    <xmx:L73bZGkYmpFfXGiHVUihydFpu_n0UjIeVl-Mx8RuiI7gytu2y7iuyg>
    <xmx:L73bZAdXPYAQKhReInjUnwZArm68THDuJSxaiOOq5xchF6Calvlfzg>
    <xmx:ML3bZIVH0wUflBbD5ehRioYjmgDL8Z_fzaGWyCwBaMpWJLwaTmq4aQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Aug 2023 14:00:15 -0400 (EDT)
Date: Tue, 15 Aug 2023 11:00:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: catalin.marinas@arm.com, lina@asahilina.net,
	linux-arm-kernel@lists.infradead.org, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, steve.capper@arm.com,
	will@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZNu9JhYlsFWmliQE@boqun-archlinux>
References: <ZINlqb3XHmz+dyLr@boqun-archlinux>
 <20230612152639.1446766-1-Jamie.Cunliffe@arm.com>
 <ZJ3fhb8QYdXhGl1r@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJ3fhb8QYdXhGl1r@boqun-archlinux>
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Jun 29, 2023 at 12:46:13PM -0700, Boqun Feng wrote:
> On Mon, Jun 12, 2023 at 04:26:39PM +0100, Jamie Cunliffe wrote:
> > > I don't think you need "-fp-armv8" here, because "aarch64-unknown-none"
> > > target doesn't have the target-feature "fp-arm64":
> > > 
> > > 	rustc +1.68.2 --print cfg --target aarch64-unknown-none | grep target_feature
> > > 
> > > 	target_feature="neon"
> > > 
> > > , and having the "-fp-armv8" gave me a warning at compile time:
> > > 
> > > 	  RUSTC L rust/core.o warning: unknown feature specified for `-Ctarget-feature`: `fp-armv8`
> > > 	  |
> > > 	  = note: it is still passed through to the codegen backend
> > > 	  = help: consider filing a feature request
> > 
> > Rust removed the fp feature for arm64 and tied it with Neon. However
> > this initially had a bug that meant it couldn't be disabled. This has
> > now been fixed in https://github.com/rust-lang/rust/pull/107294 so
> > once we can update rustc we can fix that warning by removing the
> > `-fp-armv8`. Until we do that we still need the `-fp-armv8` otherwise
> > we will get some floating point usage. This can be seen by doing an
> > objdump of core.o if you build after removing the `-fp-armv8`.
> > 
> 
> Thanks for the information (and the fix)! That's good to know. Looks
> like the fix will be in 1.71, then agree, we should keep `-fp-armv8`
> until we update to 1.71 or later.
> 

Just FYI, rustc has been bumped to 1.71:

	https://lore.kernel.org/rust-for-linux/CANiq72mrzALO3J2VvDntscXwt7Z9KzT4+S8sc_HGc8u8izjyLw@mail.gmail.com/

BTW, recently I learned that ARCH is set as "x86" by default even on
x86_64 host, so things like:

	+ifeq ($(ARCH),x86_64)
	+$(obj)/core.o: scripts/target.json
	+endif

"ifeq .." will return false if compiled with "make LLVM=1" even on a
x86_64 host. Maybe use

	ifdef CONFIG_X86_64

?

Regards,
Boqun

> Regards,
> Boqun
> 
> > 
> > You can also see that fp-armv8 is enabled in the aarch64-unknown-none target
> > here: https://raw.githubusercontent.com/rust-lang/rust/master/compiler/rustc_target/src/spec/aarch64_unknown_none.rs
> > 
> > 
> > Thanks,
> > Jamie.
