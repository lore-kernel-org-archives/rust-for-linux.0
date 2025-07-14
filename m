Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD1722083
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521519; cv=none; b=RZ+upDaDLoO4YDe85vH3eGZevlG0ukXi2Jsnb7prXHEWwdauHN1O1xEd8RXYzGhfO7fqO9JzSTkmEb1o3odiz0VZWVgpfE3jc0e9Trnl8kL5Z3McA54sa4787DdgPwYXn3ZYFRnCBEfG9LUAbcivKKvcoL+Gw/DFt0oeVWxvv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521519; c=relaxed/simple;
	bh=zLrbypOrzR46GTL8Pt/5KkdnLKETdTLW70b15jUQbUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JScaQg31fr48H2euZavRII4PKWY5M1YGoZtgl5TwvAx554+8ySJ5NgJkiDHT7b+UzRvLSZZvJckmlJh1WxNuyVozRSOSJhu4mQ63getNhiNpbnLsYWfemMZ+ZUyfFlDGZySldAujphMl/DDtZ7DzDZj4RcJlGrgtGvJLbDIoGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ON60AI2Q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ON60AI2Q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so3765579a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752521518; x=1753126318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLrbypOrzR46GTL8Pt/5KkdnLKETdTLW70b15jUQbUA=;
        b=ON60AI2QfGVXeqaAPu5KaqfxLU+TjHLbXUFhVJ9+QnKVJOHKEtrlTNOOvUo9gcBh2x
         JQ6MCt5GVHv2V/jDShCr+OfoL0DzAH/Lu1N59kQfYUGG/X8mx0JUsS9gGAT2ftWJ/GWP
         eoB+SF4fhTTDYVwLO3tQtnQlOkCNepOAMveknM+rqFYbBq+e5WKj0RZtrgP+WZz1KjwP
         Q5oTazKsparBEeO5WhalRvKDJa2PPhxcphRYJiZ+3UY8JZGC1cYexqWRe5DQHcLh2yKC
         FDmH2CfC5Q+D3WbsNaP4Mn1SwUzOhFIOYjAlu2Z82w1IpeF33aFMP66U9zOzA7QFwmXl
         rtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521518; x=1753126318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLrbypOrzR46GTL8Pt/5KkdnLKETdTLW70b15jUQbUA=;
        b=Xge3FO3gL8wqMW5r+pMshg7CLHPGcqVNnep1qgJKsSydWhXsxQX07jlKoIEv94RlN8
         j3+r0VFUYXDNgPHsLU2/67PpZNjj6yz636l15TvoEdFxGm5JTZUAvzmvgqyeZ4Ue+leB
         JqrBatuy6b1zPyED059b8SGoQ460sAaIq/Uy9cv1xekyJSyXN1TWpxZEWCqf+KAsavdW
         +o0ThcuR6XIQtmI6OnIEUYi05Q4JPurwhmf5AHZXBmFe1jAAG7HJ2IZO6cRxoG2iSwNK
         +BJRtWTzfCtiYw2bNejNIakZaDAdMU9fXSMlAHOAbatvBjG9+Ufc84OUBw4+wcajQGTH
         jLNg==
X-Forwarded-Encrypted: i=1; AJvYcCUDAaeeZ1UG3n/RUDTF/cRna1bglDifMzwnb2AweQP1uEx6YvE2ERRCskF7gIb05NQQdXX0Dleiq/Bfu/TfxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxruqOcKhy1+CRDuha8tnAkPpcjk01F//2+y8bTotgpWbjNGYZ
	qpgrvkWBr9OsVsfzWTR6gS+CF69TU0VJupo1Nk8/bJCQN8C4w0FzaTCc7KSymERQc/0u5Vocij/
	Oj+S6PS0tWPbiVtFLg8nFCJ6sra+/LDuMMyKtKWbL
X-Gm-Gg: ASbGnct9Zj6LylaRoQKM0HWAzOs4gKaZKroJ1l1CRCcPLb0eWB3h22E9oohMkeza3iJ
	Qx2PxV0+jw2X3JJWoeH0G7ClLqp7jIiXqoQljvhrUlQgt5pMOx5bNupULVSblZ6hguX2TnHYfBy
	hTy/TWhfFPp7NtJMAvGI6CEHdqLJZ6rwy0JhYaYKJ7WhrfjhXcHspSTPVV7ObWMEzOFRJec5xDT
	WitZXiG
X-Google-Smtp-Source: AGHT+IEDsiYxX3feyKKPWzR2t9muyDoNO4YK4kUIFl03g6sLc5hPJWuyzDuLWzJTAUc+YNhH9AD5VTE4+VvICtNKxQo=
X-Received: by 2002:a17:90a:d88e:b0:312:959:dc4f with SMTP id
 98e67ed59e1d1-31c4cc9d4f4mr21733366a91.5.1752521517702; Mon, 14 Jul 2025
 12:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-topics-tyr-regulator2-v8-0-c7ab3955d524@collabora.com> <20250714-topics-tyr-regulator2-v8-1-c7ab3955d524@collabora.com>
In-Reply-To: <20250714-topics-tyr-regulator2-v8-1-c7ab3955d524@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Jul 2025 21:31:42 +0200
X-Gm-Features: Ac12FXzQIy3omIUEcNHlxi_83F8sPIeBn9e-6qbpPK1wclA7WZXBKCaASY_2_mg
Message-ID: <CAH5fLghT+wkrKr_2oUQg3EfzZP-ahYDsKtnLcZbeZn6gj+hgzQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] rust: regulator: add a bare minimum regulator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 8:52=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
