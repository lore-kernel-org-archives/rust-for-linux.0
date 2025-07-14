Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1620AF67
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483320; cv=none; b=A7g+A1bGRrTcbt5e63cKk5JgNKg3TfmpMuYQJYr94g2ibQ4hYKMsu9+sqKKISEKftdP2zOgJBvDisrx++JqITpu9JeFOUT49rq2t/3Sq4oJoJ2w+C+NgcvlahBAgGcL3wr2MwGMQLd5G9ZJExZvNXgcCh2hjJDely2AML6uEF3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483320; c=relaxed/simple;
	bh=dZxAbZ8ulWv334/QiHn19XkVOBuijNqEiiRbXClfk4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buinQBLzGhL+6HalDE3ESPCCH9G/9G4F96cCTKpSP2qW5RVMtKdY7bSnYMOuF0F3wmEQVD7jZwuklrCfAWAuc7TchZEi0XenFmssVaO05SXug5Ft4N8v1Bd3Y7N8CVVAZt6x24dsANZanjmnLxLLHGQzwaAEGS1G5J8+G9QubXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u+pZGC1e; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u+pZGC1e"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-456108bf94bso7337885e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752483316; x=1753088116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj+niLV6OALorn2kYpyE8/uWxGl7XxWeivxdBGPq6ow=;
        b=u+pZGC1eH2rAt6aQASXzBXuGeE9/05Y1VaneWtGHeBeJCpWisjmsCZ5nq7inhhJeNS
         BbccsTVFfQ8sZuJFaCW4FS3LTKZJS7hPURFo95Sh48Vw+AojQxSR7OVjUGPE9iz2K7Nq
         ldBlWX6NT6lcdpPyuEomW398zcit1MwEsebcOW7ESEYT7PQPK4weaHBEGg3+w85HSDpC
         Zr3VhEVzUbtEzS5v2gZ6CJZCaK7HwsFNlpSNCVrmzhStYRaK6csVB8s4CjvbQhObfJ9U
         dO7lhDkRIMJJUjRL3cVUwrdj3ucQjD0XPKEYp4YeuERXpKODP48mVo+x+SlYKoxrWzKf
         Xu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752483316; x=1753088116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gj+niLV6OALorn2kYpyE8/uWxGl7XxWeivxdBGPq6ow=;
        b=kauSj0UuRZZiwTrYmm28reyXIaFI154TQvsEHBoe6d0jxFvp+I6sVrq2S+7ediKuQf
         7DV+IB8BM4RyHeRushAPTRoCmuV77wILP5ZNm7EOxlJESngtpJklBAPPMEmEvK3ydTKp
         ijNyPTO/mQuHs+vVwgVv9h9ZH28HH+9DGHnWrsQr/ee4ZSXcEDt1pXRNrtHJVN7M8M71
         soOAPlDqq2NMIwzGEP5nD21UTpl6elleVsNaChuyLfiK6EyegUlOcu2FqzasOqfl/to6
         Z61Mrjzygq7fEC0T+eY5OdT/lYxuu6Y2NlR1bDZoEWwHAim4043ITRGQZU7efuPrsG+9
         U1iA==
X-Forwarded-Encrypted: i=1; AJvYcCWWEVJoyHdU1biTLQ/vCjoyn534egQ9UNJdPYBcXUzEIaDfmdCZBTntpDiISUpChiBwFsNHsOv1/KMlbyQJwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKDCt8ChsgoaxE54mFtHJIO1fKW2PCqMMZ5iCrz8UO4HmCYL2
	V1FDvGZx5nYPuw7XQKYX6uphc5cToI5QeedPNmeYwoCiGQQ+/ahObEKLXW5QX4F5+r0FCeZXsuk
	y9H7UjimwJDbioYGxsoJMjwlgXalKkepQkZRHwouR
X-Gm-Gg: ASbGnctRMxsH3IZfJ/M9Ueg9Abu/2xGh+1M/tJ5NBMC+uFnCgScT5tFo1BxcQ+jJuHs
	YaDswFdMHf/1IAIPvRu7GrJz1VudvxEs9GNX0Idy1xEog+sgDolvWgvFhb2LRh7JwkzRivLXOZ8
	64Dk36DdImDEhG5nLrlATvfjTGhhVq6iiIJjOVNweU3bljtnNHpKa2x9KXufFkq9eIKmmHlHZuR
	rdTQhmAw7DtD0f3hlF0lTjLU47bZSpEFFbwBA==
X-Google-Smtp-Source: AGHT+IGsQeQEfcu02S30Jll96c0wDwxxBcoxIYEXCRnd0CfJMcytsTVZIf/b8uy6EvvrTgZ3nUg/bsWlB2lNPIlFVmI=
X-Received: by 2002:a05:600c:46d1:b0:456:e98:9d17 with SMTP id
 5b1f17b1804b1-4560e98a5ccmr52570005e9.5.1752483316042; Mon, 14 Jul 2025
 01:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712160103.1244945-1-ojeda@kernel.org> <20250712160103.1244945-3-ojeda@kernel.org>
In-Reply-To: <20250712160103.1244945-3-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Jul 2025 10:55:03 +0200
X-Gm-Features: Ac12FXymYzZFPEmEJ79-ojPY2RmA0JBZ1Q8D2S9b-wAnvsipbXwRr9MT_ii7c3E
Message-ID: <CAH5fLgiZsdW+98-_kMmGcdujQzusDcLMdGJzPk-6VG7pkC2bcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: use `#[used(compiler)]` to fix build and
 `modpost` with Rust >= 1.89.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2025 at 6:02=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.89.0 (expected 2025-08-07), the Rust compiler fails
> to build the `rusttest` target due to undefined references such as:
>
>     kernel...-cgu.0:(.text....+0x116): undefined reference to
>     `rust_helper_kunit_get_current_test'
>
> Moreover, tooling like `modpost` gets confused:
>
>     WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/nov=
a/nova.o
>     ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/nova-core/nov=
a_core.o
>
> The reason behind both issues is that the Rust compiler will now [1]
> treat `#[used]` as `#[used(linker)]` instead of `#[used(compiler)]`
> for our targets. This means that the retain section flag (`R`,
> `SHF_GNU_RETAIN`) will be used and that they will be marked as `unique`
> too, with different IDs. In turn, that means we end up with undefined
> references that did not get discarded in `rusttest` and that multiple
> `.modinfo` sections are generated, which confuse tooling like `modpost`
> because they only expect one.
>
> Thus start using `#[used(compiler)]` to keep the previous behavior
> and to be explicit about what we want. Sadly, it is an unstable feature
> (`used_with_arg`) [2] -- we will talk to upstream Rust about it. The good
> news is that it has been available for a long time (Rust >=3D 1.60) [3].
>
> The changes should also be fine for previous Rust versions, since they
> behave the same way as before [4].
>
> Alternatively, we could use `#[no_mangle]` or `#[export_name =3D ...]`
> since those still behave like `#[used(compiler)]`, but of course it is
> not really what we want to express, and it requires other changes to
> avoid symbol conflicts.
>
> Cc: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Cc: David Wood <david@davidtw.co>
> Cc: Wesley Wiser <wwiser@gmail.com>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/140872 [1]
> Link: https://github.com/rust-lang/rust/issues/93798 [2]
> Link: https://github.com/rust-lang/rust/pull/91504 [3]
> Link: https://godbolt.org/z/sxzWTMfzW [4]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
