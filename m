Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59B309F00
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 03:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210373; cv=none; b=uwtT2yudn6OnHV/WVT6Dh65mNJ2NoDlc3O2vFVZqnPReuuraxq8GkUlg8FXKadMk4DqPwf2eNYoKFKUYTim/mXO+3ibfvdyWVl16EXs5GwHzBKgUhysDcYVATVNKQY2i+bAPi/BQjry6rEszT1Vt8TViFhZLjBJNKhiBf6SAkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210373; c=relaxed/simple;
	bh=j3lxGogAEu2m4ODiCYf4W/cmhvK2xVIezXSiFbrV+fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eE2Ygod8Dr5lDHHKlDqGjoXLoubbi4bJHuS7CyeLZ9BPmjeQ1FwJyfk8E/VtVJmAnrg+vhEzdgjTFOnyBK66dcbvV6hpq0AfVsRz3Wufire2Eob5/Bm1PcyJcYXrJ71cB9DwevIgfLfcjPmiKF4620eR9EMQx6ENNWBNIQog+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYPzEgPP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYPzEgPP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3664df32e91so105168a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778210371; x=1778815171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV+KKNzPOZuwOP9jOwich0HOmZDeWpgxJKGJYxOCc1E=;
        b=SYPzEgPPEAISbTP4ZX6A+emoUo22JWeiwLrPlZlR9DklqTVIl8Z557D3b2AJ3AEb/W
         RX8DqmMrTG3QX6anU7D5OmBzEnwOLlwAFDhPFCXLylLZXegujZmengVO4xPbqLqpF5Cb
         S3QpS6vZEkzsY3oKH9Tj3gFmItjnpHVR7iCNog1CHZovwXVHlNfrTIk1m3eAwTdKFLUz
         Dsm8mx7xaFU2zv326821qnQsrMJOpv6D7YokAZs8Lq+tDsyNwkDrC9GaQUvyDN/vPXfi
         f+6eNnwDKYc0LpEvFaUGOAiqTyk6qSKDSi6YfV191oQnTqmuYsBLwYSRelm6SRZbxE+5
         VjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778210371; x=1778815171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KV+KKNzPOZuwOP9jOwich0HOmZDeWpgxJKGJYxOCc1E=;
        b=ERKwtFd0zEm+beQdALBjoPq/2kLXRzaV7X+0dny2VD5JJ6PBJXYRtiYVgjsbWGwcms
         RhNu8difcIOGls4wuqDkdcORBoyK4zBt7jET+xKx1+LW1yaAQP+ql11bbdDKb4yNfpQB
         4RKT7y5Jx/A5SCvSqmgOoxLjPurQ+b7QnO+l7vnmeuzEkBsdwwP9Y4IA2Td1H3+Xe42n
         ZMjNV8WpdIZCjNflEXO8sa0dRXiTFYrJuFUHOw5OXMAhYOGC1Gr+8F3j9e3ZconY2GTt
         6dpDJHo5SSnY1bBSlQwGFU2xSsEkOUijQD85lPr+rsu2z3eKzK7enLXKpWDac9iivvat
         /BzA==
X-Forwarded-Encrypted: i=1; AFNElJ+8ClWdqoqXAANKgXomeA8lE3u4aiLebIl+cTFkKTOYxLloOBm+0WBnpgSS5t+PhiJyWncIS1YW8EUF/A6y6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFiB6kasEzdMKOktLsf28pbMr7ZPD3vkUI581Y5LSFVBSqbsK
	J38afnWqhG3i1WRy1MKORSl9HOz93U3QgJvO0FAE02hf04x+gLZwca5f
X-Gm-Gg: Acq92OHeu/3gXJ1snCYBDck9uqzu0xImtKvzLse3RzjKrmLWwWeBwJBnphalAUIvvdR
	TEBw8NRry+Xh9tjqI4OFH/Tu26aHdnrMXuW7PxgVytM/4yAgZJM1Za8g+wmLs7KQw1HUBbsWxUN
	u3ZO74tJIOTMSMXAUO4HS1ERSE2k+rw2I1GZgY5wzWNLt8SWJ+03zvnd+Fdk1UqZOWPJ80twzlF
	lYBb8t9yNzm/AOzbAJxCriRIfkWvQDdmoGsSWqrZRgEjGdItJsQ1nThsOXCnkzlN0Ld8G3MpQml
	ExuVp2hjJO3RRgjY1N06ykLYOcAqdw12vfbH/b951COAqNSed3OHdn9v1eEX/RTVkiN+WpsJ9oH
	rwtO6VUJKYTbFuW9Izdha1oalJfSJgXJ41EeS+IRNOSoBjNuYB5e1+X+kjuiQ8j982PBf/pETOe
	zZ114Rneg40nBdaTLAugdwmL32WrDbGrsBnuby6c/zubjFKSJdgww=
X-Received: by 2002:a17:903:3887:b0:2ba:83f8:7b7b with SMTP id d9443c01a7336-2ba83f87cfcmr97081925ad.33.1778210371221;
        Thu, 07 May 2026 20:19:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm3220685ad.74.2026.05.07.20.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:19:30 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: alistair@alistair23.me,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	Jonathan.Cameron@huawei.com,
	bhelgaas@google.com,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	wilfred.mallawa@wdc.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	ojeda@kernel.org,
	alistair23@gmail.com
Subject: [PATCH 17/18] rust: allow extracting the buffer from a CString
Date: Fri,  8 May 2026 13:17:09 +1000
Message-ID: <20260508031710.514574-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508031710.514574-1-alistair.francis@wdc.com>
References: <20260508031710.514574-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

The kernel CString is a wrapper aroud a KVec. This patch allows
retrieving the underlying buffer and consuming the CString. This allows
users to create a CString from a string and then retrieve the underlying
buffer.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 17070dde0e35..764dd5c695f6 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -856,6 +856,12 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         // exist in the buffer.
         Ok(Self { buf })
     }
+
+    /// Return the internal buffer while consuming the original [`CString`]
+    #[inline]
+    pub fn into_vec(self) -> KVec<u8> {
+        self.buf
+    }
 }
 
 impl Deref for CString {
-- 
2.52.0

