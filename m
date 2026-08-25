Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF6A3C0637
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787701013; cv=pass; b=Las+Kiy69UfUlqMjwn4m+EVbRtrilAlTlB1QE/hjLVGsMURhYOU7N/Z+Qy/Yd8HNrku6hgVHCo9wzPAKxCTTWNseG+J7rVZVge0RE5SG1wzKgyj+Ajf4y4/jj4SUfk1L8QNyNOkFBFe/3hUTLte/DnkfT8wyhE+1WqyaSStFN/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787701013; c=relaxed/simple;
	bh=h1DbMee42kDTE/h0M3ZhHKpBRN+EYlu3Xiaw/VOWNzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhX21P/wJfuaHsLfElF7GE6Bithqv6IwH8mxRx8VXkrmAkeF1jBELwJ+QvtbHQiR0dfRaFi6ZnGfhV568TVdimhxgmEAoVsHuJUcwa7UovouLsa4+oEP0Qfes8NimetcitAkK/2lzVIpFlbwNIEes1OmqwZr+cyjAtOdHAvY7yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq5aUTeC; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq5aUTeC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccae46de39so603215ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 16:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787701011; cv=none;
        d=google.com; s=arc-20260327;
        b=R52L/0vcn8uEhyoxUUvUoORz7jCHDCf/VktyhXTafXHnGXn0525x06nvVrBXd13Y7k
         /VCCYRM0tbfoQxQL9NfVVfzRREp68+DtVQe+if2nSbHx0kTXe1uI+VXJcjCkGn3OdXIc
         r/bMjNdsdryDK7Rs7iMr1gaukY/GnRjz9T+zhLAb7KvrwBe/7/h2Bzd+hzgZv1khoKSC
         w2sXD5O3a095EDUCULILQOYIdS8d64XVuVo2paRW0ZmrXf5FbjQp2EbmZeKbsgedeHyx
         bCgQjgh5drZKib20qgLXnptQXrS+wTBJVPCR0ppPHagmQT6VSQLsU+4dPmGP0//RBvHq
         +MXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2fMZcIr7PJYUKtYt6N73x4GUy9xmDK+BvFmvurRf9/Q=;
        fh=EtHhSzAndegywx4Dx6S7FHApWTWtF1zDoMwxnWdPN08=;
        b=qyf0sNNkanS40Wtr8x+Fkg8jlfvL5bWGBC8RdZ2uybwIERn7sfE92FdamcQtTAXyI5
         s5/I1zzptr1jhaM0FPgb6wyO8/aAUekB8yF7FQ1k1SWhMHtVi/4hsUPoMFal1+MQ264a
         yPZ9kaSazaf961JPTgotKAHEbh+AdqhzRozPU0C3+UxQm9dFsz4CC0B316FgjfiMYZ9z
         WUafybZwyN9t/tEqKDoThXIJ2IYBoOTn8N2sGE+t5zCXtQ/o/xYAS1AtZH1SzCxjd33c
         UG66CxxMUT3+EmsFhEzPzrVNCh/UvGplc86sc/v/wrGgfpCNWOIcwXmToU5bLDtYT/7m
         G9bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787701011; x=1788305811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fMZcIr7PJYUKtYt6N73x4GUy9xmDK+BvFmvurRf9/Q=;
        b=cq5aUTeCIAE4mPtjyZVij1Hq4AplR5/esWhQPkNAERpwIuaaWIPVGtfFgZstEhFweB
         pVprFD7Z26WLT36SDmmhso44Pw5y3eJJ4CGWxpt/0kMkyQFS1459igOdKymQnRGZLfVq
         gE9Q6RCmNodQEOMsKejWCjBl+3ZuR+kihYHbMZjB1tbPNGi68C/P0mVCVHY/VkwBKY41
         EgSrSi3jUvk+ZK9zbs1/tYQDh5qE/8OPY4YzjYKQfMS7EaQixYtsf8k3oPCTrsq/5zkK
         1EY5tldB36zoQowFXpBqhhiX138FcQoJcT66X28v0gm67EMWKqTl5EAtfCBoF/QTFf64
         LTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787701011; x=1788305811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fMZcIr7PJYUKtYt6N73x4GUy9xmDK+BvFmvurRf9/Q=;
        b=C4hNkdbv660utBzRco559VRm4Vs2BeDsgcDcf9oSkFklaEM61oVuazaq8qp0lrTxMC
         D/oh//vOCl05qfFjl6Z4kp4XAl1UB29SZjvyQ11a4ZsqEOxh31hEtrPGqeH/PwGFIULr
         w866i6KYISir7XrFlY3Si9+WrBbZC2ustqDAb4vaTy30PZNI40dOhQ83m3JJOSWhPovA
         30zXTReNLiySQW2BKYtp7UwaRlQKhmdT2Ddkn/MZcFXo+nJUh3QfbjdvdoMLxNm8PYfj
         x3mzLCN2LmAkpQtXk6eK4SXcMTcsXCa5VJTaU376Cyb4ggVAX0qbB0ivihMdAM7B21Om
         +9Hw==
X-Forwarded-Encrypted: i=1; AHgh+RoBpDV+9yEcWYpqVnmUudu6tDMa2lixso3ZNik5Gi47fpeQYt2Xn0ktPcsrCDnKMXo/KlIuafewin/C8sF3eQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k9hAiHJbo4cY1PrrYCZVfoUUaUrQ81KXRXQH9Fo/xiO/lR8s1R
	WZ0CEvYr4KoWbyZ+L5HmuSpR+ztA9wyoNXSTT3+XrYETFKQNjFQf3XnRGl4vbcIn2lZrmiyh4i4
	IA1qoNUjNgyPb+ywV6SMInLJl8JaZbNk=
X-Gm-Gg: AR+sD10Q+9opOb3NXmclsvcqwAP0l8OEsQv6gV/BfBrIVkCLfAINK4aDsFDZAI238gb
	/Xy8xJ+pFySqm3b7KIXXX7OHsiNDuYYt9eiG5LzSmymjJcsP1WEv8Itis8j1BvTwzhLl9ojpuWs
	mGsttWrl7ALqqpjuJVKEeOEZYaPMQYEbi9CFZ+c1c/8DOOFtCvbPVqGVqTksQQL0+c3aRstVJAQ
	JqOzFTl8Z4bA9RbpzOci77tad7/W6NJzH1THlgSvs5c7b3xiVjRrX2mCyct3aKz7QUrZPJq3q/j
	P6eSWf5OpGNiWcFoxdPjMwzUH5/8EfiCkggBZ5hPp4Ribs1CYDY6EnBsAK2V99YwHShGpZxfKzL
	rOSMLVQMfo8XkJv67Df+t+9o6fyPmlrM8eNU7pAUxBrXWuUM9EFwX9+gPZa8jfs9klOrOPHA=
X-Received: by 2002:a17:902:f789:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d7077710ffmr16923965ad.0.1787701011201; Tue, 25 Aug 2026
 16:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823193529.156066-1-ojeda@kernel.org>
In-Reply-To: <20260823193529.156066-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 01:36:37 +0200
X-Gm-Features: AcwNN1XJUdcU-uaWrJb_MWdWJsZH9EysTDIt0KdNtGRwRojvJo_C-_WfkW_E10w
Message-ID: <CANiq72=AXhvxG3TD5QgnLMmL1hcPyahn55wO28MOsWTAo6F_Ww@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: disambiguate `zerocopy_derive` for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Antoni Boucher <bouanto@zoho.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 9:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The `rustc-dev` components for Rust 1.82.0 through 1.87.0 include a
> precompiled `zerocopy_derive` procedural macro in the sysroot. This
> range includes Rust 1.85.0, our minimum supported version.
>
> This makes `rusttest` fail because the compiler finds both the sysroot
> copy and the copy built in `rust/test`:
>
>     error[E0464]: multiple candidates for `dylib` dependency `zerocopy_de=
rive` found
>       --> rust/kernel/prelude.rs:70:9
>        |
>     70 | pub use zerocopy_derive::{
>        |         ^^^^^^^^^^^^^^^
>        |
>        =3D note: candidate #1: .../lib/rustlib/x86_64-unknown-linux-gnu/l=
ib/libzerocopy_derive-54d2b38896fa6bc5.so
>        =3D note: candidate #2: .../rust/test/libzerocopy_derive.so
>
> Commit fe39a233ea52 ("rust: kbuild: disambiguate `zerocopy` for
> `rusttest`") fixed the equivalent ambiguity for `zerocopy`.
>
> Thus point to the dependency explicitly in this case too.
>
> Cc: Antoni Boucher <bouanto@zoho.com>
> Cc: stable@vger.kernel.org
> Fixes: 506054980429 ("rust: zerocopy-derive: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes`.

Cheers,
Miguel
