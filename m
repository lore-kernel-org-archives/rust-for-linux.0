Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBDDEB64DA
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Jul 2023 06:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjGRGBm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Jul 2023 02:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjGRGBl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Jul 2023 02:01:41 -0400
Received: from germane-culhwch.relay-egress.a.mail.umich.edu (relay-egress-host.us-east-2.a.mail.umich.edu [18.217.159.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D776D1;
        Mon, 17 Jul 2023 23:01:40 -0700 (PDT)
Received: from jacinth-ogre.authn-relay.a.mail.umich.edu (ip-10-0-74-216.us-east-2.compute.internal [10.0.74.216])
        by germane-culhwch.relay-egress.a.mail.umich.edu with ESMTPS
        id 64B62717.11552E7.18B8CF7B.1115286;
        Tue, 18 Jul 2023 01:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
        s=relay-2018-08-29; t=1689659157;
        bh=32KuaL9XprTSau8shHufKOsqD5/ATF/mtI1/00+YRqo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=s9+fYcCr1NEJtujl318yCSU4k+WYadNcttOxXc/ppCJNAJYF0SlVX/nydtAY5/Brm
         soSuIGVL8UhFAQj8feVZSllfbzlf1dojWKZYoPDDIrtqLUE8RdTlp467T9Fjzb2mby
         1bYRI24vge4lU14/E+UHmgN+T+w7PkMo56Dem+DwngdyGcEh1bU0D5IAeUPqGi22y4
         pAwikZ3aqFOmMG88a/jeDHDwudAOjIQExvGjs61AqDOX6DFOcDlovZh2fkg1Ku3j36
         ET1Z43nmt1Aos5/mdVC7eBejKFpzHxssAjLbaoqaD2ifXdMtc0dS7oPJ5aQCvbgvow
         amaotLeZB2B2Q==
Authentication-Results: jacinth-ogre.authn-relay.a.mail.umich.edu; 
        iprev=permerror policy.iprev=68.32.216.219 (unknown);
        auth=pass smtp.auth=tmgross
Received: from localhost.localdomain (unknown [68.32.216.219])
        by jacinth-ogre.authn-relay.a.mail.umich.edu with ESMTPSA
        id 64B62715.21F24970.53FCB6DA.46279;
        Tue, 18 Jul 2023 01:45:57 -0400
From:   Trevor Gross <tmgross@umich.edu>
To:     ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
        benno.lossin@proton.me, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 2/2] docs: rust: clarify what 'rustup override' does
Date:   Tue, 18 Jul 2023 01:44:16 -0400
Message-Id: <20230718054416.861412-3-tmgross@umich.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718054416.861412-1-tmgross@umich.edu>
References: <20230718054416.861412-1-tmgross@umich.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

The behavior of 'rustup override' is not very well known. This patch is
a small edit that adds details about what it does, so users have a better
understanding of how it affects their system toolchain (i.e., it does
not affect system toolchain and only sets a directory-specific
override).

Signed-off-by: Trevor Gross <tmgross@umich.edu>
---
 Documentation/rust/quick-start.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index bb67deb19100..700d37dcff5c 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -38,7 +38,9 @@ and run::
 
 	rustup override set $(scripts/min-tool-version.sh rustc)
 
-Otherwise, fetch a standalone installer from:
+This will configure your working directory to use the correct version of
+``rustc`` without affecting your default toolchain. If you are not using
+``rustup``, fetch a standalone installer from::
 
 	https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
 
-- 
2.34.1

