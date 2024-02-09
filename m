Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E0F3C460
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707484065; cv=none; b=l8utb9V4df3Xer4EQMQMnZCTd/fnMWgiP/w5kzNADgel2b4I7avxNsC/3w0Zm6uiU2Oj5l4L3ModXuM/PcaGmDd+Z0wPT4Dci02tb6qZ4g2Ee3Z7ExF2vECSEfLeaUeiLd6dD2fz8PiOMIO1S4TBZVY6JVaXucRw1fL7BeyLIhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707484065; c=relaxed/simple;
	bh=2Rw/g85sJGphAZrvH5ci9NlrmUd7mEl1/NsrSKYc4qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXTS44ypyq5zWqukxa7FRP0TGjjl8tkC+0xGr/oRPuie6ZQmjsRzGMuzQTJi11rYInuNAUzqRmUTOpdJfs+t7GBCSJknn0qoC97vIfeyOnNoBKpTaBVaIIkKg+AguR1HX6OJPR4nvs1IOwRFgFT422MRTfANqgvQ255MKGog3bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Spi1Q4Jn; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Spi1Q4Jn"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68cc2a389a9so6804706d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 05:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707484062; x=1708088862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rw/g85sJGphAZrvH5ci9NlrmUd7mEl1/NsrSKYc4qU=;
        b=Spi1Q4JnB3TMfs8OlpWnbKVGkG5Qb26lsBwFQQqJKc+jlmzZ6kdetGTb9+vPuPk/ut
         Nx0bsfaC6+qMn/ynA9S137Thizl+cYyJ3pEl0xb59q5SZp4CzoqxJH15X16DygqWBfGI
         rn0w7JqofcZyhi05bA5P6UlaYfb49EJUw8nIDE7TLJQYcpbviQobD0dNar0RwB78laLp
         72HiKY5eOhrzicF6DAiuUTnVWvCfvP61YQQuY4Ju3u8fogZf4H+iOam1QeVyWDmpbX5b
         QfaeNHaJd8xkvkNBcjCbIaWNA8X/8NyPOFSule7ym/Gs91+mjzej0b16mH4lzVr8QgiK
         KZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707484062; x=1708088862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rw/g85sJGphAZrvH5ci9NlrmUd7mEl1/NsrSKYc4qU=;
        b=oZgkPHclR6QRSKIl/IkF8SOqu1vo9XT5SoxfJt8Abte5IgTeZJs+rfN0cAG+W4FjSn
         ayjQZ9NXXu5w5Lbs/FJlD63G0qHfLJSHNSJPDyJhrt4tj0MjM6JwiBDTOoU35fxgD60Z
         BptQfocsE1gMn+nssjw8Ibe+4UrbWDAEiSKbfNiKelblNPuxjpWWYQmnvvrKt5yuAQlX
         APzdd4oTYqj51H8p3ujCUaYeuPWxUfuBHkeadQG/gOUlGOrZgLVNOd9F2uoVpXCLU2Xh
         SNQCWzub9cEUYs5Yc/b2SucbQ4v0f7g7QqJSLivw7IgCLIHU/WpN5O2bOcUofOMDWGnJ
         aP3A==
X-Gm-Message-State: AOJu0YzuSYpKmO64kf3yCzt67EoX9V24rQmwa0QO5zveO5g2hD113Pk8
	qb5a2DHtaIMOh8Cq1NoPqvjcQrs1UHpEV1Img136mqCJj4U7CW8tIi6SKRx5eAck4LRm0nyJdHm
	PnY7Jfpcw+OeLxi2TI1DAc8V5Db8oS87Nkwbn
X-Google-Smtp-Source: AGHT+IGQKINrMd7voH8M4WrH1YHEgveky+mPQz8IVaL/+16Aec7hAUy8tYleTebsXC9uGt2KmEm7Kyf4/F9j1uSvWhM=
X-Received: by 2002:a0c:cd03:0:b0:68c:7302:8974 with SMTP id
 b3-20020a0ccd03000000b0068c73028974mr1030374qvm.30.1707484062427; Fri, 09 Feb
 2024 05:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com> <20240205-b4-rbtree-v1-6-995e3eee38c0@google.com>
In-Reply-To: <20240205-b4-rbtree-v1-6-995e3eee38c0@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 14:07:31 +0100
Message-ID: <CAH5fLgh9D5vVOCp+OQFqkCzeBBXJSbBn33_aJB6NR3=Yads_0g@mail.gmail.com>
Subject: Re: [PATCH 6/6] rust: rbtree: add `RBTree::entry`
To: mattgilbride@google.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>, Rob Landley <rob@landley.net>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 4:50=E2=80=AFPM <mattgilbride@google.com> wrote:
>
> From: Alice Ryhl <aliceryhl@google.com>
>
> This mirrors the entry API [1] from the Rust standard library on
> `RBTree`. This API can be used to access the entry at a specific key and
> make modifications depending on whether the key is vacant or occupied.
> This API is useful because it can often be used to avoid traversing the
> tree multiple times.
>
> This is used by binder to look up and conditionally access or insert a
> value, depending on whether it is there or not [2].
>
> Link: https://doc.rust-lang.org/stable/std/collections/btree_map/enum.Ent=
ry.html [1]
> Link: https://android-review.googlesource.com/c/kernel/common/+/2849906 [=
2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>

I wrote this patch, so I will not review it, but I have used it in
Rust Binder, so:

Tested-by: Alice Ryhl <aliceryhl@google.com>
