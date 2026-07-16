Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C141A547
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204299; cv=pass; b=Lc7opPEmWIfk9OlX28uHlly9KVxkkmKYMV+/n7kU543/mZ5n/nJ+JO5HYzKeNPqBar8K2QVOWiAZc8cEh7AHuTtBHdY2ThpwrFsVzEHz7IjXHgQgztrR9X+ISxslj4wksdIPEZXgTx4g/P/UvvBEfgNLTXpDDu2Yr/IRliKeW54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204299; c=relaxed/simple;
	bh=qeCZE0Y3mr/J0JsfPOHL/DiAQ1YvkRmztyR1MwtxFq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Flm5y5/xDlzk9qyqmEwYSD4XHxyWDHR3J0cB3jtstO8QvCWhKHA0pZvYj3b4OhjUCOqDW/5jhpzdGIX/JMT0tve4+9L+Fe0mFfaEowLOL4d3tLsqhuaDYzLNZTkcq2ejO8j12b/8A1v2IfYvjm1d6eCSYqMpdOcsbSfKvWquWqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHbCgSVA; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHbCgSVA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso521535a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784204293; cv=none;
        d=google.com; s=arc-20260327;
        b=OBBhNICpjZ0Sr0kNXknj3xfh/5xkgJS6er9/tN5GoCXeJvGGxuYrsD6MyNJjdcCd5A
         vDPhWHnQKP4WNx+JCHd1MRbMVtHr0CkCgFKJ13WapO6osDbvuvDPA4vYb3fzqj+YQH/a
         J8WHkvSdYvYITntcBO1DIiOeqAqFCvT5Oim+ukyHacnZfjZCWZhnSDp+raxx+a/KpFdX
         XJ/HsgdKVHyXtLIEFed9lMI7RF0+a+KVJjXZwIyYlXP2GRaSsO8v3OWsM+m+aBeUeHJG
         xV60SXRl05lfJGSSwnMNpt/cVWRY06bc7dCZzwHNnICMAR1a5txv4LZqd1zt6oY83WZH
         zypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c918aQ7k7uX1GyNkZQnbAfatOcsaumnLiScuoFWDMmw=;
        fh=A6pT7m7FReS4yVKMKGGLfSpb9n44NAfeTE5ZY265zE4=;
        b=Nz+InJlGugzHzduL+elozdeBLQF+wiwKp5oQluQWBTetGNCfQNst9UULH5vsqB1jM2
         57KpnS7vpPG4DOamvotXdUZG9rGN5YwoTeoRr93x8iCbZ/LCmFoB47KkVOIv1/BAucCm
         5CV0bvAuR0CD+2k7KPWVu+d9RhQBbwisoT9MOw3+Rq39jVVQilu6YDRbHnYgD4J0Bfg7
         9l3m5HHpS72np3gCJSftxhU972aqimgpqz3cOV6//GFWpepjJQ0iKObBeiatSYkSTm61
         sCtXZ/wAE1TUBFrPpD5/7qerpuvp+69GTmL3Aevbbtb9w5WZvDnWNnfRJW54EOBK620R
         zD8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784204293; x=1784809093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c918aQ7k7uX1GyNkZQnbAfatOcsaumnLiScuoFWDMmw=;
        b=ZHbCgSVAJRrVDroM61OXejFv+TyuGWsK1WmjIl4p8ZcpGbCui6F/ZrCZGkA79NPPsx
         CJoI5KgS+ERcRu5tQoDdC4j7ng54hQkmg0wzqIqkdAp10iFVBPSLUU1+Ab/+vNolC1Kq
         rE75g9sgxJqMTiT/wF3GG7+UQJaAmlpaSACExKryBiBNX17/7ukvn2H/Vc90Fd6ERqqR
         MCTRo1ermQcG004GyEEjuE5rg3cG6YHQGFJNFKE01+OEqpoAygK/TZX9AePm2IZy1Lx8
         nYCsq2UmLJ9pczZuNE7hSVtR4DA9uUhyrXvJkBJiTskVpTEbgl9XPAp2JEtrNRehtK0o
         SiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204293; x=1784809093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c918aQ7k7uX1GyNkZQnbAfatOcsaumnLiScuoFWDMmw=;
        b=d89Oay9fgC9IYwG7zzI0vY59c5NK0gpy9NxseHsnrlIpxpZVRQAPAlrsaBQFyNkg8f
         /bK44nPPLNpHTTXu0x34vDEql+728hKm9zNGUJQXmmRKOpg27sFewW1VSS2IDtIZeGPn
         kEdVo5MMjKYiNT6vGSjbeeaXGgXUIYAal8tSHD2MUv/ADMKXsUztDmjgTVawF1Klpawg
         wx/mLMzS7vp0WAl8xq3F6iEb/UjLbmb8QG482FvpzIZC9cKnZosLJnSvL7kEt/81q5Ho
         4w1nQOyuAC3zgPeYgKAKLnErx6HtAQ0LPBcgCOnW80vYRVjNg/T3Zg5R1ClPDlooU4PP
         L+MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCXNjnucGEOExmtZBa2j6AUkr76VNuWpGe7MJBLV6ycxL6L/OlY61B4aYvBgffF0myL2ddWEj1eynSf33tSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZj4hrNhUCoe1U2USMJkVL2a8V5u5ElZgY4mkHWaLVopH4Tq+
	LBfl2QXaoMqMvcx15GNycm7f3IzcdWErpMIo9j3mca1D4e2hCclYe9atxzEcfxcTl8xOWubIa34
	UT1pAG5EZPqtolvN9dpHj3o5S1WWqtWw=
X-Gm-Gg: AfdE7clrpytSSyIaHp7xwkULUmNe63d2eE6gXPWYcxtPNITCFQFAzSqhSRX16Lw3cy6
	mu2S9foFQYqDY1+/vWZC2yVpOUkALzRyIV+3Oli74XFmi7AaSZZshQzfGH91SNMJxRA4xk/aYVh
	1pthiW24AbkJnZWvxKR9oLSfFhAwZ8Dnf4xl69AGjMrVr4HKa1Uy7TKxIV5Vaz7Z66pKnBES+4O
	nc+Ijo92NnErP/3U7LCLASq3A99qelCqW1Mhx3CTttmD0yDXzKMv2679+R47G9k2mRwuM7Ok0/P
	3SZRG4c2M4nLp0pwbCcn1WUad0meMrVYV9sP9DSBlznC1s0aVFcqcepiGUsxUFFCooKgl/vHcUe
	S1w==
X-Received: by 2002:a17:90b:4c0f:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-38dc76069b8mr14068130a91.0.1784204292951; Thu, 16 Jul 2026
 05:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
In-Reply-To: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 14:17:59 +0200
X-Gm-Features: AUfX_myevnsR5Su-h4NLGTu3-mxvvsCDC3uCj12Aik5QGhF3XPcyxIyrYw2aShM
Message-ID: <CANiq72n3BYGfB9VvLk4-bBQzGy9YhDxFvCrjkjJqBbcJa5YRYw@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> These macros are used like expressions, so they should must not emit a
> semicolon. This is being turned into a hard error in a future release of
> Rust.
>
> error: trailing semicolon in macro used in expression position
>   --> drivers/gpu/nova-core/firmware/fsp.rs:79:34
>    |
> 79 |                 .inspect_err(|_| dev_err!(dev, "FMC firmware missing=
 '{}' section\n", name))
>    |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^
>    |
>    =3D warning: this was previously accepted by the compiler but is being=
 phased out; it will become a hard error in a future release!
>    =3D note: for more information, see issue #79813 <https://github.com/r=
ust-lang/rust/issues/79813>
>    =3D note: this error originates in the macro `dev_err` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)
>
> Cc: stable@vger.kernel.org
> Fixes: 5c7ca6fa603f ("rust: add `dev_*` print macros.")
> Link: https://github.com/rust-lang/rust/issues/79813
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I was doubly surprised since upstream made it a warning by default a
long time ago, and yet we didn't see it; and since I hadn't seen in my
CI even yesterday.

It turns out this just landed into today's nightly:

Link: https://github.com/rust-lang/rust/pull/159222

  The semicolon_in_expressions_from_macros lint previously
  suppressed warnings about non-local macros. This masks
  a lint that will subsequently become a hard error.

So that explains it. And this is the one that will make it a hard error:

Link: https://github.com/rust-lang/rust/pull/159218

Ok, I will land this into `rust-fixes` then, and send the PR during
the weekend after tomorrow's -next.

Cheers,
Miguel
