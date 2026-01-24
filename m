Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154531391
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769294187; cv=pass; b=PFNLefQyrP251w2M+rfvktLw/mqxtohIpPkmj0CtStGIjWJxXejWQ/d/kAveEyxGYfcFtnOzxhIo0KQttw2+c97hMUFtTFoPwzPzi999PYBJUfPL/LZceaJ4joJcUxTxLGpWc7+INm1PT2XqSABz7GDyAnlsfmGrXG7bJaZDTeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769294187; c=relaxed/simple;
	bh=MDZHCBmNyKSj2trZMG6rXLK8H8ITeqaNYXW0RIxzJcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrKvk2IjzBZdCf8Kd8eILaGSFJPm3oepGq5mVr3sGlfHEgg7L9hov0UAzBL4uaCA0CJdg05Ro+YfAB/tFD8dMjS+n3BrAP59lzs7KMdq5mAwdvCvSCfyTFKbgeeQO/aJGUNDviIAYRdbjnoxeNZvuUv96H/1AxC4I8YIvBsStxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=un2dWhKi; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="un2dWhKi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2107308f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 14:36:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769294184; cv=none;
        d=google.com; s=arc-20240605;
        b=MvRcX007VnGNcdbtJ/pfsneg9ro2tEYscpfXw/w31C6s88cAHVNx/tK7aO6THv+SZl
         QraX7qeRdI+DGQ/4l/SoNd3Ey4OSDckXGi4AsncWcywD3H17XiEdi/3eCWyZxj3F5BKY
         vrWzB8zHNvpJAmZb7cyhyThQdLKR3xKM2f9Ujwemj87/TPqTGUv48sQXzDRjlzAR58x2
         3BERZcP+gauec/sTft01eqio7GmwIFs0mys4yqJLrM629v1zrsRXSpaM+GKv+8wjcUre
         lpn2sLuuaf0hqvjyxpG6P0IWIWXcEQDMKA+HDiBIHafAKlxCWyeZwaJ474oV/eGkWcyH
         khsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8GmRSJGgMQjWndTIp/YQNxJh3VQ1FIOSVbF43GphX20=;
        fh=xa/i8ek9d0bAM8fRlxuGBFTdI/jNQco76oOjHrbvG0M=;
        b=EgwmgSUuijqC4yCy4uj6GwtLHTF5f5LZZPjV4BiOFZe0H3KJZZXwYKmd+xCVoIqoWT
         JUP9rGewPVevVVULg5rL+N4FQaTVPYz5YhwtDmwG8SfGSbsxWsEIghdCgbLWgN2yc2u8
         PuRNsPI0KuG5kWNdOHnEoVB09HX5w/QvtWOyPSpXWieWNVKg908LD9YKE1huS/+5koIg
         dITfrSoFzzkC+MSS9TM7E5/f6nUIiFdxbBHhgDJkQ3ygoKsaTLCNWzS65FEiFB4zl92T
         Orgpw+U6SjWXdUmLExBq88c2kpt64mTzJqyNyw/EgctlnTZaPrL2yljIZ+aNZ8R721Gr
         3G0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769294184; x=1769898984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GmRSJGgMQjWndTIp/YQNxJh3VQ1FIOSVbF43GphX20=;
        b=un2dWhKirTY7aeXJ3zgODxjra0WbJdlbPkCW+HcIPL6GNrveBSpqzEUxKHAFkyLwvG
         A9QbspVP0/vIZKP4kASOsyF2v4DSvwSs36YFRGI/bft1WY/B+iwYhUUo+1V+KPaNx65/
         HP3bH9tuIXU1T/wcDYZ1EdqGPbNZ8Hw1QM3CSIjPEPmJVOk1X4i1jRFehE8f/dpl02ZA
         5wseLDHfnXx5M8gKWeJrkA4l75hSNputeKoTVPtqX6yI5hN/eRLYSC1CQKF52G6AClAx
         HbhiJ/gT7m8nKHzIFgHaxrDfM1uAaiqkL0HJLvQl+q6jvdpVK+93iiJuty2nWMLOp2kG
         gSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769294184; x=1769898984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8GmRSJGgMQjWndTIp/YQNxJh3VQ1FIOSVbF43GphX20=;
        b=JNe+U0unTCXheoep4pnulNNyoLxYvtGalmPiJR+KNhM6V6qRMLhiJVTmTeWYFXM880
         Z+lG4t7VbRSxbxKbOqS7O+BJXsEeSUyKEK6zx1gW1wb9kUaBDUo8uI0iooIp5/rmjcLd
         /xsXIYMuRCLmvWGOe5KYkeHCvoUwd8GFQGpqnjay77hqISGDrPJBhSCiHZVCPBoG5Y2X
         hLmtVnE2jPoFylWrCmDmI+zoWH9UvoOUaOZRuErY+GnoxCkYjI/Wd3f0dhNA/bztV61v
         lIaV0qxsIVnO+3oRCNb+qU8q+z6nUguNixhMcA5+mN4TdFBmPZSXQ574gsGfNBrAhr39
         iOqg==
X-Forwarded-Encrypted: i=1; AJvYcCV3n3rjwHFyMxxIP4EToyaibqYZKogajyR0jBe8Ap6IA0+DABUiA9P8J2cPSOB1w4dXNPzJT+j4BqbaysChYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52B4cRZi4sJP4MFV/h9X94pf/IzGOMKQJy7etE6KvKxu8p1jP
	ght/tH26xMyBppxhW7Xuve+C5zXdSxunm8tF2VUulakShXJ54OuPY1W8YICljR37ldPeJVb8KiH
	PqXC8gMfrOvrbIx//LuxjCUVRTg8GcUeGZ9wvTeSi
X-Gm-Gg: AZuq6aJHJowgYrbdkUoGXdKPDdyKVlA0AXc9/Iy7sgwfhANdNYSe1/KyO6Iv+CQ3Uxh
	8Ibi2pKc98cDAMnfEdWfl996Ab+jpdjEwC484/ruK0igWurBXHVUUisg+uvlg63AWu9d+MsykWf
	Vi75GAxiOD5P9xzH9/FP7k1zq+zsdgB8NIGbLaEgAB68D0o/yAyDtEHqoN1eZ/eEvHzC0eMS/vD
	uq2gBcs115Tob85I+ba7Uy+8PU+AirKYjxvpRPzy8FwhOv5zmWxPkS2BhF29AYHfNWEiU59jMXn
	NvRTsZJsKWjPNf/ck/jgfsU9og==
X-Received: by 2002:a05:6000:2285:b0:435:9abb:2e16 with SMTP id
 ffacd0b85a97d-435ca198a84mr6427f8f.45.1769294184410; Sat, 24 Jan 2026
 14:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org>
In-Reply-To: <20260124160948.67508-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 24 Jan 2026 23:36:12 +0100
X-Gm-Features: AZwV_Qg9RXX0-BW1n_ujo5ycjvRSxyutcP-OISjietqPr7ZWjFo28f7XnyPFETc
Message-ID: <CAH5fLggeH68Z+C2XFf4ONzRBu9HYcvJptz3UM1zUKd90v1g1cg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 5:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Tyr needs `CONFIG_COMMON_CLK` to build:
>
>     error[E0432]: unresolved import `kernel::clk::Clk`
>      --> drivers/gpu/drm/tyr/driver.rs:3:5
>       |
>     3 | use kernel::clk::Clk;
>       |     ^^^^^^^^^^^^^^^^ no `Clk` in `clk`
>
>     error[E0432]: unresolved import `kernel::clk::OptionalClk`
>      --> drivers/gpu/drm/tyr/driver.rs:4:5
>       |
>     4 | use kernel::clk::OptionalClk;
>       |     ^^^^^^^^^^^^^^^^^^^^^^^^ no `OptionalClk` in `clk`
>
> Thus add the dependency to fix it.
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Miguel. Since the drm fixes PR for this week was already sent I
think we can just include this in drm-rust-next.

Though, if you plan a fixes PR for this cycle, you're also welcome to
include this patch with my ack.
Acked-by: Alice Ryhl <aliceryhl@google.com>

Alice
