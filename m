Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5858AC1
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051332; cv=none; b=ohPZWjL7DOL70g6NP1t432wBKWKwOZijsxjh6VXxmMYBdxaD1ZOG2vnoUZuG0Y+kklr3E1SX083bquNhKG6SJQmPZG5ggFPSFIb6+mi4RosRo408IYKaHlTt6xvbR0Og9mJd2ER/t/irpTPmcQUv5OqXXncD0A1nAOJFb4mJiHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051332; c=relaxed/simple;
	bh=/6opIaW565ST1SlftEf3TIDZp0a8kcSv8D9Tuf8A6MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bekg89+I00ishBXHLqOEzxXdvTgyRngQDGfqdEYqUie1aQBqq5YZx6gdXZLxsztepwOQxfRjBjGnnNB1gjZZpUQs9ZJ0K0xHQ7G0t72mMZ0bAhkgUQJJEaz+H25BK+MxKTwJlIYOCAnHCbN+li1ZXv6syjY06fkZKYxXIQbn+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EL8c/569; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EL8c/569"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7e33b9db07eso1367144241.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051329; x=1712656129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4P9MrH43tW9abxwsM09/mfJ8gZJX942gU6DHzH5JkI=;
        b=EL8c/569z9eGhA9F2nUxGHj0W1zpbULWIk1FXWamg8VLMJevbJX7SF2MunvfICT0Y2
         qXc+akhEnvhToARses1yBL3LtT71IhLHcW7MZ6a7qaDdSetRn6fpnDtfNlrTD/5HgGCk
         7YF1l/W24XeWLSxwfxvfKu8y8lgdlREmfsF453+4cY7PjGWwJEk+BoJpn5FXJfETuJv6
         EGvm+Iuj7Ti8WSL5kaR/EpDu0viLFr/OGld+oYvQ5ODmbhJt6NeeHb551WV377aHixoC
         p0tDEeEjcvamW10/ElVpGEQYSTwy0q4bACz0jFGxExBnhbtE8RMOZ5KcZ+xrl+jq76V+
         z6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051329; x=1712656129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4P9MrH43tW9abxwsM09/mfJ8gZJX942gU6DHzH5JkI=;
        b=vAKHCi1TBjc8rWtX729GgZ5+Nvur+JierlbArZxIqIiV85C5XI9qSJaCuD5wvX1yib
         pGiu/LjmuKDSwxzOTYaBVAVENHFZl3UIU0njHXv4V8svk/m+mUC8js91TP3ZkHq5eZgA
         SYM3kIMXNGpnMxwJxhy88PgXVq6kyb0yl2kJ+KY0b2vLDaStr4+CMZ8gXkBpsx0ja9Wg
         YE5fJDOM2wgnjtda9N46m4fgjWXXEhFIhc8SB0JwNTxufjVDQypX5JGANODzICK9sC0/
         LSWlNL0K9iRmFXwu3mBYs1n7a7rgeRV9I4GyuEV+MWcUoFIZBt/nhkwxpuCDca6mn5Kl
         fV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5zXh+oIkBCAPB1WA66IHbp+LvrE9lUaFt6J3HKNmbjxBFznYrB/5oC2Qe7NjeZFR/FBjy5PKwgETD7wNYdcYJTDJYDyWLe5OYIX9S47c=
X-Gm-Message-State: AOJu0Yzv12eYmrVnAJ0yUFylC/kHJOb0DWlfo/lW0EnmikGroEfQHodG
	75zj1/P7fLBcmB4mD/bVz2egbxPIly+A0psLeDIxv9Q6DKuDZ0JJMYoq+gXYFSn1kvns6/A1Xkz
	w0o47xLSEcCoW/O6y382aigkZE2HZ3Q3GjqJI
X-Google-Smtp-Source: AGHT+IEuI/3Rm82F2eFCVLgg9j5UIQnVXaNnxGLIK9710lNnknOhJaLAXY9bxHdptvhHHGoFFNiYjlFvjJefD/9iG+Y=
X-Received: by 2002:a05:6102:2172:b0:478:618e:f0c8 with SMTP id
 i18-20020a056102217200b00478618ef0c8mr6431208vsg.11.1712051329606; Tue, 02
 Apr 2024 02:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401212303.537355-1-ojeda@kernel.org> <20240401212303.537355-3-ojeda@kernel.org>
In-Reply-To: <20240401212303.537355-3-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:48:39 +0200
Message-ID: <CAH5fLgjS5NeXHTqqgcb5nhC9XZ1qSzh5tWD+fvNUf93_PNGWdg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: kernel: remove redundant imports
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 11:23=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust's `unused_imports` lint covers both unused and redundant imports.
> In the upcoming 1.78.0, the lint detects more cases of redundant imports
> [1], e.g.:
>
>     error: the item `bindings` is imported redundantly
>       --> rust/kernel/print.rs:38:9
>        |
>     38 |     use crate::bindings;
>        |         ^^^^^^^^^^^^^^^ the item `bindings` is already defined b=
y prelude
>
> Most cases are `use crate::bindings`, plus a few other items like `Box`.
> Thus clean them up.
>
> Note that, in the `bindings` case, the message "defined by prelude"
> above means the extern prelude, i.e. the `--extern` flags we pass.
>
> Link: https://github.com/rust-lang/rust/pull/117772 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
