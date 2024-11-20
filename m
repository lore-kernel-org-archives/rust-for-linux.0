Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE1155C96
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093289; cv=none; b=Yb9FErf4ZMutSprpTo93TR4QyM3xP8QUGdw7FAorDB9eUNsbH6yETp8/eYDguKn1IBJLoclIUtZDU07FLyHc2iyFbTOV7OmClQSBH5FiE9c+/+5KJAcHZ+AvTudpwPgo3pi92ZaiWb0MXNOo4wfpyHIoIH0wv034jzkKylfsTBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093289; c=relaxed/simple;
	bh=RxrO6JhByVWN8SK0Qc7FFQag0bS36462NPMf5izLLYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTJ6v1zS6JdUBaXpiM/W0ptr72HgNA/wHqqG0cNjOmrPeuNpg1dSlMMtxne2edK4daunc9PGqnJ8Mzmt98wQtB+EIUjV5PTdgQkMTxkunm2hhYXOb1mtwWfQxPIo2yXiN/Nf9qlxev9jtDOYbDopw23ZgV8HDxWCE2QM0W1k41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F/DnHMPO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F/DnHMPO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38232cebb0cso3168539f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 01:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732093286; x=1732698086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxrO6JhByVWN8SK0Qc7FFQag0bS36462NPMf5izLLYI=;
        b=F/DnHMPO7nbTY8l5/i5ym3jAENlHbvR1Hr48OzK7O+PYtwULyRy8tAYFUp7JyEGtOo
         +T9g3MrWvJQf5oKQSV6Mqn+t5zW+3SyT4k5x8KFMK3FdkiYavve2snSMAMn3/Yk85Gb2
         1ZPEis00Ghrpdh+0QMFPc6Ey3UgHEOallY5bmfBGfSqmOfiRBgZdxgfh9K+xoznc3+EM
         BE+8jS3zSsmQLrJ9v7v6QpNQsjo8MRuExtvEU7h0uiaIjT4edP6dnHXl1onbmgjVTJJl
         RQ/JP3cvWf2zbbjSNEfbetshQt5QVmgVAZ1yTZHJ4D9C6ILgn37Pubz7lXl38jfshj5a
         L1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093286; x=1732698086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxrO6JhByVWN8SK0Qc7FFQag0bS36462NPMf5izLLYI=;
        b=RRr6UzDCX8k3TYkTh/B3LkN7Q1cC1jHGs5oEymm8zBzgPlRnT72O2XG0rS7Kk5BJom
         Bp8eqmtocq4/6tNoNHYaMgTBe53hO0jxo/3hYo8Ol3LTjXYgPbo6mZ1x3fcRp8SZ+SYB
         2A7lOeUwgVbyBc6U6Z8Dq+UTa8ooM4BQFJNuAqTNjWXq6QRlEnniLr0JRkKioqXS2U+S
         OWSx8DbVFPriIzcZmwzZlB4RIO4iW5tsszOcCj9R8+U5CUn5flcqM0RJUfGdnrEH8I8b
         6heW7aRjl40RC1aiKA6hileOhe6HTGKm/xMwh/VIlh6Tlw6VZK6hH1x3SQbnZYCwu+2W
         Ig2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkTAOaocKAVodQNYXOSANC94+2+ivdoHZ9FD53EH3YT0/hunP6E9NgcSiszybt6zJNA2ptQRa5akJM21R6Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhdfB0k5yarmtJZI9Cz7HZG8ZsmQBPj8WBujvumT8nwmhW+qd
	MtIGWiVmfcTtHBu3D3poNhgRU+PtV9KFGCNLJZlEA2cEtyHXbVSjV7mvX1KeQMiUSL3Es0akkL3
	2jtOu7H/xiUHNj6pblzObIfZuIRwEYtSWzJ3P
X-Google-Smtp-Source: AGHT+IGpXXbtSFSs81aKhatXLEeYkocz5d2XVefgBUJmjcYzFxkEC7cxn+Y5rZtLrvV6CjnCh1lUL8o5g2wjtJQLHPE=
X-Received: by 2002:a05:6000:1863:b0:381:b68f:d14b with SMTP id
 ffacd0b85a97d-38254b162c1mr1271767f8f.45.1732093286393; Wed, 20 Nov 2024
 01:01:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119192715.38282-1-daniel@sedlak.dev> <20241119192715.38282-4-daniel@sedlak.dev>
In-Reply-To: <20241119192715.38282-4-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 20 Nov 2024 10:01:14 +0100
Message-ID: <CAH5fLgi5rLSqxgHYxt66GmCu-nv3csPsJiO3ReexRnp37udiBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: kernel: page: remove unnecessary helper
 function from doctest
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 8:36=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Doctest in the `page.rs` contained helper function `dox` which acted
> as a wrapper for using the `?` operator. However, this is not needed
> because doctests are implicitly wrapper in function see [1].
>
> [1]: https://doc.rust-lang.org/rustdoc/write-documentation/documentation-=
tests.html#using--in-doc-tests

Normally you'd format this using a `Link: url [1]` tag instead.

> Link: https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c=
7886de0a@de.bosch.com/
> Suggested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off: Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
