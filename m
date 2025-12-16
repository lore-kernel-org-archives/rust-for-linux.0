Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0262B9BA
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843782; cv=none; b=onHPdZcDVAS8a5NNvf/MaHiAv3mvplttl5bX5m89N5hbmtenVG3xD2z2CDDdGSDSpVKrIeA3Mzo7hj84cKMvcA8iK2NsJqrozzA0X1lqn7UYeU7GPHe1dYuT5LTAf8k3U23zvTFiz4Hh80zvsn2doKtGHFgie1aw0nqXxtA+Zxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843782; c=relaxed/simple;
	bh=Pgo8/auMpPHYcZmbywlPYU8VRCWvbwGG/jVaZVIETdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3hzcv3GwCQATMntUR7sU+uhGTmf8vis4a6K7BjfSJXC9B0BEUD43JZPjmlOr2cYXKWcGi6sQkI2rzV+Ns6IMGzh/V6GqpEE2iIywLgH6kBN0NqFa1AZNWC3J75kFdLyJM9QIgzodOJodVMEuqoh5FOdwug4PDXyA8DfOdav+zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhyEkR4A; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhyEkR4A"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a099233e8dso21064025ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765843780; x=1766448580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc/n4Kvzt3JxBjbnPQd1tHfmhLuwNCSDwgC1f++vkdo=;
        b=RhyEkR4A5FPZc+buBrdmncfuKTHplAwZjEgSKwKNfUQXFNg6jq5LZ2mQB6AIBz+XHy
         EGyc6byA6WasfSmHlVolgs1F3MZJu2pGKq24OO1wytcc3y91k0WWkF8SuAuAhxxz8HdG
         6tbNwyrvIm7woqxMl3FH7ni3NsIBpnc//10QrNtKVv/Q3yiBJxRLUyxH9TPntdx/xjAm
         aw0CsloiRCuhiL9jG4oRbdWWvY/xqK0c8/S8gpUdcUoopAczRCjb3pGOdvOXWgziWPD/
         1YDjYRB65CRrACFPIy7izefle63G7Rsn51wwil4PUeX2Yg583O6jYAHEwB++C1crI4VB
         CpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765843780; x=1766448580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc/n4Kvzt3JxBjbnPQd1tHfmhLuwNCSDwgC1f++vkdo=;
        b=JQvIu8066O8PO5ONLxOztvNryNY4K6GCf0gX0rSO8QF9YhZvTIi1dfDMt+9qo9I8dk
         xmxx9doRurYF8feRyyMyfD8DfzQyKABORIZus+vmK5Xfl97Ra8xVD3G2px2qgls6K/Rj
         eutL5S6wXXw/1v7/VOEybgDGAuJZ6nPqbHSF8QaaBMRDtZxFBPBoFdJ34aRz6G1QwhUP
         fCuYbZpIv/oB6q5Ks2lYrSzqseuub9ymj0+6Y7nO1dBpcQZvVShYkKBTj0aYkY/Ypryv
         BkNREVr6ERh5ccpHQu5QGiFStaRyypgXk6vZVB14dKtq+J9aZYfjEHqLiO4KrARGY3GA
         ebJg==
X-Forwarded-Encrypted: i=1; AJvYcCUfuIbkQU6nINYSg2I14c3BLE2H9fMUwu5fcr6/437cSeFX+2wFLiKnn7lossUKTidly516ZLVnTaera4q0Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCblkM5H6t0rD8IxvUUhRYDcIp1Ye9bDvVqifqa9ZGYv/nQCvp
	uhRnExErKbEryLryOz3y7/0WyoTHrAkaPIRN0OSqcrwjrdGXhukwzBI1
X-Gm-Gg: AY/fxX7ZeZ9KRrP3WU0wFCrvtE9D39I1Y+jQv7Tz1/vKRfjgp1mjezmJi6VyG8U4C9u
	8pr0E1+L4wFzdYxEBqU/MBmufmiqA6Ky6HiIUYoctOTVghwKKqy7+RTgQUagRxY0H6HN8nfPD5I
	lawIJ/pIVvpwwXpB8QNXB8QGoDQms5e8d/8ynl2k4Y2GO90jBaP+8Tbi8vp/w6q4QWogpG05O3L
	ss+Wojq/+MtytunkAvLTxgTUebutSrHgmeD6TQrolKFreBqd4i7ftiDTxHz/mnaDMZhUUneBlcV
	YFsANvSTJoWqXE64WMEg2htx6cDZX635v/mCpKc8WvgwSvAzID53oDGO7hfFNSD0yOJvuMtadDg
	x7W6ed/fHMHIIwTQtpzVU9vulKhjuyleJmi+paMZKhfjd/4Ry84qi5rAQ/vwBRwasEpaK5gchrs
	rxg+FxjGUBzaWhyS9t5VEdx94Pu/SwjCf9sOzr98tPP1fOZHIYo8jcx2OmdbNecg==
X-Google-Smtp-Source: AGHT+IGFxq8RgohIU9cFU6pa3JfWvS9zQjxrZvAM+BbAeiI83sleS7vBqvWaHlG2F6T5/02vhD5vJA==
X-Received: by 2002:a17:902:d50c:b0:29f:3042:407f with SMTP id d9443c01a7336-29f304249dbmr121942515ad.21.1765843780147;
        Mon, 15 Dec 2025 16:09:40 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm13622289b3a.30.2025.12.15.16.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 16:09:39 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org,
	a.hindborg@kernel.org,
	gary@garyguo.net
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: sync: set_once: Implement Send and Sync
Date: Tue, 16 Dec 2025 09:09:01 +0900
Message-ID: <20251216000901.221375-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement Send and Sync for SetOnce<T> to allow it to be used across
thread boundaries.

Send: SetOnce<T> can be transferred across threads when T: Send, as
the contained value is also transferred and will be dropped on the
destination thread.

Sync: SetOnce<T> can be shared across threads when T: Sync, as
as_ref() provides shared references &T and atomic operations ensure
proper synchronization. Since the inner T may be dropped on any
thread, we also require T: Send.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
  - update the `Sync` impl to require `T: Send + Sync` with the comment adjusted
v1: https://lore.kernel.org/rust-for-linux/20251211230919.1303926-2-fujita.tomonori@gmail.com/

 rust/kernel/sync/set_once.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index bdba601807d8..139cef05e935 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -123,3 +123,11 @@ fn drop(&mut self) {
         }
     }
 }
+
+// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
+unsafe impl<T: Send> Send for SetOnce<T> {}
+
+// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
+// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
+// on any thread, we also require `T: Send`.
+unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.43.0

