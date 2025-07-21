Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCC24167C
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 21:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753134706; cv=none; b=AUp/kfOxT40/Wwne/jRZLp+SRwnzdDknMu0ruR4IJsZCD60W4HJ2rvL/d9T6BtpxpO656R/LSS3omNaJE3iXrgkdxjf+bqVnMDPxKIj18d1ttY/uUGHlS6/9IMzgwSKmm8PkNrtBj7en2L1ZPX1Lmk47CAdbDvzywzRf1t0/4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753134706; c=relaxed/simple;
	bh=y+YPPGoYKeGluDoZS4y8WLsJjpbf1ZVmCc1adMdcH5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tgpa7opzAjYR50aoGgE+r3i36BLnWuU42wybgtCNcPrKoKbh+Ey7758oDAm2KaKANLolwv5rMxlk8e7RIBa+iV21n+099CLla/E9dM+4WS19b/BvjRJQ8Gdue2mREUJIxetNNHyM3ocjXdOHi31oYx/xLB3AHf8yFoGEyTirCc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4ywJQwU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4ywJQwU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31306794b30so48408a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 14:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753134705; x=1753739505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgGGG9WeIrngzNjbbC7Xb5/2zt5vrFYOWzJjBv/zdT4=;
        b=k4ywJQwUpt7DLyZsYM6usn9Boepk0FQyf96TaLiqyTtCPSj31lBHDj2vV9Mj+T4bx7
         ey5pm7cG2KAID0YbfYEaEOFgNjthexD285+Rp6B3/+sjwXyFlwBUJjteb6C2hw5jMkeI
         6NtA4kD+6xyTvECIDt1JD0tR/jgHLfQzJ3sdwf1DeyaeFRuqmw3kaXaEdJ9pR/pA0qDN
         3trVSxMA24EVl3QVXZRebtJWZRgHynfBreNerIoSjC4mXcf7gujAoChRIpJXZLAyhc+l
         J7jgS+6D8XHtMyMOqfRHtvO8j9SUpogZ3uf0gV0Z+xcGxuwW+Vk1/1CCqaZTaZTLRc8H
         oFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753134705; x=1753739505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgGGG9WeIrngzNjbbC7Xb5/2zt5vrFYOWzJjBv/zdT4=;
        b=HdpSK9EH3EEKPc+22hhZE2G6Waf3/RVEG9Om65d0SqsZZTGUGswA0TK1ed60pVHBBx
         Jv4ye7it0WdOJxUmsMfB82fSa2rRukRixq2RGDAl7FT5Ib99VYXEWYMAvJI06R+0tYhm
         ybWNI5CDvf52Pku3Kac0DqWFB0sRdEPSYZH684I2AEqiYvQc8zaOTJmdbxBpkb6YyNnz
         CaGXXVaNz9y+hGwIj6e6faGzPflNQbvvet50IGgGmyTWbl8g2o1StjthHb6KnnblNrZK
         Z6Y2jbmX+WxjjcTrDGGexfpGYMHiqDfbGqY6wDG+8Zhg+dB75+d5plAMDGypOLdI3aTS
         n2EA==
X-Forwarded-Encrypted: i=1; AJvYcCXIXqzL7qBxVIgPQdxvjy4xLKpALqY/ZICY0GqBg+lOD7dKqsyKH6RxnYeCgYyRFQbzlqmWSanCuZ3Ahc46Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwooRv6pTLatm6lxaLdN4ju2hhr48BmjsaeaJpa5fyU1UT7fU
	0CRilrOsFcIQkd7txSyfe+sb5aEPNxbQKibBO8tn5GIB8cs3mueZ4cI/738/jwqYSuk/VTFZ6Ua
	PHdqYRi19jJjIsvlQGjM60MKT9Brd41c=
X-Gm-Gg: ASbGncvcJauK10eiHcS3y3aPvZTRWXO2ZkzEqLrqd0kokubETfsmyQ89ok20oq/zvm5
	GPA+Mir3g0Se09fG+cHPeNFfMRbKmP9fIIgRR44Aj75AOsHT1kZde7UC0hhmXsouXsvUqADud5B
	1PgAPtHb+h+Y5UqFg/Y2I8/ECg4iHDiu438wvf5hW0fj1kkJ67igvXx3CyclnoiZSMhQbt5wVAU
	F90xqhU
X-Google-Smtp-Source: AGHT+IG6JJgbX06NDA7GHtuqW3pSJXHHug4JeMx++FCyzkXBJocdVgsWL4IICSfEdM3CeFMbYL4a1Qdm20uPO8x0Vgs=
X-Received: by 2002:a17:90b:540e:b0:311:9c9a:58e8 with SMTP id
 98e67ed59e1d1-31c9e79d3dcmr11972349a91.7.1753134704649; Mon, 21 Jul 2025
 14:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716045957.39732-1-ritvikfoss@gmail.com>
In-Reply-To: <20250716045957.39732-1-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 23:51:31 +0200
X-Gm-Features: Ac12FXy9YT1qttAnVMt9llgOhraJhRxpvcg-pXHLwNCjuXVqNYwtloG2Otrlsz4
Message-ID: <CANiq72=C=VHGXFvGuSY7rnNOvW-2yAA_g5yQamVN-mG9btwMkg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: introduce `unsafe_precondition_assert!` macro
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 6:58=E2=80=AFAM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> macro. It is a wrapper around `debug_assert!`, intended for validating
> pre-conditions of unsafe code blocks and functions.

It isn't really a wrapper, since it doesn't call it, no?

> +//! This module contains the kernel APIs for verifying invariants
> +//! required by the unsafe code.

We normally call these preconditions, and normally I think "unsafe
code" is associated with unsafe blocks, rather than e.g. `unsafe fn`.

In addition, we may want to use this module for more things, so I
would probably just say something more general, e.g. "Safety-related
APIs" or similar. Probably Benno can chime in here.

> +/// Checks that preconditions of an unsafe code are followed.

Same as above -- I would say unsafe function (if we really want to use
this only for that).

> +/// are enabled. In release builds, this macro is no-op.

I would say "Otherwise, ...". Same in the commit message.

> +/// // SAFETY: The caller ensures the size and alignment

This should be a `# Safety` section, not a `SAFETY` comment. Please
see how we usually write those in other files.

> macro_rules! unsafe_precondition_assert {

I wonder if we should call it `safety_precondition_assert` -- although
I like the current name since it matches better the (unstable) Rust
standard library one.

> +        if cfg!(debug_assertions) {
> +            crate::pr_err!("unsafe precondition(s) violated");
> +            ::core::assert!($($arg)*);
> +        }

Doesn't this print an error every time debug assertions are enabled,
whether or not the expression is true?

Also, shouldn't that be `$crate`?

This leads me to believe the patch wasn't tested -- please test
patches before submitting them! (Or, if it couldn't be tested for some
reason, please say so in the message)

Finally, could we actually wrap/forward the call to `debug_assert!`?
If we want to add a custom message, could we match the parameters so
that we can then prefix it?

Thanks for the patch!

Cheers,
Miguel
