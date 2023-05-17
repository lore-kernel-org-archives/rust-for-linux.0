Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D51C7EE22
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 May 2023 20:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjEQUcC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 May 2023 16:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjEQUbs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 May 2023 16:31:48 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B575A246
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:31:39 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-ba82ed6e450so2069807276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684355499; x=1686947499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jLXiUUyXZrTzMck4adUmLD4E9Fc4RhEDENIXEJkaNoM=;
        b=Lp9zbuZlGMkoH9mjSYs45st9QzFlf0UvMJdif/V2AN/V6r0lNGpacsUUPM6AuPSbY5
         lZVyTVtPtEmdqThYLZDWtQauBZdxQu0uYmZnOcuG/84ytieNu91BYG9oXDwwsHT2p49B
         dvwYV61uX18XiQwx8HR4rpuHsdm1y1o4GNVMlpycoZ3yazxlYao6A3mPz0D4U3l+ZTaR
         Ihm91ukyPGKdNFbEdByPDDa/uK7pMCU27uKzU2g2SVg/T+EL6NA2g7DToPqSJn71kXke
         /aM2npnvU9p8kkdzMeFf2kZytNb8n/Zb4YOh8k0uDCa3MWyr+/gWdZbBqaJtinBjO8/k
         fZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684355499; x=1686947499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLXiUUyXZrTzMck4adUmLD4E9Fc4RhEDENIXEJkaNoM=;
        b=PVqO+/MdKuspak6hFDoODQ3MnvY/PkbRsjEUP0+tZtn5z6yTX0WCcmcrz6cOTdWu64
         /p3SpY8j2652pjNacXl2q1mZwWCs0kiBJO8YhkzlEBHMiCT0zawcABJV/vPhGi7/mF04
         wd61WPxCZr3rKP3D6j9546c8ILanTwiTIGyeVN3ibzJF+5c/6fEr0VBppN7Hwxp9RsZB
         Yyk0rISSYNBDa902gS9yQT/V1LgTa64aOOb530pOj1opF986lBW+CRkb3h1ax+nbbSha
         WdFEv3TJw3olVCvEIG+/yhUgW070zek8qCpIX2Dky7V7wieOMjen77ZRNHjC0dgLR8GG
         BbVQ==
X-Gm-Message-State: AC+VfDxmNkIMF0tRNQ6ot2poTLvU/52O0t9pyuIcd7Eoqb4PiPR2vr8p
        folJ7Zk1YNNaD/XXLgI6b2PIMAuvcHfGmclG8/f0ghQrJtpkH/DAL6uuADubZUSrdV2v95I4ECD
        tTeUgWDzlTc9ueRudmiaDfvojkJ2TuvoFgrejO7VpNCUf9O2GYR3ZLR37Gj4xgS6AROg+3XvPfu
        vgOBTp
X-Google-Smtp-Source: ACHHUZ5tmViXv0Bqs6ow3OaP3sc8at0uvRWvWrrBDcPlcxzghI4kY4ZB84bf1guzl4ZHc3sj/NZqh2+ej0dk5OY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:9309:0:b0:ba8:2e79:c193 with SMTP id
 f9-20020a259309000000b00ba82e79c193mr2630490ybo.12.1684355498779; Wed, 17 May
 2023 13:31:38 -0700 (PDT)
Date:   Wed, 17 May 2023 20:31:19 +0000
In-Reply-To: <20230517203119.3160435-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230517203119.3160435-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230517203119.3160435-8-aliceryhl@google.com>
Subject: [PATCH v1 7/7] rust: workqueue: add `try_spawn` helper method
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

This adds a convenience method that lets you spawn a closure for
execution on a workqueue. This will be the most convenient way to use
workqueues, but it is fallible because it needs to allocate memory.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 007005ddcaf0..303b72efd95f 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -57,6 +57,42 @@ impl Queue {
             })
         }
     }
+
+    /// Tries to spawn the given function or closure as a work item.
+    ///
+    /// This method can fail because it allocates memory to store the work item.
+    pub fn try_spawn<T: 'static + Send + Fn()>(&self, func: T) -> Result {
+        let init = pin_init!(ClosureWork {
+            work <- Work::new(),
+            func: Some(func),
+        });
+
+        self.enqueue(Box::pin_init(init)?);
+        Ok(())
+    }
+}
+
+/// A helper type used in `try_spawn`.
+#[pin_data]
+struct ClosureWork<T> {
+    #[pin]
+    work: Work<Pin<Box<ClosureWork<T>>>>,
+    func: Option<T>,
+}
+
+impl<T> ClosureWork<T> {
+    fn project(self: Pin<&mut Self>) -> &mut Option<T> {
+        // SAFETY: The `func` field is not structurally pinned.
+        unsafe { &mut self.get_unchecked_mut().func }
+    }
+}
+
+impl<T: FnOnce()> BoxWorkItem for ClosureWork<T> {
+    fn run(mut self: Pin<Box<Self>>) {
+        if let Some(func) = self.as_mut().project().take() {
+            (func)()
+        }
+    }
 }
 
 /// A work item.
@@ -280,6 +316,10 @@ macro_rules! impl_has_work {
     )*};
 }
 
+impl_has_work! {
+    impl<T> HasWork<Pin<Box<Self>>> for ClosureWork<T> { self.work }
+}
+
 /// Declares that [`Arc<Self>`] should implement [`WorkItem`].
 ///
 /// # Examples
-- 
2.40.1.606.ga4b1b128d6-goog

