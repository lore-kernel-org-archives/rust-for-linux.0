Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56D17D1
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImNzueI9"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99E210A;
	Mon,  9 Oct 2023 01:44:38 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c15463ddd4so47480611fa.3;
        Mon, 09 Oct 2023 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696841077; x=1697445877; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9NcPuuexC4LQq676h0S9gZdLKWSig2GRtgLCV25zrQ=;
        b=ImNzueI9RmlEX1HFmru90JeCk1ow8JyJIQiG8wrvQTWui8m3+4JBq46l1PjZ3rhbRd
         3Arxcvn6mhrqi1e0eNiFrJnS0hdFpPQYrwwUcvj1wGeRe+F9MJxW/H9ZPQh2ps+bPuB2
         sXNITZfAzOoj67Hh24xU3JGqObAFDjHTTkiOE5zKP6RciUDDXJyppW4cHMaiXBfBavdS
         0VvQLKY4hdq6cM73DWD4QxltfGhX6XVhae4EXb0LMgvCaF1zbBwqQj3UY12IgQfY/Q2I
         E+mydI5K9gPLMhOLdbkNMTu0rvpTOs5UKe1286hpI6eqafR79wuq6QxV/9sZZelfnPxU
         /JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841077; x=1697445877;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j9NcPuuexC4LQq676h0S9gZdLKWSig2GRtgLCV25zrQ=;
        b=S6YNB/Ao4rmuqRYDm/eDAoOk9NlZqJhoM2nN9OhJP8vdnZzR2XpyfPFxzVuD7ABAu1
         w4aU8c9z9j2lXQFhS5W9yTaGU+txIRQKh/yA6yMi5b07f/34WvlPt40b7Hec4bKyjQAi
         PbcWObdTrT1mwGMRmtm/s3SIlW2HDKk1jITcf7BlOVdHQHGKh8WOcYhsVs3GXRwTO8b/
         bOVpftCxfxf/90wUbRzfby6U+tm3pD/AUP1yu5WhhV8rRpwMjH6Z0ftrDaz00/vZAztk
         Zlfv2azTVXJqgqyeUEhf+CSFFNLMGN1+FfJWH9jVbyyW6xW+rJhELSSVMVFMoYncli3T
         QNEA==
X-Gm-Message-State: AOJu0YxMnHo4v5E1Vh+Fzb7HBo7RZlyAcVAYnpItvDy+vkKwD/813w5p
	o3BpQbvCavXen4uGrgoAS5c=
X-Google-Smtp-Source: AGHT+IHWksrXQ+SoMAKh7a3XxbUloT9yuqcPkpM7sJ550Seh2+7PERN2pq9shr4TebpJxbpvJgVnQw==
X-Received: by 2002:a2e:9c88:0:b0:2bc:d7cb:8283 with SMTP id x8-20020a2e9c88000000b002bcd7cb8283mr12542249lji.40.1696841076658;
        Mon, 09 Oct 2023 01:44:36 -0700 (PDT)
Received: from localhost ([146.70.182.19])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e9682000000b002b9ef00b10csm1990652lji.2.2023.10.09.01.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Oct 2023 10:44:34 +0200
Message-Id: <CW3RYK6CSPPU.3OJHLR8D4XUYN@gmail.com>
To: "Trevor Gross" <tmgross@umich.edu>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@samsung.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Martin Rodriguez Reboredo"
 <yakoyoku@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string
 literals
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
X-Mailer: aerc 0.15.2-211-g37d5fc691aff
References: <20231008094816.320424-1-tmgross@umich.edu>
In-Reply-To: <20231008094816.320424-1-tmgross@umich.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> This allows combining user-specified strings with affixes to create
> namespaced identifiers.
>
> This sample code:
>
>     macro_rules! m {
>         ($name:lit) =3D> {
>             paste!(struct [<_some_ $name _struct_>];)
>         }
>     }
>
>     m!("foo_bar");
>
> Would previously cause a compilation error. It will now generate:
>
>     struct _some_foo_bar_struct_;
>
> Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Trevor Gross <tmgross@umich.edu>
> ---

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
