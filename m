Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801915DBB2
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067235; cv=none; b=S+OkkzvZvs8BzdXNiceE93jnKZz2I6Ssid/kNdpNxi28pa8wVJ9vf1lZ4yOtS3mYBzrPdSWZaTw+HZCRUzoJp8HTjC1hYNn3caGPViIMTwDs5Bx550cxza4m1CgdxuZkNAEocy6ZXGdDOAjxcx1YiPXdloVUbpcWyQvu0Zig7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067235; c=relaxed/simple;
	bh=YMZiQ7nTMyzqbUWNC70HrYRlaqT6ID15mYXgXsSQOZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae0S/kLJKeAG7nJboVHMscM5e0eiBWvPWagSu3Gk6Im6QtnUy4Lzr9DnZdjDm4TyDrzYhmkKmMc4sx6D6XtbMszDIB4ZoAp57FudYg5RK+puAN+xWWSATtnaCbaQrkczfhP8o0uz8qK3XWOScduQBgroNyLW69QVmMPJUZt02hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JNJqjHOj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JNJqjHOj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42816ca782dso35250625e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724067232; x=1724672032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMZiQ7nTMyzqbUWNC70HrYRlaqT6ID15mYXgXsSQOZ0=;
        b=JNJqjHOjHy9U0tbLgcWLfl1zGJtJRdSfCE6geaxaxNB1R9wTpJDyJ8gsnzXOHEA86M
         KOGBvIVVO+AkpNYgxeQirO0I6ZakRxWjfKppXMKxs0g+/mk1Zsut5r4JQNMzvL862rYv
         CxdBJHkDB1zvGbmg9YSAelm5o1pALMvwOZlJhtfm0L1CHzYDX6vdX9PZy/aIDZH1vVFv
         PlnOhfsVArAvdk3+7ajMS+qannnCfM9E2OX0mtRay/vdKMalRB1JakvLBE766L7/MKKk
         TOYRcuOYWC015d7U1gRmSlJFJoNP9jYECRuRjYy3bc3A6UAifrTU4rAAJUmFG26STWE1
         DTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067232; x=1724672032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMZiQ7nTMyzqbUWNC70HrYRlaqT6ID15mYXgXsSQOZ0=;
        b=gg49ff+Ahc5whptldHPp8MnIL4Ok0t5F7DPXktmJ5fP7VhGGUDHqIhJ8K+v1973JGl
         yiRedB9crtwQ8xhHt1LupfvmxoUtaMfXdXPGZ5FpIUkGIvDIG/66iVGfu70IQl9jK/O6
         r8NVAYUZnqUpu3c7Fm+TtGx24N9ngHO113QoMZfCq5VcQUnsx/hGRg9LWUf3CVleCmkA
         VYF5FyfzVsyVflhqerJpOh5MY5TzCkMYsxuPWy8eUigrfFZ0+Rc2egt3qFoVgUavmiEK
         gEZkunxg/SbDH7h9AbhyueSHaFaNeo/i2IHJSWhRRHGs/N5G960NjvLbyBX53VzkUF/l
         eVAg==
X-Forwarded-Encrypted: i=1; AJvYcCUlFX+Zdrf4Y5yQcUKMo+4AtoIEdxRKwtV2705IipQT5yDmN8Yqvm4ExxJm5ZZINR5RUVX3sYKxplq2ZZq02Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBiBEgcZ0YnZuSF/ncR2Pi471EbB2rsrdy+GVvGue5RRphBqs5
	jtfXRUax20xGo/ARW6B4Zve/lH38nQKNlavQiDoxp0H6kIpsirD/PXla0rqm9otmuTvHLHz73mY
	BF/0jz8k1plPYjJVGgIJqUrdjuYvL6ck8f6he
X-Google-Smtp-Source: AGHT+IF1Qt48Zst3Qaf5ggizXmigrv+nYn2roTN54In0bMoPLMwmjRuAxV+t0LPMLUaYC+7pXJSxUTRhraixgxUvkzk=
X-Received: by 2002:a05:600c:1f84:b0:426:58cb:8ca3 with SMTP id
 5b1f17b1804b1-42aa8249aa3mr52914405e9.21.1724067231397; Mon, 19 Aug 2024
 04:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819112415.99810-1-benno.lossin@proton.me>
In-Reply-To: <20240819112415.99810-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Aug 2024 13:33:39 +0200
Message-ID: <CAH5fLgg04kKJVzM0vnp8j-rYfYdCb-RZ47U_MEX9unXsDDYXqA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: kernel: add `drop_contents` to `BoxExt`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 1:24=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Sometimes (see [1]) it is necessary to drop the value inside of a
> `Box<T>`, but retain the allocation. For example to reuse the allocation
> in the future.
> Introduce a new function `drop_contents` that turns a `Box<T>` into
> `Box<MaybeUninit<T>>` by dropping the value.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/rust-for-linux/20240418-b4-rbtree-v3-5-323e=
134390ce@google.com/ [1]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
