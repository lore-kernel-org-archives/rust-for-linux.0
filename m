Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3203423A2
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Aug 2023 10:46:31 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E174D468A;
	Sat,  5 Aug 2023 03:46:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d3522283441so2823299276.0;
        Sat, 05 Aug 2023 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691232390; x=1691837190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0kaSQGFOdpyORL5u0e6rSfhKvQMmZDt9DGOVV3I7H8=;
        b=TUeRwPSGD3Bru6owOtuDNpxWEbME/SK+QukxuHM/mD9cH7bc2Lqv5dpRiAjFDnelD6
         WDYe3trLoFmaVvWm4qzESo+hZXodlshdhFIR5ZN5TlB4Yr7eo+hqE5Ma+s7l2MpWqQ+J
         JWjEOfiQk6s4eoI7lqp2haiWu3SSZpB6VV50rDKixz4UvovCIWoUDFMhKwG4RO6fr7pM
         6pdrGu0MrPdWlwXiPCw+/Lw44PxYicv1OGN9xTGIki0Hx/jGVGIbunw7w7pwwmVeH0vY
         CICtq7rJk+ZogRUNklYCnZrG3bLnDdAxxwBX4392olj1iBDUwkuu/RQEy3K7PouY3fXq
         LiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691232390; x=1691837190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0kaSQGFOdpyORL5u0e6rSfhKvQMmZDt9DGOVV3I7H8=;
        b=Wo6BQgZm/ojqd9LCuKdeBFkQwPUho1/aeZJ0P6ac8ZBiMSU973+HieGHs6bp7QQWUl
         wiLGdjynAot5Bf+/3t8PRxEDY6PYpvoVq8DjNS8VEVIwxSpR2EMC3793vpKhnQ8Wvvts
         KJwkBO63nF9rfVdh7URpJSv2J+rVHSwKGkp8TOacXi0SYCAPQBlnETQCqhPHnkamlhyA
         H8E8Iy4OZcFvMKGq+eJ9v3vOMIGqgBAGfG3QkgjZUHl6/7LwAEZ4niJBhBw/+CZBl181
         wHnAJmWlnnc1UxpsGE4aWUMkivj3iXFRyB0fBw5dFJMHEIiKaZz555yuIESGeeItGymU
         Ykvg==
X-Gm-Message-State: AOJu0Yx37iXkNeMnnhk4rMaERu2dV44MH+/ynqgjJy9tyJTg5CeK04KX
	tNS4VzFAsl9OLWPNkIYR9qIJwCGe+vhJVI1Hdu4=
X-Google-Smtp-Source: AGHT+IETSwfpTjPiBS07opK6v7s1fpfurQwcxwFAL6GRRgG52fk2srlqQMJilNeshqrrU7ivSVLOe7dtD5CeqJcfw0Q=
X-Received: by 2002:a25:cc47:0:b0:d18:1fbf:c11d with SMTP id
 l68-20020a25cc47000000b00d181fbfc11dmr3937017ybf.47.1691232390115; Sat, 05
 Aug 2023 03:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230804171448.54976-1-yakoyoku@gmail.com>
In-Reply-To: <20230804171448.54976-1-yakoyoku@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Aug 2023 12:46:18 +0200
Message-ID: <CANiq72mkmTRzuYSGveP2xxPbDJELHXoVWVbKF2eyK0DhJ+y7bw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: generate_rust_analyzer: provide `cfg`s for
 `core` and `alloc`
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Aug 4, 2023 at 7:14=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Thanks Martin!

I am a bit confused about the Suggested-by -- did you add it due to
the suggestion from v1 of passing variables via command-line
arguments? If so, I appreciate the gesture, but the main idea/report
(passing the missing `cfg`s for `core` and `alloc`) is yours! :)

The patch seems fine, I will test & apply it soon. If someone wants to
give it a Tested-by with rust-analyzer, that would be great too,
thanks! (note: it applies on top of `rust-next`).

Cheers,
Miguel
