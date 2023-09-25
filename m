Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069F33E5
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 06:29:27 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9EAA3
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 23:29:25 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7ab8696d047so1162209241.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695623365; x=1696228165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDgdET5rtDgfpk7MPhmyy8y/ZmiNwOCWphKHbytaUxo=;
        b=YTSOu2ATNujHMfgzMWSmDmbfnRBQ1sRkuiTD3sxjJAAjfzRpD/DAOAYS5ueWPkCnic
         QV2aXh0PyLcy+SM2pBthdMR/T12RJipGvq2B216WCDgaMaZuUXKrmhR4x8hQlv+89m9K
         lo5jSeTcytCejTJRCm3Jo/SQLn4XvoZA5r0Zv46A0KvCW1HB3WydOIv+3gse8H2V1FAh
         k/bcy9Q4hYQTimrg481oG2MgHVKwWzhjhpB/WoujMCBShXilKOZzAadhMHpJTQSqPyX4
         56THR7KPK4uTV6+hqgyDPcTchC8sAYhysnvR/2bhGMSWspi3ZmsMvyLBAC7UzUddc94Z
         hzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695623365; x=1696228165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDgdET5rtDgfpk7MPhmyy8y/ZmiNwOCWphKHbytaUxo=;
        b=xHoksC2yyqh5uc7iIqbZYhRQ1quNBMoHu9l3aftOvHcpEB7rC5Y3g5DfD+yNDxVYP5
         oiucmT7FAOjaaMnjQ3Qt8AyvREIBnmN5PxIo/Fr2TPaLLKv5I2yl0zA1T/JJTnXuNStC
         ubLJpE+88numB+tSjKeGkcXNrJmZHn0yKmirPA1kKExAoYFsHCZcBdXVJhJjXXjUu4L1
         Ds7zbnH2FKiwunsb36ecPH6C4fUrwFBL3yf9wABx1UC5/00s+zYTwgkP+rM/A8o/vDhX
         KHuU5Ludv8uIOX9vqsoBvJasHZFtguTEDGCS73CC6WAAlKCAGN00uq0M3X6gSG86jzhC
         mNug==
X-Gm-Message-State: AOJu0YwaeC7gFWJiMyU707WabZ2PL2RChwH54ThHxuqTNy+PS1SrORur
	TvATDixm1wczjuCm6oGfcNr2o/NboXCM/6G/ANbI8g==
X-Google-Smtp-Source: AGHT+IFwCb/CRM2abdfreZNQ2ERq36W4n80P8e2ba47ixMybiMq0GkOtwkvq3YyYsc2amiQiY5Y5n46o6ES39JOP/8A=
X-Received: by 2002:a05:6102:92:b0:452:68ee:654 with SMTP id
 t18-20020a056102009200b0045268ee0654mr3575157vsp.2.1695623364698; Sun, 24 Sep
 2023 23:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230923144938.219517-1-wedsonaf@gmail.com> <20230923144938.219517-3-wedsonaf@gmail.com>
In-Reply-To: <20230923144938.219517-3-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Sep 2023 08:29:13 +0200
Message-ID: <CAH5fLggxsewmtzXjehbawDCTHO0C7kteU_CLnh80eMNj=QyP9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 4:50=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> With GATs, we don't need a separate type to represent a borrowed object
> with a refcount, we can just use Rust's regular shared borrowing. In
> this case, we use `&WithRef<T>` instead of `ArcBorrow<'_, T>`.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>  rust/kernel/sync.rs     |   2 +-
>  rust/kernel/sync/arc.rs | 134 ++++++++++++----------------------------
>  2 files changed, 39 insertions(+), 97 deletions(-)

I'm concerned about this change, because an `&WithRef<T>` only has
immutable permissions for the allocation. No pointer derived from it
may be used to modify the value in the Arc, however, the drop
implementation of Arc will do exactly that. It also means that we
can't convert an Arc with refcount 1 into a UniqueArc.

Alice
