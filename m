Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30C1D90AD
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729164966; cv=none; b=BcdQPcpOw+3fxdaDjxYz2bLAsLjtz9jset3T8xKBFtFTcSjJetZiV7BfJlsh2SaRezbmry25S2v5UK/uUg98dfwks7fp2WAv98W4CT71EBOfxTbiG9N5Ypte5XwzqlAQ39WE7/ozDoyYfJNGZSxWN8Gy6l8iwBdF+/eADQIMQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729164966; c=relaxed/simple;
	bh=Sy/DXM4pRzPmWe5V+bTLfH5NmwJxXluhw8HitOORpCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXHFgNAoL9Ze1XwV5L2b9X2gOFQUja8kPCycx0MKrm0chaTlmbvBuMZS3X+d5KImBKenXw+9lnBVtyL/RDKSBeyCzQlZjIYdHSSxqTczIPeSghDNculeVzJgKXPnPHhRWfwJS7DKihMbnVjhcgctJvnxlHp+GOyHEFC2zZj1z+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2uOc6Fyj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2uOc6Fyj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4fd00574so559434f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 04:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729164961; x=1729769761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+wLTTflWqI7DwX3CtVzbxrUPGaxb2nfMLXt3Z9pOZU=;
        b=2uOc6FyjPSTk+2i/cb5sxtRwtjlJ6l0y4TdiL2ovZYWVZiy8khRuOYHfs9KvuEuveh
         IivHAG2YM6NV3D+w/0VOP+C5IiGXpIdCAKyi6ZaRn4u5MkJh7vFSx7BZO6wwCcsAPB19
         UwDrj9XhhRNuR1uQe+zQR4c/NrTAitM4vvRcpCGYXjZjtTEm6dzq25jS/iDVnHHEge6j
         I8Mr28uG8GTTHtudJ4yYoH/RuNVSUbsc2ybqz+kv7EGj/K2FdbBrOWyA5kzsdZrTjSw+
         LVdcHzF355UWpLNpU4wqn393pFrN7uTj7JeAXtUb4VFT+hgeg0lm7m3IdKLoBQdczVSO
         K33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164961; x=1729769761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+wLTTflWqI7DwX3CtVzbxrUPGaxb2nfMLXt3Z9pOZU=;
        b=tkzRAwqBLnIviDodsPrecWYysuZE4jTAxqfEQCNvKCpMWcZ/jItTPEq5xKv+GMMuQ5
         aHkveIBw0TK9QiVVzweLiu2APnt50teDKkzqOIbnw7ASRSz2XC49AJFH7vM3yFl4n0gT
         6SfOqyl5wU2bgO9zqrg2/jUug8vdxMzUVgPYR3lsGecpRPAYeIVkKqc1cJqSaB8tVHAE
         Q37bhuyDBnypnd03bX5X1IRiwB53Lmzwn3oDySCusPTW4dVXOOb4hisU4GlZlCPgBtsC
         IHJCMhqoM0hcdHiZ6YaSMae3RXsxaSEIfLkrVyeQHz3GAKqelkPUyDhjznW1gNJpkh/f
         blxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5b8wXQ9q50iMEorOb5Q653qwdKXwepzwRvhAaYyTliEO+Abe05FpEvTNU+ssujIm0SNQjkVsAHa9u4Mc4IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKl48CbPICzOt5f728+pGDtf7i/k7lkkLrVfC2CAlWJpm7lMY2
	9N9mWD/o89bVB8YG/KF1ISUBSb19xmvxqtH9S4TULL3hjwjXEorlEXroc1enZ9zf+bnAfr0NQC5
	9csJHhf4WFxMi+o88Pwj4XaMT1SAn0Z8c0bCB
X-Google-Smtp-Source: AGHT+IFScq8wKf7b4NIwQ3yADJ8Emmb+sibLS27zjBHCwk1+AGLKIvy4me1EDq7fdYz69Y5S1X8upaam6ElK0/Xz4ew=
X-Received: by 2002:adf:f64e:0:b0:37d:2e74:2eea with SMTP id
 ffacd0b85a97d-37d93dcc0d5mr1815750f8f.5.1729164961032; Thu, 17 Oct 2024
 04:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006225952.45012-1-luna.xin.lx@gmail.com>
In-Reply-To: <20241006225952.45012-1-luna.xin.lx@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Oct 2024 13:35:48 +0200
Message-ID: <CAH5fLghcW5HgHaV43++Pdf4i7kPQ3CbJKmNmACUyw8iZDWzt3g@mail.gmail.com>
Subject: Re: [PATCH] scripts: add `uapi` crate to `generate_rust_analyzer.py`
To: Luna Xin <luna.xin.lx@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 1:03=E2=80=AFAM Luna Xin <luna.xin.lx@gmail.com> wro=
te:
>
> This patch updates the `generate_rust_analyzer.py` script to include
> the `uapi` crate.
>
> This allows a proper `rust-project.json` to be generated by the script
> so that driver developers can take advantage of rust-analyzer code
> completions when interfacing with `uapi`.
>
> Signed-off-by: Luna Xin <luna.xin.lx@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index d2bc63cde..61214fd2f 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -93,10 +93,18 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs):
>      )
>      crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
>
> +    append_crate(
> +        "uapi",
> +        srctree / "rust"/ "uapi" / "lib.rs",
> +        ["core"],
> +        cfg=3Dcfg,
> +    )
> +    crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))

This says that uapi only depends on core, but how does that interact
with this patch?

https://lore.kernel.org/all/20240913213041.395655-1-gary@garyguo.net/

Alice
