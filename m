Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A53AEB2D
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001945; cv=pass; b=RP3oP5cb24DSg0jbuV40YmfVs5b/gJH35YmzsShvyMnPQdRbjPsYnED9HLogUGFpM5XRG/tYN+/QWCZNaf2WQifyzB/W6r8RkyXrjlG4K6xynEsdku96bRduUWDLFGGKbc43JeO5qMxKSy96iNTudH3943b3+qw9/lb0tFIjTV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001945; c=relaxed/simple;
	bh=AwPGYYli5QTCCe0SPtucRYCLSpbMWCY+OvxWF+x1R2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJvapy1Z54acH5KSXII704l7qmQrUs9vN63irwp3oir8JxiyuyRXfW2o/eLOtxwwzefu189w1ntL8GRmvnKit17jaWaEPc8jPbWiFfWw5kj/GQOQqUDyf4uGQWzqvhllP4ZzEWfVYF+Kd7cbt/iLW+V4M7zsPzfUeHsTmJk93hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bg0lIrtI; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bg0lIrtI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cdae130cso13213675e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 03:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781001943; cv=none;
        d=google.com; s=arc-20240605;
        b=gRkjLnlyO749/8ph7OzxPxdIyZh8MxIN1BoF9ZtwsvWyE6cHe4U3XTNNh14iZx7hJE
         XxlS93XD+rG5ubng0czxWlcQjgrqKlpjZ7dpafOV6clNf+GKFg8tUAZd/BwTsLzcYPYG
         aJ6Y/HI5fnzsIkRNO39uOWWU11Vhn3eqmXPjGNGQ97WA77bFMH16VVEzhmuxKIHaLq3/
         WCNPTj6BWW4tDLGPIyZ9714vtCXtsiTFZgnCiyYNMberra92XqZ3/mlzY3igdt+QF3MH
         9jSU8NxDgQ2Tt2wf9RGDdSDaTJVn+59ymkZgOZY4UcqTpg74KuCVTSyAEn2WSHLFVbfD
         R/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pEro8W74MnxeK0SsaFEfRSb0IJxOqJEfCobL5j4Y024=;
        fh=XYBSCiL52+RWKzwwmmgguY6eUaVpfiKWqMBcdnrGmvI=;
        b=PSB9Dg15OMbfnsymKg+Ov8QuyV3y9Zk5iIGhIbD+TjDwu6ibJTe29B/qaPHc53adGJ
         E0m+pakGX3IwnCaIB4bNhV9T2mQzMY/ENzj9R7hZcMrxcmGue7KSxMS4mA5Nm28UHWXF
         isVTrQ5rEJgDleBJtNanhXsDNbAqjYiqSXaxerIS9ZuUSoWMMnWzF2Qa6UQEdCA5pSed
         6FCd5dGzx+FrUzTUUvjWBWYOVpsWlYyKtm/vjk9V0Wa6maLwkK9fIBU9FetoedolpiFR
         M8nL1hmQ9cLZQrdkEv9PTPSTABhUQa34PkdTTWyPJHZf7yw5IuvsEtLwaHT46Ol43u3h
         +IzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781001943; x=1781606743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEro8W74MnxeK0SsaFEfRSb0IJxOqJEfCobL5j4Y024=;
        b=Bg0lIrtIOa6oPJ/Ik6drAwiVEEY/sjLZtOX3hqHy2O//tRNtABz/5LmhLAjrD1Tmt6
         inW+lGSS4roBC+sZIEoLbXHIM1jSATRSgF1PPifLgh/82lnMA7j9iy3lomH8kk1wzS5A
         Fodpkcr87V+QTtX0BJUPVFU3HwID6VOdn2WOB23NiLmv4/g/fuxynZaf93yX8ap679+q
         yyNxHYZeUT+b2bjQB+Aq5GXwP2B5Ru7Z5Ks1YjsD7XxURoyMUqfIjyEY3XEyOg1673G/
         gzFWvua3oZ71YSm8jZPEBcdWHjAeQBgIlHntoH9NgOb4E8cK8LUgud0dI4+E5DEvfVI9
         HhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001943; x=1781606743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pEro8W74MnxeK0SsaFEfRSb0IJxOqJEfCobL5j4Y024=;
        b=PRpyYjOGxz+21zMdxmHZCVNo1xcnf7b9ap4tKl3KaOWDsi2bpyR1QIcOvq+LaNCQnz
         D9fzVOowfgdnqSj3vIZq8hMpm5KDR6zpT2IuUkq5DEBBHKaVTrMr7WsW4Hj6lJkT+WHN
         NCc7zH+1jQVQQoOHKOwr1BSpiZDeKXVO3fRQWtrMx/OkErBD0SRsAE8ofQEK8xDrDdDF
         PUXfeBeWLGcbnFG0AuyTPdDkgYn6k/rpR5TU7oGmOnBKt2neJShETVtqgXbV/sdTrObe
         tFCIf82McwMwWu/QFkPLergNB1feqN8/2J2E8+AU0wDfpnMVAbYYf3EVs6pXDenEDSby
         ClgA==
X-Forwarded-Encrypted: i=1; AFNElJ8KJBTXKNln9/MAu7uaKl4Axnq8V8i13zI18P+1fLfp7sp/JJ4FuMIpPEKWra+ow4qgSvOcfpii+BePL5aoqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbDEHBE7Cmn9qOp0fHSj4wBgs1UNtNgPgo9Y6m9/9Lxqj/ft6
	VVbHZgfLq1PxhFgH0p7lMOEFlBmXODg3DtyIO2NAH4Tbj5g2hsHHvEUJz44Hql6gJGb2cxAADgG
	6fxAAO0cQC0HqGg/jJh/NaB4Md/YPZ+f8v32/v/ow
X-Gm-Gg: Acq92OGL7bkfKKqItflzL5L2wIywg/poQHtvVky3gwUo+ui2k0sC0NWOr8upLWAss2b
	vEEQoOZJ+kl5FGoCpOVRf/x/Pn5HuTbhtRFqz6wMYF6XEEF1Lez3EzRhXYuXbd+LySzvqvdjQjo
	Vshmr9KYKXq26XmYKB72ibL8GCj1MByUZVeqvvvK1Mu80WXX8EeSrzrqbRz3vCeOIQXfMr8iI47
	0+1qUGwCkHCFSwTp4k7F+q2tUJILagDc7hmsAxbJIA4+IyYCkTSYgghb18XQER2kE4roWSx7n8T
	rB4JvFSTMJn9a+4HWHiROqiCOW8IuEro3IBZ7qoKyUFRA8ydxNVyBkNkXtJb7Ro2lXICc6V+w8C
	04mWo
X-Received: by 2002:a05:600c:5488:b0:490:9d1b:f07f with SMTP id
 5b1f17b1804b1-490c25b1277mr375416095e9.12.1781001942651; Tue, 09 Jun 2026
 03:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609104152.261145-1-ojeda@kernel.org> <20260609104152.261145-2-ojeda@kernel.org>
In-Reply-To: <20260609104152.261145-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 9 Jun 2026 12:45:30 +0200
X-Gm-Features: AVVi8Cer4scMdIBrXUgDXbzDusIpIfMzZs4qRkvpYxnZtM7R9UU-ZA3VgPardd4
Message-ID: <CAH5fLgg2QKczybLJYA7D9CAVURRKAzEWWHMLS5gweX0aCcR9AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: str: clean unused import for Rust >= 1.98
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:42=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), the compiler has changed
> how the resolution algorithm works [1][2] in upstream commit c4d84db5f184
> ("Resolver: Batched import resolution."), and it now spots:
>
>     error: unused import: `flags::*`
>      --> rust/kernel/str.rs:7:9
>       |
>     7 |         flags::*,
>       |         ^^^^^^^^
>       |
>       =3D note: `-D unused-imports` implied by `-D warnings`
>       =3D help: to override `-D warnings` add `#[allow(unused_imports)]`
>
> It happens to not be needed because the `prelude::*` already provides
> the flags.
>
> Thus clean it up.
>
> Cc: stable@vger.kernel.org # Needed in 6.18.y and later (prelude added to=
 `str`).
> Link: https://github.com/rust-lang/rust/pull/145108 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I ran into this one too.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
