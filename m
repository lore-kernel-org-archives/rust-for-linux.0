Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283EF189901
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355830; cv=none; b=OGLVQ2KGxARCx89d9nEUiA6uodJhnBNAhO76PGGNRxMCoSbFXKU+/w9AE3YAE0xn9Em8OQmRrIASRmpPnMdLZ1Qdf+BPhGhjvmpBcBb3nfLNXP+pleVDDEu5ahCzV4NyvyC3Ot/QJufX+VfqAvbctu0Gn2IujUBIejFKlkipqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355830; c=relaxed/simple;
	bh=Ak8V5NETEJDFPLb2EfWWIzWIzxUZtpnw62h7OAmMKdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WuIvT7lyQsvfy6DtqzLNF7if+IsQ/wBhxRvm4B/Q0mA3C3KRB1Q/J6hfIrBYIo3g+b4U/wv3JfC3ptTMZPn+t9ACpXnBG2m+yFWDua91GwVpBvBhkD068pCOgSZ+WXK+SbNTj4ZjPni54pDIYRaRXw7OTyKAuRh6sxwnZYl31Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQmPjXI8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQmPjXI8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3684407b2deso2277267f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722355827; x=1722960627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak8V5NETEJDFPLb2EfWWIzWIzxUZtpnw62h7OAmMKdw=;
        b=IQmPjXI8Hvgt0URBH8U9mKRzkUiKunOe3dU5Pi3WzLiiE419L/qKt37tdo1NteM8WY
         i4bPJOJIISMXcYQjSGW9W17E8oCfx+p+6gHnNJPFfp0uv3qnKkMpIYpMIG0mtrkLJTtG
         Rr//na04zduLeqlg0faK9QvXRiJiwl5Q7RVWfHUPDR7D/JZD3E1Eb8xGHM6R3KXtgCSt
         aTBvpm5I6e/LF/Z3MZSsDmSEnNKcHU/EiIG79K1ZgFE0BqySELOgBj8G3vFJYFqv4wWu
         qMZ/OrnBwFSLlHFkZoc5fwTXf6IOUg0LDuNUarppKBejg1Rd52IAHGKVtUw/1mcjmPmr
         OIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355827; x=1722960627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak8V5NETEJDFPLb2EfWWIzWIzxUZtpnw62h7OAmMKdw=;
        b=mkwUM3+gOlabsh2U2hMarbao2qHdLkeayO5VaRgNZyK5tJDa58kUEiXGCrv7vbnkoG
         3Rm/U9qtZ9zNtmLNRgJsUUd6OtcLiAC1Pd/u5GFboR+jyRb8ZK/I2gtb75Jqyz+qV+yG
         MyI74ITBLxR+B57vqxUp+v+aWTK3rG6wm4XFQeYs4m42BLF1tmTm4/gxzXIta131KDLc
         FqCocmdqASqgQeUEvVLnjM+1vf3JeYnOE6dihAL2XURU4DGCE2PgJtqwDrsL+UxeHkJU
         Grq+njwcuj9SCtP5OJMlPWKsVoYGtq/nM9hyTW6LINuzfSkdU2cDQuaVP6yHLkMUpVSO
         OAjg==
X-Forwarded-Encrypted: i=1; AJvYcCX55XFNj2M4gvebzSsbZ6bppQxY7EcGjjV6iTGJUIeaJsT9G2VQ1Ct/mBelzva30GZo2M6E1Hf2PvZgSD7NqU+bDmUlAGltCXAeYLdIRpg=
X-Gm-Message-State: AOJu0YzLAd1sh9cZXuBwCJjM9rNtD+/cjvHhW85b2oyi8PvWGb9zsfRF
	Bd2mwq8auhskRwf59tOyMymDCgcb/iNDpQptZISy8JBbBkZmETGzRFhz7XfWJHw0LH7/KQfKlsl
	oB5q3CHu0JEjb9iIFBzP1cN8Ga8WsLnBHJTr6
X-Google-Smtp-Source: AGHT+IFSuL65/+UIIzL/9A9MC7dctLdJc4qricmLEy97g+n9SSWPlsMSMD3F5xNd3ZzjGTkbH3lelgRESn6wtTGzr/g=
X-Received: by 2002:a05:6000:a85:b0:360:7887:31ae with SMTP id
 ffacd0b85a97d-36b5d093771mr7324808f8f.54.1722355827214; Tue, 30 Jul 2024
 09:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <20240730102856.GJ33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240730102856.GJ33588@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 18:10:14 +0200
Message-ID: <CAH5fLgi9W7F3+_hL+vcmKy6yxLo2U+GjrCjAFa7wN9p20NG+yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 12:29=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Tue, Jul 30, 2024 at 09:40:11AM +0000, Alice Ryhl wrote:
> > Introduce a Kconfig option for enabling the experimental option to
> > normalize integer types. This ensures that integer types of the same
> > size and signedness are considered compatible by the Control Flow
> > Integrity sanitizer.
> >
> > This option exists for compatibility with Rust, as C and Rust do not
> > have the same set of integer types. There are cases where C has two
> > different integer types of the same size and alignment, but Rust only
> > has one integer type of that size and alignment. When Rust calls into
> > C functions using such types in their signature, this results in CFI
> > failures.
> >
> > This patch introduces a dedicated option for this because it is
> > undesirable to have CONFIG_RUST affect CC_FLAGS in this way.
>
> To be clear, any code compiled with this is incompatible with code
> compiled without this, as the function signatures will differ, right?

That's correct.

> Specifically, it will map things like 'unsigned long long' and 'unsigned
> long' -- which are both u64 on LP64 targets to the same 'type', right?

That's correct.

> I suppose it has been decided the security impact of this change is
> minimal?

Yeah, see Sami's response.

> All in all, there is very little actual information provided here.

I'll make sure to include this info in the commit message of v2.

Alice
