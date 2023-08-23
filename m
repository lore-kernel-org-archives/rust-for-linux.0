Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C1C8ED
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 16:10:07 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6981EE6E
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 09:10:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a1681fa868so704002666b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1692807004; x=1693411804;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=AvCyDnox4fbKDW7rNSjZG6/gL/syisPTe8ALd97uo+Q=;
        b=AMRCA5jQetEgbNYV7zkyPQEYLYr+i8pUdYZUEF4QON89eMWTb4UdIdYtj3uoFKba67
         LZXYSU0+KedMQZ5+JpEvVjTZsFdPlHKtnDeg26ENh2AvkV9sfqbuU+BPxfFxmx/kUdSH
         naknCJY4MAYa0aqSG74R4dvx6iHvj7VSUVgUpO2t/kuCwmxhLdcVLLL6k7xWHIDiI8im
         aqWBaOrsQ1k0QsvOYK7DjYvrkr7j3FS4zjb7rhXjJpVIbxKA+ahm9kgFjUbe8l1etZn4
         DaYsdfX/zC2jJLvApnGKQCAdgIqJ67AbybH9iIdjl8kC0gXT+ZCDJIhHKS8KDlH7uoPL
         mHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807004; x=1693411804;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvCyDnox4fbKDW7rNSjZG6/gL/syisPTe8ALd97uo+Q=;
        b=ar6kDQDwauD1FQqybQASh6huMGYvkd11i0/jXFiypSNmFnD25IU0wXpDtgaOZWnGZd
         bGu0nhj/ktqy5WEvaRLpvsHAD49j+joQPl7YjYz3583k9zhzZmWNtaomRvQDw9JkCh7p
         NJyYQdvzbrp+i27505oI4wnasIZTrr7h2tjs1c90iPe9OkqC7MR/SzvDXqCChDBoF8r9
         aWSRmJbZawwgmM2B/1l/k3bMIzCD9jWnVXOx3rQJHHzX6ew/ILxNp6I5W4bVCLJHd/yI
         7n1SdBrjSdiKzFcPZh3fdW+FdCG91g+9ZG4rm7ndTIN31AtGNrnJ/+05TEBv95shg7lx
         TqAQ==
X-Gm-Message-State: AOJu0Yw2WAYrdmAG2YdHzsRY1FmFkoNy0jgu4CkLibZ+wPcnEYH0SSTS
	NcG+XnDT8IQMATVGsf3b4FzBAA==
X-Google-Smtp-Source: AGHT+IHqKjdbXppHqxgenNeZYES7RnrdB3Ff8k7iiNuK7kgXftXUykFdhh/FJBhTWdlI5gR+XbKyNA==
X-Received: by 2002:a17:906:2d1:b0:991:d5ad:f1b1 with SMTP id 17-20020a17090602d100b00991d5adf1b1mr11989340ejk.47.1692807003799;
        Wed, 23 Aug 2023 09:10:03 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id o5-20020a1709064f8500b0099d45ed589csm9938111eju.125.2023.08.23.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:10:03 -0700 (PDT)
References: <87msyi406u.fsf@metaspace.dk>
 <20230823103458.243871-1-aliceryhl@google.com>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Alice Ryhl <aliceryhl@google.com>
Cc: alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
 wedsonaf@gmail.com
Subject: Re: [PATCH v1] rust: add improved version of
 `ForeignOwnable::borrow_mut`
Date: Wed, 23 Aug 2023 18:09:15 +0200
In-reply-to: <20230823103458.243871-1-aliceryhl@google.com>
Message-ID: <87a5uh4u5h.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Alice Ryhl <aliceryhl@google.com> writes:

> Andreas Hindborg <nmi@metaspace.dk> writes:
>>>> I am not sure this makes sense. How about splitting the trait in two,
>>>> immutable and mutable and only implementing the immutable one or Arc?
>>>
>>> I used this design based on what would make sense for a linked list. The
>>> idea is that we can have two different types of cursors for a linked
>>> list: immutable and mutable. The immutable cursor lets you:
>>>
>>>  * move around the linked list
>>>  * access the values using `borrow`
>>>
>>> The mutable cursor lets you:
>>>
>>>  * move around the linked list
>>>  * delete or add items to the list
>>>  * access the values using `borrow_mut`
>>>
>>> The mutable cursor gives you extra abilities beyond the `borrow` vs
>>> `borrow_mut` distinction, so we want to provide both types of cursors
>>> even if the pointer type is Arc. To do that, we need a trait that
>>> defines what it means to have mutable access to an Arc.
>> 
>> I don't see how that prevents this trait from being split in two?
>
> Well, you could split the trait, but if you make the mutable iterator
> require the `borrow_mut` trait, then you have to implement the mutable
> trait for `Arc` too if you want the mutable iterator to work with `Arc`.
>
> And if you're always going to implement both traits, then maybe it
> makes more sense to not split the traits?

Maybe. Do you have a prototype for the list cursor available?

BR Andreas

