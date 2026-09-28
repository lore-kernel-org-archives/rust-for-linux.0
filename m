Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E28364E89
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559111; cv=none; b=JZOia8ItDnmcdEMEoGtbZvYINDpGRCbbApCxjQpbuqasBl9f6kRPKJlNGW/daAm0M8LUCgYN0T7NnRFykOzYrHg/xDQKqYgUN2TQKQD7eNHNmm15JX9FInSF2AeLUJt2OGo2A6dcuGTOrujIoxpKybApWcudZ3KCmb67KhGjs5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559111; c=relaxed/simple;
	bh=7Yw8TRdsC8iJj4zKIDBj3vysMEmn/ITvAglewvj0fLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJLs65aMQBSIp5RxNdOeuinmxPyCZMDgD5wvluR41i87ePgZrJclyp6/gOikgSa/uPwxuvQIgnxd72SevVPTmtx97pSDpiPPOly3DJW0YOIWRrM8kOGGT86FNTqalkRVpin9n32UfSW1OweBQ/fOPuwrdFh9pQxjvDocyM+V9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkGHfmbL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkGHfmbL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso8315535ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790559109; x=1791163909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uiz6c8lHl0mIc3Nv6bMi5cOROWKCJXWfj0lE81TYGfE=;
        b=dkGHfmbLQWF2wKUGgut6yaKBc5sPUISq1EZllNki4hgab3S9O0TyAv2+tYqCl8Kz8x
         SmKi+46sWTx15VGh/CMIP1O5BP1nIu7oHWlL4XVvTBQlRwwA6+XZHRRyzcThweAOBGuP
         6HLg1n4O7rmyM+RI0un6ntqcDrkh1QNpdEYz87v/FwvfoEtf6nldNC4RgUp4bi4hvPgz
         nc+xcpDSCa9x/PBdcUfH8PVGvSsvZC2U/VVsphOj69jppAcdeFlt8GQ3/03iZdw5QAPl
         bPpeucj+WxFnci5J6+WFzdKJOHUvtarXM4PF0aRov1CUshNkvTu/5Q4Bt9Y1jXJvHZ99
         p9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559109; x=1791163909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uiz6c8lHl0mIc3Nv6bMi5cOROWKCJXWfj0lE81TYGfE=;
        b=K1WNo0Ts61OdIPZymYIse0LndB1QHPi6SKcvgX3KpUlrfT4ayyJIO++cXip7jC+ifK
         EVbEKg4nLkeBYhF9gWSqlc03wU7VFz88KRGF9xJnzMsl+i8UVyATkuosIUQCGsgc7lJ3
         vt13nCEgnYtjuEzQHS6FXnOToocgIFlGciIjWh5EO1ZHPx7ncbDSUKDXQO1kGFNHRVtu
         kzIjv4h1cMTpFb0xXw2+IgwQITJroPJt4fm7MfK2sZ6GbgJ8le4cIgbK+ujm0gcn/+sj
         OUGn4jdm9705nQGNRTU4BOWOZCuR3tH6sg07jupKIZebER4N1Toe24PFR8u6yelF44O9
         dYKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8aRMzGj5mfR7TfjnLInRr7abFLPxfEC+BabDOMG+SHOiw62ZCEC+ZZskOI7WxBbgcSmFmr5cJStP4vyKg+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbuyFmP+vVPa86r/hxYZKlw4a/P+YIvxLbp/PXYWhjlY8ElTjC
	I+V6AUuISBKPOT9ddqyr41BbORlJabEYb/8mTkccCAORaIZqWOL0JgBB
X-Gm-Gg: AYBFou1qQfpOVxr8kgCrYSkw/8xnWOqPyRDw1DywxRJiSIPBK5WKeYX8yKbYmuBxrJq
	CdFXiU+ob/Nnoh1+0oBoI3tgAiDjLDCdhXqPzOeoEiTWAz4aWOub9PNv3RhrDAPB3Tmi0WW+i5H
	G2waDR/lrSealAK98yfZwh3KHBVQ2dkLAoto8b/oG4kLM8OW80i2iaPhXPF5ZqdQyar0zUY0mUL
	NtD64wbSqLSD4IWBCACioR8bq6R0Drn3R8a2oHV2YjtXZv8JvLEUPgVZLMbggpWeBgXa9cYtmGq
	wFRrS0YlpFV9+C19fp/3H0UQcLRSxjOe5X/cE41xT0pOOHYu1KMV6VeQ1eVoMzNXmYagKwPPEh0
	qsThPBA5IQG/VIVWgtwQkZeRcQF1+KV5Z+9cc3lsow26r0ve+5wO0dL12+dpI9JgmYcWLgqhG3l
	l6irBzuEZQppyXYMNierEj3JEK2VvB84xIyEwopmJMx+jYJdur7NkuuKd3sMjLXvh4UnZSc/sol
	TFX4TYixwwLwagm
X-Received: by 2002:a17:90b:390a:b0:3a2:b0c5:5c92 with SMTP id 98e67ed59e1d1-3a2b0c55e60mr1570049a91.6.1790559109255;
        Sun, 27 Sep 2026 18:31:49 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c719f86fsm14951084a91.7.2026.09.27.18.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:31:47 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: djbw@kernel.org,
	linux-pci@vger.kernel.org,
	bhelgaas@google.com,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	akpm@linux-foundation.org,
	jic23@kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org
Cc: aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	ojeda@kernel.org,
	alistair23@gmail.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	tmgross@umich.edu,
	wilfred.mallawa@wdc.com,
	alex.gaynor@gmail.com
Subject: [PATCH v4 21/22] rust: allow extracting the buffer from a CString
Date: Mon, 28 Sep 2026 11:31:22 +1000
Message-ID: <20260928013123.566184-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928013123.566184-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928013123.566184-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

The kernel CString is a wrapper around a KVec. This patch allows
retrieving the underlying buffer and consuming the CString. This allows
users to create a CString from a string and then retrieve the underlying
buffer.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a556788bcc5e..3fd8a218547f 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -870,6 +870,12 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
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
2.55.0

