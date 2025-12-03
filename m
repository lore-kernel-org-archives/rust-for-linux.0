Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FC21ADA7
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 01:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764725811; cv=none; b=G47h/atmpb8uMrkEAF2w8H6absxZUsIj0eTgQyUYTA/WtXNzVg93LD0hWTjPu0EowuJF1uMgNi4WR/UOygE6g/4JmWQFt2BN1d4prdbkMenMwFDfgIUk0Ryilxqv35qIh74hNBoedNidHmFxGdmLICGpKHubNHh1ArjFVQKtfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764725811; c=relaxed/simple;
	bh=OMiySK7cEfic8T76TTUePjM/pP9r0i/OZi3c7kx8Ad8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea4m3kyaXtKeqyW2ejiNho1By/Drda/gy8R1z54whAq5fmgmimFPiS8xnSI6GYm8W9ATnSeaT6FL/B/Wbm0AHgmiTDhW6LNGDvq9zJ27g9fA6VxuRWnBaPjCeY0sQWc/wbr3TjQiXQkXTZKITvIlRtGAvrjxqMEB11Q4jdwd3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff7i8Odr; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff7i8Odr"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b25ed53fcbso818659085a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 17:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764725807; x=1765330607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve/uHPmN0Tkhhewlg45E9SyNXojkW1Y5G039sbiJRFE=;
        b=Ff7i8OdrHbiCdMxJMknSO+4SYV60TPdeu7pm/c7359Gw78WllEV7wG/RpMpAEi4aWU
         2RtQXd2kZRCAY5Jm6ZuJIkWXCVt9sY/t0rpEg5prGXGLqo9cY6dlkWWJFRFee/R+/5JQ
         upzsPKT1Y+FDIN4+6xoUIUJzO/5ZFGzxNfywX9eB590vms8NbqiNRAiwa16RmfS1IP2G
         5et+TmnHS8XMRgFxGqPBMj5zMMlC+ovuOkPgoUwztTn4TDxesNDShFotJyNTt8M/nPuw
         BG8VkIr+Pw+aCKi7P7oDc345a0kVoeYaL1eqJCCjdvwOWnvMKeU61x0X1l9mGsQZuj+F
         npQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764725807; x=1765330607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ve/uHPmN0Tkhhewlg45E9SyNXojkW1Y5G039sbiJRFE=;
        b=btHYWEAByGP6dLzRkkG4B28/glXLU6QhAioA3tkbfM0iAMQSwuybMqolKCoPZKdw6O
         h4yuhUosKTSIhOkKrxENKsx01AKKYy23OUlZ1xJSj3dRTTpCjGTpvAtJ/1gpbMj3OlRP
         44i2JjPP5z4Nard6x5Q3KkRj/EIzvF4RJLJUGWT74o6KtlDo/o+q4ekiDGDwJm6JAfFL
         28rtPMMuW+K8IzKjxTOGFmhZM6ZSh8XSsbfXBLppp7/tfBTmmXp/xxsV8w6ZlCuMfwwH
         D+zAonyEkalwExREXCbQsiJr3XMmVGphB4eKL/D+fkTpqmAiCZjU2sE65TZeGAH9HAlN
         4iqw==
X-Forwarded-Encrypted: i=1; AJvYcCWUy3Lrzg5NIrD8zayGJ8suZArcwD+WIiI+aq5kFXWW7hRFnuzZJA+JZr5IgU0+lOAmiB4c1vgo1ABWAcVvog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKPgKbFp8V78ScylbD8RkJztm/gt4GQCMDZQuKHsZZ5B9Qx6CU
	iP5PJAOamFSXbip8+1HYh2zPXCzcb7M5X52xyma3flL2IpgeuU0caR4H
X-Gm-Gg: ASbGncv++fyiNyWIigxmHpRwFpcXbfEiwhzmF5XB/Tn/vvqWtSJ/QE3w3+NGZ4mV0mp
	kO/cmZZD1b5bRxN9WEqTGWYLOLczx5ct6NEUyYoSErBMwiDa1XbEi4I1cuI/HH6+ikkq95TUsqs
	TRYWVRrp/shVNThGZiz+bo/5WQ3wWgnC14JxtnA6PGME08KGt0dARrEm5/qokEC29MDmfZmp1k4
	pCWQFvQcr/7/XRWMVhgxAqqMipEq0sFSZCwaZRmg45zLnWmTB2YjsYmB5+DIyFenO9pGmwsZa8M
	oAvCDHy5fHdeG5QGhl9kRn5l7H+Y1XDwVg3mjcxFD1mHS8CaNMIcNK4yQf+BfZ6mObJRzHmhpXx
	4S8ESSxvOHklQphMyDAM71+GvP1DcrTPD1tUTCbRJmCBWGSMWuu/6OgrmQZM81Sk7mGFcj1OGhq
	3DSniJrivqwRstwHmpi3AnA5nFrpMo7tyg8cn6H5szQ8PG/q+j7LgS/JWtUh7uBGgXQQWoNBqk1
	HBu+WTX0CXohrE=
X-Google-Smtp-Source: AGHT+IFr1+rxbgAuNKRMyfy9Ih6Pn+l4iSY3G2ACK9axmW96vbljQ6G/K0HY1iCMgzgsaWknQ3D8uA==
X-Received: by 2002:a05:620a:1714:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8b5e47cefdfmr96950285a.10.1764725807460;
        Tue, 02 Dec 2025 17:36:47 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8865231a5e3sm116763126d6.0.2025.12.02.17.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 17:36:47 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7539EF40069;
	Tue,  2 Dec 2025 20:36:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 02 Dec 2025 20:36:46 -0500
X-ME-Sender: <xms:LpQvad_ba3SjXB-f2l7gSTjPEfJx92bSbB_SKdNkViDA1ZXATc2DkA>
    <xme:LpQvaYF2dd8kv70UH169PKfm53tbJoVm5RBbePiHqQrQ2mEX7hBCFy3EMsqVI9BNY
    OHMLMGAOl9EIrqobdEdiIsxxfXYZuDMeh9_lEHjtsfyF-zlwal_6wI>
X-ME-Received: <xmr:LpQvaXR8V0dX4EVZrOhHC4mTIjHFHJPj_0GD59Tq6Yt-OD5Y9slUS8ZLDw-quiWstoLmQ9RpRjVK89tSI3zWxEQzmR5oY781>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhu
    gihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
    rhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnh
    gvth
X-ME-Proxy: <xmx:LpQvafTUbbLhGW40fOo9VP85s-dHUH9nvf9SQIwlfGtjNHzHMBNBig>
    <xmx:LpQvaa3u8CcfvbSTsH-JK9f8n2nzm0TRxvyQdQWjN_ToziX_bmu-hw>
    <xmx:LpQvaZxZK5ODQ72duMJ6bnxIA7-HAkUWIIxEI4A1WXJbDDF8SwA_rQ>
    <xmx:LpQvaWwytfl4plH78dd6yVOLc8DcEzoOC5GFVxJbyhnBGEofqpasiw>
    <xmx:LpQvaV9zyd7KXPEbly2kymXssWBqG0nxWcZFB1JB5cnvmD638Q31vkvm>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Dec 2025 20:36:45 -0500 (EST)
Date: Tue, 2 Dec 2025 17:36:44 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: dakr@kernel.org, gregkh@linuxfoundation.org, ojeda@kernel.org,
	rafael@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, gary@garyguo.net, lossin@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: debugfs: Use kernel Atomic type in docs example
Message-ID: <aS-ULCZAdj_l_j63@tardis.local>
References: <20251203000411.30434-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203000411.30434-1-fujita.tomonori@gmail.com>

On Wed, Dec 03, 2025 at 09:04:11AM +0900, FUJITA Tomonori wrote:
> Switch the read_callback_file() documentation example from
> core::sync::atomic::AtomicU32 to the kernel's Atomic because Rust
> native atomics are not allowed to use in kernel.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/kernel/debugfs.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index 381c23b3dd83..9236866d6285 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -158,21 +158,21 @@ pub fn read_only_file<'a, T, E: 'a>(
>      /// # Examples
>      ///
>      /// ```
> -    /// # use core::sync::atomic::{AtomicU32, Ordering};
> +    /// # use kernel::sync::atomic::{Atomic, Relaxed};
>      /// # use kernel::c_str;
>      /// # use kernel::debugfs::Dir;
>      /// # use kernel::prelude::*;
>      /// # let dir = Dir::new(c_str!("foo"));
>      /// let file = KBox::pin_init(
>      ///     dir.read_callback_file(c_str!("bar"),
> -    ///     AtomicU32::new(3),
> +    ///     Atomic::<u32>::new(3),
>      ///     &|val, f| {
> -    ///       let out = val.load(Ordering::Relaxed);
> +    ///       let out = val.load(Relaxed);
>      ///       writeln!(f, "{out:#010x}")
>      ///     }),
>      ///     GFP_KERNEL)?;
>      /// // Reading "foo/bar" will show "0x00000003".
> -    /// file.store(10, Ordering::Relaxed);
> +    /// file.store(10, Relaxed);
>      /// // Reading "foo/bar" will now show "0x0000000a".
>      /// # Ok::<(), Error>(())
>      /// ```
> 
> base-commit: d61f1cc5db799f4e44a63418b2dc19396787427b
> -- 
> 2.43.0
> 
> 
