Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2496AC77B7C
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 May 2023 06:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjEDGtE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 4 May 2023 02:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjEDGtE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 4 May 2023 02:49:04 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43E42122
        for <rust-for-linux@vger.kernel.org>; Wed,  3 May 2023 23:49:01 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-50bcaec14c2so4190608a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 May 2023 23:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683182940; x=1685774940;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v54eC/u2pmIq/4VC9DlPX0eq+2LaXAcFRV569X4YYSM=;
        b=zayMOwpR6S7h8KihPwp0mQ24ajqeNArUPKpxRA0xVbveeGDYAYcBHCmAPFODKJ8f38
         4/C0KZc02U2lQ2CyZcRxt8fL3ieUOCJkuTrsVT76+GEu+4smJlQ3U6tv0osqx9sxx+SV
         Vjp4SlFnh+yr1Want76vSrDBPeOSZ56pU/GqTuyCRc8uKDHCuY7gn2clef1igBk9qSQv
         XoIxmy59b5p6cRTcTmvo26b/AiBXthnYSt/daZQAv5/aoE85DeaTJoyThSiNSEACOKlZ
         RNx2Q7zuTFv8avJ/gM0VCQ8CxhHMC3309mCGoKnVYDqcJ/TMFUDDNn6UZlR8LyvvUIj0
         VVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683182940; x=1685774940;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v54eC/u2pmIq/4VC9DlPX0eq+2LaXAcFRV569X4YYSM=;
        b=Oy+yEFL31H+BMVvuD7LL0v6y2/xHE03G2Zbfvd2y8LuAmgMjFQdNr8r8QwC59YDYfb
         AeqkEj0FEafrVY/yQYFmsXf8QPrZU8sxWipbsDlxfx5MJRBt1h7J/Mwug95h78ZvdrR0
         buqyBYIZSEyU2/ArpxwwnD4s9qh1v4fiYVMZnXml9EzVDa+/1vUi4YRiYomZCU1xtukx
         58sEQvSV86GlTNFmHyeNzGhH8+Xm7Y2BUkjPGDuLChgXMTwHfO/IiK0YnTor768pFfUu
         0GH9ImmzdStjVEzbrf86ayQMMfce1vGMXgtcQ/99jozgZHREK6Xm4mkofytpqRfAC5a1
         EKLw==
X-Gm-Message-State: AC+VfDxhL3Ar6DJof6Xar5y1cQuScIVRaig5FZqagu0Gt4QMjmSDefst
        66Vt5IP3ggsVA3Kz5GQf0ZY1apjadZy/YVU=
X-Google-Smtp-Source: ACHHUZ75O2WHLTLROw/e61HOrc65GsGkxKKIRK0mkoI/IDuzgCXXY/8PZICpK/ob6hyHgNBVf+r/mpoCtzuToaY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:a40e:b0:953:87f8:82e9 with SMTP
 id sg14-20020a170907a40e00b0095387f882e9mr2147980ejc.7.1683182940371; Wed, 03
 May 2023 23:49:00 -0700 (PDT)
Date:   Thu,  4 May 2023 06:48:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230504064854.774820-1-aliceryhl@google.com>
Subject: [PATCH v2] rust: error: add missing error codes
From:   Alice Ryhl <aliceryhl@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This adds the error codes from `include/linux/errno.h` to the list of
Rust error constants. These errors were not included originally, because
they are not supposed to be visible from userspace. However, they are
still a perfectly valid error to use when writing a kernel driver. For
example, you might want to return ERESTARTSYS if you receive a signal
during a call to `schedule`.

This patch inserts an annotation to skip rustfmt on the list of error
codes. Without it, three of the error codes are split over several
lines, which looks terribly inconsistent.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 5f4114b30b94..de4fa8640f29 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -14,6 +14,7 @@ use core::num::TryFromIntError;
 use core::str::Utf8Error;
 
 /// Contains the C-compatible error codes.
+#[rustfmt::skip]
 pub mod code {
     macro_rules! declare_err {
         ($err:tt $(,)? $($doc:expr),+) => {
@@ -58,6 +59,25 @@ pub mod code {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(ERESTARTSYS, "Restart the system call.");
+    declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
+    declare_err!(ERESTARTNOHAND, "Restart if no handler.");
+    declare_err!(ENOIOCTLCMD, "No ioctl command.");
+    declare_err!(ERESTART_RESTARTBLOCK, "Restart by calling sys_restart_syscall.");
+    declare_err!(EPROBE_DEFER, "Driver requests probe retry.");
+    declare_err!(EOPENSTALE, "Open found a stale dentry.");
+    declare_err!(ENOPARAM, "Parameter not supported.");
+    declare_err!(EBADHANDLE, "Illegal NFS file handle.");
+    declare_err!(ENOTSYNC, "Update synchronization mismatch.");
+    declare_err!(EBADCOOKIE, "Cookie is stale.");
+    declare_err!(ENOTSUPP, "Operation is not supported.");
+    declare_err!(ETOOSMALL, "Buffer or request is too small.");
+    declare_err!(ESERVERFAULT, "An untranslatable error occurred.");
+    declare_err!(EBADTYPE, "Type not supported by server.");
+    declare_err!(EJUKEBOX, "Request initiated, but will not complete before timeout.");
+    declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.");
+    declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
+    declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
 }
 
 /// Generic integer kernel error.

base-commit: ea76e08f4d901a450619831a255e9e0a4c0ed162
-- 
2.40.1.521.gf1e218fcd8-goog

