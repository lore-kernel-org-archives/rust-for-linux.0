Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C0A65192
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558300; cv=none; b=AgUijRz564wDroVpBG+LltRGMcU0GOgPLeeWW6pY0JRGCefKT08fSI+zCzgEBVNUDV+nT4pi0/sTAZH5vw1HmO0X+PcrCcM1TaFxD5RE50VXsBzT+aMc8k4CsVmG8Ha3tAjwuEm+k2hd5jfqo5C0No0ljcmzVxXjkjj2zjumL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558300; c=relaxed/simple;
	bh=5Xukz/OXZQWbiKF7DS1cnhRmzy1W7GXR590opIS6qZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TAWzkPVqVdLdcCbw+7E3OX+iZ2Hee4VZgQZYTXUN1r8SjTeru2hb2kPL8qCFCCrCx87G2Q7qXpHE/fUqsr/4HRzwTIk5d2CGRy9S81Oi00Gc5qWrybazzlY1gEjHi0RHGZ9s5Yk4qFuM6ZT8h+OqtvdoDhftj/RD5CxdHc6Fsrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc/j/gth; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc/j/gth"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c35980fdso39467495ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 14:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781558299; x=1782163099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFK6QJv/HA4oKZlAmpqc50yBHWUzm8bLbRs3ELX68/s=;
        b=Sc/j/gthhWgtWskUtCRX9mfp4opvUnl9EoApvhoNH5EQOYYL6LRlTSxL0WzJYKPHO5
         dHwLS4iq/6wiLgv21n/lYG4ZOSp1fTFngo+fmMWEzKNXC46WTKM9XjL3RzzMbImSmmU4
         oW0SSsaLir4hYayBZzgGIiQRjH8fsiec7cFKZgQiwNOkWpiuhbkmHJQKlFyyEntbd+40
         +G3M1GUkceFlXC4rp4aNSUPr1FsIAGHpMlp0nw+hpXiCdNXkGUPcAKEeXhGlAEknLZ9G
         TlHsUWAgKu+mbdQs8g2Pe9SDgizGEpUQLszxPU4LKyU1o7PSsyOCSSRh6MMtXsTTrUSo
         wBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558299; x=1782163099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gFK6QJv/HA4oKZlAmpqc50yBHWUzm8bLbRs3ELX68/s=;
        b=ii8nvBY+Ks9XFVe/U0txfPs54WXbE6TtozgFyuP9th5/4CHsGPOf8Bl1lyXLHEUDUS
         ZPLG3Le4xw59Sc8+pcd9bo+EMXQoMKNe1o8n8oNmNdkSoIEUGwnL8MB79SzGiHS4vXYj
         ZSjtBsks0wfMxExVJ6C87FgLLM3ozA6aQyEys5Kcp+fr86jX1jUK1No/5TQG31rUUhl7
         Vpy+sb8FCMi7sdCiPTunuFIQ6x/4QHW8kMb7yxunw+0Nv2QLWyx4qc40vHUUiF6+/JQu
         e/VmXbl7ojjMDeeUUW+blJN6DoYjSqpbwbMpJQqtmxaFDZpAJumaJVSsw3hsZvxq26IC
         lTfA==
X-Forwarded-Encrypted: i=1; AFNElJ9jpTF+C9nnPIx6KY67r3vSVr8/UMCgOwPAJmXt70SPa/uG9xtqITmI+uuaMj6sRhZkWlSEX2E0PE4MZ+JwDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvjQpy2gWqQmeQYeL9mcwMbu10aVMeSrItmP4Kko5WN7UBGTtO
	SNiZ6mSEveDOPVZ6OAsPdPR3X8wM8IsmTmcfij+WFuqvVRItyW7+IPmB
X-Gm-Gg: Acq92OEG3gpsyimQVJfS3AU7uiSsYoLpm6Ww+9MViJJJg+ZDA3ul8PGlOoHlUh3Wpgu
	lsyyzbsLDfZlwYl1KLciYrhrtFDmVifflXJys0a6FZIL9zDfDUIcsqkA1gxsA7AycnJtjzOxTtm
	Fm+AZzaZ0RLktyjjdDGQenNir62Ew4Ls7W9VJoAea2hMvESRUZZlVJbvPWuTi6raHUj12whh69G
	6pOWP9Vsp18bZ7cip8H1GyeBrpPOA3Asp7vgJOpIayUdDl4Deb5GdYjjg6cPE2282Y8w+ZcEUXS
	ri3xtgrh67Anf1wdf8zWQ77RyA64aQ73Xfy+/pO/q887wADn1eBptdo8qAFDS8rSdp2gd1c4swg
	QMRHV2sHW+cDx2L6reR6pXy+or8KGbL13trMMn6QQ8HWghV/cif4k8So51FQBJyN3xrj3yJjgKx
	mTm4rAh1ncCSNHh5p0I6jMvFcgU5bfoG7pPNS4yknzT5jm4nFswwOba8w=
X-Received: by 2002:a17:903:1450:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c69a1ba916mr9475405ad.31.1781558298938;
        Mon, 15 Jun 2026 14:18:18 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.251.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm105647265ad.6.2026.06.15.14.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 14:18:18 -0700 (PDT)
From: Keshav Verma <iganschel@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: ojeda@kernel.org,
	stable@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Keshav Verma <iganschel@gmail.com>
Subject: [PATCH v4] rust_binder: synchronize Rust Binder stats with freeze commands
Date: Tue, 16 Jun 2026 02:47:43 +0530
Message-Id: <20260615211743.734-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260615201737.262-1-iganschel@gmail.com>
References: <20260615201737.262-1-iganschel@gmail.com>
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

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Cc: stable@kernel.org
Acked-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
v4:
 - Rename subject prefix from "binder:" to "rust_binder:"

v3:
 - Add changelog for previous revisions.

v2:
 - Add Fixes: tag for rust_binder introduction commit.
 - Cc stable@kernel.org.
 - Add Acked-by from Carlos Llamas.
 - Use real name in Signed-off-by.

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

