Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372B344102D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386278; cv=pass; b=t6oBkvP4HN1OB4sawxF1onBk1AYcfYSxome5l1QHgvR9n41TKVxWLpd0/gKMYTh5KnEVdLy+EN87aEd+XMk8SCgWcykQEGYXnauuK/ARwW9AYO3QUQ1cuYQewZUvylEjAmcS5x3aFoPfXFrmg4ZSk3biyXB6h/KqsPFX6/Bs+l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386278; c=relaxed/simple;
	bh=4yNpZy+oYfEbjNcGZD+3HxLx+++d1vcJpRwtvYoxAa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtbI9aLFkzIzh1qu+IR8n5Guw8ruFeiBvskl03IaiXQer5sLUglfNKLiU98lfnGwbVHRVo9wY8vUuV6LxGyEEqSKwOjSp8jJGPEF6z1BtbqBCUTqAbEFRb5dXJOl18qvLBskBT6hOqY6oL0vIHIFWT8YAMG+aQbwqXiw9mWSjY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnR5E7ou; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnR5E7ou"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-66ee7b9af94so4642037eaf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 07:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777386276; cv=none;
        d=google.com; s=arc-20240605;
        b=kjo6htO2xkN0wsmv7gOZ2iGtFQBT/8REnk6wXdrWegf80PMjERVoXaJ4iDJMWGJWDw
         li9jQ76y6isTvknLplsQQkfmpCyAgWY+bpS8ESdfjrG6kWjcTutQ7sH9BjWnQWQc87gd
         /4XCoEck9tgEDvwrEtQOS/e7Blqq9nc3oTnojXFI1PVq6N0QW5Q16RGfqwx1W3wu38b4
         0VwxFfV0nTKaLPtWn+V37rLplpA15VoQ/MjRFEuOrSeqdXAwZiIvv/hyM/o95ZCroryY
         Z4RKK/LTB9gEPiScpvEaK7JdCMldkLe4L0X7TIrFFc/WJRPJ3yry9kvfDN+ypiPZZbBz
         owDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poXR9fU0NI5gibuUd0ZTjajCpgJTS90JLbJb1aDULwA=;
        fh=EefRRng1JP+yoj0HhIvo/j9H064nYzO7tU3p/8TIiDw=;
        b=hiWrmcMR7lLqrfdzIPA/y+suQ788uXW4EuwhkWZemfrZBCmIl97lzjHB4Go3tgyau0
         ZAb02qjlNLpknLRj98yljJks38nnj179vccyiz73y/mHly2s7MVphPA6nB3gKR+Mqvin
         xnbmWSTa6PMWkj9qHWWQlnQGdpnl9yE8CWlTztlZs5W8G2RuGgPkgx1WpEMB3UREzaOh
         Ygxx+0F92eNDDnmToGcDGUHFx3ndd7qTIIo3Zuf9UOcwig7MzwXsbhKIh8JIgCudIM/b
         pFt9ygV1uvrdJtNQKkuhWMpqu7cuAXHOiCqX1lG8GmtwQE+l/JrwJ0+qjXHGj8pKr62m
         K4SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386276; x=1777991076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poXR9fU0NI5gibuUd0ZTjajCpgJTS90JLbJb1aDULwA=;
        b=SnR5E7ouzQ5WZFkIlYJMEGA6HgOJU+p65XDr41y/GRqUEUT5ZRBsA+Xiov8RK9DskO
         ei7fved0wcCUpQe1JVEF+Wo8YjiU+qca5UQEKpqYRMB1jR4QGxfb/5OmIuiHZVQuuWdl
         uUpMcRbaW6zgiqkIRGx54gJ1f90YJOIt5kQYEeumKxM53EqswPBAMw2jP/xdh1A1+2MB
         hzUZE6lS/D0XkYW/jZgFyjD9ZSZxSW4PK/S3QhOb82C2lVdvDpcxdoEEWkDikW2dmlEq
         d1Mw0jBbiI1UCwKLJquS8dcVWLuLuK8J+NGKMeRYd/QU/k4wiRr9Sj/te/3omyPPe73N
         iQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386276; x=1777991076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=poXR9fU0NI5gibuUd0ZTjajCpgJTS90JLbJb1aDULwA=;
        b=reAMtRPeVTAreyvTfmirth6HGKAHEhy9Wi0HfSieZeEccz3VHuYhq1EwQGTVyWhep3
         hWBMJ5B0tMj5F2DkT79QtvDOQWFPA1zmzrqrLNCeQPjiUkO+Uk5yHQCplQrZvZd9GGou
         b+9oVm3fZbxLnsMNd29hiwLbAJ1S7UkQZwVtYPuajcwJFYLJ7ele3UNf1CZW7ishdgzL
         VxgZDPHHBmLoacOd7GrXQuqX3y0BcgH6Ar54AwYer4EC2DCDkQIia05k67Ur0C1QtzQn
         Q2zUhXJmISxkWXWyk3Ubec3BrhnpGWl5rFoucvNVRwU3/zU6n8W37yhDs2eC8zxcNneN
         pjfw==
X-Forwarded-Encrypted: i=1; AFNElJ8c+cOA+mty4aLMmZVan29S00nCDTnP2FgtisaoeoWCOMqqW9ATDAu8ZtMzdUmvYXuhsV/Ppf4ZeOg0MxWG0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGImd0AdgvOfQ9bkOsWr2HSzETILbXrshQVkjZHQrwSuYfcHr
	dMSue9szlhnyTgIuWZAn0xLNU1rnfkP/0wzX2RHaHcyDRIUl8r79bLSSRkEGg7V4WDj3yeI+0EE
	Aee9Z6KoJX/ZIa3+aC3aiL3b3QVDSTxI=
X-Gm-Gg: AeBDievnjLs1cN2gcdPYss1ApQljsTrkRc200vkOIN1yb3JCtm2L/o9TP45C6J+FGZe
	TIaSSUZrd5t7omgETMMZdO0cQM8K4KHFeGqnAItiN+GX5E5HHjpZ/3Z5miLhgNjiOP/ytusWfqG
	R98mwDri6BkqeF68hXKLFi7iDNvW0XOrOL3RZqeu99/5PpXqTQOw7lCGBzdkAftZY5BQNKsFNt6
	n4FkBwjmwLpOzw4IW85tbMD/TiieKoE0vJHGHNBvwBNL3SLO9Ontpw5gzQ84FgLnm56q8xf04Ut
	odM9g7AzpCubnzTGTA==
X-Received: by 2002:a05:6820:2109:b0:696:1882:dd04 with SMTP id
 006d021491bc7-6965cba1584mr1473232eaf.52.1777386276206; Tue, 28 Apr 2026
 07:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
 <ae907fWOUEoIl18K@luna> <CAJ-ks9mUHw57S0b3Zg4WWa9yDYaD-DtRpj4PwD_X30+A4iQWOQ@mail.gmail.com>
 <CA+tqQ4LvnGAsHDXc5yXfC5E2AwP9TP7h3UOYoL3YCF=9vY8_gA@mail.gmail.com> <CAJ-ks9mTbkwwQzv8dC7DUjpanG-Gd4LU0EoGgzroZWzh2OUiZA@mail.gmail.com>
In-Reply-To: <CAJ-ks9mTbkwwQzv8dC7DUjpanG-Gd4LU0EoGgzroZWzh2OUiZA@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 28 Apr 2026 14:24:25 +0000
X-Gm-Features: AVHnY4IeiTFDx6FtFBaXsN6Hry5_Tvvp2uOltZuJRdGAVg7fhsYQzAcWPZKJzUg
Message-ID: <CA+tqQ4L-MEz07Q0BeXfC0CcOE7XwMn4MHtLXk3XydRv4RjXy-g@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce import noise
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Link Mauve <linkmauve@linkmauve.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 1:56=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
> On Tue, Apr 28, 2026 at 9:36=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
> > Other than that, given that declaring all imports at the top is not
> > mandatory, I wonder if we could just conditionally import `ParamSpec` a=
s
> > follows:
> >
> > ```
> > from typing import Any, Callable, TypeVar
> >
> > T =3D TypeVar('T')
> > if sys.version_info < (3, 10):
> >     def wrapper(func: Callable[..., T]) -> Callable[..., T]:
> >         def wrapper(*args: Any, **kwargs: Any) -> T:
> >             return func(*args, **kwargs)
> >         return wrapper
> > else:
> >     from typing import ParamSpec
> >
> >     P =3D ParamSpec('P')
> >     def wrapper(func: Callable[P, T]) -> Callable[P, T]:
> >         def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
> >             return func(*args, **kwargs)
> >         return wrapper
> > ```
> >
> > In this case, we don't need the `t.` prefix.
>
> This would work. It introduces the need to be careful about unused
> imports. Do you prefer this?

Yes, as long as you're also OK with it :)

Best regards,
Jesung
