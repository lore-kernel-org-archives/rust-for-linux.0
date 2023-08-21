Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088E4A10
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 18:57:30 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C222B4D
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 11:55:37 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bcfe28909so464209466b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1692644113; x=1693248913;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=J1bPOG4b+YloUifqT7Rk+dQEUBL9OO+h1q+JajXVUOs=;
        b=gO+ySJZQvHoGjzmlV9IPCqXRevhrfXNHPe6MA3P1hH9xZxOHLSxnfOvsflXz1XlHks
         tMLbSxSDxFcgbtE7GtT4eNcWw9EOJozEdSVsjQqA5Drlsk/utGXkzgQyho39oU+e2hYw
         wkJvrIGjEE9cSRvFMVRbwmDKhgJ6k44fMAgnzzi1SK3h4uZWQh3plH8M13qzGhSoFPv9
         /GaG4sGukwDJeCVIb/USlGGEbIfq7JAU/zggAljo7A27e/V5AaSKChKH5DzNO91htni2
         ZtKK7mz747oSQ1AYUw0X+AlYTD4I8erEz0e8X813Hzbl1ZUUfAgLB14a5Ce2GBg8JNKQ
         R2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692644113; x=1693248913;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1bPOG4b+YloUifqT7Rk+dQEUBL9OO+h1q+JajXVUOs=;
        b=Oe3boCei0Nk7ekOhUHfnnYK20PdsE9aCPQQfTMzK1P7PI4PJ02FRhxBnX3ci66HXMh
         bK1UvqM4nbp1SQzBnUYCgXev5tZydOIyISZuYnBYMxzyW9tnDvFFLlrSEiVRGzWWeCy4
         FAN6jl2lj9EpNqibQNpLJREPNiiTOY7mGu+chLmAkC77FY7K2EAZQVgRnHHpgcvMCTLr
         wGsL2so+vYJWitKhQd2Swm6qWyW5QOehydkzFyXhkqIDgrJQe6YgFMlE437593+qQZkK
         ZYjC0e18kp/1s7Yjs+5jRGGjb/K9Rc+UOoH1kDsP2aIKG2u52y7p+Cumn1kQLNuPPh0+
         lz4Q==
X-Gm-Message-State: AOJu0YzZHoai7jby24bBlzaJS6qbaZHKCgDcnQmnWNnrB4cgHIQIJgDR
	jtZaxDVO4IhJTG0/Nor/QeXPMK1RJFyIhRzQDoQ=
X-Google-Smtp-Source: AGHT+IEthwuxN1Toa5Mr0lSr2fZ63x5sTSrzhhPevyvctTWOgtn884Tztzzip0ASVSL9Vn9A2tb2hg==
X-Received: by 2002:a05:6402:2025:b0:521:ae63:ee63 with SMTP id ay5-20020a056402202500b00521ae63ee63mr5925942edb.16.1692643611060;
        Mon, 21 Aug 2023 11:46:51 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id ca3-20020aa7cd63000000b00529fa63ef6fsm4815116edb.57.2023.08.21.11.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 11:46:50 -0700 (PDT)
References: <20230711093303.1433770-1-aliceryhl@google.com>
 <20230711093303.1433770-2-aliceryhl@google.com>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, Wedson Almeida
 Filho <walmeida@microsoft.com>, Martin Rodriguez Reboredo
 <yakoyoku@gmail.com>
Subject: Re: [PATCH v3 1/9] rust: add offset_of! macro
Date: Mon, 21 Aug 2023 20:43:08 +0200
In-reply-to: <20230711093303.1433770-2-aliceryhl@google.com>
Message-ID: <874jksp71i.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Hi Alice,

Alice Ryhl <aliceryhl@google.com> writes:

> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> This macro is used to compute the offset of a field in a struct.
>
> This commit enables an unstable feature that is necessary for using
> the macro in a constant. However, this is not a problem as the macro
> will become available from the Rust standard library soon [1]. The
> unstable feature can be disabled again once that happens.
>
> The macro in this patch does not support sub-fields. That is, you cannot
> write `offset_of!(MyStruct, field.sub_field)` to get the offset of
> `sub_field` with `field`'s type being a struct with a field called
> `sub_field`. This is because `field` might be a `Box<SubStruct>`, which
> means that you would be trying to compute the offset to something in an
> entirely different allocation. There's no easy way to fix the current
> macro to support subfields, but the version being added to the standard
> library should support it, so the limitation is temporary and not a big
> deal.

I think `#![feature(offset_of)]` is available in 1.71.0, can we use that directly?

BR Andreas
