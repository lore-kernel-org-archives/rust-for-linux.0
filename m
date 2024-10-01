Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4473C1C0DE1
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782423; cv=none; b=dDcnYixpSkBIfQxhKgXPd4DhXMSrwsOInA0C7kBYGgo7oPDDTPfGngzsp1B8nG4THwz/xY1X/PpuCRpVN73KeVjeWCtnzpEp/Q+AckX/NXTFhqQcjnuVBBcvNAg97rvleWmHjl/UNGAaXMhllZWj+lKNsmFqCrkV8b8OEeGlvy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782423; c=relaxed/simple;
	bh=SftQM+mK4zuXe6IENLMxS5lt9HmW6PTkhl0QXT78BAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJ1U3VhnQLDP1PCvAJxi8zdnXBLoFeJ6fxo5xqoEYfOwl97XzEgzrdfmev6w+yatAUIs/US6M604niubxoNjo48edO11/wDHnPrdZB0a00Ft5W9H2SqFhy9SnishQYlGMNAauUuX06mBu9V91ofYsE90TXHWwMUpDSO3lEqWUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZxKBEitm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZxKBEitm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37ccdc0d7f6so2848257f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727782420; x=1728387220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTHP63C34xg2aogNp65We2l8RnKgujyigD9EBfzjmh0=;
        b=ZxKBEitmLv/P7BPFfc9PiCcqnU/ffSmXEVeoHtU5vnzenNT+WUY23GqbcTRwAYnINC
         y8uvz2BXx8DsU/WLUVi3glPVUxzfAu6Rf3Vyt0HNINXzrr4U3QRBEX8cpaOBddKlIuAg
         AsNEplTbs0w9Qc/q50TqOhDZCHZ/QnpdoxQUrGfHgkHMxeP0tewniI+KtPy2x82NWSd/
         72mGnxEZy2wk0x3QeSSJpqntV43QJv+m31cIhwEcrCvEuoWdRAIgO8+xqJMFpMndGwud
         uzPYgo4eaJPuMK5jRpbG3ioD8aRsAHhdpricLDe13G7+xMg071ztNTa8ysl9q0oMltOB
         Rclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782420; x=1728387220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTHP63C34xg2aogNp65We2l8RnKgujyigD9EBfzjmh0=;
        b=h/y694H0FiaNPfV+g6bySkNXtE7Ns1ZcHApexhRDo/p6UdnudLZLhOsSxjzS5IxHCh
         BKhyXs8ZTT5Kw3YHXBXTtlvwOqeptwrN4T69BC7N1nMF9pAMKBmAlooLcmLIdR6cs6dO
         Lg9ga7dztL9/rXX2iyuvge7REhp0krygzOttw6JzbfnIGSg/hxasumXbrMx9NUXYZ8Bp
         hQJmZEfUdgbogOKZvm7VhAa0buJb4T1ePA3bfGA7B64yAbDgM3i0DCT0gM78jVIZmKq6
         0Y/Pqb2+gvla7gFuFtNHVwxzHprhC7mtVHAUVR4kbC09VzKoIBUdFwYUp53SeMcvFOEB
         lE+A==
X-Forwarded-Encrypted: i=1; AJvYcCUVBhAXJQD6gmCWleW0TkfiqO16JwOcH0bc/RNHPpneL8T2lW23yz/olsGzbsrR9IM5f0SWliV9Tj2ecvGDUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEvDRgeZMQhAxO6peIvTKynAzf97yG+pdWTDVGBOCC0Y/Bz/f
	uZnITXdRLL2pYCzp+dasZQ63hK6UntzSvqw5Z+5QsawPIpedaryimcy+5Tqv2WZegwE+CZXRJJe
	IXK3aLIIKgJquH4Emz6GUM8rezo7nTel2rVsw
X-Google-Smtp-Source: AGHT+IHNgnmCHGWWcbcgOVaommAUTOUhVjoXuxNO5su0aRZagrDrAUwckbYNlwm8xmVl2alDc9izICJYXQUbRut+D40=
X-Received: by 2002:a5d:690f:0:b0:37c:d4ba:1127 with SMTP id
 ffacd0b85a97d-37cd5a8791dmr9238221f8f.16.1727782420382; Tue, 01 Oct 2024
 04:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001112512.4861-1-fujita.tomonori@gmail.com> <20241001112512.4861-2-fujita.tomonori@gmail.com>
In-Reply-To: <20241001112512.4861-2-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 13:33:27 +0200
Message-ID: <CAH5fLggkZjUbGxDep1852AbL61ofhf_p2xoZOh87u0boVFUbPw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] rust: add delay abstraction
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:27=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add an abstraction for sleep functions in `include/linux/delay.h` for
> dealing with hardware delays.
>
> The kernel supports several `sleep` functions for handles various
> lengths of delay. This adds fsleep helper function, internally calls
> an appropriate sleep function.
>
> This is used by QT2025 PHY driver to wait until a PHY becomes ready.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/delay.c            |  8 ++++++++
>  rust/helpers/helpers.c          |  1 +
>  rust/kernel/delay.rs            | 18 ++++++++++++++++++
>  rust/kernel/lib.rs              |  1 +

There is already a rust/kernel/time.rs file that this can go in.

> +/// Sleeps for a given duration.
> +///
> +/// Equivalent to the kernel's [`fsleep`] function, internally calls `ud=
elay`,
> +/// `usleep_range`, or `msleep`.
> +///
> +/// This function can only be used in a nonatomic context.
> +pub fn sleep(duration: Duration) {
> +    // SAFETY: FFI call.
> +    unsafe { bindings::fsleep(duration.as_micros() as c_ulong) }
> +}

We should probably call this `fsleep` to match the C side.

Alice
