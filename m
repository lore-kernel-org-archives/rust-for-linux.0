Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356E46A0
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Aug 2023 10:51:21 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FDD5FED
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Aug 2023 03:51:01 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c8f360a07a2so4371063276.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Aug 2023 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690887014; x=1691491814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHcvSmUD5NQH7dlSs1RiodhXk7N/adTKqbnc+6BUbAs=;
        b=neb8lEFM29+M7oIq4ba6eT4rvS9wzWOAOU/MmG2LdtfU5Ka5nYxrYi0MLMR1ZYb/rF
         cqNNxHfKhH2JxQiw20PyUN7toyx8ezotWhIQ6Mk9KA7V+xJUV06wn74CAv/Bqf/6+JmI
         DRrPHZL3zqrUjqgH+yQv9gKFqQChWeu0Uk6dzwZTl9CYfOHKv6pmUb4w0ETQDvG3qWgD
         mNvF4vnhhXoYtMe9OLX0v6x69UnQXWvCK83u7R1Zg7uq12jqVLgbiKjvm8xoqlzjf6bs
         lF9OKiTvbE4FVmaxloHhdi63gZ3ENtnSr+U9mvbtxIiOYlGXqVojorc1L8noznc0XxbD
         I2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690887014; x=1691491814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHcvSmUD5NQH7dlSs1RiodhXk7N/adTKqbnc+6BUbAs=;
        b=GyT/5fRBvb17jlVzbgXZ3rWle8wqdJKngMXUHw+vpNmtTWFwoAbBV30M0rJnPTbxL/
         UvYw7GBLQIL8mk+SpzHp4edpMl1chMaODErcmiBNZI09THn/2TO2fiGR5wkSWM4Y6Otn
         0oJU1Wx/S/QNA2NuwWSapWBuuo2RhNhT5TJodPPDeeCr9HJi6y1GI1ai8pjFSlf4VPM8
         XJj8VTOTW3ne+efwvCBkjeHF49BxAKmNwYGAqzC7ymfiX1NoYGemUSGsBHCCNpvgMGFu
         P6ghACOe8udTsxv2JZ3Pe5czq+cf5A661UoSVZ7iOKOEKCR+Q7wZlXh92Z2uLDvfdP9U
         dH9g==
X-Gm-Message-State: ABy/qLYJJl6akokMpcQDhztjTrn/7r0GIdDp3Uoz4Z4rTRiQq7G+7ayW
	coilS0467TQGvOfZ8newJ2nhM+l/bngH0Dw=
X-Google-Smtp-Source: APBJJlHzNb6bXB8ltHqQTkoGZq1RSBdB0hBEpZ4BPR57T3IYwV2Hmn/x7LKYrNjzdYQ6tJ5J8b6Zb4tKK4Bs3gc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:11ca:b0:d09:b19:fe2c with SMTP
 id n10-20020a05690211ca00b00d090b19fe2cmr78470ybu.12.1690887013886; Tue, 01
 Aug 2023 03:50:13 -0700 (PDT)
Date: Tue,  1 Aug 2023 10:50:08 +0000
In-Reply-To: <20230729090838.225225-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230729090838.225225-3-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801105008.1585062-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 02/13] rust: init: make `#[pin_data]` compatible with
 conditional compilation of fields
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	nmi@metaspace.dk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> This patch allows one to write
> ```
> #[pin_data]
> pub struct Foo {
>     #[cfg(CONFIG_BAR)]
>     a: Bar,
>     #[cfg(not(CONFIG_BAR))]
>     a: Baz,
> }
> ```
> Before, this would result in a compile error, because `#[pin_data]`
> would generate two functions named `a` for both fields unconditionally.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
