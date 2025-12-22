Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3B2AD16
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408377; cv=none; b=lMwkuC+j8ikTTyFCHAZZonltRPIgj6++dIOLRPqyBu0cNNDbASgftAd3JfEWQtbRY7y5zf4ORtZ3Pg8Q6/umqvgJD1tXdfAKXJ4+hIhXf1Ws27fdr0eaeOirL75ezOiiiBFrf3+yXvxRo/1LuVazY1y3E6rkeyE6F7o8ASZi3CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408377; c=relaxed/simple;
	bh=o9/LIe/t01Dtx//s28WR54LGa2BLxh5Sr8vzmSC6Krw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5TaArEr4u4iARAQmEpxnHoW/zrmoJuF4nPPkToJQct0cNn4Xd6PMpYmMgGcY4LB80vlfUnQcEmZcyKvwF5J9czl8KoirLQRC0h6sVWF1frtn1jVOwLlLQeseamn4nt1i8Wy8Fd6sUr6RozGjsCT/Cezf/GEsBgraj+a5m6xTyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbp6orvo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbp6orvo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a110548f10so12911805ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766408374; x=1767013174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9/LIe/t01Dtx//s28WR54LGa2BLxh5Sr8vzmSC6Krw=;
        b=Sbp6orvo48VvVrFHRwqb/jJN0nBNycF8D+up7LLzS/guB8Km0w4RSkpsdomiRKLWK1
         8Rk5rh3cL7vXAUCEbShCD+HXqBhn9rp+WL9jd/zjfrKMRqi1I68XCNB5qYmTMZWlciAx
         wWQGoqyAa96ZG/d5Rp1aq19YshGUCLIAs75HU+Ag+ZxFNUWCrOvpluzeJyP+ucbmN7cI
         4ZCYVCkhEUr+32XavZoZ/kZW9aHMkQF4c8Ij4dPwX2mxK/UTdOTmbjOfTMcoJhBSxZcK
         TPcN61qX+2rrR2Yfgoc3ccNnPZvX9JeZfv9PEtut3Ij1owrVukJlZVas2Zxwh9zrOtwn
         MVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408374; x=1767013174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9/LIe/t01Dtx//s28WR54LGa2BLxh5Sr8vzmSC6Krw=;
        b=TCgKcHpl7zhYuR4NIHciz7zZwN1jFPGT2VcdJdOHp61M+WgWaCAfBew0Xe5sPV8qaQ
         IrbUbDPwep2nrOsRdaFlGa2x1YbSG0XEzbZgEfjAFMBg1LL0nmc5KnFo2SQV3AXkt81T
         0bfriZMQ5CTrbATOstPKt2VYZcchb3R21Vth1nt4C09RagHAsS+691oC2ZArfY+fiabA
         5tP09tH+ht1OA6c1/CooZQ9EL0o94QTICWghREvsw130NXzYisRmVv5YIasvADY04oOI
         jOPvNMY5eqqG6ySi1rc6sauxtBu4Cj6D8bVCNFZEFhg0zrUfVX42BaPlthsjUmR7DX1L
         Qp/A==
X-Forwarded-Encrypted: i=1; AJvYcCV6JudrSSrwSTiNZZgT8AFvUpX9QClwEulHf/Fr4yxSjnUvKCVjNq5YD/0KBA1BWZ1AtouUMxDAaNXQ79AX0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6ACaco1x/TRq+g2oLoagoVkWmh0DLSmrl9GWc1+1V+9ysmCS
	2lmA1TMKPeos2AMQLmBwJfHwTZm6FoIrdVgKB/fMHUuwINpZVBay+FK32dzS0P1tisXLxd+lXoI
	uQyWqzojT1yBtAX23q5dJsbNEi6ehEYk=
X-Gm-Gg: AY/fxX7kty7c7moTGxwY4h1mgjmz/X7wlOL/kq3RTqASU3VzXu3IeJwuGGZihM1ZlV6
	VKZU9sI+B8WpphymY1XtpqpsiWh/s6AaawNhwqB7t4LO74JPoMQJzV/H5MY0Uo+0JF31BGId6OP
	7P/KrKh978Ys1x/1MXoPSQvO2KlZew0c7rUqxmdCuoFz6E8SQwIm1FATil0guFEojZGxgGX4DA5
	7bCOX8Gzj7GtUMcSuNhqSIQCbKdiR0s7e5LsMxt8LJ17mSWrF8pV8yDwyVUq2jEuMqqF2yTZQd1
	+bYbJ5i96OnxHQ/7WrbakBnqmcjp+yrAPTQyigxWXMMbpb6V11TJF0wFTS7XpaLby6qXwFEnpBC
	XzvQkB03aMVJC
X-Google-Smtp-Source: AGHT+IFHAcgBr0PVotYFuFTF7OjZKmvWsbvlEFz9nAa1cL8iusRiWmKDBD+/DHGMteQ0h0o0ZWFWhyXrQxYscG/Y4Ro=
X-Received: by 2002:a05:7300:c00c:10b0:2ae:5d59:3ef6 with SMTP id
 5a478bee46e88-2b05ec8546fmr5480797eec.9.1766408374069; Mon, 22 Dec 2025
 04:59:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-kunit-v1-1-39d999672f35@gmail.com>
In-Reply-To: <20251222-cstr-kunit-v1-1-39d999672f35@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Dec 2025 13:59:20 +0100
X-Gm-Features: AQt7F2ph3j-0abungPUTjgCBpVZrW47P41gv1eL_uGKW0T5r_mvKZ1U0z8gGGFs
Message-ID: <CANiq72=wHw5Vq4Gm9R0cb+2ftDxE5yDOddQ2aRbHDT_9q6d-Jw@mail.gmail.com>
Subject: Re: [PATCH] rust: kunit: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 1:28=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks for these (and all the others you just sent) cleanups.

David et al.: I can pick this up if you want with an Acked-by -- thanks!

Cheers,
Miguel
