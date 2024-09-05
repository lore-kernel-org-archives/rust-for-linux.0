Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2C197A6C
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523725; cv=none; b=bDBX8BXOpWs6xDrQqOIfmAOuI8CDeo0cBo2eeB3Tipmbfq7hO0s4b8hWoB0+3imadGDDZutNtH84NpO93I/7w5t0bY2D6BRgn+UQk5UdymmziAK9uKMpCt65PYgoC+tJ9wTKhJhbxdtmLW0FCyy0730fY0C7xEtb8NFKVvGnzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523725; c=relaxed/simple;
	bh=xqZg/l2THvP8uncvI9Cu7hfQMDrgjo8lpwLhFau+B9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkTCRYSwwpgQdUIAF3EKmvO2HYLaQYp1nsoQqOw8eqz3gf3/zM3PpT2tyzR64tl3DO0Sf91FC6iBBCuQ4ET9vOcGVXqf+BwO3E2S9e8JlFpqTTdAbnKMZloug0c5IPL7/wZa5UVdcuPoXbe4shYyOaMOA3xzIpLMGuWfA/hWopo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1XPlxHsZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1XPlxHsZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374cacf18b1so282438f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523722; x=1726128522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONdEvXfVoiXfsYQMbOpzUUsoqTAmilUWNgbBaxjquTY=;
        b=1XPlxHsZMEcXeqcEQ++36IZ5jqytkZ20o+9nOTcV5RloS8n3MV8jinEn99xlVjQtS9
         Jun0rN6bJAW8DHPu5rVPNe49IVVrwQ8NABvUsNkbm4v2qvtT8XPsgD6liaEkrN2Qqp7g
         nZBvn9F9rvRehV70oXrn0ihHxL1BPBM9nxRTP5Qgcfhc7ie9Cl09A62+A8fx6XCYux4q
         Pj7yLoWMp1zRyUwEoGm1As/4l7MslpwSfr/0K9Su/MR1JEr4KvXN/wadCRiFnDgWe+Hw
         hOZT8ru55COC2kw3gsriXyQf8Vu87/lD3FbJwFuIekv8L1FsdbAd8Ozbfr99TRMac8PU
         0ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523722; x=1726128522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONdEvXfVoiXfsYQMbOpzUUsoqTAmilUWNgbBaxjquTY=;
        b=JaX3Lszpufy62tn8TKQhxVLADXIJadq68O1FsxMtIHF7kEH/u0oyRpMkO7ddYTTa+I
         vWjoIvXocl7XaApMIRqw9iNotPz9Ban7DAF5CooNr86+VJxgN+6Bc9CubmJrn7jMlFKX
         hIku5g7yjFqpSh4m4SFhG0vdXUTqS9sz6/yeBEF9ZsU2XL6hCCA5LK/ehP6HMh76KHVe
         iOYRm13u+nE4TFBx1Jy8vlYCZQuoHyLVaUCoaW4U9IziP8Iy+e0Fiis7cMFgu4SLrtZZ
         spFm4eXz+0MrAW/XDpmZeH9X9ovELF6g+DSQO8gTs4lFs/m4Ob5wmCO6B1jrkQRLB/kA
         EHVw==
X-Forwarded-Encrypted: i=1; AJvYcCXGdu8zvYeSMuV/9mUT/MkAuAVXdZfa5WTl15Vm9bif1MLa9VFmyfJHa6JsK8ZU4AkB0TVe5egR+O5C+/a7QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8eEqeaFQBEzTxUlDyWzN/dakoHbin5wpdd0+1WSE9QiTsCEVz
	uS5zr2MmdZvzA0qvP+EkPkkdKhcBJRMI5y14+tnZsFvG2BDZy8kVzFMDFVVUR/xVSfuvPuYyKj5
	mCm3zt2AXQAX3Sm1K3d5aw47X2/NCZbGYdNww
X-Google-Smtp-Source: AGHT+IGsREicwoeAI200xxv8pWIQ63uvfqObyTQjW4hGxPg3+tWUrCKJv/mwyAASMfYa7V/peuF92e+l9osm8aA3AWk=
X-Received: by 2002:adf:e2cb:0:b0:367:9881:7d66 with SMTP id
 ffacd0b85a97d-3749b589884mr15156149f8f.41.1725523722016; Thu, 05 Sep 2024
 01:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-8-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-8-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:08:30 +0200
Message-ID: <CAH5fLggDQzNx_uxT+Yw1tMP3fHZSRWTN0RcQEb40bcPL6KgT5A@mail.gmail.com>
Subject: Re: [PATCH 07/19] rust: enable `clippy::ignored_unit_patterns` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In Rust 1.73.0, Clippy introduced the `ignored_unit_patterns` lint [1]:
>
> > Matching with `()` explicitly instead of `_` outlines the fact that
> > the pattern contains no data. Also it would detect a type change
> > that `_` would ignore.
>
> There is only a single case that requires a change:
>
>     error: matching over `()` is more explicit
>        --> rust/kernel/types.rs:176:45
>         |
>     176 |         ScopeGuard::new_with_data((), move |_| cleanup())
>         |                                             ^ help: use `()` in=
stead of `_`: `()`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#ignored_unit_patterns
>         =3D note: requested on the command line with `-D clippy::ignored-=
unit-patterns`
>
> Thus clean it up and enable the lint -- no functional change intended.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/ignored_=
unit_patterns [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
