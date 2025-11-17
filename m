Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31660322A25
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 21:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763414656; cv=none; b=nhn+On3baLH65O2smc0je0gIrCkXvdkmQewLBAQZ2chfihDAdz9//nRzvIioNImSxDlPB3VGKDFnBhrGB55kzVbmHbHbXh3rtOkxVODkc1xvdB3j2yfi/hGKvpm13wzUiYpBrvFnsykfVwKzzmKSYd/7fO+5UXHINDj+50LQpmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763414656; c=relaxed/simple;
	bh=G4tcmLmD4TGgP90V5T3RjMU67lyU6CakfI184VKf+7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfSYaDflMKmi05qSFm59YkngrWMmi6iVsSPgch/NXjGlrIRPEwKjLfzhZx7MV7KTw5H43JF0cYY3rB+M64+ZT3EfU0Xf/Bbnm7pMfqbFTWG5s91w4Uf591NphJ6b6EEPijZmHjmR/yI2IVPsQ8QEdMXM5cDXkKOyKsZejnI7fhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmkbWEOz; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmkbWEOz"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso407959a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763414654; x=1764019454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4tcmLmD4TGgP90V5T3RjMU67lyU6CakfI184VKf+7g=;
        b=BmkbWEOzBqT4iabrQZk4EwrkyAzfPKLjh8KHi+zwGIkdb2jRC2uSsKb8I3TCQVX8mA
         NPyOHkFa5QLLqV4kFMUSVuu0enIwUweZ7grTSe556Os3onthWKoaPNCoLSlxNFNFT1Yn
         DD2/Kxnx3XmW07OvjfVv91btSSyWHDy6fig2+LOX80WnfmNNQyXcOPT8fetphBjJzNWY
         2tMncdY/PKX8s+PgUhxGWF7GouWBCPFtIndcMR2BkDLysk3v4eG0oVTnp1C1aOlQD8hx
         OxV6aoqQ4vhMuage0y+Aa4YGN8OiTujJQBExhoSXCrX403V385tAZ0zMa/O0H71E6dEx
         9b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763414654; x=1764019454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G4tcmLmD4TGgP90V5T3RjMU67lyU6CakfI184VKf+7g=;
        b=XU1uwTsZU1ncy4qNVmaN++H5nYpkosWy7OAYgw7TCn1GtT+tcZehDfU4y0nV6+mH6t
         CvQOMsidIkz14d9OJ0PJCgWE4vRTtub6VWCm0g5Ylxc80PJbYpOW9UW/M5UMuk81kApu
         U3RdgE9IEH4DMnUgI88SaTejDIVhLhE1P8D7O62n5FiiAnp4gV6sY340b3LS+72x4Hy1
         3O/bINt4bhCXDouuKp7b74AfUA07YrQ/CjK94gLabouQCq3xmXitQCezcwwos+3o9Azt
         oB9+NNTd7V6dTDodknvos/Wsofi+vTaxuv/PGAvxsrQyby5B6pi1t+6w7kmYCW3JE6Ij
         Sv3w==
X-Forwarded-Encrypted: i=1; AJvYcCW6RVkJBpkYoMz7R8l4Aew4hC1fGNvcIxIdp1R9m/YktgDoA+h3iO6TaFLZDvFFpZsiBaxxtlTJ7XmEHJsyDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uFV9gqbcOlKPl8nv0aH/ibqYIS2dfPGVocZEBXjDixiIeJ/q
	MG+PPEljVnBnoHeHOYPLRjmaTuOZQ5HiArXQw0D2HyG2gWgLkltqA0AD+a85kccUYtMHUfYZmyI
	S8LOS/qPRq+TCjr9v4iOOHsyHqH9Sr0E=
X-Gm-Gg: ASbGnctAj1o55yNPqBlzRv6WYpVRJuXzMM5NeMsNU2kefjtAc83bEOOMG8TZ4eq76KL
	4mC3R/yXBPcgx8xYXJ+QTe08KesxtDOXHYPgEqdt35aZVDfBWdebdzBmRKh8KLMg8/8nWUPX5EH
	YoFQRJ3EPkA1PuShkHWfDz7sHOpnsQIeSN159eWZeH7Ir5xpB2MWBCdj+i2SSCspwkjYj0XpwnX
	GPThdWZlcz7kp5KX4K6emd45+uSWkX9tmMYZWnHQLbKhgGUi6vPJyv24mr1c6L7im1ILpsx5Ovm
	5bvK7+aM3rxB/I2ULHMPkGe+RacC09wLNVvujQbUX4ACoJK3/kCLv/C+WoK6oJWK5qVJYw00vPV
	BVPc=
X-Google-Smtp-Source: AGHT+IF5e9mxc2TlUqR/IuIzDsINCnyxiPRtbODMMA08p3mcq7TW15LDpP62M3hfNnb4H0E7VwOv9J4UgcE6VN2HjBo=
X-Received: by 2002:a05:693c:2888:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a4ab7784bcmr4270948eec.0.1763414654473; Mon, 17 Nov 2025
 13:24:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117080714.876978-1-ojeda@kernel.org> <CANiq72=-w2p8sQgUKYgPG3Tx9GSUNgcVUp24k0ck2RqYgupCVg@mail.gmail.com>
 <da4877d2-65fd-4ad2-ac31-68d55bda7c07@nvidia.com>
In-Reply-To: <da4877d2-65fd-4ad2-ac31-68d55bda7c07@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 22:24:02 +0100
X-Gm-Features: AWmQ_bn2evH1S1qhbERgt7QMqGn0X-tvVoVxDBYpFTLNd4sEA7R3dYLfxUq4l5U
Message-ID: <CANiq72ki4nMTzTnLN2hH6XY_88=dsEYO8fxr=rUaDnxktPtarw@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::disallowed_names` for doctests
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:13=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> Is rust-next a rebasing branch? I was going to request a non-empty commit
> body, in order to make it more immediately clear what this does. Somethin=
g
> like:
>
> The current set of disallowed names is inherited from clippy's defaults [=
1],
> which are "foo", "baz", and "quux". This may be extended via .clipy.toml,
> which so far has no entries for disallowed names.

What do you mean by "non-empty commit body"? The commit has several
short paragraphs and mentions the `foo` example (precisely to hint at
what the lint does).

But, sure, I am happy to add a Link: tag to the lint -- I typically
add those when enabling a lint (e.g. commit db4f72c904cb ("rust:
enable `clippy::undocumented_unsafe_blocks` lint")).

Cheers,
Miguel
