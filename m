Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E652D0C8F
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554779; cv=none; b=l1RXD4UFN0t6C4DJZstFP2DKLWW/fVU3E78l9BYlXxPUNVrVXeehQKHpzjMgbEImqCQZ8x5U/9DgV7yAGKZbzDhx0N3ApFYq+NxLzPBji9wlA7DgY30MNX3/Yokbk9GVhTKgfXY86KJFsKJS4RnBEItYaT0kukOpSpeRPcsdjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554779; c=relaxed/simple;
	bh=y+z0Brau7WOchqhar3j2omzG33UaXLAY83xQGkoNFjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lac0RLDnVDn3dr4qPoTuZqFT4ax+RV2Pj8JsMGIPUKoE14vrQq9h2NMUj1+4e4xUrgxiXrH4ueCtby3g9grtnzQDn1X6N9/aK+Q+8kf40Xyp+ryBsQif3mWwUZV2KjBBMZ3o+6CuUGEuN1acaPreWrKdjLpXyLNXBHpIKk8XGmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiCkW4Kz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiCkW4Kz"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423b08b293so1844858b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781554777; x=1782159577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=965hIQpF+wIIcHb6QgUT7BSeaP3RfZre3I6HSdt/dhQ=;
        b=IiCkW4KzObJTjCtFGxlPDokTHqB7dTz02zgGL2H6i64oQSqEbHqP8ReYH6dg/kMSmz
         XTPvSvaTaLkM8jOA3I1KsVNnLgaTtc0+om48K/yLWBe+PQYgQRV1HmbauSM+pWwHmr+R
         KBrUEjPv5pQ38/aW+L9jQfHbqxcE34Dnz1LC889U7gt7V8z676srUBfzuP0BeHgVvnNt
         1wwmR8ZQm7mBOKQpcRUDIuINyHcEu86ECYr8jy3+ohH4/r9Sw2ql/KoVcwC+3/pDMoOK
         nSR2xBn9gjBho/LfjyMbjHEYy2qu7jcHQaMbazcMeTQDfKpTmMqO1fjcjmLn0Xelx0vP
         GKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554777; x=1782159577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=965hIQpF+wIIcHb6QgUT7BSeaP3RfZre3I6HSdt/dhQ=;
        b=nC2sONRhCDzPvKKtJKBI/jNHcQVWbRssOfsq/Lhf0feMlZqccoL6UIcVhN4q9ckut7
         HtUOQ6gyYDJZrEMqXl33CpeldC9UC0DeGYFMNjKVfFYlTOXS6Uz/5aB2neWhk4hNicky
         UOxrZf8QdpIqa6Ltyme1W0rfgjacQDlOLvFA6IKlYv9Xx0zvhtLpYnV+f3qnif/5xGl9
         fNRbagN9z4dAVhMMPRMrgFcXVD6Etu8LwBcpKKV8PHnRDDUcBmlnfJf3catxnbCdzvbm
         j64mhe+j6cvh072eRVaQu8p2eaC87QD37cMsyrvLWG9WcxF+z9C6+HU6oHbjWY2bpIHR
         jLNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/fPZx93lR9MzPTXKnsn0ZpmWru8py3/SXYkevqLgePN5e0aXXJHjwr9L59+jjMMX+q1opbx/goKwSpEvmmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/m0EeU6MLAPQMToxd8h34/Q+hqCTY1FBR3OCAyUir+qe3ZchU
	OlD7Hdo4DSxJz6YGLPTk2H0Pb9n19zFxMtwvfiT51K6eyKnwAU55Cofb
X-Gm-Gg: Acq92OHZSa+L0Xp0285JLsbnszO9hyGZGh6jz5YzR7zDLXhf4pUyStG0NTpJJQ6bKw7
	2hJxL1DnzFkdFfPuqhj5RVsBuV4whflAlfiwxP2IEH0E0wsHyrEVsWins8HXvfSij3ejThJ808W
	LiiELZSSGDdLmgxW4DZUrs79av5kbCDTMx8vQ/1UILQn6/qJrq84S8JuauiyV0I7u70sDvcpwy3
	JXQHXWs7XCWNgxDuX+KKjwN/blgyVmaMtgt8sT25lJfA7cepKvKW39vZ/MfutVGeGCJ9qKowwiZ
	78EekoZY/jtPmI4pdLkqHmcXj9CTCRnOVZAXecoYs+M0m3LUoOz62v82PPLVPIXq8dEmMSlVXF7
	WZeaEQJTZXpdlbvbFqfB/xGSh6k7rjrPXQ8ZO9t0ttdCKQ3HQpRk+vP+kMghQD8f3++0rmJYk+B
	8Gq0VNOmVNjvTY49US3sPcid1MblN2i+jpUP7B4xT/mQ3y
X-Received: by 2002:a05:6a20:7f9c:b0:3b4:6155:cde8 with SMTP id adf61e73a8af0-3b783f447abmr17346129637.21.1781554777129;
        Mon, 15 Jun 2026 13:19:37 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([223.235.128.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm9428584a12.11.2026.06.15.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:19:36 -0700 (PDT)
From: syncrain <iganschel@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Keshav Verma <iganschel@gmail.com>
Subject: [PATCH] binder: synchronize Rust Binder stats with freeze commands
Date: Tue, 16 Jun 2026 01:47:37 +0530
Message-Id: <20260615201737.262-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Keshav Verma <iganschel@gmail.com>

Rust Binder stats use BC_COUNT and BR_COUNT to size the command and
return counters, and use event string tables when printing debug
statistics.

The Binder protocol includes freeze-related commands and return codes,
but the Rust Binder statistics code was not updated to cover them. As a
result, those commands and return codes are not accounted for or printed
by the stats debug output.

Update the counts and event string tables so these commands and return
codes are included in the debug statistics output.

Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
 drivers/android/binder/rust_binder_events.c | 7 ++++++-
 drivers/android/binder/stats.rs             | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/rust_binder_events.c b/drivers/android/binder/rust_binder_events.c
index 488b1470060c..5792aa59cc82 100644
--- a/drivers/android/binder/rust_binder_events.c
+++ b/drivers/android/binder/rust_binder_events.c
@@ -28,6 +28,9 @@ const char * const binder_command_strings[] = {
 	"BC_DEAD_BINDER_DONE",
 	"BC_TRANSACTION_SG",
 	"BC_REPLY_SG",
+	"BC_REQUEST_FREEZE_NOTIFICATION",
+	"BC_CLEAR_FREEZE_NOTIFICATION",
+	"BC_FREEZE_NOTIFICATION_DONE",
 };
 
 const char * const binder_return_strings[] = {
@@ -51,7 +54,9 @@ const char * const binder_return_strings[] = {
 	"BR_FAILED_REPLY",
 	"BR_FROZEN_REPLY",
 	"BR_ONEWAY_SPAM_SUSPECT",
-	"BR_TRANSACTION_PENDING_FROZEN"
+	"BR_TRANSACTION_PENDING_FROZEN",
+	"BR_FROZEN_BINDER",
+	"BR_CLEAR_FREEZE_NOTIFICATION_DONE",
 };
 
 #define CREATE_TRACE_POINTS
diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
index ab75e9561cbf..ec81dc7747db 100644
--- a/drivers/android/binder/stats.rs
+++ b/drivers/android/binder/stats.rs
@@ -8,8 +8,8 @@
 use kernel::sync::atomic::{ordering::Relaxed, Atomic};
 use kernel::{ioctl::_IOC_NR, seq_file::SeqFile, seq_print};
 
-const BC_COUNT: usize = _IOC_NR(BC_REPLY_SG) as usize + 1;
-const BR_COUNT: usize = _IOC_NR(BR_TRANSACTION_PENDING_FROZEN) as usize + 1;
+const BC_COUNT: usize = _IOC_NR(BC_FREEZE_NOTIFICATION_DONE) as usize + 1;
+const BR_COUNT: usize = _IOC_NR(BR_CLEAR_FREEZE_NOTIFICATION_DONE) as usize + 1;
 
 pub(crate) static GLOBAL_STATS: BinderStats = BinderStats::new();
 
-- 
2.39.5

