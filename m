Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2FA221FCD
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182747; cv=pass; b=IQx5CiIKypvFw2xZH8MAFoNtNYU+g4BcFitgfBCXkreZ7A4yz2cM3TOdzKPdUUkmvORYSFTfhDRy6S2V4lisTj1mU9INqmSZyxQa4pbhwOLhO4HSzS+NBIoPdBUUvIeB0xqR1xvhCGxk5OD5srupOeyoEe2FZltuas22aA81mW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182747; c=relaxed/simple;
	bh=NwwXHeQBm0xRS2zYJadsYZWaw82EYyPo5w3EDKS9vp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=i8s09B6KbcOwD1Bmq+ql9pP5MWG50OoNjh51vS+gL8QzFShgYLtOJXcgOl1hfO4wP0IC93YpCD2wolrUKGqi0d9n0ImgpSjJpX77mURNj7QRE1CIQ23WiQTCvyZvn2Z3nbvG9GLoTAxUIL5LQhBLq5U/UIL+gsUId0icNvRnOvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIkxt3pp; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIkxt3pp"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be22d699c9so550955eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 15:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773182745; cv=none;
        d=google.com; s=arc-20240605;
        b=cA6YxCK7S1+nCk4j3jMKTGY+pfd+GJsRFbj0NHbsmlohxOnUm4q/WZzIEOhg8R6nZV
         GycBY660BbJIg+foxtLJqW1Dx56Ob78b6d1onUJNGirS6iJe1nvH2AseVT7iy84YGwls
         Omr6OcxV6kZ1JaaTAABCczR0llwSYLyVFtdHGvCGY1pK0fxZvnHL1BRq4yIRHquUipCC
         91q/hIBbN3CKN1TMLJXoFqc/W3EqnVSYRTMo4SjulbKb2rpwO2QuzaGsikBv9VU/49Y3
         3t0q1qgS7vOxbnFBsWyo1AiCYowanlM3PEZitig1oRlO2qkHFMkvOk8v0UFmgbqrktin
         tdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AcppTpjnVFhwx13Ei2/3uaCsu4NJqsetsGA5pNmZ6VM=;
        fh=0Q9VHIddHx8yWwcnrsJOZ2k4Btj/DnPc8p+V+5cJZzw=;
        b=cZd5qax5Zm4zwqj5DeUsDLrX8o0N01Z3c8Gh+rKfKHshwoAh4SCPFic10s8pJp2gUe
         nVGLdK86l/HvSCFmDXYCw9DBXcZc0EdDqo6F8WafJS9BvtFdh2HDsTeO5IPhY+lFgv3o
         mDV8oFxKQZXCbx8p+5igsG2l7CO507aPTFyfBV5yrJ6tA65jfR0N7TGGOYgn2HGLJGJ+
         j3wo1gOrorgdeBiXx3qS1mWM1Sx65TD4Ym0qW4WtKQzc/sqMQmxdC4ad3w6EaibTmOxp
         2kGiIgzL67q5Ef/4F9Ft1Ow7zXmytZNfxL1CkbxaZqOh9Jay5o1lMabuw3WUShflP4Lo
         x60g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773182745; x=1773787545; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcppTpjnVFhwx13Ei2/3uaCsu4NJqsetsGA5pNmZ6VM=;
        b=JIkxt3pp3CLOTQqhAFNxefuFPdiS2it8Up4l96I8OJHdXhDWcgEev4/os3tOee73zP
         P2pV/pv2tTXFlt4VZByLmwvD/VncXBozBRgi7EeFuqKrCqgd1s1bk2IFi56ilA+Zd0CG
         r/O3951dFGhc4crweV6247RJBXeNSHeY+Q7oIn3RLQ37/O3Slr/lwTNGPNuxCCn1V8UP
         Ke8t6cVagVf5YVaQDJh28dV6fFGcEkSVXSjIbvbLKF5ECSmUxkwt490c++kumccQRa1H
         cUBjr8q+aEAlxsAvnncuz9F/k+tYCkUf7TDaUAG6t/4vEl4lMWTh7d4NcunXbnY0wX8q
         /5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182745; x=1773787545;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AcppTpjnVFhwx13Ei2/3uaCsu4NJqsetsGA5pNmZ6VM=;
        b=gYyLfy52bQLpvqlZsXpYiLpNDKIAjiydv/zDOKU7aHYyMMnC2ZcjZNtQNH5I9+3rQc
         HG6y3RFNDsAeyXIb+NdvayDmRnPeO7WsumYA6JXyE3HRVtxw95WOuYYJq7gGNy3XZXrG
         tMo/L2Lf9da/ZtE+giYEGn55O29rm8HxAFoehPHLOdT+4UWxxjyUMtZhBfLok7Lf1mSb
         tYmgt9hw6WTq2R8ajIWOOMmnMKYtaWiqUpLVTTvLjFrdE8JfEZdwtV8TrShCxWKpiVys
         TZrnMHi6LN7Z3DgP/ySuwOc1IA2WQS6EtBcfNVWxFD2se9aHKrHuDWCfvHZ1SpPKwO0G
         ip/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl45uaDTsEez6KZY4Cqzr3ALtq+WhSeKjlv46x5Y2emYNcLWpoFr1EEWB3lcId+HWbYC9F984jd673iUy0bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIv6k5jatQqSFK0uCibdCflxjU7f0ZZl7OJIopkEUVmfXmO9m
	nN4AA2NRsyOmFtSHccrplZg8ug4WARP7QrfFx108i1R+jEG2g7Ffafkl4O6Ghm82wn+r85zaRa6
	jFTmJx6eH1wW4XNw8gEfNzbdRaACrgZE=
X-Gm-Gg: ATEYQzwFu746QKtJvLH8DhdDgC5xWoMIDY1bsJU+CAsXIiSfYnIDuA4m+GuQ2zoOufa
	AhclCOcebdhIJXOi2PBDZaJAjjg/R+dr/Jh1f99XXDYBZbD0IiZLm7cVNxh5QqdDRR3kmWUu3To
	X1BKgKWD6r2gA9dyqJXKLVP71m8vsPQGtpbO/jiyoL+I6XGMlb7GKozEvldPVhTutZ6Tpqsec/r
	0u6eczpDqNjIF2QUP6g5xkDwKlS+HvynX8hQAs9Bd62TcikXdwFI9I4sYbDZs8UuHHtjrbW9uZX
	KNDXl+wwRavthR2pGN3HfZVAdJ0moRh+fivnKa27YUX6QMaGmflEHma9NCy6Myh5fQkW6hjM73R
	3ykwFzeIgjR1m6O3jpgoQB4k=
X-Received: by 2002:a05:7300:3253:b0:2bd:d111:cf18 with SMTP id
 5a478bee46e88-2be8a589a62mr79976eec.8.1773182745139; Tue, 10 Mar 2026
 15:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203221224.GA2703490@ax162> <20260205131815.2943152-1-mlksvender@gmail.com>
 <aYS9bRugxr1rUvA3@levanger>
In-Reply-To: <aYS9bRugxr1rUvA3@levanger>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 23:45:32 +0100
X-Gm-Features: AaiRm515Nd5QLPcAZuOPkqTuJziLIjbUrquMksP3iOdIj6zJC7o4W4g4PWJLZlo
Message-ID: <CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: add rustc-max-version macro
To: Nicolas Schier <nsc@kernel.org>, HeeSu Kim <mlksvender@gmail.com>, nathan@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@google.com, charmitro@posteo.net, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 4:55=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> For readability, a less-than version check might be easier to read; and
> that would probably better match the suggested version range check:
>
>     rustc-lt-version =3D $(if $(call rustc-min-version, $(1)),,y)
>     rustc-version-range =3D $(and $(call rustc-lt-version,$(2)), $(call r=
ustc-min-version,$(1)))
>
> so that the actual version check could become
>
>     # The bug was fixed in Rust 1.90.0, so only apply for 1.88.x to < 1.9=
0.0
>     rustdoc_modifiers_workaround :=3D $(if $(call rustc-version-range, 10=
8800, 109000), \
>                 -Cunsafe-allow-abi-mismatch=3Dfixed-x18)
>
> or:
>
>     ifeq ($(call rustc-version-range, 108800, 109000),y)
>     rustdoc_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed=
-x18
>     endif

Yeah, exactly, I think the range check looks simpler for readers.

I would say let's do it as an improvement on top, and to simplify the
delta needed later on and to avoid the `99`, I will change the patch
on apply to be `rustc-lt-version`.

If no one shouts, I will do that, keeping the Acked-bys. Then we can
easily add the range check on top.

Thanks!

Cheers,
Miguel
