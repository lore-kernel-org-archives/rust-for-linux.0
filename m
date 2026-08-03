Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16208352C54
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739708; cv=pass; b=IqIhOX+FwyCmh9PcSbePmlL7OkMYURSDu9IRxRFGQ04IEiYsx2oaSm8YdTboWtwLRW4AZkDlP7fFc9senNNzWBu9xfeCzwsdL8zTLzpV0fpeG+e1WeF8J1fpoM5wTZWVbm5G6kazbP9IdX5jwjNms+ISQvKviEpqOGU4ioncmUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739708; c=relaxed/simple;
	bh=ggw+muFFAaFfC2b4AAgdDK63S2vV+ASj+i8ZzmEkKRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s67U0slwnQyqQQdSK+9uOaElCLtK7ah7wvJMnJse8HmdzYU8wEF/8/J01TcDzwp5rEqoj+eIfCAKfFC2HYAcJIZarfVh5lt644PBUBvrdoyDOCh8QDXIcQZbpuR5gb20dmCSL6oYJQK1l3Zo/mMuXuCXcE2/aRxX5h4vMDN3vKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTc+ANJY; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTc+ANJY"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384c94c9423so331244a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 23:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785739706; cv=none;
        d=google.com; s=arc-20260327;
        b=HA0ECkFVP00jFdLDiiae77Z77QC2RgwP8x04XmiN3JjcUH/3WTwOSWCg/R+irQV86d
         DDbPSbYXDbse0FmLfoas+FtHKedh7xmSLYhS/yWZzA/Mhq/yXjOzRyj6QcmB3ExTjIcp
         fbvbZKqHmfEUdNnT3BERjxTHRzLf0SNfb7jac4/Cr+lhqdq3B/jD4vjNvF/c8KK1z9PW
         0JPICJlSF0VCSDPpeWUbkuyOuTPs0nZfVRPqv22PyPVU+ucQYXPsSAkpUPuB1+5BgYDZ
         Ww2n+WeP5Y3dTtP+hZtL/Q47bcqx2pdjKOEOPms5mO0NXCM+TR/BTxWvJiuhfBLqDDKI
         B1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcuQshpEc3oEbrwYaDSyL2PkFa3C8K+8uk8C2LXbIHE=;
        fh=vJ9YopKRV/8n1cO4gZmsGmCXRGYzHAgmSCYr7t1twII=;
        b=prxaEO1XuDm2smhEmhOw/DsrrUu4QJW6/uWaN1HtQOQG4AS6CpaQmCgw7zVWWwLvE9
         cSqUpFBbZjBM/TI+v2Hp+HsgJooUdHKHUfAtSlDUdbDaHWTiev3TWp1BUfFQ4JtnJUoO
         fF2egf9uGdVqAko9OB0GbY/fTuyt+7v9aHzGsMK3/XXp7ECptmRRdhv5H24XSzXutokq
         C9TTz5TsiPiJCMm38gePQMHRMcIiyJ7Mk19jPjrbfC1A2UwTNFojz8CKPem1eJC436vt
         GIbuvpu+S0Iu4E3+S5j8V2JMh0YaYSUJVHXNWM2DDbkOJI4o9P0xufR4qWH3p/BpRRm5
         WRsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785739706; x=1786344506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcuQshpEc3oEbrwYaDSyL2PkFa3C8K+8uk8C2LXbIHE=;
        b=iTc+ANJY0T37GaKSYt5vwmRVrEs0rBBhRr4a8v+VN18cZvEzav/HOtStmDGs4Fh41/
         +VEwtAcHJAsvRqQk07nqKsIxoo3QE2OnvPFKJ0LeVHMY2Is3cG3FV+u9xH7lqm5QWzAe
         IAUp03MS0MLO+cH9IjTrhrn88X6nkR9dhsO51PFnE84YnXgZBhHADESKdg02erDTFs1Z
         8AXnD7dNa72zIyCmod8zEx2uSb6gF8losEM3Rr5FgR1yKyxmCXX1e8M+jdNtVeGBZ2SX
         tcGJZNEfrr6kRtNT1i6+bL6gJHwFq92hOcy2D6Q1yN/we+tf4Mf3T5rr8MuuYtSAmtg9
         JPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785739706; x=1786344506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcuQshpEc3oEbrwYaDSyL2PkFa3C8K+8uk8C2LXbIHE=;
        b=pNEyQdi9iWZarb11Q9e8o5t9o1WjtjVLKA9lsGtAENWHyStvSSXgB8ae/GuZPlON4F
         Duku4hAJnVC02atQKVxf0F9KR0blVvhtak6odPYRS/V0OxyKC3yQWHPWSqVeK5fLlKje
         +yzD1vX7YMfvNe77gi1uRgx2oDYFUVkdIKlZPMwuk/3L2mZzU7yplWZ3xJwmGy4Y9oe5
         xmwZVWD3bSOOCXdZxv+1KEqtiQs2URNoKjockQqnPL+BXUBks43dKHWSehlIMD0Ygkbx
         WkCaYbOpbEjQR9/lx8YQWi77q7z5UFBMHydJrqDxidheG/wOVCNsShvzaR4yrvRIINuN
         xe6g==
X-Forwarded-Encrypted: i=1; AHgh+RrIpIu8oSpwXCgwe02vbSf9yGUHaDmnPkU3BHX8HRONfLcvCKyt9hya1NFzmARtoX8nmAYFiRqQExwBoBIMyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IyiKCmVHj6fxgSUFcVo/D1DxxKotYV6qaRH80dZA+GAHCMRk
	3TQqga8sLAUf76F7Q8b3MRtM42M+rjnx6sc8IxqysT9NBmw7D5ayeOOdx7GLfUPl7eVQcQNPjyt
	1/rDOuUYQj8vJEXiBpg2T+LsSBIyf/mI=
X-Gm-Gg: AR+sD13pP9GJM23wMCfFgmA34QqwajJiBY2/SGmYbqxgJZd3/j5Vx2iFd+4lj1hnBuW
	wj3pSY6Sk8MbVjdtQA0AYZiJG71CCwhKFGuCypcyWJCJDL8FEPLqOip9nKhOs7kXmrxBiJJ7sGH
	iModR44wyRBz0z5ocl6t6Xm9QDSh2P2G5FNkN7BajeVIjlADvikoAEolqKcGAopbJ2ZqTh527da
	uDAuxDOGI1F998VAijpW59y+lRjR3PA6o/QXYXVKeO3EGyTW+bPtriThn05U+RxtdXQ7Oy2Vn5u
	X5aKBMrnlRY05xEV2FWU3Atc1ux/PCxmY/tRa7+V3Lm795mO8TTnwy2M64/KtYNftjhm3PyuDM/
	UwnWTG4qaH5HcRizrDZ0HR4Rq2RI8lR+uAbATOH1FGb+mn+2EqmslgxP3RnD1
X-Received: by 2002:a17:902:f78b:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d05206277emr118828115ad.0.1785739706173; Sun, 02 Aug 2026
 23:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729173803.13459-1-ojeda@kernel.org>
In-Reply-To: <20260729173803.13459-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:48:13 +0200
X-Gm-Features: AUfX_mwuzwdP6nxeRWpgmu6tvIOqTJdDLP6cx79YtVLMLU9QsM8nZQfv9wD7MiU
Message-ID: <CANiq72mH9EkHr-0XNqbX1NpQLu+UTO00tieYrG_oXiNTuqaihA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: disambiguate `zerocopy` for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Antoni Boucher <bouanto@zoho.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> From: Antoni Boucher <bouanto@zoho.com>
>
> Starting with Rust 1.76.0, `zerocopy` was added as an (indirect)
> compiler dependency [1]. In turn, this meant that the `rustc-dev`
> component started including a precompiled `zerocopy` crate in the sysroot=
.
>
> This makes `rusttest` fail because the compiler finds several candidates:
>
>     error[E0464]: multiple candidates for `rmeta` dependency `zerocopy` f=
ound
>       --> rust/kernel/prelude.rs:64:9
>        |
>     64 | pub use zerocopy::{
>        |         ^^^^^^^^
>        |
>        =3D note: candidate #1: .../lib/rustlib/x86_64-unknown-linux-gnu/l=
ib/libzerocopy-dfef4cb07ca752aa.rmeta
>        =3D note: candidate #2: ./rust/test/libzerocopy.rlib
>
> We cannot use `--sysroot=3D/dev/null` for these, thus point to the depend=
ency
> explicitly.
>
> Assisted-by: LLM
> Not-yet-Signed-off-by: Antoni Boucher <bouanto@zoho.com>
> Link: https://github.com/rust-lang/rust/pull/118546 [1]
> Cc: stable@vger.kernel.org
> Fixes: 567621523ab7 ("rust: zerocopy: enable support in kbuild")
> [ Investigated when it started happening, reworded to add that and to
>   follow our usual style and sent on behalf of Antoni, who found this
>   during his work to support Rust for Linux with the GCC backend, i.e.
>   with `rustc_codegen_gcc`. - Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks!

I changed the Assisted-by tag with the details that Antoni gave me.

Cheers,
Miguel
