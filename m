Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9971C06
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ggs88ZMe"
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217A2A3;
	Mon,  9 Oct 2023 01:48:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-503397ee920so5349856e87.1;
        Mon, 09 Oct 2023 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696841301; x=1697446101; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfyyjdb+T/gk0d+IVQlbaZvTKr0SSxvaZIsplnuemL0=;
        b=Ggs88ZMepGCZ6TfOb8LIgyJ5otzrORsXkM0/CJyFeGXdqlloFQ5KTGY/ejSJoYh9Df
         hZhulIaGKaAdzEc4z/shh3qLXApd2tgH+FG0iyFWU35y7jPGBSMrr9jH0mIMJ0DOKsT3
         +BXsjV84UcDLrnDSRm8owPGilTwHLD/B226Bjyt3+duY/aXDLF+UqCF2JZovNAykHZVu
         Ei6RKs9AWdRbNXujUOT0n2rw4vUHe3WJt4pU+2Ik6CYyXZmtmnLsDbJ8G0ZOl3k1gqfG
         Nau9z8vOrwndUTkywue7CWO+k+rW3/iKQoTjC537tIrzOtFrzfAX5yF+UBwBKXWJnEI6
         Vftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841301; x=1697446101;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mfyyjdb+T/gk0d+IVQlbaZvTKr0SSxvaZIsplnuemL0=;
        b=PCzAQqNOQn5BEC/VDIFYYHXjvW25XS15ijnmQ65OYAIsM1G6TAdu71MpEI4vqtLUlf
         zBWkQr+p/uIIlHLhKYeRbFbenm6wtxcgywTEA7jmTGCna7j0iz8dyStOq8SM0l99zsEF
         IeC/wLlSOPRzxa4c2lN9Yz98S/8oknMMZQWmmcOFuUX0QD15n3MN/oEFqu3b709wXSsZ
         9N1ZrfQZTI3YtL/eTBCdVaUn2yf/sARTliB/vVr4iTGnSxI7BajD3AymWnLIWxggzk4w
         QwPpUxVe58Rujcfby0l5FdW7O/Ogs4yNpEk+g/xEqi6NNpP4SPCj0ELlLGP6Bax9SRbk
         FcnQ==
X-Gm-Message-State: AOJu0YzYXZTt7r0wcuvfrzbzAXnltcuANaSUbrLzEX55+sWbI246RdHb
	azXQAhnTqZvktLoWFOxIDck=
X-Google-Smtp-Source: AGHT+IFiIewVzzvOrGx/jJGjRrf8IDuw/w9wHlqS8H1L3mU/KJICkmE371s7owG2drRYRK4Gcy6jcg==
X-Received: by 2002:a19:644a:0:b0:502:9a2c:f766 with SMTP id b10-20020a19644a000000b005029a2cf766mr11734198lfj.30.1696841301095;
        Mon, 09 Oct 2023 01:48:21 -0700 (PDT)
Received: from localhost ([146.70.182.19])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004fe36bae2d6sm1374671lfd.81.2023.10.09.01.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Oct 2023 10:48:19 +0200
Message-Id: <CW3S1FL7JQ9K.3R5QL6NYCVBJ8@gmail.com>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Alex Gaynor" <alex.gaynor@gmail.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@samsung.com>,
 "Alice Ryhl" <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH 1/3] rust: task: remove redundant explicit link
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
X-Mailer: aerc 0.15.2-211-g37d5fc691aff
References: <20231005210556.466856-1-ojeda@kernel.org>
 <20231005210556.466856-2-ojeda@kernel.org>
In-Reply-To: <20231005210556.466856-2-ojeda@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> Starting with Rust 1.73.0, `rustdoc` detects redundant explicit
> links with its new lint `redundant_explicit_links` [1]:
>
>     error: redundant explicit link target
>       --> rust/kernel/task.rs:85:21
>        |
>     85 |     /// [`current`](crate::current) macro because it is safe.
>        |          ---------  ^^^^^^^^^^^^^^ explicit target is redundant
>        |          |
>        |          because label contains path that resolves to same desti=
nation
>        |
>        =3D note: when a link's destination is not specified,
>                the label is used to resolve intra-doc links
>        =3D note: `-D rustdoc::redundant-explicit-links` implied by `-D wa=
rnings`
>     help: remove explicit link target
>        |
>     85 |     /// [`current`] macro because it is safe.
>
> In order to avoid the warning in the compiler upgrade commit,
> make it an intra-doc link as the tool suggests.
>
> Link: https://github.com/rust-lang/rust/pull/113167 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
