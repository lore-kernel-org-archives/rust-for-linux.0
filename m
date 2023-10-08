Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728811725
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 19:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cha8+LDw"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41476AC;
	Sun,  8 Oct 2023 12:59:56 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a4c073cc06so41275997b3.1;
        Sun, 08 Oct 2023 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696795195; x=1697399995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdYr4d7gBllm6mIyE1rAZ7SVZ/Nyogo/s69v4RDk5B8=;
        b=cha8+LDw4aMkCO6hjm09g8T226yl4MGnFIol8lBX6uMZNi5leWnxF1DDW0b0GkM8PL
         2zmdBFvJ/+zS/ajjATQ17eG4835GxHkYAjGay+F55agCapR+yAYiN4KI93iQTiqNNAE+
         I3Xs8WP34IfK/cOu9t8sD2s3lZeGdvQTDgYd0f1lUm36ME+adHxEM5cU4d/g8/XduWOd
         v97gwkfiG8j25Dk6XAI3/UZTQe41D+gF6gTmzBCSSskPZdmqZB3HBBTRUza9/hOm4BH2
         8NKJOvR49wHrwzLeSTyhCs2+iZUEkxsR3+i3QFrssJAM7CAWF/cOgyCZ3JHkhhocca6c
         jbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696795195; x=1697399995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdYr4d7gBllm6mIyE1rAZ7SVZ/Nyogo/s69v4RDk5B8=;
        b=WP8/qTmfYfjrKD3BikmJRXhdGLH6LHBhb6lAI3ZskFYVNpZzoZHbbapeKEklRaL/tR
         LWOC7uCbHqmZR7JGARVEbOteeLlLFgB8x2nzWcPJBeJVIczLvSIGgyC62H10jQ8Twcm2
         0NAQWFDpoHgm6MtABYYnN717YUtfozcxfl1KtYzE5Ds4R8LTPRzbto91w1UyJqWEKR3o
         /mCYTpXtYOTc1OCkXbOBxfdeUC5XgUEjvyfAxgTOTDJFKA+5oUrvn+Q9gQNrlC9aY8Z7
         dfX1uH2Iyn8iyOPU1v8RBdMISWn4WvTV0zZz6YM2QoDXFAM9VcP/kQSRBnEdAoa8zBPv
         ikRg==
X-Gm-Message-State: AOJu0YyX1ulIxyidTGF63m6E9bL9Atw1qZau2bYv6W86T9gu+ZVb0IgA
	a2PmFjpDbsKoEcBJAQhimRCet+h9QlZnO4dkRJY=
X-Google-Smtp-Source: AGHT+IHyfN0gqXCS8NjyFGxv3STLk4oQJvMKyqZ3FwpKgQpMbwp4UeIAm4Andx8CtEUJbebwzLVG5y2mGYYplpwjJls=
X-Received: by 2002:a81:6086:0:b0:59f:6440:7eff with SMTP id
 u128-20020a816086000000b0059f64407effmr7234775ywb.15.1696795195430; Sun, 08
 Oct 2023 12:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230815065346.131387-1-andrea.righi@canonical.com>
In-Reply-To: <20230815065346.131387-1-andrea.righi@canonical.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Oct 2023 21:59:44 +0200
Message-ID: <CANiq72=t3H7FseigxjMywwAWr2hM5YKZPqJMO_0dH86WwirtEg@mail.gmail.com>
Subject: Re: [PATCH] rust: fix bindgen build error with fstrict-flex-arrays
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Aug 15, 2023 at 8:54=E2=80=AFAM Andrea Righi <andrea.righi@canonica=
l.com> wrote:
>
> Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3D3") enabled
> '-fstrict-flex-arrays=3D3' globally, but bindgen does not recognized this
> compiler option, triggering the following build error:
>
>  error: unknown argument: '-fstrict-flex-arrays=3D3', err: true
>
> Add '-fstrict-flex-arrays' to the list of cflags that should be ignored
> by bindgen.
>
> Fixes: df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3D3")
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>

Applied to `rust-fixes` (with an extra summary of the discussion in
the list), thanks everyone!

Cheers,
Miguel
