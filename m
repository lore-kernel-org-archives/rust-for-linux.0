Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFE4C4338F
	for <rust-for-linux@archiver.kernel.org>; Thu, 19 Aug 2021 20:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B68496108B
	for <rust-for-linux@archiver.kernel.org>; Thu, 19 Aug 2021 20:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhHSUpE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 19 Aug 2021 16:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhHSUpE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 19 Aug 2021 16:45:04 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66782C061575
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Aug 2021 13:44:27 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g138so4574794wmg.4
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Aug 2021 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C1K0VBOtaXe+6z5bynBzDDBlm/A+AELqyDsI8wr4TTs=;
        b=hXfpJap9cOdADCs2mIMxI5leoVOtZfd0Q4IecycWjpL3yyefzcMsowJRFpXxT6rJRM
         i9mFQKPDzOragrvRN3Y+Rnl63B0ZLO8O4H+IrUlfMYbCUfowkeyjQDTNIFAj7WLsSFEV
         H/KJvF4lMyUFUwMcH2+GZzKs7FCfKUtQSBJhj61d0Rqe/ioFuTUdlOd97Re2cJphvudk
         TsMx3RVXJpho3MhjRbe6K3IEBvqeBccuCn+MUxvuVYyBddm0VY9kRx+G5PjmJLAfu+RK
         zde9OuWN0NWFdnk0n54fOdQGxv3vY0S3MqM+DMuZrObltW1NjWDYayPuJ+fqIMVUiAgQ
         H+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C1K0VBOtaXe+6z5bynBzDDBlm/A+AELqyDsI8wr4TTs=;
        b=NzbalH9j2ToOcQOBLTtsxgtuNh0yCfBnrg3tiUS05TZbbnX3HWoK5zyACXFXnSrVwp
         EPV4WGPmJPAb48ttkT71CMV6xPk3zhmhUGA63Og4STTpvhQ/AsQ4FRCPynfDnoce+4qw
         RXHIfmWMHeoqclTrGQf275QEFmONd2oq0kk9WXOJCgn3nq92V57qduQyY+v8BHqw/+Wk
         Lzwbz3zd5GjfsWiaClkUSVk3b0O4FWW3Pb/HC+MnQ3X20aUdPC/cw8TraPl0KuFOUdBD
         M5ijxUmBVw+hxu3DxoSmw4Dq1aHWs6sKZaela2CRcXRIhRW8Cfy0Cm0OXip3dFDLXm8l
         6HsA==
X-Gm-Message-State: AOAM530E60tTL6G3yRa+EP9G0LO7W5B5npAjzH6r/nMUCwIHrp6v1zNp
        wVOwZ7kDn9AbS0SMkRdM3YZbnOqPCfcIxQ==
X-Google-Smtp-Source: ABdhPJz2UP3nPB0mE+27fQF0/+S1SS9Dt2DJf/4jNPMSEW0Bl1NReneVMt1W38gU7iU9gmSirqvUdQ==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr465803wmj.160.1629405865853;
        Thu, 19 Aug 2021 13:44:25 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aef46.dynamic.kabel-deutschland.de. [95.90.239.70])
        by smtp.googlemail.com with ESMTPSA id y11sm4634113wru.0.2021.08.19.13.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 13:44:25 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Gioh Kim <gurugio@gmail.com>
Subject: [RFC] rust: kernel: ioctl returns ENOTTY if not implemented
Date:   Thu, 19 Aug 2021 22:44:22 +0200
Message-Id: <20210819204422.64595-1-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Gioh Kim <gurugio@gmail.com>

According to fs/ioctl.c, ioctl system call first test the cmd
value with do_vfs_ioctl. If the cmd is not supported command,
it calls vfs_ioctl. Then vfs_ioctl returns ENOTTY if ioctl is
not implemented.

Signed-off-by: Gioh Kim <gurugio@gmail.com>
---
 rust/kernel/file_operations.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/file_operations.rs b/rust/kernel/file_operations.rs
index cad665c0016f..c6f03938de97 100644
--- a/rust/kernel/file_operations.rs
+++ b/rust/kernel/file_operations.rs
@@ -662,7 +662,7 @@ pub trait FileOperations: Send + Sync + Sized {
         _file: &File,
         _cmd: &mut IoctlCommand,
     ) -> Result<i32> {
-        Err(Error::EINVAL)
+        Err(Error::ENOTTY)
     }
 
     /// Performs 32-bit IO control operations on that are specific to the file on 64-bit kernels.
@@ -673,7 +673,7 @@ pub trait FileOperations: Send + Sync + Sized {
         _file: &File,
         _cmd: &mut IoctlCommand,
     ) -> Result<i32> {
-        Err(Error::EINVAL)
+        Err(Error::ENOTTY)
     }
 
     /// Syncs pending changes to this file.
-- 
2.25.1

