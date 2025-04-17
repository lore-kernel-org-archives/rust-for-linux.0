Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E21C84C1
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874735; cv=none; b=HXmwd2KUJc+qxkbw9qpeTgPSNdMJcuvmk32/oQSyOKEdIVRt5JO57SJxCzaGwkWeCSuLh/RQvyldUCu3wmHZuiy3n9QdCqCXl58qogYvYCo1ZLUuiJM6wh4UYQxrIBlwM9+EM4x4uJi53gSsMMc0Zgh3Wbzzv/Y4ohSkpMQiTVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874735; c=relaxed/simple;
	bh=CAvDAZwfGLBI/HItNzkiNR1FoMJ30j2kia+vuCfBV2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vs/KZbWLKbnBZ2ohXAJsCCR4uLtlD8TFTi7Pbc1DI7/VwBRYPWT6AVK1QBL5VgB/dLd9dfAmWZWFEXoQs92wLOwRCcuzrQCcR7ME34vbMaTimO0z2h/ATokLAtopl8ZCttroyhNC0iBbj7QOIgGlyibcEyNNqGhBdFuPLMnzIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=M7cFYtq9; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="M7cFYtq9"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6df4507690so438071276.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874732; x=1745479532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCSw/es2iR8/yNVw4J5gJ8YTwX58btUZLp0G7enr38c=;
        b=M7cFYtq99BiMTuc3lZQh8R3w7URZBjK19DcAfDJ9GBrlDoTyJc7OeLOX6GqbGDl4to
         uE+Za1l1ViEZbfNlBqTIzrefp/0TjXbUmGobLBXRWViFa03xcAjfhHDKP2sNwSlOeayN
         pNrbrf5PvfoYfmfdpzj2DUtN1Eh0Dv3xQ9QUD8+ZvLa+IvLjNJAjdubQtMvUEgQnw2Mu
         h7TMf9h2tNX0jT+35UjKjReAYKg3P4InchqgVx4f7i0QEjvBTh1YXzv203BNWxB27BOi
         ovEAraPbQztyNmvmHW5ZxZSHFvtx8irEWYf/QiJ8pbmj1IBdDPPPhqBLtHoADm11IADP
         TD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874732; x=1745479532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCSw/es2iR8/yNVw4J5gJ8YTwX58btUZLp0G7enr38c=;
        b=O8FkRZNNKR5001w+wyt1UwndxIn4MThr1HKKgVe6z7/A5qszlWP1LedKyXQgbeVK1R
         RAbU/pPtyx2RDubcn9bE905vKTg+CAjNkOtOKgBbzCsKcC4DeXEbD14hxS6ka8a+Os/N
         OTaIR7Z/nCHYDeDB7zntJVtJkHl1ElryQLpqRCmwwKfRlJi3lNCsQN/AmX+flHsZMnk6
         hV09+uKBiuqota0X8FNVmgePYsnsmT11a8uYvs2EtmaBvKWIuoE3xSy800jd4pLPj1B4
         Ua8Ia++2l6hC8keWUbKG3X7Kqw3+/IvoBZkg96FLBtpZdkjCoVN06azn+fMLCJ076aE0
         sNHA==
X-Forwarded-Encrypted: i=1; AJvYcCWRSauLNGzYHH1S34YTRnt9yAhuYbUkUSOp79RE2e5m8AdpumdsBttTzF4hDolu/2KzsB92aIwvoGiGxsRsnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvKZUFHBRoI8IpnJkFKfFJxoaCce/r0ezYjVmzFirrycdbVL7
	mLqRz5G18b/dWqYJafP5PyG4CG6VtUdZYRfMzYBBf6BNnb0nw65Qmha+qX01pxhmXXl3EI09Zw0
	DxAasH8CpcMZiZyzKO0qQ87WVbZtvlRMMrOsF+w==
X-Gm-Gg: ASbGncsXgQjeVV3k4VvEQDT46swNlVvxeHXQHKJjJ6BiS70i7lOY3nTr8al13fLx9k9
	2IrK8zjIvpfDKhDNo1keF6TdRCEpE0vBV3gl9wemElRcJ1++fXEoB88lLFesTULroSFkj3D8j5X
	lLH6jHScSajdVMtPY2WuPAL8eMOrmwBn0G
X-Google-Smtp-Source: AGHT+IE+p2PW3ydbONwQRu4rSA2EsOCb+RSOH2X4Csb3G9CdLF2TBoaq+QSeCw64kVxVVt90nJDanY3G9zyLsMtv34M=
X-Received: by 2002:a05:6902:240b:b0:e6b:723f:bcf with SMTP id
 3f1490d57ef6-e7282a769b0mr2670551276.21.1744874732296; Thu, 17 Apr 2025
 00:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-12-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-12-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:25:21 -0500
X-Gm-Features: ATxdqUGfByujakoDWsaF_GHACD1pGmqrbiR7ZbZczWOGW_x4V9XFFfDIb1tbrFk
Message-ID: <CALNs47sy7fcQoOaxQ0moyRt5TJOi4VWc8AxXHzPgouccPP4N7A@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] scripts: generate_rust_analyzer.py: define scripts
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Generate rust-project.json entries for scripts written in Rust. This is
> possible now that we have a definition for `std` built for the host.
>
> Use `str::rstrip` for consistency.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

> +    with open(scripts / "Makefile") as f:
> +        makefile =3D f.read()

Since we are using pathlib, this can be `makefile =3D (scripts /
"Makefile").open().read()`

> +    for path in scripts.glob("*.rs"):
> +        name =3D path.name.rstrip(".rs")

`stem` should provide the file name without extension, so

    name =3D path.stem

> @@ -267,7 +281,7 @@ def generate_crates(
>      for folder in extra_dirs:
>          for path in folder.rglob("*.rs"):
>              logging.info("Checking %s", path)
> -            name =3D path.name.replace(".rs", "")
> +            name =3D path.name.rstrip(".rs")

The above applies here too.

A couple of optional nits if you resend but nothing to block on:

Reviewed-by: Trevor Gross <tmgross@umich.edu>
