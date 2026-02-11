Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB373469F8
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780750; cv=none; b=ELQt4nrgC735Ayn0baG5OXuAd2vXOnCgnTbzqtXeg7+uGKAfefVJXYmu2/Hav09uPNuHR01MOfTKpf2uFiree0hqndIIx/1mUddLSj9w0uPu9vNvzoKbyNuNwKGmPoX2CZ2jl4Ys+ElOKhhOPDUMDgMwB2aIE1WuB4oQi9T5LeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780750; c=relaxed/simple;
	bh=dNpi1NMAaQ5h9qqbmQ1Z0VBLphRlK4MYeHJdgBkEl2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdVy/Oeyrksg+CJN/vOAkLDLJUVDQO6ypy9m0z4iqfjAKgjalWgZ1BIJgK0VdmKAbT1u1TwGUIwmCkB3CULacP5j+NvRYaSDvmGJtgHg3vB1+iM42bMdcgm/DyUU8r/jCrOBaEBRWDpAsrUCIVNLgWJ/tzfCKZAQHeNXFoFOQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY0cd+sb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY0cd+sb"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82418b0178cso924506b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780749; x=1771385549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hd4JNZlcn7oVuweMnFnRxHFMq+VGi5u1+C/ZJTSOAc=;
        b=mY0cd+sbu8JVYqnTxyljkX7xHNpQ/WPcfvw+VJNyBREzjLBE0ICSuNdsX8PfeCCfND
         bLdUpVoNjPwMKHNmKk+kcY1WbhfZ2Kb/ADA8pgXRqjoIbNzOduTiLZAcrNmHt7ToxL+L
         RlAhYQFBYHXcbeth2C6tUXMEpYfqhrmHt4MJafaUhq/jpw/WTF8IfOIK/lqVWr3LJKBI
         xLyg7g5jwSn7HtQ82Q6R28NY5TNFeNaLUGnHxco9zn6ykzQP2Z+NWysX2XnzQHAUKD58
         cCkgYCjIJ0m/ol+SlFTuVNcCdFP+D42ab2XIRwRzX86FLYZwe8EnTuF6QnwNwBI4ZfEt
         hjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780749; x=1771385549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Hd4JNZlcn7oVuweMnFnRxHFMq+VGi5u1+C/ZJTSOAc=;
        b=P2J+DYQkseBRZuqoTkWxkygXnvGasvRSXZz75lpQX/oEX2Cbty0m/jqepxHKcKswCu
         QvCToh5fBPNRhWbvx9T3S8VHAmczvK1kQEaXVbkEFL0T4klNQsQ+XREH5flgsS7bHjYz
         iiCSst0tCGVX2tZzLtkwcxCRx09QWtRxyyg+tRK40jONIY4zNMgD3pxthd0NDURHFCSF
         swcp32u7WfGeS0FWyzomNV2cfeFhAfXIIU/qnNFeEQ+eDHCWNwrN7R+vKVRNZo4mJwN3
         XoP65fO8vKy+NOJsC7mUKFLS18TCM/CgPDO7JuID1ELgX5fPEDucAQN1yglqPPIc/B3g
         3q7w==
X-Forwarded-Encrypted: i=1; AJvYcCWxzM6XVR/Kx4GDFVkrPq+GkrY+RuPTlv5j8LyVvBu+mSa4prhobo/1OVD4LCtBbwTNJnvn2KDJrQnzsasAMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEu852uTfnOX6Ahc+7aROaYPnCBbOiM1cLUgF+gDBHwD172Yn3
	F9LPd02vzbHPfO5FlWT0wL7gckpPppCsIxGLb7Jogz957q9rut0LuOPV
X-Gm-Gg: AZuq6aKy9X9eewV/4pLZoyNIpMUPZqm1ZJY1al+1RwAICLwwn18GXTM+uy9GZu6BUit
	2MOpjtWoASd/Uu2HKU3GtlE7Z20QSREtB1vgJZ2KhQ4en7Gc5yd2gaGdhmrUDRK4k86ncppcB0N
	LcFrLC6fLpkqmfzfPyGdCz65nnyWru9Z657/tlxy3I9Bu1Q6CIxw4T7g0S8OxTYJQ5vxhkfKrV5
	Goon1jQ5D+7l4kTwMw/JguebWCU9ntIa0xrrUnwDSL88XkAACHzO/2CCkmkXrKJ918i413W8Tnm
	UPtYUb3jJFqSRCsD3yJrCH0h0I70rFakW9iBiCGpcn0ZBPWHtKZthIeiAM6iy5cchMUihah8Ztb
	0SfljbqCMxlHA9c13PqqyRRjnsZlOq1+JneD8GitOfMduPqpK4pam4M2hhvFNwKK5KdVSWNo2qK
	eQiJhKG+El5r1g8dIOIqDS6pWt6zsSmf7BGPtvcMyWw3yA8OapJ5pZ
X-Received: by 2002:a05:6a20:c793:b0:38e:9405:beff with SMTP id adf61e73a8af0-393ad3b6d6bmr16299563637.65.1770780749068;
        Tue, 10 Feb 2026 19:32:29 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:32:28 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	ojeda@kernel.org,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [RFC v3 23/27] rust: allow extracting the buffer from a CString
Date: Wed, 11 Feb 2026 13:29:30 +1000
Message-ID: <20260211032935.2705841-24-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211032935.2705841-1-alistair.francis@wdc.com>
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
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
---
 rust/kernel/str.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..17426db83c9f 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -844,6 +844,11 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         // exist in the buffer.
         Ok(Self { buf })
     }
+
+    /// Return the internal buffer while consuming the original [`CString`]
+    pub fn into_vec(self) -> KVec<u8> {
+        self.buf
+    }
 }
 
 impl Deref for CString {
-- 
2.52.0

