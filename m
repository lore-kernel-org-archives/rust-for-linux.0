Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBE9303A3B
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771490241; cv=pass; b=CB7t0R9hfFXT/MpCcGtZ6XCzBdtRrcRQWb6x8TVhThDegTib7NHSgxA83jZdJojo01kFXHhXWMe6r4ABTrfuuAoB7XkyucHIXPu5D6KhGt9OKDJaXkW1AGnZp6rfq3pAZwM6A/tDcv0z9gePKr/KgdudxIKqeNDSu4C3q5IQXPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771490241; c=relaxed/simple;
	bh=epJOKJ9NKcGUB7Jqzp7xbeJnpD2MYLwV626TtThgivA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgNj38zTuPfuW2Sn9HGyUSecQ4WzUpLxcm0V3zrtmN97rC8AWuUF2V56hegk7R8lNxvuGppliN+p1SmM3VG00KO7DZnWDnT8EGKXH2T/8Ma8W3lFu+Hgg6ardEq6aS2v2+eNpW+2jCXVgk+OAyuUc09Z/vcioKeLgCwm7UMoctQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKfQEfmi; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKfQEfmi"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1270fde1739so47584c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 00:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771490239; cv=none;
        d=google.com; s=arc-20240605;
        b=UZECB33l894hM0W5BHL0IhHAyeT6OtQWlid/opzJQFOLjx7pUO8uZ6pySpjeMzs5V6
         r2zkXX6vlEAqoYM9fL9Z/JvJuOIqMHeeRrZnQ3fExGo8QUdVaU4qIkL4CpOdx7nY9C1D
         fKvYOe3Q51YgzxN9n/I6k0resiKjer8dOaOtLCa2QbkCsUb/Sbn+VL3eAF+oy7TV1MjK
         WF3ag/RLg70fteKawdz5e6TJ9k7OZu1f3bfguFxExu17+5pvRKeSPSISziH51pTQvPHt
         a1oHxTReUIjV+oJuwqXJ0tphPaOY3gWKRPbPhnR7Pwdkck3hkyyxYltRhmh9u+ggT9Rc
         AWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yXPNM91avxgbyWJW3o0gSidGOTdLbiKtjwl1XXDdHPI=;
        fh=IRAjmwSjpxIpJ98HR4L08r0W+UYUJ6bCwhyErtxJnQY=;
        b=RqEbNMVRd67ilcekLzDygiX5LSG6Ex2oiuI9EeTpRhC23w68Lg9J5JA6B+A0RDVOX8
         bchDnPkLQirVKrZNbBQg1THmOENAxLKIRiJS3M3Whd2yIcZsWHaeSwjHiSEyj1zMPNRB
         jcRPFpbhEfEGq/kZjjcpDiWKGOx/H4DUAOlfFKpIaxR3Xnyqm9SFTIGdkb7Qc5MdfWpP
         uzhJzxx0aqbCqjzkIv3ZAM+CBzoUCl5YELQU8ey3MGI2fSJaS2QQw6OeZCH3U+k8eTsg
         oIC+RiifZTvoJC6aG7juD5pIL181mPMEm+lxA7540GgINaXgzZva4QIHcX+Sj0TNOd5Q
         dOYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771490239; x=1772095039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXPNM91avxgbyWJW3o0gSidGOTdLbiKtjwl1XXDdHPI=;
        b=lKfQEfmijyLE93AkT+4R9qANxnRjqDDN07+IRKc9C8oPp0HnMcsyWdG8Cmv3YvTbtq
         Z1tqfPwjEj4hyVgG09y8NR0HOwK8jgC57dxGahw8e6n8q6Oc60n2Eshai+TpPMGBiSk9
         jsQvS8d2RVZDEe0Sux47+aR9VBxziuhd0lxKN4URjlMHZDHy6FU+IGwRAXTknIFZ8KwQ
         FxfT482pUPS5dhtRXl1UlEtLT4bSVaWveybaxjqPC/QG0dzPZ/GeBqgZkwoc784LNdJg
         pE/OAtGfBM8CnFNHZz//2d0gKGzRMmkjJkGZZooQ/MvxvyjbS86DUsHVtJvsCyXmetAO
         Nu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771490239; x=1772095039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXPNM91avxgbyWJW3o0gSidGOTdLbiKtjwl1XXDdHPI=;
        b=ZFWosMfVCtZl2H/6x461LC/qTRveUok98P/ZxTFvnrU+FrSG/zoktv735Mnc9iMj6O
         9YsW7cZo+OtfzjM+iJ8gX7yqvnnJrkCQ1bzE7vAaxG97wfnLr2q7jindIwGLC0ebjUPQ
         D1QLjGscxAk9C2Q6g/wCxMwwKMW8S0OMbmi2IDq15hqyXOjSiBn81pB6zj8C/ph9utm7
         9RhRTPdrgcYGgdHhTqgDYylH5WrGrFLE1iGfEbENjclpYMYPXwH7xnteRUt4qtFWcy8z
         uxbgssNTWvLoFXjZAal6awXJpKFT6F1SU2Po3SG/ER64rgQ54wXzRiBxb8r7sFn6Wo3c
         odVg==
X-Forwarded-Encrypted: i=1; AJvYcCVVjLim4k2xwFGTrZm07kE6T2b2ueUqhJ4Ik0S/E+f2NY3Ig/oet0iA5CBPYBWW7c2pq188kt+Uti8YgIVibQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHfdHhCqkjKXFdgkgZCdQh3dtUNkpf7IvxgmUxfIklJI3+t2c
	XwMZWyhYVFM9Vi9BZnDHXKcWH/tEmO0cZTB2CI7zoL31KgOntTU2G/SwPbCRjo6GKXcKuWGXveb
	pJoHyVhxdIXhHCbkUtymBFdvpDqqmrgg=
X-Gm-Gg: AZuq6aIIPTHTOPouglo4+txFf+VqCRL0IUbrGsCQu+KJRROI67g+cxmPYRg3D4TE4bd
	UrAJCAM5oLN/V5pRlM9Jt4FRSMrw4SD7cdvqpAjfsZlmpfDzqWMq//iGhgYOh6Z7c+1Ogh+rquS
	yt3tGNRPc+4HY9l4//PeIdCfC9GZn+pG+ePi6nrTcYiBbhx1vH6z820jdPpNjZcpf0crVwpwXpy
	G1xgxqVgR/C96DjxQhjoyWp5CYrJst7vjLN2Uex6pPjoOMNWfqXNK/Aayn037czscyvzuq+vEyO
	UREtFXk/KPApWMVMIp9AN+Z3vB19WHRoxw49wfCRrSNEPAZeM50ELifKYi6fx2e8wpXCJfIDxtG
	8U6HWhKmv/xQUHo0VzbHe/z8B
X-Received: by 2002:a05:7022:221f:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-1273983ac5dmr4226701c88.5.1771490238900; Thu, 19 Feb 2026
 00:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215132232.1549861-1-lossin@kernel.org>
In-Reply-To: <20260215132232.1549861-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 09:37:06 +0100
X-Gm-Features: AaiRm50U7a0nDklxgCSqej1iJrRJeVz9Re9gOVrVR6MSk5ynkHzDvcZ5jRjLr6Q
Message-ID: <CANiq72=NrVRbwANeqZWXBUO82COhMD-OQ+0xYm-yENbt7=dBaA@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 2:22=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
> warns about the `let_and_return` lint when a comment is placed between
> the let binding and the return expression. Nightly thus fails to build,
> because the expectation is no longer fulfilled.
>
> Thus replace the expectation with an `allow`.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Gary: I wasn't sure if you would have wanted me to pick your tag,
since it was conditional to adding the message, but we agreed to add
it later on. Just in case, I didn't add it to be on the safe side, but
I can add it.

By the way, I added:

  Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

    [ The errors were:

          error: this lint expectation is unfulfilled
              --> rust/pin-init/src/lib.rs:1279:10
               |
          1279 | #[expect(clippy::let_and_return)]
               |          ^^^^^^^^^^^^^^^^^^^^^^
               |
               =3D note: `-D unfulfilled-lint-expectations` implied by
`-D warnings`
               =3D help: to override `-D warnings` add
`#[allow(unfulfilled_lint_expectations)]`

          error: this lint expectation is unfulfilled
              --> rust/pin-init/src/lib.rs:1295:10
               |
          1295 | #[expect(clippy::let_and_return)]
               |          ^^^^^^^^^^^^^^^^^^^^^^

        - Miguel ]

Cheers,
Miguel
