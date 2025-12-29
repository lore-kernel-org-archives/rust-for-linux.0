Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA7313530
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013038; cv=none; b=BHZj1W99qy5wZgqQn6dOZ2fSSf9PASabZ37Bkf0dQaXIL5WVdAupm398P6w4J1JTAlPocw32ixgEikdu3OwqwAo6QJl8qWhRagy79ZiFqIewuxNPlFhzTjGrwjAne/aLn6P3GSzfpUM+onLXB/OCGPLDcdGCOYLt/AVACF+NGvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013038; c=relaxed/simple;
	bh=HkNO+1WhAZLkfngtmvSHkUGk5VLtfuXIstzLTqRDtTk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=F+K9c5kJo/ycYX9QYKP2iMttsjgQk/Ci1oNpEeh6tLBaBp/xtcBfhKM2SVAc7iwK09TgeVJkfWeJCIcifcNXo3JDJ9I4SGf9/Ry1Ygsq2ZVQ5aLhGEsx1avaFO0YtvCIGrvboXVAD3UFZVf6XvZQnh0jCehQw/7tz1jL7U+EGgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDZQYnBZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDZQYnBZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so8479662b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 04:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767013033; x=1767617833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZ/pv17zVPi7K7N9ClnjKvD02+pq0BmA+DeqVIbJkNM=;
        b=hDZQYnBZGeDCJAZUB4tfszhQnUYPacEdTX4diHY0FtoPWyS0TYca7zZMQ+yZk3n7jy
         lLAsbDW4/ms7nWPtyiR+estPlVYjxYQimW5bB/ngdDFECt+9L4WVmai4wysxRxpLpx3+
         f78rqW+nOShplzPerMuatfsmC0n//Y4DCw5GU14eZS0QoEM3lH50xb3rX37j3tgk2rrY
         HsnG35Wb7nkul/w66+OAC9kQ4/dkTiLpJtc9V5qpIfyrPv0gmI9E+r3NUnKymlHnwKeq
         HPBW7WlinWo5XctGDabTmqeZm94cWLnT2PfLlml6rbjfZBGBUmKPgr+OqZSzMgA5FiVt
         Y8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013033; x=1767617833;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZ/pv17zVPi7K7N9ClnjKvD02+pq0BmA+DeqVIbJkNM=;
        b=eMd0kglMtY3nMSJ3YGk6cfQdI4mQRnzBrxPsA8KrSvKI6D/8Cig28OnbGf4SFznbgd
         S+fiWTenNuK90tVLtZgvZazHP5+9aaFxKijxYBHaOM0yk1NXOXt4QNK7h7FfUjNjIV9Y
         vv/1tP0ZK5e3rpfsjgfkDmokpSt19RLEQ9DlE2WxmUd8xiyZ419KdOX8JfWmQkiQPNwa
         bdJjjRYmPhJWM0/6wlE+GuDhi9TtYpjqr/PdWLwtHUT+J40D0q+Fi8X1Pai+6Wp5RqSn
         hdm+JJArHufWjRaFngTkbwDu2HLXXjboWrPVqQvwzOtERaBMzCDVS6swWFrsGfZtyY2R
         ygzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVySNAFbhBKW8lzsWSFcocFis6KUEuDD+wNsnl2EAw6eebv5kmSFs43OgmFcNS57TynQ4XJSoShSXZMGjhZ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7sETxMbArV1R6tGMSOq1tNXFK1KukfG5ak/gvHh+XlfxoxezZ
	GW3s69rtNwk/I/QdLVzaBwB1MOxCxE+5xGcvwLz24L1xZ515dAJe0jTR
X-Gm-Gg: AY/fxX61F15YZvUtNEndDEzAkC4paxbZVCLFQPMMZC1Z1tlOehO8C+Fyc82yh+PdAkR
	Lh98wh/ZAHcTSoUIpY88qnR92tN+Br4JWkKHi4xsI3fDZ3hZyK1aGUMj7ducf4pAmkc7bycMYSX
	UR4GtYvaxBt20BzrtMdJ2ukQL120Cfw20atB39Tr9TdONHMWy/v0rM/HvQ49HJPnPqQOA7EqcMs
	wPxGPKYkYazJI9Wo85EUCw/aWQ3FNTuzMKsHEqLG1D3wussNUUOgUi5RzWc2aC1RrORZEv6Pa00
	VIytR89LDDClhwwEx6LEG2D2zGXAKA8kvUy+v3BZ1eItVzT6d0KSSky6IJNk5fYfRkEs4ads5TB
	59oHbIqE+LEz95+F0fq5Rz7lxnxh9XIJ2BfX7OIHosl9meh+0dHjvcpKAE/B2uFqRVj4BgfT6Fo
	cxfyKTuptW92PskQ1HZuxvSI/xY+eCK7BkcCTZbzlakn2dCXwtBuYTVC2XhhfCbS/iQkI=
X-Google-Smtp-Source: AGHT+IGrjdHYLASMYbj4DFkinxOr9sQVj8JTCBkjrw/HDfdX+C13Qjzk6gzmzWeoycxdnD971sg6TQ==
X-Received: by 2002:a05:6a00:4c13:b0:7e8:4471:ae6e with SMTP id d2e1a72fcca58-7ff67e5572emr23909929b3a.58.1767013033494;
        Mon, 29 Dec 2025 04:57:13 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48e1d6sm26816521b3a.53.2025.12.29.04.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:57:13 -0800 (PST)
Date: Mon, 29 Dec 2025 21:57:08 +0900 (JST)
Message-Id: <20251229.215708.171382176517857886.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 1/4] rust: helpers: Add i8/i16 atomic try_cmpxchg
 helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVJuwRCnyF7r5ygF@tardis-2.local>
References: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
	<20251227115951.1424458-2-fujita.tomonori@gmail.com>
	<aVJuwRCnyF7r5ygF@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 29 Dec 2025 20:06:25 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sat, Dec 27, 2025 at 08:59:48PM +0900, FUJITA Tomonori wrote:
>> Add i8/i16 atomic try_cmpxchg helpers that call raw_try_cmpxchg()
>> macro implementing atomic try_cmpxchg using architecture-specific
>> instructions.
>> 
>> x86_64 implements try_cmpxchg() with full ordering.
>> 
>> On other architectures, try_cmpxchg() isn't implemented; so calling
>> try_cmpxchg() ends up using cmpxchg() implementation.
>> 
>> loongarch, arm64, and riscv implement cmpxchg with full ordering.
>> 
>> arm v7 only supports relaxed-ordering cmpxchg; __atomic_op_fence()
>> macro is used to add barriers before and after the relaxed cmpxchg.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
> 
> One more thing, we should add this to comments in atomic_ext.c as well:
> 
> diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
> index 10733bb4a75e..5ef81d2b47cf 100644
> --- a/rust/helpers/atomic_ext.c
> +++ b/rust/helpers/atomic_ext.c
> @@ -91,6 +91,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
>         return raw_xchg_relaxed(ptr, new);
>  }
> 
> +/*
> + * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
> + * architecture provding try_cmpxchg() support for i8 and i16.
> + *
> + * The architectures that currently support Rust (x86_64, armv7,
> + * arm64, riscv, and loongarch) satisfy these requirements.
> + */
>  __rust_helper bool rust_helper_atomic_i8_try_cmpxchg(s8 *ptr, s8 *old, s8 new)
>  {
>         return raw_try_cmpxchg(ptr, old, new);
> 
> I can add it myself if it works for you.

Thanks, please add it.

