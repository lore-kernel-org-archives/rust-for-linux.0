Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13B4A28
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 11:25:06 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA6CDC
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 04:25:03 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58fb9323a27so27768107b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692617103; x=1693221903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNwlE0hptEJ+KomxedbhNDZdQW8nX6UaNAvgVOd3YTE=;
        b=DqYbQAqTPQYpujtcLYwSGJB6scOaDUgrpKcB1gNAriudu9qoLwTPXxTSLZ5kmAiqvq
         ZtUugMzKUiimHHWbnvjmP/cP1LtcksHcdFvDPRhov/AeIInzkZlFdTuCpufy9/OmoO09
         jhymM6UxghCuAKYy4j+Dp+DxnZujMVH+ZqhupYyyLuSR0Mi1WDRbwyq80Iq5pBDhUTG8
         i3jB2nDtQpdvsHgBjlyeG5TjE2BBxYrc/O5gFpsNNdYBQ1n7Pi2mSqrxZPrZq4g3ndlu
         /hZi+m+DI5Tf9AlMAkxRg3HvY66XstbLFnnbtBjIw/NwI1hOaUecO4GjNBN1Sahhv4wK
         0n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692617103; x=1693221903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNwlE0hptEJ+KomxedbhNDZdQW8nX6UaNAvgVOd3YTE=;
        b=H07sTCzgbjZI5rsmuEMtJVfLAvQyJ5AumTSu0fCglDF7dBTerVJExA9qp+6PBmPq53
         XdCiZRS19CQqTDGZAajhnMkcPaI0QkTvWqOYr+56jn9Gv9GXz410APM08zXv+x6YCUZg
         Q1BZMLDXVmpzTMLUSaJH4fycseGB5SSYM79+hszx6/YFz5Ioq7re8+IgJJl2M9crpxgY
         8+648Q1Eqg9Ltl3ZrHhRqrqQwDG0+B8S6CUMEF3N7hxQxHGJ9DU3tOR1ZfnEaXUwBpTw
         xhltfwkxfHIpkf0Lczik+BLX0MzNYJoB3zJLYEnhCDejOKQUR9xTwllXPmoaM0X5P60A
         mRSQ==
X-Gm-Message-State: AOJu0YwZhaPeVfVLcqmanor6q71d869K016MV7bcaJWsQYWrmg5VB4UK
	qIp1/cJgmFniWfkyXWKBsnCuuoiy+cxrfI4=
X-Google-Smtp-Source: AGHT+IEyI+l1AmBVra+jc/USX7OIpJ/VyLZPOuiV4jSok8FXOhINKd/eEKL8WvEoKj4KrH4vZ1m4Y2YlYLCvU+I=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:18c6:b0:c72:2386:7d26 with SMTP
 id ck6-20020a05690218c600b00c7223867d26mr71861ybb.0.1692617102826; Mon, 21
 Aug 2023 04:25:02 -0700 (PDT)
Date: Mon, 21 Aug 2023 11:24:57 +0000
In-Reply-To: <20230814084602.25699-13-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230814084602.25699-13-benno.lossin@proton.me>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <20230821112457.1363843-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 12/13] rust: init: add `{pin_}chain` functions to
 `{Pin}Init<T, E>`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, lina@asahilina.net, 
	linux-kernel@vger.kernel.org, nmi@metaspace.dk, ojeda@kernel.org, 
	patches@lists.linux.dev, rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, 
	yakoyoku@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> The `{pin_}chain` functions extend an initializer: it not only
> initializes the value, but also executes a closure taking a reference to
> the initialized value. This allows to do something with a value directly
> after initialization.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
