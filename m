Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C07489
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 15:42:15 +0000 (UTC)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151AE1BD5
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 08:41:54 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d8168d08bebso7607499276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695656514; x=1696261314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLQQz1zdLbQfufVzk34FpL+pPcpblvS2JmAaXMdjyhQ=;
        b=gkBVwfw3RMzqZf6jlXRMwrrFY88TjzTn0fyTNh1ip4/GeX7PPupNlmK4KPaiRG4y1c
         aBgTTmGvXR5aS+Qm7xTrdofo2crW5asyv02ZGMzbQ1kLzbmsoSBDUB6MGb7LsGE19PO/
         3RfNZ7k3L4BYUhwpLhqjCuWONhWry4RTwMKsqMKSS8nyOovM0QbfirBEz0DczCmPVmul
         LsW6OFxOaRXvfMvKh0QHSKXLPYYhviQ6Joj1kR3npyXWjkDylO3AqdNpuZPFyHVW7w9L
         pqTPlGgftiWRlkHnWgthTi5FbsjJD17ZrVYl+S0oPrYI71nCjB3HFxJ4uPEWJr4cIMOz
         SYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656514; x=1696261314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLQQz1zdLbQfufVzk34FpL+pPcpblvS2JmAaXMdjyhQ=;
        b=p3HkbVAY5jBUttIKQwJDf4t5XgDZiCckRUdDGXcLN/8FRpgLblMv43mSeDRJ0ktkDz
         mFg1pVOmNoLp0fxxfLPIty0OLmIJJoehTh3eN0smgCVKotvcdwcwkmEcu+EB8nSsGDvR
         ohautFd67V3DCkEJ1Uioy0Q9mGy9xc4OCQ3vsbWN/0gPgQ1NkUKi45qxteFypV68DSUu
         8gxoWyemUe+jl/72c8TeJCIbcv0X0UezwDI6mnK/PffAPVA9XZKxVjFih00vI8lkM9Pe
         Ao4GEOzVOZVNlLM6u2jlKYWmMGTqkO3CL9AK6wUtB3BHariIN3Ei/HYwNVkG6eT7Np6Z
         AHHg==
X-Gm-Message-State: AOJu0YwI5pGihe1zfguxRKUQBmDHwsfWmHxD1Muue16lbRFBsp2oeYO/
	Q6oZVekbm7hIBokeeG51RKMEbqY8JZi5yQzE0ZQ=
X-Google-Smtp-Source: AGHT+IFVJTY2bnG8fQRFQ1dVlElpOPiRrMDCytC9cB1zA+dFtqi1cwcfHplgJJ8Awsw/07O/jskKYNfoIgnOT3lFQGY=
X-Received: by 2002:a25:f205:0:b0:d68:8a7f:127f with SMTP id
 i5-20020a25f205000000b00d688a7f127fmr5981445ybe.52.1695656513042; Mon, 25 Sep
 2023 08:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com> <70dbdfd2-9e8d-6985-ae42-0d4f1a7dcef9@proton.me>
 <20230925.192433.108741056500744806.fujita.tomonori@gmail.com>
In-Reply-To: <20230925.192433.108741056500744806.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Sep 2023 17:41:41 +0200
Message-ID: <CANiq72nO=Eje0dv_NCagvTzOLU7WkfM-bwqH33z_kC=f=m1m1A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 25, 2023 at 12:24=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I'm not sure either. I have no preference though.

One way we used in other places in the past is:

    to_result(...)?;
    Ok(...)

By the way, for other kinds of conditions (i.e. if one cannot use
`to_result`), I would suggest the early return style, i.e. the usual C
kernel style:

    if condition {
        return Err(...);
    }

    Ok(...)

Sometimes for the last one we do this too when the function is
"symmetric" (personally I wouldn't mind just doing early for those
cases too, to be consistent):

    if condition {
        Err(...)
    } else {
        Ok(...)
    }

What we should not do, however, is this (which you used in the patch
before Benno's suggestions to use `to_result`), i.e. `return` and
`else`:

    if condition {
        return Err(...);
    } else {
        Ok(...)
    }

(By the way, I just reported
https://github.com/rust-lang/rust/issues/116150 since codegen seems to
suffer in some cases)

Cheers,
Miguel
