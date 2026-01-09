Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8646343D91
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767998043; cv=none; b=PmWBWJ1MjFckKNXjxO5tVyNnlYK8gZcrso+vROADXCFuH2ah98oXxa4DIxpWmWwfiWsadU2ggF60NbGPlf5z6mTLpsTOzxMFYJMscK2cwqH+L+Y97dHlPY972/y7S80Ixf09znk+SIoqoVmBGUUfXNVgdQLSOW0CmVY0OJunnAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767998043; c=relaxed/simple;
	bh=rQts7jv3Iwa00/rg05UObeLuZ+r2SxzJqJLTy0opfw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=My/riFHVsWoinWvSQRYtp0865dSTr7LrL+NLjR3WWxXaRjTQk8Gsx87W6xHIjkfp6yHB8D/4uDLG1stQqR0jhLYcSdEHDGNYRD5RvAP4xxJJbJqpfbct3uC5chMTlMf2L6LAYPRu0NdvwVw9dnKM+M71Wc8uhb7kn95A/BgJj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6IqQM22; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6IqQM22"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-65f67f56b81so478896eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 14:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767998034; x=1768602834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQts7jv3Iwa00/rg05UObeLuZ+r2SxzJqJLTy0opfw0=;
        b=F6IqQM22fYBHM1C2Cum+VMj0c2c//7S4Mlz0hB6BPYqOutHi5aVd48HWNP+2er0W5Y
         026tpp5bI9vq0sKOiyTG+VrXTUmPBpiyeWLk8luHdN1heVw3hVXzwesWd3n0vBuH6wdX
         Xp/x0HaCcP6Px4K89lcn5QLb3lqKFcjEihUHWqrz5vmymNrn/I3CgdHLxoh0krZk1Y7C
         M1a39HmEVajE7/i9d/0WdxRt5NWqf/ZlYP5OX7iapa5tDnNsOZ1VhGeS+om9Ipgsd7n5
         a/xKAqq2xxhlk2IFqQ4XtTnWYKcdTW5/3fAM6WqXJwcLyDQBjcA/BCX0c3WdBRc5TPeD
         puEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767998034; x=1768602834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQts7jv3Iwa00/rg05UObeLuZ+r2SxzJqJLTy0opfw0=;
        b=HU3YaBvmPbC0+IrNLt3R3wFSJbeXwDPTl9UWHbJaMlomCLdi6vCdHrZxdFBc+53Mus
         5HHHynShWcRkUyymqkq+I5F3BQIjqKQ74HVTYmjJ54rKfIurnzaC9qgUuZclh7fM2Zi8
         4LEgtoD0pcUljKSxXpSxgpXMI+oRkNHrmvaxz5D0XwW1GDNaUtKvNLYfIB9WTnuECpgu
         iltTXuNTdmEP2Y3bQC5MbjuJXnY+5xlrbOli533huVghlN7i5ydUrkskWdDaFvvaef1a
         Mjf9/SXJZulVq/WV6kjEyDJQLgQ4JrepuOCYKHOgkAGsgqMjlBR6Dt7BiYkW4cdCanCr
         jaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6oZU+/uRBIBGmPN6RBqJI0+jNdOHrlB1EYvs+aAmAW3Upjxqm/JO6ATGorCAziX7UwI035TsyMAWyLBSmDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG70lusAU1EzIzRTjOZOl7/Sa6/Ml8yZTq0o4A4SAA3NCS1WY0
	lVQ3/IVGAjAgDKTgiDGs5XkZMltqafW6Cw3zW28Gesr/5YwFQ8G2u5aGBugBA32xigj1/fHecK7
	XM3EDFSZvNikVWflWOZIXftXHkGXjCKc=
X-Gm-Gg: AY/fxX7cQVDxZxWetqKtamCnrimDU6dgTV/yQr+za9Jwx3NvT6QkaYw/FnlORQay2sS
	ffTZ6KpHTRBoKYJmmCgITvdZfhITqJ5W3Kzl8sQwUdsA3SOAWXWCok4/1APNBE/qgKSNjHdlA74
	oUCGEZF/saWvfrhIgPn11jdk54XvD19dYqtDKjSttNewElj6so877nP1O9XnSoTE/g4PV7tv4jE
	1ijY9KZ0R6Dtz20WyfntXCc6PyB3GxsF5UuRyD90On0gwhH/m8p24ZUZrwIaCFwu+X/cGI=
X-Google-Smtp-Source: AGHT+IGB0FyviT1HCa4/7rPxaRCohZ3yD7I3iR2M4tBOQ7ffDvnXfQrUx+lpLcJ05c5acAUZEfWMlxlMSFZ9fjc0nF8=
X-Received: by 2002:a05:6820:1c95:b0:65f:71ec:4ec0 with SMTP id
 006d021491bc7-65f71ec5a07mr51099eaf.56.1767998033658; Fri, 09 Jan 2026
 14:33:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
 <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
 <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com>
 <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
 <CA+tqQ4KNPeyAkUbrhzbd1bGSCFSRjOYGNiAjHi+6F1OzBgQRUA@mail.gmail.com>
 <CA+tqQ4+kGwvT80j4TvFq+Dy9ztm+yu5nTT9TLAznG0OQ9F28ug@mail.gmail.com> <CAJ-ks9nJhRxto-cAgz_JL=__fOrsMqC_W2Z7Ob_EA6sY_xPpCQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nJhRxto-cAgz_JL=__fOrsMqC_W2Z7Ob_EA6sY_xPpCQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 10 Jan 2026 07:33:42 +0900
X-Gm-Features: AZwV_QhRyHAWtnJ1TzlrTyQkns78qKXHIN6Q9jrQmc2zh0cLtIm8BmqICUR7onY
Message-ID: <CA+tqQ4JwDvfThvHHFwStPoP-QeRyjx-XxCo=EtvzNfUb4d576g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 7:18=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> We have to keep the std dep -- see
> https://github.com/dtolnay/quote/commit/009af09c8252bf687e7f49e281fc47bc7=
d3c0749.

Ah, I see. Thanks for the link.

So IIUC, this series is good to go as-is? If so, I'd appreciate your
tags for the `quote` patch as well if you're happy with it.

Best regards,
Jesung
