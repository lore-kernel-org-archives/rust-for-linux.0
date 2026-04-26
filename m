Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1514B977
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777175223; cv=none; b=hN6lCorRen2Fx8jCt9gSg2S1gDksNlBvOd9TjW+VNrsP9EAom09LtDenKPhx8hocHrBmwHdTN7Ujv/cB3ATVGIcHmiI6ayrX5tIbaiLVcim459eUp2oewCh7gcglkMww7SCE4A/Az9Sr3JWKhmxRRT3fV+B776hoaV9nnZoHi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777175223; c=relaxed/simple;
	bh=AiUKYr2jJ0XvXVOYzQgFeNe8jCAZGHQ2c7MqLBW25o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MdurPwiF+jY04s16IfMb0qahmtQEPwwFkqA0wUEMgUn0jBXZJmd8tZiZhppw9VxsxxxDYiZebhcrrOK6O2tQURSdWJNmmSvCFe3uYj07mE/BVLkYJu87TG3MVJyWPhM6/OVfVPkGL9XINd9v7Lbfaoyk9F25dzDGZQNckktFILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQ7Ldm3Z; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ7Ldm3Z"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b788a98557so40784375ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 20:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777175222; x=1777780022; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDfUEqqpcjDUqlV3d8D+uwaZM6roODFD9XWd5LBkiBY=;
        b=GQ7Ldm3ZssY/4p/T/FQZo9bkIVdPbahRpxG3YWKzwLNLwqP25JzzXJKDzHTrMPVfOu
         AH/PDHkdJzEcId1nJI0lCg4f+mtenz7ztKhlyAjmf29ntzt5ROrn8K0XfVviPThMneO8
         V8rJFOLmMGAQAmFD1kE6u49wlu5EsuZtIFyqwCxMMKJcGFUsdkDBYVqZVmxOCMJ/Hcqs
         bFkogL/G/w5RahKbGNcbhgaIlnOUdQhX2GXoaf2x5hf47Gd1mWKG8um3VUvt4zSNRsqM
         rMK5AmP9kZqZcPy8hr4E5/z4WlbKJEQBnwAEtFlA2bxE3XLO4nBBDT09m3B2ffFd7gZq
         C/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777175222; x=1777780022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDfUEqqpcjDUqlV3d8D+uwaZM6roODFD9XWd5LBkiBY=;
        b=GIlZeJLsN2BcS7JLcxaQ2agHaZW16nefardmN9uxKAulxDlPcpHa1u2IWr8T3VVEa8
         8KYownzCPAyuFGXqKnIgWaue+dWZsX0vOwc2SZKOT1tuxk3yVFWp9BdANraJ60LHvipt
         1Sqh2cK32FR99I5D8wNaCa41bZV7MPU+RM2ToOhr20z74tE/FpWg5h/oN8kogEbuGKx0
         mSiYE7fNi+RUddIuFoi7Z4Itk/yt+wMnyiZ63Ece0OvOl/KRUGsMN0tj0cASQXtqdVGt
         eHhmUoMsjtuJrhiPnhMbFZ7PqI0o5mrHkJCLXZ0+TT67MfrmOml7BBBLX4qzF581ZluQ
         uSmw==
X-Gm-Message-State: AOJu0YyLZlTiqmnbc9ygWuVqmlyVdrJ8fM4luU5eXf5aoSyODIxjE1+r
	iUhnwN7O9lHshhu1RAVBer3N9b4Z0ZwhmhA1F5WYEkQhBbxkknqaWaO8
X-Gm-Gg: AeBDievmvxvohSwXAZa/1Ui898Of6pR41YGM4mm32SVB8bynMBExcXqNQzpojH/SK92
	dDR5Q4sFqxazJv65SXdUU7sQcpZO8I2C5/dhbnQY8SNVN3Uoz39dQMWB+k4cuVXiHAgxp8QQfUC
	7iNA1y2uQTbIaZ+7wKUEoU8T7nj3QAuzHN+uAN0hS+AO3pS7mkqUNTi3QruKqsP85o7ze5SA3x5
	5E/bdmkvWdjSjsqsCjrK54TeBMJDblr8bqQnas2iocX+AqQjNi7ene9XF3h4bc7imtfUqRrO4mV
	ILW56pB2vR0Ndgv8U7s5y7qzG/3hHoMMWjZbVpoURkdHnse6uZZGz0z492g2H6TnhAjtP9fehll
	mMaEX4jPHP/DLhdUUUzMYDgy61M28FeT7KMzBs9DkGpPjnPjlVRNkE3VOswAW2nxMKWtg+CMO9r
	xJdp1U1qMyskGzaogpnYHI7LLBzeqDAbQUQoGEd8hJ56yuSJs=
X-Received: by 2002:a17:902:8649:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2b5f9fbdd39mr289806875ad.36.1777175221801;
        Sat, 25 Apr 2026 20:47:01 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa494e1sm265589525ad.35.2026.04.25.20.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 20:47:01 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Date: Sun, 26 Apr 2026 11:46:27 +0800
Subject: [PATCH] rust: alloc: add doc test for `Vec::from_elem`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-doctest-alloc-kvec-from_elem-v1-1-e364341a759b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJKK7WkC/yXMQQ6CMBAF0KuQWTsJVgPVqxhj6PDR0UJNW4kJ4
 e5WXb7NWyghKhIdq4UiZk0apoLtpiK5ddMVrH0xmdo09d403AfJSJk774PwY4bwEMN4gcfIzlm
 4XWvNobVUimfEoO9ffzr/nV7uDsnfk9b1A3nsWgOAAAAA
X-Change-ID: 20260426-doctest-alloc-kvec-from_elem-bb8eb3782978
To: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hsiu Che Yu <yu.whisper.personal@gmail.com>
X-Mailer: b4 0.15.2

Add a doc test for `Vec::from_elem` demonstrating basic usage and the
zero-length case.

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..f5d213b4f715 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -792,6 +792,18 @@ pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), All
     }
 
     /// Create a new `Vec<T, A>` and extend it by `n` clones of `value`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let v = KVec::from_elem(1, 5, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 1, 1, 1, 1]);
+    ///
+    /// let v = KVec::from_elem(1, 0, GFP_KERNEL)?;
+    /// assert!(v.is_empty());
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
     pub fn from_elem(value: T, n: usize, flags: Flags) -> Result<Self, AllocError> {
         let mut v = Self::with_capacity(n, flags)?;
 

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260426-doctest-alloc-kvec-from_elem-bb8eb3782978

Best regards,
--  
Hsiu Che Yu <yu.whisper.personal@gmail.com>

