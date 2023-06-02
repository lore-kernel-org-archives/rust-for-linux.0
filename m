Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1CFC77B7A
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Jun 2023 14:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbjFBOr6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Jun 2023 10:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235311AbjFBOr6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Jun 2023 10:47:58 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FBF123
        for <rust-for-linux@vger.kernel.org>; Fri,  2 Jun 2023 07:47:56 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5147f5efeb5so3146703a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jun 2023 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1685717275; x=1688309275;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdxTAevbk4TrZwXy2RvR6ovA+aybdENi1veBE5Q3fDQ=;
        b=xQSX6nM0mw6zNL0oYQTsIQeZ+7Yu0xosRKBKsmzk3/ODQZN5Bnz7cavJU2RQql9GKX
         XRMipKfbLyctWZj117wp9cCWylc5DNbku1S+r/lF4tVzFEzGlwP9ALeaDFTH5ro9Pp9N
         urpPkvs/Quoko/hU6iDZeiaySRr7vYBSyG2rghh35Y0TUK78kH7eAdKa2oolImkGOycd
         Gsks1rsZACS4Y8zOwyfcmprKs3SadCYo4UM+srOb6colSgiJwemy05q5Iv7oB84emdwF
         MRMVQfyjzukWKAEvywY5sHBXIe3NfO8CbInjCJ8+NDsRBeIQV7fyuOtQcTYCmsploI+a
         NZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685717275; x=1688309275;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JdxTAevbk4TrZwXy2RvR6ovA+aybdENi1veBE5Q3fDQ=;
        b=Uv1NFQqcJ3qIJKK870COLE8sH0sWZlM6798vO4pNTw2Gftw07m/Nps9m3rhoDv4lHQ
         GBokRzBu5afVOaZ1IFgxih3+d38hzsWjgb7kfDHI8gm+XdKvzXy9QgFJvvIx3W7BPYyo
         lcbHz7UxR03GoPK7iHjfyvACFLtaqRiaslRNo17xJHMxSC70t+xXKcCQOD2NvJSLhE3B
         zfcVVQ5fum8vY6gx0PQX8kQJSEzzPujciUERBgclBvupUD1i4keCe200oZ2aDu6qvCcK
         h5+cuSTcW9YMRPB0qAMnIY/gc1yI5VI8w3BNmJnMjzvmxKW1mwIjHRWQOBz3JWjuQ+PH
         JbWg==
X-Gm-Message-State: AC+VfDyumYUUCkoAAVaRCJRQU0m9b4FRq8tR8CQH8KbT18JDp+e/A6r+
        sOAHDP1t1bDaDhJIVDAqvBhksg==
X-Google-Smtp-Source: ACHHUZ5uj5NnGeM0VTBE5KmNrbFQ5DPxvKmLdHypfhk7mUlzG/TS3HCyQT8tTBJJV/F4zLhSAQNr7w==
X-Received: by 2002:a17:907:74d:b0:96f:cb23:daf6 with SMTP id xc13-20020a170907074d00b0096fcb23daf6mr9886320ejb.40.1685717275152;
        Fri, 02 Jun 2023 07:47:55 -0700 (PDT)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id lx5-20020a170906af0500b00965c6c63ea3sm855185ejb.35.2023.06.02.07.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:47:54 -0700 (PDT)
References: <20230601134946.3887870-1-aliceryhl@google.com>
 <20230601134946.3887870-5-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: Re: [PATCH v2 4/8] rust: workqueue: define built-in queues
Date:   Fri, 02 Jun 2023 16:46:50 +0200
In-reply-to: <20230601134946.3887870-5-aliceryhl@google.com>
Message-ID: <8735392a5h.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> We provide these methods because it lets us access these queues from
> Rust without using unsafe code.
>
> These methods return `&'static Queue`. References annotated with the
> 'static lifetime are used when the referent will stay alive forever.
> That is ok for these queues because they are global variables and cannot
> be destroyed.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

I would suggest adding the description to freezable:

"A freezable wq participates in the freeze phase of the system suspend
operations. Work items on the wq are drained and no new work item starts
execution until thawed."

But otherwise =F0=9F=91=8D

Reviewed-by: Andreas Hindborg (Samsung) <nmi@metaspace.dk>

> ---
>  rust/kernel/workqueue.rs | 65 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 9c630840039b..e37820f253f6 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -105,3 +105,68 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Se=
lf::EnqueueOutput
>      where
>          F: FnOnce(*mut bindings::work_struct) -> bool;
>  }
> +
> +/// Returns the system work queue (`system_wq`).
> +///
> +/// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU mu=
lti-threaded. There are
> +/// users which expect relatively short queue flush time.
> +///
> +/// Callers shouldn't queue work items which can run for too long.
> +pub fn system() -> &'static Queue {
> +    // SAFETY: `system_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_wq) }
> +}
> +
> +/// Returns the system high-priority work queue (`system_highpri_wq`).
> +///
> +/// It is similar to the one returned by [`system`] but for work items w=
hich require higher
> +/// scheduling priority.
> +pub fn system_highpri() -> &'static Queue {
> +    // SAFETY: `system_highpri_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_highpri_wq) }
> +}
> +
> +/// Returns the system work queue for potentially long-running work item=
s (`system_long_wq`).
> +///
> +/// It is similar to the one returned by [`system`] but may host long ru=
nning work items. Queue
> +/// flushing might take relatively long.
> +pub fn system_long() -> &'static Queue {
> +    // SAFETY: `system_long_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_long_wq) }
> +}
> +
> +/// Returns the system unbound work queue (`system_unbound_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reache=
d and resources are
> +/// available.
> +pub fn system_unbound() -> &'static Queue {
> +    // SAFETY: `system_unbound_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> +}
> +
> +/// Returns the system freezable work queue (`system_freezable_wq`).
> +///
> +/// It is equivalent to the one returned by [`system`] except that it's =
freezable.
> +pub fn system_freezable() -> &'static Queue {
> +    // SAFETY: `system_freezable_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_freezable_wq) }
> +}
> +
> +/// Returns the system power-efficient work queue (`system_power_efficie=
nt_wq`).
> +///
> +/// It is inclined towards saving power and is converted to "unbound" va=
riants if the
> +/// `workqueue.power_efficient` kernel parameter is specified; otherwise=
, it is similar to the one
> +/// returned by [`system`].
> +pub fn system_power_efficient() -> &'static Queue {
> +    // SAFETY: `system_power_efficient_wq` is a C global, always availab=
le.
> +    unsafe { Queue::from_raw(bindings::system_power_efficient_wq) }
> +}
> +
> +/// Returns the system freezable power-efficient work queue (`system_fre=
ezable_power_efficient_wq`).
> +///
> +/// It is similar to the one returned by [`system_power_efficient`] exce=
pt that is freezable.
> +pub fn system_freezable_power_efficient() -> &'static Queue {
> +    // SAFETY: `system_freezable_power_efficient_wq` is a C global, alwa=
ys available.
> +    unsafe { Queue::from_raw(bindings::system_freezable_power_efficient_=
wq) }
> +}

