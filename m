Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A241C64
	for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748255598; cv=none; b=HMyUTgBsTKfeJFaRgIrJmOjJGiTIX1dt5v8v46apRHSB11dQZDCQKBuaSv/hlaVTRNkxuVsWIRw8XjrYbN3w2kuEGWYODXKv/RW4YDwEivYGvZYjJKFst58qkV6IIlPKmMrJFNSPuA9EewsFP3sAHHaeqNcWtrjbALsnnyHozI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748255598; c=relaxed/simple;
	bh=V1yHOUnThyh395kdf42aHTbtbWYKpImm9uGhsOZFxnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFGd8srd/MxLNcIuiGgF7w1fioVfTCovkfj3xVRlUv8AUg3dFqZThUakBT6jOTR0zgEthrrDDtdb26caaefSHrtoou1ip4b+3vUvzbfd7YSNuv76Vi3vzVNztvhRquX7yIZpA5s52aCkdjiS02Tk791JJCdGwMZax/BU5kZFs20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLHs9LLU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLHs9LLU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso185536b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748255597; x=1748860397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1yHOUnThyh395kdf42aHTbtbWYKpImm9uGhsOZFxnU=;
        b=CLHs9LLUFAarJIX5oRWw2KXVeiuDnc7d1EjfB0Ki3oczGu/B1kMuCjopHJiJsoLMvO
         LH3IO1++r437ntdzctw6RrsoVc797CJL4Bb04Y+mv42bBPiQcMejQXSoZRjIUC7x6TCe
         EqTh38Es8k2GfEo6U/WinlIdwT3QAYIJkWmiLyIrMZNwE7VyFtFzaH0qkqHDii0j4fWk
         Ot+Y+f0SBv+2T3vtzm/zFUuT9ReSJMnoRYZDByO5PQU0bIV8pXRkqVA1XNB93h+b5y0o
         hgNCPb+/+8WeYTmL8/B661KWL607KcZVPU0txLJhmesFQbZegEdtlU83YQnJtpo5SvbC
         JDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748255597; x=1748860397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1yHOUnThyh395kdf42aHTbtbWYKpImm9uGhsOZFxnU=;
        b=H2de4GtTq5bnbXUlpsPj16bHYH4n86k7s/ZjX7yRzp82FkAOfmymB8HNJd7jOwn5/F
         oaiPHAwxeR9nfQrgRuc+0kXDarO+3qXZfrmVSiQgWjstREnltsatcpeSYZRbkfmy4N+r
         YNTx8cxo+fCI/ply5WSbYBRReMP+cuouDOvAvPsl9+wKwS1PY8vl8LVu9uZUrcU8BzB3
         YspqPiCfNwq9vfzg0P+7I1101idzYY6kKux4uJLqokqVhfbhaaOlVCbswkrvqha2HHKu
         GTxV3oBgU8aN3qhN08P+izCwnfwg9uUkA2xsXRVxdY3oBVkLUnD8KAcdzLOMV7AqOxS9
         0LUw==
X-Forwarded-Encrypted: i=1; AJvYcCW3n6IcAE7iRj18UpkGfTM1o4ayr5IfwT5HfssnK35rVg66GUeeeQPHrBJpc1PHcad3s70Xnp4SdBOy0KBAfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycwGMxTBiLg8PZ88vJlORaBZEC0hd8ljeWKWeB21XvCkZdceTv
	Ofb1oyaifv1b/LMmaW7Ed1a3rDGyH7KwmhJmEH755okjxC53F58ITHKcT0dMCIgwCkVLr14Grku
	ia4Do1XIco7ZynglnMEkiQ+r+bUAV3GU=
X-Gm-Gg: ASbGnctV6sorzUA0etf8s9ZFpTokL66QM47VjMThkortTKGvq2r4UmkD1LILLRlyXme
	6ptkqnze4UviEuG9UES0KrBJy+NYvfQ4NgaQcVAA7N6f+6YSi6Ld3Ta+vXsZlcuMmyBh2iL7QjA
	IWpcpaRVVFPh3mmw0TmFoIAmk3SudAb036
X-Google-Smtp-Source: AGHT+IE8v1OCScBuBi8lraSRL4qWxI2qBdv5bWrjKwBZorb/J+6tJr8qbUK35rhsHrGeWQMVVKyPP5G7NFDRXsQU+CI=
X-Received: by 2002:a17:902:db03:b0:223:5525:622f with SMTP id
 d9443c01a7336-23414f2fca5mr48980035ad.1.1748255596702; Mon, 26 May 2025
 03:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525225925.14797-1-albinbabuvarghese20@gmail.com> <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>
In-Reply-To: <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 12:33:03 +0200
X-Gm-Features: AX0GCFtX-9iLHdWfCw_wP_FYtYngY55VwGuxaqmYiFphtTpv-AX9smcnDn_KU1I
Message-ID: <CANiq72nNX++eUKAHYvxMvEeHy6cfDP98cteVAgM7RuQH5hDkVg@mail.gmail.com>
Subject: Re: [[PATCH]] rust/list: replace unwrap() with ? in doctest examples
To: Benno Lossin <lossin@kernel.org>
Cc: Albin Babu Varghese <albinbabuvarghese20@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 10:18=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> The changes themselves look good, if we want to use the `ok_or` + error
> combination. I haven't thought about this, so there might be something
> better here, but it already is an improvement over the previous one.

Yeah, I thought if perhaps we could have a better method (extension
trait) for these cases, at least for unit tests. On the other hand, if
it is just for unit tests, we are back at using something that is not
"real code", which is what triggered this patch (but at least it would
not panic).

Cheers,
Miguel
