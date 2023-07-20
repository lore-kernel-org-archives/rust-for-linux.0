Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D317FE6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:18:00 +0000 (UTC)
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFFCE60
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:17:59 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-98e40d91fdfso63062066b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689859078; x=1690463878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VqC/0JpDhyXercql+gb+A9vFQQTl07+8TE4AdNDBMOY=;
        b=Ae7PRYJlYnD1+4pmKb+x5JftBt4GemKLNPzxWPe/uMdE5jNm0J4SP1TiGIljtQl+Gv
         5qKA5HG9kJjVVKDx2SSnjz8mxwZw93jyQaXf3PpG0KiY6vNKbUs3PTlhW8nFrFzf6Vfo
         iUDh5FTFv/ADr3M2PYhuTCcL3Em55rqDV1UFAcgh5mKeCTtQgwfVR6rjxIDIUjocR5cT
         Pzkcc7SsPPIdCNHkR3WDOZ4aH4BNug7YXnvz6kjJYsOv3/p8sznAWrM+mN85FxLUg3gu
         OiGnY0LNKVIlvUTz1iecN1s/hoGLmqWm1qzSjICL8JSBMiJBwVRRZLLPdNIh6Z1RIJFn
         eZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859078; x=1690463878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqC/0JpDhyXercql+gb+A9vFQQTl07+8TE4AdNDBMOY=;
        b=C3zfnLe9We5DMINLiUYhC1cF0wga0plCqpMcrzosX0+/nhKnBN7J5LU5y72pM7CL+E
         W4LI3E4mdhFYX/y30JefUllmJtm1afmX5nR5owv/Ox0SqbRuxrMsdkFYTaJ3Vtb9KA/o
         R3RSGMunIwNjH9XwGfxsjxWIuhuqBNcKek6b+h4QM8+awNJhioJhjlYDHf61WqJHR4E8
         HQOuC8CG0sycAF+zrzEiKY3l53YRWBiaE84gck3Bb/zyHQLnwEGKmJR2FVnle8z+AQ43
         MJE8DXmH/rXD3vXDXqHAPiAAewtX3mWDE9AWuEruswnT+RlApjG2gmcadoEJnM9dD6V1
         bgqw==
X-Gm-Message-State: ABy/qLb8+cMUyohmqvXndPbP1dWr/zCea/Kj+WSfKfyBbuWbENBFoBr1
	Bws0MGY0fzA/LaWscAQIhHTp/BsmkAE3jfc=
X-Google-Smtp-Source: APBJJlHeJaf7B0zoQ7KZXQTNw/JnIXKLzxfjIc+cswd1g/hDjonIcYSCpq6kHkA17ALUgwWYE5Ro3oLOzyFslaQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:5a71:b0:997:e8c9:6f61 with SMTP
 id my49-20020a1709065a7100b00997e8c96f61mr15503ejc.2.1689859078009; Thu, 20
 Jul 2023 06:17:58 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:17:51 +0000
In-Reply-To: <20230719141918.543938-5-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-5-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720131751.3542420-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 04/12] rust: init: wrap type checking struct
 initializers in a closure
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	nmi@metaspace.dk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> In the implementation of the init macros there is a `if false` statement
> that type checks the initializer to ensure every field is initialized.
> Since the next patch has a stack variable to store the struct, the
> function might allocate too much memory on debug builds. Putting the
> struct into a closure that is never executed ensures that even in debug
> builds no stack overflow error is caused. In release builds this was not
> a problem since the code was optimized away due to the `if false`.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
 
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
