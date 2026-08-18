Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A837E5F4
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085860; cv=pass; b=HzMhvUl9OFMInxJVBa9EJmhCb16LQRt6qJnHVxNPFRjEa/l/sNu4nJtgWwXugReqzHykbzMguIqsFL2YUJMfJf3EoxqMaUwKxmREHYrb06PzrcgJE4+53RkJNAxG0xdUB7Qa3/NMKGypf/XcAOApPTrdsI4t3dwq/abgVEmd62g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085860; c=relaxed/simple;
	bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUBjLgMpf2qL6JKSIWFz5xqmAPhdvRlszCOYkvPCgJ7TpVDaDIgS7anEHC2A+AQskdHDZiLksZX35RGy1LRXbIqBemXo60PNRtRI6wy0It7qNr+ciI3cuNPhkrddwFGNErt7SupPXg+rKyqiIZYDjcW5ljPH6H8pmupL2aQx5mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiSnCx9i; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiSnCx9i"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d027b7c8easo631895ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 13:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085858; cv=none;
        d=google.com; s=arc-20260327;
        b=NBQYYgZH5PF/Fy6zTzoQvRGzbRDU2OJgQzIp3cP70oPunMWl42p+RoabBd0hcmra9y
         OOVo+NxTq04rdJzM3xm7JmE2444G3zBVc60oqytR121afnqvWI5GO+f6+MnyDVmuJsQb
         ZD+Ypj2CxrNNjzhJnd3LFd/FKnhAkZZrXvkjpri0mOH8PcgTbd8sTYWxqH7GiQxHADzH
         0tejCrxjrohstPJoOBcPgAodomZzNn9xSHedyJz/BkqHoDFvpaFP+KX2AX5uWY1+lz90
         mvqtFe9Jbd9mMQyc93S19TIMsrRDyXBYOQIToDG2AafKmXBEB/eHw7SpE7/ltp9qPqwO
         2T9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        fh=v1OxpLKDOnC8skZPwPk/J8KoQLrileTSoj3ddAmt/TU=;
        b=TYj9NvN/XoPj0jrmKdt7dG5ibE7RnE3NAiEpsa7zYVpMdgv+AVX6BkLyAp7uLvXWes
         s1nCUkWlynSenAoPgCiFITKsRPBoKLEKmY0mbzpt6QN09qkqR5o/A5lbiO8UKuD5v3Gc
         Zix3feLwxcpKmHNT775/niFyfcbBE2BcKkm1POcPU13m2sOcO/CR/k07YZACb4udRzw4
         spXE9GRhoECe/r2pJ8Ny6Mpz8Aa+R/YqTzPImftJx50GBNy6mUmMpWUXMrUdCbN2s+mF
         VRiJX4YMfIEeu0nJjQ7F/md7yvg8wD3g0n79IExhjAOJJ1thJ3zo+qctFzlDGQtC7eSq
         JVdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085858; x=1787690658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=TiSnCx9iAH+ZfAHEl3wMOsgjNgiGLv1iHt7TQM2L69mMIqOJS2RhYu9LXHIs+mf7fJ
         FCpjnNfhq7bb0X4M9cdmKTgUw0dRbG9uZ4j7mQO2H6FPmLBbnkLLhS+fftmOOyVqJBmH
         BQVs7ZWxSVENeLBdZJbYC7K8x+8AAdBoAM44HPFi8TkLwLzXgYwi5ZZoOmj/ZoxiYL3x
         Os7tGScy0cgJ5T2UCI5lANJDUlGoLFlQC1/HfL8DgqD47vzmN+UrOxE5y7ZewRhPAIVP
         shq7ljEda7DVejFUMZ/0h9BFxBWNpPGVI2HrkCK0z8G2ANUGgL0jv5XjYmvY7rY44Tlq
         gW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085858; x=1787690658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=CRqbSpdoaA8ccShs4gmmQ1WDF61V9GqwJ79rvJoaUQPnHvl9267tMbviDAtpm4Pt+h
         y9Luayzvd4MFUCSlfmnYoCApgys9u9gvNQ8ErPo1D7Do1Nnb2mno0Qd2h+wFc1QjhkeP
         YuaDDVX7rr8vv+zX8cXgcYZX8bthCn+pH6i/C1Ug7DuKZeiGGXgeOEBujSJHWQCciUKM
         wQoQBTXDFOY0P0ni9rGi7cX1mEF64RaooRqF3T7aoFxgNiKCVPycUsddf8fWUOn45Ecw
         Q0ZNQ1Bx3nXXVg1iybbLOvEVJft02X4Tx9I55T4jOuCeag7XSR8b9M9hCMEEttR04602
         vimw==
X-Forwarded-Encrypted: i=1; AHgh+RpUt7+GRRcSCJ5Da3dBGb+9iAfvnGPp0h550KVotjtK3sTYhGfNFA0HtLF+V18hBLACLKUSkiAQl3oGhMLgVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykzkCwDJ0zVsDYXZRaJAaEbEzNNcECy8Vqns1CsQ/nsJFqyJX4
	xJdzKybj3+1an1tYBT2A+vNuYH4crzGFrCeKkLWmHhdPLr+qw9liti4usQ0dbm79Eopx9UTrUY5
	KdqngpmfXGqzHrOZoQJTKrwd9Zv/EDKI=
X-Gm-Gg: AR+sD102zZF1qowC+dT3ffa3rBmMJme5n31qZifKhhxwJN3D73uYiL2wDVsWnc1PK4/
	jiCRCp7kV0C+benaEX70pPS9IuGMcRrWZcS7x2oxZ87hwcyE/5ndhCehWysP8fo4kI6UpriF1kp
	zkG3ullPZaSThneBrt+BAMcuII90KAqZTctKN2tYPaeUDD/mZI5SUaQvFrX843d23G1PbUBwVhC
	Xkh4hlw3LGO9bVKJXMgnZGDhkhUkmeh9NeD/lJQ0A/TyatTBhf8rNp7KaaJ7nA8Ohbeb27azxYg
	AtA6Qn6BUSyDKu2rsNxKTOwzQoZlk2a5VpV2MUx9yBF+5PxDKSJ9+ipOLENboT/veT4ko0xSmQZ
	3eEJiC0ll2iK+/RJwyfQF6mkd/q1UCJuUbPsfc/Ho24AUF6Yxw8g1h4a1w5OvH5KWB/wIhOJVzG
	r+yFYkMF4=
X-Received: by 2002:a17:902:f64c:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d5f6c048bamr4365605ad.4.1787085857837; Tue, 18 Aug 2026
 13:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com>
In-Reply-To: <20260818152324.587932-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:44:05 +0200
X-Gm-Features: AcwNN1XULaAA1GXIK7uBimPVbF7p5caYY_9Jijf1I6x_dsAVvxaRtE4L1JXqhyk
Message-ID: <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:23=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Make every Rust KUnit test suite require the Kconfig option that controls
> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
> attribute.

If we are sure we always want at least one `cfg` guarding them, then
yeah, this makes sense (we could ask to write the `cfg` bit inside,
for "greppability", and for clarity / less ambiguity later on).

David: are there cases on KUnit where you would recommend/prefer
something different?

For instance, I could imagine a Rust `mod` for testing purposes
already gated by a `cfg` that is meant to contain many tests, and then
different suites inside that for control (possibly with extra `cfg`s,
but maybe none too for some).

Cheers,
Miguel
