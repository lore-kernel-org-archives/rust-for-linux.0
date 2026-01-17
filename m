Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0021255A
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660265; cv=pass; b=h8MPwt/C3afdynIz2i57iSqh09/Hg6OQ/adx4PKMRSeqrY3OjAswcm5ed43alWaaRUuAq59IeaeGEnncPu+wonyjieGlBLjKZES1RcLKglaM8Ytj5ib2VJ9fLxH3irO6VIN+P8aIGVN2KW/WsW2ixKtgKa/5fpmf38wmSK5jZnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660265; c=relaxed/simple;
	bh=93LEvxkOQMwFqGcLZa+tb9poz6NhNTUDJDxbUCc8Rq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua/TqvomyIQKU/IsLVO+q9xP0bBJZtSkAyf/PYgAmcPeDHjv2ZyoGvA6JcBLBhK48Ls7E18XVjL1YO7MzLRLnels5ytyu0xsxsZSdcX1N217Z1t0agsnVNTozgQyonPCUiVTVB0MGErIl4unNCYoHEHMQXMjQD/gLk0pcXB26SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbLhqhja; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbLhqhja"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6d1d0a963so14989eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 06:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768660263; cv=none;
        d=google.com; s=arc-20240605;
        b=N2ePMDqNEV+y/xqpg8brk+PVxY8jZIx66jUF8KMEy3PrKWbTzO0p1+6XPH/v8W/23Q
         kJd5rWEhhoosQtCI/7tabYtQKg9hqmBDVzhmtDGgoXr+Tjw3PWAZYW71VMQT1UpdaY3c
         7afwS/ClU5HoBn6b+vNoTssy2766b1diGG5DHV/br6eDQVOhOFdqAitU0IDG0jFQ6RwU
         8S4isWJYyh6KzEzTmVAScSgQxDx1TmIZUuwPJX1Oy8Oxr+18Cm7Fs1LPmYIFdWiDjzsA
         WypJZ9m97hdIQlOcIvPNfllP4/YhsE8ASmFgkUb0y4mGMSBZaHg5N7POCWeipMr8KBHl
         RVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=93LEvxkOQMwFqGcLZa+tb9poz6NhNTUDJDxbUCc8Rq4=;
        fh=CAmopeIdARHwUp9K2fuAD7DQuS6tnFDd7BwaZYjeiI4=;
        b=ii9cct4Lfbm/SCBU0YNhlYQK05MJl7VMehAO4MAY7+GwLwkqTSDMC5tvt3UmRfp7pd
         nG1Ck7wlncWSqENtu1R1vGNYCJaFrCLasG+m2rEA05MbanxCZ6LCIhRgZRIelE+3KO9R
         0mGhMXK/AKfnHHUbi8YvBuyk6jugfCah+dFsC2XPJ6bD/As2cwdVGM1CdKnYj3Dh6Dpr
         T/iR+3/+GNgOWz8HwuqpV8B43iLCceoWDW7XXv7z0+ela/2elq/HTOsCHNU/odbyKfAG
         oxL5zP32dvz5eLeLkoqnNM7yHWHMhwGOaZie75U4VLsNi4LGxLlUCKp+hu39aIUxEoHZ
         m8+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768660263; x=1769265063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93LEvxkOQMwFqGcLZa+tb9poz6NhNTUDJDxbUCc8Rq4=;
        b=HbLhqhjaxQLiK0RYhil5mCTn8exVft13Lsq8F8LL9h2eJ5DvVztuEIaz1TBRcqBFJT
         kL5gshST2yMeq4RRlwioIHCv3OHwAVZMuSQcqxaEiWzxAThiAXubodGq8tjvvM65gdkX
         IUhWodurfGi9nBuQFuZZPSuP/2slAxTLv+QVJuV3B3N8WtP8CuK8v1rusqtCJUKyYFA6
         yQP2Fw5iOgMijaEQNwCVZXkFi1P6BVLoPpH9lcTojNiJECh6XItXN7rXtvS7xABEEPnO
         KGrmwXk0wFa84JIDD5SPALSMEWlGyRE+1T+BxhlGDQfrsRYNjq4y41QRIa9Rxdeimze4
         0hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768660263; x=1769265063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93LEvxkOQMwFqGcLZa+tb9poz6NhNTUDJDxbUCc8Rq4=;
        b=kXVMxnF/kO+Vxtjbabdcn/m40Jpr4kcS7T8Ma/ESiiMBW4bIPDUoJ7S3tMGlcTSLrq
         PFo5vT9BjPg4r/my5kc3ttOpS+NqoJiE76r7pnOrHpwuIE66mA946LTuhW3/bLvj4qIS
         obCdK3BPPddmOhhpFR1ny8j8YdW8Dd8786/zoL7p1yD4RrrFJNv1QLtnmB/hMcO+Ohli
         fBi3eW//tGg2dRkTThjhbCvVbXtDc5tsSE4xKm8MUvx1p3ojmfpolY+Cwc0PY0Ivtayp
         rIHothTUyRSU929jc6SKEMqSA9DIGFplVZ9KD5SLxnbs1l2263iqGyOXwjUjIDTlk8Hz
         r0XA==
X-Forwarded-Encrypted: i=1; AJvYcCWRWN+b4aUR7xTqrwXYDt2F2tj1XOGTCHMQJEMqL5U41ulQflARZS5rXBsMQcyFnk1DPOEqz0PRbrDTe2jLuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3TvQgYcpe+XTNCC6m9vir20qAgXVmbiEH8BgDPzg0wXhy9btL
	ZKlh9PjovJ3JZn3Vu9YDaBo+7HCx6xqx/jo689974GbtE/GzxFV/tRwF8Is8YdpsN4SFh1DEiDm
	Z6tFDfjUp7zbjv+uKYITSBbI1wxs82jQ=
X-Gm-Gg: AY/fxX6Er39v8UYd98ixlqBeNnPjI88rg2K8tV0OqkOcK+c9+bOFH6U+tWHabjoRtjG
	zGllyMstNXwP8MAQ/0aflbAxtFF0Af2ukIfcouPjNvGL8HFP/schnxZg1drUZOo+zy7kOaheI46
	yPvCgnOU/6BJkqubLMMiZlpahCFQUoFTrfzva5C0yT+t4IxXUxHnI9t0n41x9IcCd1RqVntuwdY
	WQ1UEOjaKKoZfMmCjR/6hoQPg4XQ0V//LTrw2Vdmx9XwbFlzVrUcf1yRFefMf2FwEBoDIW2ZJHs
	xMQyw08vBf8blCUeQdNZ6yC8SOzAfG8p3wzfOTxC6mbtIx6HPgh8aAqNiDGPhyhHP0RaKC2++ez
	SQqa0SvfPctVa
X-Received: by 2002:a05:7300:cb81:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b6b40e9b8emr2809076eec.7.1768660262618; Sat, 17 Jan 2026
 06:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
 <CAH5fLgjP6O0KTsm+dioy0VUm791zrktLTkAtQsG2uN3JSQFUVw@mail.gmail.com> <DFQJEAPGK791.17H92ET2Z9B8Z@nvidia.com>
In-Reply-To: <DFQJEAPGK791.17H92ET2Z9B8Z@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Jan 2026 15:30:50 +0100
X-Gm-Features: AZwV_QhJdb0aY_Fy2cIvBEV9SOLYvQo8pPH_waYxtZGg05XaO0FbpV1fc8jM0gY
Message-ID: <CANiq72k-69Q2iZ4zwyUZ3QOXXkiUc1zSDeO6AuhyDWnsTWv_Pw@mail.gmail.com>
Subject: Re: [PATCH] rust: ptr: replace unneeded use of `build_assert`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 4:17=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>rtable taking this through the Rust tree for this
> cycle?

That file is maintained in the Rust tree, so it should be taken
through the Rust tree barring other reasons, yeah. I didn't start
applying yet for -next.

(By the way, we have `static_assert!` for this -- we should probably
discuss if we want to start using `const { ... }` more instead.)

Cheers,
Miguel
