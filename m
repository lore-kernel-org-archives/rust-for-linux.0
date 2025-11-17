Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAD27C842
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390973; cv=none; b=V73TYcZ8/H2oxdUzRLJLTLZp4zJgs57AvZRzoa1myWhomZmE2asWzV4PT96LIxxh3ZeKPpONwkgQzzgLal8xHOBYD4VJi9RTNLBtQSK6ThaOpsM4QMjntequKW0PZUxFde37htxikd7+ZMB5Uh3g2ZnRirPb+h56Eapl8nOnPZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390973; c=relaxed/simple;
	bh=WW4x1JtHJo1lgO8ectKyoMM+RyxVl9yZ6KIMMuM1jpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XdVbwIkgP2XHRIObp03sZVuFmUD3+z58SLvryYf/HFeCHCBHTFc6+253tJGNa/TaWZ3pf1OsiLiIKFu0ottUX0gHiLaXoaizQRo0hTl7bMxWKyqLVkc6SLCogshP4t/GFprf2E3TWicKHte1nDe8D67q5VqbfE/IiaH6Yb3QJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2JU3Zkuj; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2JU3Zkuj"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b3155274eso1766182f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 06:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763390970; x=1763995770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJT6gufnoNQkAg8VpeeSoHr9N3KPlTAXTRkK2kDfIcg=;
        b=2JU3ZkujQtp7VM1B6xeQrWXBO5TB3YN5mQiKDnHmRuvQFpZ+cgTmuI4EwDxjaL6PHn
         A0Ay1UkDMcREl64r2/lIy0wN+TfuSfXUv+KeBv1uJAVO3MjmyjXVd3YbFfqZDdCqLdRN
         JZ7hz3gCoqcDB85D5UAwRn0OL1PjvA6Bujq4h2KZejkljSAZluZnXbCgXw4a1+ruZ3GA
         voyhNuGu2CZFJmip2fS7Pue+ZwldAHpevdSYELxin/vHCinjS3AKwE5ziWEWYpxKC4bq
         8juVRnO+x4vMmxU/apLXQ4OTBWz26xVqBSNyNgCx2qobXfdxTW4edjRE94RbsO1vRqzN
         SUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390970; x=1763995770;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HJT6gufnoNQkAg8VpeeSoHr9N3KPlTAXTRkK2kDfIcg=;
        b=C0q01nrwAnpr7pfw79WtRSpZ+a+xm51ThCpA4/1MiHM7p9d4C8J9qVBnFmfSZJASmK
         amvm1oA+bD/Tu1bHlGrQr0TtR/PM1s0UmdE5k8RRS+mxT7Jupd5MyaQ+4g37HRjCFqP7
         diCHLyeqyffZXTrRh7gOmOC0ga3Vt3Bba+tPe73OCu0kDK5+FshZiQspHcPhw1JUP/uM
         qwYdisy+kFQSmfWjzkx4X9NXHH47ZoZaSBG4QC6fiBUbGynSZ4HSF8uJUhUxyNcYcVOC
         Y48Jlex6IzHlGbjr1L0yfTS7joDWeoVDKAdVJtO+pCpkOfgQKAt1dypBUlJorgxlvy2R
         P5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVsqw333S+xEYlfBNaFnhMLAYKcpXWiPp52ecQ2OIipMiQVjQj3w6NlUaRlD5dIWA92ZvvYfq4xZxSyBo+WZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIoY0nNLL/jLQMdx5Hy5A65he+0mJkFcHkM3/ERIuWN5ny85h
	M+g2g9TaGdQ0mwnagj046HBTYWVx/MpmdvY8+mIk87xQMEFSXzlp85zo4GJZa+ZR7IrLQCCS0H9
	J8D1eXcfvPAHnNe3VhA==
X-Google-Smtp-Source: AGHT+IHMENTXXYlxXLfwcYy8RcVFiUBg7t9OZFby+7TKyA3x8awUKOzv1yWPmfR5rSilH8vJnzWv/VNZTQODmKU=
X-Received: from wraj7.prod.google.com ([2002:a5d:4527:0:b0:42b:2aa2:e459])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178c:b0:42b:3b8a:3090 with SMTP id ffacd0b85a97d-42b59367af2mr11730970f8f.23.1763390969752;
 Mon, 17 Nov 2025 06:49:29 -0800 (PST)
Date: Mon, 17 Nov 2025 14:49:28 +0000
In-Reply-To: <CANiq72nQhR2iToP8ZauwAjM2p1OWEK1G5cjsEXqs=91s7jOxMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com>
 <20251113-core-cstr-cstrings-v3-4-411b34002774@gmail.com> <CANiq72mBfKwXEbyaw=pBAw37d7gCLVJqHcLcd6H7vNKey1UXfA@mail.gmail.com>
 <CANiq72nQhR2iToP8ZauwAjM2p1OWEK1G5cjsEXqs=91s7jOxMQ@mail.gmail.com>
Message-ID: <aRs1-KshwnBjIIuQ@google.com>
Subject: Re: [PATCH v3 4/6] rust: sync: replace `kernel::c_str!` with C-Strings
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 12:52:22AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 17, 2025 at 12:09=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > This requires the next commit plus it needs callers of `new_spinlock!`
> > in Binder to be fixed at the same time.
>=20
> Actually, do we even want callers to have to specify `c`?
>=20
> For instance, in the `module!` macro we originally had `b`, and
> removed it for simplicity of callers:
>=20
>     b13c9880f909 ("rust: macros: take string literals in `module!`")

Yeah I think ideally the new_spinlock! macro invokes c_str! on the
provided string literal to avoid users of the macro from needing the
c prefix.

Alice
