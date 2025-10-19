Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD710224AEF
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760902973; cv=none; b=hro9Uo5bXic7bT/1IUEsarKpb6/QiiQRf6goLh/pH+C4+OZLck3Z3l6CR6t9zkIeS6cjZ4mMr7Pjx5DXmPRr/ZxOem06LFoHhddRM4pl/dPVBZZkVLcp4P6Q11cSKtxqkW/ihwQfTYtZBzDjmcfpCLusjCC+oxzB4upwOaBE1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760902973; c=relaxed/simple;
	bh=JNX8fAvoW1lb8BmNOFmuJuXah+Wz1jHvbOkzj/xKGqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvMs5dRjQ0USv1PgV+14uG4j/W+q1YcSQZj6NxRX0XNK5DzlMBfvNWbvV+Fgjzpg99v/S9pG11ic7w/9QkNz+Mhu0Rw1hTvGIjOTpiItPld+VreV4WoubZ7X2pvl6hZ7v0avHjAbT875ytCK40hpl7llg+UxKXhmHHc8XtR6ZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPmmZYxS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPmmZYxS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2699ef1b4e3so6182935ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760902971; x=1761507771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqNBOqOH483MS8SL737JXQnsKORCT0z1++jLxbruyag=;
        b=XPmmZYxSxYsxthaE2IXgPTMa7htjsLmr1fCPlr325yXrtH929kIkCzWQnhigru4vET
         YZGVBCe33MWZvpER5+CdlN4jU9BWVGA5n3tIAJMC9WFxBtldy12UfYasHdSkHlBW/QA9
         cfVWdXSoMF9/OLURzzCWUmv1WshQA9zViWkV+i5vAl/UdIBqdhd5NO5Ns2MGzL2A+y9n
         3l0tGGwUQslGVUnROuGMFmdAletSqgIus6r7e/4dR+ZSyJOjAk6yHpaPtjp55HisgNgJ
         j9hAqu8r3iFUaTgWXp7p42AaRqNOPwyRuFfTe+biiI70Lc/HiY1iTgBuPOS4vsUHXXfu
         qjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760902971; x=1761507771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqNBOqOH483MS8SL737JXQnsKORCT0z1++jLxbruyag=;
        b=hcF1byXwu7457rk8F4ejk0ueoYPygPtFG3Gb8AsM7iHA1vIeqbdsc32S/JQl7m8Cqa
         3N4Xf9PkJ9opbIqC8D92rsURO4e8qzkAJOidz6iJ8mAldbFxuDjDWiM6anEzD89914SS
         +YO2qbi6W3E+v4l3UVQxY5RNsBlH5JJGLQ2VFUdthiKnY9LFKRP8ouZf4xBEknoX7tfV
         0QsFfsKXGX0H09fDsSlMS0JlUutxcsxKVGAuJHRFKFKzNkPUk/b8MGGDy4fOb2tQUn0c
         wPBbUMml8OBeetglOAe4LLHvSs9HdqLyLaWrTj8naKuDTdKsmp0mMX6VqlcPWkZYvHZe
         LJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWwAGNsGwniXdnxnlMXAUZACnzP//Jm0+fMXdHQP8jB2Idck2F4Dvl4fYMtJpZytMztHUr5yAT57YzeO4/HUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2FyB1/Tzf/+zCWICi1io1G9KQdZxmvMCzl2sH6t9Jm/1WOoj7
	e9uXG5KcZFzpul+8jOLOEkzyTz+eAb7KMJ7A6jPcIGMkGdXhArUfx1GPIkddXTq5wjPV/rgRVUP
	AI1Tg6uH6OLM65OD8MGPGp8dWWrHY88k=
X-Gm-Gg: ASbGncviUnDMQ8dH+GLLDyWipEKrPOYAAAVV2/mumRbduYZ38TT4N5gB8lj6iJ6nYnO
	lwvaETUfPMLL+zLGXH2rNFBVF02lXc42rxshmHlLQyArrKYHp9su8mws3O8F6wBzAG74Fg3gheE
	vjWgIIDJ/9mPhqq4y4JANDCMqlWKQlP3HPZC8Fn1jr2YPYihnW4g7yf+TWLJzwBHoBndIOtFd/K
	qwYCC7KLpyIemz7e+jOqzi/ZJOluHqmYUjvrjH1QD3RYelGm7+fECf2eIF96AJa8pXNgQPTDERF
	tORaWCjeex36Ne27u+g/VNEhkACuzHgjYLB2N3s+oAnGlxRw5eifnsgYHEcb8mc8dt+bsWaqFnB
	Od3dQ/H27KbQIvg==
X-Google-Smtp-Source: AGHT+IEE791LDmD0uUicQaiHB1HajSqjSkV/deOR3kpO21CqJ5IhdKFr58FA/7AR/uuGkG6Uz6DIWA3taxKjoxNzmS0=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr69902025ad.11.1760902970962; Sun, 19 Oct 2025
 12:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251012213230.1139674-1-ojeda@kernel.org>
In-Reply-To: <20251012213230.1139674-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 21:42:38 +0200
X-Gm-Features: AS18NWB2z7Xk1h_mxd3wp5IozHJr98VqS3xSe5xmRLBQ1GuRbRwLAOkc00U5WGs
Message-ID: <CANiq72=a2WMxQ0kKXp0_J8tnrJWb7pibWxZ2novB4SMV7gxcRQ@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: clean Clippy `mem-replace-with-default` warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 11:32=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.87.0, Clippy reports:
>
>       CLIPPY     drivers/android/binder/rust_binder_main.o
>     error: replacing a value of type `T` with `T::default()` is better ex=
pressed using `core::mem::take`
>        --> drivers/android/binder/node.rs:690:32
>         |
>     690 |             _unused_capacity =3D mem::replace(&mut inner.freeze=
_list, KVVec::new());
>         |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^ help: consider using: `core::mem::take(&mut inner.freeze=
_list)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#mem_replace_with_default
>         =3D note: `-D clippy::mem-replace-with-default` implied by `-D wa=
rnings`
>         =3D help: to override `-D warnings` add `#[allow(clippy::mem_repl=
ace_with_default)]`
>
> Thus clean it up as suggested.
>
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

For completeness: this is a duplicate (from myself!) of

    https://lore.kernel.org/all/20250924130510.752115-1-ojeda@kernel.org/

which Greg already applied as commit 7e69a24b6b35 ("rust_binder: clean
`clippy::mem_replace_with_default` warning"), in -next for a few days.

It would be nice to get it to Linus soon, so that Clippy builds are clean.

Thanks!

Cheers,
Miguel
