Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BE20C463
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 23:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891960; cv=none; b=NxMisdz8pkteV6SmZhtH84GYf6dhX2aAbGjw0DSvWde9UU66JldmZErIy8EgrDI0JEat890qmdU4k0U+yRKnE0y26FHU6F7vsk0KZ+uG6MwpfgZd1OSN7XnT0xDWOkar9CtPt1auIO95i5zgdr6xTKNDx+RIss3aEos+MhY/62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891960; c=relaxed/simple;
	bh=omcPYzJjDcbZzUlVphuK5HmLBUOUCLdxi4R3x8sDZEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoZ1QbH8HSWISnFUH8DfL25x6GaBnCsBTf8yDZLddxb3JGK2j53rc3GcgzycVz5V7uVKQZK/b6Ohint8SYoQhtwQjbnEQhL8LAgoytuoMOL6rBhOPuXWbu7o1iI/LXzBsFoS9yhgKnU8pIoA044W9MBahNU4lgVQigjc4Q3z45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTStEvn1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTStEvn1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-260f41a85f3so3314715ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 16:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757891957; x=1758496757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omcPYzJjDcbZzUlVphuK5HmLBUOUCLdxi4R3x8sDZEI=;
        b=FTStEvn1FvY29nK5V2tZWxTV98tV3CUETsb8vJdK0qifTlYbzRTpD6vM+rsodRF9n2
         keesJy5ci0qeN8jXmXFfF8LiAtgFG8fmiJiEBvikf+GFmct/w20uls1X4ltGCcOIUDpb
         OIs0cg97osAcQY2Cq106x6MBgAa0aKL02qhT7EBuES8Z5uZe5D6hBhbnCJ7w+9VRt6ae
         H7kP+zYFvfto4oCMdl97vO1XoFgKEPanDHBLKu2SqeQnkeRjyxHpI122bq++Pc4Ub1qr
         GD3YB+cJliJ/hBe0Rby5mup/DXDDHjlphdpnEDtlnk+1uPLhZ05//rPAjWvxRnzQxZ9K
         RyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757891957; x=1758496757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omcPYzJjDcbZzUlVphuK5HmLBUOUCLdxi4R3x8sDZEI=;
        b=CQhnSowF8jsqv9iLL5rCwTvtR0mn3L6ywPltD0DQFq51ZY3a0144ITMEvmX4JKvJA6
         CQjZE2JpqJYTa98SYRKINJ2zH2r1eZhmdvjv+iHt8tTEV/+OQwcjMQIZIT3EgdT64ohU
         VcsSyvSqj1Kzwcmg9SZz5IGqERNv6lOl4rZ4S3JiBn5fkQG6gDvgVDzHgDrcgfi7baQI
         lggwrIkAAy7FLs2XQiPzck3uWGIYM1gRDDh33YEayPC5N3Hrg0YEEzHuHEt9HQGt0wQa
         MxExn9SZ6k7mXErABWaLNlEuS3Zi5tvwaxYCDPL6m6yKjk9guSCYe+OTznF4915FkSDT
         L/qw==
X-Forwarded-Encrypted: i=1; AJvYcCWg+W6rfa1TSZVksL8f4ry+dBDfzqp/sl4mlac2EtAYzf1hz5gbXlWBiF0dAa1dj+BhbCRZBH1aX3NDGJvRng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjKwBlT5604QBravdXXc0Xza/6mgQiQVBec0bwXKw21B8Ewd/
	f4pPqJ5LSUqbsmvZN3l2sv8m9aUrOb8gKZA+BSVyZcJZXhTTM8RJcwcBHR+VYKzF1BQH2SPT3nr
	zccvIvUymSmsDMwHXa6gKgtShPb8/Tqs=
X-Gm-Gg: ASbGncvu+ZWP9XNN2hhcugHmzuUa0j6ZgfNl1q+aCRF5CcVJGxSr29fEspf2DMl185+
	GOLTBVb+F3rvPtwtfNgFT01d4bhHYvMoeLNw0Z4m8UXeni1EB12vfvudMwvmZZKE4+0bAjjnckD
	IVu8zc6cyILGk9nSo2GSj1pz5RGsi3ZEmeVax2Gx7Ri7LWkm4dmbz9SwXJZ1uAeek20k7GwTy3u
	IyCRYY+n32zGT6Mj0onOEWeHeaM0w572a2vzZ9ppaXRffrgjD6AF5hfl1DL8UmeNoicn0ZtNhQy
	347BHNphzh/RypNj7+xQWA6c/PS27+D9GgHP
X-Google-Smtp-Source: AGHT+IEqTWUrkgAg391naIf2SYlobFHRHjDHthJoC1Hi3VAJyaxY3GOaXFV76sfylnD3tU/KoicdHzIBmG4240mViMs=
X-Received: by 2002:a17:902:ea02:b0:266:a65:f531 with SMTP id
 d9443c01a7336-2660a6601afmr14295185ad.9.1757891957078; Sun, 14 Sep 2025
 16:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811012000.444173-1-ritvikfoss@gmail.com>
In-Reply-To: <20250811012000.444173-1-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Sep 2025 01:19:04 +0200
X-Gm-Features: AS18NWCMprE13pfkOk_iOgOEovBSGcWOl86_vfy935lEgAyXnMRFq7Jbua59akw
Message-ID: <CANiq72m-HcTSmLrzYsn6YEfHkaSy54=u+tgMwy_JSukjWaSOYA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 3:19=E2=80=AFAM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> When building the kernel using llvm-20.1.7-rust-1.89.0-x86_64,
> this symbol is generated:
>
> $ llvm-nm --demangle vmlinux | grep CpuId
> ffffffff84c77450 T <kernel::cpu::CpuId>::current
>
> However, this Rust symbol is a trivial wrapper around
> `raw_smp_processor_id` function. It doesn't make sense
> to go through a trivial wrapper for such functions,
> so mark it inline.
>
> After applying this patch, the above command will produce no output.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
