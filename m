Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BA30F96
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 09:02:51 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF8C12A
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 02:02:43 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44d4c3fa5beso2246603137.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695114162; x=1695718962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8BNF8SyaoWs65BmwfDbTPimCmJcSZM1Pv8M7mtxSrU=;
        b=bwam71OKbcIxRvjIlMOLMpVaJ9aX0qlratXA13yCK6ZtL1vgL0xbenhl+PpZRkm465
         LCDj1i8znuR8AtEP67C5GFurfrAmwvVzVrV3Yc6anFKx41vr0B2xt743UyAcD3tvnXL8
         ugkpKU0D14ikHNgD2sWsdbqQen8jXPAf6Z76duFmiSpbvXHA6AwCaAi86vR7ZgoCXm67
         xfvGYa4uRQ/fCcWlSi4csZR1x8dHpK4tApYDC34bWpOC3iX/A6K6HbO884lwa7QVmnGr
         SJfUZZ97JU8kWe39Z+JWVSeWamH076sFqjIv3y1SBVl5Mx/45AVJkiZ8RE9rUBNfbzI2
         QNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695114162; x=1695718962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8BNF8SyaoWs65BmwfDbTPimCmJcSZM1Pv8M7mtxSrU=;
        b=OAmZ4Nst18FDmv+OAX0kpcle4uV7X4cuOg2acimyUYwpN2NsX9dAAD9c59pN8cN9wj
         4J2f2nSNRR+VaY4pvdLsJ2vjFc81BeVx+GHxMprj81WxmZFGfnYa8Tm7rNKkzRCvt00O
         7pO/5JH7FnXYMNPXyFCmkSK+BCN9gWNdlnFomVIqCAvenDx3nlLGhDiXaOTrejN57jOq
         +3xG7vMo7TrrwiRyPw/9A1JP7GJfyVI4eaC1hQtk9EV32T8263P/DU0YWhD4r5IzjYQy
         X7f2EzdfIFLn5vI5L6RY5/kn9zT7l/t7NUVHcMJVQ+PcX6xi9aInLSW+7Rq4qnIdcCEB
         t4Yw==
X-Gm-Message-State: AOJu0YyRzdKAhX+SQz4w4/4eRujiGOk1Tgzwkjpev6PfACDeMy0pKMcG
	pcjLa+LkpunWO16ZGITC1A6OBdY0Lzgb2ARYWnC0bw==
X-Google-Smtp-Source: AGHT+IFqyvdBFTnep8FohepGzwyRCUws0u1wdBbPd8761vCQv7yNF+VJALMthM9VmOr0rU2e53MBbCN5siFvMPl8k3U=
X-Received: by 2002:a05:6102:3c93:b0:452:8999:fb76 with SMTP id
 c19-20020a0561023c9300b004528999fb76mr1501179vsv.21.1695114161968; Tue, 19
 Sep 2023 02:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230830165949.127475-1-ojeda@kernel.org>
In-Reply-To: <20230830165949.127475-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Sep 2023 11:02:30 +0200
Message-ID: <CAH5fLghh5vxv=HnXRFpbZEtr-Rx+rr434N8ORGWz1caam0wpsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: update Rust webpage
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Aug 30, 2023 at 7:00=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> A few months ago we started a webpage for the Rust subsystem and
> the overall Rust for Linux project [1].
>
> The current `W:` field of the Rust entry points to the GitHub
> repository, since originally we kept information in a `README.md`
> file that got rendered by GitHub when visiting that URL.
>
> That information was moved into the webpage and got expanded.
> The webpage is also nowadays the entry point to the project,
> and we pointed the "Website" GitHub metadata field to it.
>
> Thus update the `W:` field to point to the actual webpage.
>
> Link: https://rust-for-linux.com [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
