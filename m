Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EB42A7A8
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030613; cv=pass; b=MkmN7g1PYlJ3pU4rtt0CqDu/8/IA3XgEdCVVZobNhe6l10qx33WTQE36S986yapCf4ULF+IQT0qe4mmxWE/RU1ZLXs4j0wpnYm8ELXUwd2tAcC9FuhjBdohvgFpHQXKyfsRAiKf+0/Q1mXL1az5TqHy8mffFV7rsQkWqcwGCCS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030613; c=relaxed/simple;
	bh=hqSobSxH9p82Pc2pQrLeLMglXwWqgyXODZAnb8rNodY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9L27ft4zqKpnonVw8+tw4AXl6oxXcL44nDv9LbM4j6LoQb/E7GiuRL8Krj2IlXAA2gCjPwFIMKf4YG8nOzIE/HQVGAZfFVhynfuxOgPw4eZIVtI3YtzfHCfwv0dGjkIbV3Rke6+94XHbBAvrNH0Yh0dtLsByPOo3a2EP2qeSK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICHEts7r; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICHEts7r"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34ba85727b6so35860eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Oct 2026 05:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791030611; cv=none;
        d=google.com; s=arc-20260327;
        b=JEdRGdf96T3nkNc1NpZA5uNjQeApwzF+Y2SDw/E2pqRbIa2d+YTLNVwBlp8IAVz3Mo
         E3YlduxTuT7REf613z0/PpLsi5M4UeHdRsA9tKAdcTysK7TCHweYLKHaSqOOxdVf7a/A
         kEOZyda+80Zoi/+NHqGSWF68xN53/vrUHJoO54uIygu/fYQCKIngp2X6nS0OwEvBUdZr
         odeZ03UQutbBEOuH10YEKdXpjEVL2yrWp8y1eK8mLK1+RraZEH032kaksve/8Zy7SRqB
         5wbT1EdDCwLWV07SfTRbmPkqD7OS/DErPeztLW/UymAJP+nSWQqEX0aSgoAkqT59ayaC
         6OlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        fh=Z6GZptd5HvOxUdHJnqHpdBMwrViXyV+bgtBp3Xg5ZNU=;
        b=gijowT3bTbPluhpDZ1mgV2qz4hOWoXNZIPGzTH/nb13rke4xvlD5AvekdCIyQxcE0I
         ETYKRli1B+p7CQjbeLhcJlYwN/3NrZT+KoDOJ+kzM5qZvESUkWe2DuWsuJ9fqfdGR2OJ
         xyTCYl/9HPVz0mOgR8sq4OiBCERIQdZ/FFzg5484QuIKgem4p9k/hNTqb0C/PNVUcTAf
         J+JxRlpyKc1sW3VpQxI4Kq8ypTaObkP2WYirvsJCY88k2OZY+me8HCeKNZUsR2VF7zRw
         DXCU8SrTfF1uWe9p86gPf+eQL69TuI/w4uFwk5VlaK0IA1+1tmQ9hMdvGe6OKEnqDTVI
         W23A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791030611; x=1791635411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        b=ICHEts7rQtQJy0wzKvoy63vJRuKHGMZvxA/1+773lv+Wje2qAIntzJZowMRvWK9bD9
         xc91ACmBEAjYCsj9MmZ9WSpnNEFjjWLSDfvt1A65R0pA3lyHHuU4XzfN5/Gmal03VR3b
         zlDfz4c962Tbtd5jBkf1FfEdDnaJ9H/4zqRQ3HMPEo8bFqy1V8FKtJ5NQcZ+tM8iVmkJ
         wjLD/TX931ywKtCMvWUHlMgxEdnJBRZb6hxNiKlVcgf4tryFaZrhUnqY7ypZK+IUsAe+
         R20AFD46mJ97RndCDGviPtkAtXExMoHG+V2pPvneZP2gAJtbQHZA8TXlhg1tiKEyiZPB
         yu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791030611; x=1791635411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        b=ZQ6c9BP7YyhZ/gty2yOXr7y9E8wFyci79+MNttl20/Dl0/G1RSyWCZs4uZRcMIn+b0
         qAE1vgX+52nQs6hm36fAQnmgjo1zAkydi1M6LCE6nRDU2mgDssrqxNvWBlMtrU8QHXQz
         x/kbzl04bq+qduOBo2cHgs4EXzDS3nxAO0XGZNeK/x3IobtAeQTFUFhmqmaESRrJALgY
         S3pZQOS9GjxdnDVq7vxr3hdvFGwnlHgbz3c7vvlVmtKmz/ZnHYe4lt8yMOz86606ZfxZ
         TykVzbNLo6KsGHhZl0/1x+MIhhO8NZ81YGKvOoYnn/fweMOjcXFyvlLjueHR2HJ4vPns
         nNjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr9lkAfCjXUUOL1hLpb1d6xFa4AiTEY5rg8atcIQyOz5mjdkD1HUWmZSY3Bep/qql2MrY2opp/u01/5ovaaQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTvEFZc/TZiEszk3z14cgF+QMzDil+vzSJGbfY85LFe9+iz2N9
	5KJ92Ed56Obmw7hffvHKy2+kFXqH7/MwL212qv64A93BKKUHzAB1PZOtHugdCYWM07GxK+Ag4/Y
	CLcE700Fsisiw2lAIGeASQubQdft1+jc=
X-Gm-Gg: AYBFou0UbbXE9hUj0yFfgLQ1nmCGUpb3T0ZWsXok7rIRhWVsyNQdntCMqY1AruRNXH5
	RvCQj5PMG4GfqQT/6GOngZgG9cdIzdSDDoO9MZ0h57JAk1HVWG0HHAngSQeKGUoui01ISdUg/OZ
	Sp5QYzeyqHaRgj+VMHb+A6lUE6zQkZHqZ3Err2gjUTZ67DvFK9ywNr04z13R3/Uv+fQq00aX0df
	2cIHMxv6KLb3NQPiYHeib896v+gIsWes26O86DrTENZ3Uf8swKkMk9v44DObuXZRgN/1x2ow8Wt
	mjR/Lr85cB3ncKUxZuHPeYYjw/LRJB9vC0Om7ohXygsP4gDQEKVB9DHwg9gQQhZ7Jmb2FGIZClH
	xG+fmqvifvh4lr3VBzECWl9DN9aMd4jqiNLZ+0CyFd1tsEKrqzCK9MXSclkcXxrhULOSE4iLwKn
	yVuyZ0w5N3LeZ2fiEuTF10d37zlHE88hmd1+AIFwz3FUpUH30XY9Y=
X-Received: by 2002:a05:693c:6090:b0:351:18d3:dc3c with SMTP id
 5a478bee46e88-35118d3dd9fmr2927720eec.0.1791030610865; Sat, 03 Oct 2026
 05:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
In-Reply-To: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 14:29:56 +0200
X-Gm-Features: AclHuK8rsCn6lZolOMeCDhA0TDOEZE4YAnfFpck0egreN2YiZjMkFmzEgwJYFZY
Message-ID: <CANiq72mqUDt23jBFr1YVf_5WdO8xcdX0cXpAA9wiawy-sdfcPg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: Replace and dissolve procmacro-extension variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:10=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> Use make's $(basename) function [1] and substitution reference [2]
> instead of $(patsubst) to extract crate names for rust procmacro
> targets.  As there is only one user of the procmacro-extension variable,
> do the crate name extraction in-place and remove procmacro-extension.
>
> The procmacro-extension variable is used to record the binary file
> suffix of dynamically loadable rust libraries -- which is 'so' on Linux
> and others and 'dylib' in MacOS -- to remove that very suffix from a
> target file name for reconstructing the corresponding crate name in
> cmd_rustc_procmacro.  Extracting the crate name from the target name
> in-place is shorter and reduces complexity.
>
> Link: https://www.gnu.org/software/make/manual/html_node/File-Name-Functi=
ons.html # [1]
> Link: https://www.gnu.org/software/make/manual/html_node/Substitution-Ref=
s.html # [2]
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Tested-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>

Applied to `rust-next` -- thanks everyone!

    [ Rebased. - Miguel ]

Cheers,
Miguel
