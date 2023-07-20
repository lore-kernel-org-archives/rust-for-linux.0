Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D5182A0
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:37:41 +0000 (UTC)
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49583273A
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:28:18 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-51e3713ce6eso2411300a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689859694; x=1690464494;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3r7xstMG/kDrYDN8axEH3Hi8qFOTJMe4TLJz4jYmBg=;
        b=PTe1ehyaKvilZef3g4vHLFsfgo/zjZhhl9Hu/iFK5kZArR9dMNrbE3QWMg+AmoPIDS
         PJf4ZRbrfKuVvvAvvt6ISNzv4r+XBbfEC3rUutmrzkVHQsgi10tQh7bqlw5aQAiCHM5y
         ywOBIRZOHiQLIpx9vCE1HbLq7dWAynqIIE+8ru3jTrYYPMRo34dL1yeH6BnWo+FMZXXI
         S6hEcngC5n0blUSac32IEbftzUGXb+pJ9QrTFvPnUkBTOgbv+3qZP2hTwG8jc/0yg4/a
         PbO/WcveNUfrxLTHl43LFNAxZfYqFHVSpEClNkrt4X0HB0ppOjpjGsvhV36D95ZoQ73T
         RllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859694; x=1690464494;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3r7xstMG/kDrYDN8axEH3Hi8qFOTJMe4TLJz4jYmBg=;
        b=Jdoy6H6EuM+TbOIlm1Zhj9hYIHrWZGXNU/yr3LnHAlSYOV7qZsgKcKhjCVwx7Z+EHh
         cAtTWSyY+RmLIfm2sJjoYommPT1g1/2NOPHIdLB6K4WX5yl7DztF/wCluerzDj5c7Fix
         caCPgFAEGMLl6LROd4NketYASdhWd4AbwODG+gDLueBNhN4j8EnweHWMqC4mmK9SV6Ez
         KJKBPpr1YsAPdNU515omLgC2IlsrafiMPF8b/u1SEJKCj2BDui6RsylBAVvyUneJMsHg
         REjf6qimbyIv1yorYvN7M++EDTrPxq5lzhxh099tBU0unrNr+bseoAis3yNiZ3dIp+lQ
         27lw==
X-Gm-Message-State: ABy/qLYKAsoIXMLK7NbueJTa8qxILoArZRBtc96+kEo99t0dgpwlti3B
	7Wtit387ir+qCi/qE2WKVTCliFLpnrfcE3Y=
X-Google-Smtp-Source: APBJJlE8OrGrsbaMdmuytTZFTGo4pUACU92mRTmpZoM7CghjuXix569QQaRuSbm3GdfAAXcCGw6VBYGTYzP1YwU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:aa7:d885:0:b0:51e:3859:396e with SMTP id
 u5-20020aa7d885000000b0051e3859396emr36329edq.2.1689859694714; Thu, 20 Jul
 2023 06:28:14 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:28:07 +0000
In-Reply-To: <20230719141918.543938-8-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-8-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720132811.3544642-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 07/12] rust: init: Add functions to create array initializers
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, lina@asahilina.net, 
	linux-kernel@vger.kernel.org, nmi@metaspace.dk, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> Add two functions `pin_init_array_from_fn` and `init_array_from_fn` that
> take a function that generates initializers for `T` from usize, the added
> functions then return an initializer for `[T; N]` where every element is
> initialized by an element returned from the generator function.
>=20
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
