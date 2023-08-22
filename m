Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75B20180
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 20:00:12 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F80BE59
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 13:00:05 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52580a24128so6053476a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1692734404; x=1693339204;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=VQPiQZ6BlJOv7UycB/t5qmClTXP5K+iValXtnswktQs=;
        b=5AbdSdkYjnfTbyoG7sib2fsqmj2YT2PB5W+NnY4Wy3h+idmTWESXtLL1KpSW3N/LzQ
         GLC0gBBTzJPxBJw/BpZsQpLuBDfaEaMrMmLFDld8ogUUPQQ1dAZCzUMDJyUsy5pJKoo2
         X+nu/5+p4XDL4LZdgZMdhGaAN5hr78qEgvnhKAe7QnD6ugwIyCQtPCbeHo/aVwnvepc+
         5PKRPI1AlFZllH2xCAAXFPWVWPVoJuhNpnWc6ktEn6MqNbquOe4WE1huWuep+XU8jLo5
         xAhexY1MJZsrKLfdWl3Osby2nEWEAeDwhiuBo69NSmSnRA4rQhl6NSCx3jGtoSGsLNdk
         P4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734404; x=1693339204;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQPiQZ6BlJOv7UycB/t5qmClTXP5K+iValXtnswktQs=;
        b=h7WR4BSqIE7NU1se0EeVHbF6UkCyXc8nFO7Jsjw4Wpqccp9Ym6BEZa5Rx69Fn5sXGb
         Z1Z19Zj2YlS8rNzCEYxuatF8wGDsV8Io7x2z/XUX3yAS7aKx6dhO7uYfjbDmAWZgBbo7
         lcsWciz2lXPoCFb/mBwCqCmYzcA85s2r+G6d4fLATdLxgWMqYkkZWFzLg/eFc51SN+Te
         uQgYOIp453EwSWaY/rlm891dLz9YHSalIzuKJ1asfQdEDSJ8h9/5vgqFg5FGm7CaeXuP
         jyCAhG0ZoWxU3uI9sPoMItx8qCT/bkfn8bN+X3GEEaPVnsWEfc24uT+frRx5RLBxN90Q
         Musg==
X-Gm-Message-State: AOJu0Yx4EhCAh66bnTG1zfB9OLQvErSE5RAVm+QaeznBtxaOnC7EaVaZ
	YqOwL8w6cXeiPWsH+tI9wE4Bvg==
X-Google-Smtp-Source: AGHT+IFHLrhCAVS3UUkP4BRO47OZWi9RZND4hbjpqPTY2IH1ZUPKw/kPeFybw/EFizKVVVn+EHwWTA==
X-Received: by 2002:a17:906:196:b0:99c:ad52:b06 with SMTP id 22-20020a170906019600b0099cad520b06mr9339048ejb.10.1692734403511;
        Tue, 22 Aug 2023 13:00:03 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id lf26-20020a170907175a00b0098733a40bb7sm8664881ejc.155.2023.08.22.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:00:03 -0700 (PDT)
References: <20230711093303.1433770-1-aliceryhl@google.com>
 <20230711093303.1433770-7-aliceryhl@google.com>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v3 6/9] rust: workqueue: add helper for defining
 work_struct fields
Date: Tue, 22 Aug 2023 21:59:31 +0200
In-reply-to: <20230711093303.1433770-7-aliceryhl@google.com>
Message-ID: <87il96sv9b.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Alice Ryhl <aliceryhl@google.com> writes:

> The main challenge with defining `work_struct` fields is making sure
> that the function pointer stored in the `work_struct` is appropriate for
> the work item type it is embedded in. It needs to know the offset of the
> `work_struct` field being used (even if there are several!) so that it
> can do a `container_of`, and it needs to know the type of the work item
> so that it can call into the right user-provided code. All of this needs
> to happen in a way that provides a safe API to the user, so that users
> of the workqueue cannot mix up the function pointers.
>
> There are three important pieces that are relevant when doing this:
>
>  * The pointer type.
>  * The work item struct. This is what the pointer points at.
>  * The `work_struct` field. This is a field of the work item struct.
>
> This patch introduces a separate trait for each piece. The pointer type
> is given a `WorkItemPointer` trait, which pointer types need to
> implement to be usable with the workqueue. This trait will be
> implemented for `Arc` and `Box` in a later patch in this patchset.
> Implementing this trait is unsafe because this is where the
> `container_of` operation happens, but user-code will not need to
> implement it themselves.
>
> The work item struct should then implement the `WorkItem` trait. This
> trait is where user-code specifies what they want to happen when a work
> item is executed. It also specifies what the correct pointer type is.
>
> Finally, to make the work item struct know the offset of its
> `work_struct` field, we use a trait called `HasWork<T, ID>`. If a type
> implements this trait, then the type declares that, at the given offset,
> there is a field of type `Work<T, ID>`. The trait is marked unsafe
> because the OFFSET constant must be correct, but we provide an
> `impl_has_work!` macro that can safely implement `HasWork<T>` on a type.
> The macro expands to something that only compiles if the specified field
> really has the type `Work<T>`. It is used like this:
>
> ```
> struct MyWorkItem {
>     work_field: Work<MyWorkItem, 1>,
> }
>
> impl_has_work! {
>     impl HasWork<MyWorkItem, 1> for MyWorkItem { self.work_field }
> }
> ```
>
> Note that since the `Work` type is annotated with an id, you can have
> several `work_struct` fields by using a different id for each one.
>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>


