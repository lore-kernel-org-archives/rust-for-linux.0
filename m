Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784EF405F3
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 18:42:14 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B227919F
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 11:42:12 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f4f80d084so140493487b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696012932; x=1696617732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+RzPLei9e93V6liKaBzB/t/qdsOwX2VSYlZFqmzqlk=;
        b=fPlfO+c2VWsKXkv8vBcVOqUIAdgbxHYZcq95bWKJ3AvBEV0DiQ2vfSpR4TUacVk2QV
         iA6deuWScPawwzo8yvsUOTU5CSnHTMJXdN006Yy8YZIjQbgDDHE+D2SR4JgJA5nCFbHL
         50N/4ZaXimJV7v8Kt33rsMxXNQGcV20xWYgpKMetn5fuS8jS2ZavHgIpM9qfc4Y1V0Hp
         2On80kX/9q3f/r+9/PBGSGwSqDyufbdF5Sg3C01GWxkvtfTxatl6P9MZ0FOqun3X14h6
         OwoljGuTalbGG6gjZE9htKXyTUKGbUx426YUWZ0HW1bLQk+E0pPZYjYLnOPYOQoJF8Gg
         8sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696012932; x=1696617732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+RzPLei9e93V6liKaBzB/t/qdsOwX2VSYlZFqmzqlk=;
        b=bNuYL4bQ1iP7LJ9kYNwoDwzjLfPxohaELAld3cWBr25gfZXDsqXczH9ELylh5tP2RB
         y7NHjmHIgPu2qsospToN0+y2kgH19QKZ+8JS3W5JOM/QHcN8Ypwg7gci+3nW4U7eDHbz
         j5nG51M/gJ/rmYoAzpcz/RmNRNkmZ3BhypLd5buVrNIxBkscFAMgiY+zUqLE9GNdFNjw
         tWU9lxKb0TCuBHkUT/2+ywa7o/jjlpz9XHGUalE7cP5trtI7bpFrjJDDOP0ljauP94Yt
         6gOcyRdYR/3TYW5QzLV/spn70wp+qObE3itcH79/xo9XnOrfYiUkFANo3KdYaU3bJqGt
         Pmpw==
X-Gm-Message-State: AOJu0YzcpWo0agvILkrgTPLmJ0wYsGtRp7909x7YlF0ayjufya52zb4v
	VhIoIs0DKAFbUsDYj6XmN33V8staVeJbCzKZjcM=
X-Google-Smtp-Source: AGHT+IFMR5wXy2E1bJqJlRoDkAFvIXj+V68d1/EWp78D6NrRdIBMMHxMWTiucA5DUjCE47APP7pRqADaNnKo5w7aag8=
X-Received: by 2002:a0d:db8c:0:b0:59b:54b5:7d60 with SMTP id
 d134-20020a0ddb8c000000b0059b54b57d60mr4830316ywe.5.1696012931887; Fri, 29
 Sep 2023 11:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com> <20230928225518.2197768-2-fujita.tomonori@gmail.com>
In-Reply-To: <20230928225518.2197768-2-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Sep 2023 20:42:00 +0200
Message-ID: <CANiq72nCJc6wL1VY9=8A5NruY++8X4db+agpC-SW2MMiuyduHA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, 
	benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 12:58=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> +               --rustified-enum phy_state\

Note that `rustified-enum` is very dangerous, because Rust enums must
be one of the values listed (even `repr(*32)` ones), unlike C, and the
Rust compiler will optimize accordingly; and `bindgen` will use the
Rust `enum` when translating a function like:

    enum phy_state f(void);

becomes:

    fn f() -> phy_state;

But that is promising that the returned value has certain values.
Instead, here, `bindgen` should return the underlying type anyway (or
offer a different, safer mode -- I think it doesn't so far), e.g.

    fn f() -> core::ffi::c_int; // or whatever type the C compiler
picked for that `enum`.

Similarly, the same risk is with members of structs. This is, in fact,
the case in the patch here, i.e. you access `struct phy_device`, and
`bindgen` is promising that its `state` field has certain values. But,
in C, that member could have any bit pattern (and it is not UB, so we
cannot rely on it).

Or, even better, which is what I suggested in Zulip, it could provide
a mode that gives the Rust `enum`s, but with a way to construct it
fallibly from raw values.

Then, as needed, we could wrap that `enum` into another, "cleaner"
one, with better docs, idiomatic naming, possibly another `repr`,
potentially converting some "invalid" values to `Option`, and so on.
Or, if we get all the features, we could try generating that one
automatically too (please see my previous email on that).

When testing that "clean enum wraps generated one" approach, by the
way, I found another missed optimization:
https://github.com/rust-lang/rust/issues/116272 (and linked LLVM
issues). It is not a big deal, because we can do it with e.g.
`transmute`, but it would be ideal to be able to do it safely.

Cheers,
Miguel
