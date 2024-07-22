Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E6523A
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jul 2024 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721639361; cv=none; b=NAkQ7uY7NeNI/36L920/H3yfdqoxx77RsnKG0ieGrap3W2ZT773C+Fv+lQ4IEw0/7K3/klo7NgitzwIPjLzFoXc+O4en6a+SrimZJ7164GR5vVUz7IiHayHhELynboOJojJD5J9uRe9MIrOA3+7KQ6JrU6WK6soWPe5DreX11O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721639361; c=relaxed/simple;
	bh=gTL1VCkA01/hHiwB+85YSNQGYqFQPUDfry1s+s15yNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oR1n5TRs7O6FUl7InkV08PPsh4N1r+MePutjT6tUy9+8i6BAxose22WjTTDMQMM/rB9oDDJGtlPUWF8JvY3B4Aez1mvnFv1ZCAI1j4dWCkV3Oms+auwnkjuV+jGjEfdE7FRGoiFxV+i7otjs6FuIM8gJ6hGlvgxe28Bhq6sAl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kymzt0pR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kymzt0pR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367e50f71bbso2247128f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jul 2024 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721639358; x=1722244158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah24y1yQSASYJYM3HEnqaKXhBwm1vy49N5JwUW8UEr4=;
        b=Kymzt0pRQ7XrLu/DJUN98O7FJr31kA8xbLG5ECWN68ND5BLwh9/hMpJyN+3/L8eP0b
         f8ELTqDePI9nFxRfCgjkXU1pEsiSaUg/DVmzrAryZeJUgQS7QOx1jPn5Ca2Xl0Di0qc5
         OidTgu/3pnxcXO98Tbd5f8ovTIokQly4OF3HCAkCAzW4lwRLlp59qkSFjqVNixsNGXwH
         0W164gfVruLCFIHdsVi3nf99bdvxS0+Otq5VHpZbTO4tfSSUndzxZBJkGDsioJyFGmWs
         FnYHGjEvuZykkjXS1YIryrcGlMJLsmxO+ajuk6u9BLjuWZfggUVLGqhKYqY3Y15rKA9a
         BKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721639358; x=1722244158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ah24y1yQSASYJYM3HEnqaKXhBwm1vy49N5JwUW8UEr4=;
        b=AdcmUJX5PWEWRsTPF9Zc1Br3i+hhmMcMlqMlJ4rIt7plzRQJXQTcd8fA0AGE/WBh5L
         XDgeC726RZmKsnYDm7rz/Qu5N96IVjZz4laeZODKkvzfWC2csQVDIJKmVlS41a7WW7Os
         VhJwvRXroTSIhcA11f7c5KzZM4nw3rqEM3tAwWMQr1JFkQNr36Y79TELcgaZ1vZKtnUy
         9GZdgcpleH1mnMVF3DaqpXE3NK98fumWoUekVx44a9jKg49Bc2qfWm4NDIiTfjlzQb02
         qEXHdH5D3RhlV1+0MuiymzB58A2cOxlwOgkqJYuqefKHDp7y0/hyRvhpUuj6hhHt4wVz
         nxJg==
X-Forwarded-Encrypted: i=1; AJvYcCWR5DT2q4zTuD2qiAaLGYrY0il0C4atw80tAE/jNptjxEh4xxyZhLxOBK19/+DPeCLBL+kqrHMvHkPHaUbxC6WGaY4cQPmFktdSGjJ+oO4=
X-Gm-Message-State: AOJu0YxAkciXUIWIMZFxcp5T6a5edt38TRw8Lw5p8m9SzWg7zpLBnYE3
	ooMx/ROMA8R2WN8OSA60Ax+EIwB1Khtm+Iz8uersc0tGxd0DPR4X/3oo3X7Ma46wAFCpXc32+hN
	Pt5lWVV76zb/KyH4QKxrFgnDLOZxUvLY5CBnt
X-Google-Smtp-Source: AGHT+IGwSprF0fVSAeDXSVP69s81y0vecBUb0pn4T8XiVJU9XW190kHqnX6vSFoO3578vVBstvt8xVTHpBcR7doSBF4=
X-Received: by 2002:a5d:58e4:0:b0:368:4b9d:ee51 with SMTP id
 ffacd0b85a97d-369bb2e1a52mr2903177f8f.57.1721639357955; Mon, 22 Jul 2024
 02:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719192234.330341-1-alexmantel93@mailbox.org>
In-Reply-To: <20240719192234.330341-1-alexmantel93@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Jul 2024 11:09:05 +0200
Message-ID: <CAH5fLggs=5k0HR2G9XbZ3k-9gjN=CwU_ZHmAbB7zzWj4Lcu+aA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Implement the smart pointer `InPlaceInit` for `Arc`
To: Alex Mantel <alexmantel93@mailbox.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 9:22=E2=80=AFPM Alex Mantel <alexmantel93@mailbox.o=
rg> wrote:
>
> For pinned and unpinned initialization of structs, a trait named
> `InPlaceInit` exists for uniform access. `Arc` did not implement
> `InPlaceInit` yet, although the functions already existed. The main
> reason for that, was that the trait itself returned a `Pin<Self>`. The
> `Arc` implementation of the kernel is already implicitly pinned.
>
> To enable `Arc` to implement `InPlaceInit` and to have uniform access,
> for in-place and pinned in-place initialization, an associated type is
> introduced for `InPlaceInit`. The new implementation of `InPlaceInit`
> for `Arc` sets `Arc` as the associated type. Older implementations use
> an explicit `Pin<T>` as the associated type. The implemented methods for
> `Arc` are mostly moved from a direct implementation on `Arc`. There
> should be no user impact. The implementation for `ListArc` is omitted,
> because it is not merged yet.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1079
> Signed-off-by: Alex Mantel <alexmantel93@mailbox.org>
> [...]
>  /// Smart pointer that can initialize memory in-place.
>  pub trait InPlaceInit<T>: Sized {
> +    /// A type might be pinned implicitly. An addtional `Pin<ImplicitlyP=
inned>` is useless. In
> +    /// doubt, the type can just be set to `Pin<Self>`.
> +    type PinnedResult;
> +

It's unfortunate that we can't use an associated type default here.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
