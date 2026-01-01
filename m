Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0929321B918
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767294861; cv=none; b=KpGrsGoYQa7YXXT8ywT/bAXEcUayBW7lRDuh8XRjbSkBNFjZQqzoA/9fziUKqVl4w7Vswn8twAZNMEWC469mVjUyTWYKPQRh/sXYzkfYXdFj82ylyZC0/JsDJSJqGWoBT9U/bhZ9b08zOVagG3TzrNvutIusgPOeuvJtvg78pQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767294861; c=relaxed/simple;
	bh=Y6vq3LHc6V1sNW+YDV/Cm7rp4qTM6CI88eI+6QHJm5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSUq9op8C6nQzFaIHWBY0LMthqBQMdk2SIA0i3icJaNeKUvrebNt+BAUulaHBjg1CGyGKDpeSdz7Sm5JndhWZo93ydN1R7NEIpSyzD3QYpFQLnWIZdD3s1s0GhuRTaIY4lMQeXa4NY8G+kqMy3KhAz+/fW7kOK3BnSeYBdqb7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRmqvpBR; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRmqvpBR"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c765f41346so5109972a34.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 11:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767294858; x=1767899658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXtYV2PbE5QL59Nl3mN/uO7iVyLZz8zE+ttqVzkuZZE=;
        b=VRmqvpBR/g6KYIBDXyVeWWXA+GfolQV5usMvBUrHnTHUhoXEvP+b3B/1JQQLg9cqUn
         Hd6tUVaU5YZ679Mh3VcLpjEUsFDGvgTZ+NMTNEUK/2UnOGBRMFdJNC7TDfRtQUJPrEmk
         zKsSHesVH0K8Ve4UeoRWVXCvcVSx9Z5SqbUXfc9SJAUEi4dmlFbxlydAlT+9dL2rbv2a
         rG3SVziigrd6qSrt2Rbfe3Fnfx+NDZyNBPPIqSZ7PWLeK0rxOwtKmlskC2s6nnk+yThi
         BqLQjDlJ33B6FFV4Zj3z4TkWnQ/BxA9fTjH6Gdi1SYSiB1+Z2qON4jN45GG8Q4zUuYQ4
         Ou/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767294858; x=1767899658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xXtYV2PbE5QL59Nl3mN/uO7iVyLZz8zE+ttqVzkuZZE=;
        b=ZCg+K+VPqpG5VViafPXFtTQh2VnKsrYBLXRNQHdDSuMJzzzFWPuuCp3VeMsJU5p+x6
         wwkVCVgPaBaZm8F9f6Si1yWv2H17F008YP0VQn3YGZUHoVUyqij0E29p+F7/IQwLt8Zo
         0QIKxQYaiveZvWeUdhWvSHH3AOOmHZyjTO7+GxWl+FiXrpRPaS8QrGDWiT4NpSxR49dp
         yVeibNWU2hm8zZojlM1KIUJdjbD0PIdb6Dw3uTjOrkJBryy3V4KSOyoZp8THu6rwb0cO
         p3AYV/mncPdCgNApcb3CdUiUnSzQ8RUGVPScCoL9HMv/A7MW5Jo1aLwnRWsYOiMHDnnZ
         yzIg==
X-Forwarded-Encrypted: i=1; AJvYcCWjgrrJzYoVvRJneVHrr0xd6XaMaabKRmp1AQylmyZA/IE215TiCRlMGRxyl5cAfCfrhA/nuoZXwm29p9TTVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuYZk3pJuZwxek0j5nIKF1j4BUGVsEiu7/slcEQ6xETgCoLmDX
	kU0fgDU3tvVg2+knOv021pHP6gD5epIXivyhsme7ePlPpT1909siVUCA3snetB74
X-Gm-Gg: AY/fxX4sZkcZl/lHXEGdhhdiej5jDejbKjHcp8bybu8Sb+WJdh89KrAD3U98G5PCGkf
	GfxaJw2YDGMtwYTD1Ad9YElyS6a3BBzRaMIBkM/+QMzMVt5z974NNeJRWdRo0jDbVb6DIUHiiNh
	sKBDJiB3pzIZD7lW3i70u+ymXvdQ7dwrz+s/x3EUyRtw83mppisds/issPUGNeTZe0RaaURtBCm
	eUOUGFBHHSbWe6U3rNagbCqI32M3mbdsbwQuAfyVouEBYnjiIHZmH1+w4FxtNAP4mdKjItsuZ+z
	1MobABNSCB+mH9gmiIPuJQRTyh+gpHLHHqIARHTwhOqkQE9fxbbFJXMn34VBIWjE891PlUplv20
	aeZIxOUE7hHG+jQRyKmPC3BZcjLzp/3QRnIJCnKYYJaJQN1yWrwy26nVNeRxdqetM17op6FVQ32
	KK/ik0Fq3bH2NrSJsa0XU1mewM2aX8U6vsIofJwMltfeMDfx6IkTpAfwAAVLAEzGyc8wc=
X-Google-Smtp-Source: AGHT+IH7ndqli4Eo8dhHNRbSnU/uq0tRV2qujZxrXwf0PJfPcIW0AjKqNjnhsRws75sS2saU3fz6Fg==
X-Received: by 2002:a05:6830:82a1:b0:7c7:8280:9208 with SMTP id 46e09a7af769-7cc66aad8a2mr20300033a34.38.1767294858536;
        Thu, 01 Jan 2026 11:14:18 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673ccc2sm26881973a34.12.2026.01.01.11.14.17
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 11:14:18 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-65b3d3ac90fso3947226eaf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 11:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcnJ8efhCMiE4hyFrqczZ3S7NFPRH2SVshRTH5TK94br/oTfIQz47xTDyKbbwEYYrd1y77Ma0WfjiZgPnuGw==@vger.kernel.org
X-Received: by 2002:a05:6820:2e95:b0:65f:7e:ebba with SMTP id
 006d021491bc7-65f007eed69mr2318389eaf.51.1767294857296; Thu, 01 Jan 2026
 11:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
In-Reply-To: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 1 Jan 2026 21:14:05 +0200
X-Gmail-Original-Message-ID: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
X-Gm-Features: AQt7F2pyKzfRqjvjOSv7dGFszvh1Q92VPqyQRLryYE6URPhELapsXaI0ap1Ov4U
Message-ID: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Jan 2026 at 20:21, Filipe Xavier <felipeaggger@gmail.com> wrote:

> +/// // Combine multiple permissions using operation OR (`|`).
> +/// let read_write: Permissions =3D Permission::Read | Permission::Write=
;
> +///
> +/// assert!(read_write.contains(Permission::Read));
> +/// assert!(read_write.contains(Permission::Write));
> +/// assert!(!read_write.contains(Permission::Execute));
> +/// assert!(read_write.contains_any(Permission::Read | Permission::Execu=
te));
> +/// assert!(read_write.contains_all(Permission::Read | Permission::Write=
));
> +///
> +/// // Removing a permission with operation AND (`&`).
> +/// let read_only: Permissions =3D read_write & Permission::Read;
> +/// assert!(read_only.contains(Permission::Read));
> +/// assert!(!read_only.contains(Permission::Write));
> +///
> +/// // Toggling permissions with XOR (`^`).
> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
> +/// assert!(!toggled.contains(Permission::Read));
> +///
> +/// // Inverting permissions with negation (`!`).
> +/// let negated =3D !read_only;
> +/// assert!(negated.contains(Permission::Write));
> +/// assert!(!negated.contains(Permission::Read));

I really like the OR (`|`) operator. Personally, I don=E2=80=99t like anyth=
ing
else. When
a function or expression gets longer, something like let negated =3D !read_=
only;
already feels strange to read.

My suggestion is that everything else should be functions, so we would writ=
e:

```rust
    let xxx =3D Permission::Read | Permission::Write;
    xxx.remove(Permission::Write | Permission::Read);
    xxx.toggle(Permission::Execute);
    xxx.invert();
```

This way we avoid expressions like:

```rust
    let a =3D !(!xxx | yyy ^ zzz);
```

At that point, no one understands what is really happening anymore. People =
start
wondering whether operator precedence or evaluation order matters, and may =
even
have to go read the source code to figure it out.

By only supporting OR (|) as an operator and expressing everything else as
explicit function calls, the code becomes much easier to read, review, and
maintain.

    Argillander
