Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB51CDFAC
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 17:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754329617; cv=none; b=Wg9JdEZdWvxkB/j8sxZomI9xwOguWTgmPhCDRyeLUduGYaXI95E2zq/G0dg2EvA6gX35jzoB7FzzeuPRlHfr721X0BD66sneQjG9RWCEVv67dZJfc4jNLL70isAjdmzWnady3MiR2splyBmOu1cjbM5TTZVdtdikReQKbGf6iZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754329617; c=relaxed/simple;
	bh=zwrf+vy6Y7t48AARVBHOaA441xt+E/SPZ6c1gn5VaMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzjM972k74mD1h9V7+VMQrtRB5sM0nqRGbuVIU1JIs46rpgFoAEscYPcKKD4A5A7NWfd0MVTg/p3r5Y8MAAPOMEi2fLNeQ8rEG5Kw+sItrZ8ycfnZBgLwjqSkaDG11S9YJZdWP/y4nO5OKkSLkjbRalvqgPf8gddya3oUzXVgbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij/Mxtb0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij/Mxtb0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76c1008fd60so59914b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754329615; x=1754934415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwrf+vy6Y7t48AARVBHOaA441xt+E/SPZ6c1gn5VaMI=;
        b=ij/Mxtb0U0YR4BFkU5Cvj45sawG8OzMad5CKRrrzhO97wzw6lDhbGlLhyLlT2F0X8m
         CwhlDdboKU96xU64xSDthgrIMRj/a00UXsm15BSUW1wqGexur3xKx6R3thjpMro6TdQB
         lCvEYDimEgKU2BqnGjN0FJcy4z+FmHqZRF2GK6xlvFmCyuvVAqFNbzDC0fnJ1JqC6e8O
         kNC5PERCIqY4pOPlqopnO2yLAfKXHr+3q5bNayFaLK7d67wudRfLXraudd8lou3pGYIo
         cFgp3PIBNDywLXhPd77o479ICJa4dYep8w01QprU/fwgViCoX0i5dCcHpV2hJfrJZMym
         Wn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754329615; x=1754934415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwrf+vy6Y7t48AARVBHOaA441xt+E/SPZ6c1gn5VaMI=;
        b=tmZXaUgoeZKwP3DzcKt4PrZFDrAJji/jPbA5W3g76Wj6JJj6vDu3vDtWDXyjNYZx3E
         S9PasRwVRJIlC+yMa7VCB2YS+w3kgMAN+YD1z4BBFsiIQGYkoINq+IB+x23Rw0x0/78O
         tLRykN4+darnrVixdMLMANCKikpQ16PyfnFoQiik+YmkliJXU86dVb3BHGTf2bABeJ7U
         Pobt9bP7/OP9FDcSdW7A6Rvk0fen24FNgtT29DOu5HOsaWNpV7b1g8IGkxd9K1aPFBX1
         /RD38/xPKjhwstK/LIlQhlYqmRxkjP/eV4NM1a3N9gP1UCTJfUElUDD04p0iAvCOHoco
         prlA==
X-Forwarded-Encrypted: i=1; AJvYcCXq4Wb5fbKpSA8v1AM++1SC373Osf3VxnW93lY3hCBYaAss0AfnPOizKp5O0FbhzJbqSOUBB9kC1yuyqZx+Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSSgtsBhxj+OZYHl86dSaObO4k4KCTxkL8tCOmVTIenP2P7gM
	CUGE8ElFDKu8hb4lFnS6vRF6jW4BtusXeVY7M94PkPvQq8A2Ii13lCpwhY6SmS60ixjEafx6dZm
	+Wqk1h29Gwk59hT/aofXfF1VCP/KyT88=
X-Gm-Gg: ASbGncutn1IDO5uDoDCoTio2niXrqTp2FCFXO0YZjIhCA2w4mSUsZjgJbltjD7Y4wOI
	KEZQ4Niyx6B44cLrc83hnL0xwNgH3AaQ9q/6keh8JmdL97n0NNldfVauqkkYETdA/4X7N+n54t3
	S7yqGijIINicVK3sug72woU0F52rD93MmBWtk2Ib818dJDD6xvOFz20uYArLI5KHtrv4hQswFFy
	nBZEaE=
X-Google-Smtp-Source: AGHT+IEvkY1bqcBl7HK6wkH86vrUFWcPXkpBkTGH1UdVX9+KTwETzsIADvqC8A/9HXtZ7TCylEMmb9IaA5NwWSWMTIY=
X-Received: by 2002:a05:6a20:9f86:b0:1ee:d621:3c3f with SMTP id
 adf61e73a8af0-23df8d6cec9mr7450184637.0.1754329615260; Mon, 04 Aug 2025
 10:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com> <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com> <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com> <aJDbmFx3QAm-TY4L@shikoro> <663019c6-af05-44bb-ad9e-3b88cbc399a8@gmail.com>
In-Reply-To: <663019c6-af05-44bb-ad9e-3b88cbc399a8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Aug 2025 19:46:43 +0200
X-Gm-Features: Ac12FXwFOrfC1YH9RfWxIB9CEgCf25SXE0QG1FyFlRtJBGXQr70RlotvjT-JmbM
Message-ID: <CANiq72mej61wXGuoGS2pDo=jTf5T7W_kRS+JqqMLSQWEKuq3+A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 7:28=E2=80=AFPM Igor Korotin
<igor.korotin.linux@gmail.com> wrote:
>
> Can't say for sure. I don=E2=80=99t expect much from my side, but from ti=
me to
> time there are Rust commits that change multiple subsystems at once =E2=
=80=94
> kind of like a wildcard hit.

Yeah, I think that should be fine, e.g. those would be expected from
time to time in C too. In Rust we may have a few more since things are
still evolving and we try to enable useful lints if possible (since
the early we do it the easier it is).

In some cases, we try to take those "global" cleanups through the Rust
tree with Acked-bys etc. to reduce churn, but it depends on the
particular change.

> Anyway, as far as I see, we can always adjust the workflow later if
> needed. For now, we just need to start somewhere.

Yeah, Wolfram's approach is also a good opportunity to learn on your
side with low stress, i.e. I would usually suggest that when he picks
a patch, then you can try to understand what he did and why, and
whether you can replicate the commit locally as if it were you picking
it up etc.

Thanks!

Cheers,
Miguel
