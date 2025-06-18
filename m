Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672E3085A6
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278158; cv=none; b=D6GdPTmRCaqcPA8v9EdtWDzVs5dN2jQCH2Rb/6unJKvIUL/0zictW6mj3i+UrZmjv3W6R5zK7SPeqDbDaYxi/6mV4SsYF28ss+2vlwbC4LQ/zO97M0J3muo+PzH/SyoIl066t8KyG9QhfB8sw7Fts3jr1CusO5XNCnYSo1qGubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278158; c=relaxed/simple;
	bh=wfVliNvMFww4ALoq9h28dDUu/++ZlpOwHD/5kA5/dSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZ2N5ciFWtl9nlKk1qZj9XekdPQcFXv8LVSXRf64jd0NRnwq73GqDQdJYQ+m2nXOp94/iSVFsIJxtpl69Y2JDRfSr50Eb1vJTjMJN6p34ff1eQR1fLbPOce6I38G53NdJQUfL8FZagL7r2cNSpLBG6oMdUUncjcNnA3YqDGmXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OCh4StqK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OCh4StqK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so74011f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750278155; x=1750882955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpNCGTbJaA4N6AQDacC+X23mlTsnB+mbIqH/SioL/Y8=;
        b=OCh4StqK/Qyk87Od5o0KFR3Nr95QXzP7ndjoVvGfGG2m/guuZQSYhCoKX8F4jimTEt
         jUCPlO50wJPByGLkh4FRXV6hlhCwkHSUUavBP31iz27S+Euv/BxzS8q3bADBJ6Hozq4K
         hTpGJeGdt189+olGO5O3eLS3Q2oNqs2vLgdSqSzjJpjkMoLZZU9KrtvtORk7OdNlYY+B
         6X/tuxOkblKLc7z4n8T4PMD6AICWZY3Y6Kip5KNgoGfRnNml6OpRRvksiTKszXIYcrMX
         FMWc9FqSZaD0zBknXhFKVkmuKDf26SA33YQqjcdAOnY4fhuUU0WDbi/YlGu6EyNRMFcv
         ssrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278155; x=1750882955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpNCGTbJaA4N6AQDacC+X23mlTsnB+mbIqH/SioL/Y8=;
        b=O8TeaF0STM46dIJJdQCIbxKQShoTEzaRnq77fuWVn2HID4dS/F4PgjK3pK50Wsd3jn
         hPfYt7iN7gRP6mU4KU+2rRQ8ld0Z8Z9gCbUM7eZ5YbxaLhWXUZzzeh+V2YhnRYwWixw0
         I7zAv6c4y4IhPPvpSIK32V3ZrLcWy6vfafoK1xnvXHFMvcn1upGmaKTZyZjUN+GTZvrb
         tV8Iio7fc66WMML8Ce5iBECCNPLRQn1l1cpEHnIWri2UC6zkTHNIYCY89ZQoiA6Y1uyb
         SocXHA+GkjlfLqnmcQIJ1eAbVhwWdK1bxpoHE04NpSmyV06nW8BmT/83nYsE0rEHgo1o
         FBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKj8AuNy4wEhsNZwjr11LF6biU7NkCSqKLzASMNW+axMY4UJ+JAGGAHwvfIiQ2nbQgyihsf9I4hIuCZNfgbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/6Yp1n8vIhuzWHyQJy1Ehu1Hh1iEvcHHSCconOa12/ryQho5
	wkj0TRZ4nzrAxSvGvggvhPbqdpfbNXxxiG4QjKSceqG73O4vNF/zwxNpjxqQ7UOoEd4MPOqTWgA
	ELZ3qhH1uZyuRun8jSOLjtD/jJ8b8xhTC+YEAgkp0
X-Gm-Gg: ASbGncs6fk/roilGYvHvsur02eESYNTJbvIZMM6SVfCbH/bODh6erovahi59hWcDxrW
	UOO010wi0wxX82v3CkbGXwN6Asp/ZDFDiqYi/KK7Jg8T3dNO/Y4yb7zcQOXQp/gP1oUJQZyelz3
	WhzefbGF0fjj1wl0lrNlcN+vCw8MEYe29y5Ovy+SQ2f3de
X-Google-Smtp-Source: AGHT+IGEoyOBlFKES6zAZ/D/8d3NjWy3PFbM8XH1FjI+hWn88pAjWrG3DkriENwDPgzuguMIRV9uDCxNXc9Cb2JGPm8=
X-Received: by 2002:a05:6000:4408:b0:3a5:8934:4940 with SMTP id
 ffacd0b85a97d-3a589344d14mr4512138f8f.50.1750278155203; Wed, 18 Jun 2025
 13:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618164934.19817-1-boqun.feng@gmail.com>
In-Reply-To: <20250618164934.19817-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 22:22:21 +0200
X-Gm-Features: Ac12FXxUZt-wdvp6IAMzVaJLyh1S-ip7vrrFm_I0iVPAZRuZ3XE-nvLs77lmkZE
Message-ID: <CAH5fLgi1FbCc0euts_e4BmAayE2MtK+AUWiOfswd-qo5+L+VnQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] LKMM generic atomics in Rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:49=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi,
>
> v5 for LKMM atomics in Rust, you can find the previous versions:
>
> v4: https://lore.kernel.org/rust-for-linux/20250609224615.27061-1-boqun.f=
eng@gmail.com/
> v3: https://lore.kernel.org/rust-for-linux/20250421164221.1121805-1-boqun=
.feng@gmail.com/
> v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun=
.feng@gmail.com/
> v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun=
.feng@gmail.com/
> wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun=
.feng@gmail.com/
>
> The reason of providing our own LKMM atomics is because memory model
> wise Rust native memory model is not guaranteed to work with LKMM and
> having only one memory model throughout the kernel is always better for
> reasoning.
>
> Changes since v4:
>
> * Rename the ordering enum type and corresponding constant in trait All
>   as per feedback from Benno.
>
> * Add more tests for Atomic<{i,u}size> and Atomic<*mut T>.
>
> * Rebase on v6.16-rc2
>
>
> Still please advise how we want to route the patches and for future
> ones:
>
> * Option #1: via tip, I can send a pull request to Ingo at -rc4 or -rc5.
> * Option #2: via rust, I can send a pull request to Miguel at -rc4 or -rc=
5.
> * Option #3: via my own tree or atomic group in kernel.org, I can send
>              a pull request to Linus at 6.17 merge window.
>
> My default option is #1, but feel free to make any suggestion.
>
> Regards,
> Boqun

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
