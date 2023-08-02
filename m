Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10F100A2
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 17:38:38 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB02D3AA7;
	Wed,  2 Aug 2023 10:38:10 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so50473276.2;
        Wed, 02 Aug 2023 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690997889; x=1691602689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9YfTqlBHpdCjHZ8wcsFDAVRi8zJlQcGYS2MHuel3HQ=;
        b=mf16aTuPZqATKHCUrtSvP4xUiX9Azz39k2ssx1Astt9oW85AIfLG4PNYDi9103QJZT
         jNy0JYluuRLBQrimKFUn1h9TtBlkj5bf0KLQDjwL0PNa7zLo/R/7CYSFNIc1t4lLUJs5
         ME7RhmaT56if8m/wmr8PEYIY9dELR25GaZAgFAAa4YGjOL/LrQmQS2ekNIqgUGW4QjXk
         AAQVKIp//QJxomSmBLl76J4Iv0feJWWLlA5Q3rku5S/Bspdu4v7Xq3f8O5NXEDFIvqvF
         KFqghhudqJXsJh35x/2O7OpxcpeBuyguYTF4DMIqtA2MxNIheNX0VaaFSuXwDallilDS
         /0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690997889; x=1691602689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9YfTqlBHpdCjHZ8wcsFDAVRi8zJlQcGYS2MHuel3HQ=;
        b=ZDZtlBROZILZDT+vWvGXiGEXC0S3Lxse5uQaJ7DgqOFCeod1IdrDrWEzEwdWJmrWiL
         MRNW1w3JNVqLUTEtj4wgmROIHyPWxp0/G+jhBfDjjzzi0/xQlp40jJBIWKmD2dEVLc1r
         CY5nBDmMqikBZISXP4/cvzZ7vv85W4wY+mwNKI7yQRr+DYfpNeLNqJWECe6pOLz/lUYe
         B+RD9jJ5W8JhLgzKzVYA/UmqZNEF8y2OW7ePy17Dq76Nh2woni3QWonNZvZFqKHIpKkU
         o3+aGbqnFpA/SZISiIXqjJIOzQnxTRGKijxfN3KOYd1BJR9jI1cpe3XbWuvfnYQSJ1u2
         vtIQ==
X-Gm-Message-State: ABy/qLaWcfWhzXLMa+Yv1P4tbEB2QOJ9KAVuADFN7T11c+Pky2+0fni3
	a1zbmjzA36A8eOnkwTDCQzlbtfpc5wVQFaWBfeE=
X-Google-Smtp-Source: APBJJlFQcS8fOH78Kd1/UgYO/uQiTqIgVOFoL07oZo0Zc47rA3sesXasVd5SN+5Bh1YVfAWkgwRxt+ODq5CL589ZlfA=
X-Received: by 2002:a25:874a:0:b0:d36:3e15:c7cd with SMTP id
 e10-20020a25874a000000b00d363e15c7cdmr6299818ybn.47.1690997889493; Wed, 02
 Aug 2023 10:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230711071914.133946-1-andrea.righi@canonical.com>
In-Reply-To: <20230711071914.133946-1-andrea.righi@canonical.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Aug 2023 19:37:58 +0200
Message-ID: <CANiq72n3NMU5UgnGNB5B=y9QjpiHzw1turEbKCy5AEKccEUE0A@mail.gmail.com>
Subject: Re: [PATCH] rust: fix bindgen build error with UBSAN_BOUNDS_STRICT
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Kees Cook <keescook@chromium.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Jul 11, 2023 at 9:19=E2=80=AFAM Andrea Righi <andrea.righi@canonica=
l.com> wrote:
>
> With commit 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC") if
> CONFIG_UBSAN is enabled and gcc supports -fsanitize=3Dbounds-strict, we
> can trigger the following build error due to bindgen lacking support for
> this additional build option:
>
>    BINDGEN rust/bindings/bindings_generated.rs
>  error: unsupported argument 'bounds-strict' to option '-fsanitize=3D'
>
> Fix by adding -fsanitize=3Dbounds-strict to the list of skipped gcc flags
> for bindgen.
>
> Fixes: 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC")
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>

Applied to `rust-fixes`, thanks!

Cheers,
Miguel
