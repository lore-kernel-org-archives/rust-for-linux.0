Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E81E3DF7
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734477888; cv=none; b=Tl0FKepL8V/HdSfl77j42ShOc/hM2WyjnMF8cNy1vrgfGDyF1xfqQDyzDoWReV5SJB/XnJHpklw+IR+Q8rbf67I05jWyQzuf9TvDmczXdHjJE6joKt/HGVHiJX8DTocuYxECWtlHgaW7q6Mu0E1LZKtrYN64GBsl7xrjMBYbw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734477888; c=relaxed/simple;
	bh=KvQgfBQ+BVIYcLhIxFbq7YS56mJLCDqbKxqSjD0DUU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5XgreG9PPW7Q+uZAEdW72mhgXRkRohoXkrxP4L3UlKahz7cTNfun2iw+iVKsyFHrZA2x8WLPwQ98I7gO8S73C/axRN/lnMJrcytknAVWjQ7rAl0srFci+0g0NMr/dH/xrubcnJbxH/twxTdTvg8fJSYFoDmL9CQIl/cMxbsmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfUWcztD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfUWcztD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef79243680so994366a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 15:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734477886; x=1735082686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0STln5la/n/UahFCEphTv9re/87M7I0UhdwFNwbd4V8=;
        b=XfUWcztDR8P5eqOwokTCTVmMRUTEIXWbeZrOQ6bBlqsCKN+XrF00v8uMVu17rd4Qz2
         OUlr2jYp6ItcBAziHjtzeTf0bkuL9K5tzk3PjOc+/0pmmyGpXAwLzXt386jKdCmdvfF/
         WyGVaa5vPiwO6GUEvXcpGNUvw+mlPFQ6EXbaOBAUz/v6OC9lxS9OFhyFvPxMf47ieBSc
         45fV4WDOO6Qhw0x7JD/9lf/3M3Hrh3tjRqZNgrer3qy2kLfJtQqRb2bwBEKWiyJVWRh4
         qcKajUF4H1JVBDxpuuPE8S4vuJfHaJqpUxhbfJ899/qJEfabTMQ04LFR2ZXt2D84pUyG
         fwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734477886; x=1735082686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0STln5la/n/UahFCEphTv9re/87M7I0UhdwFNwbd4V8=;
        b=UrrvqNkJ2TyzQX+sOtIqB0Pt5MDIhe2x/gPkZ3WgCI0Oe8fIZPot0gk15coshluaE7
         PJa8JC6XwGL9LI8EP1W9VkRGOljtAXHs6MZ0kpJahzQTnLRexXzIyq6jNHwRhq+WwP1A
         Mwnpbnasy0jJums9YkCaScBlVLVnvpHCJQKSnuaqE6meQgPyS4oDUHtm4K530xxUz7BE
         zdyEU3DWcXhQVaHhCVespigQ/57pWgVW0wg61hXekcOKd/6sS0ANCT9dNTIWiADTi3SH
         K/BYtua6WWkhOfeaRbUq/2Ak7zPDei2uW3G+0LnGHeZjG7yGy9/5Io7g8NmVb30C2obe
         m1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRqUTZ9YUD/ZFbKxGNJ/Cr3Dsv42s/DTBW+QxCHpK+jAiD2p5ToK6g8tIbo9PA/Zy8ZHKwdyuq/B0JEIpItg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAUYctrVq8ohZq9XRYmcRGu8/4ImCu8XIQsWf+oAr6IkgNWGem
	DEEIpUFxZUvwF4luCcg9V8QbvHfVRfHi/JlAeZaJipepK22z2deVhr7fL2/EABXoYCoxs1HAQZt
	fKcTypLiP9pVXfuCxEY2WTX/zCoI=
X-Gm-Gg: ASbGnctjBBc9KUqoVqGRPGGdPrHrkoI8s3+QJKAP+aHZX0v2AMmReRRgHg422QLac+/
	4rPy1VQhIDNxjzBPUPA7kKlQq/VCt52BZkzdeiw==
X-Google-Smtp-Source: AGHT+IEEttp0cLX2ssP3PuVWlJotPJQWlWgWVpvUglTEy2uhqMGl15CNsnOA6bEtoYhc365QLvnVl07R00TKeCGZdrE=
X-Received: by 2002:a17:90a:e187:b0:2ee:d4ed:13a7 with SMTP id
 98e67ed59e1d1-2f2e9378706mr384578a91.7.1734477886387; Tue, 17 Dec 2024
 15:24:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207112445.55502-1-daniel@sedlak.dev>
In-Reply-To: <20241207112445.55502-1-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 00:24:33 +0100
Message-ID: <CANiq72m6R3yaXO5F1O3PfwX5NSnguChnL2hTJQTVRiUMWGn_yQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: error: modify `from_errno` to use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 7, 2024 at 12:25=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Modify the from_errno function to use try_from_errno to
> reduce code duplication while still maintaining all existing
> behavior and error handling and also reduces unsafe code.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1125
> Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gm=
ail.com>
> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmai=
l.com>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
