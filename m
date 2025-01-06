Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC591DC991
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170877; cv=none; b=GgtqW5rO+PBDV5fE7FY8AEDBTmjXeOnlMsxM4PtixvHMf7xkuxS7qomC5EmHqfGDpA0wdEWRjhevdFtJbOU50s4p5EuFN/nf5ePx++zezpDfq14+S4n+87J7UleTVbgYQm/OMwjJ8MHdZv+ofkbNcWM97bcBO2DH+jAUEzxqWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170877; c=relaxed/simple;
	bh=gjIamJuBBm++BJvo5hYVeBmdX+Ylca49J4UsdA7K2Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRl9d5NrFNzstXVPShdRR/3hgP7Bz/ATM2Gv4UJPWVhXi5r9XnfGhGk4ZC1C5ElQb9W9TjoZLWCccV5K9j+dyoVUvd14FsU11003AjmOvmVTkIgiYRHlfLsRkKP5XA3aj0bxS0kh+vidPNmbqhnxH/9b57cCLd781heCXHGEUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3WLHVRkU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3WLHVRkU"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so20581758a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 05:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736170875; x=1736775675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjIamJuBBm++BJvo5hYVeBmdX+Ylca49J4UsdA7K2Hs=;
        b=3WLHVRkUqwDwNFtIab7UZPdFn9np5kzGnGxpVATh35+JStaOmTyIy6opjvhEiGxEIG
         wyqxMsKegD2Q7bqjYOP4Bz5At6cTqdLFT2IU92LIgHXId+OgSiwpaYHOAn8lZjfuXEfP
         jJ31WdryOJ81ji4zylrCm2rgo69zJnd8ltBY0yJ/4XMcgI5OtXnSHYObOZfmGg79k48y
         xE3xN0pfbLWRxQIkqo4h0WVh3MDtmH4b3o+8TKw5P4i5DO5d1bfno3OQ+GiWXiVIZbmj
         6m+26EKe6Zsm/32Z9GJ4IX5LxaviKzo+8+dPksjl21jYF1jubnsYsBTttZ14EckdUgzW
         opIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170875; x=1736775675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjIamJuBBm++BJvo5hYVeBmdX+Ylca49J4UsdA7K2Hs=;
        b=djaUVCbcRK2SY1HpL/gQ4iNxw4DotCGXCLyX701UHiR02LQFoOrf72vfBejF2QFHjB
         bGEY9mdcOy4kUt+qcfHZ1zEwwCwLFPDExJuZJWpH3lPDnuku+NB7tEAtsTck8GKMufLG
         O/wt1A71br17U0iTQutMD5HDjL9wsADHCjUM+XWaDZ1PAI6V7MSzEdS2eR3IWVtHsZWK
         8cV0FJmai5mkt2Z4vm8cjQXPmxNL32qmV+QRXdaLqX1UuhEiVbDS+/XAnKFLCTex2GcZ
         mQQgNC+I4qcAhoRebvryXLOo4fij07U/Xg/0YzCN/TyusOsE8rPjEBqKjWspQX7NzZTL
         Az2w==
X-Forwarded-Encrypted: i=1; AJvYcCXL9OtOjRbUJd1snYgIlUG/34q2COMMsYAYdw29rdiGVdsS2KzozxpCqvwBeNQmTok/yRUqPsQSD5kN+yzHhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VsoaGYAgIOgop/4Vle21HPPIfH/6JrRlCzapp0/sfnFQVEYy
	LAyONQuKnz8qBCvhi1+vgdRWh6zlfpsRl3/LvEZu44qD7ZiMKpGHlsL/RciX1ItNzeM/p1DTYXi
	FYUnVg84KgZ38TMsTF9EHbSJL3DiOdRurs8hK
X-Gm-Gg: ASbGncvFPIRRYhDO0oWKka6nGSlk7nL7JNgKWRhcImTX+mZysNslHvkcUfmEs8hxVRG
	L1CqZMG6nC2hMuAGhxdIYax96x+m4Ts+HjqhsM5014yvc770x9VfjezWey4AIbyVchVRU
X-Google-Smtp-Source: AGHT+IFN7OKI/C35sDiHLXy2D9kQx1nFDkydFkQzSFLpCdNA2n+E2T77BvVDVVUbf5SzQE+S+oOfi7fLmqsCWRjFzu8=
X-Received: by 2002:a17:90b:2e50:b0:2ea:7cd5:4ad6 with SMTP id
 98e67ed59e1d1-2f452eeda66mr78991562a91.32.1736170874752; Mon, 06 Jan 2025
 05:41:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205115438.234221-1-me@kloenk.dev>
In-Reply-To: <20241205115438.234221-1-me@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 14:41:00 +0100
Message-ID: <CAH5fLgg8qarUp8VGGN8E8Wk_udg70yQWQcMR8a3i+cNZeVqC4g@mail.gmail.com>
Subject: Re: [PATCH] rust: rust-analyzer: add proc_macro for macros crate
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 12:54=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrote=
:
>
> Add the proc_macro crate from the rust sysroot to the
> rust-project.json file used by rust-analyzer. This allows
> rust-analyzer to autocomplete items from the proc_macro crate inside
> the macros crate.
>
> This also adds std and alloc only to be used by proc_macro and
> macros. This does not add the dependencies of those crates as this is
> sufficent for rust-analyzer to have a basic autocompletion support
> without having to worry about all the dependencies std usually needs.
> alloc is added, as e.g. std::vec just reexports from alloc, so that
> macros can use autocompletion for Vec and similar.

If you say that's sufficient, then I believe you.

> Signed-off-by: Fiona Behrens <me@kloenk.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
