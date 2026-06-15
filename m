Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424DD3321A1
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557612; cv=none; b=oQm5ESiv3mZrK7Xaj6em1X3YT8gg3OBIWj1ms2Fr7BAJLBYQhZWeRqowofqmIE6PbLbHM6YagsFWciGbAeK0N3OMwLcmPcoHGOfaBccmDwnTUnnsbr/IE1i5kH4jyAK48xjrUWd09Nql+plMiWCqJL3B41nZ43gVblmw9tg8rHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557612; c=relaxed/simple;
	bh=FY7JZGImNTvxn8dnGWvuvXmcLUESsMho2m/hquENim0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l9Sq0Pz2xI0tYTyw4Z0CzqGtmkxFTj1HYh+nbgVOnRhwIHzQBOVco3JU9VIQJ4+vX+UNDGmzFm8ApcyMK2ISJ9009WxXaDqWks351pE9K0Y1RjqfgHCAI2fxaR213uYpwc+ILN6VkhTdMgYYmZfU49wusOpVuSU6xYRxBp35MbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijggp9Mo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijggp9Mo"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842273a2c4dso2559490b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781557610; x=1782162410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbbi1IcZJaR9ktXMK0nloWLl+ZLOkEfUS6FKctRydbw=;
        b=ijggp9MoLKtFEJxhGC5Zin/mf48yCN0xxGOzNEUfkrj9t4oYgK7Aa0hTNaTR4hJMg7
         m8mTVDWCxTJekd7WiG6DZbbYaJp/Cuy40H8clYh303CFTdW56zAoOQJfRsADxhMThG7y
         T0XdPX0pLxqPDRn8lW7AVTKshozme+2BuGDd5Mhyk7tb+cxdX1EWw7b+JrUXboM0Kpqp
         agYoiqjvfpp2NcxKCAy27c7Sz7A1z7cR5pGOtxmfI7ll+YxwD2ngo0df9qiC3RjbkcFd
         oVhSi7GTLhX60OjzgietlIpARMHI2XwVTznlO/KZkKvjpA5uYX5Ap91wGW01UiMVnVIq
         QzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781557610; x=1782162410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbbi1IcZJaR9ktXMK0nloWLl+ZLOkEfUS6FKctRydbw=;
        b=q9V6ZLr73DbvLX3Ic2KG7L0XIVotJtVEW2NI/bgBT4M2UYDUafP2pTYv01PBHews+M
         XNxEIKRqtrqDrp1lkLUUFWhkUKh/ha7VjI3bMwr/2xOCK0gMa+uj6LSE2aeFEZl9PmNe
         noi7xG06HyGP5JP5ZQw27n463gj+tpMeF9gmvFMKUxVUJVw/263R+ndiUPAxbpwrhTp9
         U6KjhM0b1NfE75pFbhFAITHPITcd680cUa/5LyUlm/87Ugt/WjMkdPH46VlMjNhr9twt
         JgcW7ouCDqrUjWgdVM4mSeJ1cNVEbVcgX4uniZRIDDucgML2F7XUSNyYIYXZxwLB9VpD
         sEFw==
X-Forwarded-Encrypted: i=1; AFNElJ97nos8PISKT8sa1kB6x4LXM4NWn0/t5PjvOkpfBTXLK2NRKV0Qv9q7OI2ikbZ47F4+YU833RKUnCBWEvFFqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCfGSi27iIn4gN6co8R74JjBeNGGAIfaGmJCHbab5/bd7J8N5
	WTI4ZUIqTvq2b9kc/h9AT0WGFN6LRC/DItoY+xA96O74URBISeRZ16ur
X-Gm-Gg: Acq92OFs7vkUb8Wz7vh7ccQF/qhx3qWUfPfqBbR6LTRslsLwnAv/Xu7+EWXdDiRwJmD
	kSX5IZMmt4HQhclZEeqk1D2uzLA8yRD4M6jdfJNiM6Qcgs5OgCN9cBqvu7K/zJRaY5WGw2126W4
	WNMDlduCYh0NuDa5qU2an+z6RplPs51bhqBb6HlS/QrNRiQrmu7+3Vcne1xJuaKE5wuFFsaPaQD
	+SPwJ1ChqzwR2tek+4cuds8dVtwFYjJx4lcApnC4qo6cNOKRA9oxqgvUy1Ljg0mDcQ4d7nnTWYm
	NhqmSn6rI0DgvHlg3iA8As7KxpFg+pQXmDgJC3ubmq0VttuCjnyLQ3thahBZYXeFlMSRE5o8Wg1
	q09Amc5JSXM4VbTrQQSEgymrYaixnbDzY3yahh838aw1MttqlEmz3piYBhUIc301ScQlzTQkmuE
	imGxoxBEpN5oRtrkm3IS2Na/cV7IdY54d1NQHpfcftGLPM
X-Received: by 2002:a05:6a00:1c86:b0:842:65c1:468c with SMTP id d2e1a72fcca58-845153dc082mr525812b3a.7.1781557609685;
        Mon, 15 Jun 2026 14:06:49 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.251.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf2ac9sm10879777b3a.21.2026.06.15.14.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 14:06:49 -0700 (PDT)
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
Subject: [PATCH v3] binder: synchronize Rust Binder stats with freeze commands
Date: Tue, 16 Jun 2026 02:35:16 +0530
Message-Id: <20260615210516.513-1-iganschel@gmail.com>
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
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
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

