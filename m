Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6680A17C3
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 08:18:20 +0000 (UTC)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFF1BD
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 01:18:19 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-45290cda80aso6407459137.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Oct 2023 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696234698; x=1696839498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzGsF0rzQfJ2PSb9vQta/54VjhELfW04Cn5cgB+veoY=;
        b=2VZoskpY8CB3Bl80MW8tT3w0+t3zNEZSuAo0/YMtpN+yb6ivR+iyjXwhmL1K1rf2MB
         iiZEAi1eLpgwjRSDe+1ALVti28AoIBEy6Z52Yv/QTcEm2qXy8156wTrXzzuK2majr3um
         jKtn8R6jC8DmJJY0iNjIsGiNI2NcsXx3coTGWMa7HkItfKrDh9o0wBWmeMHy4L6Y5BM8
         zBTXrGeDhecHbNT7uIJiV76hsPAqPymCgpNdlmhTen7LXSF3r3tGyiQVPa2KLnc/e2Wn
         loh7L2SlrLHBq/ICJZ91an0SNqJdzADr7IcBv5YxovxSqed8Y8ne7FjgHf+YxeUcOhoO
         Xogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696234698; x=1696839498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzGsF0rzQfJ2PSb9vQta/54VjhELfW04Cn5cgB+veoY=;
        b=Hy/v5B2NDhJ9T1LuinxVYpWo+6/SGG5LqxH92V4CNcyoytIsd2a3YB91tUvxtwBRwG
         QAowXh38n/9/nsN+vQxi9QhSpS67Yjs6aBo2+kg7RWNji93asdhlSGwLmYVdFkfLoX8u
         B8CEwPT0+CnXIwUYfdN5ut1/skV14SCoigLVh13KaTmmlvykBle6rvnqa0e7/lE6C+Nz
         lp71TZKLS8BFKihUA3rMan0RH2SfMDew6cQbHErNN+N1jUw0AJ2gbL7n0Ohiiiyx26RM
         GpnPw+ECLgygnREzFULjLe0iECFJiRLozHz1ivQYQbaX0j2WY4N6JibXq4UzxFeUb/iF
         1x6Q==
X-Gm-Message-State: AOJu0YycYR+3korrU9RzffyfuUvCREAzdj3g5X+35GJrW586bBvCJ8R4
	K8vGjYJvg/Zve8P8x0Q50uX/kwMnKo/JmU40u6QHNQ==
X-Google-Smtp-Source: AGHT+IHNKNGh7AYwLVhrXE3mmbjF4Lf/z1rjAVKz9QkAX1cFb5lJWqWaTN2K7r0ITPz7PTVM6uJ747xF8Gt7sVyM2sY=
X-Received: by 2002:a67:f818:0:b0:452:6ac0:ed19 with SMTP id
 l24-20020a67f818000000b004526ac0ed19mr7834838vso.31.1696234698016; Mon, 02
 Oct 2023 01:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928201421.2296518-1-mmaurer@google.com> <CAH5fLgjmPkfokku190dab9JVqk3_uTABNWqOZ-xKOEqQJoX+9g@mail.gmail.com>
In-Reply-To: <CAH5fLgjmPkfokku190dab9JVqk3_uTABNWqOZ-xKOEqQJoX+9g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Oct 2023 10:18:07 +0200
Message-ID: <CAH5fLggO4FP3JHdA6QtU8fK9yzFtnAk53=bbKF2++23bA+ML6Q@mail.gmail.com>
Subject: Re: [PATCH] rust: Use grep -Ev rather than relying on GNU grep
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 2, 2023 at 9:51=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Thu, Sep 28, 2023 at 10:14=E2=80=AFPM Matthew Maurer <mmaurer@google.c=
om> wrote:
> >
> > While GNU grep supports '\|' when in basic regular expression mode, not
> > all grep implementations do (notably toybox grep, used to build the
> > Android kernel, does not). Switching to grep -Ev enables extended
> > regular expresions which includes support for the '|' operator.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> LGTM. I tested this in my Android build.

Also tested in a non-Android build. Works both places.

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
