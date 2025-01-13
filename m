Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E07C229800
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779341; cv=none; b=B8KQCqZ3Olg/gxmWT08rwzkyExHHHZnVexcUDSMN4Mtk3GiWgveEQ5aUJ7OWWuGn+grUjK362gSzvo98M3DTlqB2UQvLU3THQX0oG5bV9A4fcP7qehI8Fd3XkjG7c2wDlrLlxG24PbCKfdOxbdq3twsy75QmQu2WiTLVUNIzEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779341; c=relaxed/simple;
	bh=xrLc2DcLeFljriH1MgHYeEhffmjfyA6lMcESSTyoFoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ms9itpHOKrTV4dDxbUE2TtxEYCdC6fQfLp8ROgXzTuxuKEPJl9Rpwk4JMFqFKeDcrtLJ4uyUvz5PK6DyIcAA6+5nfnKQ+UnGrXnVTNl+xH0nC8eWEmSfpnshfV8yXGrVS4hKvbPxB7UU1G7ScvipS60FVfWyEZbxtGV8E2Uipx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PO+V3Iqd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PO+V3Iqd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3863c36a731so3154287f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 06:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736779338; x=1737384138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDhkTdqRF0SvfO+r0GLaj80jxydwQS3YUDdrQAkqoSw=;
        b=PO+V3Iqd9ZJa7kVkni3V7+ev5SjFglIC0itWtD9vOzBRa+i2qCSTkckA0DBqv+P+Cn
         2qQ6oaowPz7avdKQ7thWh7G/7q8tVW0gQhhQgbYVUInKqYDTSdrMVVGb5FVYzhUnI3M1
         5NpNiq2belO/0xmQc8YLBgrvazhkN48WVa1r0qPlRtkUo9KiXxsNnZzhoYyrp1dLZ5JZ
         hxc7IK2nb7oIfSWrCaPaESEiLL3L3b2vZY8z3KT86D/05ZumaIwt9t5AayI4Xz1MyHp4
         /0njC29get3CIwP+0Qq2n1y1e9UHk8q2zpsSFxBAOuOidKvd5Itld7PJZzK2QMPk4hau
         /hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779338; x=1737384138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDhkTdqRF0SvfO+r0GLaj80jxydwQS3YUDdrQAkqoSw=;
        b=TZNeKebodpqVuTuYTh3Q2pD+VIWwEfZzlOr/VE4cOlnSoqc78cAOC3njHqAEtcqyQX
         0j4K8Smlg7SX3dcpX6If3FDel9KuMkm17KjdHsLwrvW34qWGJvyGoH0vIwhP72Y7JQ2p
         k3o6kfS5u3MiQ3l8DK2pivRyZBvRZen4GADhBEJ+C1Qz7jQGsxB3+uIxcY6RRDsjKeUo
         DS82IlaC/cxKXtw+F3wT+h4mBJS46La+P8Ge0kkgWmuuzktGWb1m6SDTSIXaf06TT8P7
         SYZMR3lDn+Frxh5mQUlMPdBnifmFDsSkBURcyM0Vm/FteqtBAqy/m+wd3vtxxXXGNFO1
         Ba4w==
X-Forwarded-Encrypted: i=1; AJvYcCXmS/5xn/3eI+e/20eCf221wsTC8FqKTJnB8mYDKtvPDFj4HAdVbstrc1250tOKRTQape59voYVqQNIxh+okw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1q4Hi63KBO5QY9822xwsaSSbX5WU8lEl9XGt3f7nDj/RRoOWu
	3eLrsK3MwEC6wHHfN09TXeSwl94WeGRuECgxv/OUlEd9M/cJwgAbEtfF5L1HVnDzCHjEyIh8/Uc
	xZMQtYcniM89flKfGn1K4O0mPNqiFvh/iGcpQ9d4fkTkOrezr8A==
X-Gm-Gg: ASbGncsiflzig2/Rn9Jq2T9SJGMtglpptUkNxs0QuUHDH+zDXFCvTEY/U2i4qIJWq6Y
	22DOiA1CGqSd7bh0IndrioyOfzbaSdRNpjxCCZSDt/pZbVaVJdwWHNWWFsEyLmHqJ3gp8
X-Google-Smtp-Source: AGHT+IGrgpOIXKCwGEvuOJIQtdud9hu4JONOcO6zKaw8mCowC3sZByCqNpk1SvRGv1Bb9S6uqQclDW00tLt0PFGTpqg=
X-Received: by 2002:a5d:6d01:0:b0:385:faaa:9d1d with SMTP id
 ffacd0b85a97d-38a8731508amr16868700f8f.35.1736779337833; Mon, 13 Jan 2025
 06:42:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
In-Reply-To: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 15:42:06 +0100
X-Gm-Features: AbW1kvZ6rN_EDNvmyBSmC2vCz9SyrJQndEGp4B78kVIw0aBhS0XDys5hvEljhRg
Message-ID: <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 4:20=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +impl<T: Handler> Registration<T> {
> +    /// Registers the IRQ handler with the system for the given IRQ numb=
er. The
> +    /// handler must be able to be called as soon as this function retur=
ns.
> +    pub fn register(
> +        irq: u32,
> +        flags: Flags,
> +        name: &'static CStr,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {
> +            irq,
> +            handler: Opaque::new(handler)
> +        })
> +        .pin_chain(move |slot| {
> +            // SAFETY:
> +            // - `handler` points to a valid function defined below.
> +            // - only valid flags can be constructed using the `flags` m=
odule.
> +            // - `devname` is a nul-terminated string with a 'static lif=
etime.
> +            // - `ptr` is a cookie used to identify the handler. The sam=
e cookie is
> +            // passed back when the system calls the handler.
> +            to_result(unsafe {
> +                bindings::request_irq(
> +                    irq,
> +                    Some(handle_irq_callback::<T>),
> +                    flags.0,
> +                    name.as_char_ptr(),
> +                    &*slot as *const _ as *mut core::ffi::c_void,
> +                )
> +            })?;
> +
> +            Ok(())
> +        })

I think this does not run the destructor of `handler` when
`request_irq` returns an error.

Alice
