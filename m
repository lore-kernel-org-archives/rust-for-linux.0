Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F119CC11
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731188714; cv=none; b=ZgcPSBQSrYbWzqk0oGf23R5Fcgj+eoYgawQ6p3o9feqzJ+EqCF3QNuC+QYjqYNNAS5ujL6nfJlzhO4ruYi04PaSChyq1iT/ojlDAD9LX5Q79JaLTYqYWTMeKyhvLWWx4JX1dv8ADZ2S957IDI5CF3wnaYrgTDoy3S9/UhSC2coc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731188714; c=relaxed/simple;
	bh=2iF2QQ8M6KtyL4jfNj15hJ+2VCFaD11wUZPZCcbFTZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cM1an9x/RxfFG1kwCVHwrGvvEViHz/dv9B8dljCtPHFjsleUW0j5wa9Sx8HH55X6h8sSGCtu4N4R9UQNaSPOUhVTLymamXfMGyUaJAUw30OEjc0zQU+VsvvAU5ew0bCcgcGY8pjcfY5fn/PU/QWPAhYVcGdUpq/QHeYaBJjzrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7xQ4dEg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7xQ4dEg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20e74ef69e5so1810415ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 09 Nov 2024 13:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731188712; x=1731793512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKw97otkgG+p5il/Mfq7roDr9vrA0tG7wrI5krDm6Is=;
        b=T7xQ4dEghTuG4gnqKXHIOOITr5DQC1CwLUqQLQuN1a+swziRH8TvYQ2Oz1E4ZP0WeJ
         Xz56retqpmC3XPWCxOvCkzVhEWf3vAizg/K+y4TyWhzfEcHgb/0Pky2E9fbitgzsK2tJ
         rmOSqeUMplK1F3Id1x7eYCIKbL/CVcgePHD8t+iXJTOpp0t3h2JzjCrVIpI8RGfRwQ7y
         Rxy/K4GsKTMy5dsBJB3RQl+Un6fwR8AUU7BdaMNLShplbk0tugrq/FCl1jJVeLdNFxT2
         fIiJ56GWDX2WHJlzjyCdpa11ixFKKwMbfmPCPAYHb2mSvmqrHoDJADz0reXv9n3fgbjz
         7Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731188712; x=1731793512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKw97otkgG+p5il/Mfq7roDr9vrA0tG7wrI5krDm6Is=;
        b=HntwtEjCEP2tE0WgfJ8X4D4Yk1ivM4yujF4m45iPpN8HNhyF7Ah+LzkKL3wy7LjK99
         h6r4t30m1AQHSFMjY+tRe8ImbVSH4X18sHkq4jbd+zC4gcNMXj3GsG2O/PEbx/MMAq2r
         JUd2KOzcPanc7x80EzjG2h7MQsuaEwXYjNhL3sw3z8ZJ0EW9SnDAAdgGuxErCSkz2oRU
         NcWUK8kSYMnRwrFou/yNCEuCoIbVuZL/78HbJk0vQ9t6Za+mf6wTliNYInyyM0ol/ZF4
         aztX2DK5shMjBVrQrcBGuH1PaBuMf/kaqPtMylpzYPLY2dyXYSjFaNn3Z3dSSeaKI9PQ
         rcAw==
X-Forwarded-Encrypted: i=1; AJvYcCX9VRwnUzIeqho0f8DChPn3vMjfiqaeTsCu3aQDxKmt48XWxzFME1mEwzsKvobjS2WpE+xc8nhG7kkhDTug4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HdG8kVhjFxUUMlt5Suc3CnT0UwsDnNlFVIfwxoSXZgXk29YN
	TnC/BaE/J+MaPKn4f5w0n2y7wuJrrSMk3EdmTjIRvoItwZvlbrN8iZRnpiA93WcCXBI7GlRsHMk
	NaefU3sQkGSTrapBFbfHFf/XA77s=
X-Google-Smtp-Source: AGHT+IH+Fec+ezRnYygkN+7h/dCUOGcCu8sJqN5ZeaLc15nddc/5UwoTo5KeMOBIWdyhej9Iwzl46ekLrqKkBFobbFc=
X-Received: by 2002:a17:902:c402:b0:20c:9285:e951 with SMTP id
 d9443c01a7336-211834e0ee6mr43689325ad.3.1731188712140; Sat, 09 Nov 2024
 13:45:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
 <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io> <CANiq72kUAOX5girN+07e+R0OHuwJX_XRJCW0yQPpbBLmaP0wng@mail.gmail.com>
 <OBHnCkU--B-9@tuta.io>
In-Reply-To: <OBHnCkU--B-9@tuta.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 9 Nov 2024 22:44:59 +0100
Message-ID: <CANiq72kd-SfL-9hQio4gNn=i1eBJ9o-sAY4PaVnPokHiR5eL+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Rust For Linux <rust-for-linux@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 10:33=E2=80=AFPM <jens.korinth@tuta.io> wrote:
>
> There aren't many other uses of `DO_ONCE_LITE_IF` in the kernel, that's
> why I kept it in `print.rs` and hidden. I didn't quite understand what yo=
u
> meant with `assert*!` - can you give me an example?

Like in userspace Rust, our examples are run as tests (but unlike
userspace, we transform them into KUnit tests so that they run in that
framework):

    https://docs.kernel.org/rust/testing.html#the-kunit-tests

So examples double as tests, and thus if you use `assert!`, you can
check for things that you expect to be true or not (e.g. that
something has run, or that it has run once, etc.). The `assert!`s are
passed back into KUnit.

> Good point, but I'd only do that if it has at least one other use from

I would still put it in its own file, even with a single user, since
it really is a distinct facility than printing that is likely to be
used elsewhere (i.e. it is not just an implementation detail very tied
to the printing macros only). The C side also does it, so there is
even more reason to do so. (It also allows you to reference the C
header(s) in the new file/module.)

In general, if we expect that we will be moving something, then we
should try to put it in the right place directly: moving things later
is more painful, especially considering the different trees that carry
patches and backports.

Thanks!

Cheers,
Miguel
