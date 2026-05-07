Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9502F1FC9
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138556; cv=none; b=aPom0vr/Fn83N/sob0+weFpMwkXpwnjkskQ/+6M3AsNapuA0mufJTW9Xy6EtYi8Sm75Y6s/AQZxBRnnxSxrwnYS8lpzuLgwhN5vdsYnqcAZmZvK831Chmerk2Y5IHOZXTTDB5jBTkD5n2Rcdfed8a0ldnAX7imRO1x42ymXN3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138556; c=relaxed/simple;
	bh=YXMOp31DDtx5suzwWLOoKI74J+bo3KCD0s3BvMgpp6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hmL/gZ9J3ckT/55Sojcz1OQnYEQF6oyZP3Ldp/rrPTH9wgTKiD7COeCt3ddEslrYlVEf9A8Jo4txeea/iMJH5euJ5UwgkGLwXyRdwzT9q3RiMJcbSD/t0TwJKWpsJ2xMqQLg6hOFpSFVfxdaTdOZA+XgC8TGfuLYAE6BCQW0Gkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jhD4JFOa; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jhD4JFOa"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bc577f52c94so38490366b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778138554; x=1778743354; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVOdNzD+VUU7vHw2dUnq3MKLiiC7IJnQhyGnEgnRkcM=;
        b=jhD4JFOaHJ4vXMX//pOLMK2IEml2M9q6caGeMTaZsZmy5QliHidvKAblZqGdJOWxOZ
         eyLVV2qCDXuwDFANDLom4i8CkunACZkJnQ13rXlWgHZYyb01doFA9isewVP7VU1CmUJ6
         j1ztulOBCbOf0I4ZdEIbcjZged4G7iE8uS/0JW2OqUB/550mEVAMc2u7a3hLGoYF3g9S
         l8o111U1/joH+KfG+tab/FjsRdlldccSM0D0xRL70tImvtqTilvn3/Wqc9Zuo8zkInbQ
         gxgG3QNc08NwIx/VwxgSv0QrNqMcSgT5xgSCT/mLsAH22ib3gUNIg66q68o2c3VfrwmL
         byWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778138554; x=1778743354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVOdNzD+VUU7vHw2dUnq3MKLiiC7IJnQhyGnEgnRkcM=;
        b=s7jC4FYfosakk8tiTVd/sO4lb187aaFa4KtOHgZ8ph4CGlpWbDj5Mr2g4FJXdZyHrV
         tLioVqKQ0x7i5qNPDnWpeCJJGUnus92Q/wecATmekn0eFgRfZBJGMBubCNI+fq1QCpqk
         84q/hDLVHbpRrh9/w0y72eBUl+2fxKH8XJIz9FViKKAJePoYQ11PJkKYK58Fkgffk42G
         8iBkS+nh8gGXIHGMU4Rc3e8esm38qDyv8Z9FyPH0sMMcLXA5T6d7kivf7qHL2yi43c1U
         2qzoBKSIjrhegA93ne9bA6fT9BaBorr3+A6fhKas2Plj2qQDxGTBcebe5VzypmJ/815E
         /H8g==
X-Forwarded-Encrypted: i=1; AFNElJ+d1kwZijoVcMbO0iw3hxE4gHmERO9r8IuIIeHd4A8HZbiqiNjzmMLH1I9wO8DYHXh4Y/IZAuReeGPS3GYzhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztjn6TS4bFmP60gkMws+iwvGRbMR/BbgvqXj4c6j2FuEop4MRO
	nkXbGTIr3LiVTMV4wb4q6e2eR26nLlVaTwSnMa2QCL0DEEvj9u0muo47gwM5nkOT8PNfcYV0Js7
	7G+qKZjR+mddBdyrfWQ==
X-Received: from ejcsa38.prod.google.com ([2002:a17:907:6d26:b0:bc1:3e57:bbd0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:70a:b0:b8e:796a:fd5d with SMTP id a640c23a62f3a-bc56f303d16mr420732366b.39.1778138553287;
 Thu, 07 May 2026 00:22:33 -0700 (PDT)
Date: Thu, 7 May 2026 07:22:31 +0000
In-Reply-To: <20260506204913.26022-1-arnav4324@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260506204913.26022-1-arnav4324@gmail.com>
Message-ID: <afw9t0V6_yLxauPk@google.com>
Subject: Re: [PATCH] rust: cred: add safe abstractions for capable() and ns_capable()
From: Alice Ryhl <aliceryhl@google.com>
To: Arnav Sharma <arnav4324@gmail.com>
Cc: ojeda@kernel.org, paul@paul-moore.com, Serge Hallyn <sergeh@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-security-module@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 07, 2026 at 02:19:13AM +0530, Arnav Sharma wrote:
> The capable() function is the primary privilege gate in the Linux kernel,
> used to check if the current task possesses a specific POSIX capability.
> While bindings for capable() and ns_capable() exist, there are currently
> no safe Rust abstractions for them.
> 
> Introduce safe Rust wrappers for capable() and ns_capable() in the
> kernel::cred module. These functions validate that the requested
> capability is within the valid [0, CAP_LAST_CAP] bounds before calling
> into the C side, ensuring that safe Rust code cannot inadvertently
> trigger a kernel BUG() on invalid inputs.
> 
> The abstractions take a `u32` parameter to ergonomically match the
> generated `bindings::CAP_*` constants without requiring explicit caller
> casts.
> 
> Signed-off-by: Arnav Sharma <arnav4324@gmail.com>

I have the same question about what the use-case for this is.

> +/// # Safety
> +///
> +/// The caller must ensure that:
> +///
> +/// - `ns` is a non-null pointer to a fully initialized `struct user_namespace`.
> +/// - The `user_namespace` pointed to by `ns` remains valid and is not freed for
> +///   the duration of this call.
> +#[inline]
> +pub unsafe fn ns_capable(ns: *mut bindings::user_namespace, cap: u32) -> bool {

I would add a UserNamespace struct so that this raw pointer could be
avoided, before I add this method.

Alice
