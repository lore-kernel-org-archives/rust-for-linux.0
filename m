Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C8AC7618E
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 Apr 2023 21:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbjDZVqA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 Apr 2023 17:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjDZVp7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 Apr 2023 17:45:59 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07FE1FF2;
        Wed, 26 Apr 2023 14:45:56 -0700 (PDT)
Date:   Wed, 26 Apr 2023 21:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1682545552; x=1682804752;
        bh=XRs8BIXjRa7l+HwAU9FqrtJAc1iiE4XQ0MrbmDyg07Q=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=fHiQlcLvzyw0n0V1FL6XiXx64u41B3F4jgRLB1/biHA3N3XXJJIC1gT2bKcDYf+D7
         j5zoFuoevot1VmX6Y1whesJp3bSFJMU1OPkbrE5+RICgItRDkB/SnEFpMk8YcyxdjZ
         ryqmhk41+lVZEGRUij9F83eGsXDbFPn/hmmnWVvdGNLWIHcIswgB8hjfgG0HNqNp8K
         omOMlSUeFijZd8WhAi/hQlP/iBp2a3IAotuENvDEgyLvKSvQD3Wukxq28/kk6QkZm4
         NjTXjQQQD0QCE2WsQOdLXTabkvWk6ODkxmYeLU9UvcheQUqN/QHF6ZUpY5n70RS1D/
         +QIeovE6xSGvA==
To:     alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
        yakoyoku@gmail.com, aliceryhl@google.com, materoy@proton.me,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Roy Matero <materoy@proton.me>
Cc:     ojeda@kernel.org
Subject: [PATCH] rust: fix sorting of rust/bindings/bindings_helper.h's #includes Suggested by: Miguel Ojeda <ojeda@kernel.org> Link: https://github.com/Rust-for-Linux/linux/issues/1002
Message-ID: <ZEmbeAUklqmb8leS@virtual>
Feedback-ID: 71587999:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: Roy Matero <materoy@proton.me>
---
 rust/bindings/bindings_helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 50e7a76d5455..dc8d97272e71 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,10 +6,10 @@
  * Sorted alphabetically.
  */

-#include <linux/slab.h>
 #include <linux/refcount.h>
-#include <linux/wait.h>
 #include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/wait.h>

 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL =3D GFP_KERNEL;
--
2.40.1


