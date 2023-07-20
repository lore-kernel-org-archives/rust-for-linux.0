Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2117AA6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:14:09 +0000 (UTC)
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D32326AB
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:14:08 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-993c24f3246so102448666b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689858846; x=1690463646;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhMVjqtIwF2Tg40Izhr6gVwHnvMnwEbvE1+ZYX4vm9k=;
        b=sG6iy6fk6l2JO5DIdNc9RKdBW7jkSQxC7vSIrItBwcUnSxvtReT2zFivjJESsG9U0Q
         +KoQUi9jWIuLo3y8blSy98nyF2TybbWPfYOZltpAkLnC2t339/ie3RigSxRTUqrnpVeX
         EjfE57s6bi0/lPDTm2J5H7Z4BRUAlATqYVlOCXG/c4JaqE3cI0Qkq8Dc2dGax7AiNlPf
         hJXBwXIoQjvpcraNFU80OKL4NQljnlUcaov9f412TG1GHzOUIdn84goT6AhF8oucxSOc
         tAS7CmjQJwIrYAaUe/kYjRr71K6VYRRhWzZ+Uap0ymxhI5YJmxO9J0PLgG4fOXjwPnU/
         ROfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858846; x=1690463646;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JhMVjqtIwF2Tg40Izhr6gVwHnvMnwEbvE1+ZYX4vm9k=;
        b=VFkBra7XMkke/8MY/z6yjg28l/KmgR/NiYk6GgwKvHTxmsfCqbsNJjoFFEyEutCWhY
         /H3jfNoLnBZybvwIXogjGQViBtlhUMERTY3BnYn12Y2alDpV1tlsDMEy2pHV7bO2nZu2
         Sqwa70rtEs/lIugwDt51wrZ9a/KZU+Ja8NhBcsQxeo1lF41dLijof/hKEpKzte9l4sYT
         kTQEhQGthDG9EArvMSE87BUVoMfy/rw4eohfqK9ntjiqCWwZoQHwWR6sz9K8yZNxD0qg
         dwzukMPbSLWCNLj2F2py5OhZSiuUZ2xKpkk4bBgjMx79LAYWJMRJoXa4N/ownXBdMkQR
         T07Q==
X-Gm-Message-State: ABy/qLa8/UxoaDOV7796D19EB5DWMCqSFIfzwrG/V5/8r6+VRbQauVPh
	kP8fjlPJXuE19JX6AlXioKef7ehUVX9YB3E=
X-Google-Smtp-Source: APBJJlFMYNs//wSeObOIq0zfhDnRSXJFZWaBMFtWrzro+oOu4bIgh3FqmmRSGo+395olj8nuUcbLhixsyOAwAFk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:2da6:b0:99b:5a23:fbad with SMTP
 id gt38-20020a1709072da600b0099b5a23fbadmr4009ejc.4.1689858846507; Thu, 20
 Jul 2023 06:14:06 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:13:27 +0000
In-Reply-To: <20230719141918.543938-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-3-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720131332.3541151-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 02/12] rust: add derive macro for `Zeroable`
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Add a derive proc-macro for the `Zeroable` trait. The macro supports
> structs where every field implements the `Zeroable` trait. This way
> `unsafe` implementations can be avoided.
>=20
> The macro is split into two parts:
> - a proc-macro to parse generics into impl and ty generics,
> - a declarative macro that expands to the impl block.
>=20
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
