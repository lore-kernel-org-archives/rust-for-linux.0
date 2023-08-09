Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E9124503
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Aug 2023 19:29:08 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AF8171D;
	Wed,  9 Aug 2023 12:29:07 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso134991276.2;
        Wed, 09 Aug 2023 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691609346; x=1692214146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcscsUkP03B0p4i9abt9yvt17SBC6WrkC4Y/P5ByjPQ=;
        b=Brm9y2huoYjx8YMGOeQa1Wn8d9eKUveUIa5G1Al3dQahnH5ZazF9KdEs49Rrq2qeXm
         +bojiyKZ1nMiUvciuItA9/ljMsSj4REjYnT7KipPN1FVcL3IhBTGLFf2ZC0mOLEMfyWy
         OETxB17Lgm2MkjI/TtSBc7/2BzTcvQ4lW3mfPTa4QjYhHqx+3FkKp8ICk8C6icHPP/DA
         jEWv2LUBCYzBMaF1Z9MjB5rD7WfFbkx9XWa89gQgC2o9GDw2+rFidhh7l3+nMyENHXxL
         aPZOHpoCG4QUcPYWsCubnI2FcfzmBg7XGvoaPpqvrR3vOXNrU1xUgRjWbK+pbCsNR+aE
         0ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691609346; x=1692214146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcscsUkP03B0p4i9abt9yvt17SBC6WrkC4Y/P5ByjPQ=;
        b=KVdrNdYuM7QjTiy/XbasDxtAOKssk3VNw0V6DhDTPiEeOQ90uMyWDqxCFUBmXAi1ui
         6Iavt7qTCN8prRC9/1piP1TISqTnxM41GOtKg+5IgxK/VIo9eqjp+aakiCHyFFyNrmeV
         UvDdxCScPispxXV/Lz/acyzSKKBlr6WET545jlfROboQXxfnX7snoZC4MLf7/LUS59n6
         Cz/Es6kIfyLNsB1jB8i8KBHie6Ue/yaz1k/o5abOInFXF4iRtweqNqriB34NGAdwy3Co
         X9OxNCkmXmDIYYT66qH6qf8RxrbsVkvosnfHQ/WqUKPb+ccXSxIH/GQ6APoK3KKwAIhk
         ZhgA==
X-Gm-Message-State: AOJu0YxLwQbFkslyDFab2X/3YEB5/WfdIqVfl+PwWB+JnOCmOSRE5//9
	frv5EBuh5yqZK6eF6z5TUxMZNMQXQLxjIeCPIC4=
X-Google-Smtp-Source: AGHT+IF6ZbmLyngW0tUGFwiExGV0rYLUQomPlRWCzRGNSlaIYoMC94vmCJp2LCUAIBaX+x6ENUgdCv0NDkEEB3LR6Dg=
X-Received: by 2002:a25:d17:0:b0:d13:2d43:34ad with SMTP id
 23-20020a250d17000000b00d132d4334admr386895ybn.17.1691609346639; Wed, 09 Aug
 2023 12:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230808025404.2053471-1-changxian.cqs@antgroup.com>
In-Reply-To: <20230808025404.2053471-1-changxian.cqs@antgroup.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Aug 2023 21:28:55 +0200
Message-ID: <CANiq72ka691RCpO02jBT9yOX9_jQTe5n-GVG35x7F25B+HdX8Q@mail.gmail.com>
Subject: Re: [PATCH v3] rust: macros: vtable: fix `HAS_*` redefinition (`gen_const_name`)
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Aug 8, 2023 at 4:54=E2=80=AFAM Qingsong Chen <changxian.cqs@antgrou=
p.com> wrote:
>
> If we define the same function name twice in a trait (using `#[cfg]`),
> the `vtable` macro will redefine its `gen_const_name`, e.g. this will
> define `HAS_BAR` twice:
>
>     #[vtable]
>     pub trait Foo {
>         #[cfg(CONFIG_X)]
>         fn bar();
>
>         #[cfg(not(CONFIG_X))]
>         fn bar(x: usize);
>     }
>
> Fixes: b44becc5ee80 ("rust: macros: add `#[vtable]` proc macro")
> Signed-off-by: Qingsong Chen <changxian.cqs@antgroup.com>

Applied to `rust-fixes`, thanks everyone!

Cheers,
Miguel
