Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD734EF12
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791669; cv=pass; b=azaGLA3ulqkRcng7z9lkT52qIXWwnv2zU3/3Ra5ULfIR/FzKxNw81gtEb61gDGc0TEvwP7AUTEKLc5qv9RhVegY74cQ+BEYG+vYQvUJHy02G+yiZxQ2lgH5Bxa2VZ3AXj3fQBeqA6+KCvOPTwNPuq32TGlMWNCeS/I95ncIB9yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791669; c=relaxed/simple;
	bh=FpWh862gEku98kCLig3c46uSdzxamRSgEzhbqtKtTvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCv1R7tTMebUW97I7J3TVJI+rnYoO1aUJaLBGJpcb2ICa+9zBfRJRqPWYcxYkGRi8e/H5JCxWrYh5FtmlIr8rd9bEvmjofAyjwIsMOySnfTZGEBy842amoy178LHWgtYMu/atucYQZ9yCwfNppWzT1tKJleXctZ99zR6az2weCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APs3Pd/Y; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APs3Pd/Y"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bda3b4318dso775912eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Mar 2026 02:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772791667; cv=none;
        d=google.com; s=arc-20240605;
        b=jqzxtdziYRw86jovqbDcNS1a4lKS+cjn2y2qBDe2bCMas7AxW9Pw6zoM1XmO0o27tp
         NrC/nHUoedZMenDy7P0JdK/IgrIERoriYMSXZCjuwFkmHnM2h8d4+CVs+BBpYdiAr1W6
         iMfnV5nd0pa65j719+tZiHzrXbOyy6jirxkxRrpCG0r2idEHU7+q3EHV0eq7UZ7u2XuW
         1NVpOcMLt4tJAuZsFXRJi3I8Uqrpzr4xU/mMvy0+nHofKSmyW2z8bol5da3Z8TEIm3dq
         pZ1lkFzwC9tRzYYHmIQRRz8JDimHRKqeqMGEhk0EsTlWDLjTwBYr6+qZJ58XIrpAdZDq
         cC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bMWTs4qndO1zee7/ID+Vcc2GRKot4BShkBFBU3cRJAc=;
        fh=4aLpjHTU1W2OYRI5S2KnMQbRYWYDmwutnDGoapJOkFQ=;
        b=QpuyO/56EYKdWddF1oBWTRRoHXjg0q15OLbaByBKgYL9MmluzYxRBn2GJnz/IQ2sTT
         AjAfJ7XOFsHV7GBCnLrMlNoxfRZxlSzvXlaHE+dJQpe5hJjFvxYvu8PKFXabD/YtrnX7
         LukhU5XF0h2+LqAVpNsRHJZOJ7XEFssIOVU9TZDk7Gx1+8W4mxA5NZAOXWhyBf/9oQ0c
         pjPOFxsdb+micEFirxOJgYEao1YyHONWlIqLYOCIr2/Bh3McIP+0m+4VmnN+Zmw357/q
         2I/+TebNkyYw7gQe5CruqYsO//fZ+jsAOTpls8xCIdKguVeSCAYiSD3a3vwvbXVVrZuc
         i2Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772791667; x=1773396467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMWTs4qndO1zee7/ID+Vcc2GRKot4BShkBFBU3cRJAc=;
        b=APs3Pd/Yk2qIARVTbwX3gq4Vn2tbe8F1F4uCQFDwqdgT7gg73y6/6yDGEy/t6MW7Fz
         I41rTugc1y1ZRJi+8vTdSEj5YXWX0g0ps5v7LTcVz0lpgZf4beicsmozcJ6yEvmwxy9N
         LZHdYSpV3CLUUnlkeTMR9RZui+5mzuscN54qrZWmY+puoOi4dxaEViGl7v6J73CKqXm1
         EO+ohYRuqMKG0pItUSg/KPDCvt2ZCifTq1jXQtUCh+mrbhMrtl7PqZ91u6WPlBovwid2
         uFC9XzEI2RiSNbtIeko9ZSXmwzRVoKnPW27pz3iyCHeISv8Y9ilcD47jy+/mVRuxtavx
         B4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791667; x=1773396467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMWTs4qndO1zee7/ID+Vcc2GRKot4BShkBFBU3cRJAc=;
        b=ihjRwWbyjH50Zd8lZFZhbAo2WJI1cXBoW1+UbnjTgHD0HUEjW0dUqhooDfRN8VqIqu
         ZU9ZPy2Y/mcFZM81ODQc7KqdUPOyQeEQALlKLI0El1ZF+HlCJceEBF1Wc/u9hPpoyuOE
         NFstn/pFCskb7IIIiSMRbV6voT00fab9U7IsInAKQivG+0cw1dvHXVvXO1v7TdQE7cmu
         GLI+9LHgY0m4wnWTqLvxDyNXK+R/LceXKjRhokwurcIJy4RGRdGCUPyKOW9g/wBE1wHg
         jkdMP23ycQ3RSxdseBHqbVyMuq7MEuEI2RYxQ+anvgbKjOdJYpCqiXbthrF4Jfp3DRZA
         e6pw==
X-Forwarded-Encrypted: i=1; AJvYcCUKxpZ19FxlWs4ofL6xSXda87gUZjVAyHObnHyDgCcjSg7BaKQKxsiRyboIzkFBsyxTIfmeX8sER7X83MvJtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNN4XC0/WMwAH/CAjcxUrKAq58hZU2wKMtHDNuaCkOogZycS7
	gpwWhD4D5VSDNGnePjoH7LQRf3n9RvFGOYCrMiRFDXCbsYqWsZQyCJXGe4xry1oXJihqDQO81Np
	kgbaa8mMr0BBsKRJH57m021dndTE/U4g=
X-Gm-Gg: ATEYQzw7y26FDTKzWSz+JuBHXxV6TrpkAP48RAvegDBq7ZjtKew8giG/y+IylUQ9IK8
	Oyla9Ktsi4eM9CJNZPd3FupTZSvFkD3dxtzhVwWxsc8tLWLGebbUVN3ZROsRdXC8BB0Dd8FqlZx
	B0Q3gUxdV86ywePxo9Xh4zOazmIwxKqOYo96f0W5W5CR8w5U5U8uLqutJM24CrEdocFRJ2bkaOP
	x+EbR0aqh7xpO9Pzm/Z40pkt8X77OGmXj680xOM6kd8nQ8ge85Jr++HjPqf3erTHq7AtXg84Gh7
	fZd+Pni8hr49UjR9GUiU4lQ29wPlbk4P+uShgDNugja5PwXCYtcTJcmffX7tUjb3Xe2xSBaAVRK
	nw6zLjapoNlfPCjDQhId4nZFR
X-Received: by 2002:a05:7300:cd90:b0:2be:1544:5c34 with SMTP id
 5a478bee46e88-2be4e09a273mr256769eec.8.1772791667261; Fri, 06 Mar 2026
 02:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226152112.3222886-1-gary@kernel.org>
In-Reply-To: <20260226152112.3222886-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 11:07:33 +0100
X-Gm-Features: AaiRm50zvPItKVKfhOfvASJU43xsYV_zn_llnCUBdfgj1_h5pAFqNBKGxo2J0yQ
Message-ID: <CANiq72nu=HNnMiT4HEFi3Tk+zFy9tZ66biy8QXC01qk7wLg0KA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: build: remap path to avoid absolute path
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 4:21=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> When building with a out directory (O=3D), absolute paths can end up in t=
he
> file name in `#[track_caller]` or the panic message. This is not desirabl=
e
> as this leaks the exact path being used to build the kernel and means tha=
t
> the same location can appear in two forms (relative or absolute).
>
> This is reported by Asahi [1] and is being workaround in [2] previously t=
o
> force everything to be absolute path. Using absolute path for everything
> sovles the inconsistency, however it does not address the reproducibility
> issue. So, fix this by remap all absolute paths to srctree to relative pa=
th
> instead.
>
> This is previously attemped in commit dbdffaf50ff9 ("kbuild, rust: use
> -fremap-path-prefix to make paths relative") but that was reverted as
> remapping debug info causes some tool (e.g. objdump) to be unable to find
> sources. Therefore, use `--remap-path-scope` to only remap macros but lea=
ve
> debuginfo untouched. `--remap-path-scope` is only stable in Rust 1.95, so
> use `rustc-option` to detect its presence. This feature has been availabl=
e
> as  `-Zremap-path-scope` for all versions that we support; hwoever due to
> bugs in the Rust compiler, it does not work reliably until 1.94. I opted =
to
> not enable it for 1.94 as it's just a single version that we missed.
>
> This change can be validated by building a kernel with O=3D, strip debug =
info
> on vmlinux, and then check if the absolute path exists in `strings
> vmlinux`, e.g. `strings vmlinux |grep \/home`.
>
> Reported-by: Janne Grunau <j@jannau.net>
> Reported-by: Asahi Lina <lina+kernel@asahilina.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/Per-call-site.20data.20and.20lock.20class.20keys/near/572466559 [1=
]
> Link: https://github.com/AsahiLinux/linux/commit/54ab88878869036c9d662010=
1bfe17a81e88c2f9 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded for few typos. - Miguel ]

Cheers,
Miguel
