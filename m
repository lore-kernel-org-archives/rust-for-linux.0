Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C533F361
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610420; cv=pass; b=DKljlYOc1Ahp6mhfSdqUKgAn1tZ/YiFMLaL+nQgByXVwrrlB2w3MF9g42yJPjfuM3mKoLAmoBPKDt1Dvs7TatupeLYEY7u96I9lQOOFhAbo66Ju15c8SC/oU/ng/LzWjgsPekxq/qQVVtzAs6MxztZS+oKpoym1B0fxOxlmKgOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610420; c=relaxed/simple;
	bh=ifx/j8Fuvf9gGTvO+zKRL3KVYhkumNzVoMfjknPvSXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5CXh4k8cqmzCBjpNmP4To3bSbvuAKpjXpkPSVyjpYQFzXtAcfDvNyDTgtUcS5gNuqsc158lehbb3N5xZ+4am2n/xlK85blK9ilMEDDjzyY6SHwBswT0ONOM2m9wesyA1G0W+yu/YqOpa4PLrdRarqFKX2/5mTLhV+Zx6zp2wXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldnY8Gcv; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldnY8Gcv"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-127337e3870so139720c88.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 04:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774610418; cv=none;
        d=google.com; s=arc-20240605;
        b=V43D6jTR5SP3QpguD7ZGTVxU7te94JutzoVczvFYvrp8cf0hpRVXe7/m5ZE2xh/62k
         elOyYYzDtst2Jt8/WY0EXTP2fB6MypiIryaMdky69yQ6B7i7zbty5XW+717PHYXlym8J
         baXpYgEM4Lj46jHLxMC7zXyUSV7dj47gRl5YnLGCs8UDB054Hz0t+6gjlLDY3HJQyB3c
         jNkhs8nsBMZu4dL+b3ZZt0bSRx7KPiomRDGD9fDsKXx97HXzfqMnwBniXvovGHi0b22H
         9qGXmBIdyrmMH2mLhum4pdosUGLweY29fiI+cA5HpEChR6ANoCJrM6iTw1bZD8dgbnDS
         7jJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qWiw9lzKbytB0ZjCcn9LUxdmPtfCk1cRow0FeIDRjLE=;
        fh=t3yYKowGMZzXy/8Wok5hy59Ic3+5QBxN4khskW578Po=;
        b=Ts+cVRvtjlQ469uZEq5DCP7yk2e5BprWZrf6CK3+NrpOUCaXM6iQ20SOw2QZ2KJDbd
         xL9Cc/VeY/qkbuzOYoI8n8FK3DGy29jXP8iK8ZVNLQlmV5Y25sHFGdXVq1yH4sASkwra
         tFhCF0ROhgyQOqPis1E//HzJEyBsh5ZYzstkBehoFLmAkJVdskfjvOxWy94tre1TrsVg
         qL2iVHhSzEpB3yVG1Ry2Rab37EW/cwqbUu/iovSxx2GAIcvJY9X3j83HotaCWuM+Mpuz
         V1sjnjF1tLnL8s5bUN7di7LdCgC15pgxAxznt9AH9s9z0ci4imcLJRdjypgiTBmxW9tr
         9xXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774610418; x=1775215218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWiw9lzKbytB0ZjCcn9LUxdmPtfCk1cRow0FeIDRjLE=;
        b=ldnY8Gcv4m5f4mMohItaXcMH0vo2MzQUKj0PiqXJ67hIauqFwxCxBwlLR9zLHfglvt
         LLGvC73hoVBuitPSj/mb+NgQU2CBxZZfxR3Ipyo3YmYipYLGHSLneVx6rurPvq+5/KAK
         r7qxOds19W95m4Mn8KCb9ihYf4MrzkWIkBBWiYusuJ6rY04jUodH3UeQo53Ij71JmKvs
         1/p2x/Df9CQoJx5xYvo2Q9KV9ZMCVKz+hi0ugntUQw3EruuvSEv+FN03GgmeKvagElP0
         3DRlxCr9yjw+kFEQjtIBDa5tdr6NhVLhHQCQZENw8KmxlAfQSZVDwVNRP6mHh5b4oj3d
         Vaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610418; x=1775215218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qWiw9lzKbytB0ZjCcn9LUxdmPtfCk1cRow0FeIDRjLE=;
        b=OKcrMpKjitH1Ns+668LCJAl52RpTbbTphWka6cwzWo1Jx1xWQ5MVfxoaywzLLkPGZ8
         8DIZN7nA26QsLqUxPW5f8/bMrrfTJzUNKYwg9U8Bv+puB+QVeeyQmU6IMtxcSoSj64ZJ
         BSnI4WzeAE/+C9xs3YzZkgW7DBKGYKqM1PLu9QW/ZTXonaTMB4aJCf6RKJGB+U5QcFEV
         XG7UdKBxE3Qf/FKI+aOHP+hbd8BoqiiW0XVbGHWdqG2ADOVkZLeBfFk3ALKXmBqZwFsC
         bHyWRelwfwhAypWaSeOLXAj8xp0yz0nIwm+nLcscVw4iCffMgHn5BlYZmA7VuyM1jbMY
         G8uw==
X-Forwarded-Encrypted: i=1; AJvYcCWIGQoLV1nfOTx6ENVV8dx1Y7Z9Z26IuoOaLMR5/brrei5scGfKYErAiv07UxfnHOIyYtBZmZszTKiG9jK9pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBKroiS0KBb21ZmddM3VrA3+4bsJ2Vt8bDt/8aecAnemf4W9e
	38ciYwtRnstOmq86hU7CrxfHagWSmeJ8IcoXAx/IbCEFdhnIyScEIUTDduzWShUxigfabFYyfRe
	bymkSZutv+hxaNeLl58lHqh0W9V7NXfY6p7YrfO9z4g==
X-Gm-Gg: ATEYQzyGnMWa1lmigXfE41lKYHrtZri8gA4VWV9yOPdPBshmTmty6RDusZJexiHYSuj
	L6iwaszB4TOuKcoGmNVCsAYHT0ROWFRAc94ZHuTTW8aVt/emffY3k6tiu5lc8HbL3o5Ijz+4lGK
	nIpn4TYKM+3jYHIArHhurcNfBXa2ckDcSIKPaC7znAlRjy2GI9qFGW2kuDs+vs8UjjufCOILNfE
	onUQ0OTDZOOc2uQciBUv/jYazJq+9xbrV9nQp1AY4TboKEYgCX6Qjj0nXGSW1L34K4ZI5A8C5i+
	CvV/emJTtgCagtnp1xXkBiBjrhJrB8++23btyxZYZYzRSJAPGrc5HVjxjJj5+1r3JqhX5W5u7hJ
	jD4kQUG/jfAcd6Jcdk0Emzck=
X-Received: by 2002:a05:7300:ec18:b0:2c1:27c:75d3 with SMTP id
 5a478bee46e88-2c185cb76ddmr553391eec.1.1774610417806; Fri, 27 Mar 2026
 04:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323024206.129401-1-ojeda@kernel.org>
In-Reply-To: <20260323024206.129401-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 12:20:03 +0100
X-Gm-Features: AQROBzDfvP4a9-P0igZFn1slJ1UozWZ8BQTLbjF8WJQqUrTSyZ8eGrCY-zfbapE
Message-ID: <CANiq72kE-XpB9Bnq8hViTAYnStMZW=MNDkJfYsbLccCKkBCthg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add `.rustfmt.toml` to "RUST" entry
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 3:42=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `.rustfmt.toml` is not covered by `MAINTAINERS`, so tools like
> `scripts/get_maintainer.pl` do not report it properly, e.g.:
>
>     $ scripts/get_maintainer.pl -f .rustfmt.toml
>     linux-kernel@vger.kernel.org (open list)
>
> It should have been there since the beginning, and while it is not a big
> deal since the file has not changed at all since it was added in commit
> 80db40bac8f4 ("rust: add `.rustfmt.toml`") back in 2022, this will be
> especially useful to catch unintended unstable features if upstream
> `rustfmt` started to allow them in stable toolchains [1][2].
>
> Thus add it.
>
> Link: https://github.com/rust-lang/rustfmt/issues/6829#issuecomment-40843=
25200 [1]
> Link: https://github.com/rust-lang/rustfmt/issues/4884 [2]
> Fixes: 80db40bac8f4 ("rust: add `.rustfmt.toml`")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next`!

Cheers,
Miguel
