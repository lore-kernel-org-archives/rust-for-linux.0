Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE61DFE3C
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730191514; cv=none; b=J9WcS+xNcjlew5/uasGmJnowxOEz9iciIu3PJrDeUzqdEgQuG5Ta/LUCVCRS4+7u01zSEU7FWH6rMMW/2jT0x0sgt4vlctyr3vxLvFBH3wab0HggwZNlyUl9SvBLu3AVlC6UPJ8DPOnFv1U6YsZs2RUIALq5axWKotuWsErr/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730191514; c=relaxed/simple;
	bh=5iLG1ygbBpNOpviW0stMPb9oHKkA9QZTlmRbWt7p1/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BacrHkveYBCSO5KLyybOtZumycElVYyQajk3Reph9tdhu7tQbGP0WlKjAI8XjuCtBo8b3GnGT/XmTbsmv5AizSBYDmMBykKgkMuWjkQHaxRqTqoGQRH3nd9Y+qthbsqbTUtiof5r+Sv3AnxUPwchIsk02Cu+uE9o2JIm+UGr/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i5gN04Zq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i5gN04Zq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43159c9f617so50314595e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730191510; x=1730796310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peBsrRNawNKr7JJQJfccCDO+5eE12sTFtfer6rwD+KE=;
        b=i5gN04ZqlK2HCgZcleKZ/iTGsjbaY+5oOrHMvu0TdGaWSIxGJWacNfkhxsoPhacxC1
         Zm5OvZ/FudGG3mWj1F7Pyw88R9MAeZx2ihKDVtb9V90WgS6zbkLyewWKaL9r+la78i5N
         haRRPaaX3H2neo9tMZC5LwnK1ceYlgycMPgFuQOip3bTAaXnqpB5+GrLRYYPfnDuT+iW
         qHl4rxH1rfkGRcKB2wGGltT6A4veq4ryFYc/YdZK4cyafBpImm4m4lEbK1Zb89D9d14a
         NYw5fXHmwWOID3LXRGP6shbxPhnrKGbueQcD4SjUQyJqu+kw/U/mrcO18XiCUrTRRXEd
         lZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191511; x=1730796311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peBsrRNawNKr7JJQJfccCDO+5eE12sTFtfer6rwD+KE=;
        b=b3N/1yYB5KrQubjOBSrjRPFRwYr28BcbGp7NVqjeWQiBpi02yczS3ngAB6YV2hHcqE
         w4UcD2sysZljrqczdtZoi9bjfcfCSplzE6V5ApwRh+kZvUoX7hkeyuHbWykWM1h+otqs
         EPBspEw1znPCgpUXBMnp21mn5LgHweoM6kogYbDknL1XdnhsySn8QQmxtDSdJha3eduN
         aGmMcUCu2uyCMbX8DMHApS2B+NH19x6oCgdFtikujA1fnOikjxtPBe/YphcvrXCRW9Y6
         hFNfbxeNMfqR+KChkWzDnBdhJgPz+cBEAldKIzC5vVk0iXHS7xjBlMhuUHy1vP3XmQYR
         F3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUA6Uxr81w4/RCgn+N5YIFScz9rRldccySKk63xAtqH9busR2Q6Sc2ZS+TlsMZS4MHQgZ5toQKMfR1Eqlrs9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoB/alYRhknV5+zVkYhPw6xKktk5cxQ1PYmf84LV5B9XcY5zx7
	EQ/7UMWeDoE9MpTUjs6/TR8D2iyVhFusuZ9VWFU5HFDcI9FvbMzIa52bndjjJdlTM0U5MWl0S8a
	ZbS9Pt4XSCHEOxDNZ5sMToHf4BlsPLWkbSqpg
X-Google-Smtp-Source: AGHT+IEEY/dMsBZ3e2U0u509yeggdsMUr/CItNLFG/xhXVMShOSRNFPSaW+ywQuJPunaYeuuT6zzeDltGWAruwY0FKM=
X-Received: by 2002:a05:600c:1c01:b0:431:9a68:ec84 with SMTP id
 5b1f17b1804b1-4319ad04780mr82049255e9.23.1730191510581; Tue, 29 Oct 2024
 01:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
In-Reply-To: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 09:44:56 +0100
Message-ID: <CAH5fLggUUG5dCTjqM0oMpLff1xdGRFxdbkL=gpEaRfkq1fZgng@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Implement Display for Box
To: JCKeep <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 1:55=E2=80=AFAM JCKeep <2407018371@qq.com> wrote:
>
> Currently `impl Display` is missing for `Box<T, A>`, as a result,
> things like using `Box<..>` directly as an operand in `pr_info!()`
> are impossible, which is less ergonomic compared to `Box` in Rust
> std.
>
> Therefore add `impl Display` for `Box`.
>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126
> Signed-off-by: Guangbo Cui <2407018371@qq.com>
> ---
> Changes in v2:
> - Add missing tag: Suggested-by.
> - Update the patch title and the changelogs.
> - Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0=
D1419BAFA6AFB4EB5A37920A@qq.com
>
>  rust/kernel/alloc/kbox.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index d69c32496..5f4765800 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
>      }
>  }
>
> +impl<T, A> fmt::Display for Box<T, A>
> +where
> +    T: ?Sized + fmt::Display,
> +    A: Allocator,
> +{
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Display::fmt(&**self, f)

I had probably written this as:
<T as fmt::Display>::fmt(&**self, f)

This way it's more obvious that you don't get infinite recursion from
having Box::fmt call itself infinitely.

Alice
