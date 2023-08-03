Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5B418B0D
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Aug 2023 14:21:04 +0000 (UTC)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8B01FED;
	Thu,  3 Aug 2023 07:20:48 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d1fb9107036so1169164276.0;
        Thu, 03 Aug 2023 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691072448; x=1691677248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiEbRwyP1tR0wrByY60w56se8HslR4yyLy7pAwEV4iM=;
        b=ivJdcWKQ/0yXqwLoZqJ43+Jsc/9M7Ko2molswXhNAs6VRI2u3kqNp9o8iSO9G1koPY
         wI6EXIhwUM5zN+n1tVKduNZZAoqzWdkv72FOlTH8V9V8oqoT1hjpaID49l+c/m42Fi7v
         dgW5O0b1GNiGPcjvvQPjzRk9FdW3hGIIMrSzCGjfG6DwbOEtJgJBOrciiYhPPO6CY67/
         v4BokpyqGHX9wGsDruT+innqTBW1k0AETD7h0ZYh78vLAACEvi0A38c6ZDUSB2PwzFrA
         4A6SyKJoRQn3SGjTl46eZsgBoMW0qBUHvgkfPjOd3HjKq5cod4RXORgEMqBH/c69FzYx
         QB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691072448; x=1691677248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiEbRwyP1tR0wrByY60w56se8HslR4yyLy7pAwEV4iM=;
        b=iQZfb9g9nggDN/ZRV0yqNbdPZlGAQwBSKUjWWAu8qG5eZU13EYKJyIC5pxtLEQFMhL
         EhgQSeFwK89pHsaqgqKGl5lQAjbpnwWo/qnrDNJRiqtlT1ABiffjySB9pI85bDmxGal+
         zAtvWkxPIM61KgfV2TU0gGwUibtCM9rD27EfPfpHTrOUz3cwwX1hSbtlvqW8JBzvD1Pt
         IdNHMLASq9BxHZOkZO5MAvj/fB7H6bRT8bbDMdJW2S2n7blF1nY5M6Fwqjxaks3cKjZT
         VrDYOlFfrcYZDWBlceE+IHvix8wqt2MxgXB+DIWcCSlYNjrPzjSoNvgbuMvshrO0NAin
         hvGQ==
X-Gm-Message-State: ABy/qLbbvDp/TF28W4rpeg4SrQ9MHXbp7+6YL3/GKJ8vtxXvQa5P9ZGT
	PPYKtYgJtlrpB+dm3kzMlkXz3nFpTfLZUdWgFvI=
X-Google-Smtp-Source: APBJJlGWhJELvy0wK0ntAUH+eQukqY1V0H0MwKCevOZfLrSbqznIdyBI6v/cB0IegSGb94STk4usjuYWZsPnfU+Dwx4=
X-Received: by 2002:a25:6b42:0:b0:d1a:65c9:d98f with SMTP id
 o2-20020a256b42000000b00d1a65c9d98fmr18859603ybm.56.1691072447822; Thu, 03
 Aug 2023 07:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230803140926.205974-1-changxian.cqs@antgroup.com>
In-Reply-To: <20230803140926.205974-1-changxian.cqs@antgroup.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Aug 2023 16:20:36 +0200
Message-ID: <CANiq72nqy_WNY4LbyZw9p=Yk8K1HT7fjdyP2DvVKxOEw3SUv0w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: macros: vtable: fix `HAS_*` redefinition (`gen_const_name`)
To: Qingsong Chen <changxian.cqs@antgroup.com>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?B?55Sw5rSq5Lqu?= <tate.thl@antgroup.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, 
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Aug 3, 2023 at 4:10=E2=80=AFPM Qingsong Chen <changxian.cqs@antgrou=
p.com> wrote:
>
> ```rust
>     #[vtable]
>     pub trait Foo {
>         #[cfg(CONFIG_X)]
>         fn bar();
>
>         #[cfg(not(CONFIG_X))]
>         fn bar(x: usize);
>     }
> ```

I forgot to mention this in v1: the code does not need to be indented,
since it is in a ``` block. Or you could remove the block, and keep
the indentation. Both ways are fine.

> Changelog:
> ----------
> v1 -> v2:
> - Use `BTreeSet` and existing `consts` as suggested by Alice and Gary.
> - Reword commit messages as suggested by Miguel.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The changelog for a patch should be placed after the `---` line below
the Signed-off-by. That means it will not be part of the commit
message that will land in Git. See e.g. how Martin did it here:
https://lore.kernel.org/rust-for-linux/20230520231701.46008-1-yakoyoku@gmai=
l.com/

No need to send a v3 for these two nits: I can fix it on my side when
I apply it if others are happy with this version of the patch.

Thanks!

Cheers,
Miguel
