Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F917FE6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:19:41 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4E110F5
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:19:40 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57704aa6c69so7804367b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689859179; x=1690463979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgZ9ooT3DeE5RLk0xNDZM8mZvor4qfJnspj3DvnmXwY=;
        b=DQ7IEpOnPYiHUaa+8JjGvD1NOOcrlYTeDHN/Kjveazs6pBW+LEE6G25+hhR2lzY5N4
         kAe8FDtMHmBH/3LsVQOghfDYy9WAol/nMK8le4LYeVPm6oefDze+MntUDRNWpqeapqke
         GLPoqDe+INYSLntdzYeo5oy3zH/Ei7qSLugfmFlFHYDVwHF0cYoBDmw/ne+S9VLaeiG8
         0SFAt75IFx6g0sgVXCCXwP42xeiaDc0i52GK0S5CdfW7dNoNnODPDknlctUxMdcm2pH0
         zRgqGkBh6CUL7NOyvbwVIjXrCQaUGz3Hr/4uTcE3zm9ep2JEuWnfdI09C7IXxOgsuX0v
         Nq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859179; x=1690463979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgZ9ooT3DeE5RLk0xNDZM8mZvor4qfJnspj3DvnmXwY=;
        b=Hj2i8BXT18YWnN2/jkmPJYytbtGX6u+UOjt+JCGlK8v3oc+tI80k3X/DanKZ72ahoN
         0rHHMu3uVJ5C0Cf9e3rJ3nwpLFFTNT7r03BUy0SB6JU1B1i6h+B3apNoaFBU6H+Lk63k
         WkzY7EOEN2iSRxGbN8D4sBrpCmFKracHnURrnJCXA8gIMS4x6gLdyp2VuGyw/k9PliUq
         hhkvom57UAJptmB0N8RIQYjmssPwuCg5y5AsdWXaU6Px3hzhp7YlOtxx026zJIRPz1sw
         gOvmSoLM51PxAmGQSSJbvoV17b3vAr/cvPBEVRkRhBCOTaaipq+cLPCDbY/luYBCfF1K
         fizA==
X-Gm-Message-State: ABy/qLZT4HrdG+UC3zQcChYjWX5pItQmXOl9MOnv9ZKYrqXrEUFkmk4o
	wsKouMt/sHvsIb9p+zzJ8Mo8aMAyCw168Z4=
X-Google-Smtp-Source: APBJJlEMchiHRAUU4IO9gxpJzGtYZzkACtFDgPV6hRWNzaIn3ajz9EJPnHsiDD25WWzLGV2F7AofIcFTPhEL4WY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:2054:0:b0:c85:934:7ad2 with SMTP id
 g81-20020a252054000000b00c8509347ad2mr14890ybg.8.1689859179232; Thu, 20 Jul
 2023 06:19:39 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:19:35 +0000
In-Reply-To: <20230719141918.543938-6-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-6-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720131935.3542850-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 05/12] rust: init: make initializer values inaccessible
 after initializing
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
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> Previously the init macros would create a local variable with the name
> and hygiene of the field that is being initialized to store the value of
> the field. This would override any user defined variables. For example:
> ```
> struct Foo {
>     a: usize,
>     b: usize,
> }
> let a = 10;
> let foo = init!(Foo{
>     a: a + 1, // This creates a local variable named `a`.
>     b: a, // This refers to that variable!
> });
> let foo = Box::init!(foo)?;
> assert_eq!(foo.a, 11);
> assert_eq!(foo.b, 11);
> ```
> 
> This patch changes this behavior, so the above code would panic at the
> last assertion, since `b` would have value 10.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
 
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
