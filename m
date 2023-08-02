Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1A5224
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 07:49:58 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A811FEE
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 00:49:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99c353a395cso201448666b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Aug 2023 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1690962595; x=1691567395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0VJhH2Z756QKOs3JZdHMzRvuHXC7tOpXij3aANtcuY=;
        b=Og7ZHsEohQK5gYKe0PKPpZmtqnSLba+zO0Hc3g1vhp26ob/YEsPA/vYuYs3R2k9vAH
         bDjXL+l1tDQUffpFsyketbLsigIqcppC3CsVb/lPXoq+T1stMompu09UbE9sQg6paLTy
         asWZ3r0Dx1vkonGTGf+z7UEV0L8sqaj/BKZRvLudBnQstzPyRpwJ8wBlwwHWTjb9D/td
         X/6rDTbf/Lc3eZpatSdk9916uZHmyk4Ht2zNBjx7LzoHAy8dcSV03yo+1aFyqOFkGzFY
         ybuwytlo28jNOrXG7Qi6duJuU/ZL6cW87OKXS8/4JsFbTdbwnDwnPzCgBIV4mMgjd1bu
         m+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690962595; x=1691567395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0VJhH2Z756QKOs3JZdHMzRvuHXC7tOpXij3aANtcuY=;
        b=P8NzQmRcS/5omn2eySy8iJBMwcDA6hPc68PRQC7hsJg9MkKZhZVUafJZEKbq1cgdgO
         yCKelcFOqJYhk9f0mUcxti9oUkL8gRTiuVBd39CMHQj2x/B9XNQIukbm3BQ+9l1mmrnU
         SoZgSRoMShpLtEe6mSEP2ulisQ2BeiRsbhltnY0m4OfQLFWq3zPXjbe2iZzozgSFjK5L
         Wj6I4u84x/yhNeVo2xJY4h5RuFyOA3s47yn8c1nmEn8WW4B4cdLgGYK3t6afHbIJ53ty
         UwEPpfZH+AO6BGj6Bum4zEgbJGXHnMwBXmaekTk3srwf1xCk9iklEEYHqtayWBFIDCuy
         KjFw==
X-Gm-Message-State: ABy/qLblVr3kFBofWrC8G/g+F2ITuHk/ol2R7/FCHu1GrietwhTevhyo
	CBDSlzwtiIfGsRrz7Q573K3k4bo4jmTx0mqd6RN5Hg==
X-Google-Smtp-Source: APBJJlH2YkiZGbYVtxer1W7isty1PVaWaBz7UcC5TW/uFSLk6MRTNTLb52mcEMYXUbNlQNO8Fpo6SQSvROqt/6IYpCQ=
X-Received: by 2002:a17:907:a070:b0:99b:ed18:7a10 with SMTP id
 ia16-20020a170907a07000b0099bed187a10mr3803171ejc.36.1690962595084; Wed, 02
 Aug 2023 00:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230729220317.416771-1-ojeda@kernel.org> <20230729220317.416771-2-ojeda@kernel.org>
In-Reply-To: <20230729220317.416771-2-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 2 Aug 2023 03:49:43 -0400
Message-ID: <CALNs47sn5GT9_VKn-SGb+STFwpbUipoNyU_+ZbpDwzLXUknUUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: enable `no_mangle_with_rust_abi` Clippy lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Jul 29, 2023 at 6:05=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Introduced in Rust 1.69.0 [1], this lint prevents forgetting to set
> the C ABI when using `#[no_mangle]` (or thinking it is implied).
>
> For instance, it would have prevented the issue [2] fixed by commit
> c682e4c37d2b ("rust: kernel: Mark rust_fmt_argument as extern "C"").
>
>     error: `#[no_mangle]` set on a function with the default (`Rust`) ABI
>       --> rust/kernel/print.rs:21:1
>        |
>     21 | / unsafe fn rust_fmt_argument(
>     22 | |     buf: *mut c_char,
>     23 | |     end: *mut c_char,
>     24 | |     ptr: *const c_void,
>     25 | | ) -> *mut c_char {
>        | |________________^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#no_mangle_with_rust_abi
>        =3D note: requested on the command line with `-D clippy::no-mangle=
-with-rust-abi`
>     help: set an ABI
>        |
>     21 | unsafe extern "C" fn rust_fmt_argument(
>        |        ++++++++++
>     help: or explicitly set the default
>        |
>     21 | unsafe extern "Rust" fn rust_fmt_argument(
>        |        +++++++++++++
>
> Thus enable it.
>
> In rare cases, we may need to use the Rust ABI even with `#[no_mangle]`
> (e.g. one case, before 1.71.0, would have been the `__rust_*`
> functions). In those cases, we would need to `#[allow(...)]` the lint,
> since using `extern "Rust"` explicitly (as the compiler suggests)
> currently gets overwritten by `rustfmt` [3].
>
> Link: https://github.com/rust-lang/rust-clippy/issues/10347 [1]
> Link: https://github.com/Rust-for-Linux/linux/pull/967 [2]
> Link: https://github.com/rust-lang/rustfmt/issues/5701 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> [...]

Reviewed-by: Trevor Gross <tmgross@umich.edu>
