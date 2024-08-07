Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CD200108
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038838; cv=none; b=LzMA/pi5xyG8Qb6KbGP/5qj18xLrfJ4dD2NG1nB6Db2LzzRUF4LlFbMuVRu/+kUMmL9R1OOYoZpa6nmvv5d3VMVMW8Wtv12DpAJOkHifHpsNIPYG/sQneIU863GpUfj2emy8/5VrhpsMbMigg9nZDbBimo1xZCA22M3YTpKV9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038838; c=relaxed/simple;
	bh=HEWPD4RYhf42OgDEBSAqzCtgkLgNuAtRpK1JqvDROqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCJBlURZdWHpMFse6PkAEfD68YCXoVzZ5C1iN6hv1DmaqEp8vNcAndwCPpQq2opjxDQAQNWLRJ9dN1FvGeRfdTlfEramHZv7dYVP2TqyXxzAbwE8v9Ls/3CZh36H0v58b2yIZoYTWE3YITtKSINrFWlboiyqCNbcGRF1erBSt9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ouva0LCv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ouva0LCv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428119da952so12386005e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038835; x=1723643635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4f8NXiPa/VCy0Z9ngspkDts0pjL5jp/vzu9TZfOD2c=;
        b=Ouva0LCvDHZ5WKfqAIEIbAv0K6GqVnc7WAdBa443uPp6Et44tag8YKwDgyATJ3pVAb
         iQ4n78w0cmuVJXx26BcZUj5M8bMDhRtmgmKoE83W3ZVQzw6TB2to+D6jX8AJM7o889am
         hZCt188nJuketluM4fsXZsmhIq7VCgLHw98EZ4aBJkfaqhxpnzTy/Q9Y8ddJXHBKD6TX
         WJOxUo74c7kM2OZOj8K21cDWoPk/GV5rV0HAbhxl5jBwz30ZZ3i5GcYITRlgfsJgLT8z
         2w+TyhSuWIR43delVs4Q8ABauQgahPClfyx9OrCSYAqrTzhgjqoLtEyuphN5aXECtObp
         czyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038835; x=1723643635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4f8NXiPa/VCy0Z9ngspkDts0pjL5jp/vzu9TZfOD2c=;
        b=Ufnpv1+R/59hqZP94fofpRQIEbVMqrSP397SP+6FWfHktQ+xPVHzcrQxgyser8Z9KO
         vdxCHmzd3ZI0YK5pqZABEwgMeOBIvl8iqKd7hKWrSE3UMMYRB5uMdMXSDQga65kpmVzw
         ul9b5at+u/zAWBu3Hw/FOev/P4TpShBRMaH0SYzKWF5/NMkkbUpnuFFh6EuntGRdiMVX
         5jMJ09P7StjBIYLLfcEwqkXyQU4OzG06ZFLs7OF7pgiruJGiXncjoBU97KEmLpiP6n1Y
         vtezkFqrH7ZTHlFKrYOOOTdGejGlVg+GStiY3tC2qhzvOWj7eGshIyjOpnW9TFAJjZFl
         s4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVvWEN6ytyAdyNLr5Uhpk2RTflo7ZJHWkQfNVhy+I6ZgXgUtZoZDQ/PsR0kVbfBplUirJcC+5X06MuWENRYHaj5KhZVudTakgX5NJ1W2SY=
X-Gm-Message-State: AOJu0Yz6StGLv3ux56LVMAm2k/e8oQPKCuQbjUKNM0XDMnFpXVmQCEzc
	pQ/pUiU0y0gko8LaScP/VPXPpzJZSeAKRu4EBCM9QFRU5mmXUa1+jV67J+NHFHYFuncrl3upFtJ
	ZJXGx1cMzMvFrmADhaPX8Cf4rBP4T1Ibat3tn
X-Google-Smtp-Source: AGHT+IGICoiOOIqvUaYwYlvcxfUr8G6r/fYfPomDA2SxiWWEDk1Bcq9uAnBPbZdXf5nWDFU3T4u2S26B68nV+TOpN9M=
X-Received: by 2002:adf:eacd:0:b0:367:9d2c:9602 with SMTP id
 ffacd0b85a97d-36bbc194267mr13600511f8f.49.1723038834584; Wed, 07 Aug 2024
 06:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-25-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-25-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:53:42 +0200
Message-ID: <CAH5fLgjTRjRx3LYMjSmVUGMa1=kLqcAGfwZO+Q+399fh5FwGOg@mail.gmail.com>
Subject: Re: [PATCH v4 24/28] rust: alloc: implement `contains` for `Flags`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Provide a simple helper function to check whether given flags do
> contain one or multiple other flags.
>
> This is used by a subsequent patch implementing the Cmalloc `Allocator`
> to check for __GFP_ZERO.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

One nit, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/alloc.rs | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 8a1cecc20d09..615afe69d097 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -34,7 +34,7 @@
>  /// They can be combined with the operators `|`, `&`, and `!`.
>  ///
>  /// Values can be used from the [`flags`] module.
> -#[derive(Clone, Copy)]
> +#[derive(Clone, Copy, PartialEq)]
>  pub struct Flags(u32);
>
>  impl Flags {
> @@ -42,6 +42,11 @@ impl Flags {
>      pub(crate) fn as_raw(self) -> u32 {
>          self.0
>      }
> +
> +    /// Check whether `flags` is contained in `self`.
> +    pub fn contains(&self, flags: Flags) -> bool {
> +        (*self & flags) =3D=3D flags
> +    }

Since this type is Copy, you can do this:

pub fn contains(self, flags: Flags) -> bool {
    (self & flags) =3D=3D flags
}

and avoid the asterisk.

Alice
