Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9012B70
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 10:01:37 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC6B97
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 03:01:34 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59ee66806d7so151417497b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695722494; x=1696327294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PSjOVj3NEZLcZiR/Ha2dwc9eHr7RbUTNTjvX8TFLRcY=;
        b=nWSZO9q4u/q4IPDeRiji0HqLaHHPRM3kcMAkUSYERcswAMLYk0Abw+ivGlrsM9UCAm
         vr6+1ivoZ8r9z7WpBsLkVJtMZYS0tKVrUFgM4XYMvDfHbIQYLgPs/Gv0RfyJsywvxxrz
         XvbMlcvow/goO825R3+5SVuaeswEfStLGcU7A7UDvhs63XLxgkH9awU3BK1pnHsrYaPa
         ne2BuxxdGbi4agqR7kQb/XPB8qcK6dbelk6C2+NKJc+BBnefzQTVN76wCXy3Vbo/DPHN
         w/iQ0UhB0A3vJy9/abYbrE/umXM2aueFLzu2mH6KtkVyrcJgs/Ox90mutoEEPqooT6uN
         n7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695722494; x=1696327294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSjOVj3NEZLcZiR/Ha2dwc9eHr7RbUTNTjvX8TFLRcY=;
        b=TuMAMd+6mXb6kRZP/+Z3VmGBZ/ex2eB6zUIM24yRSXrNe0wS9Cx9wB4BOiJ9dEywDX
         utg+GWNXt4HrLREpGXGj9sZDChbauOeNqHMBlVNllBp8yyPLkY/UQw9puo+IfoE9zMlu
         c9He2rP14qrDqqAKdlpjzi63CQRnjtyivz6y5tlWan0el+TVghm6s/dH5quiP1J0XKZg
         +9XOD4AY4bRNi2+O1GpmQNH/XWnl/F/Axd1TfFoYa2GSMAKbemjZXxRc1kLaSEsUQ/8q
         YuakcI9icPYZa/n/MQIZZKrzZ0PYC7Px1tlVLpVg9hL0ISYJ/Vk2GHYMUg16ut7Ke0A8
         42IQ==
X-Gm-Message-State: AOJu0YzE1f5/SN5H7SknVpXKB/v4yyF4+D5drbKH412ZJMJDpA1IfVs/
	cWZGSR0PcgWEaSLf8YmjQIRGQH2jHcjhfeI=
X-Google-Smtp-Source: AGHT+IENb6kAQt3SlryXf26yUjvt3kHMvyFyfMBdt8l5kkIskKFOxg0e0rnYFWlj/Hfa6u+U/vGJjT4sf4b0An8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:9c44:0:b0:d80:16bc:4e41 with SMTP id
 x4-20020a259c44000000b00d8016bc4e41mr91493ybo.0.1695722493787; Tue, 26 Sep
 2023 03:01:33 -0700 (PDT)
Date: Tue, 26 Sep 2023 10:01:30 +0000
In-Reply-To: <ESFnxZLcZD-JbNp5PHtrjAdophrPm9gOJR1C5kwsvw6errySiqsG7zbs-0bKWKGrq3Phz7-of0M1znwoTNYAZATTHBhUaFehe5bHP1YksCw=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ESFnxZLcZD-JbNp5PHtrjAdophrPm9gOJR1C5kwsvw6errySiqsG7zbs-0bKWKGrq3Phz7-of0M1znwoTNYAZATTHBhUaFehe5bHP1YksCw=@proton.me>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230926100130.2213190-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 4/7] rust: workqueue: add helper for defining
 work_struct fields
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, jiangshanlai@gmail.com, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, patches@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

>> +impl<T: ?Sized, const ID: u64> Work<T, ID> {
>> +    /// Creates a new instance of [`Work`].
>> +    #[inline]
>> +    #[allow(clippy::new_ret_no_self)]
>> +    pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self>
>> +    where
>> +        T: WorkItem<ID>,
>> +    {
>> +        // SAFETY: The `WorkItemPointer` implementation promises that `run` can be used as the work
>> +        // item function.
>> +        unsafe {
>> +            kernel::init::pin_init_from_closure(move |slot| {
>> +                let slot = Self::raw_get(slot);
>> +                bindings::init_work_with_key(
>> +                    slot,
>> +                    Some(T::Pointer::run),
>> +                    false,
>> +                    name.as_char_ptr(),
>> +                    key.as_ptr(),
>> +                );
>> +                Ok(())
>> +            })
>> +        }
> 
> I would suggest this instead:
> ```
>         pin_init!(Self {
>             // SAFETY: The `WorkItemPointer` implementation promises that `run` can be used as the
>             // work item function.
>             work <- Opaque::ffi_init(|slot| unsafe {
>                 bindings::init_work_with_key(
>                     slot,
>                     Some(T::Pointer::run),
>                     false,
>                     name.as_char_ptr(),
>                     key.as_ptr(),
>                 )
>             }),
>             _inner: PhantomData,
>         })
> ```

I tried setting up a patch with a few nits fixed, including this one.
However, I ran into an error when adding #[pin_data] to the Work struct:

error: defaults for const parameters are only allowed in `struct`, `enum`, `type`, or `trait` definitions
   --> rust/kernel/workqueue.rs:192:28
    |
192 | pub struct Work<T: ?Sized, const ID: u64 = 0> {
    |                            ^^^^^^^^^^^^^^^^^

This nit can be fixed when #[pin_data] is updated to support default
values in struct declarations.

Alice
