Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA461946AA
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330626; cv=none; b=QLfPa0m8IEYSxcMWe76psM42HcdPEqtuRx+Trx7VJQwnVSVa4Zc3MPyWwfO7tjhwxy9Cer3AfpdIOO/ttdROMnLo74izb6P8ST4nEe2FwoDDA+C9PGYxdCbyzotL6rYjAjV8FkueQOTnUMzb0wwcetLFn290CAVZz+qcDs6dvro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330626; c=relaxed/simple;
	bh=t9U8dK5VWA4M2lOjMHECPT93ID6JuLlckPcj2/NkVO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfJ1oLWkl4t0uVaSBsIdau7N+vMUbVRvDASMbTiUwsf0vQC817L9hnnm6hkFPyHnR+drMtaJorqr2lm+0z80PV6NCef55LUlhwvSvKyqDf9FpMcR5Ry+VoSUQsm4m9bozFstNMhZz60ouv41QGzHtcEeA9kGcCwAn98lDCMdd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpJGb1us; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpJGb1us"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2edso259091a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757330624; x=1757935424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9U8dK5VWA4M2lOjMHECPT93ID6JuLlckPcj2/NkVO8=;
        b=EpJGb1usxJwM3LcI2XLCtNSHabbAjUM7mxHgKDVcHlkRHjmhRW9SEyPBNnWic2D7UX
         /QvRMO63VaxY47BnMlw3sJ1uaSjt2lBFw9WZqOSNJdbIApdxCnJJqlZgSmRIyI45xNe4
         V+MZ3Kkdv7De++9FEmtTM4RdTi82LL9VSs1IRcwuW4Ql+o8AqOHuW4L2gx05Y0yhOBYK
         wO0Kezm5wJAjltLMBaOee6IsSanfFJk+AgzGkItYGpFdb3LFs96TTn0TAsWtRwlZ3HAb
         OOQZsDXPfFLl4MjW/w/0JUAQ8m6SpQtHRt1XBpT/ibu7PIb70wsfeVVMBeU5kze81up4
         tvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330624; x=1757935424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9U8dK5VWA4M2lOjMHECPT93ID6JuLlckPcj2/NkVO8=;
        b=vHRXM0sVinOtwdWjyur+1CbTDkt82JWbhu+pP7Rj282GyH344GqJVc3KEJVKd7y1UX
         SBK1WbCaXg4zbpiAHnrV4KurYqIp7wmR4knQwRJdFY86cJ9Sh70ABXj4EshwJj3nyl1h
         zTaYFimOVOorojulpfO4SlQEdZFkS9TLHEF4R9C7iXzAbLLzG00BI2u77ZED71l1wZ4y
         SZj9s/UIj6cmNyxlMAjIoamCa3YoDkFfdGJG6Iabdy2kv2f5m25yq9Z7lePOhl6Z9pDh
         s7Ep0t0sGIbRfIEVEeOzuhP9Ep/WPXTaOS+G7moHyuOADE0S0NIk+95NyxqXl2hTMqPs
         3XsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuK85vJabx4x5LMFwPjFkqUjFrPro+Vo3kh6L/OGIRFPJArRxNvv1Z+LurugDVCpPrYJeAjSFK2+eWuYZVZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYVTbdAlM0sXZ1p0p4lxf/pJ68SfdoZbVFC1kvIV7uxNF6WnY1
	r9gBnywlmPh796uUxV74tH65HFlf4j5X3cFsQyJV6U2qPkjUiRuAi/hqtKRPeoRI9s6jt6s8zFo
	fT0nWuUhTm+olO61bmJbEPZKo9qlyWDISNVU4ia4=
X-Gm-Gg: ASbGnctopEz+FAoK4qUuSPBqyDeBXYWkh6Tjrhy34YGeBzTWSf+IXE6mUbnevXNxgEi
	l4bBD9nV6o2VAhc4PAScRlgj2TL6ZoVfuljRnx4sskQ7MVnH+loGGFalS2tbBmkGISiRzEwNt7L
	HO/tVkvz8ySJuExRDHuR/ymJDXkem2se9C1UIb/qJxOgqJNfvg47z0Jb6MqNSKltKmPDHB/jGvx
	aydnscC28HyZ0l5WcVzUqcrkRmvNfFZK549PPMnWrZqeoFEf7aPEHBFraWLxhlm/zNPfwKC4TIw
	+hv/rGC5r0d/21hPPwQ0lf6TfTvEgMkFWt5K
X-Google-Smtp-Source: AGHT+IHCJz4j4qcdpY2Prbu2DNj7mvm8p7VoyAcZ+lvJJ4uVHm2/9LMnYL+iExKw+6lHsSZZoD/w0oWV/NnGEbzCKy4=
X-Received: by 2002:a17:90b:3883:b0:32b:9416:312d with SMTP id
 98e67ed59e1d1-32d440ceaa5mr6079902a91.8.1757330624052; Mon, 08 Sep 2025
 04:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418014143.888022-1-contact@antoniohickey.com>
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 13:23:30 +0200
X-Gm-Features: AS18NWCqEgslLTO-oJAxcJEFPW487WPb4wX2MfNoH4WICQab3K3Mr6umEfO7Y_o
Message-ID: <CANiq72nXzwNBKTpvjvcpZyZaB1mC2JjvGB7YWqi2xO9BUoYDjw@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] refactor to utilize `&raw [const|mut]`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 3:42=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> This patch set enables the `raw_ref_op` feature, which became stable
> in Rust 1.82.
>
> It then replaces all occurences of `addr_of!(place)` and
> `addr_of_mut!(place)` with `&raw const place` and `&raw mut place`.

I think to get these patches noticed it may be best to send them
independently. Could you please rebase them and send them separately?

Thanks for this, Antonio!

Cheers,
Miguel
