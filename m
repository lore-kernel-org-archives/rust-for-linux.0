Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849C8F78
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 11:48:31 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D5610C8
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 04:48:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe8c16c1b4so6666029e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1692704849; x=1693309649;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=uhIrFon087E3iYfZNnOqwEsuA1QGwXh+7swXilo4wNE=;
        b=MYo+yKWLa81z+XWwwjzVYCoI07QUk84F37CFOstTIT0Olw3mmnSPMI2BwhGVAuQeib
         IqXlcYHpUDLDUko026HKd4AcSIeqtPooSaGhK2A88c0S2uw3UTdvlTIB+kO13CRZtB5P
         Mt1g72j1MQ5ircxEomxpjmSKXlbFRrvKTnEipwqfc4LN+oCJNQqGD0Dp6COdIJYhWna8
         xMHA7oSXMJco9TrwMuOlyqiAN76cwHuRfol0uGnMVUI5OhpaWc6H901blMfKJtbMMK76
         8uCmpeBYJBZdWhDEFgtuYEyG7LaGxEVK1rLNh6lduuwPisotDTc8aga/MzfxGGG3EWO2
         uzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704849; x=1693309649;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhIrFon087E3iYfZNnOqwEsuA1QGwXh+7swXilo4wNE=;
        b=YEDv+2UEyYljn4N9NH63FleySurffBTO6GZM739whssaeiTsPf1NlmGsEsSKZnucw4
         SRUyBunr+ZSGfiI8YPI1q5+rtT78+H7nTPf2A1dpbn1leMpLsdqL9NYcWxXmtutuNhwN
         abhQbx6DYjvIJJXlWz/VXdmA5dfv0yI1MFL7Rp1z9UdPFNV4/Vl7ssPCmiS0+oFaOas9
         JWCbAsq7vGd+Vx1NhfNEGKVT5zt0GxPblsMXqf727UW/TT36h2Ni43+3vStbZJxS1aiu
         r9wKdPas5yFSe3xrA5HBRJ8UWL6Xv8aKEsJEtxNSFoKxJ/Z9Cph5CLx/jmqkiO0NNmNh
         08DQ==
X-Gm-Message-State: AOJu0YwUshCxNG4w/SVegKTpG0qAXc33yb41xYymfw9iqEDto2tw/hUr
	JFwXxRmANto6jk6yuuPqsudOrQ==
X-Google-Smtp-Source: AGHT+IHuAzW/pPPxCGL04jOEgbZm7KqKnU9xn7BXSLzQzVo0ZR2moNYaGphImjz9x3L1vE52LMDqRw==
X-Received: by 2002:a05:6512:3b2b:b0:4fe:1bca:d921 with SMTP id f43-20020a0565123b2b00b004fe1bcad921mr8573241lfv.21.1692704848653;
        Tue, 22 Aug 2023 04:47:28 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id o4-20020aa7d3c4000000b005255991c576sm7424753edr.66.2023.08.22.04.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 04:47:28 -0700 (PDT)
References: <20230711093303.1433770-1-aliceryhl@google.com>
 <20230711093303.1433770-3-aliceryhl@google.com>
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
 Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v3 2/9] rust: sync: add `Arc::{from_raw, into_raw}`
Date: Tue, 22 Aug 2023 13:46:56 +0200
In-reply-to: <20230711093303.1433770-3-aliceryhl@google.com>
Message-ID: <87r0nvs3hu.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Alice Ryhl <aliceryhl@google.com> writes:

> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> These methods can be used to turn an `Arc` into a raw pointer and back,
> in a way that preserves the metadata for fat pointers.
>
> This is done using the unstable ptr_metadata feature [1]. However, it
> could also be done using the unstable pointer_byte_offsets feature [2],
> which is likely to have a shorter path to stabilization than
> ptr_metadata.
>
> Link: https://github.com/rust-lang/rust/issues/81513 [1]
> Link: https://github.com/rust-lang/rust/issues/96283 [2]
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

