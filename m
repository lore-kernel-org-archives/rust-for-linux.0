Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1D0C77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 May 2023 22:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjEQWWZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 May 2023 18:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjEQWWY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 May 2023 18:22:24 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B725246
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 15:22:23 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-50bc46a14e8so1313533a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684362141; x=1686954141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCQ3NjxZoebSIAtGeHR5p1IA6stp8bUJIlG4AwU4skw=;
        b=4vgsoY+5jg02OmnaPeEWdmac9MQv5QgavqYYTecATI2iI4NboNWkxSh2nzbpk0VLCQ
         1P2DkeGOfUT2Qp1xK7LPXfGpmW0RrVlmiRL59/wUEXcyiBT/N/6NWTeQk+lyuGlbeKoc
         P0Kt5+RNnAgHuUe8PxnnlnmAoSdBMcdFPEywkmBUKz61dRhfUK1efGsDLggM0K2E3sPw
         5egtqGedMvFnjHxzdyzRXcKon5hhGc7ajk4WplTzQvh6KqLqmnPgShi/AU9TqabaWiUE
         5TSBzXNr6sg8rs0q4jDdHXHYfA+lQ6I/aq25oRpOlqjYLO5UQJrgUEIrFSNBxA8nmTkN
         tfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684362141; x=1686954141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCQ3NjxZoebSIAtGeHR5p1IA6stp8bUJIlG4AwU4skw=;
        b=VJo+Nlj8j0giIv1dnJ4XJhBZ+E3BLtOVpB/rSLFsJlFS2GKvPpkIy7pSam6MiI5oM6
         ktvpdNxO/4JGOPGX9DljaajcPC/IRy3U/kOvCgYb/RYUuYK+skglyg02zXc0gFHXS7Zv
         PRcEwbmAEiYnXfHAUGuzMUg++2j3p1K5MkESc/8LaOXizJZgkqqhjrFNysBMpea45liS
         fxkxnp8jMwJjdFiJrpdDx1QHrb2y00yKsYEq1EnBVgeF46NngY7qEdlP3v9x7zbaXnn3
         kYiZRwPs0ljKtv7kvKzGxIBOf6I1XCXzxnz9QgOMBLxu9EoK7JcQpXbyuuFcFyCE6Uwq
         5AoQ==
X-Gm-Message-State: AC+VfDzbeJEHlMCH0avOruvdevi+14NAZKjmtJjQEvFbzFqcJefPCHg8
        0sxYBNhJ3XqhU9Eza5GTo56D6RfmYLq2j5A=
X-Google-Smtp-Source: ACHHUZ4ZH2KINwV3iFH0MzY+AxxyQSTIb3TM0RL+58yOgF2J8k82d22mDFv8B5Y8f2a6F3opNfUG8p8xYlA9gss=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:d09d:0:b0:504:8731:4ef2 with SMTP id
 v29-20020a50d09d000000b0050487314ef2mr1612484edd.7.1684362141496; Wed, 17 May
 2023 15:22:21 -0700 (PDT)
Date:   Wed, 17 May 2023 22:22:19 +0000
In-Reply-To: <ZGVLo1V4kjx_lep5@slm.duckdns.org>
Mime-Version: 1.0
References: <ZGVLo1V4kjx_lep5@slm.duckdns.org>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230517222219.3191560-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 0/7] Bindings for the workqueue
From:   Alice Ryhl <aliceryhl@google.com>
To:     tj@kernel.org
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, jiangshanlai@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 17 May 2023 11:48:19 -1000, Tejun Heo wrote:
> I tried to read the patches but am too dumb to understand much.

The patch is more complicated than I would have liked, unfortunately.
However, as I mentioned in the cover letter, simplifications should be
on their way.

Luckily, using the workqueue bindings is simpler than the bindings
themselves.

> Any chance you can provide some examples so that I can at least
> imagine how workqueue would be used from rust side?

Yes, of course!

The simplest way to use the workqueue is to use the `try_spawn` method
introduced by the last patch in the series. With this function, you just
pass a function pointer to the `try_spawn` method, and it schedules the
function for execution. Unfortunately this allocates memory, making it
a fallible operation.

To avoid allocation memory, we do something else. As an example, we can
look at the Rust binder driver that I am currently working on. Here is
how it will be used in the binder driver: First, the `Process` struct
will be given a `work_struct` field:

#[pin_data]
pub(crate) struct Process {
    // Work node for deferred work item.
    #[pin]
    defer_work: Work<Arc<Process>>,

    // Other fields follow...
}

Here, we use the type `Work<Arc<Process>>` for our field. This type is
the Rust wrapper for `work_struct`. The generic parameter to `Work`
should be the pointer type used to access `Process`, and in this case it
is `Arc<Process>`. The pointer type `Arc` is used for reference
counting, and its a pointer type that owns a ref-count to the inner
value. (So e.g., it decrements the ref-cout when the arc goes out of
scope.) Arc is an abbreviation of "atomic reference count". This means
that while it is enqueued in the workqueue, the workqueue owns a
ref-count to the process.

Next, binder will use the `impl_has_work!` macro to declare that it
wants to use `defer_work` as its `work_struct` field. That looks like
this:

kernel::impl_has_work! {
    impl HasWork<Arc<Process>> for Process { self.defer_work }
}

To define the code that should run when the work item is executed on the
workqueue, binder does the following:

impl workqueue::ArcWorkItem for Process {
    fn run(self: Arc<Process>) {
        // this runs when the work item is executed
    }
}

Finally to schedule it to the system workqueue, it does the following:

let _ = workqueue::system().enqueue(process);

Here, the `enqueue` call is fallible, since it might fail if the process
has already been enqueued to a work queue. However, binder just uses
`let _ =` to ignore the failure, since it doesn't need to do anything
special in that case.

I hope that helps, and let me know if you have any further questions.

Alice
