Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24F30E858
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781556696; cv=none; b=i6ynVxvJeZ1qOsqRKMKERgTwQfSIpb0Rzmkno7PRWAuu8FyCabWBjLM7HdW+422MM25KdkCs7A4go+fymWCSiBm4WE0JYghaugYsimufzIdmB7MIszdGE7s4nxuWzBjMdmVgbsyYaM2HCBaMwFtK42/9GwEupUbrlTAvHHiRaNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781556696; c=relaxed/simple;
	bh=Rl7I9xOCVrZguHQU+BjRdwKnRyv/OqVuOBdl/mRIb3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MTjbsEJ65D8gaACQ+h3jkbLryrKm2vb8SJJXLtXhn1HNWuZOYV/u9ffVslBFE+qQ2zYu6FQf3Wqn+S6lUJ/fub28hx1yPnhVb9z6s+Zw8CcLas9Q+hNf/e8ZwqmYIDXX+f/kNMlJx05UqeShd63Z5wFngcK/yB3XJR7OTHImXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGvMMlOu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGvMMlOu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so2786579a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781556694; x=1782161494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7sW+WFbuyfZVRWJ3EqrZpVQOi0sZVNs7Mh6wx4mjxE=;
        b=eGvMMlOuxKjwPYQfbRQOGYA3laFpfumzpjjbn8KuO0RtdSem+OMHGvuagXe06voSUg
         wFhTfzeq3CyWuX/M4jHonuADcYk0ClNbACxwYxivja2qkRCJCMP90P4vmHOlMSwVoXcP
         RTNs4ijnWAAreKryPv7USqKYCR7uxDsf8mb0/5OSJjdEdtp1cdKUyceUCRVCFRDRpw8M
         bJ+9rzcR10OnLj64gdYszPT7vTTkLq20hl483951xozKN/MVm/24YfoEnovy4sWaDmb4
         F4ALFlgtezPaj8n2+KMqkQqE0A47xef1+XuOBkdDoyke59UOe4ezZ+PjAFyAEhJD29ng
         w6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781556694; x=1782161494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7sW+WFbuyfZVRWJ3EqrZpVQOi0sZVNs7Mh6wx4mjxE=;
        b=ddR+sHEZnclL6bDImAvj+qlfi3wx+/xDzlZCvkEl9l+bcvPmwRbsW0RfLKeUfSDHVU
         659/htSAhVDaBYArpf3RD5byBFi0LWJ30t3aVt4irf0Q0gHn3t9LUsgZQvtpHB0xjzHh
         jxg0cMRQIXL0L/jmuKYP6k9SwpJ1evytstR+muXn6NAxbhlPnsYzifTcjLRmcfIGE0p5
         qtslvBsgz1RYZa4mUAESnDri+01CK+RU4TZP4wuDhvyvQ1vrN2r1InlktlZri/anxmkN
         MVolFSu7bRMySubL6mnrrMEKLUvZyzWRFCRS9p+ztpubyI3oaDXIbLpLzHsjho303BNB
         QHcg==
X-Forwarded-Encrypted: i=1; AFNElJ/0k6l5yBIGvF+bym5yWtLsPtCO+fz9GvG6PEnq7/2KihXabjoMIOrmEkI6cAbMmh9PTDNKMNdvp917TOW7Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlsBoHWwVgMT1eSlgzNDNxdXMOP0N4lkF7MyT5nu9txrcFfvMl
	Y3CetL2NiZZui7GIhwskXW4G2Zzrqx/wAs+DrC2KVRTGWvaO9g/41VrD
X-Gm-Gg: Acq92OFRwjRxee6GNGxsDOuaTgN8HTcDRALzsN+bq8y0314KaU6xYOoEwIfLuJNHQF7
	D7jA1mC6/d1ajqpxImXZMIxhS4pqED9sE3X/jVSdeMWb4K5V5cMfuE/GGt8tQQPTuo4e25lpeGJ
	b+Knr8NR+bXLfq9nYf7FTAexZTTRDMdiHRcJhmsNScG7ASHLNDltQGs6t9dvyhFYUrhrNV35AC7
	KEknAMlg9df7v70y7e1YFdJWYhFHee4OMKs1TahgOmtIhIRTmJGpD1v09bo2VDuSB/c4H3VdiF6
	4REBYcvWJ6Nx5IPemCxGYkTPLQ7tzGcmJBgayFFNJ93EGYkDVaSAESH/ZCZ+4jBhLBtkm6W0GJX
	3rtPBykCYhOsMHuF43/2d2p4UHOdK2ILG+mWe1cn9nMoD9fLpaKZVu1z+Jm9KAuLenYd7tPpYbe
	EjapWych2krAZXSMD3B4DuW9B4nOm4+1/eonWK4XrHHp2tbW/JpG8mudU=
X-Received: by 2002:a17:90b:1c8e:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-37a03ebeb89mr17459642a91.24.1781556693846;
        Mon, 15 Jun 2026 13:51:33 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([223.235.128.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5222e042sm549286a91.16.2026.06.15.13.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:51:33 -0700 (PDT)
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
Subject: [PATCH v2] binder: synchronize Rust Binder stats with freeze commands
Date: Tue, 16 Jun 2026 02:20:54 +0530
Message-Id: <20260615205054.417-1-iganschel@gmail.com>
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

