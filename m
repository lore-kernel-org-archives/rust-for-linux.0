Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAC7211710
	for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770220; cv=none; b=sqW7ARshoeGW9Lkp1lRFpA9b5OndKIv/gZv6K/w4ZIRi+JftGC6jh3tQ0sHDG1sCbCzLNvsogz+OXcXed4Yw5MO4ZmM8ail1dxedoAbM33qMUGDH2ueOu4U+YKqXGL6JtZuppsa0Qt4nrmWbCJdipbhOVCUKbzLpO6zKjXGL1Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770220; c=relaxed/simple;
	bh=7iMP3VzOA6iwjrwMuGY+lRy6An1jzocIfGU1h7/Ibj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmzkOB7qGV7LFfvIaSIuZYOY3O3bD4iCiwW28N/DxXzizcWNrHJefpTyZijSlNHleeYH0LOt2sWClWBIoklD6KEZv3TK2oL5r3H284JZZarObolRFMXpgzDznva0pCBPTlfAoG9HbN0NNL9AkLzV8amb5yo2luKvifsHAlr+T+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=myc/QjjK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="myc/QjjK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso29624a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747770217; x=1748375017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVuh6S3J1F9TaWrAVLril0Q/q54OEZ/trnQNfVZ1jAY=;
        b=myc/QjjKPiVbzbJi+G0r12g+wecVjA+RRokdhOJ4Me3p6toFfP+v9qZbNudpaUufzK
         oizrnKy3Exm+0ZxqRt9tZihRG3QeJ2YxyOO8lqKwMQqc/XYEIWbhVPcHtlMHXXE57zj9
         oSc3sm7nGb6y5TYUyD7EtLxFQ5B7GYkvCCv/BA8sDgCDedTdKy0bBYZpRmd0pFcu83fg
         2fOmxP+QiZA6/UpSUSHKqmjoHZ6IDrpScISBLQ0uaCRx7+mEnrPd+j9R96I+TxLlG1y/
         ing7GUV7tFFKZ7SxpMChRtls48HBi1w/5bUGocL4EWyY64Wgv1vhXWhni/5zIBaNv6/C
         6TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770217; x=1748375017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVuh6S3J1F9TaWrAVLril0Q/q54OEZ/trnQNfVZ1jAY=;
        b=r3Utvm4LtXbrSp0XU8q2o0E+M/AiRtmYdJrst7lL28aGLRtSyOQdIWQ9A652K3bN1q
         GT8yjHvTv/OP1o3KVaQ76pDcpmcW2zweqb3KkPa3/h8mMSgl8NxCO78ccw6bOu/CAGZz
         Ga7F6BDCELJx0aMJ6xFnTgooLl7WrrVllxhVx8D0C4upKcnSDYu0PLiLAx6QuCXrYkst
         3s4BQtMS6g2/kQHZ4z/SCEtGq83tWyLf0cXj7iwWCAnkdI59gOnr/u589NbXQV3IOHHT
         wj+ZXnfb8wDjVmNQQXfvsUSAWyZlMwwz7/oa+GHN/xCBB7mIWm1meYA401Mef/A2oMHI
         oQYA==
X-Forwarded-Encrypted: i=1; AJvYcCUnEmRmncEfaBdc+xUjrECU9+FzPV4F5a/be7O5EVDsBja8d/xEr/x/jt6kf8IMjDXvuKvTt1io31FQl9nUBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7A4pDq8Z3rJTKqfWqVn+xoL0U6hwqKHfCcRlM8TishC48Gpo
	nRoScEm/gBS+drWiiypGuYqaMhbMduCVsebXdcKE15swJHwHG5IqtvzKBKzp6p6mvhpVMBDO/2u
	CghVMWBPqvlSxFbSn4Upl8olxCnmWQ046hRjJJ0FD
X-Gm-Gg: ASbGncv6dbcnU7NaWIovybg7I+sfwZ4x5eR7R7fQj+X02k92FTmkRUI2ssp6h+LCBlb
	iC14AjL3E2F77gueFgWbuM8I/FQlebYhHYvSka+8QtAN6WibSb+nscYmmLVsbw5pK1WIbkoOgJ+
	ZL04x8LyUeL07x93uKVKDBdvsjImjWrOww8zQ54qdsKw7HPwkTXOUWwA7hV5IgYjkHlwUg3svHk
	WvwHa2bTQ==
X-Google-Smtp-Source: AGHT+IHJvX9YjDx2d3c583rLSRmMUshXchB5sWSCQCJw3GuXnKAXqOqVSJqf4TKJyzYdOkmw2CS439Nybj4XBPXOmMI=
X-Received: by 2002:a05:6402:368:b0:5fc:e6a6:6a34 with SMTP id
 4fb4d7f45d1cf-6019c7917b7mr327364a12.6.1747770216674; Tue, 20 May 2025
 12:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
In-Reply-To: <20250519161712.2609395-6-bqe@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 20 May 2025 21:43:00 +0200
X-Gm-Features: AX0GCFud_K6kp4jeZEy1YtPgHu6MpFW_3N3hcU-WCHo0eBEV6HSTF1SnPHjVTps
Message-ID: <CAG48ez1vpyAARm-fk1GBfm-Dq-+W1CpCtYiGJm9ZQFq-pDKoQA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
> +/// fn get_id_maybe_alloc(guarded_pool: &SpinLock<IdPool>) -> Result<usi=
ze, AllocError> {
> +///   let mut pool =3D guarded_pool.lock();
> +///   loop {
> +///     match pool.acquire_next_id(0) {
> +///       Some(index) =3D> return Ok(index),
> +///       None =3D> {
> +///         let alloc_request =3D pool.grow_alloc();
> +///         drop(pool);
> +///         let resizer =3D alloc_request.alloc(GFP_KERNEL)?;
> +///         pool =3D guarded_pool.lock();
> +///         pool.grow(resizer)
> +///       }
> +///     }
> +///   }
> +/// }
> +/// ```

Hmm, I think I just understood a bit better than before what's
actually going on in the C binder code... the reason why you have this
complicated API for reallocation here in Rust is that you want the
guarded_pool to not have its own lock, but a lock provided by the
caller? And so pool functions are unable to take/drop the lock that
protects the pool?

This is just me idly wondering, and I know I tend to come up with
overcomplicated approaches and I'm bad at Rust - please just ignore
this message if you think it's not a good idea.

I wonder if there is a way in Rust to address this kind of situation
that looks nicer. Maybe you could have a function as part of the
IdPool implementation that operates on an IdPool, but instead of an
IdPool as parameter, the parameter is something like a function that
can be called to obtain a guard that gives you a mutable reference?
Could you maybe have some lock trait whose implementations store a
pointer to something like a SpinLock, with a "lock()" method that
first locks the SpinLock (creating a Guard), then looks up a specific
member of the data contained inside the SpinLock, and returns a
mutable pointer to that? Basically a subset view of the SpinLock. Then
the IdPool implementation would be able to internally do this pattern
of alternating lock/unlock. Though this way you'd still have to not
hold the lock when calling into this.

It might be an even better fit for a 1:1 translation of the C code if
you could then combine this with some kind of SpinLockUnlockGuard that
mutably borrows a SpinLockGuard; releases the underlying lock when it
is created; and reacquires the lock when it is dropped... but that's
maybe taking things too far.
