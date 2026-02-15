Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBB52D6E6C
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771157589; cv=pass; b=uiVMw7sQilqwDlEH6/dmVrvbmp+QqJQ1xC3rjHxOigbNX/TWXzEAkYjgOctukNg3zcB8zJ1DMhcZuE+Ggz4M33bc+bYoCeJpdO0C/Nlua/VjCJ7y2ZI0O0udpduEqk2mQ1p6HrCVpSHXVNVX8ESncBfp2E9mSG27vLKO5tYzP0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771157589; c=relaxed/simple;
	bh=qSAmdeJlHjKlaJHrzEOHU5tETladV6d+lAVprcl30eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vhy6huPk67JNT0TMtQpNW19mG4vRExs/A1P7gzkweGDqzeG8mGDEcpHdtxC+ArnNB5iLYXW31Ge39doa/YFll9FWiikQU2lhorZPeqwZobrrCZM2HDVX3rbpm3Q+zJ7wePdPK9tI/M+fQx8sMYNZ3yt1xC1ryET2flM+T10Cdf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CXwjpvBg; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CXwjpvBg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4377174e1ebso1650008f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 04:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771157586; cv=none;
        d=google.com; s=arc-20240605;
        b=HBzE0bLfMwN0QZWjfQw6Ytsvmv4DiNfjCVmQtmUM+1MQpAhu6oH5VMkJ4xEFG0PbkO
         kCtoGw/awujWJ1+Q1BIsyTo43EGrM7asiuDGEK7VeTJOC2kONe/QKW/DSI44yNXTS8Z/
         U19rcMSwBwSjmDxXuDxLnvRq0bmZiwAGwcldZej0c6EtkMy/3SWAvLJQ7bbMo2Xep2Qw
         oJ6UqDiVBwHdGDjsJGUKaqwyeyI9s6hNhKIfjjCS8ceAR7Iq2MPDKhEpkfVfOSnvnlSE
         +BHnOWK+YhUQ5IEpbumQPIbldoG0kOb8SUNpcIWM5WTa+a7Vw3wpNN5TCpnsBbMeGFMe
         rbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSAmdeJlHjKlaJHrzEOHU5tETladV6d+lAVprcl30eI=;
        fh=0t2IR0GZMk4TbhR8mzxuFJbJGy4WuLZTgBC0NZnT6Zw=;
        b=VYNBIQNZlusPkiuFMa8ZLtoLt1OTlkTTW2VuiNpQP1dZ1gFQBu8tHySwP9e9OAyXSS
         G9IWAN/GGp8+iIKBjuSyMHTluAwiiUQs88PW/xmcpqi54M1sBUNMEqeXY98P6Bk+zfSU
         +qJG9aTctxaknmQuYPH6Fhcsq/aru7R8aVcNLIXSkt6y62+AjzS0yVv7qf/AOpbWYatO
         U523PZPCuJptz6tu32Cliw9LW96fjNuZiUmCokQkW+4BEcnL+9aC6MzEIcRj4vmeBouV
         9qUeURmXEZ7l8571/k9RZNZEYlyanxBBZn71trbiTOu9zTxL0cuS2sQjx6rQF2PMv5UE
         fzkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771157586; x=1771762386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSAmdeJlHjKlaJHrzEOHU5tETladV6d+lAVprcl30eI=;
        b=CXwjpvBgGwkMg+IBYSIhpuqpIUkk+zln8hHHqLWn3mU1wKZ5jfwHfVuMG7Rkb3kBjc
         V4CNACjYj68uQD9Ccx4jKB73n8WWVaCKKFC+565RLU1xtAU3mjichxKs58kzeE3ToPxC
         6kkD0/x5Q6//fiXH5z0ub869kuuyTohMOw+k8QIER6Hr9v5kpSUR1JSvT6/8SAdO+8b3
         B9bnbNmNQac+fqG5UD1ZiXba7cxaF7DXWXecPP9jfdabzkEfaPj9W655LoZnAhnc6Rl3
         4m3yMnJr0EOd86PUaT95UMWhlF9TluXkVGyOqEmOGQMcaYn8rfWyRiYYT4v58g/SRUQv
         TkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771157586; x=1771762386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSAmdeJlHjKlaJHrzEOHU5tETladV6d+lAVprcl30eI=;
        b=fJ07KhB7NOraKoBt8ZEvxmDs8zOwOxTljEROlK7aYPDKAyuM853RLDmh2DC9nN3UfW
         DP+7apPHDPLTMa0kNSRbb86JAjFPVDYT2YCXQ6lC8JXA9kSJlBeXwAWjAGd41DBoK/6J
         9wANxzGE8fvGC6SiF8+6MNU3754hUr/T/yTbVH6Nkyz5F+dzSMZ/PY35eicFJVXj8C2R
         UPNG+Jj0dSyRmZxL47z2KRecQsw4J4CwocOzUIdr0IXBvYlfG3m5pDOT5y2iMUr5CbYW
         O6OR5MPwJQW88J1Nr/0Wp6aF9wycnOdXDh2AHQGYGxajyG8gp5W9OnRy7BX6t6kc7MUh
         OnMA==
X-Forwarded-Encrypted: i=1; AJvYcCXhL/ygrM+gIvVIjGrhFZ7TV6U1WAKyHNgSC+gXWFuQTUDfpz26Lt5djM5LCayPWRIOBAVg3+QErDqL9sE/4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxadCS6S4MuGSAOuj8bgWt2QUDjhk0FvDEg5jzqU2SQ+qeLwSmf
	lw9NpqHR7M3jwHfPzGvaRnZFIgRsOfUHj+kdD78wUksLKorXXSEPY5/ipQjSP0JBlQ2Y0wL0eQh
	p2wivy2/wHD+ZRQEaIrgzfB+LyZTumLZF0vPq5hjp
X-Gm-Gg: AZuq6aI7295JUxww7FPR7fUV8GhtcAWy6f6xoXkxSAvGpSThgra5wypHJJ0ZxvUp893
	Hy0DnqFpu6YyDFik2ODQO5FdvV7a1fBiVpjSttUoEVsFGIrZojlljXv4Bt+p5g2w7rirBAYdPmx
	OQ14KESDAK9iBo5lizkYh+kjKBvoz+L9pSLfGIwUKTQX9oN0CdK3sHGkV2lgJY70uXzpF90D66w
	KarQX2+ZSkfP0vUVHV6kQ191SY6jx/+WWJAxtcuak1/p+11Q0x6meMiQJb/U2IG1hdwKCOY9Y7p
	fCEvCfcivSaB5qBRYrIEcwJBF/UJwzRgMQxf8w==
X-Received: by 2002:a05:6000:1843:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-437978dd2fcmr13060737f8f.25.1771157585790; Sun, 15 Feb 2026
 04:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214092740.3201946-1-lossin@kernel.org>
In-Reply-To: <20260214092740.3201946-1-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 15 Feb 2026 13:12:54 +0100
X-Gm-Features: AaiRm50XU57GG8uzYV-m6d8_GVEAmTy4AzwQ6NCybKj4qqICJjxdll12xL9OsUA
Message-ID: <CAH5fLggZ-sk7TF7bivZ2fvqgMPsF_DWvXUksPxnby0jd3Y9Fhg@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 10:27=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> These callback functions take a generic `T` that is used in the body as
> the generic argument in `Registration` and `ThreadedRegistration`. Those
> types require `T: 'static`, but due to a compiler bug this requirement
> isn't propagated to the function. Thus add the bound. This was caught in
> the upstream Rust CI [1].
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/rust-lang/rust/pull/149389 [1]

Would it not be a cleaner fix to just add 'static as a super-trait to
the traits directly?

trait Handler: Send + Sync + 'static {}

Alice
