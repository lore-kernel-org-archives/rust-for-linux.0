Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501EB33CE88
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620100; cv=none; b=FZHkof/d64pBbSHMLqgunj8OU8C5sqEcw6Nw4K8hsNnwG9vXygyxCqlpH9sU7f6hc+yqcX2HOj8n2wwGTfrfdR9gURPa6FEh3U6m1dRIt6+9DhQtEVeEB720mMLDTWK8LVaE8vzyQwzuUClsLIgIb9OZ+nCNGOMqVrZP50norKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620100; c=relaxed/simple;
	bh=rrR2WtOY8HjiH1VpM1Nq22MDxOD9d2hpf6jf42ZdIVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohROJ5asILHQNECqbiLjSEfpnGWE7e5iMh+RX5qcFRO7u9dX1WdLFryHdCRXieP3VLij3q0gUz2Zj2poC/z/OUR1haUWKASv+XRXKo6bscNqcP4xYd3oSG93skNJ6/eTJsA0nrQrAQBExRMpAOCjvhi9c7RQrhy2/WtESOxlEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpK6JLPg; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpK6JLPg"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b25ed53fcbso1962751985a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767620098; x=1768224898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVm96cP476o+ZZwHsOQePN4PBw8ktqLj2E565p4JvY4=;
        b=kpK6JLPguWYRyXi8SmGMzM+XGtfpd2ekWSyz2u1mhHxdWJH4cEOFP86Cq8dct8Y6IY
         gb7e251/181NjgLJtPcVML1RDjSgAZgNF5rnRj33kAO+Ob/i/tLB4/91GLDjzLZK7U7+
         Oclmh7bG1OnMepFmQw5KmoREBqti1ilEMARf5slejT0mH1n+rAIzBG6OO0vGnqlo1o2c
         aPIwhj4eqE5h2yLUYOu0B3rl9QnKTjjcED+879GrDfOgq1GXaC/JSBBD47WW94kPU4u+
         PualKI3SxRmZkG684QsvZAwP1PH3zuID55gUyZWe9CaZr+1n+tDOswdGu9/tnJA+egnH
         1jAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620098; x=1768224898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PVm96cP476o+ZZwHsOQePN4PBw8ktqLj2E565p4JvY4=;
        b=bHmQRKNwjYPgiAOp3ncDlOvKz5A4fBSe3tFFyRVwxQbNpHk6LfMzL9OQ4GF4SAtsAs
         zSX4fnYYXRu38DVrZIoSB/IYqpYA+1Q72n9lgUEYcFtl3TmqJoHBaT1RubshsmgbzDTS
         +II/dEpCVlB5UkqMtQlRjydIVyUeSR3Xf3IqdP2uVVLe5WG4x8u/9aj5MdjbLFELNyRK
         wuKYQyUME7LlLJvuqZfcbK4JaAVxRpSfzZRMTGLhTXdK2tnHra7175GGRtrSkl+l3BSM
         tkmKhRIfu/KYj9/xfeguOP9URwa0nMpCUI+VjfO+oPr6sdMdhz6G27jrx/Fb5tQxBV2G
         c88g==
X-Forwarded-Encrypted: i=1; AJvYcCWklQ/2gKkBIL5LAN/C70QeMKm7gjOPcQc2mpNFCeM7uQrdD+XkGwCI36jZf2rcZmHMvdLwQpaCQ2dqlXJnEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+u/8QGuToOVMDVQz75umHqwcea1V/S21RLMM6UlmYxCPXu6t
	bBo6NsjXN18LQxel9k9J36BLseiriwxVRaTp8MYWN/v6sJQMdlx2Poz3
X-Gm-Gg: AY/fxX4i2JDXUkCa7TDoQWZNmmkLNyH2nAHvrsJA/pYx/zYBa8TssOcyBjexV43qVGv
	4TUAcQc9JW+Q1TOXw4chALPaAgqi0UkF2tgy6S9tGk6C/i7QFOG1h34ZSwgyisSBCt4bxBMrW2Z
	GF0z71hB8XgTi3o04l+0bmHWDQKYRhM9U7hPY5at34VEhEK3WvJghbOE00tI0rH89x+JIpGPFtO
	QeewEETYovTYDLWnB1w1G1bclfvE7vI0T9FqkaKfMjfj/dmv7GyO7cX8DOUNIjGgaDOTo6l63nV
	mS/RcrNoNs5abg9YSttWOFHH4jAtpoc5t8+5AUygA3OTcZ8JP5PyJPmZpIg1UREkZA6+zQwHU5z
	LteeV8XwHsqu2FxGmgp8IhNlNV/vA+b05iUdveXPbduIq0SpwV/RYngRwVZCwNtOkVt7zU4BCt3
	EzeXCXaZnyqg+tePBjrpVDduxDrv2/HgFgDYaedg9z0CQ6/GeuxuMB2BwaiAta75z19CkUfx9MY
	mLqw/nquhGj9ug=
X-Google-Smtp-Source: AGHT+IEvRACtO1qCkDG7j4VbDrLl9sucKkWA1Rt2QO4Q3/IPxYE1zHOnBayimmNV4J+V5lfYWpNQ/w==
X-Received: by 2002:a05:620a:469f:b0:84a:5f9d:a30c with SMTP id af79cd13be357-8c08fab86b1mr7945462285a.63.1767620098171;
        Mon, 05 Jan 2026 05:34:58 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783a81sm3714000785a.9.2026.01.05.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:57 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 07FACF40068;
	Mon,  5 Jan 2026 08:34:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 05 Jan 2026 08:34:57 -0500
X-ME-Sender: <xms:AL5baUEoQAQgHrqsMygWX8MwyPni98xdglgJDDWtEgahE7DPIMhaIQ>
    <xme:AL5badz8ESHoyDOik7eGyVidtGi7MJLKZgn2z7hwlr3o7eYPBlJTvx12V8U6ChDnC
    gU5Smu8UihzvkEHlfTiJbx5nD-essX34IB1RlBcO-fOv3woOn44hQ>
X-ME-Received: <xmr:AL5bad7BiYGQKjfG6BETbihPyExJeUel6ZCaAeHO9TIEal26UrwVPtPP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeljeegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtoheprghrvhgvsegrnhgurhhoihgurdgtohhmpdhrtghpth
    htohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghmlhhlrghm
    rghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfoh
    hunhgurghtihhonhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtkhhjohhssegrnhgurhhoihgurdgtohhmpdhrtghpthhtoheprg
    drhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AL5baSfPDn9_rDYiZ31L5dY_HjHKYrIlFz8i9Cbf3NJdgyTeiUvyqg>
    <xmx:AL5baUFICkyY2f28w_jtDIZC3-UHnUMrbkn6xzdAMErIA0WV9CkO2g>
    <xmx:AL5baS6J6kr1mTCPaws3TGKFl5jF4NVeP1OaLbT2m_An9wAtUsIFWA>
    <xmx:AL5baXtE1Qthv9KLrGc065PdLTvzoGZVQFpeUuGDWOVcHk5wrPfEYQ>
    <xmx:Ab5baW_oPlB7dlg4UswnthkpvVwjUyvhVbx0h7RMVFeNroXq31QeaSTa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 08:34:56 -0500 (EST)
Date: Mon, 5 Jan 2026 21:34:54 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, arve@android.com, brauner@kernel.org,
	cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
	tkjos@android.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 0/3] rust: Switch to kernel::sync atomic primitives
Message-ID: <aVu9_lOWO6pWgqLy@tardis-2.local>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230093718.1852322-1-fujita.tomonori@gmail.com>

On Tue, Dec 30, 2025 at 06:37:15PM +0900, FUJITA Tomonori wrote:
> Convert uses of core::sync::atomic to Rust LKMM atomics.
> 
> Each patch can be applied independently, but all of them depend on the
> atomic bool series.
> 
> https://lore.kernel.org/all/20251230045028.1773445-1-fujita.tomonori@gmail.com/
> 
> 
> FUJITA Tomonori (3):
>   rust: revocable: Switch to kernel::sync atomic primitives
>   rust: list: Switch to kernel::sync atomic primitives
>   rust_binder: Switch to kernel::sync atomic primitives
> 

I queued patch #2 and #3 with tags from Alice, thanks!

Regards,
Boqun

>  drivers/android/binder/rust_binder_main.rs | 20 ++++++++----------
>  drivers/android/binder/stats.rs            |  8 ++++----
>  drivers/android/binder/thread.rs           | 24 ++++++++++------------
>  drivers/android/binder/transaction.rs      | 16 +++++++--------
>  rust/kernel/list/arc.rs                    | 14 ++++++-------
>  rust/kernel/revocable.rs                   | 24 ++++++++++++++--------
>  6 files changed, 54 insertions(+), 52 deletions(-)
> 
> 
> base-commit: d4cd35bacb06d53acf39ff248ea2b3eef50573f6
> -- 
> 2.43.0
> 
