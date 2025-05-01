Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1857D2AE7F
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094697; cv=none; b=OpE70dPp0mLuIueqHqas+Tz1dV6NrY6Z78JrAaSmNbGe34aVFxOEdlDfIRkXqTnmOVo90S1tvSwtxoCLCk0GyyUzRlAhFnjbWubfi4dxWWqZX3yyDu0b3XUSpw46estKik7v+vvA6e3lNQ8/mxhI1p8AGKCs/KF2gt4zOEScSF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094697; c=relaxed/simple;
	bh=ZTR7TBqMTX7X33aRZ3YzhN7mSRAkRoo586SaX//XPNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpyqvaeo8NpfAdPyKrbW3x6Sj97vSrxTwLxFx7QLe9fPk6F3lJhJrbv5RzT23FR9Mku0K5kRatZyDggxLEk2QsirXsv8QVpnSRjkU+A7x2iELroivxkb5uf/+TCubrgFncNVWjsfq0XrGha0emcmyreYBGlD7gM3W7SOs3uLRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3XKeE+g; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3XKeE+g"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so115194a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746094694; x=1746699494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTR7TBqMTX7X33aRZ3YzhN7mSRAkRoo586SaX//XPNg=;
        b=c3XKeE+gZg60xWNspt/leaJpiSQ9BDv6B2S6VN/E5BK3NikDOO9sp5qfWIxfS8Dcci
         7+sc8UDXjC4ASGnvP2g2eMLKpwJ3Dqu80YwnmNxewytpk4iwUkfSKW6CKu+I2UjC/jrb
         F2CfjTMuI6MGchaxU0uJg5hXce89ghihXBpF+6Uevo7hzFrz/QX6RKoqyw2O5DH/6skS
         mPbar87oV0h1tPeCc8w2oC3lm9YT5VTDPqoUNcrhgehfOA/uQrMZ9k8WPTJy4LJTKS6q
         lT+jZWuPx9JyGzYM21SDuXZugnHCjlZphPjo0F8n2axgxzknJ7EB3xkWXmy5e0yxd8Na
         f+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094694; x=1746699494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTR7TBqMTX7X33aRZ3YzhN7mSRAkRoo586SaX//XPNg=;
        b=feIKN9P9QYtH08DiaFNB/M5LVGQsTS9qyRDLkksvXLH2usVjR16a4ZkfBzR8qoWSTL
         MLctnxJMQk13OEHAqeh3aTxmKuhzH6jrLwkH8w865r4wapovcg1iImLPzaiJTY3Dg7rq
         7bvSsYL/rOak4N/Wr7YWdqKjXQpMURINS/db2kkzrQ/VndwLMBI2An3uhnc7vFp2mhF9
         Q+2x6P8yX3PGpMxoB01Ysp3aRZJ4AS7D12f0XisKcpeAB9oV8iqKePKYLAntJ61uTkcY
         qKKlm4hRgt3JXlsIEuRbEVwI7r9V4KLGlUNpt+kfgvY4dvfZ/8r49cGwz00AM+4GAy0R
         VO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXm3YkrHjt/x9BgIvlTxr/cL9Me4oEGhfuvnh7abABVaxlWHkNDf+z0BvUURqqJ4418aclLacyO3z3hm3LupQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtxQiWnr/B5m2i8HX0aG6JaStcUFGF6bDSyIaxFk4rf5GJ0N4c
	yfBuSbO2Mh30XZxQuZHERUpkRKSlMgAFICg4BGhGMMLz/D9jXBiLo/+hiLcoBsdI3cyRyBbeT67
	gX/ZAEaMQxJAcNBEmdy4i2TOvIoA=
X-Gm-Gg: ASbGnctaae0hOYnQ33V8NzX91Rz98Ka1X99AQYRpXOjU6SnI/mtZny9Nktt/7IY9CsU
	owMQ3kq3xqmz2/EnAwF4b4edHOugC4ExmIuJFS9Eog6tjI6MIXJw/Dl0hfxyM9zSsnRaP5k3Tmr
	UtUP60VYUT7Bu8ZaiopHgttQ==
X-Google-Smtp-Source: AGHT+IGdHKEyiXVXMkjdaheAfVA2kO5dlFuZTgEUICeZq73db6TXDp1Aw38l3nbAxKnPn7InpuDfDrqwmL5yltprn4I=
X-Received: by 2002:a17:90b:3852:b0:2fe:b879:b68c with SMTP id
 98e67ed59e1d1-30a34a97f37mr3274976a91.6.1746094694231; Thu, 01 May 2025
 03:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 12:18:02 +0200
X-Gm-Features: ATxdqUE14tgzbLCtmjP9zN2Vy1kaFEOoat9wynq3EOaGc2VPivCQX72Bvk63x7Y
Message-ID: <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com>
Subject: Re: [PATCH] rust: revocable: clarify invariants in safety documentation
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: benno.lossin@proton.me, ojeda@kernel.org, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 2:57=E2=80=AFAM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> This is part of issue #1160 ("correct safety comments and documentation
> in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1160

I think it was just Benno. :)

> Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

Normally one is supposed to test a patch before submitting it, i.e. it
is implicit.

> +/// # Invariants

We also place `// INVARIANT: ...` comments in the places that need to
ensure the type invariants hold, e.g. in constructors.

Given the issue, I think Benno may have also wanted that you then
refer to the type invariants to justify some of the comments, e.g. in
the "Since `self.is_available` is true, ..." ones.

> +/// - Access to `data` must occur only while holding the RCU read-side l=
ock (e.g., vi

The "must occur" wording seems a bit strange for a type invariant, but
maybe Benno had something in mind here?

Thanks for the patch!

Cheers,
Miguel
