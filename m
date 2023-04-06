Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32326C7618D
	for <rust-for-linux@archiver.kernel.org>; Thu,  6 Apr 2023 11:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjDFLWJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 6 Apr 2023 07:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236669AbjDFLWI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 6 Apr 2023 07:22:08 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B660A8688
        for <rust-for-linux@vger.kernel.org>; Thu,  6 Apr 2023 04:22:06 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id g16so6646395iom.11
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Apr 2023 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680780126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QwWZXY+TxuCVvQw9ER2qw2mWXQ6bYR1k+mishI1l8Ss=;
        b=RlX/Lik6GGvAOPVCqjVn1pOFGgcDXsPn5yrZ2ndXAB5RBLZT1xBeGkkcvXGfzOMVly
         UZcRepZbWPcqunSFc3X1orce1AF/i/vuZimB/u7uHDGsjQfAA3MLFPbPxMMdqEDTYKXM
         6Y1a7oaa+yAP2DYpX/9IIPFNke0oJPm7+hVhu5ZV7l7t6H6vey0WAtxp/DAQsYuEiAMS
         Dg7eIfAMyzOZDfgoTjgnLux2YkCZWilcxBty+/5YRO7LfVzuvTUTpw7amD9zd3M5m1Ye
         Wk94sz6vBN1uYgKlWhicdrjVAZQHpaDQW7R6wV2nbdepbxFQ7qbe1CcW4Anq7QMPVr1t
         V7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680780126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwWZXY+TxuCVvQw9ER2qw2mWXQ6bYR1k+mishI1l8Ss=;
        b=0PAdu1FT5kjRN7Rp4Ny+K9xRLaj22pDb4IiSK3PWpoksJ5IRMKl7tWEKFeCq31Inp2
         lAfcRUfqN4HdaTY4szOJY3aPgN7cViws3XfDX7cW/V2SJ7W/zTG2PRCueLxEcdvjnDJj
         RssLU+8hILvEbeAk41owzW5vYSXNGqoq0DbzbtSclPbmmXDndAtVc16yxKTyaSESOHsC
         hGdbFX+GEIPEVL4t9asdHp0Z2IoJ0EaZq6omy+vUomDi5cCY+1Sc6YvQTdQpfRusQdsO
         MVlhPpkvbt5EbUak4E2zQB5KGL35VgHFFzW1kBqrM+UDtKpecZN7tBCcJEYt7FMWtC1L
         quWA==
X-Gm-Message-State: AAQBX9ccWrTTs6CuBx+4hU7Q9R3k8XxzPHAJY44QFri0PlLaoaS3GjoP
        Ck5ZhmO5QdAxAYif1nuFq7eGZo4wABCChKsbGEJqokMvO6TkWVw3UR4=
X-Google-Smtp-Source: AKy350Zvmnq8gmH5AW1nwTXvMA2qCTMjIU5URKpyHQ1wLmhJiwJr0e6/NwgwyfdU2AqPU3ZP7BMkI/Ypj0L2kD1huNo=
X-Received: by 2002:a6b:7803:0:b0:71b:5cd7:fcd9 with SMTP id
 j3-20020a6b7803000000b0071b5cd7fcd9mr6538150iom.20.1680780125984; Thu, 06 Apr
 2023 04:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230405175111.5974-1-wedsonaf@gmail.com> <20230405175111.5974-3-wedsonaf@gmail.com>
 <2023040554-promoter-chevron-10b2@gregkh> <2023040509-tamer-clinic-c14c@gregkh>
 <20230405191826.GA365912@hirez.programming.kicks-ass.net> <ZC3YWLmIick4jSSv@wedsonaf-dev>
 <20230405202932.GG365912@hirez.programming.kicks-ass.net> <ZC3cxzpnrnXf/osU@wedsonaf-dev>
 <20230405204942.GH365912@hirez.programming.kicks-ass.net> <f9573e45c6a14644abc6fcd4d3c98897@AcuMS.aculab.com>
In-Reply-To: <f9573e45c6a14644abc6fcd4d3c98897@AcuMS.aculab.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 6 Apr 2023 13:21:28 +0200
Message-ID: <CANpmjNPrREVGC3Az0T7k_2yr1PJp+E4yURUGUnu9Jb_CShJNHw@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] rust: lock: introduce `Mutex`
To:     David Laight <David.Laight@aculab.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 6 Apr 2023 at 10:38, David Laight <David.Laight@aculab.com> wrote:
>
> From: Peter Zijlstra
> > Sent: 05 April 2023 21:50
> >
> > On Wed, Apr 05, 2023 at 05:40:39PM -0300, Wedson Almeida Filho wrote:
> ...
> > > So the situation is improved in that we don't need to manually write (and
> > > commit) the helpers. It may improve further in the future if we get better
> > > integration of the languages.
> >
> > But yeah, feel free to convert macros to inline functions where the
> > difference is moot. There is indeed no real reason for mutex_lock() to
> > not be an inline function in that case.
>
> mutex_lock() is probably ok.
> But there are cases where gcc generates much better code
> for #defines than for inline functions.
> Almost certainly because the front end gets to optimise
> #defines, but inlines are done much later on.

For macro to inline function conversions, the most conservative option
would be __always_inline. We've also seen things go wrong with
"inline" only paired with various kinds of instrumentation.

Can bindgen deal with "static __always_inline" functions?
