Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBE5156653
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744059; cv=none; b=cFsO0/7coVMjz/0qJALXI+2K4eJbHM4O5rbPUrA32bxVaoiZfVDe7j2eaYnK6k6FvBYxwNOQYXhAwzvmcEzFZ+L8ZdBb687gbMCPvPBo69NJBrkyZHWjV24pFBy9iIg/M0oQKsqF07/b3tqZDoLUDGPReAXjTcQg5z2eGgSVH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744059; c=relaxed/simple;
	bh=NJE474NjSPNM8jaYv6bQpsozfEWoFiwHPlZhAkNA91k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puoBCnnW1JqslvVD740E3l60XZlJ1QI5LhMFzSSnh/PCnI7NBUr7mhjEydxkMM/xhhpmu9e4AeUx9JujFVd2/5UpjIsSWbISuA3wvY2EYknHvH6uz0ajNcAMiQzJeY2HZKfKEKhUUmJkJ90/kS3j9Ua1dUGAac4/tIoiCLXRbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3qQZDee; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3qQZDee"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d3f39e7155so583933a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724744057; x=1725348857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64+BMzgfOPAjjb8zRIIV524IoxfYtdcgNtuyqlNQdnI=;
        b=D3qQZDee0MvBZrkd+npp87Wu7dxkWFa7F1eXrpyqkswo8ri4YlmjoxgGVIVkH6AoYT
         iK1YB5rvz4BYSDOD7b7BfD3lNZCNvBvLJUAXnNGl7BwRBj5u4lyGw14K+r2LDtXUdZmU
         4x2eytUcmz5g+nCafHLbUvKXFHRufqy4sYxx5jn/5STPNE0fprDPPPKCsxCpqZeT37Y/
         knorYHMQvS5srJrT9fmsfQ/onWetsvcqpMYU6I7CQC630rVqftHENMo8xEFi49ipw07h
         XKoTarWj1saIZhusu57nvnP2wWogE0qubrsUSd8o4zQ1AP8//eBxP/fhQxhC9CSHrQqa
         ++6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724744057; x=1725348857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64+BMzgfOPAjjb8zRIIV524IoxfYtdcgNtuyqlNQdnI=;
        b=KypfLCQXIbXFjL1/KyY5QwXUyk2iaftOYOzM8iQZQbO14Jht7gDhBgnkD/lMipYSZl
         UG8rZ6Zp9tKvkcLG9qQO7ZCPZWZkiz6jRCF8WkClC0+k7DxUVafV5vY6DXwo/+xh1KzK
         pRvLI2ZIU0+mQJ8OT0l70gjuV+RGBBRPaIpEXc+vOmBss9nVf3BIZURo+FmZAkubiJ6z
         hyUG4hIKU3n5+bzfiTDR+7Bzn7crd+pEWzSaKJ7mpdeXeOJUUWJqPvc4KnHPVUCvmpxn
         91d+Uz7WHBgOfa6v4JoeM4frLZWfj13n92/asYHzcJ5MjjKe4bdC12uGQwdmp1/p+fqJ
         kosg==
X-Forwarded-Encrypted: i=1; AJvYcCWDbyxobiLjKI69I32r1n9ZhBxOAFgV+48hD/mBPl5mIjXun7ZiLIi1Fec61J6pwXzmja42D0ILcz4riurKZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtz1oQM17DnMC2DOhlPvBif68Q18CHjrBUR7UtVUefQftOkT6i
	2HX0kvKcYRG6CI2VyCo7Rz/0a6kGu1jPlR0YO4Mez/kgkqlZH211ATA5TiWlQteZ7oa6RGhhqNi
	zXrfewc2JgDu4y1tivrNW2EsYWvE=
X-Google-Smtp-Source: AGHT+IEjasFyoS2ypIfj8qtL0Ar9WfLJfCKFD505SDVB5S5Wa5yE5qfBSsiS5FUauS26rqXFaYYO+I3oJ2147b31hHE=
X-Received: by 2002:a17:90b:2d46:b0:2cb:4382:99f1 with SMTP id
 98e67ed59e1d1-2d646dd8d9dmr8453486a91.6.1724744057432; Tue, 27 Aug 2024
 00:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com>
In-Reply-To: <20240823050359.1737893-1-workingjubilee@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Aug 2024 09:34:05 +0200
Message-ID: <CANiq72m8rxWDjh9dh7S7nxb9+kwDyFs-W7BBg4x4NL2jDn_HbQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Jubilee Young <workingjubilee@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:04=E2=80=AFAM Jubilee Young <workingjubilee@gmail=
.com> wrote:
>
> T-libs-api has consensus for stabilizing some of `feature(new_uninit)`,
> but not for `Box<MaybeUninit<T>>::write`. Instead, we can use
> `MaybeUninit<T>::write`, so Rust for Linux can drop the feature after
> stabilization. That will happen after merging, as the FCP has completed:
> https://github.com/rust-lang/rust/issues/63291#issuecomment-2183022955
>
> This is required before stabilization because remaining-unstable API
> will be divided into new features. This code doesn't know about those
> yet. It can't: they haven't landed, as the relevant PR is blocked on
> rustc's CI testing Rust-for-Linux without this patch.
>
> Signed-off-by: Jubilee Young <workingjubilee@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The PR has landed [2] and will be released in Rust 1.82.0 (expected o=
n
      2024-10-17), so we could conditionally enable the new unstable featur=
e
      (`box_uninit_write` [3]) instead, but just for a single `unsafe` bloc=
k
      it is probably not worth it. For the time being, I added it to the
      "nice to have" section of our unstable features list. - Miguel ]

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
