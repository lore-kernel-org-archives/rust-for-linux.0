Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA741C0C1
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470759; cv=pass; b=TepXfqhE9E0DeB30zzph8H2NqYpom2/qtHt2raCENbzePobNweRf/TBrJ4NXXx50CuHQMjMKkCHzyRDYFmfW6JLuPl6iwn8ZE7Yu89XSerCFQ2nZYDjrMB115wuo9dyMca9HbYdDOciAXsKS0Bk9rjKuHTT2JN+OPxkq16zcfPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470759; c=relaxed/simple;
	bh=pVz0dJBBcxJkK/aoGlVT/i9HSy5kxN+sszIeZ9c3UJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boK1Lcpg4RG+ZKQZIP5yTTAygMeTg9V2nhv5xVLtqVsQt3p5Wz0RZeuOYdl94ieNBWTT7C+1rVr+ZkFu9osW5Tfgs/HusX4E9plOIdEXbQSXEpJHOxAldKBUjN1sGWMGiZahIclnILTObl/P8DgjNDT437mqkh2Hi1Gp5SyVRac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/khvKnb; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/khvKnb"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389ff6e5885so12885321fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 08:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772470756; cv=none;
        d=google.com; s=arc-20240605;
        b=QAGkasyQJ0w4eRpu7Vf0jSHCywWU9NyiQE0QCUribDf9S9Ot/BzwtXCyptiG8rqVTp
         zYhK4NdZ4DuLU1TKGlY9z/p0X8WU08AiJybF4pxA9qur2ZkQRvlS+/b1SiBYg+6sZM39
         BshL7Pu0YcmPHzg277v9CVv9QPwWppZAEObLN7ivrkJrcTRAOE8L1Frcz2/4HUpmBc5T
         CG5xySO8DJuzGIDdiv3DbkIDYvwEQrwA26zhQZ8/2H45+Ydd0mS0i+9pQSPtQDo+gFpi
         03FAI9V7HYxKkU0Md/L/4NlT7waTwELek2s5w2qHiQ7iNVyuiOs5WExuL4kRUdxLxzAd
         kmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQBA7gwP3YvOBaPq8xRoZ9s6LczWLnuMTYSo52+OrLc=;
        fh=jui3MJfIwD9cT7gbv9HBbu1OT54ieodmP3Rj3Y7rgx4=;
        b=Xff0dlWnNtku+qGkFVVkFfMKXUWvKj4e7u/4vczzoVoNXsIeYfIKa/1/l2wPnSQIGq
         WOsMN/1ZBd6zwf/JA64AtmY364XWot7MvbpW009TlvFDGcL06iKieeudNxyCNAxg7v6K
         2Q3gAjRtD5eZBfkeuHL0jcsNQbiyhkDtqZQP7CwbL9u0AV7so6+6kS8aUAemKFbMNXmq
         TrNQoJ/FymQzmHGvAZ8yXbzUb1buNpjXZEZ8uWebPOY2wlagXEAtikrElYf0wMKT+5xp
         FlM0xBS1aDI6T1OTW9mYzMMzkGv2D+iH6ozzJWW/KPgIXgi8W/qyzBFQmbJhNqtx6SyP
         WlWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772470756; x=1773075556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQBA7gwP3YvOBaPq8xRoZ9s6LczWLnuMTYSo52+OrLc=;
        b=h/khvKnb/qKAnaXwmEe3LybIepLxMy/avPM7Av51z/HS7jiP/vc/3urir2D7a0YTH+
         RCW5bPt4Uj3h0Q05E4Ybmdrd9KLpnWwzBmX/g9hw3RAwxHSmAunUxwjt9mqkzqLXx35J
         3x7RmqbPBWICK68Z7FEsKc6OKVXihiLiQTRsu2/4ThwQZ5Bu+ePozirwrOOnkTv6dzGs
         k+cVbHqHfJVdyCZag537yh2hd62lr+grRggPEEexsYlW61ChxcIdL/cKmHKTGA5imenS
         LtQJfp0YQdbncjopsyRY2OpiHNdaGda/aMytkt1zgbLjk/+J5yI0Sq9l599ln+gkMEVU
         PTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470756; x=1773075556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQBA7gwP3YvOBaPq8xRoZ9s6LczWLnuMTYSo52+OrLc=;
        b=R6BrplSiLcohcHFsKPUp/Nr+ZogrU+YPhFD+uP0dXWoeslTEfX8gkii8hU2dTkPF/k
         gfdkrvxYHvsZyOCxfD3cy6nyJzkEUjTuHNw5MetWh2zyAuKJ/1MuD2SKXU4vkO2FRTlX
         h9Rok327HBcF9yd8xzWd1nsiMo/FVlWpY5JS8XDSCwh0S8Lj+9g+LnUSkSkcXuKH7DZf
         f/b3nHt0MEjOKaZJSxX07ciU9VW6fLfCozty+8m7F+OND1gBC+AlwwmBkjExcQ1Xq1wE
         NHV11KFeK/50OkRCcdhalylvEHT5wlwqEdE1LQZzjgQ+pvDeJ2CDdHgklyRofqgR0U0c
         PwvA==
X-Forwarded-Encrypted: i=1; AJvYcCXWzEt3wnwyuJtEhfccWxpVt4OyqiUMYhkQCv/kxVv2IJhqCdDPdHznjrh5Ah/vzc3N67oH/vbsQ/IvS/nfng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYtuibwCGaHUowGhRkwAJ+QGMA26QDHLoGh7uxXFhKTd520NL
	doLqsYjv5mSlJIIYeu6GVG4N/Jrgatbg3wt0ArkLSRDHi1WRPigKFbN/E60RX5pDF/2DpQLZEm9
	rHr1VxdQGBzmcBSfZpzLrzr9iF3vGHoU=
X-Gm-Gg: ATEYQzxpXKDs5LDGQ3m8L4f6Hpxn3+w9mT2il2j3PGMqmf7p3XrwjodYFVen+63+cnO
	UtLe2BO0KlB9Gy8fvBJl60X8eGSOO3A36A5+hXGl0wPKayBoxVUw7dYXrfx7Ye9C7ftMRTerFKH
	IDCSJK0stEK7dQ6cG7g9CW2V4pNwzRbU1u4Kw9qYc8G6p4h6RFl/msLQRNXLXLm/e8H6S4ytdVD
	y8QupVyppzahBkbQe/+J4SU7P2caxMf+VKEdVsw5zOXwLCXJzLVtVKNV4XO1iPMJD+5F/ZhDPNJ
	bksrkzpw52o2sJYX6cRdrKQI2am1YFzDyY4v4rFemVaogL9k8+M438woSKew1K8/fZbzCWo1Tvm
	A7MF+6eFsiCwPp98Tyg==
X-Received: by 2002:a05:651c:542:b0:389:ed50:1b10 with SMTP id
 38308e7fff4ca-389ff73e368mr76850201fa.13.1772470755751; Mon, 02 Mar 2026
 08:59:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
In-Reply-To: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 2 Mar 2026 11:58:39 -0500
X-Gm-Features: AaiRm51PVQ5lAX_DpPUoEisvIdHNSxL1eIYdkSoSlaj-ykO9afB8fJdDkcgZRnQ
Message-ID: <CAJ-ks9nd4Vmbgw8gOajhU7ijgVrvcqpQL46rgX-tuPN1QOQBVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: take advantage of newer rust-analyzer features
To: y.j3ms.n@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:10=E2=80=AFPM Jesung Yang via B4 Relay
<devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> As discussed in [1], we need to support multiple versions of
> rust-analyzer to take advantage of newer features without breaking
> compatibility for users on older toolchains; we must maintain support
> for rust-analyzer v0.3.1940 (2024-04-29), which corresponds to our
> current MSRV of 1.78.
>
> Hence, this series revises the approach taken in [2] by first adding
> multi-version support for rust-analyzer. Specifically, it enables
> support for the v0.3.2727 (2025-12-22) release and newer, which is
> required to resolve inherent method resolution issues for primitive
> types found in recent versions of rust-analyzer.
>
> Thanks to Gary Guo and Miguel Ojeda for their feedback and reviews.
>
> [1] https://lore.kernel.org/rust-for-linux/20260101-rust-project-reduce-s=
ize-v1-1-4cd66e9e02d9@gmail.com/
> [2] https://lore.kernel.org/r/20260101-ra-fix-primitive-v1-1-def809357b4e=
@gmail.com/
>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
> Changes in v2:
> - Implement multiple rust-analyzer version support.
> - Rebase on 9ace4753a520 (Linux 6.19-rc4).
> - Remove an unnecessary new line between tags.
> - Link to v1: https://lore.kernel.org/r/20260101-ra-fix-primitive-v1-1-de=
f809357b4e@gmail.com
>
> ---
> Jesung Yang (2):
>       scripts: generate_rust_analyzer: add versioning infrastructure
>       scripts: generate_rust_analyzer: fix IDE support for primitive type=
s
>
>  scripts/generate_rust_analyzer.py | 196 ++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 172 insertions(+), 24 deletions(-)
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20260101-ra-fix-primitive-78154fe8173f
>
> Best regards,
> --
> Jesung Yang <y.j3ms.n@gmail.com>
>
>

Hi Jesung, is this something you'd be interested in updating now that
type hints have been staged in rust-analyzer-next?

Cheers.
Tamir
