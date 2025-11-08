Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B2A55
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 02:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569073; cv=none; b=ZOmaY3fu7RfpyFnW3Wk2K+Ut3UHVgyXc20IpMR1MStB0wTO7c1xvyB+zaBsMBjdsi3LiJ4+qIEjMOnHZwu4yeV+t2Xy3iQa5/ZO+fuoOavn3wOe9UmL1E0IHpf9y2+H9xJY97gU5qpvU3th19D+u4jT1yNXlGEq+XWDll+d8aBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569073; c=relaxed/simple;
	bh=hEsds1aJcMa/MFnGEl+oWU8IGfV52JAmFi/ogcjALRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJCFrEpyIhnmc7ohSKK78nFRoKGjwiCoBgB8luXZ408/9NmcfN1AsCkPfOUQd03iEaZRIZyXb2jwYGERAXUAX63Rgb72ZzKDbxBu3wXk5VyEfd/8ovTqZ1TIAQhE4WoIV88nLgXOGkSlYDlZlDBosPBeQrfxRWnP7fd7/GCi9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZkXb17V; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZkXb17V"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-343610f3990so153747a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 18:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569071; x=1763173871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ywt5KnXkAWuPtF4O67B6+CrKeKvSZlIbIOBaVjdLrc=;
        b=TZkXb17VDXSi/hdNX1nnsUIBUikCDSDYabE2oBnc3ou2BnHl91qhrr8ryuMls+eW4+
         iBXg+fLjOHRcvN1gpg3FLTPwA+TPMNItQ5PAdWwL6eO/+P80WsaqPG5lW0A/6WkRSK6i
         G0uqVqIw0XwaQyN+EFtNoxWqKoEq2gH6qLe/3FqLdOVnIU2YOKl9HUQ4qvaE3EYaoNvg
         BJUKoX6qqzMmXobdQdas2gzy6c/RVHzxcq5XErBAC1g3FACKOP14RVuGsm23EvyndIyz
         d6LBl2nTzq/foUEHxJLTbB6OLk2HIPjAbMBL7I6bc9mns0h52vgFl8rCnvytZPYOcoji
         X3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569071; x=1763173871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ywt5KnXkAWuPtF4O67B6+CrKeKvSZlIbIOBaVjdLrc=;
        b=BuugrxVKah/3yqZRGrHqBks4FWVArzM53vSfdm7pwig8kUVKIrqqF0tpEG9DvtIMwc
         PDqOQQj8rF7T/ANLcfz8A5FLPC4lVYpff5m4Zdw3vX4Dcjre8YbW3X6A03MJvghyOKhO
         J7zf0QAyUC2fqRV5GCTsrk25QIHW1RJqkuC/MJ/RPa6DKZnmccGRNW06VsUK8zNf1/RN
         Ea71Nk3mu3tZ5fOxnb6ZdGpSH/uSgPYip0dpxlwS4kKUAB0hh/Nr9wsOAo5tsz4C6Ivf
         E/7W0yvGyTuD8CsRbmFAnVtOZOuBwIjMhzfdYi7262p8x0z8qLmCwZuZKEkIB90ZDNqc
         vLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLe6y3zAigVl3ItnEtWICzdNUYfZNoKhnY6whpo0BZ0Lh9Pzpufw4wISq6M3pQ9d8R52ImjoaeXATeru+TOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9EFdFrvgkxD0ZC6u/I7/tuan4kpmxpSIIc5mgXJzc2jVKHN5E
	gW/xMbPrQ2NGMJqdFJXEQw2nNzs/gKLyi3mieLBp6oClnFIBBdU/+RB7OZVQew5Li+/GXNivXNw
	NxiUnMdqklxWb/5HC9F94PfmyL/ccAm8=
X-Gm-Gg: ASbGnctVhdIfB1/96DmNImP+PNkBTaNa/U5vol+GPi2lhK+32CsIyzosHiMmk8QIRvL
	TAbXXXbRZUHZsU4zoG/u+b4oIp39oke1APiZtok8ia9vQao8Ls4qdyQiyMHRFd4y1YTQJ58+gky
	G/NaW4/g5hQd38DC5q0hDaXkqAIdZSOWEnZNB7sP9CZObX6Ov4sZaYjk0w3mZn6kKaaLAWANwZf
	BOWdGGXCUqkFRxjF+d/Wdu5lJEQeVmpJ0YCWqrhzdBcHPK3oenwHvLze4YerHFbKgtBvFcWwcjy
	cvF9snxD6lJpilmrnM3g0ki9KEstUBG3QqUbiEMTGEW9KDb6xqmZ2s50J03q/sJ+aLWXKa31MpT
	s8OY=
X-Google-Smtp-Source: AGHT+IEPt/zum4mIPzur6pOWm9ugmaOB4ZnZwdF37jH/QJbMUq5i1HmGSC61s/z25m7jSEylTziMZI9njr8XmEb4iEk=
X-Received: by 2002:a17:903:ace:b0:297:e67f:cd5 with SMTP id
 d9443c01a7336-297e67f0dc3mr6100935ad.7.1762569071389; Fri, 07 Nov 2025
 18:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108014246.689509-1-ojeda@kernel.org>
In-Reply-To: <20251108014246.689509-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 03:30:57 +0100
X-Gm-Features: AWmQ_bntWx41R6dVeerjev8Ne9qVeKQ30TdFKSebUZNEnjznMYZ4D9bO5nuNd7o
Message-ID: <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: skip gendwarfksyms in `bindings.o` for Rust
 >= 1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 2:44=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> note that `CLIPPY=3D1` does not reproduce it

And obviously this means we have to special case this one too...

    $(obj)/bindings.o: private skip_gendwarfksyms :=3D $(if $(call
rustc-min-version,109100),$(if $(KBUILD_CLIPPY),,1))

There may be other cases that disable the optimization or similar,
plus we may have other small crates in the future that could also
suffer from this, so it may be best to simply force to generate the
DWARF with a dummy symbol from that crate for the time being as the
fix:

    #[expect(unused)]
    static DUMMY_SYMBOL_FOR_DWARF_DEBUGINFO_GENERATION_FOR_GENDWARFKSYMS:
() =3D ();

With `#[no_mangle]` may be more reliable and it also gives an actual
exported symbol.

And then later do something in the `cmd` command itself or teaching
`genkallksyms` to auto-skip in cases like this.

What do you think?

Cheers,
Miguel
