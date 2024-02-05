Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C948CC4
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707166981; cv=none; b=nZx6dM18DdNmUyD1scxfKtMoXyMrc39rsqqsOVQnwSXZ7ft3xsNDt2tDilu878cHC9lKxKbIDez41uIZBZxaLUw0I0l9oGsbnk5YJe5hl5AE0NcpqAiCSm0H+kh/RFr/kvDjqzwgs/ixyMeXIxUpV2v6/QrPpt3cYPYfyDsigd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707166981; c=relaxed/simple;
	bh=NWd67aeK8pIzgOiPR/gbAVXtUTBNAp22BDVP5Pv9XhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSJTYy0u3JH7szsiLSpJAb7ohsjp7a9+DJRrlibo5G/L0vTQgX/DubTINLKJbRG1VvbWsFglugNgy+bIY9O6s3Fc+9f52Dey6RDi3lfyiHMTVKtIZPa/GcMn9t/eLjl7spD8trY6vc4g0HbkRNl4/Rk/CXh0svyjdLj7oyEg0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=hhiQw/YB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="hhiQw/YB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-603fd31f5c2so45634477b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707166978; x=1707771778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS97w73P08k5rOomOJNiseIepah68q0tAYPUB/FIuvw=;
        b=hhiQw/YBLGWAEhdwSBY9yiMI/lj/qB7rKj/i0MmmYiX8odPqXDJGwbYGFmv8uQsOqE
         2hgX4r9ue3u+kCTARv69xlxhrOwbCpbaFsoppo3ZUAVPRMU9xnFjvWlmRyNAnM1VikC1
         WzRS3sPiFgChoxMsi9dh8qflyikIFgnxEsO0V9OlJDUH2MjX+1aGKw+Qx8SjxDQAfV3Q
         tGf8p55D5HR7YGBSAqGDirxfmAoJk0234AO2VROPOGZB9EFDjthSJumvv+RpJ8neE7Mc
         fVyocuixD60kWlm2fb1Gw+YGzIRDF44GjdkgqKLKBBBPQif+fr112K/zwqIvkXibIzPH
         TOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707166978; x=1707771778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS97w73P08k5rOomOJNiseIepah68q0tAYPUB/FIuvw=;
        b=SWtGxqNbw2vEoDMB0V24Y0mqK+HNCJ8ZcIO7bfSylEpMM8qaJeJeBUM7uJSX5lJhFQ
         alccbU/NAOA6x5n+wg+Apva1PHytEnSz/5UnYRCEetc3Cv1fkcaw1Vff/X7vGkftrsfe
         9jYhJag8jb5/g/8zVNqfXSrxzQt+TjOxky4r1hqnTCPDrwrSBOWhknDkGMGwoW9sT8JJ
         95oPutS4BGZRub23hGbOoU6N3H32l41PXS/zYkKLrj+zT7Lq4g2zW1VbRNAT1hm7D+tm
         BOdPBALw70VdR6cufA5GFS2NfKLPfGx7J5lszSVhBXl2aM1Zaotlf7+nYVtzFMD0EA7X
         6m7g==
X-Gm-Message-State: AOJu0YzzOl7pIZ6TnM2oR9jyPzYbwuImMydUH0hD3bTgXxXakwYmRfMt
	LEQOfO9IeimjQopwTgGt6t0u66O4ERrGhWeZ6c+Z0619C2g3KIvvNcf05qnnP1iQ9mzJZPamv0K
	VzcnaWFIcSzEuXBA0pMA+ZbfjxYCogIjJll82XbeZn5r3EwnWlyo=
X-Google-Smtp-Source: AGHT+IGW9OpOa7ciycFOkv4eynfDnvD/dphW+DZHJBvn7echDosR8g9F5wKp1fL1kbbs+zaTUCNUsGTPmP3rqTI6j3A=
X-Received: by 2002:a81:ae49:0:b0:604:1d65:b66b with SMTP id
 g9-20020a81ae49000000b006041d65b66bmr5135715ywk.9.1707166977896; Mon, 05 Feb
 2024 13:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205091842.2858516-1-aliceryhl@google.com>
In-Reply-To: <20240205091842.2858516-1-aliceryhl@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 5 Feb 2024 15:02:46 -0600
Message-ID: <CALNs47t63qAU2OpokvN6KykT0_NKpDLTBQGhLm-+zsvR1pcUAQ@mail.gmail.com>
Subject: Re: [PATCH] rust: stop using ptr_metadata feature
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 3:19=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The `byte_sub` method was stabilized in Rust 1.75.0. By using that
> method, we no longer need the unstable `ptr_metadata` feature for
> implementing `Arc::from_raw`.
>
> This brings us one step closer towards not using unstable compiler
> features.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This patch is based on rust-next because it depends on the patch [1]
> that upgrades to Rust 1.75.0.
>
> [1]: https://lore.kernel.org/all/20231224172128.271447-1-ojeda@kernel.org=
/
>
>  rust/kernel/lib.rs      |  1 -
>  rust/kernel/sync/arc.rs | 10 ++++------
>  2 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> [...]
> @@ -239,18 +239,16 @@ pub unsafe fn from_raw(ptr: *const T) -> Self {
>          // binary, so its layout is not so large that it can trigger ari=
thmetic overflow.
>          let val_offset =3D unsafe { refcount_layout.extend(val_layout).u=
nwrap_unchecked().1 };
>
> -        let metadata: <T as Pointee>::Metadata =3D core::ptr::metadata(p=
tr);
>          // SAFETY: The metadata of `T` and `ArcInner<T>` is the same bec=
ause `ArcInner` is a struct
>          // with `T` as its last field.
>          //
>          // This is documented at:
>          // <https://doc.rust-lang.org/std/ptr/trait.Pointee.html>.

The comment should be reworded, no more metadata and no unsafe block
so it doesn't have to be SAFETY.

> -        let metadata: <ArcInner<T> as Pointee>::Metadata =3D
> -            unsafe { core::mem::transmute_copy(&metadata) };
> +        let ptr =3D ptr as *mut ArcInner<T>;

Nit: this could be `.cast::<ArcInner<T>>().cast_mut()` to make the
intentional mutability change clear.

>          // SAFETY: The pointer is in-bounds of an allocation both before=
 and after offsetting the
>          // pointer, since it originates from a previous call to `Arc::in=
to_raw` and is still valid.
> -        let ptr =3D unsafe { (ptr as *mut u8).sub(val_offset) as *mut ()=
 };
> -        let ptr =3D core::ptr::from_raw_parts_mut(ptr, metadata);
> +        let ptr =3D unsafe { ptr.byte_sub(val_offset) };
>
>          // SAFETY: By the safety requirements we know that `ptr` came fr=
om `Arc::into_raw`, so the
>          // reference count held then will be owned by the new `Arc` obje=
ct.
>
> base-commit: f090f0d0eea9666a96702b29bc9a64cbabee85c5
> --
> 2.43.0.594.gd9cf4e227d-goog
>
>

Worth noting that the same change has been in upstream for a while,
since https://github.com/rust-lang/rust/pull/99113.

With the above changed or otherwise clarified:

Reviewed-by: Trevor Gross <tmgross@umich.edu>
