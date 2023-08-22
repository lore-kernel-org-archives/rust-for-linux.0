Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773220189
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 19:52:12 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98716CCB
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 12:52:10 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a069edca6so3571226a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Aug 2023 12:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1692733929; x=1693338729;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=8rgEdoTOAdm60cwf4SttnTE5XQ2a7mDmyn58eCgJqMM=;
        b=AL2vd6ZYVb+rHSzEIpdrY9JUYph0K6Y9attv4GTebIus4ywA1Azleve9/Pnw3KK1sy
         zT5z6NtZbKwMa0g0cazMAvsDvkbNq11pn7rTYj+RrzyhgUamA0pS8sbZzw5Sde6rBUZb
         gUc9cMUqSOcSKEveiYiM2GNIlxIAGDTyJ79VlfAjsg3hZuO02kStGu4D5SWI7r9Q3u7B
         /8vRBxHwY8Ubo4RilruQUtIzWq+KtoiuFjfMqVAAnVFn2C5Bw0DGB66knnVeuqv3sR9J
         pjJBpC1h0Yw8lqP1V/wgtc08pImAbASzZ8+UWACc24oK0GYRva2/Wr+TSi34ouaHtAfa
         Zi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733929; x=1693338729;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rgEdoTOAdm60cwf4SttnTE5XQ2a7mDmyn58eCgJqMM=;
        b=RU2CKu2xlQPgNx0DwPebbYCAjTj8m8O/6H8/Nra+4LZZq/d9tlT03CwOa1XTe0Bftg
         mn2I6gaNi4k9LB47855iAIae+J34OoS+P+M0QMNBUVV9JeccipTTowORaFMw3R+ztj4j
         VPrRKIZCwjnMg6rW2LWIDkAw55hFKbRx1GapQPKmj2I7rBPOvKYZV72zZ26Chj/yAXaE
         wHH81AeeH6FjM8+Z3OoCoUZFcQcaScmMICcevHNFJ4PyvJuQ/bct827VbxgKYDbj+HCn
         f55Iy776rXDnSLskzqyrAJceuiQ16u5CbZfzzWIBWh5/VcywE+1pi64TdPuy6DS6KxhN
         Fspw==
X-Gm-Message-State: AOJu0YyL60Ar3GZr47IHR6saDNxPUbbpQhU9vnmMJA2wFPBawuRIl8Ug
	t6LBdybQOxp++7uet8yVGAloSw==
X-Google-Smtp-Source: AGHT+IE4wVIW18x3q1rp0TBbYP4cS1KkB0SFLU6Vc/NWR4Tkowt2qZGoQovU3XtLmgcLq2hSbP3e2w==
X-Received: by 2002:a17:907:2c59:b0:993:d7fe:7f1d with SMTP id hf25-20020a1709072c5900b00993d7fe7f1dmr8355338ejc.28.1692733928951;
        Tue, 22 Aug 2023 12:52:08 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id k12-20020a1709061c0c00b009a1a653770bsm2699886ejg.87.2023.08.22.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:52:08 -0700 (PDT)
References: <20230711093303.1433770-1-aliceryhl@google.com>
 <20230711093303.1433770-7-aliceryhl@google.com>
 <vyrVN334oIXneb9VWievGpPTOCy0irxvoG-mDR0sQX5-xN-TL2Hngl0cl_XrVUwjDB3rXkXfR9Mdjy_no6fzhe4yIf_c7xpKa5OURt43k9c=@proton.me>
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
Date: Tue, 22 Aug 2023 20:24:04 +0200
In-reply-to: <vyrVN334oIXneb9VWievGpPTOCy0irxvoG-mDR0sQX5-xN-TL2Hngl0cl_XrVUwjDB3rXkXfR9Mdjy_no6fzhe4yIf_c7xpKa5OURt43k9c=@proton.me>
Message-ID: <87msyisvmi.fsf@metaspace.dk>
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


Hi Benno,

Benno Lossin <benno.lossin@proton.me> writes:

...

>> +/// Links for a work item.
>> +///
>> +/// This struct contains a function pointer to the `run` function from the [`WorkItemPointer`]
>> +/// trait, and defines the linked list pointers necessary to enqueue a work item in a workqueue.
>> +///
>> +/// Wraps the kernel's C `struct work_struct`.
>> +///
>> +/// This is a helper type used to associate a `work_struct` with the [`WorkItem`] that uses it.
>> +#[repr(transparent)]
>> +pub struct Work<T: ?Sized, const ID: u64 = 0> {
>> +    work: Opaque<bindings::work_struct>,
>> +    _inner: PhantomData<T>,
>
> Should this really be `PhantomData<T>`? Are you dropping `T`s in the 
> destructor of `Work<T>`? I do not think so `PhantomData<fn() -> Box<T>>`
> should do the trick.
>

Could you elaborate what is the issue in having `PhantomData<T>`?

BR Andreas

