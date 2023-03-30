Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5BCC6FD1D
	for <rust-for-linux@archiver.kernel.org>; Thu, 30 Mar 2023 14:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjC3OSH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 30 Mar 2023 10:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjC3ORx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 30 Mar 2023 10:17:53 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB9BD312
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Mar 2023 07:17:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l37so11019815wms.2
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Mar 2023 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680185834;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=V3w4/MoUcTVEnZSoDDuIRGwZ4uXMTJFYF6lNB23fCPk=;
        b=jZto7yzee4mHExZhJYL8EBHaZ6kim1/ImNBRIxf6WnHEB/vfwpDG8HHF19HwOgGoFk
         Unpwei39GNh2Cck7ne7iQyiMONqo2bhkqe7txxOMh38OBbcpgPs3nEBWiPrVZR4Uvpqq
         1MUkJQQA/IjSoweErLKrTPAS6o9lBl0NVyP9QkjRYseuJiMakuYSwt0pf90ZZWu6N8oq
         HhfYUat9G5hFKKTQo2hxzAYW6IkZr37fG8DzCSCeuUxPxkd5Lzyd4PcpmOQ9HtYYvilE
         8q5Hi/KSH14T1siemr7507LrIZgmOEfVz9aw80Pc5tmt8Sg3bbGMsM69cK5MGowQabF6
         UCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185834;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3w4/MoUcTVEnZSoDDuIRGwZ4uXMTJFYF6lNB23fCPk=;
        b=dOzweDQ6dM7uUnF1K2a9/fzS6qtwQvXQ0jWZJeSDwgIT8f/aafMXSgwvnPlQDThKed
         yhgK4+2F4428tIUAtIGl2YDKPUVWsilUS+bV1YxxoX4qm/j7ncosX2NBxdduSycxr3kU
         hXTPXAWPKczxknhlxfc807AuUesIw933DYkrCHGd4UMuxC6wVvss1Fi9s7tEeZr3Sdm+
         58vIMUWaNkVqYgAFWD3y9IUOqRVV+EC7TItbUS3Lh6P6efvzgjAvCQdzdFY5/g72qw0n
         Xs7IMZIWVAromXnAfdJQ4WXAszur7hqoQAXd+D9nAtf8rGpfK57akQk42kf7Bt+6xQmx
         CyBg==
X-Gm-Message-State: AAQBX9f9ooZMuZjboe6T+791KE/0AgJOXPtXt4fMAla6WOqjr5GKAGl8
        LxorKcG/Qs6wJjx7xLB1IYjqyg==
X-Google-Smtp-Source: AKy350bUobZJlvGg3INFY05R6/8uEgvZI6Llp4W7q1vO27xygsDmmZw61af5XrgjBmoSBx3Cv1ghcA==
X-Received: by 2002:a05:600c:4591:b0:3f0:3070:f4ea with SMTP id r17-20020a05600c459100b003f03070f4eamr3689550wmo.11.1680185834017;
        Thu, 30 Mar 2023 07:17:14 -0700 (PDT)
Received: from localhost ([147.161.155.82])
        by smtp.gmail.com with ESMTPSA id o39-20020a05600c512700b003edddae1068sm6455975wms.9.2023.03.30.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:17:13 -0700 (PDT)
References: <20230329223239.138757-1-y86-dev@protonmail.com>
 <20230329223239.138757-5-y86-dev@protonmail.com>
 <ce17f68e-521f-f55e-8ae2-35bcd6ebd709@ryhl.io>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Alice Ryhl <alice@ryhl.io>
Cc:     y86-dev@protonmail.com, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v3 04/13] rust: add pin-init API core
Date:   Thu, 30 Mar 2023 16:16:31 +0200
In-reply-to: <ce17f68e-521f-f55e-8ae2-35bcd6ebd709@ryhl.io>
Message-ID: <878rfe493r.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <alice@ryhl.io> writes:

> On 3/30/23 00:33, y86-dev@protonmail.com wrote:
>> From: Benno Lossin <y86-dev@protonmail.com>
>> This API is used to facilitate safe pinned initialization of structs. It
>> replaces cumbersome `unsafe` manual initialization with elegant safe macro
>> invocations.
>> Due to the size of this change it has been split into six commits:
>> 1. This commit introducing the basic public interface: traits and
>>     functions to represent and create initializers.
>> 2. Adds the `#[pin_data]`, `pin_init!`, `try_pin_init!`, `init!` and
>>     `try_init!` macros along with their internal types.
>> 3. Adds the `InPlaceInit` trait that allows using an initializer to create
>>     an object inside of a `Box<T>` and other smart pointers.
>> 4. Adds the `PinnedDrop` trait and adds macro support for it in
>>     the `#[pin_data]` macro.
>> 5. Adds the `stack_pin_init!` macro allowing to pin-initialize a struct on
>>     the stack.
>> 6. Adds the `Zeroable` trait and `init::zeroed` function to initialize
>>     types that have `0x00` in all bytes as a valid bit pattern.
>> Co-developed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
>> +//! Aside from pinned initialization, this API also supports in-place construction without pinning,
>> +//! the marcos/types/functions are generally named like the pinned variants without the `pin`
>> +//! prefix.
>
> Typo: Should be "macros".
>
>> +type Invariant<T> = PhantomData<fn(*mut T) -> *mut T>;
>
> I think it would make sense to include a link to the nomicon on the
> documentation for the Invariant type.
>
> E.g. this link: https://doc.rust-lang.org/nomicon/subtyping.html

That would be nice. I think this also applies: https://doc.rust-lang.org/nomicon/phantom-data.html#table-of-phantomdata-patterns

>
>> +// This is the module-internal type implementing `PinInit` and `Init`. It is unsafe to create this
>> +// type, since the closure needs to fulfill the same safety requirement as the
>> +// `__pinned_init`/`__init` functions.
>> +struct InitClosure<F, T: ?Sized, E>(F, Invariant<(E, T)>);
>
> Documentation for a type should use /// rather than //.
>
> I think it would help to call out explicitly in the documentation on this type
> that it is an implementation detail of the pin_init_from_closure and
> init_from_closure methods.

