Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F13ED3BA
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567973; cv=pass; b=d/+7y/wM8grSFclIzdRbur5CZ0/N4f10hz4zEpJb5z8VbP/Ket8dTkvSKTkt0Tz1nMrRlb2tMUlo8bVt7EpaumyEjrOz4nOzCd8xRGbmCQad6dxyk2nLcLx33lQKvIA5MNaxXQkgQlPVSKWXRwDGBRNels+jCImswtoJso3HHe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567973; c=relaxed/simple;
	bh=hgryzcWBh81J+fqav+2BlfgO1BmbWhuhmWVgVs11gQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ui3QUB8laRd2Wris7pgZlRKJsoJNWWfT1i7JGbyqpjFx1vEon7b7ssQMe8kCQUlsVHWgW05JARqj7CnDmJgtn/2P44lWyqA2/5oR78KPzJjmEilH3NDtZI+Qn7baWuGAj3R6IMDM+ccCCIwttBKJPh3E5VhNQhHOPNvvKvy0y0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmBc/UZ0; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmBc/UZ0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d03fcd26a6so3305295ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 03:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787567972; cv=none;
        d=google.com; s=arc-20260327;
        b=NYLwrfJeK+C28wS3VYhGKF/+MHmcJOcqiDBdPgJO74/tyJiNJCDe22B8LEzBysksDT
         QozNnJv4Iu6vfuBAtXy1QSIgY45GM9Dr1xC9/1FStVl4S7ae2O87w4xLpkAUryNGIjVH
         rzJhnn+NZ7EZ+ZbA6LQ80Ul99fZYepHPNgA/AQrwf+CCHuethXP+aP3wmXSq8r/3Ky4U
         kTsBIOAsYN7quP4iDNZU7rl1k3NJN4rAA5lVZriR3BVImKN//Lbep2TTNfNdpLEYkFoO
         jDpBN7lbpPhuM0d00g3pU28AR4+UY6OgMh9mwK7nDIEOxAUTR/rt4J9Ol+599Om6Wer7
         iNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dm+SxIlEY/yR4zyZCKc0UXwl4nlxVLA5fi42KRK5dYw=;
        fh=tR2NAGYhMqkAEhcTy/5iGDgLr/7dZtAnJIDRvbIWqUQ=;
        b=WIBL67GHt3aFya87mpWuyppI64tmLSf4DibjNrJT5dFyXhafd7bAnh+EnnOMV3psJc
         uasmOPhZ4l/ID5/XHsO/WWo6p8F7pcKyqJJtkdoarzQ7+SMBsphxwhSbjg5zGg59lM6B
         uPbA3CdKESHQ570gW3jeh065MptymlKcNbdjL7vclf3Ru7NZGPLm80svVohVcbrJiRt6
         mxaBdMQ95f9Pbgsxd2YdD9MzEFMsAmziXFukK7pjNv8tLl9PpKdHq/W5rMOK5l0u7kax
         iUorWz6zr71J/wD76soVOPQJQFcNCY/0AZVn7PJrfXtt3yAZTI4Z0XAmy8eGtHC/zzVv
         IZMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567972; x=1788172772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dm+SxIlEY/yR4zyZCKc0UXwl4nlxVLA5fi42KRK5dYw=;
        b=BmBc/UZ01fjCpGXrD5VaGU5g6PyvEsT+EoLVXxUJHydR8l0vT+LAtRR+8zhQgZtuw0
         I397lelTLyOYJpxfO3te6aVPtPY6wiZKPak4/zwmuDQLt1M3L7XW9sXtDhLrOm24GZkD
         hWxohSbC1GqPfocKIrpouJP21ss6AIsJUGMhAruWaqdnZK9oNWF9fvK4LjFR8+RtXaVc
         KIxlKgWDPs2aoCTYXEDIMFFXT99hFpPo8bwrRFNJ5wpfbewTh5iLIitzA0Dkz57FA2sY
         BX1auQ11LfyNa5WZsA646pIcZ8EV/EcZHy7ijYByeTADvrssIJtWZkKwp6F/d+HoG8Gr
         RQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567972; x=1788172772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm+SxIlEY/yR4zyZCKc0UXwl4nlxVLA5fi42KRK5dYw=;
        b=LcwR6Xc4u904ra+LXetjfN0XXb0DfcXLH71ezUv8e8Me7BcXoO/NzygTo/Vrh4XRPM
         lo0I3oYwnUCy6RLaJYre8hXbQCxdV8a2F8xC007YAVrt7f2MgpwnA6qcFlmYCAFCWQCT
         xKHlUKr8SY2oeiFyBvVrMPvTXC7LIvixh92iHS/Qxn3eTKuewsXtFpUQSPwsMeyIHRa7
         csb2QtkL5Boj5NO2rYGM5lyCPWkC9TacOl2ciGP/QwOlNhIVSTuelSsiczf0gC7s63C7
         5FPWh+U3d0YCK838JnMbsZPhvXwLskl6m2ksqsonJJImj2YLuX0lA0/BC5DDtwogrgmn
         5B/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp3etPhB4OgWUkhIQEBf2ygiBvMHq+bo+Hc//Ik+3Ge8malxIQ3rFQ9Jdy/+8LZxSzMc1IYLawenWwFhx0O4g==@vger.kernel.org
X-Gm-Message-State: AFuF++nEns+xykgBLVLU8uz2v+3fMcwH0q0kJz2NsbPus15DXhnTcC+F
	o/3/yPQ+3bqAU7GZToE7diyh1uZayOBwmMGvh6UZp07cETvUwauVAEtgiIvVGGdT7og0qH0RnTj
	4zdgtyOe1LKZhKO1VaMqAkH45QBg2/Ew=
X-Gm-Gg: AR+sD127nQ3Zds0bRt2gex7JyaYd+TGd+lkldywXEpfx8hVXbe/fspSrjMFIXR+vMgS
	7oXpTkK7PFO9K1KFQJ9TILj81D//2H6TomXn4wka9Kyes3XdjM1aNml6NwiuGXaW06Xtgiu8+gj
	Kz3N7L35ZGLTTPePWGYYojXUnVWwSW+qYoWOExApG7++YStxTJAMxEb/6AAupEqyfkVMb/t2vMl
	GUemnZRnvYJy3JUUz+RC6y+oAn/q2Xmj0Wf8GYa1Ad8jIEIOwCLhNWqe5DkVTG68XFarGEVsOhD
	uI/fKoYPG8FhhMbFs2MUwFUA9zMCtej9VPOgGDtua30ytOMkpTGwN88z1gOvxgAYmDxl3ovDzgK
	P7I+avFfWdaHMgnXlEho0F0H/+BcMDIcUH3G8bHK+ZYouvpk0LM7I47n8p96/
X-Received: by 2002:a17:902:e544:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d64a9ae35dmr206138235ad.0.1787567971710; Mon, 24 Aug 2026
 03:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816133233.197500-1-ojeda@kernel.org>
In-Reply-To: <20260816133233.197500-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:39:16 +0200
X-Gm-Features: AcwNN1XqG3kZZP3a32PBSrKWeajLatO9hp7-Kfpxa1ILeXqg5p650B05C8OP7O8
Message-ID: <CANiq72k2A4UCLakuKZ3V=N-FHONk26npA55J+gkFT197XAOMfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: preserve unreachable traps with inline helpers
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 3:33=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> When `CONFIG_RUST_INLINE_HELPERS` is enabled, it is possible to hit
> `objtool` warnings like:
>
>     vmlinux.o: warning: objtool: _R..._4cmdq12CommandToGsp4init()
>     falls through to next function _R..._4core5array4iter8IntoIterRShKj3_=
EEEBa_()
>
> `rustc` normally emits traps for unreachable paths. However, under
> `CONFIG_RUST_INLINE_HELPERS=3Dy`, `rustc` emits LLVM bitcode and Clang
> performs final code generation after the helper bitcode is linked,
> but Clang does not trap unreachable IR by default.
>
> In turn, this means `objtool` follows compiler-generated impossible Rust
> `enum` paths through alignment padding into the next function, resulting
> in fallthrough warnings.
>
> Thus pass the LLVM `trap-unreachable` option to the final Clang invocatio=
n
> and suppress traps immediately after `noreturn` calls, which `objtool`
> already recognizes as dead ends. The combination of both flags makes it
> match `rustc`'s behavior.
>
> Rust 1.85.0 (the minimum supported one) supports LLVM >=3D 18, and both
> flags are available in LLVM 18.
>
> Assisted-by: LLM
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: stable@vger.kernel.org
> Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers=
 into Rust")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
