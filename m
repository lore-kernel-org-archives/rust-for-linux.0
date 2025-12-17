Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BCF2853EE
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003720; cv=none; b=lGOEWTsMaqjamuegS1pJFIIlu1NEr5U5OxRzaav4Zc3xi21mtHmXjiZpRjSKVWQSZPrudUCQ6lpSj6sBAd482vmtrz882s8oKXUjK8AP2V69xj84lM8wkSi5NESj0lc3VAFcFKaIBOo4/wt2ws0/2xM3OHBHguxkyjIooc/2NG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003720; c=relaxed/simple;
	bh=q6BXD1jM4O1n/rlNLve3zqEnq36Ku1mplFFDAochpR0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MXmVytlBUjL8D1t4Kjz0xpchEZ9GRLol9mIrfu8753Ye7kV3zPhrHq37a1kVOGwD0QbfrYU9jnwq88EIl4hlROvzLhtNytWGNHmlSc6STiLxSELPecbUPtyinNbwSyB+5YqNdFVN3zGSXVlURjgZw/Q6mhX8wqlLpwlQrjrCnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UY/9JZVn; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UY/9JZVn"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-431054c09e3so1641847f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766003717; x=1766608517; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q27wiBfbCCKfOdCabWLX8ZuW+uSHI9nzLdSsiQdmQU=;
        b=UY/9JZVn8E1BrPOtzw+DvJv5MPSmazIWj3aZZWNuk/xyPmprEtyayynnRUSPl8W/1U
         6puOFsq+dbH4QBQ88Ua567kY7B6GRGsRUYuK10qYWCk1IE+Hr1RZmxOskErmptlr6Iqo
         xJHe39nrQHRZeVfr4Cy33oM+j9FzsHxEfZsdkBpRWhObfsDDe3NRvG/6mI0/A7/wQynC
         Hm11k/UWzt/8RLxFtSA7dlCLLcvR419uTN6g2aqOCClW8jj7hljCcf7TbkL0vma07o2/
         8FIdDJNyFtmkwQPH6EVW9H8b+uNOlsSlJqmLN+4Pi/v1AgY0ycpdqF0lZme9sZ/HtbxC
         S0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003717; x=1766608517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q27wiBfbCCKfOdCabWLX8ZuW+uSHI9nzLdSsiQdmQU=;
        b=K1//vpWov9tZmgxcyd1giC1LWqzsOmuR8PebKpARD/S4TljMQfDN3g/lZkOvnuJxK6
         UHGYA/6MMqjQsZiuoFrbh8Ea5h5dRolSo6PMMsZ5Y5/OfdQlezPztXmoiX8hzgLwmsTq
         z0hcDJTSFTy9CoKmTs1Q+vJ58lxYp+WsNLa/BgLcbwFRKzeJV+zJe6wIsOkiG7+Vus3U
         Qa48v7a+Wg3Yz2EE7cZHARa0FNrOGbPhpEHoK48oeDq/fYpN4e7s9DMM5akuqACCnimn
         6zyX0B6m9k5qmbUDzDYz5K0A667kYVIwe4swTmsX1qUYKFa702t6PLTabMe0dQ1ccxdH
         ivyg==
X-Forwarded-Encrypted: i=1; AJvYcCVoh299bFtAtim+o/rW8L/9TaoJocpU+Y9A7JotAf7JmVjKxTJszZjuyro4sHe8MEkxwtOwqd26ubSjrx/9rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz705Drxk9H3j1YjLv36zhXjQ8y0E0nKBtiDdb1nGtpVwE+gsMM
	W3qivS52bLLNb7SwZujEXA4DU7ZqyZDDguJYUG1lWJb9qIL4xwyiWqiA8QFzjSRmcIZZdDlwRB9
	muaSyhb3ZtoWOpDI5iw==
X-Google-Smtp-Source: AGHT+IFgccMGuEwtvhuVLkW/TB6+MtwM3tNOh7cD7bNqkbpP2BjSytZWqo3w27nsTl1rPBL2iVQk8Wis4Yli68k=
X-Received: from wrbew12.prod.google.com ([2002:a05:6000:240c:b0:430:f8ef:dd4d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2405:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-430f23f511fmr18013491f8f.45.1766003716871;
 Wed, 17 Dec 2025 12:35:16 -0800 (PST)
Date: Wed, 17 Dec 2025 20:35:15 +0000
In-Reply-To: <tencent_5524A2A07DE84AF0D8E4B9B21199603AE905@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251211151553.2893838-1-1479826151@qq.com> <tencent_5524A2A07DE84AF0D8E4B9B21199603AE905@qq.com>
Message-ID: <aUMUA_JWalyGQdAx@google.com>
Subject: Re: [PATCH 3/3] rust: cpumask: rename methods of Cpumask for clarity
 and consistency
From: Alice Ryhl <aliceryhl@google.com>
To: yilin <1479826151@qq.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 11, 2025 at 11:17:59PM +0800, yilin wrote:
> Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
> align with the established naming convention for constructing types
> from raw pointers in the kernel's Rust codebase.
> 
> Signed-off-by: yilin <1479826151@qq.com>

You need to use a real identity such as your real name here. Please see:
https://docs.kernel.org/process/submitting-patches.html#reviewer-s-statement-of-oversight

You should probably also split this series up, as the patches are for
unrelated subsystem.s

The change itself looks good:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/cpumask.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> index c1d17826a..44bb36636 100644
> --- a/rust/kernel/cpumask.rs
> +++ b/rust/kernel/cpumask.rs
> @@ -39,7 +39,7 @@
>  /// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: CpuId, clear_cpu: CpuId) {
>  ///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
>  ///     // returned reference.
> -///     let mask = unsafe { Cpumask::as_mut_ref(ptr) };
> +///     let mask = unsafe { Cpumask::from_raw_mut(ptr) };
>  ///
>  ///     mask.set(set_cpu);
>  ///     mask.clear(clear_cpu);
> @@ -49,13 +49,13 @@
>  pub struct Cpumask(Opaque<bindings::cpumask>);
>  
>  impl Cpumask {
> -    /// Creates a mutable reference to an existing `struct cpumask` pointer.
> +    /// Creates a mutable reference from an existing `struct cpumask` pointer.
>      ///
>      /// # Safety
>      ///
>      /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
>      /// of the returned reference.
> -    pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
> +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
>          // SAFETY: Guaranteed by the safety requirements of the function.
>          //
>          // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
> @@ -63,13 +63,13 @@ pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
>          unsafe { &mut *ptr.cast() }
>      }
>  
> -    /// Creates a reference to an existing `struct cpumask` pointer.
> +    /// Creates a reference from an existing `struct cpumask` pointer.
>      ///
>      /// # Safety
>      ///
>      /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
>      /// of the returned reference.
> -    pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
>          // SAFETY: Guaranteed by the safety requirements of the function.
>          //
>          // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
> -- 
> 2.34.1
> 
