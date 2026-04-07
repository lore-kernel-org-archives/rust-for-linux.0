Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8155413959D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551063; cv=pass; b=YgwrmQsJVOlsmcJVPuMC1RUmS3BxcTgLJoFrF8JswFJ+UvtRpOgXQy/CnxNqE7CT7rxm8F12iLcnnEhigEXz02h17Su9oO1k3af6QAI7bIO6o7NSoogl3I1pxaMO1KDHtEvDf7D4CZlA8z0W13DssJP/xkdeDjBdS1x7oc8PTKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551063; c=relaxed/simple;
	bh=DfoJvrhbR9/q+l6t1NPKmCnTz4p/S80iMM1QrEsDKz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJtVlKTJnfHFhY8oCtHtDb+sNOhtwNqod9J8FCk/zuebDCuV2s3HBW2Yc1EKqBI6OrHKmAjVo7o4CnEfw5teSvMfd7L4KK+B7cdCk+OXxXGhb8SHvH9jBvGwAACz21ShOSSfjciJoD7UZSR1iUm+CnHlE27Kcz/NLo8jV2n8Vjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3z1KvP+; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3z1KvP+"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b8095668ebso410383eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551062; cv=none;
        d=google.com; s=arc-20240605;
        b=BV1loGdllUyIZnVPbC7oH5AecwSbSeIccQVxxMxncRoNQgKKE+eYIMiy6s/+c0oRhk
         LuSFMRaXe8Wwkdt3jiTJThtHsh4MCEwJUPsu4SNW0APFuCrIHQiOg8/slkDkCNcyt2JQ
         TachtAYdGortWCfuDwPq3V61DcHad/iUoMQocn39ExRe/hrfs+1x+vAXb6SIRfHiEyq0
         iQ1dv39ayM07r4iTq9PAVuY63rvRf5fEy7ifSAHKNu1o90dPsCNMs+wNH2JEwXpWNhAE
         WNkppQk1Q6PpqbD7kSWDOGmSD9o6VKM1Fxm9qTkiCGNwiXmGewOoMb+IRnBN4HK6Lg4i
         Go0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        fh=jsnVLLlShWM08O1GcqNcQgDdgDAUHQVt/FLwx4xVrnA=;
        b=TE5OgjkUc5lIn8GydGseP2XV3vf+Z9TBrPNiub9C4P4oP8RiBCzaowi1Q0WO0IbHET
         6mAhpyXuWCgUm7vpm7N7Vh9UIfwl2yw6ZJ/rT7NdwliutkpZu+qqZ4SmNKd85dyhQyGL
         Yq3jTrgtbgdOwpEKxd+e6DAwRoS+gd0epWZHwJbRgvrY9dOrW/GW60cHIV74VzZrJ6C8
         xh+TQ19rpqrAiPTXRxHZgxUIOV7cGUfURfFRQvZMYlMR0mQuOj/qBsmuizxmKbZsxJM1
         /Tba/63DID5K0K6fYC2ZySb5MO1PdG06Bm6/PwntzG4p+L6ra+MvYsudNXCzFPwv9T2q
         pMlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775551062; x=1776155862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=J3z1KvP+plrGKYzfUZxtf/Bl93B77UKY7gFXsyg9lnqxQ4lQpfxmrO/IB5Px3zGq8Y
         T+ZNMjJOGcwSbne9t7HmvyK+WzEILe6jT47dIgUyQroNzuY5E93stOPdry4ZVUtk9/Mj
         uCAnMJBY2kCC1pDtB944IjpdTYL7Dw14pNtV8Ld2+V/Kw1cfslaHZ9lkRz3LBrdwG4do
         w4WtY8nQOW774nVjEpKk1UANFMtl8yH6x4HXidfLM6t7tWbCmmWloXHVosYKF+11CYP2
         iQCEiotKrSjXa8syLxVf4uq01IEtVMo+J6nrYj1OKJg0gqWqB7QijeFrErZcJdAywsPK
         k/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551062; x=1776155862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=ikH/WmAKOm/lfjq/ZHqNk8LMS5YeaGahoG6Qomt8u29zaHvenrIjzbw/5HRSlJ+wy2
         2BCnIganqe4HunlCTguAawSnsvsca9cFuPQR1pqt0HlJeYbrj0rkbWSH+CwJbE47Q24j
         vhbBeG48rWw8SmNdTwh+cDY1h1ZPc1lXsv/0Wamf869HFleIigU2HnsaTp8d50a7edrG
         /Q0idQabz/rs+EifuACjsOmdwnOoggm/UOsDwNUJr90bC5Pn8FWGTSsg8iYC+D9IP8su
         CDsMJlZ4VNhibbHYySEVNZMnTgEf4Kunke0d2aEsab+x6hKb5FBGps1xLaiKSXNYy+3I
         lkKg==
X-Forwarded-Encrypted: i=1; AJvYcCWalPPyZHVCR7MbymI1jQU7XBUFQYm6baoTwRYCNAAc33X743VVZzWJbk385aO0M27Aj4Kc9htUWB0HE0065A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Eq0BjajnebphEbBuyYmM9ksZa1r5qOLSXMK7+8/8Yb4ZKijM
	26GvNDBFse3Bvy4AFBmbwc5CJgQ9FUJbP4i8oM5mWYTgKM4p6Z3nrlCejcqDZQFvH/PWFFrzobZ
	fYF2qHWaA0t426ZmJomgK34APKjWQqvQ=
X-Gm-Gg: AeBDietMFh1Fu6POBE/iA8YtGkQi447hbMawdBXk8EvsthUnm63tNUibVCau5O5aWrU
	P/eA635E1Z6Bvy4XdPEoVYC8aIt8sDGBEJBbVPqzETf/OMvpNlFm5zpx+R4PG8mLs0OB6HbnKH7
	uf/d3AjVnLdfUzEOJD0gFkmQB0s+bPQOz/JPDGzWV2tDTO3JNFIofy2M/Zj2g+pnVBUFwrmQTsP
	t52lUVPLSywb4LT+H1XpeTLn0aQjFCLijuHhbXiS7uY/PZzGHxzemW4WjOQE+q60dY5tK2QFeD+
	HSWdzFnHoe3J5cLGIRJepmOuz1srMGgNCOhHgFL3+S6zx3oAv8nRy2RrD2XZTRZk8GqzHMlW1qF
	jpfsYpBUftn/Wf6mt6PTAgsU=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr3830933eec.7.1775551061539; Tue, 07 Apr 2026
 01:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
In-Reply-To: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 10:37:28 +0200
X-Gm-Features: AQROBzD3OQzI1eA28hVCCiGMvz4r5THmhHuU5dUr3xJV-N5wbeOjrOxDF8RLuuQ
Message-ID: <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 5:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> You're welcome! Actually it seems the lint was already improved
> upstream, starting with 1.90.0.
>
> Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]

Indeed, I had the PR linked in
https://github.com/Rust-for-Linux/linux/issues/349, and it is nicer,
but it would still fire in a case like this patch :(

So we could conditionally enable it for Rust >=3D 1.90.0 now that we
have support for that (and allow locally some cases like this one when
they pop up), but it is still simpler to just ignore it (especially
since it can be quite confusing for other developers to see it
triggering).

I think we may want to eventually re-enable it when we use no unstable
language features.

Added:

    [ In addition, the lint fired without taking into account the features
      that have been enabled in a crate [2]. While this was improved in Rus=
t
      1.90.0 [3], it would still fire in a case like this patch. ]

Thanks!

Cheers,
Miguel
