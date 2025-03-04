Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D768194080
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 04:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061153; cv=none; b=BTjh/y1V3DddU+xooPHHFIlrWNhgWKmoqVG72X5S6yD2LuWsJjL9S4rEv7lCKi6QuRljhi1WlhL3euT9pogMvAuIjlydLe+aT8MhcKExZbTm170puNMr3vuTVA+cYiCCWf2khCHDGpfzjth9lO+E74piYJ77+jVbjI6i9CAqg3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061153; c=relaxed/simple;
	bh=VM2t+jylxMB2T771kmAuUS21X4Kndc0vcr8ru3CPI6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RiyV/Dl3dER9sTWsnmPJ8GTtVwHRRauFoz2rEGHTgJd7upmKQciJMJi0Mei248A8YVOzJ1RkGw4wnkdGsHVtn+RxjH5KilZ/jm9hfhDVNfNTePRkm9koozOjieN9og4FqfqtaHo5WeEocneuovgjvsDgDD5/QXwXZwqbJnxPZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (2048-bit key) header.d=furiosa-ai.20230601.gappssmtp.com header.i=@furiosa-ai.20230601.gappssmtp.com header.b=kf8oUeo+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=furiosa-ai.20230601.gappssmtp.com header.i=@furiosa-ai.20230601.gappssmtp.com header.b="kf8oUeo+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2239f8646f6so41715585ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 20:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa-ai.20230601.gappssmtp.com; s=20230601; t=1741061151; x=1741665951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6B/YlsPCXj6yKOA081X5xsFxPwPhBIXGZLI0eUqTn/8=;
        b=kf8oUeo+5qa4Cznd4VFeIEG7KCYX0fdo/U+qYHxo5clvZqupfNntRZ8Tan80q8aFrm
         P+pF/rHS0CUNDuN5We3eoxrCLAbXPP14cVR6nuC03aU3v/tyknQX6fmb0u8XhflYS1od
         be0kZ6hIX/RfZxwtUWO8EGGFlfED/PKYSFexFIdM98p3nR715WcW36B7s3bhokeaDXcN
         UkycbRQV1oTcX/6TpsQaXJ46grIJ/NKXyDSoJBLdbPZy72zkaLo/fYC5jTW8SnmcCDup
         lcxyUxi/GqoJibO3P3mJ3THG2AhdmCZywGc7T/kdQn9HX28EFGLWkELbTCfcfitYU9vr
         d5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741061151; x=1741665951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6B/YlsPCXj6yKOA081X5xsFxPwPhBIXGZLI0eUqTn/8=;
        b=XCuKxCNrx14MnKvi5JUUdasuQmPr3bHl4wB2Yceb3/dI1OVlGYksywqIw8ixw1QXAW
         Y2sZ1wmEDLXUhqvSTFqbAtJdasR/+EaOOKPsrjmsVppd4X5k1fYCV3NZQ7fl0WoS053V
         8z0ZNlDmNbrbZICyecSfsBxYp6CrjU5eras0OPPXQsMww1fS2UqLVr2ZODZ8yK70FFWa
         pRTPo3IlPMn3POvdLIuS8ZKBsMRTWQjxoPVLzX4nqYltwNDnceQ1R+D5/4RRxZp3NwF/
         IGvO/UlduRWwPANNImZa7XHVQk5ApriCH3K205oifqAtjHV6ZxAAvYy/nAfGiX7gkg2O
         h/mg==
X-Gm-Message-State: AOJu0YwiO8y6n0xbSl2FeQ/tJGbAR19N4r/WwK6GdJXlVQiqElbAHGyh
	enyTs876jqY54KeAfktxULnva4Q3y/H8a/+S5N023HD50DfQu4f1Almpuwd826P2p6DgWefggXz
	V
X-Gm-Gg: ASbGncte0c3Nt9fDRKmoq5+YZGvKMXqRBx9NWktEXKXHbUiGJ18DZEMisCQJ/8knvMI
	ijkHOTg2G+/yi/m0EJxhLGdkHkKqtaORBEANjgy2ptg27yEQL7eXhyZdngRHtncfSwx3GZwGNm+
	4Ju8Ac5iIa7gSa5UTOyMWM2X4lzRgcBX9APCbvaG1MQQ+0tOCba49ubQDLGoG+4jydFKJO7qIuR
	RzbtBzYDlAMDCChoQf9yQHC3XOQyo5PNVA9Ac0cQ0e6yK2VEoC0IoIHBd+dZGhVGmqRV/EJXSYn
	p1Lwar4xdDcE2YplyqVpCJLI97BLzmEr8goDZWIYYTEdcIEdYP9dNjPqj4XndHJApFALKZRQahC
	CmQ==
X-Google-Smtp-Source: AGHT+IGfCVdejojVJj2Py5zdVgtTo9BZmtMnWbj/yAlgz1ojCDYJf/ViDIO5m5g6t94u2uNmzJB8Yg==
X-Received: by 2002:a17:903:f84:b0:221:7e04:d791 with SMTP id d9443c01a7336-22368fc97f7mr243723755ad.31.1741061151198;
        Mon, 03 Mar 2025 20:05:51 -0800 (PST)
Received: from MS03-CEO-004.yan.office.furiosa.vpn ([221.148.76.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050fdafsm85296075ad.214.2025.03.03.20.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 20:05:50 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: rust-for-linux@vger.kernel.org
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] rust: add cdev for rust bindings helper
Date: Tue,  4 Mar 2025 13:04:49 +0900
Message-Id: <20250304040450.697235-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds cdev rust bindings.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/bindings/bindings_helper.h | 1 +
 rust/helpers/cdev.c             | 3 +++
 rust/helpers/helpers.c          | 1 +
 3 files changed, 5 insertions(+)
 create mode 100644 rust/helpers/cdev.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index f46cf3bb7069..07145905bc10 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/cdev.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
 #include <linux/errname.h>
diff --git a/rust/helpers/cdev.c b/rust/helpers/cdev.c
new file mode 100644
index 000000000000..929aa5359a47
--- /dev/null
+++ b/rust/helpers/cdev.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cdev.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..6aa69761409e 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -11,6 +11,7 @@
 #include "bug.c"
 #include "build_assert.c"
 #include "build_bug.c"
+#include "cdev.c"
 #include "cred.c"
 #include "device.c"
 #include "err.c"
-- 
2.34.1

