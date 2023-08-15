Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2631119F
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 12:10:25 +0000 (UTC)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C9C173F;
	Tue, 15 Aug 2023 05:10:24 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d4364cf8be3so5374280276.1;
        Tue, 15 Aug 2023 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692101423; x=1692706223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHvKp/Ntb2IbR8H/HtEVaiWwAh0UlzB39M1mc57UxB8=;
        b=iZR2nRgyvebmsWdjaynHkQjYCuWd5o1VBuOTvo2H0xc1Hl4hKcSx4Y0n22HxBRHhqg
         uXxZrj/TNq/LRdyiwGde4Y2IU2Q3ZKDhpaGvyCyeYI6IfWLwhl37HwhEVBWcBuSyeL3+
         GlCKD3XRFkGalJsdGSI+p6W/GBddfF9HhB2AGMFDa0SkQwZmfxhJwcybkvnl6pr/R8A9
         2gr2euPG8/pwRjv8PR6bQSq6tdrqrm0taTngWJoV8YczhJU6Do4vbUo79cSA34ISGJJi
         O7mXfwpcHQ8BAJfKyhljx3+mpVH18unMtJ/+BnOh+Trvw0nmk8qqbsjEB2vrdC4Y7fko
         hJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692101423; x=1692706223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHvKp/Ntb2IbR8H/HtEVaiWwAh0UlzB39M1mc57UxB8=;
        b=VSxR2ezc9V9QLhQFR88vVhEFhk5Lv3r3fS/CsoNG0R7V3Argh0WkRYeH22JvhFvoE1
         Uvdl8YdbMV86Spzhn4MpY6/M5ghTFTlKilk7zaltwduht5ZKwmop4B+2e7QNeTSjcB/C
         Sx58a5Rs/GMMRrpXbYX76mvTMmiGM9QiNgnuNb/OZJKnxA4PlziC6MtNAl6Av3+3lnve
         syZwkezKUyTStVEMejWE8hrDWxW9MJodFU1Up85xpkKIgV4XNesWig7+YJbWTV0xCWyv
         hQGKsvKzHjBwPKqoaSSKVBkPD437A+xjcA2OdIsTwMX67QkPUny6fwj6b0cca7IINOec
         WHxA==
X-Gm-Message-State: AOJu0Yx2ijVIt4xM6g5EUBHZ0zMFbLWwjkdDEMptN8CxAK1GpTVuCtH6
	kKYewszm0kbrqFePy65cdp5aYiPv39dSf2uEp0I=
X-Google-Smtp-Source: AGHT+IEuRW1UZIjVahCtg71WtvpEfMj20fiN1t4gAXGytbwu90fBowWuExOKrWmJflJTOSH4toD3fff5V2aexR+hSRM=
X-Received: by 2002:a25:103:0:b0:d67:7aec:54fd with SMTP id
 3-20020a250103000000b00d677aec54fdmr11728829ybb.62.1692101423200; Tue, 15 Aug
 2023 05:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230815065346.131387-1-andrea.righi@canonical.com> <CANiq72kv4DwGLSGTwXYh3-b9h08Erd2RH7wXvVAUAEx2x+q_BA@mail.gmail.com>
In-Reply-To: <CANiq72kv4DwGLSGTwXYh3-b9h08Erd2RH7wXvVAUAEx2x+q_BA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Aug 2023 14:10:12 +0200
Message-ID: <CANiq72nqTfJJb9oQZGpAn2KZwDXwp6StVKKETWF-m3fLpnsiPQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix bindgen build error with fstrict-flex-arrays
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Aug 15, 2023 at 2:06=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> to make GCC and Clang (as well as Clang `=3D3` vs. Clang without the
> flag) to compile but disagree on the size:

To be clear: Clang `=3D3` vs. Clang without the flag should not be a
problem for us because under `CC_IS_CLANG` we pass the flags unaltered
to bindgen.

But for GCC-built kernels with Rust enabled, the disagreement above
could be a problem.

Cheers,
Miguel
