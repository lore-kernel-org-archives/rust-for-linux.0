Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F94100AD
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 19:50:28 +0000 (UTC)
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1213619AD
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 12:50:25 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-99bcfdaaa52so10994466b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Aug 2023 12:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691005823; x=1691610623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=czEhvzC3+/GfMMXhkZoSsfuqncVAQxP622lGKX8QTK4=;
        b=In6KwkBUlF4ul/pW+99vbfUH4W72hSlc4rAx6HaoVdGCJU1GaE2X9lj4Pjj+6RWk+C
         9fxAb/3JV7cTIm1+qsm9wnfAlfshOLxTb6W+jC9jnJZ28ovJuiTbixxHyKj2xFNBZPBh
         Id4NGtDNbuYYC82m9B8xJOue2mi9GrhqrDlOQeRSwv5RQbENmPAu3R6bpnqAELTz4gzL
         yA9P6h8YVLx+V6V8ZlHS+j3dd+5UUJlmHDPU4GOOjM37Vr7dboYs1nennur0xoRXhQjU
         59biGR1KC5CUyGgJj9kngpB1u+CaUP7Rgykicm/tWysuodlGOwazma9rwFSMYS2H0/to
         4AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691005823; x=1691610623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czEhvzC3+/GfMMXhkZoSsfuqncVAQxP622lGKX8QTK4=;
        b=MqBdGRGZAIhHQefmnZaNGbZ3RYs5I3jbPgClYvWiTSUwqNdAEFX2v6K4oonYrtE146
         uxX7NyN9EbAA89vhJaLbavXMDQ6xqXdKmHXYxLT2iUcxH6BmAn97kYNtj26mKScWT+7h
         9CNOla0Z52h9irW7ksYo8ngLeJwT3EX7dUVfrIUeQDRrrvwWPF/NGtvDWUScJred+YpV
         MipE28XMGSOeB22/T6FrK7uugAR7i/1PuyD1l5OZn26N2AdPjN/J/UVYsZuJu9vw6poD
         hR64VxoZdQUPwmoGFNVlIYARVij75LdJsrCvfrGqH8eZx8sl0HXeMOOmAUb2VhI2ysUO
         Quiw==
X-Gm-Message-State: ABy/qLaRY5JVL9REPkbXwcdvwvSIRGhFB9qZ2XvJHPuVRbE8WeC345v2
	4RDx9E3226/AhpvJaXyreCvQUpih7LaKZsA=
X-Google-Smtp-Source: APBJJlHGv0gfg0TtRWInLVBUJvv637TnAGMVZ+kfDPzYop8KgrbyNX9CGg6I4WdD4CsMqprTNLhpLKzLbeizEBc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:1593:b0:994:4e82:376f with SMTP
 id cf19-20020a170907159300b009944e82376fmr22455ejc.12.1691005823293; Wed, 02
 Aug 2023 12:50:23 -0700 (PDT)
Date: Wed,  2 Aug 2023 19:50:20 +0000
In-Reply-To: <20230626074242.3945398-2-changxian.cqs@antgroup.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230626074242.3945398-2-changxian.cqs@antgroup.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230802195020.3062950-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/1] rust: macros: fix redefine const_name in `vtable`
From: Alice Ryhl <aliceryhl@google.com>
To: changxian.cqs@antgroup.com
Cc: alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, sergio.collado@gmail.com, 
	tate.thl@antgroup.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Qingsong Chen <changxian.cqs@antgroup.com> writes:
>      let mut body_it = body.stream().into_iter();
> -    let mut functions = Vec::new();
> +    let mut functions = HashSet::new();

Please use a `BTreeSet` instead of a `HashSet`. A `HashSet` has
non-deterministic iteration order, so this will make the macro output
different things each time you run it.

Alice

