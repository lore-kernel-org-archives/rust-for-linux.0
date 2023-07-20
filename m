Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2BC17AA6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:09:20 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C52211B
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:09:18 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-583312344e7so7421817b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689858557; x=1690463357;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URfFYme25baLr1pjIuGY05OV9hkL1kZ6iw1B9jJiYbQ=;
        b=F1G3kgAJMRCPvFvLCqBdv+xE6HqvaZGWiFw3zRdSvtXqFJplEV1kUadc60xdVwMnXY
         yg9K5YIzN8VUIXwyGhBPyb58shkiGB5lkFYcoxkfxIhI4RhyeUs5HA5rktribN1cW1x6
         VMUXrmNIKewfokNGJhSGvBnsQAbnUWn5/ryMC5GNNH9kXgbFMHnx0WShS0Uda32PvQ4o
         Ba+93DSCGje/0zbz9tYu2JAglOCpV0FwuuZiEx8ca51okjoiV+trPqjOmEcGdemYTe80
         rX+Jf6iAuWqS177gedZ4hAfQuINeN/RrX5izHYE50h4pbOGf5MktTyY+jpWfQ8ho1VbV
         Y+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858557; x=1690463357;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=URfFYme25baLr1pjIuGY05OV9hkL1kZ6iw1B9jJiYbQ=;
        b=EsEvr/bYDuggIIM5BLih1MW5G/uBbEWTVjMr0rc2sL4q3/xaNVpcplOYUHzS6f0kib
         Kxpc0EM1J0pHmuwZiQwjLP8PBGZXFERw+vzZP72ZGVwS6+sNCh0+Tx6qhLztTzjsACRX
         iWnKR92Wrv/091OmaSdY2AUhfujbaZUC9cFrVeKbNmW3HUYphLjkWqgE5UkfdtD5ILWg
         Ejv/z7hu/R22VM3lHWYmkBMbZmFtNXopkQYP570yH0mtm7UqP2+H7+10zxOOpOQP9H/J
         Oy58kkYXcJBdBeu/SJCVQu5aC2V7GfJqkJOxtlVkQmji6yaU7Mzc2TEbZUnrO4tIq1IV
         Kdsw==
X-Gm-Message-State: ABy/qLbNfooUiBLt0BYsSHawK9SlEzmxQUcvzz3L158v0HlTVbsrBpCJ
	prSKYOQVA4qwkvE/ZKjAd1vLHqyHcFxKOFQ=
X-Google-Smtp-Source: APBJJlGHH4ltUoNcMtMERBQVB1eY3JEqao0P6GUXo8NypCt2sNtKFSCkfmV87W2+owVqImszJvp06ud6yEhQ9ls=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:c545:0:b0:576:f3ee:4e67 with SMTP id
 o5-20020a81c545000000b00576f3ee4e67mr58729ywj.8.1689858557661; Thu, 20 Jul
 2023 06:09:17 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:09:01 +0000
In-Reply-To: <20230719141918.543938-2-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-2-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720130905.3498563-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 01/12] rust: init: consolidate init macros
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	nmi@metaspace.dk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Merges the implementations of `try_init!` and `try_pin_init!`. These two
> macros are very similar, but use different traits. The new macro
> `__init_internal!` that is now the implementation for both takes these
> traits as parameters.
>=20
> This change does not affect any users, as no public API has been
> changed, but it should simplify maintaining the init macros.
>=20
> Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
