Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1933D3
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705544905; cv=none; b=V9TOuGT56WpFkyazcr2Iv0QRSDWEIFxbJg7tGxNcgmETsdm3Ty0A+G2HrRVNaKNM5WOS40nWrwfyb/ShADPbfSlxfbwvAx/Pnl3Rd1hBGvni0kXBjiFxIjocIPpScokKPau7BuFAF/GWa1yz3y3CnLUfDttQuVQroyEh79ZI8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705544905; c=relaxed/simple;
	bh=vzMVQCv3T/Ds0vomolAWglMLN+1T/pY1kyRsxxlrzcI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=LZupWbHt/cdA7r0csyAqVjsj9n1PeL/B8e0LjtPit0tn6EptWfjQ2lpeN8uOyjvE8rIchStqeYgB1xVpgz9HejYXvKDJdgtpLYNFXj122n09shcgbhtbBNsv6z9dZSyi0OyJ74jjEd91PNg+E9NKr/ijv7wJ+0K7RZQJYEhUB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Ns3Cf314; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Ns3Cf314"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ff88cbbcceso1208497b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 18:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705544902; x=1706149702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW7sC/bkjMawlCJ9bPlUHsEwlQsAX4b+0wdwYkzYppA=;
        b=Ns3Cf314Vxdr5tkbiD55CQoAa0ifQcatgHZpg/VSBpQEWML5MoYVIvNVAT/zbTVTUr
         kXBHYdU8SYjAk/fpKIQEhNm+MN46HS80YDlz3s4hBLDMFpw8Oht/GM6ECVnWnbHnE9eq
         UtYmP5EdhmU2kpo8r5Mm4e58soeceR/xmV/X+K4t2Jyv7EtreWWL9JSBKtALgf3yvX4a
         CrqE78UupNLNw5WXqbbGA02S6RWZk/4wbA0qkkP4+8Z9JMLql6YTKpWA5F/xZumzkLM5
         mOOh99VN++y/S1yZVGilanH2gYBVJqNeD2uDbLv1SA4Rzcsy1lq3ydMReJN+ZPEtrMfC
         kpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705544902; x=1706149702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7sC/bkjMawlCJ9bPlUHsEwlQsAX4b+0wdwYkzYppA=;
        b=qIhMAyOxvWOa+JyQwY2HodOV4dTny54XOrcZCkKXaMaA7RHDGNu4sxv53Pd8r1P0WN
         77Eh/KRbF/RKc6Hv91HaiaFvVrNmEfE6XHnZ78q7eHaVLM43W4GCiHGmplUd1dNOXM0C
         gdWGDZ9BG3EMMql/9LibFhrmfdyb47BPMRvzE3YnBRre4+MmmgVUIkixza4/GbkAhUY4
         mKkeXQjsNzZRW1ccABUQARhOHEpa5k3Mo0CvcRLEENYLaYjaubUQiPraOcPtOBGsRS/T
         Rg8P6UHIxuRD0zKdeFWy2CpRyRv3aZ9UFrNuHCKkvtDgKo22IFE3P38m+ujSibisvIJM
         Nk0A==
X-Gm-Message-State: AOJu0YzIMBi5HKk2rpJT3J4F/exL9tuYjHlOIMCFCfNzsvwYWG0JETm3
	Dd5n0iGPLC6IQ8F0aY67+xWHNdnOmeX4y196dD0nPIQsjSAZJwhCbEG2zI6O70KykfCX6HNMgbh
	NmNgCtY5zx6XlkHmhii9Pgd5DzysIr6xHVKh9zw==
X-Google-Smtp-Source: AGHT+IGmCzygYqkaRruUo3l9kkNYVmleL+EQ7VHjvtDDXT9/VUKhX+dgMVGvAZ6ptmiDbH7L0Ot2nJW2on+sOJYLQaI=
X-Received: by 2002:a0d:ee83:0:b0:5ff:4895:8c0b with SMTP id
 x125-20020a0dee83000000b005ff48958c0bmr152454ywe.40.1705544902038; Wed, 17
 Jan 2024 18:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116231118.168882-1-kernel@valentinobst.de>
In-Reply-To: <20240116231118.168882-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 21:28:10 -0500
Message-ID: <CALNs47v1y6aXBFka6Af1BNykycjNce6Rnjvf0sw4r1vMegFhBw@mail.gmail.com>
Subject: Re: [PATCH 11/13] rust: kernel: add doclinks with html tags
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 6:11=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> Add doclinks to existing documentation. Use html 'code' tags to add
> links to items that cannot be linked with the normal syntax.
>
> The use of html tags is a tradeoff between the readability of the
> documentation's source code and the ergonomics of the generated content.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/str.rs       |  7 ++++---
>  rust/kernel/sync/arc.rs  | 24 +++++++++++++-----------
>  rust/kernel/workqueue.rs | 10 +++++-----
>  3 files changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index fec5c4314758..f95fd2ba19fb 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -14,7 +14,8 @@
>
>  /// Byte string without UTF-8 validity guarantee.
>  ///
> -/// `BStr` is simply an alias to `[u8]`, but has a more evident semantic=
al meaning.
> +/// `BStr` is simply an alias to <code>[[u8]]</code>, but has a more evi=
dent
> +/// semantical meaning.
>
> [...]
>
>  /// However, when one may need to increment the refcount, it is preferab=
le to use an `ArcBorrow<T>`
> -/// over `&Arc<T>` because the latter results in a double-indirection: a=
 pointer (shared reference)
> -/// to a pointer ([`Arc<T>`]) to the object (`T`). An [`ArcBorrow`] elim=
inates this double
> -/// indirection while still allowing one to increment the refcount and g=
etting an [`Arc<T>`] when/if
> -/// needed.
> +/// over <code>&[`Arc<T>`]</code> because the latter results in a double=
-indirection: a pointer
> +/// (shared reference) to a pointer ([`Arc<T>`]) to the object (`T`). An=
 [`ArcBorrow`] eliminates
> +/// this double indirection while still allowing one to increment the re=
fcount and getting an
> +/// [`Arc<T>`] when/if needed.

Std sometimes does something like this, which links to the slice primitive.

    [`&[u8]`](prim@slice)

What exactly is going on with Arc, is it not getting linked correctly
when it has generics? I don't quite follow what <code> does.

I agree with Martin, we don't need to try too hard to link these types
- slices and numeric types are background knowledge, and it is easy
enough to search for the other types (Arc, Test) if the links don't
work for whatever reason.

If rustdoc just isn't making good choices in certain places or isn't
flexible enough, could you write issues in the Rust repo? Better to
get inconveniences fixed upstream if possible.

- Trevor
