Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC66FCC
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 06:22:22 +0000 (UTC)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E0710DC
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 23:21:51 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49618e09f16so1747348e0c.2
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 23:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695622910; x=1696227710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLHjhG4Jgg46eldzbxhJ6TWX0/Um9RrKLUKna1Lh+yI=;
        b=p5cesLcpOa8ybp8vAECV+k0cYJG4lW36uZ52482URfrq86dl95NnETn231tutDYPUP
         G5I/lILyW7dYo3Xd3Dw3xzM/Fb+FEzKb6lhigiSJ2o3tlA0m/g5HFQrOp+b25+hGxV7t
         42sSBylZeo+O1DS6oFHB84lr81Oex70gSF/XYg4e0XweeiWFJhvf+yrHVntr2uL8isLM
         bXY/jxKWl7UTzccIPflh+hmPXOvRhjOEGXBYloHwXV3saalkZZsX6fA2nbbgQkrR+Qer
         qprOeHjiXBLS41w9sDLqtmmzg8VSZk4Ne/xpJxcikyRjMkVPGbIOXe1bm0FRYpnaPxuk
         a2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695622910; x=1696227710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLHjhG4Jgg46eldzbxhJ6TWX0/Um9RrKLUKna1Lh+yI=;
        b=IsGPhpJrKuKyojXimSWAG8dx4WAZtIuFVdZw6w3eYfOdJ7mmF+ohVh+XC0YE3mwRU7
         /2n/AELh9BSvlua+PhHCuwz5hIEteyAokM+IcKr6mlA3j6+XlUhHl/b4D2vKPnqfqWAI
         zJMee6+f5tVk7crmRYoTTvCnQlEHLqW7kDcR245w40hC5sQJ1Vi4oObLFyMjFO5WkOHm
         EaJafC34iLZhLmSe3kLOtVhXeiRpJ+GbpwHUvJ4Ch5MSXpCeylmElrWFwZ5hGqdLpmSB
         jnbycfrxNMP0yKVazh7NVsKSqaD0d9/MA7kHrS6d5uqREFLvOt/dVJbdb6ayrKwINCZz
         7M0w==
X-Gm-Message-State: AOJu0Yy6urK8dilFNC9erDa6w/bqBQ58wFANdxI0GIAxBFD0mduBtxP4
	nV6de/0Kj7wt+6WGrI8Ur70waSMT9bFAB+3NMwPMxQ==
X-Google-Smtp-Source: AGHT+IHpmREQJdbNmA1t9SJ1rozZcrM0ZQpmHgFOzejqaCZOu3l0fZSDYVwVWivumeTttRNf3O9Immav5TvwGj7SsHI=
X-Received: by 2002:a05:6122:1781:b0:49a:3d72:fe7c with SMTP id
 o1-20020a056122178100b0049a3d72fe7cmr704324vkf.15.1695622910216; Sun, 24 Sep
 2023 23:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230923144938.219517-1-wedsonaf@gmail.com> <20230923144938.219517-2-wedsonaf@gmail.com>
In-Reply-To: <20230923144938.219517-2-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Sep 2023 08:21:38 +0200
Message-ID: <CAH5fLgiMiynY+EnKChEhcc3MeHW=bpvriOG2CFkprnGASGy=Cg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: arc: rename `ArcInner` to `WithRef`
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

On Sat, Sep 23, 2023 at 4:49=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> This is in preparation for removing `ArcBorrow` and making `WithRef`
> public.
>
> This is a pure name change with no functional changes intended.
>
> Suggested-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>  rust/kernel/sync/arc.rs            | 20 ++++++++++----------
>  rust/kernel/sync/arc/std_vendor.rs |  4 ++--
>  2 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
