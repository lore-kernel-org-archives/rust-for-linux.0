Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E615252D
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899366; cv=none; b=Dc997YS30FfVuOU3OZTxG0NJ/yioPj3noAK1iZgUlqmRL7UXswcEYB2FjtR77aVYwv4AqeJLQ8jOJGXFCDtTUft0Khc2tIcLjY5ydSN1lNvulBiT5kfNWcOO02Dw0l3iCXs7q8U+D5RuY1jaAezcWxFvwbmN0/Ajle0egoEVXxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899366; c=relaxed/simple;
	bh=QxE6XFKme+xoxU1Rszza7HxCxfUttwEhnIGpZd9XnTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPIK7E9zjgSUl6dheIqdWR/ClnF2Oj3GAYUocv4rpU7Ub07Nij66WznDEvoNtzbPAu046FopZDDSgKqkiLfSH59q4+U/q929t/FHVhWgP2OP0muYzZkqpBuqwP8JTV0rGQXpi+XCZnWFdTKCtTopIoNNhoCQwncN3A/HowyzGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yQX3n/GI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yQX3n/GI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so191663f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Oct 2024 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727899363; x=1728504163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxE6XFKme+xoxU1Rszza7HxCxfUttwEhnIGpZd9XnTo=;
        b=yQX3n/GIwXicZ6pkA13gZgbJ0Ql0sWbk/mzZYtNeolGBCpyGZ+Z2CpNtwSlvJjMJhZ
         TKehQV0Z7Az8iii3YsY6y3xWjGCGd6zAn9xLgdkp3LzNOX3IKGptdfKBIMsAYgAMlDrs
         lOuAPDJagX5gOSRpo/kXyRteVyxwNXmFRGtXLFZwZZxEmvd1cHjNo6pS31n9qA9OHTmt
         2qoy5EMJC2J9+W0wZgMhb97EXoz8L6FjYD+mNy/jL8JkH9tqzc0WfRbrWIOSKCcvEnMa
         qoH7g0lPcIQUDWNw6qjTHSVHudZqNWiRTLq2gW7DCtWQGqZ7PLU1dqCgTXy4yj2vjzMU
         mYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899363; x=1728504163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxE6XFKme+xoxU1Rszza7HxCxfUttwEhnIGpZd9XnTo=;
        b=f/sdkA2jsJRmeeOQZQbBIszw6AFXxwWsUy6GQcb9sGY0vkZHExEB1N0mOMA3o/xVNu
         /ytP80fVhR+megBVP/fa5ZG16BrA1wgX+Cg4kGMkmkRhnbgwrQ4t/QckM2PyGthnsKxx
         07e/qOy6xqAox6h4RHGNhN1fgaTiTksWX3wBKgeMNdbUQ/m1x1tN7P95LgL/uQFHNMqq
         4vcTm8zos3sDEpJY6Ug5oDbpuXaU+TE3e6nv80Dimvf9DHjM36fZdhOpwGoO6EVZYs8Z
         H9eqhQhtQSRz4Y+Cyz9JhnUQ73zE3AGwJuwnWPMNEScnVRjSAyPYZuQeUyQXcnAAoBYp
         v+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVLojnV/zpxNdLqUhGbbbsBXQbDg2A+KEnHji90fRT+hgW+XR/Q2zsGgUhepiSZMzEYtJYC7yIRpi2BWxqM7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnXXsR1pSO5ejF0kPpbEJxFllmJ2P4TNoSu0D0epGnvkE3mb1
	Qurtsyv9i5tKuh++KhnyVioXsJEOI4ekO7jLOrKNPZFJRtY+S9gj+fK+EWkcjlUMDJDwtq0R3Ut
	EvS2FMbXbJH/BI8zZHA8r0pBGy+h09sfq+kt5
X-Google-Smtp-Source: AGHT+IFdAQHigHgRwqbBluWiPNLhOqlEtdJgsEEyQLh5TI1zvrczhPyhqF49gn7+lx+aW6IN0h4DED7pVuEkReeGskU=
X-Received: by 2002:a5d:5d81:0:b0:37c:fbf8:fc4 with SMTP id
 ffacd0b85a97d-37cfbf8110amr3030581f8f.59.1727899362994; Wed, 02 Oct 2024
 13:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915132734.1653004-1-gary@garyguo.net>
In-Reply-To: <20240915132734.1653004-1-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Oct 2024 22:02:30 +0200
Message-ID: <CAH5fLgihaSVg+=D_BfMxnt8VBO-r5LB4akus7EMvAfOyNv45FQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: enable arbitrary_self_types and remove `Receiver`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Danilo Krummrich <dakr@redhat.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Alex Mantel <alexmantel93@mailbox.org>, Adrian Taylor <ade@hohum.me.uk>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 3:29=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The term "receiver" means that a type can be used as the type of `self`,
> and thus enables method call syntax `foo.bar()` instead of
> `Foo::bar(foo)`. Stable Rust as of today (1.81) enables a limited
> selection of types (primitives and types in std, e.g. `Box` and `Arc`)
> to be used as receivers, while custom types cannot.
>
> We want the kernel `Arc` type to have the same functionality as the Rust
> std `Arc`, so we use the `Receiver` trait (gated behind `receiver_trait`
> unstable feature) to gain the functionality.
>
> The `arbitrary_self_types` RFC [1] (tracking issue [2]) is accepted and
> it will allow all types that implement a new `Receiver` trait (different
> from today's unstable trait) to be used as receivers. This trait will be
> automatically implemented for all `Deref` types, which include our `Arc`
> type, so we no longer have to opt-in to be used as receiver. To prepare
> us for the change, remove the `Receiver` implementation and the
> associated feature. To still allow `Arc` and others to be used as method
> receivers, turn on `arbitrary_self_types` feature instead.
>
> This feature gate is introduced in 1.23.0. It used to enable both
> `Deref` types and raw pointer types to be used as receivers, but the
> latter is now split into a different feature gate in Rust 1.83 nightly.
> We do not need receivers on raw pointers so this change would not affect
> us and usage of `arbitrary_self_types` feature would work for all Rust
> versions that we support (>=3D1.78).
>
> Cc: Adrian Taylor <ade@hohum.me.uk>
> Link: https://github.com/rust-lang/rfcs/pull/3519 [1]
> Link: https://github.com/rust-lang/rust/issues/44874 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
