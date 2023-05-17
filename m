Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD235C7EE22
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 May 2023 20:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjEQUbq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 May 2023 16:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjEQUbf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 May 2023 16:31:35 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056DA7ED0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:31:32 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-50bcb45f749so1271663a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684355491; x=1686947491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aOsrinT2/iaeBb0WCg7wbvs+eW6FJ9BpP6VKG3yyBao=;
        b=H6PERSAkTTYE2cWlo4VM3SlqSWM7x5pxRQ0xuWDg3VOBNyhF2hvGKULDhDPgLi2z3g
         B6Z0eUxWVpg5g5oXZLmaug777isU03Z+nfEJ5ms9qAPmuVNsFW1fc8qMU7nD99034pQy
         JBR5MzZlyYJrWwX4d7Pd79YdlG1fLg6EbSOgLlcg8D+RArG3dkHGoOpFv7Or62NCvRzf
         ULBHvzIUC6W1xuBIfvCrqHqTKetHK8rZJFGSh+P0Z8yHzoPYw5anwwjpuCKLIgGlnJaH
         caRHHNXst0n42JTDJdFiZhG2I1wLxulOebTtWnSeGO+dGTMUCBk6ViszJYZzaZ9AxwrI
         enWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684355491; x=1686947491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOsrinT2/iaeBb0WCg7wbvs+eW6FJ9BpP6VKG3yyBao=;
        b=T0JyJn297TuNxn2vwlDfmxnS/28ECJFXzgLgr326F7pXQh7vancUfUVNeo+6EjQiVP
         pl4Xc+aQVhPOu+C+/DN1esQoPDmh8dZWWT0/XFUZHbuTAQMJiaArKhQbv7LO3104ZHwi
         FgqN/cAyrXTYReD4AadBC9mLZspCWdyZyt6j6OZj1wpOytvbLS4+5Rlew3p/bEn54UlZ
         2qbSD5BgImuL4G+3A4vyDeb+mUGlPiowki/hO1eVbdHNThewda0iV5GZTXrXarzYRP9g
         fMNtq5WcgFnFJNduvsmrEJ+yib9kTDh3AJ81N7lEoIlI2fPAh7udIGeNs+oAI2cWZAkG
         ypDg==
X-Gm-Message-State: AC+VfDzqTciQYvag7ggQo2yJwsTS9smLRqIsjDMHMWnxAEVfUbA12mAG
        DYJHXd5DSrib072UGgwmVcSnh71fFWtAuB/ICrLTW8wQCbLXkVom8wn1O9DBAkGnyT4Y36Ec//v
        IrC3KdcriEkQwWBdrllTk6rIYX5W7cq/4YkolNq88Cf0jYALOs/kdipBwBSw+72uLLFAJUs58h4
        qvhro+
X-Google-Smtp-Source: ACHHUZ7n3lEpyHrn8lVJb9kMGCyUFSu3fVlXDWiAjcH2k80JTEv/xTBS0iudv7fOHA1JEPF5qkMBmU5dogljNJM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:f610:0:b0:50b:d648:a963 with SMTP id
 c16-20020a50f610000000b0050bd648a963mr1508053edn.6.1684355491066; Wed, 17 May
 2023 13:31:31 -0700 (PDT)
Date:   Wed, 17 May 2023 20:31:16 +0000
In-Reply-To: <20230517203119.3160435-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230517203119.3160435-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230517203119.3160435-5-aliceryhl@google.com>
Subject: [PATCH v1 4/7] rust: workqueue: define built-in queues
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Wedson Almeida Filho <walmeida@microsoft.com>

We provide these methods because it lets us access these queues from
Rust without using unsafe code.

These methods return `&'static Queue`. References annotated with the
'static lifetime are used when the referent will stay alive forever.
That is ok for these queues because they are global variables and cannot
be destroyed.

Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index e66b6b50dfae..22205d3bda72 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -97,3 +97,68 @@ pub unsafe trait WorkItem {
     where
         F: FnOnce(*mut bindings::work_struct) -> bool;
 }
+
+/// Returns the system work queue (`system_wq`).
+///
+/// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
+/// users which expect relatively short queue flush time.
+///
+/// Callers shouldn't queue work items which can run for too long.
+pub fn system() -> &'static Queue {
+    // SAFETY: `system_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_wq) }
+}
+
+/// Returns the system high-priority work queue (`system_highpri_wq`).
+///
+/// It is similar to the one returned by [`system`] but for work items which require higher
+/// scheduling priority.
+pub fn system_highpri() -> &'static Queue {
+    // SAFETY: `system_highpri_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_highpri_wq) }
+}
+
+/// Returns the system work queue for potentially long-running work items (`system_long_wq`).
+///
+/// It is similar to the one returned by [`system`] but may host long running work items. Queue
+/// flushing might take relatively long.
+pub fn system_long() -> &'static Queue {
+    // SAFETY: `system_long_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_long_wq) }
+}
+
+/// Returns the system unbound work queue (`system_unbound_wq`).
+///
+/// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
+/// are executed immediately as long as `max_active` limit is not reached and resources are
+/// available.
+pub fn system_unbound() -> &'static Queue {
+    // SAFETY: `system_unbound_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
+}
+
+/// Returns the system freezable work queue (`system_freezable_wq`).
+///
+/// It is equivalent to the one returned by [`system`] except that it's freezable.
+pub fn system_freezable() -> &'static Queue {
+    // SAFETY: `system_freezable_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_freezable_wq) }
+}
+
+/// Returns the system power-efficient work queue (`system_power_efficient_wq`).
+///
+/// It is inclined towards saving power and is converted to "unbound" variants if the
+/// `workqueue.power_efficient` kernel parameter is specified; otherwise, it is similar to the one
+/// returned by [`system`].
+pub fn system_power_efficient() -> &'static Queue {
+    // SAFETY: `system_power_efficient_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_power_efficient_wq) }
+}
+
+/// Returns the system freezable power-efficient work queue (`system_freezable_power_efficient_wq`).
+///
+/// It is similar to the one returned by [`system_power_efficient`] except that is freezable.
+pub fn system_freezable_power_efficient() -> &'static Queue {
+    // SAFETY: `system_freezable_power_efficient_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_freezable_power_efficient_wq) }
+}
-- 
2.40.1.606.ga4b1b128d6-goog

