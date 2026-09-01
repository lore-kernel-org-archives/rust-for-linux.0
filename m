Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0025E49E5FE
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303615; cv=pass; b=bPxMJ9zX4IuYWbi4lf4Dv5+s32EE238/4/f2gflmAYpfevu+6yceVBDFKMLL1nEjfoPO5th/tNMfEdbJDIafvahpOUB6DPV0x4UPQBLdVsUhS/Yf8i+7y47i4mqUYwlzepO+lrti3y1yrklzvqwcNYUhi1f0iL5oudrvEToDEo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303615; c=relaxed/simple;
	bh=1EohgyTendztVlDk+2uhEI24wsVVaL8E9Q/KpC4uNBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak+QCwQip9CaQN78JuegBBS9VDUJokIbVSI/3mxPSo8we8cOAWH1WcQXCgfphHKbYRv8NylazjDCqPmWdD7OtL1p9cwZ7buHplhg7lIY/2qudzSKYn5a1y3wX4JnNB2NBZdTEA+ihGcEhabSXh+hh+3xSxb1wNm2eu32XqG8CWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO5eB0g+; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO5eB0g+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-396555b8c7cso53082a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 16:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788303613; cv=none;
        d=google.com; s=arc-20260327;
        b=C3AoYTQdGG6sfwui4x8UNMRf+1OGCWpZjbClbKHtYFo2Uts71aBbIRjMlHgBcSnGfe
         9pDtlwE2Eg77LpIR8Jh536u8PPcxtcgtlHahmUaEMw4EYsY2phFwVMF43mtKVUpL4rCn
         ZNtyCn4CRu9erY8fUXaxGTobYcDRabHsO2De217o3ACrlk8jfIxc8+BgEG5GxGwRI+BJ
         3/VttSTrqeHyCIDUlwppCREJ09x38KdHNLNbOhYJQn4n+LK4wF4qu/XPj1mGqB8Xae/X
         S63eBIHZ3z434Ux9Vv5N6Ps4k9Hj/SylreQqvDDqHV4XvVducnxqp6vGX8eLNv84Chux
         5+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkZyz0DUc9IX+6OAto+PXMl+WtSd8or4pjnBzMTymto=;
        fh=/p70zK+Akt8JT852ApYBevpEtM5Zm5I1F/Th2Hh2D4E=;
        b=SY3pbhoEpct4z+u0Scb30NB0OS0g5e/CtknYfZ07+3b5S9FTGlEYM8J9dX7fTu46J/
         sDnyviOEt0VBoyVevB0w0Ci5NUaaKftNJ0RIGqG4sU1P2L4Mi5br2LxweDgY36zhBch8
         P0rFw2ncs52bMij8sxVGnKIB3Zl/ZueJlo9ErCsEkEOyJXoPTZmyoA/qmfPMbyjkyvBS
         QncbfkOPx3hhGf8qiIszXKx5hqBs9TJbMuZXMevG8eMLm+sxQOK7tfm58kkA4IWFfGDH
         gG8P3/JYIbzpTyxXLPV2bmxV3vuCktiiD5WLrsQHfbYRtw6bfGCzJiP8TuEWpV/BFHyj
         shdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303613; x=1788908413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkZyz0DUc9IX+6OAto+PXMl+WtSd8or4pjnBzMTymto=;
        b=BO5eB0g+tnxZVHVPRGmO8qWdaC0Pj61waUxjA74VN7qQTtW4H0ShrSqr8jIn1WdpIv
         jJxLGlSen3JumbU8sTuRChPCUDuUnOyk8vhCE63tuI4bzuddMDndIxk+CN28hpMIoxdy
         yc6R1r6xtClIliRKpjqh0T03lqk3UddKKH0aXA54u5WNHlBO64PVV88fTw52So/w5Fbw
         4OfdJQ54DOfy20X2wx85hpL5cQLQJ281hMGnaUJiczpSHnPSNCFjFxoVbeqJ2PZ+C/78
         O98mbs4OfQOPUv5/DWHAPCTAI+gGUhIFITi4fxzEvuKOt0CfvefWFfvVGMWk7dpbP65L
         aLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303613; x=1788908413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkZyz0DUc9IX+6OAto+PXMl+WtSd8or4pjnBzMTymto=;
        b=Q0GlbwVVzNEcCfxY67Vq8hkEFYFCqnXXj+P7rDGG+31CLf3Wz6QvLuXdtUyLhTBbFM
         ZaIMJX/1k0L0yTL2LS+tF4Vk7Zs4iGtKbScuWTwjmZAQVZADqkihy5+M+HZXzC4e5sBZ
         aMcZRElj8rTwEXYGj+J4mU0T39KJ/OzK8vKKwcfbg0aU0gRnyhnOy69aPxCFUHCcptQd
         Foe1SVyk+IByax2dCP+L34ZjBNyqW/dD7fYE9qVcIHv1PN82udC14goyFdnN+svAPZyN
         3KoogfdOcbvmetbVtWg7NB11dxDomP3vTRHYQ8kG00EI9xwrMm/8E6E6CIOZuusOTvPC
         +HsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZjoozz07K+Xkk9wYjsrU2Ueu34yNSs1T/Qg5J/hogcZrxTUC2KqzqMczyxKKz+a26vsjpra53I+s6nGykRg==@vger.kernel.org
X-Gm-Message-State: AFuF++nmIN3deKIqPDASRG7bBHnEQ31XRzfQ7wupX3WEmmGYRbX/SPIm
	6U30SzVyfvWnaV1D7igY9mHP+r40ExPKXCp0Ia/Qp9ZPqi/aF08KRlnORnnE9PhkgsNEiJKRZoJ
	vf2fUC6f0w4pZ2ORvtHExQ3YkIMYyKrQ=
X-Gm-Gg: AYBFou0ANWx1gC2qUpzeb+7HwFCr8i+kWuzorPnYq2Qo4TplTXwgeDjCB5XuYRngkjj
	21xwR12iK3a2Z4M/Gj4M6XIcDehrSEHAfwUNTFZJcD4Xxpnu7VvSCrikaJ1qRme59p9aNVY7nnG
	k57P3EL7p+QHUuH9qWpQFgqI5Y3qrQ7oiNcfFZ5Esm9lPVxX04Hj473n2kMQfvUSerdh8r+aXwt
	+q1AIHg2zM5IJUUCnmK3GrMpzg8l5xox3LC/3/cseI+3MbcOH8kAJKit7YUzcHgTBXvj3Fs4pvs
	KvjcXAfYV+1X08DxaZuU+ieXm0dYFEC4ycGFDOXFlvfNP0lxjYhQzzfq7/DJ+Mge/0zedKMnIz0
	hN6J2jlhqEmyMgoI548gPt8V93c+RArVcQ7KERvOXJXxjuJHX4u9TKlYIS4Fx
X-Received: by 2002:a17:90b:590f:b0:398:bac7:72d0 with SMTP id
 98e67ed59e1d1-39aee222c37mr234130a91.5.1788303612233; Tue, 01 Sep 2026
 16:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rust-reverse-randstruct-dep-v4-1-3bfa19efe1fa@kernel.org>
In-Reply-To: <20260901-rust-reverse-randstruct-dep-v4-1-3bfa19efe1fa@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Sep 2026 00:59:59 +0200
X-Gm-Features: AcwNN1V6mJqATHgXTZuy_n_fFgcdcAsp6sZqZ6O99j8lAs7oSu_PsUpXZ9i9pWM
Message-ID: <CANiq72nOk-gbd+C9oG5y5RKrYhqNx+BLcwS-8u-uHxUjVTwEtA@mail.gmail.com>
Subject: Re: [PATCH v4] hardening: Default randstruct off with rust for better
 allmodconfig support
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:52=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Currently randstruct does not support rust so we have Kconfig dependencie=
s
> which prevent rust being enabled when randstruct is. Unfortunately this
> prevents rust being enabled in allmodconfig, our standard coverage build.
> randstruct gets turned on by default, then the dependency on !RANDSTRUCT
> causes rust to get disabled.
>
> Work around this by disabling randstruct by default if we have a usable
> rust toolchain and rust support for the architecture, circular
> dependencies prevent us directly depending on !RUST. This means we might
> end up with a configuration that disables both rust and randstruct but
> hopefully it's more likely go give the expected result.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

I thought this was already applied:

  https://git.kernel.org/kees/c/3844a38c9c4a

  https://lore.kernel.org/rust-for-linux/178733378275.2181196.3186172911325=
132761.b4-ty@kernel.org/

But it doesn't seem to be in -next -- that branch isn't merged there I thin=
k.

Cheers,
Miguel
