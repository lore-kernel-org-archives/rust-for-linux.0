Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34EC17FE6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:16:56 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E122700
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:16:53 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57320c10635so7226277b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689859012; x=1690463812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZDyfQVqAO0bnYa7VYw9MMaKrL6NuobnBPEQu7nAapA=;
        b=b6DzRutOpRlchzhGc+vWqutvZPPlCW3TQf+U9eOy+pcYyCjPEjS83wJDT+mdAcH9WS
         ZKa2pOq77PfNzKjFJeVwBMyLfacxlFfOUdD20e/AOBtvomkN6yOFjVc5/eYRgrx+3l7d
         3ejGayJL4s3SMDgZFhcQ5GwPji6pqyjsIW+1b1tC53n1xDH2P9QNV7otpXOyxZGO772D
         ZxbDafbsKOn49/SC3si7WnXYIu6/Ki7S83+EjdnudP/wTEGox6vKP7+EvdIQDScKBWgw
         x1Ugue/ctvM4GE26AaDdqJwsK3jh18x1OFYNbPkBImnt09s7m3hTGf2grI49QkwZ5XV5
         6pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859012; x=1690463812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZDyfQVqAO0bnYa7VYw9MMaKrL6NuobnBPEQu7nAapA=;
        b=GJ6H5BcKlBTElfCmILgikj16JQ2bWym1/U+PWlmQ9sNgtPsrM4LT6YNXUrvN3Hbs5l
         YL8fEH6gxhVCDP3lyRX6CPNOL6XcQhhOimWHxUzqLs93aQEx/2quKZw2QCyOEDh1IEKp
         amYEs660bOYmFTAF+M4jSW1k/VTGe+tAdZXJ8UCZNS/UxbKi8hrvlS4rry6sk4redGNQ
         xwTTX4J7WlNzrl0MJ5hpGhcadSPPsWNXBp1ljHPFkAn6NdwLht3/tTmVPtwgawPr5Yf8
         qlmN8wNs3K+4eO3HoU+j0rLsejyg2nL+ARcmbDAzH2+uHs/bc/arl1pXu5NWixVUn0s3
         1nXg==
X-Gm-Message-State: ABy/qLZT5EaTwARvygzFfNgAUYXhOgEpyODZeCDug0/YxB7mq+SGPypD
	X0at5/Imn7gpyRkEto8wowc/zylfNKF9Ma0=
X-Google-Smtp-Source: APBJJlFilV9dSuhKU7Af7K+uRVO6k7U92+nHUAIyOw7PsPz2kKbD7kCT1zItva0bW5jPFRiobB7cXYXHGmnRxgY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:b70d:0:b0:581:7b58:5e70 with SMTP id
 v13-20020a81b70d000000b005817b585e70mr59224ywh.5.1689859012266; Thu, 20 Jul
 2023 06:16:52 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:16:48 +0000
In-Reply-To: <20230719141918.543938-4-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-4-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720131648.3542031-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 03/12] rust: init: make guards in the init macros hygienic
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, lina@asahilina.net, 
	linux-kernel@vger.kernel.org, nmi@metaspace.dk, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Use hygienic identifiers for the guards instead of the field names. This
> makes the init macros feel more like normal struct initializers, since
> assigning identifiers with the name of a field does not create
> conflicts.
> Also change the internals of the guards, no need to make the `forget`
> function `unsafe`, since users cannot access the guards anyways. Now the
> guards are carried directly on the stack and have no extra `Cell<bool>`
> field that marks if they have been forgotten or not, instead they are
> just forgotten via `mem::forget`.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
