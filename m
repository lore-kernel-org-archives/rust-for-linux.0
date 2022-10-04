Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAB5C433F5
	for <rust-for-linux@archiver.kernel.org>; Tue,  4 Oct 2022 18:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiJDSrQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 4 Oct 2022 14:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiJDSrP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 4 Oct 2022 14:47:15 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F9169F62
        for <rust-for-linux@vger.kernel.org>; Tue,  4 Oct 2022 11:47:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x32-20020a17090a38a300b00209dced49cfso11279276pjb.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Oct 2022 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Ap8NhLNkwkZ+9pHFPmaGjqaY7m/PuDxtp7ygfQ7rZXw=;
        b=5K8mItni9qvUB2aqre19DEnY9+XvPIkjIEYDtlukAgPD9dOPrre1rRQE0IOUgqMTkB
         GyEgN5+WCj20HOiOXQBz0AnPdyfNeId1yaRDh6tDDIk3KweErmbC/0AeNGUCHICu4IJ2
         UQy9e5I3NEyyRrMUk8n9NwEdj5ImXSLpywITtZlWxFb6MJPKY9CTxptVHKX/j+Yrbczl
         xJgtA/hsDQpURWf3ucSwcda6imLALfm4o8/NcOvZLOtil8ueXLNbWpdKsWmApVwlGpWM
         BScXrO8OI8LSaXa/VJ3YTI+TmrzfDaDosRMG/ok9ozzGUKtl3kpFkc4aV0dnYLE0Kygn
         nL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Ap8NhLNkwkZ+9pHFPmaGjqaY7m/PuDxtp7ygfQ7rZXw=;
        b=bGcCjcid/uuxUFUT39QgcbBrVtBAaZ3V/xZE/Nj8yAZ1+1CTb97N3a5NvvmbRTibMM
         kP1U1UjDhQ7o1LZEKenDyEZofjj7hXuF8651rB/FJPqGzbvzz53i4Y8GnQuXYzD46sou
         kcAg4XOX06ZCuqFynmvwMMh96mr/6oAa0dZQFO08MohlseDE5dOVpyhiepZYtiU+PAO5
         2VS2AV5bK+w7cfqrLHSU1q6zGgtBCgtf34Ok9QOdtAVF7obEuv/cgUCAP9AtASkFUgHy
         KixWYufUMQ2NKC1QooDZl+lyTkPvwFvhMdr6JFC+ny8mSmIF1RJ3HyH+SpFy6svKuVuE
         TK2A==
X-Gm-Message-State: ACrzQf0llIhVU5v+JefIw1eXzbcYyA3eg4lZIuuVPxcK9ach6p/L+PO2
        0jkN5MKpldkeLDg0qr0rxrVPkg==
X-Google-Smtp-Source: AMsMyM7zZPOc0Gd/jTJWjrhpQHKa6A0rL6sTeCsOuq9mkt8dCKVI0Pf1J1Hqo0WpZ9F/ShyJJiuYnQ==
X-Received: by 2002:a17:902:8643:b0:17a:3e74:d2a6 with SMTP id y3-20020a170902864300b0017a3e74d2a6mr28862328plt.120.1664909233682;
        Tue, 04 Oct 2022 11:47:13 -0700 (PDT)
Received: from chonkvm.olof-johansson.gmail.com.beta.tailscale.net. (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id y10-20020aa79e0a000000b00561bc0aa529sm1997797pfq.131.2022.10.04.11.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 11:47:12 -0700 (PDT)
From:   Olof Johansson <olof@lixom.net>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>
Subject: [PATCH] scripts: rust_is_available.sh: Provide hints on how to fix missing pieces
Date:   Tue,  4 Oct 2022 11:46:25 -0700
Message-Id: <20221004184625.10076-1-olof@lixom.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This might be a bit bikesheddy, but it saves a few roundtrips to the
documentation when getting the `make LLVM=1 rustavailable` run to pass.

Stick to the rustup options to avoid too much verbosity.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/rust_is_available.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index aebbf1913970..94e6a1ce1df3 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -59,6 +59,9 @@ if [ "$rust_compiler_cversion" -lt "$rust_compiler_min_cversion" ]; then
 		echo >&2 "***   Your version:    $rust_compiler_version"
 		echo >&2 "***   Minimum version: $rust_compiler_min_version"
 		echo >&2 "***"
+		echo >&2 "*** To update to the expected version:"
+		echo >&2 "***   \$ rustup override set \$(scripts/min-tool-version.sh rustc)"
+		echo >&2 "***"
 	fi
 	exit 1
 fi
@@ -68,6 +71,9 @@ if [ "$1" = -v ] && [ "$rust_compiler_cversion" -gt "$rust_compiler_min_cversion
 	echo >&2 "***   Your version:     $rust_compiler_version"
 	echo >&2 "***   Expected version: $rust_compiler_min_version"
 	echo >&2 "***"
+	echo >&2 "*** To update to the expected version:"
+	echo >&2 "***   \$ rustup override set \$(scripts/min-tool-version.sh rustc)"
+	echo >&2 "***"
 fi
 
 # Check that the Rust bindings generator is suitable.
@@ -155,6 +161,9 @@ if [ ! -e "$rustc_src_core" ]; then
 		echo >&2 "*** Source code for the 'core' standard library could not be found"
 		echo >&2 "*** at '$rustc_src_core'."
 		echo >&2 "***"
+		echo >&2 "*** To install sources:"
+		echo >&2 "***   \$ rustup component add rust-src"
+		echo >&2 "***"
 	fi
 	exit 1
 fi
-- 
2.30.2

