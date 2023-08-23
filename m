Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310FCA934
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 09:14:59 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489892680
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 02:14:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fed963273cso27255625e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Aug 2023 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1692782094; x=1693386894;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=qiZlM8QEOpDTpRFMe/2/zEZ6wsyKpsV1KUA2VGwkVqc=;
        b=TZmuqPNeD3vmbShzj7gSb9+WRe+VS3qWdT9gRNdlIP9KZZgdfonNFTcwLwx5mRJt4q
         ZN6MwyNgTnqxerFqVS838PDSa9SZahDI+0GrYqHbmOOI0lS1z9cmYY8xV/NJtu+8RZJo
         6tQuut33WKBdRXsVpKVyM69X8LCHU2KjK3uJqfZjXbMlenzYj+FYyfvMDqZA33cydqgy
         XTmSgGZeHwVcHBM5nX+9NbJetLEwqVrJOHnKcl3ZIwQavAH4RDuNakYzvfwbxEhH8/ET
         ebPNY+1w72xFkKQFbxQILYIPWjBdxqGfbMHKXsQ+VYtIjpovbaEVa3H62hZEtJ8g71KQ
         g0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692782094; x=1693386894;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiZlM8QEOpDTpRFMe/2/zEZ6wsyKpsV1KUA2VGwkVqc=;
        b=at01E/RknOmNJd6SbGC6HPS0vKZ/YoZDof6NPYxHC0yV3GtUruGDctLhNfpxo3RW23
         UqJ1ROw8JoRdbNv3CDSKFic31p+HnBZMIkTelQeeZft6LDW0mhoeneMbx7iA0ATHdUli
         NjpVDgYTnZZmeTRxcm8KVny27UbHsyTB/yFa0fgqMV8cHdfpMg/T4gxSzmPNapqzcKep
         JP/U5WgR4GuxA1DjQCnRUZ+O6lyv5PSP2m7m4MNoS7xUr333nn5y/3kEC+bm2llk1y9r
         8upd+q90yYTewH5X7b9tpr6DcGRWDXRwCUYSi17q1z6hxCHPOemFAcgNzhz6DZCCXo4H
         REBQ==
X-Gm-Message-State: AOJu0Yxcthr0hlC76+zBQNyPB5Jz5io4GI20PLbYkHU20ChurrKzm0n3
	dLfVaPlj7vyoFIeE2Nlz/zWp4w==
X-Google-Smtp-Source: AGHT+IGmx49TcZyNIesZ0Y8hEQR3pLmQeKegxY8NL7lzkFIt1BTGvLiiowVfWMRULj4No2sYruY+WA==
X-Received: by 2002:a05:600c:3007:b0:3fa:91d0:8ddb with SMTP id j7-20020a05600c300700b003fa91d08ddbmr9556489wmh.14.1692782093753;
        Wed, 23 Aug 2023 02:14:53 -0700 (PDT)
Received: from localhost ([165.225.194.205])
        by smtp.gmail.com with ESMTPSA id n22-20020a1c7216000000b003fefe70ec9csm2536983wmc.10.2023.08.23.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 02:14:53 -0700 (PDT)
References: <20230711093303.1433770-1-aliceryhl@google.com>
 <20230711093303.1433770-7-aliceryhl@google.com>
 <vyrVN334oIXneb9VWievGpPTOCy0irxvoG-mDR0sQX5-xN-TL2Hngl0cl_XrVUwjDB3rXkXfR9Mdjy_no6fzhe4yIf_c7xpKa5OURt43k9c=@proton.me>
 <87msyisvmi.fsf@metaspace.dk>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, Tejun
  Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex
  Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
  Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v3 6/9] rust: workqueue: add helper for defining
 work_struct fields
Date: Wed, 23 Aug 2023 11:06:37 +0200
In-reply-to: <87msyisvmi.fsf@metaspace.dk>
Message-ID: <87il963ysz.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


"Andreas Hindborg (Samsung)" <nmi@metaspace.dk> writes:

> Hi Benno,
>
> Benno Lossin <benno.lossin@proton.me> writes:
>
> ...
>
>>> +/// Links for a work item.
>>> +///
>>> +/// This struct contains a function pointer to the `run` function from the [`WorkItemPointer`]
>>> +/// trait, and defines the linked list pointers necessary to enqueue a work item in a workqueue.
>>> +///
>>> +/// Wraps the kernel's C `struct work_struct`.
>>> +///
>>> +/// This is a helper type used to associate a `work_struct` with the [`WorkItem`] that uses it.
>>> +#[repr(transparent)]
>>> +pub struct Work<T: ?Sized, const ID: u64 = 0> {
>>> +    work: Opaque<bindings::work_struct>,
>>> +    _inner: PhantomData<T>,
>>
>> Should this really be `PhantomData<T>`? Are you dropping `T`s in the 
>> destructor of `Work<T>`? I do not think so `PhantomData<fn() -> Box<T>>`
>> should do the trick.
>>
>
> Could you elaborate what is the issue in having `PhantomData<T>`?

I played around with this and as far as I can tell, using
`PhantomData<fn() -> Box<T>>` does not disable dropck for T. Thus,
`PhantomData<T>` has the same effect as `PhantomData<fn() -> Box<T>`,
which is covariance over T and dropck:

```rust
use std::marker::PhantomData;

struct A<T> {
    _marker: PhantomData<fn() -> Box<T>>,
}

//#[cfg(disable)]
impl<T> Drop for A<T> {
    fn drop(&mut self) {
        todo!()
    }
}

struct B {}

fn main() {
    let (_a, b);
    b = B {};
    _a = foo(&b);
}

fn foo<'a>(_b: &'a B) -> A<&'a B> {
    let a: A<&'a B> = A {
        _marker: PhantomData,
    };
    a
}
```

This is a little surprising to me since nomicon [1] explicitly marks
`PhantomData<T>` as "covariant (with drop check)" but only "covariant"
for `PhantomData<fn() -> T>`.

Not sure why you wanted the box?

Best regards,
Andreas


[1] https://doc.rust-lang.org/nomicon/phantom-data.html#table-of-phantomdata-patterns
