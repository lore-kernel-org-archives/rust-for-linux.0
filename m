Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F054C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 12:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbjEWMAH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 08:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236724AbjEWMAG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 08:00:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA47419B
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 04:59:59 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-510e90d785fso1210040a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1684843198; x=1687435198;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=BtyIsC3fOFjgjr9w9nc1ft0SzM61Czn4H/P3GjzNfK0=;
        b=bdm9uKxSj9wOh8IC4/CRZXk1vTYZPuOEBSXUGk5gfmyUqA04txmm/wMX2tbxYblfo/
         VgGFH28rswMT6qcXru0NTDMd968EfXKd0RfJdqHc/niQ8AwLwed+fZaXNUznLagqZbwg
         7tkhI27bpz4eiIwUfdiHFO7uQifd5MbaSz6e0ibXSTApTSa8NBTDHQJHgCUk2DVTyQI/
         Bhwvb2prpfZ4YmRqKJmCGC0JRIo/MNzR+lj4ezo0xkoA8HG7md65l3yse6l799w04aVm
         h2fzstPqo2J+mX+CjAoPnNAa3iTwdk9btrQ7CiKMUKWCHnTiA+7U7+ALOmn5KW3ty3Y2
         3ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843198; x=1687435198;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtyIsC3fOFjgjr9w9nc1ft0SzM61Czn4H/P3GjzNfK0=;
        b=B8QAjnBbViy7IF3SepqHD9UMxi8tErreQ0lmogoQnaE1eWfkMmlQ7t5gw3zpE6WMon
         vhS6HAkdwOgI5FUxXSzJkG1+pfezuxgBZgwbmLCY48LRy7k6yfZvVzGWRo3Ir2M3RIhs
         PL2PUZINCwTgdwN81V43SszuKMf3UdVBlXQ85zbVwws6THyg6Tn1Vu2orji4rlvb7rYg
         uPZusQHIDwIu5SWd3PZxEpII45FCOyhu8U2B0iz1ZTfJJKm5Pa4vSAX0Yk3DsLTGYpfX
         YXJhpFI0Nhxoz9L5GRC8ToZHSDZgPVcskLYb+6L9xP5/bICi01aTBYlFGWUvBb/9Dm1o
         u/WA==
X-Gm-Message-State: AC+VfDwYl7VaMAPldYlwB1mGVvyl4xN347ESxcigypDdVlcYXkfllYS4
        c0ORtVtghZU0EFe7eTZFQID8ZQ==
X-Google-Smtp-Source: ACHHUZ78ha/V35x6+xkN2GHd8k3K5a4kK220qp3eEHQVCjxYr6dtznddiQJKp5S0VuxPspRGsy9W9A==
X-Received: by 2002:a17:907:91cd:b0:96a:937c:5608 with SMTP id h13-20020a17090791cd00b0096a937c5608mr9052699ejz.53.1684843198168;
        Tue, 23 May 2023 04:59:58 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id h26-20020a17090634da00b0096f7e7d1566sm4318582ejb.224.2023.05.23.04.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:59:57 -0700 (PDT)
References: <20230517200814.3157916-1-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v1 1/2] rust: sync: add `Arc::ptr_eq`
Date:   Tue, 23 May 2023 13:54:19 +0200
In-reply-to: <20230517200814.3157916-1-aliceryhl@google.com>
Message-ID: <87353nfebm.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> Add a method for comparing whether two `Arc` pointers reference the same
> underlying object.
>
> This comparison can already be done by getting a reference to the inner
> values and comparing whether the references have the same address.
> However, writing `Arc::ptr_eq(a, b)` is generally less error-prone than
> doing the same check on the references, since you might otherwise
> accidentally compare the two `&Arc<T>` references instead, which wont
> work because those are pointers to pointers to the inner value, when you
> just want to compare the pointers to the inner value.
>
> Also, this method might optimize better because getting a reference to
> the inner value involves offsetting the pointer, which this method does
> not need to do.
>
> Co-developed-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

> ---
>  rust/kernel/sync/arc.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index e6d206242465..274febe3bb06 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -221,6 +221,11 @@ impl<T: ?Sized> Arc<T> {
>          // reference can be created.
>          unsafe { ArcBorrow::new(self.ptr) }
>      }
> +
> +    /// Compare whether two [`Arc`] pointers reference the same underlying object.
> +    pub fn ptr_eq(this: &Self, other: &Self) -> bool {
> +        core::ptr::eq(this.ptr.as_ptr(), other.ptr.as_ptr())
> +    }
>  }
>  
>  impl<T: 'static> ForeignOwnable for Arc<T> {
>
> base-commit: ac9a78681b921877518763ba0e89202254349d1b

