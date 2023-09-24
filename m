Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17FD280
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 17:31:44 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62828F1
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 10:31:42 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59c0d329a8bso59638027b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695576701; x=1696181501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuXuaPWmpyT/zhQXbuVLkAWVQwPw0Qt4SlwMG5ZofVA=;
        b=iTfp/N3qGCUL36yydah9YhH86wRk03MJOp9eB2+YNbL4BwUMRqPL0Bo09ttSToohnn
         Ocw0ZC+SPyJmrDsjFNfmClh1TDho83oBoPwCM0tzkHvOlvEve2FvL5JV0jcDyifb9Roz
         7IjSL8lLVkJQl9g9bu4ofT2gAeYuriQLFbHHPIh1652PhXddGF5jMKfO2HPrzZ4Rsh7h
         nouJXNN1eNZa9zy4hkenIEUgp/ey/79DdSGAfS1j5SM8rWcCC2kl/gGuUX8o8e5Zkymz
         QoRmUcJ1s1bH+Lj6CYFrlb0fLToxcbuHvy+DZ3ZtHzqKzHPrYUKA66LU968g0qSgzfiA
         MZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695576701; x=1696181501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuXuaPWmpyT/zhQXbuVLkAWVQwPw0Qt4SlwMG5ZofVA=;
        b=GezVPu2n18EwhdrNqTzcHR8TCSI90FrdiH6bfxhCWX8oW0ACrRXZwiViArDFTPYtfX
         7LTdw7OLvA2EKmiC36FEgYv10AqM0YaFZfD7gdWNYPTNkUsjiGbmTn07EAqM0Wn5hiPH
         cnowFEiXXERX/UQa/R5ddTQDjhVrqA9m3BFuQYmpp9vo/Oi4IfFwwaD/WZMoW3Xp3TMh
         URfnAcaSejfp9R685CjzTo2bLfGeaisKzGb39KHlgIMEPy8w4JuEBouH+kwuROcbKwXC
         dc6m7ph2jKE1YTDdUR0ouGmPCR9LEW30KCRKhTBUSffmgPmOd3CcvS5HmrtGDegXFh/D
         L/ew==
X-Gm-Message-State: AOJu0Yy1X4A1oeUk8I9IP6/K+PEx1+9XUQHRNcpTXFmeTirbptBKp0DM
	cmTXOyi9tvqb+gEAfktJfTWxgomozb7Ywi/9tO8=
X-Google-Smtp-Source: AGHT+IFfFezf9gzGSGlqkQpirCCvpBShgGs2EMHMt0AVNy8mBO8PXaZskk+qFxDvK4lQdfPUng9ftuNm5OQhogsso3s=
X-Received: by 2002:a81:4306:0:b0:59f:67f5:66c6 with SMTP id
 q6-20020a814306000000b0059f67f566c6mr1457685ywa.16.1695576701539; Sun, 24 Sep
 2023 10:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch> <20230918.173527.1946752214085636243.ubuntu@gmail.com>
 <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch> <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
 <b6afe2b8-6d85-4b05-9b5f-7a3b2c402a16@lunn.ch>
In-Reply-To: <b6afe2b8-6d85-4b05-9b5f-7a3b2c402a16@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 24 Sep 2023 19:31:30 +0200
Message-ID: <CANiq72mcd7QfEh1ojBKSKQBNYAhqhfAkYRr=J6nG_D2Dj6bgdw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 5:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> But not all resources are allocated and go out of scope on error. Just
> picking a simple example:
>
> (...)
>
> So clk_prepare_enable(fep->clk_ahb) could have a ? postfix. But at the
> moment, it is not obvious to me how clk_prepare_enable(fep->clk_ipg)
> can have a ?

If you consider "preparedness" as a resource in your example, then in
your function both error paths "remove" that resource. In other words,
it is the same as the example I showed above, i.e. "free a" is the
`clk_disable_unprepare(fep->clk_ahb);` operation.

However, what is different between my example and your last one is the
success path. In yours, I think you want to keep both resources around
(i.e. to not undo the preparation). In mine, `a` and `b` are dropped
instead:

    fn f() -> Result<(), i32> {
        let a =3D get_a()?; // If failed, return (nothing is dropped).
        let b =3D get_b()?; // If failed, drop `a` and return.
        println!("ok");
        Ok(())
        // Drop `b`.
        // Drop `a`.
    }

    https://godbolt.org/z/xT1MrshaP

Now, if one wants to keep those resources around, there are different
alternatives (that still allow to use `?`) depending on the case.
Typically, one could return a resource to the caller or keep it
somewhere else, thus it is not dropped by `f`, e.g.
https://godbolt.org/z/9zoco9Mxs

Or, if instead of `get_*()` functions that return a "resource" one has
`do_something_with_*()` functions (i.e. they don't return a "resource"
by themselves), then what one can do is, for instance, use the
`ScopeGuard` type to define an operation to be undone in certain
paths, e.g. https://godbolt.org/z/sa8YzK45G

All those allow to still use the `?` operator, but of course, one can
write the logic by hand too, and in some cases, it could be more
convenient.

Cheers,
Miguel
