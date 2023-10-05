Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349230F93
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Oct 2023 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRvORh0B"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6083A49D2;
	Thu,  5 Oct 2023 09:12:53 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a229ac185aso13719277b3.1;
        Thu, 05 Oct 2023 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696522372; x=1697127172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qmSzyY+migyqbDuywRVcv9SVkRkaGgH1rCeouBnpl4=;
        b=GRvORh0BSYZWuQCeWARBaAR/EygNbIjjRI3+104+eeHr+Ws6r742HYaie1ekfimhER
         UWc7sVPgIitO/keNFcKwdMq+oPkCNx5CuvzDlHX+3gmvATF8pMoVDjLQvPeYSrDvleoN
         yPuGhb0YFeZ9HuyaWKGHZPU/JmzOYsWvuaRiXYRTFmvzwx2w99r6Tolj7KhcKYUbcf25
         6izNTGP7cucCIxviKyyW1nx+VZTd8DhsaKy+qro0a2MYzDnTQXjWePD8mVTq8rqmgttO
         8oSPkcWMPOyUU6VT6XrG2N6+cSKAMRiFO6wydxTA2HIawhxTi2O2n1aSQvzT9pyNz8Kx
         IDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522372; x=1697127172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qmSzyY+migyqbDuywRVcv9SVkRkaGgH1rCeouBnpl4=;
        b=uviTxBfmdZgtWtTHPaTb4B+7Q9c2MSnIqsZDFwWf2KP4IRm+YnPs1MqpCZCZeb/xrH
         JapsCY8qyOfjBKkEFbUrg09uSbqnNTbQXb0VaOGLeG3ERQVgPQ+wdcZGZmp65FwHaGix
         hOVLf4rkuyRkPszwaW8u30d2e91ZOaqK//B8NR2XXsUzkTyTNse6GQ7cqeP1NC/mBYkV
         7YVCIggKkid3xAXu9UKPMaTFT8Sy9viJOdwRu19bzC9nbwQJ+Ltp29WMugPpUwHtINvK
         aJ1QtKPFFi19ychScskvKv72bLro/v7HBcoujm8TQauDjRxNMnX4kRqsPfDT/Hu0UQgW
         cf5w==
X-Gm-Message-State: AOJu0Yzmougj28gLcHpoWiXy0eY7GE9dz9Tk5IAbBVHQNVABzd0ucV+e
	V3F1iy4g/KZW1FePYVqw67P6tsmkZLX1nGsPF7c=
X-Google-Smtp-Source: AGHT+IFyDJEnqRL20o900cgp9GOfXgPyMQ2L6Aqu6Z2jkwZ63XPw2aTYKRO6CldxKTzNI0xpEBmV02zjKYsX4Y67FmI=
X-Received: by 2002:a81:7c46:0:b0:59f:6766:2c12 with SMTP id
 x67-20020a817c46000000b0059f67662c12mr6423391ywc.39.1696522372498; Thu, 05
 Oct 2023 09:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230830165949.127475-1-ojeda@kernel.org>
In-Reply-To: <20230830165949.127475-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Oct 2023 18:12:40 +0200
Message-ID: <CANiq72kmC1Az=gCMnJ_jcsQHNpbbQn=qUytyFexeg9uPpW=q4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: update Rust webpage
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
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

Series applied to `rust-next`-- thanks everyone!

Cheers,
Miguel
