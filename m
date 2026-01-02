Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3122DA779
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351391; cv=none; b=KHvNWipl2/3JYH5zj3KD8wW5KREmD8nveWBvqrbWDtHtOsGYrsfS/k0n4qXABeN+/GlvLt7WEB9c2Sf9TqrlbsUPO/GFgv5bqmU5b1X7rfEiue2QbNHWa2b1xylNcWdn1w5M4nV+e4MYkVr/025xOKHtzB01Kt40M9ukC3cNamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351391; c=relaxed/simple;
	bh=fWKkudA2ErNxi5jjyIqtK2fRadI6D+Ha9ZLq0GzQr/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyjAeRwwfuJmb1Af6tNu5tdSTiRd03RddXr0LaI1nQv4oHGj81GgS5QEZOQwpvsivv78NOXg93NJ15oxf30NTXlwjpE6OzekotrNzxufuiBfdj2PLr7saOVJZJjhZPD1YJw/NH/Cdv/HT59RCETInBS2Ce/gYZvhuPooZ3i9mLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McEIRfU8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McEIRfU8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f08b909aeso28523535ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767351389; x=1767956189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWKkudA2ErNxi5jjyIqtK2fRadI6D+Ha9ZLq0GzQr/I=;
        b=McEIRfU86CuDi7p+QBI2cD9gEewlt26SzG85NKFGm3ZmQeQ4w67NQ5qQyFlTCIMVoZ
         YkmjksRORDySh3l0aBTGi/CayIEh0zw822N8dIm0j0Np99s4wHevee+ecCwwrP/a8Hn/
         K0WjmFQRx8cn+RxRPOFB4EcHQ6S04rKJo21lYTYVeFWyGWGzBJ/2dnBgdCNu6QWTEVnL
         BuzbT3T6s403Gfxv4ZIWTtrYWMwlDGIbFPbXOAkm/Dq8r+8HPrykuK5aUxNAGPgTpiSk
         ZItqVuxp1OMp8y9eMydpAACzKDYpV0iMds3NU1TC0gV/KbVbJY5jjgCBPEjex433x9OR
         KbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767351389; x=1767956189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWKkudA2ErNxi5jjyIqtK2fRadI6D+Ha9ZLq0GzQr/I=;
        b=b1l4LhgYzMC7QE+ua7o8YLTYinCTD1YbuSEPQ3ypo/kAJ8FK3Uz77OiWTqC6zihQoY
         DVjkPHMYjEI9UHxIt05XuQ/a2P06zhSrxFrYcNdfyrRQ6nzMecsBmnbYWXHq4uUA/Ybo
         aCNRxsj57x0jWU6rexwKK5hVSflCyNptCItU9YLGGOOwjh8bmyqFmsRwHpU1YXK4ocEF
         3PJL0v6GYYYNLabIF6PCziChR3rhISzuJXBPsFGCBcyuKNI2QXwLTxel5pSBcB81QyDk
         mwPbrxLchOb1wR3LawgbY51LbvjvC9LF2C172LbunRthmDhMtXUpV7zwvDryQgOOhh9a
         gCJw==
X-Forwarded-Encrypted: i=1; AJvYcCVxVsEKl7UsomRhRh23L0d9jNRv3hvgefRLao2nPPBZMIv2O1vq41TFx2vssPT5ni3kQGe8hSZ8vq/kIGTjsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvjShJiCYXJEqEq+hR8lFaGfu8h8YB89+5gSmBOusADKeHYy+
	A9ZWZPcRZW0IwaXeLbsDSzxDKTMqF9vkBYjR6XZRL0W9WABmrpDu1F87cVoBmKQQdYkRDf5Qhjo
	bGzvVrnxbfjmjdLNgWumqzulZtTrEtEg=
X-Gm-Gg: AY/fxX4biGOiexkVbPnPX5v9lRGXgb9BHJFe1xUwNX+9O1TOaNl/mETm81u8Iq5wmEE
	xTLA8mdazO4kCBpSCvFrMaBtaStT7VRxcgslyVA0V8baw7PoMamPN0p/fnoFu1sh65e+YjBi787
	6tvh0Pb/zqfXOohTEitdRjsReOU2fjQ9W3IIUzmdEP4NsumLH/364Ct9ao9b9PtHj8wcV3jGRyr
	/AMn0dVulFRmAC41vtT/lxAckjV9NGzaLUZIFwpdLlVwF5FR0xPTA8iFx2Gm90q3BNUzGho9HBf
	nt6bP1+Ii0pQbGP57BapaNNREpAzYTMwx5CPLTJA+dAtddO4HkrPoPOMCCZ71z4h5YETivMp2Ss
	Gn/Cf8oUpmjhyoVWrjsBIu/8=
X-Google-Smtp-Source: AGHT+IG4h0VO3HsszG7ePtWN7GVNkx3gtqCRaTqnjAChir4usoheKeeVgvp2BnGihjk+h+UUnTxMhhsWhwK8OGG5OgQ=
X-Received: by 2002:a05:7300:724d:b0:2ae:5b23:1601 with SMTP id
 5a478bee46e88-2b05ea108fdmr20851444eec.0.1767351389055; Fri, 02 Jan 2026
 02:56:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
 <20260101220903.0c099099.gary@garyguo.net> <CA+tqQ4JF_ZO63U4GiSb6+Ym=m=81kN81xr8Q2q3qypYfYQinxw@mail.gmail.com>
 <20260102103643.352fd5c7.gary@garyguo.net>
In-Reply-To: <20260102103643.352fd5c7.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Jan 2026 11:56:16 +0100
X-Gm-Features: AQt7F2qwJ84xgUb9A8p84FuTKteLlCzB7OXSUpQxjsRXB1kwjbUEs689vE5Arkw
Message-ID: <CANiq72nvkA-SS0_tUNX_Dv5ABXiA9aHf2NqNZMtxMOJgBEVuRw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file size
To: Gary Guo <gary@garyguo.net>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, 
	Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 11:36=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> So I'd say while your change is desired, we need to wait until we bump
> MSRV to a high enough version as I suspect there're a lot more developers
> that use Rust analyzer in the same way I do.

Yeah, distributions likely provide the rust-analyzer that works well
with their `rustc`, thus older ones in some cases.

Perhaps we should support several versions, just like for the rest of
the toolchain, i.e. query the version in the Python script and act
based on that.

Cheers,
Miguel
