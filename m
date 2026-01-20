Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEC242EEB2
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913928; cv=pass; b=cysSA8Tiu9/Ckr5DQgNOJYtHwlDX8jdPrPB3wOq1t2yWnGCEemgEwxlJi1IGmTevSnSELVyk/Nr+1D5E5qJdLxVRPIvYcL5hY5kDSes+AIN9uhvD2I7+rBm8UQf3yHi5HuqE0kSVJDfOtpQarbgAf5pIaeYsHqpS24FXT0f0NZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913928; c=relaxed/simple;
	bh=0XCwx5ZmO+PetPvHV42DQ+nsYDlkQMMIG/EKRdjtzbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hc4Al/5piCzOrQokKNjIoQ4S7T6kWAABqqR/+y9us/RdYhFvW9TI4zT4LwSHtdX0kA2GEDvdEeyF/OPIUOYZJUCMLW3ubf4LUIZ+Pc8A9oysuxFHWMWGyjImaeLN1QpWdbNF+E2JOhymingnsT1RXWT05s5kXib5jLOI2kMhISs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPDKbe/P; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPDKbe/P"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6a868ad45so418644eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 04:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768913925; cv=none;
        d=google.com; s=arc-20240605;
        b=LJ7635vHjVEXn0U+TpjR4k/ipvC+Qs/FLqa7G4pLHRZ34qHG9hzEj9hfqOHxnIkCN1
         ubCiKFbIc9Q3VLRfmVTOZ34MxZTBAWzhA0jH0OfGF1PHTkECbBIKlR2vW83cRu4eAzk3
         6brCrd7l/u1SPdfzCDw+kZzbvaXbzh7HNprGDtGqEBRyUaMweO93XOl8XbGAj6S7M6g4
         I1LS/ZuKp31CSlY1eTOt8OThYB7gBhYIEMHVIkEv7wvzRrbN2SCb4ubQaUhu01vikMOz
         qogdgwbE8iMNlZeaA7mopTE2Ryv3zzEwz1dDoQna1T+9IRHtPhJr37P1tZB9V3GpIzir
         T+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OEJlvOgPd1/aTi8F5qGoTTkuxUyIHsl2gD727TreBk4=;
        fh=dPmCcRCMWb6SdnjCZhIz/R4kAWF8hBJNTvOF60Ajo1A=;
        b=i6AZgHxEdRmwRCh+ssTg/IOSK9dH8F4JtX0N27G05EvQeGUsUkx5zbkoJxNZ7xPaPd
         vz7UK5AQ1184XyGI+BtIo82P91Nf2hJQzt5dz4SKK3cFMgpGI4zotVd+LKgaEPb+NcnI
         l8JK+HKrGfMkxtYCrC13j3e+i1K3Mfg1jz1UsN3q2BgaV1S5y6jHtDfEkKtNuJoNWaF9
         qv0hBcWJd4HgOHi5hrpzb6+4lNx1pxLi+rwh6A/0u7JoSIAZ0C3nu5LphEIDVgihpiPs
         geYth4OvcEe/T0YWVH451Z40z/N3cKnIswvB+Vj9rYF0hKY+Ame54IyrAXKgI2R99dFx
         3GaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913925; x=1769518725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEJlvOgPd1/aTi8F5qGoTTkuxUyIHsl2gD727TreBk4=;
        b=iPDKbe/PJvIcb5W3qJWRaz8X22pxf5J8b00eL93ehvDsGlxHeYdibETJ5L2fYKvf8O
         RhrkcyQmANybI/qltVCC8P5G143dr5eeRsbttgQPHIY1G3ltzb6Xp3cp1SCQFXMv0ec7
         CTdUCdNvTithKwz9EcGvNF0xJmWFyQFfoGxKmUH2h1a+vUzoD33lHJOSIdmiwtw1nAze
         FP3LJsjfez9DeShbExHPZ2ivaz3tl0wNy7VfIqVkXlQWuPGRRDEfnp+OVaqmRO9H2DRS
         iIF9z8ZRXSSoFNHulrPcP7PWBwJo09au1YnEuN+bM2cHfI8gFkgNAmTyirx1EJXlql8+
         yoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913925; x=1769518725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OEJlvOgPd1/aTi8F5qGoTTkuxUyIHsl2gD727TreBk4=;
        b=dUl125Jd1FmR8s9/djY6M+KNFeOiP0DW4ytoH/XJr13YN+TKyycDkvm5dvS4Z52x+v
         Kaja63sk8uomHxpNMEtoNgsP1h6VWD8v6323904TeWI6KyN+n5LQ3HXXPA2yd9+AR+ML
         mrrvvXmPh1a3o5CDGGsVLPPKGFeJ/V7UyY5uz3XyvTAejAJu4qxMnXLfCZGXSz9iaXcX
         YMmMirKD2LXaUphIxBqSZu+ifmSjOpnihoRMtPQOwg2txypI1gUBfcRe/NyNlbMBpTEM
         iPx0jQGPmA/y/QQNLtxJuaowZt8dtyc9NI6BZaFLOLiyoC1HfWfeVmuhvvMoHlWh7hZo
         FQLA==
X-Forwarded-Encrypted: i=1; AJvYcCWr+mtU84VXINUBY37agU6BKO75VafqkKjf6uXsGRssgin/YdGLK7ODL02ihofBhGiNLNQf4nwtJlz7xt0Lbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWRnOZ/SzT+qwf/p+KVJ9llW6UioEDhtPzIW8S0dz4gtw/COx
	LgFd9xTIgmidR3tUgN36cO0ybviYtYwdgJ0N6V2yHYgFuF7jCFSppBT5Vg8gF7S3+3cwlzB/8wq
	M48XpvuRKRjGgTe4La/mxhQkjDdqTMwE=
X-Gm-Gg: AZuq6aLiYxWjIZQHc3XfRZGdWFORJv7O5B8Dk1Oxu7S4znHoJU23ZcBxP50VxEGWbTq
	q2uLoAHizFACb1THcD6nm3Gj+idINofvbAgalGOe+u2VKfqLk8N+kiGQhC6A5LYSL6IHaiN1EW0
	GDmpcdF8CmCVuiUEf0bN5k7mG0YTtQEl39Snra15K7oDQhxxeyZIxTSSjEruub4RBf62n/6YV7U
	AU0fk8bn6wWuZIi2j5dnAXY37VAYxrHsli/dJmEmTWCzxF9relw6S7nnPMi/3AFSjufkAF1edO1
	DpUcsGa3MWvPtyu15RNvGuiTli2O9e0i82s0W1kan/YlHagxDF5jXMUX2fnneuNJHm/YOUPmP4Y
	eop6gbSFcCtRl
X-Received: by 2002:a05:7300:3f2a:b0:2b6:ffc8:42ca with SMTP id
 5a478bee46e88-2b6ffc8463fmr418085eec.2.1768913925418; Tue, 20 Jan 2026
 04:58:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122190908.259929-1-knavaneeth786@gmail.com> <20251122190908.259929-2-knavaneeth786@gmail.com>
In-Reply-To: <20251122190908.259929-2-knavaneeth786@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 13:58:33 +0100
X-Gm-Features: AZwV_QiiT_cdgkQ57hNPNlSay4m5u6calcXtyMW5P55_V_UOU6lKCZkaszu0340
Message-ID: <CANiq72=b=Z+6dk4XWK6QWcKDJx7SYXL0obAFFfWp8xpE1CFkkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kernel: document safety for rust_fmt_argument
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 8:09=E2=80=AFPM Navaneeth K <knavaneeth786@gmail.co=
m> wrote:
>
> +    // SAFETY: The caller guarantees that `ptr` points to a valid `fmt::=
Arguments`.

Thanks for the patch!

The caller is indeed supposed to pass a proper `ptr`, but we should
actually require it, i.e. this line above:

    #[expect(clippy::missing_safety_doc)]

should be replaced with docs with a `# Safety` section that requires
it so that then we can apply the guarantee as you did in the `//
SAFETY:` doc.

Also, in addition to that parameter, we should double-check we put
enough safety preconditions on the other parameters. If we do that,
then we could also update the "C contract guarantees" safety comment
too to just refer to those.

(We could perhaps even mention in the C header that the safety
preconditions are written in the Rust docs for completeness.)

Cheers,
Miguel
