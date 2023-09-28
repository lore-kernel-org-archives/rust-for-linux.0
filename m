Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009708839
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 21:00:49 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08FF1B2
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 14:00:45 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f7f46b326so105121437b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 14:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695934845; x=1696539645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbFwM/92voxCByKfu/1wITwt000tJNxRi7kEB/SC7Qc=;
        b=H2+G2MD+PEIEb2V2k8j3dgkzuWLJsexJsMu/4f8iH8iLeIbTwmFUiMcCQHNgLebRMK
         3xyerAPShfMOWqUrLpreAFdhXJVVoaXzDWhwG/s0lzxDrW5wWhu2DMDPyb4cffaO3Bhe
         W2fvhr/QOrc8L8yyWdvCkI58BR9PPt6X44UT4Qi0YEhMciygVQw/5e3CRQYgkwj7BlJR
         FMMLlMZBOHs9Rn+wIXO1lS6fVV1DC7t7wTlTREERipqFmp0OOReuulBhxd/3POIIrYjX
         qXJE8pDL+jOsr8bBuzIX9udccFP1RaM+icIdq9EKEbb+m8u4g5aroP1H46TztaYn9iQV
         Cjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695934845; x=1696539645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbFwM/92voxCByKfu/1wITwt000tJNxRi7kEB/SC7Qc=;
        b=uyR0p1zjiN2OcagB/NB6ot5G0+rpqUU0E8jAdYOx/WhUmGEV1xstaXBq/e5uWaLDwE
         eiOSM38v4lVbwQdn7XxrJzezbHHip8xj/qUTXnWaOScMj8afpLJcH8UNLkmAovoHqt8Q
         FBt7NnRBGl8sY5G6xN5KMYhKDXHD/S0oZvtojwq3z4KrxKDmPUpV0ANBbdgW0XN4EzfG
         3iDlUG2bU8JetqZuV+xdESNxpfsHd33v9FUcSjF102uCyt+PTlX0d34O5ppD4rCmQMDF
         qlhNbDx1m83ivNeWe5AHPDzaNNRZrKzjCFkddRwMmp4/O+2/7T/8LQT+At53Ufvnt0b8
         4ahA==
X-Gm-Message-State: AOJu0Yx2utUpQid14/qVE4h7Bkkof3gfji+tEYGlX1YNtTOzdkGhpaID
	299XnLfyNrlvcrsnlnLRvVXJ0PttyCrmEtK23vzFCA==
X-Google-Smtp-Source: AGHT+IEUr2RY0numrh/unRcKjdyt9WCXXy0qWxQeZg4xxnGU6fd5QmIYLDl8xYnLHCD/vFvH41YcFe9+7tV4MkL6tog=
X-Received: by 2002:a25:730f:0:b0:d80:9ef:928e with SMTP id
 o15-20020a25730f000000b00d8009ef928emr2208149ybc.33.1695934844754; Thu, 28
 Sep 2023 14:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928201421.2296518-1-mmaurer@google.com>
In-Reply-To: <20230928201421.2296518-1-mmaurer@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 28 Sep 2023 17:00:34 -0400
Message-ID: <CALNs47vqygCBPTOZQU11YFsWaeTmSX2ZOxSk495qq5uNSyd2Cw@mail.gmail.com>
Subject: Re: [PATCH] rust: Use grep -Ev rather than relying on GNU grep
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 28, 2023 at 4:14=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> While GNU grep supports '\|' when in basic regular expression mode, not
> all grep implementations do (notably toybox grep, used to build the
> Android kernel, does not). Switching to grep -Ev enables extended
> regular expresions which includes support for the '|' operator.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---

Reviewed-by: Trevor Gross <tmgross@umich.edu>
