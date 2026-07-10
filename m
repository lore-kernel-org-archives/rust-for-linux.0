Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253A26296
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701494; cv=pass; b=hA6TUr8wUi2NGIidBZxUbYqz1iOVcX9iQ+/xbA9vrQx6Sy1b03Uiu33BfpINCtMCN9L6kXzAcOUt3RLxIPvsw9kJJ9o1wRqDz3n5txFQQQbBdR/P45Y3FiPk6nITd91yC+6dzwqlZ0PHLY6nMwi6ofLmDtEy7/8KsGlpFm8/D88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701494; c=relaxed/simple;
	bh=JVRshr3D8uTeHDQLRHhY+4FphdadiC/sXdk8hUweVzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4N12iWA+WRmZJf5ZuUbRElzyOC1AhLBWYVX96H3VNgQKY4TU5ERzGrveVUE9DwWkOfD6ishGMygTq4GJv8SQlpxd9pfsWuS1S8X/s929w8wq+rfyl6QQ842ySxHWk4FUbceOiMo/gthWOjs23vyCPYV87D4sqis/aEaqd49Uk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc1x+iNt; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc1x+iNt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so504772a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 09:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701492; cv=none;
        d=google.com; s=arc-20260327;
        b=P15QgWjT3JpBXujmIkBzdbLAxV6/uzpdZjpVvpw7ektxJWjaex6yZv+dZTX/lh9mZK
         wkf7NIi9gSRHW/PaM5pIXaquKUQo1TG1xvxKNAZ92tRGm/osWIcFxOlnqSfrSNvQYtJL
         ihjiiaBjVT/B3p9lS8x7MKECYUOtS3vceov1b7fxGSXMd8tFK0nB2qtawnmGheK1hWJG
         zYx7wk2sUjUA7pTGUK9WJiA2LzG/F2ejrXKTHoMeflj0OMPg0o0ENyXD0ay2/cD+gWi7
         NMVRAKUu4Wwi/g34LdvMxJ52hxLJOKfyP/LUE5475C5wtaR7JyIeDUh4CxnJ4dgZ77Jj
         zVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gAkF/aCKp4VMrXUi9BS94W3tPkrfsCY3p7ZBeyWaneU=;
        fh=qAUjHmMCc79nHRLLk4wPRym7vb7yaL4RCfFQUC1pIjI=;
        b=oerC5EMeTd045AOhCa8ysPvvuPIVBeSBuMXtlK9AHk7Y6vQtMcQoxZyLF3E4Z4YKiu
         SNNQxI4+e4GejG3IG5y05ubUXov+m1FRPybGUazSE86Bu9nx+vExp6QU8LKYBSosuzMe
         8yIyRYlx8IKz2dHqT4suKHRQWkOSKim12X0P1XmK2+JDxac4IpzkpB8u+tLpTawgepd4
         nFykl5oPyDTJngh1TNjf3J5DtFVGwaIHZJcGiDh4xzB8GINpgmGH4K6YpwH2tMfIRfbx
         o5IcXy+LZeaLcj1HNla1/7aNPJsWJOEoZ+susvAl77f5QQXylc2DApWPFXdCb6rcSGIN
         VLYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783701492; x=1784306292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gAkF/aCKp4VMrXUi9BS94W3tPkrfsCY3p7ZBeyWaneU=;
        b=lc1x+iNtCGzUKIi32emDcOzzulkHyDSHnrrhO6J0tQoVsYlsTRrr3aLsnZF8bF+Ntj
         psxUgFkAPKA5t1M6kNnWQa1LOTB3neT1WvWZ5k2qwaFtIUnqG15mTmy/SrtDIscn3oOD
         FdiyaPyxZPYPehkKqM8ncMEj8gGL7K0gnE8DOUni1xOrZoCsdQ1T0WfJSDfxTthRACd3
         yw93QMp/5/IlutVTYCjZOQydr1bk5qXBIH8bNanllc4wiJTIHI4sb3OI+TrZR8iLaD7Q
         R2N8UI1oa8cHNvXW3/r9H8qMjvP/qzSdAwYUlBbuGj5yOb7P6WXjDbOQsJ5qfVpglqRe
         hwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701492; x=1784306292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAkF/aCKp4VMrXUi9BS94W3tPkrfsCY3p7ZBeyWaneU=;
        b=qzsQhb7jjqfdnGBdQn2XJ0eAd0qk4f3YTo735kulknV9Xh4SAuTVTFwalvMpbPJJvh
         IVrxHexBorQoWXcHGCYbIw6+3wAoxqs77TCIo5zEt/UVQHQwXxHR0MpjN0RjxvlPkyNl
         9IvjphrshgfGkPSdcie37Fvjd/PK/HypS2j5M4wzbUbji8kE4c4p5qEBMcfpn5pmrioA
         eESFk6HAaTiovNli8Yoc/HOlncnOMg4JWH0SyecM/YoUPnquKsVkS9iJLoQau0gmYIaQ
         jAaoxV/FhedFEpzeMdLEZ7iLRXBI/UBcy5KQEgpDNRJiZ2RJ2RFl400is72UucSAxAbY
         1A1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6zVHuEu/mEeMxBZ/45Siy4tBvC4Fm7CPa4KM/AVds7jiSvbMGu8RXaulqsNXu3pV3yLpzfhPdjz1/WWXF8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+UWx6zEYeWtZnzV6KZ0uQVgAMDMNoGHiwgpA7xrYgC8XxEti
	JeR7fIysdNeOKUyng7zI2Qw/ONGR610SXTF7oDK1bp8LBM/4WKMkylVETj3d2Zu7ebevUGmn0AL
	yBNjlxdEKgfZ4uv+UaiiCaxEyxKdXwsU=
X-Gm-Gg: AfdE7cn6np2HRtwjmDPCsB+30wO3t/OCkVJJSH2cM/vequo12L7bwVcHXPAazpBchw+
	dYcdA23SWR8Ci/Sra0AmN7qQuBchZH/UIiSZNU7m0ATQmlfeEngCmdhAbt9kFDj7tlPM3z5UHli
	N3CGh8XIt2/nqm5VHGEd1Jp4TjzC2zC2xTdR5zeMXawGY6lKGc5gzAo+oP13mIxSHKR6+h38pZM
	p7TLA9/2bEuq3p6x0XksbQBAQ7M66YllRpuVNcxv+l2RYfOBJXqCXmolxRr1M4FtdBAeUyVJIqs
	5OysTNdpnbdPkbVpa5Tzs4TmnsgHr7uxbIFPkNrZVutsu95k68W8D8/JjFm3N/yq+ZbL57wGfyS
	wLW5XE5LzJKjo
X-Received: by 2002:a17:90b:33cb:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-389419cdeccmr9049403a91.4.1783701492403; Fri, 10 Jul 2026
 09:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com> <2026071054-hazing-antirust-8e40@gregkh>
In-Reply-To: <2026071054-hazing-antirust-8e40@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 18:37:59 +0200
X-Gm-Features: AUfX_my9YcBRz0kiweVl9KycdjdMe6ao9zwzF5EJxVzzFaZ1ntmxSy90-ax-nt4
Message-ID: <CANiq72kxNx6wdvAW1DjGm=JhPiqs74qwxfPQ6cRHxiuZUubBPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: jahnavimn@google.com, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Not an objection, but don't we have the equivalent of the BIT() macro in
> rust?  I think that's what this should be using if we do...

Yeah:

  https://rust.docs.kernel.org/kernel/bits/

We should probably update the example in the `impl_flags!` macro so
that people use it here too -- the macro already takes an expression
so it works.

Cheers,
Miguel
