Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743BF2DCBFB
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Aug 2025 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117473; cv=none; b=GRHRdMMF6vPFshrS+f1r3wBqpaYhdhG5swnOCLr5BfBlqcSBCew6TV7IhX5nLHcbmZdgRtTHmmYtq9ycSvVuh/2FRiRX/QmlzF2OoNKvvv2UdMsQMn/vOyyfJXJD88fory2ZTJtLavSrj6uyhsQlC4/8U5uo2tSpkT8Ue4u5EPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117473; c=relaxed/simple;
	bh=UDEd9cYvcyaP9oV0NSC9/XLH9axOgsAFUUP1hlXxyEk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b9YUTJ2E0oF//IiYTl04Y3RXxtM9HI2LRmgwKD40BGh0mwocnB1Tm/i32c9iyqeL+NRDGOULLz0AjHRB9HU/0ubeAANNumKTSAp+UB5ZwjH/p5Szr8UHdecZ85BOnA/yImjBBxCs7TXW8qkvhtsy5cPthhm+QO7V8fAHc78vsAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NWHK3YLK; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NWHK3YLK"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-afcb7a3a160so400967866b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Aug 2025 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756117469; x=1756722269; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MQEgOUOrrXTS2cU4ZCo/UoZQZZfBzq+JYf6Z784MuI=;
        b=NWHK3YLKNMxZXXk2MB/PWxI53ckHu4HcRVF3HWMJosxDB58ouLoshdzc/liMMZiGA2
         NALqtMk+gM5oCP1YT7z6tmoDUrUmcMysx3br1QvcMHhcZsfE2IB5ogIjEcbrB5XwKOOV
         pF2zQ34PNz1IFqe3HZUl52EYd0sIh7W1E0YyVfM9AJJzBo5lg2PeVLBig8G+i5i5YETS
         JPAVZhzZxetqpOy1FUlnH0BJMdLxYZXn8aIMg99+t+9kXb+IgbvdPmymojU+OzMb7PvP
         yIW7aj4JC9X6tRaUle8qz8R2qe7lJNfT4KO/tCZfa2Rc9uYg7H8kBu4byDVBoH4rH/Z6
         esRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117469; x=1756722269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MQEgOUOrrXTS2cU4ZCo/UoZQZZfBzq+JYf6Z784MuI=;
        b=sbcfuXzUuBQ73r6Kn9wTMQuCKoiPa3ONuhmKYRiT/JCaiL65NjZi6Lx124FrX3bEE+
         h4Qcx8bOJWgKma3U8osWXr8G3USuyI8LYi1iMVtaCQyGmEBe76mNQTGIIVEISCACYXTt
         xyYEhlTFCt4nbUYQ8y1eTraQ4OChyUBSHX2EH0SZr04CMCoPN+i1VwChhMX6UQQA6MnN
         FVOe0XQ27QPeJ/4Zdw7LJEvl8C3d5UvTGSSGXziGlN35dfnLA3ez+HkXkxESkPxWQfx0
         UL1UKmUYTQG4nSx95Qc2sWb7Tb6mRgdQqGcpkUTuv0PUXNN/uU9mpT+do7KqPY4Ltt5q
         fIfA==
X-Forwarded-Encrypted: i=1; AJvYcCVCmat0QeVFuIyHhH0Imk2HKid+iw35Pn5DE22K86DsFc9jPCUawASnpbxh0YkNeu5ltZx8MNbHpr76ckyjNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlhVu/q2TGuJc9TK+ckyh9scfAmJckmZC+uMB+SduwWcix3TrB
	IqAXyhBheNksvqDuCwyH2DWnSTDTQV2biRyxzMriWwKzy2f2ixmbZYWz9cv44+VJGd8XOglc7zb
	r7LhpoCC4/SzpooXEmQ==
X-Google-Smtp-Source: AGHT+IHUVy9LyT5/15d+7X1nkmpkZk73IXNTDmcKtFQv1QrG5bju8e0D3a2W3PEqdlihwLepVjmRILpk1lF7tCI=
X-Received: from ejctl9.prod.google.com ([2002:a17:907:c309:b0:afe:316:7808])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:60d3:b0:af9:5b1f:b87a with SMTP id a640c23a62f3a-afe2902ee1emr992637066b.20.1756117469548;
 Mon, 25 Aug 2025 03:24:29 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:24:26 +0000
In-Reply-To: <20250824213134.27079-1-christiansantoslima21@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250824213134.27079-1-christiansantoslima21@gmail.com>
Message-ID: <aKw52m-lh62DXwz7@google.com>
Subject: Re: [PATCH v10] rust: transmute: Add methods for FromBytes trait
From: Alice Ryhl <aliceryhl@google.com>
To: "Christian S. Lima" <christiansantoslima21@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="utf-8"

On Sun, Aug 24, 2025 at 06:31:33PM -0300, Christian S. Lima wrote:
> The two methods added take a slice of bytes and return those bytes in
> a specific type. These methods are useful when we need to transform
> the stream of bytes into specific type.
> 
> Since the `is_aligned` method for pointer types has been stabilized in
> `1.79` version and is being used in this patch. I'm enabling the
> feature. In this case, using this method is useful to check the
> alignment and avoid a giant boilerplate, such as `(foo.as_ptr() as
> usize) % core::mem::align_of::<T>() == 0`.
> 
> Even enabling in `rust/kernel/lib.rs` when compiling with `make LLVM=1
> CLIPPY=1` a warning is issued, so in order to compile, it was used
> locally the `#[allow(clippy::incompatible_msrv)]`.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>

With my comments addressed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> -pub unsafe trait FromBytes {}
> +pub unsafe trait FromBytes {
> +    /// Converts a slice of bytes to a reference to `Self`.
> +    ///
> +    /// When the reference is properly aligned and the size of slice is equal to that of `T`
> +    /// and is different from zero.
> +    ///
> +    /// In another case, it will return `None`.
> +    #[allow(clippy::incompatible_msrv)]

Does the warning appear on all configurations? If so, this #[allow]
should be an #[expect].

>  macro_rules! impl_frombytes {
>      ($($({$($generics:tt)*})? $t:ty, )*) => {
> @@ -28,7 +94,6 @@ macro_rules! impl_frombytes {
>  
>      // SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
>      // patterns are also acceptable for arrays of that type.
> -    {<T: FromBytes>} [T],

Why is this impl removed? I would think that with the Self: Sized
bounds, you don't need to remove it anymore.

Alice
