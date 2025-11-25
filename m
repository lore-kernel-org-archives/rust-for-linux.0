Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB927990A
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 23:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764115068; cv=none; b=Zh/PZoUCvwx3+KsXeiISIP7rNAXIsNvHxSDWwtRvxj62YVwmNUA8gxT9EuV6LpXM0HDdOFS4/kPHdEKhXjuZ2kYvYnqPFsOH06jYCmOE5j9MXuBea+P+3Kc5mDh2X1GruEW1u+D0H8NVXtbGeKmC6yARRS4WXOOgbjFCyrcQviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764115068; c=relaxed/simple;
	bh=fIKWwQtWokh6YSmZU+UbURYuTzV4z0GjZjY4O5tJIVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpxHqp5YkZXscEt8nMLCVTHOJu2XWKMpb8dr/0VbGCFiTDpCrSXUMd4GLiACb5aJirlY080SL7yKOoYi9th42a5vTWPkyBGdrW7lqpMev4pZHUAZsbISiisPk7nNOyiH8gyBBWXB6QMVuUHkFtdOV57CCeG2cYtqdX07ANaOZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbjzNWyU; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbjzNWyU"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b983fbc731bso686667a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 15:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764115066; x=1764719866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w221vXVQmhPwqT0bxaSu92/KGahTSJh5J6FMtGAjmgE=;
        b=HbjzNWyUrOUXOkkyX80OvYVTfHId2Wqysp/+4+4huGYU8S12q0rDmfUovT5OoXD5Ih
         V7fSOtACgu6lr74rZgmAAMV1kyv/0Gth6ZFsa4YT+WrXDvRRNJpBKETx6QzS6ui4pyrv
         8HpCYHCL+kuL9O6fZnvcW70vjYR5dlFXfCqnBuKZXDIQy/+B6QhZJy//zwuC/iqhIJxQ
         LtF0zD3hOSc/1FTPRDVYbG0mVaPf0GqAhmg+quiPlhwJzwUf8a/YFS08S74cKzf0nst3
         7ma8CEhzdzX66nLkfgRtVPGdD0oQBCA7rBhD7ZthFR8KhKSjlZJKiXgU51ZJOqQk1eKP
         P4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764115066; x=1764719866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w221vXVQmhPwqT0bxaSu92/KGahTSJh5J6FMtGAjmgE=;
        b=r96i4RNJApK13TAcx/QRLCM5/wn7rObWFZXLbBILasm3E//0mOJaFo61CJabiFHWYh
         QS0Y1b2lGvDfpwAblyNk+UDJTRQUOx7zUjDOI5HAJo+oub1z74vv6lrLCIJtscLRHRpU
         6Ej5lgA3yxodDJeZjvy1IP4HpYHTE6hxcrH6bjjoAPTEuWiLoC45ysIIbI8Atdb6K3ED
         NrrxZQ7OXY2iEdXNkpoiwRgOsZJJS+nlVQpWLEqO6OQuupShatysSv0DwDINCPnQIjgV
         ZGub8kcQrxjLvLFjWauIx9ScSk/Po6a39biTYIm/XPrWpuf4Yd1Y5MnMrG9sRAU9uipp
         7iAg==
X-Forwarded-Encrypted: i=1; AJvYcCVRMLwUPhPHg38J0NpOhPUgfl6286WKeikeXso5v+UxNo8HHLIHzR0Kwju01DEzrAgq9ypMw+qDA8mLhEJmMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEELhbqawvVWiCDjLqCinCkjXnFOpppzJabaAw9hxlbuNjtTGE
	k5K7w9OI7NVi0vgUuVwNSjTnOmtYY1PFaFC19V0s4QHZdp6qpZA13UeuurSr1pmwKY8IDoiKbHs
	G2G5m1OKZZQoJ8Sc3/rC7IZT4bFhuzSU=
X-Gm-Gg: ASbGncs+YHVT23rt4lt3JUASEsylI3fbAx8usxxWiIVTQnm1ZtMk4lgMKHv2Z/EunMh
	gST7DkYYycywBVaC38+l1+j3TrDhguC9IkTzQ1/13IxleccDCIuD9eXawK8AfU2nl0K9Ku4Rz/F
	sy0TPx5MTPkoHrj0SF6z7gsDo7bHwLRYVIDC6zdr3JZPcUlyunMX5hvv28wB3lDklldJepf9L3u
	XX2gvRBjg8ngoRlnsxDvzskRc2qjuXbNQ2AlxFzVheA8EBX5tA68PNLTTK+H8LfjzJvrboVo3G8
	N43A+/seglT1OuZXim/yDN585h958kI/lTEF27QfRgPsRsJEc6/981q4yKD75+DBHE3zAJZ5XNA
	9qJbrdIkvPJ4QZQ==
X-Google-Smtp-Source: AGHT+IGrSYCzRZQY97rFHXVKF5541gu/Nc7DtuoLeI3I+3HZbcsP4Q9CXDl/hWv4dvPxItkLlNjEDm47JSy539dAeCc=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr10484808eec.0.1764115066324; Tue, 25 Nov 2025
 15:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
In-Reply-To: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 00:57:33 +0100
X-Gm-Features: AWmQ_bkAIUNW1BBMUeHiPzIi0-6yeZETxLDbeIf-9F3_HUxGhdwx4K9H1bo6Kkg
Message-ID: <CANiq72nFu2vX7vOWtjutj8574Jy2eGvj87ryhhY_PxFHWSOh+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: syn: make rust-analyzer treat `std` as a dependency
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 10:38=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> Fix the `generate_rust_analyzer.py` script to ensure that the
> `rust-project.json` it produces includes `std` in the `deps` field for
> the `syn` crate.
>
> `syn` directly references items from `std`, so rust-analyzer should
> treat it as a dependency to provide correct IDE support.
>
> For example, `syn::Punctuated` contains fields of type `Vec<..>` and
> `Option<..>`, both of which come from the standard library prelude.
> With `std` listed in the `deps` field, rust-analyzer can infer the types
> of these fields instead of showing `{unknown}`.
>
> Verified the explicit uses of `std` using:
>
>     grep -rn 'std::' rust/syn/
>
> Fixes: 737401751ace ("rust: syn: enable support in kbuild")
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>

For something like this I am tempted to rebase, but given you took the
effort to write a nice commit message, I can apply them.

Let's see if someone else can confirm this works for them and gives a tag.

Thanks!

Cheers,
Miguel
