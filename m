Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34462E6116
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545863; cv=none; b=qt3bDpBfTm0r40EfycUih+qD+YLvici3woernkxU+vJj0T7x3lfwi85nbJV4ddXfJD1a1v6AvBUWAscGQI3H+3OGGJuK4Dne204NNzDfD6i4hh74OJz8RFz8z6f6HSZtX4iVgK1/P6jVPuMwQK6Wtwgyj6q0Byv/ge7Nfect3B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545863; c=relaxed/simple;
	bh=z6JVWnpnoAzTcHqGzJTt/V7pg3kgKeB4QVs4SE6WBVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FElNIufNCcsDXh5pXWfkCFZy5rn8UI+I435Jnku/chzS1rGhKVTUiMallLugXmo35rroU3/mcBbvpOr5RbrcXJ2iBIaz8qLZOgcAStMgm9Km3yl6SiVS+ZhJYbzegXtPt8bcfPfnMLgodJzmBTAo77jdUDyGsrC9uQtHHt+xZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHvm9C3I; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHvm9C3I"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37474afe908so1896819a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545860; x=1782150660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRUFn8KOUc1A2oW2ndxVxmtmBuKd5qxWa3f4Z6N5qk4=;
        b=iHvm9C3IyMv6UH9UkdahEoIxeArAycRc/Dfe4xYxSeJ6Qbzhy+snJaehwX3iobGNYU
         WtoRfVGtDPX00mq4TlnYJlLSVNdIOmtM+pYgldkUdDA8SpKoQuT24CwJgienmSHWydVD
         IZf3+mQ05UNlrPbpved+RKJnJqtYOmmAtB8qwtTDi0Co1Xy2JKrC8rn/Z1GMfSqvFJfq
         +/VR4NKPxlXzSlWgkyiVctOm8pYuYjhw/XqEHcNvBI3axtfxki4HimzLp8tv71pHTktr
         Wwg3V5fz7OcgTjI3f1SbU7UtvN426RtSOTlyrzPPHaRh8g865FR3TYFF4gAx5v9qMEXU
         IrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545860; x=1782150660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRUFn8KOUc1A2oW2ndxVxmtmBuKd5qxWa3f4Z6N5qk4=;
        b=Bvtv3ynE7CjqH+gtFDQLsMZQ/M4+DQPbsy9NqVFop5eC8GoF19Ok2tPhS9Bh753lj0
         EkXIAsPxgrEgBX31CaliIV9AEDCvd//B/tkekx1MC3GiEcf0r268MxSC99CSO8VzEW+F
         jPr1dBgXl/AVdOMjsNW2K0BmP2m+DzTOL+fRV8GklIS/DtQdmtz4jKP+VjbSJlcwh0Vi
         E3w+Rruxazf0log4V5p386JVVYNxFyA3kxSEn82H2rGdcMaF2jdcBmxBDDA7VHF19B5z
         UDng5yvcMdaU56WUUMcFJDJ/w738zIKdBUlC9Xlpnc98BaIkj4Xwi3oEuzO7OYfIRqoW
         GAUA==
X-Forwarded-Encrypted: i=1; AFNElJ+UralIHYOVsHR6iIvfDHC+nxFicTCMVdDwqrKFa4AipXE2O85iBOElda+EVfQiawcm8JiPfjFEDbslTS9HLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JHbjlgMnpfrQMz0pvGcJarF4f0yhkOXL7fRI7c/nTQ81hwKP
	kHj/N+f+Px1pKSdxWO7FB0h6Uqqx7SUFq0SGcJRkwBTdGTsFsO4rdgL9
X-Gm-Gg: Acq92OHAbAaoJIzVrHv3SEmfqc6i/MxfjSuiz0hok9tIbl5WW3ixzORLep6SDI5N480
	q3TZvxAQWNq4gfRBYV08mMVMV+1yZlyrZGbDxX/dE3GeDdzKo3PA48W8c62eeZW8rdjS6VZQkcd
	92wp5M6JBlNJ+Mowq9vlUgd25P4VDqRsqw200CnPLVbl/6fukUfa/QM9QJbHjW6YgPt3Q9uJPlD
	MCTdqK1UJVJbmXFqLllz4JXIZYeLbeu4wRcn88QEJWvQQbt0lQPOqfzH1a7ySjr0ccGBGy3yyKC
	5x7kK+M2XKxeoXdQIugooYU/nvEoOshZCFtlXhpId+rgg3zF7WS6OjdzutrGnOCB8OzNvjUuX5k
	CCz1u0ANjLhGVT0er/2Mh6QVRKtGcf11CcqaT8mKAvSgYkM/ZX+MSG5+UsyIgyUlSz5GHsObr7p
	hNOX63JT0/KmyJHtKSHKb2FL+aCd65QBgOSxgxwQLiST+f
X-Received: by 2002:a17:90b:1fd0:b0:36d:bc0d:f789 with SMTP id 98e67ed59e1d1-37c2bd49493mr12505554a91.22.1781545860086;
        Mon, 15 Jun 2026 10:51:00 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([223.235.128.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521e76d1sm247058a91.8.2026.06.15.10.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:50:59 -0700 (PDT)
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
	syncrain <iganschel@gmail.com>
Subject: [PATCH] binder: synchronize Rust Binder stats with freeze commands
Date: Mon, 15 Jun 2026 23:18:34 +0530
Message-Id: <20260615174834.297-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust Binder stats use BC_COUNT and BR_COUNT to size the command and
return counters, and use event string tables when printing debug
statistics.

The Binder protocol includes freeze-related commands and return codes,
but the Rust Binder statistics code was not updated to cover them. As a
result, those commands and return codes are not accounted for or printed
by the stats debug output.

Update the counts and event string tables so these commands and return
codes are included in the debug statistics output.

Signed-off-by: syncrain <iganschel@gmail.com>
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

