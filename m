Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306A350A1C
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 03:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768964445; cv=none; b=RcfI+iUQD2iYGufELrQD4XkcE2hr6uukxjrejid0oJt7qgt3UjPBR7JR7o1YdW9Mt8yC5Z/E1Vqtd+JbEdePnPiaaOnqGmtb2hrrK+6FQLhc37/MpVvUGcZvEUAH9kYtgt4xHwbWCUy6RSuEXw2Qppif3SGEOoQeATw7YTBz5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768964445; c=relaxed/simple;
	bh=xBZEB1rgpxJKxMBZVFosZoJ34eslRK2195RoF4LPfVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPc5Ze9FoK/h1IFBdP/anrhuPcr2x/6X0/xuCU4JFO19+eJ6oq+o0NAXzuFcz7prm77Nby9xWM/q30CVIOs3Mw9vNVs1qGaQJBV9eCuuXoDCsSRYvizRykNdwJ7p7EHQn4+srUpPjGzx8dSeaqyWjbFxkyM3K5PRYoq5PIevm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0TPRDtI; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0TPRDtI"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4086661715cso67324fac.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 19:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768964441; x=1769569241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bg+lIUlUCTjRMsBVULC2HfCk8k+C5RwTxfPNO6HMTW0=;
        b=S0TPRDtIAbmN4Nxod48nkxIhJ64rQqnRrm2CmfoYa0ascc+HqiMxUDFN/sUn4qZFfQ
         TEoFQdbaKPKWvKX6OBuLi1zGnmEQfIZMWh/Q40qrHzajmoZkxH5at+rNbhzVX0Hh2Lmo
         jCgzG19byF7SXJ8/Z8pHwwic5q+TeUV9Z6UH+v1LmvcXc7z6fLvguRckmRfXW4hRYZes
         rTCRftIDa4XCNoMZ+8NFlKW8ILw2xvQHl1d6dzNgVoa9S8Sa3Ne1hA4DotbecY1FX+Cx
         jAgECH7BWAr8ui8sQH51t4363QgIfjJLxOZ3hsg1gwVPZiaFie4D0XXdIPs3m03aSdDN
         3VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768964441; x=1769569241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bg+lIUlUCTjRMsBVULC2HfCk8k+C5RwTxfPNO6HMTW0=;
        b=RcR3YLkjPESj/P1nZGs3R1OzgFLZNONESrtT9rEAMF+UPpn5szlqXvsYVveSbSkAW+
         Hy1VfNUu/awns+wN3sZE2p77z+ODyF7lyvpUmZjOAY+s+CDwMjFOFJj69RbyUMxNDSQc
         yn9FVAfFdtccNHK91Ev3ATUOI+hmLbCRGlq6Wv7Rac7mgvk1bqxDVLxGNGvfKNlsreHg
         G4wSskgNZ/H1NkCfnqJ5z1Fboo2quYuZ/8PSdIHXkYQsXF/rVImUG44OW9/af95Yxn+I
         aW1094bWlfn1a/6ITRKZoAtfz9xZIST9DliwmnIbl6/CGBSyvHOX4vKNZHFDr6dw4p9x
         rd/w==
X-Forwarded-Encrypted: i=1; AJvYcCWNRKSNsYchNazQNaqQT7dKQB7SNJmPIqacpUvDbPrzJcHJAtyvJL9cHbYwXmBKBvcMXjdGxkNJbLTjGb9WNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8gN55ke51pYdrk6rNFPBDiajflsBHNpK9mtJzC/yTRITexnD
	ftz4uA/Ob+JIbK1Mx/AA5kGbK0NnJMFEjaRibJxzU74AA3aMYulCsi8i/iyAOg==
X-Gm-Gg: AZuq6aKCgqSBfi2HRy01RUYtgSKOjyQWo/XMNAPgG/V60VDK75uxzR2Gi+eJIaY0zjI
	+rcOKYh58Zexh0oqU6rpkMKCV+awjtD8iInHdqSbYRydWn5pE21xM5kskow8e0UrVvtm6oJIMhN
	REXMajFzjDca+amETpBIvMt8UTD/OjYjljq4VPLU/xhiKofglVpwoB3hkZ4MSmEvbjmgHer88m7
	zqo3Qiw94px7qalOsowzsJAgqOhM/i/wJYrMmKEMstVwcnXZJ2uOYMalQseUnJFyCdPnXx6IC1d
	DpD6yuENEE/KPM3+i3HLhP9EjKgGk/cj80aCvguHTw0+MfyvbQr65DtBCDE3GX8pc1S5mmy0qLT
	jR4DibDPI77bqA58ZdhwAOyndzy+QR2BDYym3HLz+PHVGxR7wu9vlQX92PPHhjjRxSati4utcZU
	osKlOP9GKDMeWMReMgdO1pmFjSY4zAxFo+/ZJ9dANl6A6dtiHWSPZ8O3XVFKjjKAY/gLvY4PPMq
	rxuU/CXGdHNhmU=
X-Received: by 2002:a05:620a:a3c7:b0:8c6:adfc:48f4 with SMTP id af79cd13be357-8c6adfc4b02mr1380878085a.37.1768957777900;
        Tue, 20 Jan 2026 17:09:37 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72985a8sm1136334385a.54.2026.01.20.17.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:09:37 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8E657F40068;
	Tue, 20 Jan 2026 20:09:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 20 Jan 2026 20:09:36 -0500
X-ME-Sender: <xms:UCdwaSNWzPhsowsH7XU3b8J_E2C73Z1rxKTDBmPT9Vzu4akeUWconQ>
    <xme:UCdwaXe-FazOG-OMvhy1dSJSti5fOzLjYJqLSTbbwhUd0nB9vbgZs0cDVfSqNLIyk
    9-VPci3y3Rli6raVuOzPc0XhT0smysca4x5lvM1Reu5MEq60XlIkw>
X-ME-Received: <xmr:UCdwaXQN_y4BdrNntgM2wPl-Xey8CobkSK9-DpOzYW5YOSV7xevjViup>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeduleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthgrmhhirhgusehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:UCdwaVc-STXAiBQXI0WaETYKTn8KIP6JFvG47TmL1cCp5bhHaagdew>
    <xmx:UCdwaQuYU-JH1kv94bfQhSnkxReOupmrmBiQvJ7VfeVQ87JZOND9tg>
    <xmx:UCdwaRKSG8oua9VgWti-1PZOmgY_iMTP_HEH3m6OToceXXoYk3eG3Q>
    <xmx:UCdwaUarCN-MNl58QIifD71GZQh7H4o6PmRTwVaVA8c6JV0xHD92Mg>
    <xmx:UCdwaUkYmonzXDkyU_ioes72C2pDCaRltkuKcSfE868RGfK74kdNIBzb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 20:09:35 -0500 (EST)
Date: Wed, 21 Jan 2026 09:09:33 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: replace `kernel::c_str!` with C-Strings
Message-ID: <aXAnTVnprfDnj7se@tardis-2.local>
References: <20260120-cstr-sync-again-v1-1-2a775a2a36fd@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-cstr-sync-again-v1-1-2a775a2a36fd@kernel.org>

[Cc Peter]

Peter, could you take this to into tip/locking/core so that it'll be
in the PR of v7.0?

On Tue, Jan 20, 2026 at 04:13:19PM -0500, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
> This is the same as my earlier change[0] but applies to additional
> code[1] which didn't make it to mainline in a timely manner and is now
> queued for v7.0.
> 
> Link: https://lore.kernel.org/all/20251117-core-cstr-cstrings-v4-1-924886ad9f75@gmail.com/ [0]
> Link: https://lore.kernel.org/all/20250811-lock-class-key-cleanup-v3-2-b12967ee1ca2@google.com/ [1]
> ---
>  rust/kernel/sync.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index b10e576221ff..993dbf2caa0e 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -126,13 +126,12 @@ fn drop(self: Pin<&mut Self>) {
>  /// # Examples
>  ///
>  /// ```
> -/// use kernel::c_str;
>  /// use kernel::sync::{static_lock_class, Arc, SpinLock};
>  ///
>  /// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
>  ///     Arc::pin_init(SpinLock::new(
>  ///         42,
> -///         c_str!("new_locked_int"),
> +///         c"new_locked_int",
>  ///         static_lock_class!(),
>  ///     ), GFP_KERNEL)
>  /// }
> 
> ---
> base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> change-id: 20260120-cstr-sync-again-5912d7479909
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@kernel.org>
> 
