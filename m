Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBDB1D798E
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 23:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495767; cv=none; b=dzEdmXdZ5sKZrB9r0Ag5S/TkoUsi2w+CcfsLt5DdfLU6yGkK0HbhZbRHLoIRmDFqDIMxu3EYu4wJySmGOWNhDHaWt6XohphNUs67RABgrtT/PiFz9kkVcBdFltMAHwhw8sN61i30cOSBq8xtZwoPq0JvMoLc7M8PkZNhqsVBHH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495767; c=relaxed/simple;
	bh=1qzwV02bV09dOmCeHlRCyTatMjj2+lK51O7j6el49HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzzsWmvND9V5AH8Z2vjxLntJl71SPz+15L5bhLLIqKQoZ8CcF0odnbEXDrePbTmHjQOL7b/o2MVCSbV+ZN4w5UlAW7BbrWrETcnQiuaZYyWXZbiyZ9v+t2uvcMzZsIUVf1ImsK0eq+suq/D4Fc0uNoD1M3ND24dkjU1on+Ol0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhkK7YBn; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhkK7YBn"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-880576ebe38so6502566d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 15:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765495765; x=1766100565; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbJc1OJNTPxtfWwkX/KBFBuJPaakfzFAHuCWrkILadQ=;
        b=PhkK7YBn5IgtpJ28YHSi67JqKJNB0PE+VvmIgGve15qEGboy4vF3cJ5rsHYSEJMBzm
         rSELR21YINhV0KnLNFXakrwWyQLS1oi9vw4uk7pyw4xOZc8vsQE3ty8/gb6A6YtHe6Pc
         NVhbth5/5Se6/E/m8BmY0CRaWIFBiQggm55lhmuy1BZ6Wlac7e0z4XDWJ2BwK4W6qhG7
         PiI1Gn22FRxRLG9Ag6HG0QtUCdBF5YYib5zESa8d5Nxzaq0G6nySVzOnFqFzsjUJ1/sw
         3LFPLZFdOM3paK14Ktl1bVc8BB2FgH+ttCVVq50wA/qMbNV2ZpphtBgwSDdAM+zDf8Pe
         OWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495765; x=1766100565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbJc1OJNTPxtfWwkX/KBFBuJPaakfzFAHuCWrkILadQ=;
        b=TKZHSgpS7Gk2QxPc4uWMcijBXmm886++UtS1aQOxkN3AG2CyLYbsc7faXHwm8HPBpN
         W0z2rV6eCyN2OudzaANnhaipJ1J4MUdgXgSQdcnaH5TOagUBYJB8VDlIDtr0fETqJAWG
         q2xxj8WxIdbzED4ans5t8V3eplMn2BQh2+/A46V765axpYcUiawVKIFnHKGFbC+Yvy15
         rQi924wLH8Y21xrqMn3xm58HzKaaVocziBpcSFPCAIEua562oYf7KGMyOKXC+BO/RXRX
         JwdzHKXqAT8ui48ZzO840fNN6MtgNB1Ml5CiZP2+gfr59lp3HttJ8mWlnRgiYYMtkYx7
         2Hcg==
X-Forwarded-Encrypted: i=1; AJvYcCWpGlcpMFlZXLDYvBFZAJTFMGu44KNaBnSlQcu4/35JWXCY/Ut45UYinRs/2JbLveFf0wlD80yADTsh97Asbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQZKcIouvGMysyRF+4KLCB5UucdHtX8RGxSNLfafLZLWT0bhc
	kjrMiEP/OfCINvCWSAbrdntXEV2uABSm/ZYwTVGV0ggkdnbmVyR5gGve
X-Gm-Gg: AY/fxX5jXin+vWOFA5Yw6sN15QKSGwydM5HjQZCdIF7kEPBiuuUhXLoV/kxn0WHiDC6
	vV4qHh/PX4B4OyxK8GBr7l98dWhaKdShV12jc/dY0KdR6qdh1qYM/hDKjXE8A37aczOOs1NqQVc
	Y/9pTcW/UwEjFxCqLCdGi06FyHX4W0cuknX0Au8LvICdOiAF11zOayDiJsFb4bAR7aGJWRK7D42
	8smrHnDvOyF6ZmKqrDlA5H95tT5y/iF2HMWpcAOl4g7RnKnepgwaI7nuYTJC6+T8Lx6NoSKOvpc
	rCJfdME4Ks2fIIFtwurVsGVDM/rTbaDg5Lr8RsVIAk1wICikwXs1/gr92ljvsxBvzP2lEWKqt61
	wR54N4+EWdJJL608OIy/vQs3XO64e1P8jZmo3vT4h03w6MFRPtMyuGABWAKv78O8fGlYWwdMDW+
	r8Arig/v+pVgcSK5MTzpNvqEZeFyjlcjaCRDDwNnQW16RSVfBaVvscDQp672xBQFdQ/U/M/bQpI
	sdjSObEH9Z7I+adiO87GA5BNg==
X-Google-Smtp-Source: AGHT+IHFf2LFvbLGYxx6dXxdC8TeQEz90eXcCSaH9CyHBqDy90aL+WQS6Oeg098hvM4Hg4X8L4RqsA==
X-Received: by 2002:a05:6214:766:b0:882:437d:282d with SMTP id 6a1803df08f44-8887e0454c6mr7085056d6.30.1765495764727;
        Thu, 11 Dec 2025 15:29:24 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec5506bsm33737486d6.18.2025.12.11.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:29:24 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9DB57F40076;
	Thu, 11 Dec 2025 18:29:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 11 Dec 2025 18:29:23 -0500
X-ME-Sender: <xms:01M7advYVwYbjHKGHrQCUPFma3brbagCdFJyxoApCjfN_P97Jaze2A>
    <xme:01M7aQ-_2x4rdDcVKsgGFaDAuo-_SJYZB49_qvDJc6dGoEazL7Zt6Q2mxY14D27-G
    b9OyK38Up10sdRHRHPlytAB5H2VMyVF0u5zqfRh2ZMIh-WiJZuXfLs>
X-ME-Received: <xmr:01M7adtwMfsKnGWgBQLG1PqrVSljFtz-hCbvhNxRQQB954co_3xAXZ75Q3xrc-L-60diKqcYEShfgkbpSDV6_pqXr4GLhR2yii4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthho
    peifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnh
    gusegrrhhmrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrd
    hgrgihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:01M7aW6Wwm6qRSN7OWmpTNn5n7m9s7gcF5309pV6eytpTwp3yx63Qg>
    <xmx:01M7aWMkJ-J1lXRjWa7nICMzQoYFCZ95p7r7sfJCO2Hv4obn-htnSg>
    <xmx:01M7aSLH1_D4i6Lunbol24QObBrNnNdQMq5ckVqfRlQxlqC3vMdJaQ>
    <xmx:01M7aRzO129C95xCoHHW2hdKQdmsJnT-9HF6n6szKQL11Y01uwn3Rg>
    <xmx:01M7aS7xqOErWs5UQzu1jdlV0m9VDlYrd73SO3MV3X20kubOHGdcsEdq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 18:29:22 -0500 (EST)
Date: Fri, 12 Dec 2025 08:29:20 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rust: sync: atomic: Fix fmt warning
Message-ID: <aTtT0HcnP-1RDoWM@tardis-2.local>
References: <202512110753.8B3YlvtX-lkp@intel.com>
 <20251211213133.56265-1-boqun.feng@gmail.com>
 <CANiq72kHGjVmcje5fgHYqsZOdM7kN6HqnrvMdoLsbp7c_4AUhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kHGjVmcje5fgHYqsZOdM7kN6HqnrvMdoLsbp7c_4AUhw@mail.gmail.com>

On Fri, Dec 12, 2025 at 12:16:45AM +0100, Miguel Ojeda wrote:
> On Thu, Dec 11, 2025 at 10:31 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Commit 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> > introduced an import ordering that rustfmt disagrees with. Hence fix it.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/lkml/202512110753.8B3YlvtX-lkp@intel.com/
> > Fixes: 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> > Hi Ingo & Peter,
> >
> > Looks like I missed one rustfmt issue in the commit 14e9a18b07ec in
> > tip/locking/core, here is the fix. Feel free to fold it if you want.
> > Apologies for not catching this earlier.
> 
> Linus picked 309e49039f12 ("rust: sync: atomic: separate import
> "blocks"") in mainline a few days ago (but the solution I did was to
> add a newline to separate the import "blocks" with different
> visibility instead).
> 

I see, I must miss that. Hence I'm happy to drop this patch ;-) Thank
you!

Regards,
Boqun

> Cheers,
> Miguel
