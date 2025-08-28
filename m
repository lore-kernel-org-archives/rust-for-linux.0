Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B4213DDAA
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363161; cv=none; b=tw9TXosZh4SzHlirLY03vyCVG1UdoRZDy+ZNEoROBhcsFbqNdHrnkKZvUVsYP9rEAfOMJf3jl82/hqbQIeFfUWG7JPt95IluaPuWFwhVg3MtmAcsyrJAqC80TRkVdEFi4GYu6GbN7EXeRzuv5bZj6/tsLkjD+HJXmI2SPU+stPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363161; c=relaxed/simple;
	bh=8cB3EAtw0P7Y3eU6Ku/eiqMt2cvdXJbxjKH6ai3TQx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+kPkUPI9RVgAJDqKBtMrRnuK6C1YHJNWrdkuAEUQ8+cbvnpI6ZWZ28CinEYouqNCGsPuZJ85B1P2d+9EKa890Ml9bPdjXQ/VF90hDfaLhBWILjTTsChis8NWsfqBVCYumFjrnCv/9ZdkfBo2VLGF5/7uZ/PkEWn+AgOhhFptxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dz+AZ4l5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dz+AZ4l5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso2642295e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756363157; x=1756967957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq+QWOVWk1Y3FU/NdzpdHSJIGaMxmBhizx2dy7P/9VQ=;
        b=dz+AZ4l5MI5MDtLIdLquqKgzVYV9njfroK42tREGK0CmRO49W1ZAZBeL9WP5VG8N3v
         oyMZk4PJZsuhYbGM3tp3hSJLCFeJlDctwosne7XGisFAu+LtXUv55f/CL7RTi/qvucYv
         FDjBfrmoeCkjjy0XYuHiyhyaqzW2wBKV7WGYFa+mHWkKHa2AX1HxGmrw/HuIf6T4oR/b
         dxFanm4HFNUjAZfidv+fIAC3/P758cx+dshj9pDLRuACywDy+PFHXYsmsTroSW59B+LR
         0cOgv3nMQBF0Sl6b9EOHkCZ+MLstexlGJKiX610bHBJfX62lLCV35GB3KzLCarrJKSDH
         79MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756363157; x=1756967957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq+QWOVWk1Y3FU/NdzpdHSJIGaMxmBhizx2dy7P/9VQ=;
        b=aJMl8plT6aagAG/alg32walAT/FTEYmCSPBpT07n5ISihn8thvOpWR2mORiFIQbylT
         mI5NP/epKtVMVgn1EPIi1CAAY23OFXQZjMoUogawkpEou6nWrkGqA8h0xwkkCh+/4Pl+
         TqyeMZ8X1yp1piABrvIJ9L5ZY01qT2SVsobeSzyh0ekN++SvlmqOVPWrgJEWrH5TRg0P
         1d9+kIZBx14msKIAa9pE9rkzZYt2wsiKBC+0AwHSKtcMzaV7Bht0hLhde1pSuT3Bvnf3
         0jLgrzN7Rlil2ZToxxA2O2xz7XEVGXH23ERQGpLW7jXZX2O3IsBwTYcOlIrTBa4+tBFB
         DZKw==
X-Forwarded-Encrypted: i=1; AJvYcCW3hdoNNsnV/a+dqqfCkZG6VtTvphG2WNU84OQdMJHSBHnJEOXGzWqUdzwBkCy4joTHSqlUP/y2nMYIVS4D9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznYwG9unH0CEUW7n3zUAq+IxoWyZRxGDc+MjeVnXCi8Vmkoj+z
	4ZG4v1wJMxL/1dsn4wi+PcrwkM745bbuBjKOO3nV/zRrBhKezE6DZ/a1KEjTMNmh3fi7VW9+5gD
	Qu50KYZaiQx2vgxDsUoQroI4gR8iUkJqftwd7mVJ1
X-Gm-Gg: ASbGnctHfeslhgm5D1zFu0k7+2cn8UXqSelOOuSG1V5V3f7GHpMT5oiqbCqKAjss0KA
	amrhAEBYaWzTT9Z5TcKULGKH9jOixZ9atxeBc2oBz+V8qtD7W0hNNBYzHl8zYhQaoTOnlNFFfIX
	d0t74P4ORnafOBHaY70xhVmMjXrjLH+UNV9HgT6zE727r2jX83cVqOnSdmE+AYLYRfTOKubxBIc
	pPad8HCxUftTL1Gjm62X3FMJGkQIZIFHC7BzKLIkrXWMv8=
X-Google-Smtp-Source: AGHT+IF8+1ICS0fDql/XTK3pqcO7/04zx4tNEmPDhoomxN7vbO9FM9IgKE+/QooxVWj+KULkTlRwMy+CD9PKPUXPTH8=
X-Received: by 2002:a05:600c:3104:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-45b517e0364mr163915875e9.36.1756363156967; Wed, 27 Aug 2025
 23:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com> <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
In-Reply-To: <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Aug 2025 08:39:05 +0200
X-Gm-Features: Ac12FXzedyoztgDekujVPHBhDWZD7HkK8GfapuNv85gVHH0ZgPpQziBoPXzTTmI
Message-ID: <CAH5fLgjyd7zNqLFT4T0_=tzcPFyw9xwZX+QTA8ShBxZ_Fa6o6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> Extend the `quote_spanned!()` macro to support additional punctuation
> tokens: `->`, `<`, `>`, and `=3D=3D`. This symbols are commonly needed wh=
en
> dealing with functions, generic bounds, and equality comparisons.
>
> Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
>  rust/macros/quote.rs | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> index 8a89f0b1e785..24764b04a07d 100644
> --- a/rust/macros/quote.rs
> +++ b/rust/macros/quote.rs
> @@ -150,6 +150,36 @@ macro_rules! quote_spanned {
>          ));
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
> +    (@proc $v:ident $span:ident -> $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joi=
nt)
> +        ));
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident < $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alo=
ne)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident > $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::J=
oint)
> +        ));
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::A=
lone)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);

Not a blocker, but if the way to implement this one is to push =3D
twice, then I think the pattern should just be a single =3D and then you
push a =3D once. The pattern can match twice to handle =3D=3D.

Alice
