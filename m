Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EED204920
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200899; cv=none; b=qXFznVeCo799emJ/OGN4gZe+3fFIyRGzqgX+rcpndFUQcvwKBgwQhqIkKbE8NxQ8m2VPBg6+JD98WwujOiN4E6EtbXQG/rnfM6NSq8+xxSGPTM0ZgorccE6Z9laUuY/PdvGmYggTt/FnNKAYEGRNp/F3/7/4fLKOj1kb7VtlHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200899; c=relaxed/simple;
	bh=5eA248mhMlSBebnHEwTM1OVlyNlhmb7xGug46Dma9Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUxR95ZUqUujxCfwfwIpGfqw0VOx0zQNfoGyqNgyfW6NIKUWkbpcUNy3bzwzWsFMUT/RrWMZv+QlYagcbiTQRIFim+egGAwfqqRmtC3Vzj0FegNhmqROfSY8RLjskfkma6N/4FOwHWzB0YV8yq+TQ+ti0+9Yq8UfaL9NtnKKrik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TOTdYVAd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TOTdYVAd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43155afca99so43346315e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730200895; x=1730805695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eA248mhMlSBebnHEwTM1OVlyNlhmb7xGug46Dma9Tw=;
        b=TOTdYVAdfh3A6z6miEgVDB3FLRvU+YU3aweG6BzQ+IJ2IoyozohS5+0VokQ7eMQjkf
         zA6R9/TAQbWgsEZMQ7e1H90Us5p8hluU4hB0GzteJRYPzvq8T0IGouGouv4uwZ95dfHQ
         coClI3wi+zvY2A51B6DLnWffmMaxWDDfCLC1k6FEBWhdYoSGXkjS9KNhXkFS8SR2gW9T
         AkPGdunwtR8J/R+F1HPSyGar2h7uBsCtH73wqtbZo46UAZV2RVHyHgoeIKWpi7Ck9GH0
         AL0cNs8p8poRwHRRpGeSMXMEqKareH7BCKIA92TUQ3vhmf73SOas7ExEu6PrcAWRuIAN
         Zo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730200895; x=1730805695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eA248mhMlSBebnHEwTM1OVlyNlhmb7xGug46Dma9Tw=;
        b=Uyax6sNuvCi6rbc1HNOfqepe2QIbnwZpmGrFNunH9DA3cfNiH3rjGEB/WcAazGwANb
         6kNw3J2i0qcptpiCMfCI3EgTYb6L7rqhgqHsqlYZmQLPDmoBgiXmZmRE+2IctuoiwnBW
         A4vn/51XRft0rDmvTsAB607/4m1qQOLbr7UZX4SMjqO9CWE6XcSLz/zLIrV9k08HhIE5
         4CLRSGxEs1k32UIGWuPLazaH3+5CNN4u6F7MIALp+00jLyrYYWkgHOgJkyC0oC84v+WB
         efBMlSCXi2b6iPn0U/yyjMjpqPe1k3Ryevve9x7posvn98b0zcyUDNLwh5oLj/xIFYDg
         AktA==
X-Forwarded-Encrypted: i=1; AJvYcCXZSkK4VhMcDRduQuHfvWkoXVVt1RG5/w/GWQPFGOwFE2dYuLOcFBUKUzwZPRbYtbpRNPf/SzwdXaVbzquNjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVlJJcMDbdMpBALVwVRx+YHYaWDkIYUCI7DPV802R1KRoubqvu
	/KbzGzFRtVTDKhCwUjmLYuPKIutn2W39yxdShkErXS7EvbZOSsAOuN1nD1rGrbkpuqGq9GRVIiT
	BV4RoZP6PUHjLuzFZRl9VG001uzwb7chFwGLx
X-Google-Smtp-Source: AGHT+IFXxLgUQbYVw3xl4fFrHtGfg3UTWM4CwWXqSnOAQ5YXN5v/ioNZIb+PIWHnhWp1w5ys33ZxOrp8eoRXjjhZs6g=
X-Received: by 2002:a05:600c:1f84:b0:42c:b697:a62c with SMTP id
 5b1f17b1804b1-431b55e5defmr15025045e9.5.1730200894893; Tue, 29 Oct 2024
 04:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLggUUG5dCTjqM0oMpLff1xdGRFxdbkL=gpEaRfkq1fZgng@mail.gmail.com>
 <tencent_D5D7AC8B48B72FC53474E81ACC73D34FDB09@qq.com>
In-Reply-To: <tencent_D5D7AC8B48B72FC53474E81ACC73D34FDB09@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 12:21:22 +0100
Message-ID: <CAH5fLgg_2uxUQr6T-g4dtCuv6bA0X7SQDi5dUt3kLDOG2sw8GQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Implement Display for Box
To: =?UTF-8?B?5bSU5YWJ5Y2a?= <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 12:05=E2=80=AFPM =E5=B4=94=E5=85=89=E5=8D=9A <24070=
18371@qq.com> wrote:
>
> > I had probably written this as:
> > <T as fmt::Display>::fmt(&**self, f)
> >
> > This way it's more obvious that you don't get infinite recursion from
> > having Box::fmt call itself infinitely.
>
> I think these two implementations are equivalent.
> Maybe I=E2=80=99m wrong.

They are equivalent. I said "more obvious" in the sense that my
version makes it easier for the reader to *verify* that they are
equivalent.

Alice
