Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4CF1170C
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 10:49:37 +0000 (UTC)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0C8191
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 03:49:33 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-579de633419so133237287b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695811772; x=1696416572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVrqixWQws7AjhyGGwpP2VQQM+Y9QTpgyK/LeNRBUPQ=;
        b=J7nmtxICMt3l8+zDj0Z5OMvjLMs3j4b7JtOhvpgPvpYAQIaczbHkfpVkIgbEyE2jd7
         Put7nxYsogKUB01oyQWEPRnO8KGIczXJD5E7WvH30zSijSasQwgWrotNSMdFd4TMc4BL
         nzHh5N2VBrNSyu7yvPudjjO5xR9JQwPFM87qPj8iFLT5LFD//LJ8DIc2N0lPaHSxSYG8
         zZbDo4EWUXjPKgxI366fjRRK6z/vXXpPPlZdCtsypvh6dN+yCik+0YeGKYWqjKqX+ovr
         mUdHVowoZNLJQspVed3V4tfgKhDp15UHnYnxpJjVF7YeZPKC0tBptmw3MbqWHLbV8m43
         NU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811772; x=1696416572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVrqixWQws7AjhyGGwpP2VQQM+Y9QTpgyK/LeNRBUPQ=;
        b=i8Sk9VJXjJEcvdUwEnlDIcoX16aS3xOi5btGzfg6eal4bZRMjHH5UczXLHwSgIa1DX
         R0bY3GfV8b/OrlVM/b7inmQweWxqJuMdNhyjz2EIWeFbtlDDF2fxjBMlUVtaN8QRnHyc
         EnS24lHBsmHgAQxORRcoptQysj9X8dc05KzH8pemABTw7dP2+SO16Jp3vjXOu88opihE
         TQIkfDjBg29HyOOe9ix/JfmUc0yvWXeTbdnw0eGt/13D0icDTOpVMau6NLKN+Z/Z51Ly
         43jgYc/HkjZBq3o+B28W8lCJZMb7phYjKs3qnH4i7upTLJHexpME262J6nmNwfOQVBe2
         8SIw==
X-Gm-Message-State: AOJu0Yw0YXSvknuIS7XPYSZWof21ed7u885RKHM2JRPU3U+Tm2FawQsY
	ewcM2fx7ndyHO3M+0M+KM8B+ImT0U0aRmn0zXT4=
X-Google-Smtp-Source: AGHT+IHVKoEjmIxD6prsTYtAViosRou4Vf7pznHVsN2URtBB2e/5Ms4Om8O8SM7HS9LyXQUeu1bmDEizwLLAcCrJMeE=
X-Received: by 2002:a0d:ed85:0:b0:59e:8f6d:92e with SMTP id
 w127-20020a0ded85000000b0059e8f6d092emr1720118ywe.49.1695811772580; Wed, 27
 Sep 2023 03:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <70dbdfd2-9e8d-6985-ae42-0d4f1a7dcef9@proton.me>
 <20230925.192433.108741056500744806.fujita.tomonori@gmail.com>
 <CANiq72nO=Eje0dv_NCagvTzOLU7WkfM-bwqH33z_kC=f=m1m1A@mail.gmail.com> <20230926.224630.1323587629112314285.fujita.tomonori@gmail.com>
In-Reply-To: <20230926.224630.1323587629112314285.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Sep 2023 12:49:21 +0200
Message-ID: <CANiq72m-9pALVX3gS4N99+xhDK8rS=Wss0H+aBoUyrZTBwmV3w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 26, 2023 at 3:46=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Thanks! I updated the code.

My pleasure!

> No helper function for a function that returns avalue like the
> following?
>
> let ret =3D unsafe {bindings::some_function()};
> if ret < 0 {
>    Err(Error::from_errno(ret))
> } else {
>    Ok(ret)
> }
>
> if to_result() returns a value, it can handle both types.

Do you mean a function that takes the `ok` value:

    let ret =3D ...;
    to_result_ok(ret, ret as u16)

or simply having `to_result` return the value back in the ` Ok` case:

    let ret =3D to_result(...)?;
    Ok(ret as u16)

? (which is what Wedson implicitly suggested, but `to_result` does not
return the not-an-error-integer back at the moment in the happy path)?
Or perhaps both?

The returning one has the advantage that we see the explicit `Ok()` at
the end, without having to remember what an extra function does or the
order of its parameters. It also allows one-liners with `?` like the
`map()` approach assuming one really, really needs/wants those:

    Ok(to_result(...)? as u16)

It also gives a chance to give a better name to the value when needed,
since at that point it is not an "error-or-value integer" anymore, but
the actual value we want, i.e.:

    let my_thing =3D to_result(...)?;

Cheers,
Miguel
