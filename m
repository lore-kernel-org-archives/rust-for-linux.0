Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90A1EA9A
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 15:26:56 +0000 (UTC)
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DE318F
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 08:26:55 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-48faba23f51so957824e0c.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695396414; x=1696001214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cISaHCePjrxo/CVLEpGiD/FBx6lNRky5Rpu9Qk/EeY=;
        b=JFRS8N6vI0LXz9MUkg9sPerOYjxE+/0eW9d/tKyviDUN6uXZ3oJCIWAmhzkFDF9l/Y
         TsDbTSUmfwK7eiHdX/bK7FumML5cifn2e0hdvmX5wum5jfLq/N+FHhzp2QFAbEVaBtdv
         T0ESfVtp43O4Yr+DNCKXBG2Im0H7HNrNPXdWj2OcwIz4mg00FfPNF4yaC3gZ7nMLYew7
         rNfdci0awQyWxvwISoauNZmMc/SV82mxD0KqiMAVFvy2Mm6LY3pB1L/bar2dmeRgAhLg
         jD+Qlx3UICrAY4M8O2Bsb3+6sL8mHDgREJmEUTZJFdh1xPIe1+WxCOt4IBsdJif2P1c3
         wl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695396414; x=1696001214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cISaHCePjrxo/CVLEpGiD/FBx6lNRky5Rpu9Qk/EeY=;
        b=jRtb6tq5xgRiIOjpOZYoI4PSQtlTg3DasOb0uD7KlbxGhmiGHOB51JFE3wCT2ETBFo
         wvkeMFQ0AqA1BGqF7lKkpOO75UDi9UvT+tsnJYQB0ndBKLNK7qpr6cMDaUB0/LeBwfn6
         2hqt/DooFuZRG+atgVvJ1sA9D1ivXeOBnZAPQA5ofJ4EGh4ZNKP+XFegDiJ+kc5VdM7r
         a8c7+WazYe2xPIpRxk0MhJOdIWTJdu1ANBy9MhGlO33+0hzxE08t0geqJ8TvtGxnO8+R
         sIS8oUzeiwtcpPeM/IFeFxF9BSYkgH+IPYHNTwC/zzlizTH6EySH7dKN7D6IYWbdYCLm
         o6Dg==
X-Gm-Message-State: AOJu0YwOjHIS2HrbEsdVIjDfuoUr+NULAop7PfkyjoXmOQImmFo19ERc
	WMgtcHh8TGTAmGAXwQhkZ4yZGoWSS+EJu0IyyRXbWw==
X-Google-Smtp-Source: AGHT+IGvaWRVksBxrXMvBOskHAgBK6V6YeADx0Tj0QiceP4/17imo0V5Gq9ZrnJ327m/7BW59aFoSOOZBysTgOljOWk=
X-Received: by 2002:a1f:df43:0:b0:495:c362:94c1 with SMTP id
 w64-20020a1fdf43000000b00495c36294c1mr8270562vkg.7.1695396414076; Fri, 22 Sep
 2023 08:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230921213440.202017-1-wedsonaf@gmail.com> <20230921213440.202017-2-wedsonaf@gmail.com>
In-Reply-To: <20230921213440.202017-2-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Sep 2023 17:26:43 +0200
Message-ID: <CAH5fLgjnwB6eTV-6ksX4QB_NuvaDRw4zdBoRKO_wm8UAZ88u_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: arc: rename `ArcInner` to `WithRef`
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
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 21, 2023 at 11:35=E2=80=AFPM Wedson Almeida Filho
<wedsonaf@gmail.com> wrote:
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
