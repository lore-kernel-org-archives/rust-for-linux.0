Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E711826ED46
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476120; cv=pass; b=u5p7TQ2mHdTRQdkNqqQ6KAiDDbNj1sQlQZNcd1JFqm7xdY7iCqVAQm87E7tSPovQPrkuhWCKpTc7lA9Y+fZp8TAlw6+hO0hbOq2Z8ylw+Y8IkcDIESUBIyJFOroAWwr+q6OxNblBVZfKeqoYHdl0zDj7Wl0Qaell0XW8Hnd/mt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476120; c=relaxed/simple;
	bh=Ereygt7HTSWSKl4D6olBnicFxYCLCCJHqv87atzDMEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMVVkjrx/gGu9dWVJfH1DPJapUqthyDHioFV/XsmPwnTPuZ/BMS0xskAWB9KL4Mkrv5a9MHElbAohbkDCez4PTbdhLaD6LNahG0QSpVZ6fUbNqX8eG7UlK1r4S7OK6O9VOzVzHQTot1rIc9j6glZbXatvvIOsEnaX7cdIuolzmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuKczD1U; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuKczD1U"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39b1c184ec7so38058a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 15:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476118; cv=none;
        d=google.com; s=arc-20260327;
        b=AnuKpsujINtVmADOLXnr0801xI/aSmBh8PB7MSj4jXsfIDvDEciQyYWQn3xDZgd1Zi
         t6HfLwJIZMqtkMyqK8zOwUpXtZmvIfpgTIocF0qcSdpIVd0t+2+AbtAyvLtGziI8I+zW
         dbL3A+KuKdjFA+be4nhZqKuijZ5IDvkMN3VMdPP1jqBZbs1cvW7e/Vx2HvLkEbyPnJdH
         8nPS4UI816SdZyc2l0Wd0sRi3P5T3AJGtIPdpVXD3BOKeJu2e9rcm1XKLsOWpRrtjtDB
         rH/StjwbwQvHjremF4vwQgaegjL+LXU9kQJQofaaJ1cQF2MSqq09Qw9GqACgprKUYG9S
         NWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x5JVoFY9ZeQExqc2q9FWswR6O99QHIYdIyNGXwd0Ync=;
        fh=WGgKbgUu9TE8Q2B6P5tacjL16IdNqVyLDmpXar3WZS4=;
        b=Rg9I6w8qaDG3CAsxRq78Sw1t0L5qIsDB8tTYsmoRC8UfFbybK9LHFFJf4NslrOjvvj
         p0v517uxuHytsfgUwkC7FWS7/hYwzouU3+KeFomtcsxYlGMpKJUJ6P2Ns/5eL549tDId
         P59hwrc8vWnss2r/fLCBbhG1eKGqst+hSG0JJliHtrMaFw+9k7gyHuiDaLyNFRHjy9n3
         UBAjcS9uiYfxVjTMH8bNQL5qX2SuNp4flQgb0tGi9IjENqAzTxDgAdYy9/0uuvRf8iDR
         13/oWeD2/MPQ6D8eR1HG8X7t+orRdSsbIaD3Ozm+g51lOJ4aypU45HP4HAFIQUfMReIs
         vb+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476118; x=1789080918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x5JVoFY9ZeQExqc2q9FWswR6O99QHIYdIyNGXwd0Ync=;
        b=KuKczD1UYwP4AeJUUdhbkWWD2QJcnv6Q8Ec2TMLW0XCTiavXZBQ6RJI3LuNE8gy5qj
         Fc17NLD/bUv5lg6FN9lBlEDR31WdQiGTXgGIvkZuMgmk4lnrKcSU7tLkdqAVf6bXiD7h
         w/GXTvuBRJaAnBrR3dtacuP0XgtPr+5rHVDAL7pPs12nWkcnUFbHuRlooRcFVCK/li8Z
         dQAlWNNiORcsRVH7yWdqrfhkT3DWiF5633+hQ45Gabxrg1VcvDSTqc3HXpzRxmEWOBOV
         osJeqRW+z0YaOGk4WA7I5Rl6RUk3CD5AODZPrJsY3CCRbbig09xk6ecFsoypwTI66QgR
         0RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476118; x=1789080918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5JVoFY9ZeQExqc2q9FWswR6O99QHIYdIyNGXwd0Ync=;
        b=K8tpthNRD1e5mefj98ysMnh/U1uY26kWHNbB+HxgAmJ951lNQJbpexFJKUmQIXjwLa
         3VKkePHUTv/DD7Uk5kw7kdR2xXBPQ25GwxVwZI4lmUaiHy+z18rXeytUvUF+RxxnnI0g
         A5RlUkWGcwOm/4KCY8IIL0pHP3DAAulber4K5OzbLs+pJClP1uWOSr6WjsLkxD0stRmN
         G9Vok/Dhk1GFIzO0C4fD8EMlJ5NCeds0D4L1qWhgFu6f4NWG8Blu9z3QMz7W0ABoAagM
         cQeA/jPvYqoL0NKf27pagnDsUl07hUkNT7v8nll+raXdiAZNsSFvBBmhsr/H2Q5eysfk
         BzxA==
X-Forwarded-Encrypted: i=1; AKwUvBwvDXHZyULH1Sjmzx/9KSSaI90Uq0LKDmMOLhUss67rNi6AWKsxzKFxfgPCQWxSrtAtzmKo1fUkcvbaOesU7w==@vger.kernel.org
X-Gm-Message-State: AFuF++kv580ctOY1wK3Sm2UHKSZcUMVDhb3v07xju371ximAmQjUQnic
	zXg/lSHp3hrULVBC2Vgm9q+QL4D5z0P7WduD7wMn2HCV44BHHtwH4GDN8AERKnfZ/UM13fhlu0R
	2hE5VnAOnceT3h0D+Pl5uYzVPpi3o1OI=
X-Gm-Gg: AYBFou0cAE4ueCKA+AzqloA0aMkaUoxXNXjmTTlL9BJUB5tIHv+EJU9zRYkLcBXejuH
	JsRofiIiY42JvEqkx/UOdOwCVlpbSgSk4hccTb0EoseZSdAkiG+Tit28+xF4d11DYHgdhFN2S6e
	qhDat4Do6LU5Ut+Ca1hL4+ToQ7CNwIubOSOvQBLvjzE4+QY2nJjPGMDu9SsJcjJ6/JR/WE/fsqC
	bBqpwhusuwHNGBRHpleBtiCrgBVDmuF9ARJV5StY+5IPHPU2jl2OVGckwQ359OsR+BLwLBfVsxZ
	docbfyaeN/RnqXyFVWTjqVFuL9WAu5xeoDx4xVxDlgJLPk/kW7Q4AUHthVa8Lu3Ra7Pk36js3yg
	YgbVQyddwab9bO8ljaf+3xLTXVSot6FwcieqPJiYwmuQiuWk7GjJYdbMWWVlj
X-Received: by 2002:a17:90b:4b86:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-39b26252efemr1538724a91.4.1788476118088; Thu, 03 Sep 2026
 15:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826145642.43807-1-ojeda@kernel.org>
In-Reply-To: <20260826145642.43807-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 00:55:05 +0200
X-Gm-Features: AcwNN1VrwzX6ASP8KVz13RNpM47mRY3LWDyEJ1EhMzZ8gy8Jz0UYzA8WhpqQQjw
Message-ID: <CANiq72kFZ47SE8PmNe483T=+F_OYzFiP9=SEn_S4jCM=S-cSsg@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: clean new `clippy::needless_range_loop` lint
 for Rust 1.100.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:56=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.100.0 (expected 2026-11-12), Clippy warns:
>
>     warning: the loop variable `i` is only used to index `self.decimals`
>        --> drivers/gpu/drm/drm_panic_qr.rs:410:18
>         |
>     410 |         for i in 0..len {
>         |                  ^^^^^^
>         |
>     note: for this index operation
>        --> drivers/gpu/drm/drm_panic_qr.rs:411:13
>         |
>     411 |             self.decimals[i] =3D (chunk % 10) as u8;
>         |             ^^^^^^^^^^^^^^^^
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/main/index.html#needless_range_loop
>         =3D note: `-W clippy::needless-range-loop` implied by `-W clippy:=
:all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::needl=
ess_range_loop)]`
>     help: consider using an iterator
>         |
>     410 -         for i in 0..len {
>     410 +         for <item> in self.decimals.iter_mut().take(len) {
>         |
>
> The lint did not trigger here before because it could not handle arrays
> behind a field access such as `self.decimals` -- Clippy was improved to
> catch those cases [1][2].
>
> Thus clean the warning by iterating over a slice rather than using
> `take()` so that an out-of-range `len` still triggers the same bounds
> check as the indexed loop.
>
> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.
> Link: https://github.com/rust-lang/rust-clippy/issues/16631 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/16634 [2]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
