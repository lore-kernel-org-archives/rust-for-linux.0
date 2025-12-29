Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462A30F536
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767009999; cv=none; b=bF2GbLxVdHS7MXSRBkHV7SJkxnz6wM0WHEgzlBerUMW31Y8F6/G4JsRAgdaDu/HA+B+nfLS34g4roLX9isKJ67bbm4uFzw6tGhV9jWLaPLp0/W7EiuTVXc66G/Ek5XySjUl5bhOLB1E1l0S5l7UzGsUAU9t3iw5wm0J2lRM2XFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767009999; c=relaxed/simple;
	bh=BKCz/tM6dAZ8GnWpTL63eM2u/w94sOmkPtOgZkz8RIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAIDKOkaweWGwzf8+mai54jDK8wEWHpwPI3kt3+3Pu86nAP45KAcbmJPOGjqf52PLBvVh0UWX+yxknO4UxYh32Wi3xdU1P8uKpfOEhOfmUFm96BGFnXll5N8cRLlCIZ/FHwb+jf8XTWqoCqNtn6MshMxQ+yTH//jQqWDr2BXSEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPpD3fWa; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPpD3fWa"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a379ca088so102932166d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 04:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767009996; x=1767614796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9PuUbuLj1jXE7VFBwncU784YnXmslScQ7DrrmVMmXs=;
        b=kPpD3fWaOVIF6vfVwoX+dJn4/jCAm/hu+ZJ8aiVysic/PfmM1qM0L89JQQcOy685iE
         vKTJjxO9p5FQVe1yHW+U/mdarxwIXKf4xoHrhlH6CJkRvN8eZ2mfm4/LvEveXwaHcK+o
         SP7TZ3aDAqXxeRBCOa956lC4Stxh87OFrG+F5p/Pj4yFqUqgYmoasHDe1dZumWAQA2Xd
         rTK8z62UDErzwGKxlDoW1E1wnK/ZLOWXjwrbxvk1vYRON8h1KYbEtlIj3qgghcjyIcWr
         5JTn15i3pj93R1x2fpOc4gkFVQ97V+NQAO1GWNSQMDHnxDGsIyAa8uF3Rq1AV4LmjkV3
         17Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767009996; x=1767614796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n9PuUbuLj1jXE7VFBwncU784YnXmslScQ7DrrmVMmXs=;
        b=gnrNcu0wNOOq8ywC5J6H5ZFUF4dfgmGSZVB0U/MN5q5YWjJ75kanGZtPR33sHc1kiv
         jhVZyOHqb7iPQm0fV+VGPztwgnHzwiUeXkbbjqThsze5Fu842zcq1lLjAQD8bXuJrT7r
         oBMYforvWR4Ikrug8LAHk4CpEikkZ65uZHAthMAMtfBv86VsMDTamzmnqB9aEe30iTNX
         MQn5S6sRTXyQfHmWEVx5JDB76QPj38J+26V03yYshFN9o3L0y9jofR+5SJju8m8QbY2r
         g9pkKveF+zrykMr25QELIFC1jZM4RwpVshxwS3qr//WS7R+rPdgSeWpm2gyUXsamPb8C
         et0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/P8wCMkzuSLFSRSLDv2TvieEd52q37z3vP2vC+1qlyRC8bd9VljxjgNs3JJKi2oQnmnKDYUe90zbcnkKoMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHpJVIC94oRKlZVGI9DLoFqOZ94lwgr8HulZr4U4fhObnyJl+y
	fnDcT82R8OSLMTAVbe1BUOyFvyV/a5RsrFFOg39HWKbEmB7cguhfV9I3
X-Gm-Gg: AY/fxX7WM/MOmzWkade4fJVqLOvmGdgn9nIkVKbyTChNlASdiULbOpNNojs9lENpUjc
	DwdyKBGpC34zKz4K6lPrSUxfy1dlfx7swMPwWH1Pioq22VT3U1+CYoz3/ur7bivbGb5xUN7rzqz
	qL8GJrl5B9DHcnmnmBTpkNiqipYK6vBeYIb/N8Cl/0CXKicR0t6f63mTyv1+EBfEOdckHPZf5Xl
	r1P01UJWklkvU43YyhCpOSR6qejZN1tqz6jmcUTK3J7CZht80sYjVzE1ggmRxYdmn7MYzlmvbf8
	HS+Ttz3JUq+0ifAI+YvOCUkBXoikyd9lwJ4KzrGdWg4A43nqcjKdvxRm7b7OOqDzBCgT8iLsMxr
	zrme7GpZXK5jb2egA3Y2FYzyPedJtVvfNQKkhnRGe3zJiHBQqesVzRRXA5VvW4IjJun0fVQfRTW
	S3iCIZibZbMAtBfW+34uKPUHnLTFdJyK1Iyv2u4DYhtPPuexrf6OD1OQQN6toJOxKb3vAnLiJqG
	dmhjWlXr1QRpg6O3GRsnsxCZg==
X-Google-Smtp-Source: AGHT+IG5SYKzBrzpsdml5IXoKLLqAoU99MJ3uswMnD2CyluDfI4+jpvuo1q26PqDS5Qff0ha4PIBQw==
X-Received: by 2002:a05:6214:570a:b0:888:4930:7982 with SMTP id 6a1803df08f44-88d8712bd9fmr533365516d6.70.1767009995737;
        Mon, 29 Dec 2025 04:06:35 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d96bec097sm224478436d6.16.2025.12.29.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:06:35 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id A16F5F40069;
	Mon, 29 Dec 2025 07:06:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 29 Dec 2025 07:06:34 -0500
X-ME-Sender: <xms:ym5SabIHAEi82MPcYM-DRfDAtjANw3RLt4i8VGXOeB9Wq3c--JInQg>
    <xme:ym5SaZM977uR7vaVWTb_QDI8vjsWwrlQ2lVU2j1w5ETcQ2uGYjFKk4NU1xbjil8cO
    EpUnbZWNjJ7zVurmx8J726UlbBDX8gS47CFuXUkBcdtkzRxV7IUNw>
X-ME-Received: <xmr:ym5SaYqVXUF_uxaVa05TMuwobOAYnpUoa2PFiR2O4-HqDLIZYcd_Tedopw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrg
    hrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:ym5SacKKWOo3iovAvRmG4yKzllcziNtEoL4AV-3kv92h0-tiJkKZ1Q>
    <xmx:ym5Saf1T-xjsllyWxur-81IOrawiXbxmWdw3oogzVSHuQjrF17soQQ>
    <xmx:ym5SaVVeKwuwahCI1fnfKccZ0GNdFEBWE-oYzcttDw4qy9XYdaL-sQ>
    <xmx:ym5SaazPE5Xn7F4ts-tutIp2zSm23-WGDJC2bfAN393vL5oIkDEbzg>
    <xmx:ym5SaUx8_v_x3h06PLEQuWjrRpSnvVha6uEuUI99tmSyh5ekht4RpSfw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 07:06:33 -0500 (EST)
Date: Mon, 29 Dec 2025 20:06:25 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 1/4] rust: helpers: Add i8/i16 atomic try_cmpxchg
 helpers
Message-ID: <aVJuwRCnyF7r5ygF@tardis-2.local>
References: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
 <20251227115951.1424458-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227115951.1424458-2-fujita.tomonori@gmail.com>

On Sat, Dec 27, 2025 at 08:59:48PM +0900, FUJITA Tomonori wrote:
> Add i8/i16 atomic try_cmpxchg helpers that call raw_try_cmpxchg()
> macro implementing atomic try_cmpxchg using architecture-specific
> instructions.
> 
> x86_64 implements try_cmpxchg() with full ordering.
> 
> On other architectures, try_cmpxchg() isn't implemented; so calling
> try_cmpxchg() ends up using cmpxchg() implementation.
> 
> loongarch, arm64, and riscv implement cmpxchg with full ordering.
> 
> arm v7 only supports relaxed-ordering cmpxchg; __atomic_op_fence()
> macro is used to add barriers before and after the relaxed cmpxchg.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

One more thing, we should add this to comments in atomic_ext.c as well:

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 10733bb4a75e..5ef81d2b47cf 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -91,6 +91,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
        return raw_xchg_relaxed(ptr, new);
 }

+/*
+ * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
+ * architecture provding try_cmpxchg() support for i8 and i16.
+ *
+ * The architectures that currently support Rust (x86_64, armv7,
+ * arm64, riscv, and loongarch) satisfy these requirements.
+ */
 __rust_helper bool rust_helper_atomic_i8_try_cmpxchg(s8 *ptr, s8 *old, s8 new)
 {
        return raw_try_cmpxchg(ptr, old, new);

I can add it myself if it works for you.

Regards,
Boqun

>  rust/helpers/atomic_ext.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
> index 089f31bc8de8..9d62f659c8d2 100644
> --- a/rust/helpers/atomic_ext.c
> +++ b/rust/helpers/atomic_ext.c
> @@ -90,3 +90,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
>  {
>  	return raw_xchg_relaxed(ptr, new);
>  }
> +
> +__rust_helper bool rust_helper_atomic_i8_try_cmpxchg(s8 *ptr, s8 *old, s8 new)
> +{
> +	return raw_try_cmpxchg(ptr, old, new);
> +}
> +
> +__rust_helper bool rust_helper_atomic_i16_try_cmpxchg(s16 *ptr, s16 *old, s16 new)
> +{
> +	return raw_try_cmpxchg(ptr, old, new);
> +}
> -- 
> 2.43.0
> 
