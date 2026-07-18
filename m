Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDF9175A5
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395416; cv=pass; b=fSJMtk1saykxoll3d4+fzaIr2wZBql91Yv5xprJPVAUlGRPhm/3BgRYs8/w/0956gL/rB9OyIVIw6NhEZw00zISOz3jHyVpI8erGTzzL+nJGvCOlqV3XHA6c/FgHjoCIsI+VcDwKhH88SBLEHchzDbDeNZU8gY7qjFOpsfn9Obw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395416; c=relaxed/simple;
	bh=M8pmD2lFTg/HN6MNMk43D13KYYUMHjYZP4KRSXHolKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDa8gSQHKDwLrtccG88PoO1l8uqvhiMVOPAxgAIV5KNwyq99EzJn2k1tiZE47wxdMLebOu9YpkmjjEawG28XdrLiDiyQPj52LM+B2zyIOkz/sxNIpbsiEbEIwwAMtwDNED2CLlSw7NlFgH+AoDW5TO4lCHul3UFTegF50Yw8eeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDP7Yobk; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDP7Yobk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca8a3a77daaso195735a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 10:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784395415; cv=none;
        d=google.com; s=arc-20260327;
        b=DmHULftG/hJtNPDuyY7mNhuOnqhkJr/do7edSC0OurMkgBVLQqSUlWw4OWRc8xmPi3
         /BpxCXawdqhs1RZaZxmKSHIn/KFPK9dAyPrM2U+zr6ElJqm1CtJKVYL6DvKwmIDvvTGg
         H06eRLkomx3seCM17I7XnzVLguf5YekB7as4ztOn+IQg9c6dsIAuCdPKNHKqhlXIWCGv
         bwpW1Nubg5aLDUCRGwFA2e2vk85nuX7LV/qMxRVCA4VpJLznV3e2kguyLT8q9L9JCw+t
         ayi3xyvHT1U9zCZoc0hQomWcrSzi4JdwK16wxIO4VvJwGXMKMJBIjDjTcKIXsxFBqQVq
         lMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8P+a+6M5SuHZs1w1KkGbi4RDJsJVScD+OcdihG6KQaM=;
        fh=6dQazk4OtD8DgbS26l5nm/iVMBnWdPgBp/pbkxY/XSE=;
        b=QmzuY9HrirHFwXQsm0WM8HYCO87GBQ2/5eGKHlJvclNXk3/hHK+DI05J4pVDKIcBvs
         qoYor9Log0Gk5H8x88W0ne7vlwYD5zz3I3ffljebj0fp+0qpjIf/IDW9dUXuW9qgHka6
         sHAXCDqn+CJqriC1ga1O9JLt4NwEt7y16J0kjaeVjLANHkjjiAJNd8QFdI8ChxSq0WKV
         Ico1qbxJayjVLDlnRVanJxXB9k/85fnCGxydqbcC5zRCCngr7JapOTu0YCtHqmz2h6H0
         B5g03KBNfSrj/PfVpMlRuWkOTfL1KCHaP/0ddAxXoiJxK289d0DFtcOlDqaLfALdzslV
         UMAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784395415; x=1785000215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8P+a+6M5SuHZs1w1KkGbi4RDJsJVScD+OcdihG6KQaM=;
        b=RDP7YobkCZ+fyWUcXNJWR9B/dTazCBZbX6B5/1zjFY4IEeM6WTNyybsow29CUc0L+e
         wrgflOZ2DmNDI6B1hZ9mA0rlzBxLqPjoUCne0v5uGoMrAPxU6u+bSLe0HyUtQiB+grIR
         +c2Iv68z7XNGQCEHenu64J/Anp/6sDZxXsnK/I0mfxU0Nwlqw2xW3W47ZEmhoqYdfT3m
         0Ji40Oh8yO71/RR4B23Ef9wwB0/IIyGXqPxhgpHamQUFM5vj6uzXUdvuIsFJsTic0ex+
         PCm/fho5zFyB/P1QKfSqGjQ/nG6/cABW6xznrVsWZLwBndCgeLM7vqBpOR6UH3mvDW9X
         vc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395415; x=1785000215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8P+a+6M5SuHZs1w1KkGbi4RDJsJVScD+OcdihG6KQaM=;
        b=jH4B33vWvTJcVnLuCqalOqIBirOwbFeBwJ9V0bXAPBi/SKtF5U2YJnG5a8yE+4a5+S
         5ut8GKADTrzRBh3ubsOd737/8CutwlSNa5i49dFMYJE4lW9as+6A/csN9lLABmGnrgHU
         AwZy6jgOFr7w8GGGCT2+K6nUckFsDt1hiijZUOVT2pFh6nEXchayyVJZ2VsADNIq+lgm
         pJrB/HFRA7qXkWuEZXJSoNCdiyXIG5QaUiONR7RUwh1HzvTPxz8JIXm1drwOIGGIg0uZ
         gsKG2RAzcUddSfrrTP/47gFQPQPXl1pZw9v8KouZeRfTVZJmNFDpj0yrCIy5wmcI/mMK
         4DnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV0ovV2INAZl95eBqfR+BKxbIJBBw7bHpjpKVI3tXWUcWtKl3AAV7jIzZ8S6qEUZPSJ37VnKA9f5QZXa0WuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB+3mcwKGC28KA6la9BgRRgarAFwPJuseiMK+DPcnI5kdkUuSe
	XQoV9BYtPVMrjbpck/NIjO2dYEWQqfRiKcIhEnq6IYCvZrKyb33TG5bgwg7gDLLDhOndDl6xc6P
	mN/1V96nLTq1BWgMUlZlPs1dFlwTimWE=
X-Gm-Gg: AfdE7cmKIHyqjsbAX6RcVdW0bqCQMSulXQ+cUr4I8uGuBDxbj/FgObiFde93rYf/8XW
	9LABWAlOk+S+ZIMgDUr71D5aEPsEMfUjIZwP5aV5zcE6ZIOc6JCxOLKXcuq+SK8CdfEcoBqYYNm
	29aOjwL+gOhK/EhtWRRJpGpaVkEm4tf/1FvwZQnQXrOvVhCDVQ7LhBJANhv6p5JAc3o2Ma7OAMC
	ngQijbbAlWBZ02gzLMWFmNIb5aDa2rkJrV4amzbX2pXtSfI/9JdE9wqTN4pkQuOLa9RIZMjxU3S
	jt92UbwUgA6u73GMG/y7QXBw825xVCD4d8aD1DigavKPGWAyM8eF+p5H8FU5yl3vS6AAdKVvXtH
	UyKSl4cJ0VLx8
X-Received: by 2002:a17:90a:e70d:b0:38e:6d4c:14df with SMTP id
 98e67ed59e1d1-38e6d4c159cmr853918a91.1.1784395415020; Sat, 18 Jul 2026
 10:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <N3Mcf328j6hi7HCJTp14HUC6-cxRUNgQLjvAdkFhIuZM-yYM91SYBYsW7kEVHRkqTzm1B3zgl5Bat4dpSIfXtA==@protonmail.internalid>
 <20260713225235.3243480-1-tomo@flapping.org> <877bmtgy6e.fsf@kernel.org>
In-Reply-To: <877bmtgy6e.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jul 2026 19:23:19 +0200
X-Gm-Features: AUfX_mw2m6yFprysR4k9A06vwPLBH_REFiYpnSdYHpaUkdN-MgJXZzhWn4AwE4U
Message-ID: <CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:31=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> @Miguel, can you take this with rust fixes?

Thanks for taking a look even on holidays -- on it.

By the way, apart from this fix, for the positive side, reading on the
doctests we were discussing, if we want:

  +    /// // One past the boundary: saturates.
  +    /// assert_eq!(Delta::from_micros(MAX_MICROS + 1),
Delta::from_nanos(i64::MAX));

Then do we want `Delta::from_micros(MAX_MICROS + 1).as_micros_ceil()`
to return `MAX_MICROS` or `MAX_MICROS + 1`?

The docs seem to imply `MAX_MICROS + 1` but we return `MAX_MICROS`.

Cheers,
Miguel
