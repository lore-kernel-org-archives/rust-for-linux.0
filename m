Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F5278F4C
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Mar 2025 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742655766; cv=none; b=kd7TkYQWfV+x7dEXt4N0wOE2IUusJvk+CuPLMgiJKbvMFcQzscHh3W+Y6sosf9v50h8M2URztWrnmZ8heI1M2x+zNy2MBuiMerQn/rnXZCaqzSjocTmhrRkCFeKpGL3pQQ8Wa8gL1p9LTwu+iIIVyZT3BjTjWKPxCwZD0ck8jik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742655766; c=relaxed/simple;
	bh=xmaBHHV+pBO1cdNj9lOsTobDcjk4fT7ScUbArphMew4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKmvYc48tmZqwWFf0xwxxDKQ1FZ5/gjDI0rDKivkiUgp7oEcF3CV0TPYKhfCUt51r+a3G+BV006vlkKj8XrK25P8A8fyj+TYLwNvHdhHKv6NHjpHsb4a8rF2zx6VA6uC67uIFQPt3p3UT0mDpkxdGcH5ZRKnBw9kCd1ttX/4PdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=O1fL6+eG; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="O1fL6+eG"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f768e9be1aso38427877b3.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Mar 2025 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742655762; x=1743260562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFV0r1ify5HIIcyLd8ZfZYsL133OkFOEjRPT1PjsIps=;
        b=O1fL6+eG7WedNBGfCyX6/ec/mBPCCb788J+BJh7tB8p3zVmQ7INQcPc45cFSPplr9N
         QBp6FJpA4MRSt8veEfCsYPJQUSvALQz/uAdsxcNRtPoc4ydzj4g8REAZt/olEW9YBK68
         1aPxSdWBeL4/F09EQEx7TJ14dQ6kMl+vxw16I07bgjapgHdsnhx7agg4LSWWKGMNd+eU
         l++CCrhQanhHnIKfaf0AzPG/6Yn17kCebG7d94Z1oh8DRTSGKXwe0IIrgflr6OQ5p4Vk
         j1iNBn8wUNxWpyDrL61eNZNxUSxzBjasg4/YcHt3kV0eciGx9kw6l+poNDi6KNKints7
         aJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742655762; x=1743260562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFV0r1ify5HIIcyLd8ZfZYsL133OkFOEjRPT1PjsIps=;
        b=TRQY/robBZ3pRbP9PtXyIG1RVfKb+CXjfnwvZljIQ8qT/qzt9ohScr1/4SZG5Xg2oj
         P3oXnr1Nl6WtOXhNlojreZGk6rW30WmeaBBSRcj7tQQbGFxFFIQ69I1tNXU1onF5mBSQ
         eJPQvpKYCXk/O1n5UXHh0rOci0CURMtmuVxYqTcGGiRqNrOzlTA+6ucZ6AnCIpnhUJlY
         CcoK/s/acBrdDHTTNPoPn4xrrXGOjYFS4a088AzE4mbKul7PtnU01HFXZSw2anEvGRu+
         7ZMYPu3yG1b4/q8HiRCi9ZAV5nItBu/s02b6GU0ICNcLHsA8DnypE6PUmJcLnpNiJ4OC
         ZrgA==
X-Forwarded-Encrypted: i=1; AJvYcCUd6t2MGTWiR/LtN/CrRA8CRcVGxeFDEVp6oN7buOgVRUXIv+uydQuF3TTzIsZ4Saq4aYEa3nY28QNZDU95Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz20wxsoNRXj1bDO8gRLKZ1CcYEGyUxBu1XVlU1R9+ehBQmXm1w
	WXDpLxDQ6izNH6K02OOmgI2BQhaYatFDl3jRX3ZjEyfLD/A8KmQkF4VoJGcAs5U=
X-Gm-Gg: ASbGncsQT/pYFiFV62Ej1M8KKWOrEEYRahIMPpSw/7ZhvKj5cdRWv/CE3tzBs5tIkI8
	kDXCS/S92gs/5drsurvUECE6Wvx9Ccb3kIGQGfcFgCktu4VNExNkDlVyIkGtkH9hfo/XfMpB+MY
	vxESLjpA9Sc4wJGyrBNLMsOpqUgspZcxThbwqbSAf+shmSb0yHLmN714mJoLkVXxWDXJR+JEZho
	D28bbnIaPcGKCxsXde3of0BVQYSzJc4UDuyM8XKGBuzKJk/TxXM41nTwqnJL7XpYLwWiGpPGbFt
	BQ11R3svJ7J3pReYQtvMCb2UkoZI4EgWNG5ToBMyUJeQ4ioo0HxvrmeZb3pOlb1YV9ne09Ik4Ow
	UYLVQToahF0cR3cTpv0AlxxlpoHhFACMw3SZPJX7y
X-Google-Smtp-Source: AGHT+IF2ZG+6e1bR4Awen52wPxMIUEY8IX43biiu2wKoBJJwjGEumXzrFQv+3RyxSGDzYPrMHT7LBg==
X-Received: by 2002:a05:690c:6c8e:b0:6ea:8901:dad8 with SMTP id 00721157ae682-700ba305d15mr106328367b3.3.1742655762158;
        Sat, 22 Mar 2025 08:02:42 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba73d085sm7897807b3.15.2025.03.22.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 08:02:41 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: benno.lossin@proton.me
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature 
Date: Sat, 22 Mar 2025 11:02:35 -0400
Message-ID: <20250322150235.1851241-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me>
References: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Mar 22, 2025 at 10:16:01AM +0000, Benno Lossin wrote:
> On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> > Since Rust 1.82.0 the `raw_ref_op` feature is stable.
> >
> > By enabling this feature we can use `&raw const place` and
> > `&raw mut place` instead of using `addr_of!(place)` and
> > `addr_of_mut!(place)` macros.
> >
> > Allowing us to reduce macro complexity, and improve consistency
> > with existing reference syntax as `&raw const`, `&raw mut` are
> > similar to `&`, `&mut` making it fit more naturally with other
> > existing code.
> >
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1148
> > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> 
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 993708d11874..a73aaa028e34 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
> >  	$(call if_changed_dep,cc_lst_c)
> >  
> >  # Compile Rust sources (.rs)
> > -# ---------------------------------------------------------------------------
> > +# --------------------------------------------------------------------------------------
> 
> Not sure about this change.

This change is so I could enable the `raw_ref_op` feature for doctests
since the minimum Rust version 1.78 still has `raw_ref_op` as an
expiramental feature, and will throw errors at compile if a doctest uses
it. Is there a better way to do this?

Thanks,
Antonio

> 
> ---
> Cheers,
> Benno
> 
> >  
> > -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
> > +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
> >  
> >  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
> >  # current working directory, which may be not accessible in the out-of-tree
> 
>
