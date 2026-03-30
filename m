Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0E83B7B95
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865175; cv=pass; b=aOwfytj+ymsKU1j/UM47UGKP30w7ilDDIGqfZV7f6NpuVqSXZHyvJXS4ONJPHmfShZzKEScSATjCMn3qFzCEnJogSI6yxKhaVbkHNiVfRpX4kYfv2aiP2YsZ80o3mS2UyPJ95gMAjQ/UcLosBnjIfA97exeoAMuYhA3nerdtoCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865175; c=relaxed/simple;
	bh=Ywd3pp+a7x13fcHT11JUD4Jp/5rqd4sY6rHeKcAM4zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaE8wEJiCa6HjLAVDv/XcAh/TO87MQQZ6v91znmWKeFJP15IImM+sVDw/0F7Q0fEPkeUgtniQuSVcoZqDmhyLibbUamQfPRhjsKuD1IBfkc1cdmukxjDibrS64ym24g5M0Az/fNeVqtCnxRdWAbynF8wkb7lsFD0Q6ctL0Ej2Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp9h3Bdb; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp9h3Bdb"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128eb45835cso216024c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 03:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774865173; cv=none;
        d=google.com; s=arc-20240605;
        b=kUUmA0Et+Fa43dS6W5ST09Z89wMpHgP83TqZjQtIaHLkV0WvH7aKejBTBz+2hhg/8n
         LPzHTGQGr8o3ocmgHexZDzK7RMw1CjFgJ9eVlqiBGxkPa3FMj5QcAbZpJFgn3cjQ4smn
         t7rM1Gx9Puk/AyTDS+Hlu9g5S5SNXbvXuoYj1di+cvbTl7a9j1fm4yS5HxzFfd9JVHoS
         KbpTX8MZOIsDzkLfGiEGx/NzEiGPnVKNR3LJ7OAKZ1XnzzBEMzMt3/SIx9sqt2svLilk
         EmbpkUuatFUwFBrX2LXzUaKuVqrCGOrwFjsRa4J5t9plMc/yU3zTqcAvoW0VfZbC3RzC
         1Scg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eY4qIAfl6MiOyTCo7+liQfaObknXsV5FGDvEx8EzJgg=;
        fh=N6PVWlK/75Oyw/AmFImZj9shpDLwthUU5W9XfJFzUDo=;
        b=a8XIOJL+Lxp2O4F0lIWg3VC+FnvvwkjsjhPLkS7XkAWwRp8/bAFt95X0kQ7jlsy4n5
         pjkgMQMWTWCc4IkWToids3fLlz25VmjehgCqbUMJI9PXdRezvWXmPDaoAWlhkIc91uCm
         4PeiG5yLD8f61SVlQRU+uzEV4iNVsi013bX2UVWTTlIsH38ysjV1La82i2G2C8ZcY6C2
         b/ZROk2SoXFxQld0+l2IQfDUww6S5nNGQh0kzVafmS7LYrGh0X0J3kctBxrcLmDb2CGV
         oLi4xJdRGh4rPJG5ueh0OfSvBqd7ukN8lIHCLXRj1+1llOCvaKv31Y5MI+756Stff2X3
         UOxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865173; x=1775469973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY4qIAfl6MiOyTCo7+liQfaObknXsV5FGDvEx8EzJgg=;
        b=Rp9h3BdbcihOunS6NYU5lOJQvDccCsPL6I1h3g1KNYxiHZdLC8yeuxNNxUiJgT+juO
         u1GGDcbYMYII/aurMEpr5pYZ1R6hSFZoolj6p1zQvX4WRjeLEZD+aJp5oLv0cTpEaNO/
         FVe2uIvGsqHS/T+vi6HyXxQrrd6rZZwKG6sEfyPob2G370Kamrm7s+6hnecuFcBS6LEW
         +M09QWB4aSpJtvhIFSONV4oLAP4ECg0U+r5BqvTXefBaf+bcCM31st+BDl5VetLV7xMb
         WklEMYTk9py+YVqfbhGGKFde5Y1xYYi3okpvH1kicPgcsBjLZmhSYtj6tthshJRBftUR
         C2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865173; x=1775469973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY4qIAfl6MiOyTCo7+liQfaObknXsV5FGDvEx8EzJgg=;
        b=hpKZXJUKQN4DcQELqmXFyn3OYyoV1i4HpI4EcGap+4piWtM+OKYRsLk6D9e0iJwmVV
         5bZwi9rJps1AfSHnPvo8nNTfH9wFxYFuAxDPyBjrW/0TdX1gwmDnlWRIuLH/tOPHmWla
         S60LVWS8NezvSgjuNnc+BhI8yib+BuoIn/+Wtpwv+37GPQwLExu7LEUD2pJIWSEoU6sk
         Iqrbe1a0lRLwDycmFj0R2ifqLsji+/0qfOIMJtmoaIcULACsa+0gOlBrSstESrCdMCEM
         /TK7GAAwa1hbNeNdrBhy9uB/a5R/cgfnCmImaD4Agztmt8+iRz1lIiXaoziT5QY7tstD
         nMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVRkpL852PaV1v2zuh/yORC/1ZjmFFeOjFOROvpaRVlNYwtVRw4Ms40lcTRSAYIZa2Jga8sqTomj995ZWctA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDkPGGFUNcuHM62Gc2Cj6xwoNIu7wR3QKRIi+tbe58GaiKjBaY
	26kKjILPi3PSdRywm4j+96rqzPDzXFkIdZGus53EfsmgvuCX3I0o1cGZ74Eu6NXUl8uZ3+wZ9XW
	qE5FJKUmysBjnl85j+dOqPT3LaSN23Bk=
X-Gm-Gg: ATEYQzxTLEG902syhYr21DTlm1Ni9gw0ImXmhcKTGQ5M873BG9WQ0QlaAs+A/2Rj49C
	Ff6I0GG9U2WGfQXD73Z+y00BsosHHto32GE/i75H8SVaraxWi+Ok1imvErsBdDH0cwL8fMPgkpk
	KKwpWJvY6dMBolzsoQn9poN09hMrM9Zv51mSgQCbheNj79SB+tEZOFEsBM9GfnA0cUe3DUPb9Mb
	EMIX00Q6WMrfAT2lYbz0v7mak6D66UTxu0G7+d5eP1+BY7DxrhR3zkNHFf3ErB1DYcPOy8u1eNf
	wXJXZLt150Yvpz7YTKvfv+3E7oOVUe0E2zzCBaFdQs8bVwZ9mbb1Ik9Iv/0t0Y3PDc6FuznZjrk
	0A0luxn/xXrxVlH50vycvTMI=
X-Received: by 2002:a05:7300:fb96:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2c4ec8915ecmr1400436eec.2.1774865173005; Mon, 30 Mar 2026
 03:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330020234.16893-1-mo@sdhn.cc>
In-Reply-To: <20260330020234.16893-1-mo@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 12:06:00 +0200
X-Gm-Features: AQROBzC3g4qfuwBhqsw85VSnp5GtlVYW2IgAIlbbBR5stdHYL4rKhoQojmHetT4
Message-ID: <CANiq72=JT_3Fz68YGmxF5V22g_QCd0k6kDqhKumSdf1n9-ZzrQ@mail.gmail.com>
Subject: Re: [PATCH] rust: replace `build_assert!` with `const_assert!`
To: Mohamad Alsadhan <mo@sdhn.cc>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	driver-core@lists.linux.dev, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:03=E2=80=AFAM Mohamad Alsadhan <mo@sdhn.cc> wrote=
:
>
> Several Rust assertions currently use the `build_assert!` macro
> despite their conditions only depending on type parameters or const
> generics, not runtime values.
>
> Replace these with the more appropriate `const_assert!` macro which
> should trigger earlier in the compilation pipeline. This is possible
> since commit 560a7a9b9 ("rust: add `const_assert!` macro").
>
> No functional change intended.
>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

These are the ones identified by your Klint PR, right?

It would be nice to mention that and link to it, so I can do that on apply:

Link: https://github.com/Rust-for-Linux/klint/pull/13

...especially considering the recently added guidelines, i.e. things
like Coccinelle would apply:

  https://docs.kernel.org/process/generated-content.html

But it is also good publicity for Klint, it may get others to run it ;)

>  rust/kernel/dma.rs            | 4 ++--
>  rust/kernel/i2c.rs            | 2 +-
>  rust/kernel/sync/locked_by.rs | 8 ++++----
>  rust/kernel/xarray.rs         | 4 ++--

Let's see if we get Acked-bys; otherwise, the patch could also be
split and sent individually to subsystems.

Cc'ing the maintainers as well (`scripts/get_maintainer.pl` is used to
get the names and email of who to Cc in most cases -- please use it
when sending future patches).

Thanks!

Cheers,
Miguel
