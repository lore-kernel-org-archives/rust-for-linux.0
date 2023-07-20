Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BBB182A0
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:31:09 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE97E19B5
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:30:29 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57704aace46so7893837b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689859810; x=1690464610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjG54K9UMvND9YdSZpiieZAi2mI+0cYK9bWMBk2vtjA=;
        b=X8llH09LLmS+Qw/lSrOllIHi+4dmRIBX/dXsgg6Lib23gGuPm28NtMAWavnDcRMqDW
         Ade1jagBfeBBB6WvukKwd5cI+jaDOdbyXcTHZeW12bE44KI9ONgPxMAPpqKjS9OFyNQF
         NVmUDiFEGvXOOmGkitR+UOruNdAs7lCfnvd3T+GF0oDCZQo2Oc9PYQ/+6cPUG7Tst4U1
         eXOmKDxZ8B2M5NT8a+h11SM/RUh//iLmYJOsDLM3NeWZkHykJVAgwj0iu4YolCQA0ibd
         Qaf7ZWuTQg66vr+cJLrkR2pEwo1u1jTEXsKQAcr0Xd8y3qF714UeyMTz3wM+DOtwG1pI
         0h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859810; x=1690464610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjG54K9UMvND9YdSZpiieZAi2mI+0cYK9bWMBk2vtjA=;
        b=M8aoZNoVCdOdycuUCCnMudtvqcbhhhMYWnM3fMdb+ycREcgkHC/yW2N7L/sGggcNK2
         RoDO3fSfJHyqQLIVbtxFALg7bqHFdr7GAGD2M0Uv5nxx7ZIFqtfEGnuvM0PpBfvBJS93
         m9dbrJC4afO/+BOoMSKUtHHNQeIxj1wCGyYA3qE6YS5xxg2fi9PlxpnVRBWwVUhaR83x
         DKwl7MpFBjoG/oLV2VrRtTtbS5vrZ2/FtHETwqqsSc0ZENimVPypBYgDw4UEMmE6Ybye
         n5HdI6eroZADxRl8Fqsr7WEwJoWe7kp6rSzILZYFA06Tw+StAxoxWClCV/qef9bVxZZ+
         VEyA==
X-Gm-Message-State: ABy/qLavm6MEH3A2KVmY4MMj2VDQ52ZYN31uiDXnWPRH/L4n6HZKtqjD
	XNFB7VdDYvbqBHdDdWJ7qbNHe84sFVG+R0M=
X-Google-Smtp-Source: APBJJlHh8OTAMhUc+zd62yYjSroTZ83K3aOglIxna4ipPRiay62Nb2MGLCYg7ujuKQKtxT5uTxldXcvJkoo/iqo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:410f:0:b0:562:837:122f with SMTP id
 o15-20020a81410f000000b005620837122fmr208475ywa.9.1689859810179; Thu, 20 Jul
 2023 06:30:10 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:30:05 +0000
In-Reply-To: <20230719141918.543938-9-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-9-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720133005.3545184-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 08/12] rust: init: add support for arbitrary paths in
 init macros
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, lina@asahilina.net, 
	linux-kernel@vger.kernel.org, nmi@metaspace.dk, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Previously only `ident` and generic types were supported in the
> `{try_}{pin_}init!` macros. This patch allows arbitrary path fragments,
> so for example `Foo::Bar` but also very complex paths such as
> `<Foo as Baz>::Bar::<0, i32>`.
> 
> Internally this is accomplished by using `path` fragments. Due to some
> peculiar declarative macro limitations, we have to "forget" certain
> additional parsing information in the token trees. This is achieved by
> using the `paste!` proc macro. It does not actually modify the input,
> since no `[< >]` will be present in the input, so it just strips the
> information held by declarative macros. For example, if a declarative
> macro takes `$t:path` as its input, it cannot sensibly propagate this to
> a macro that takes `$($p:tt)*` as its input, since the `$t` token will
> only be considered one `tt` token for the second macro. If we first pipe
> the tokens through `paste!`, then it parses as expected.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
