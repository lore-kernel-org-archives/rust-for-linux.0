Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4303C2550A9
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191984; cv=none; b=G6L0u7PVuSCHtEWpIVvmcgqfAlNyQRbZTNDy2tkae7lqNdFGe1O9K7EEM06c1sxVYNmb5OxPYtrN7pEOxBMXkzGiFv/2md9y3BZmec4Wbs5L31d17YF2X4I4aNAsTnzAjarBRFPUNoCKyYG5ckVLi7zoo2IUOi7JKQS5YfIt7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191984; c=relaxed/simple;
	bh=Lj+81o/3csbNz20I8Z+JfMBxmhdfE+7rQlFxU0lvpD0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LezJJGnQE8egdas3PAIGRxdIVZpDCzLVaD1Z/tcPXu1TDicxAjolqq+4MeO4b0Nz3dp4nTT3FUByfrTxaUEBZwQddgBqkb2On7r0OVKZcKzrZqOLAWjXVVnC6/OruaJUZrOs+Mr4oWdRaDLhbRVwbAx0t/VZdpgr+50TqDl7cSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AK6bDmV5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AK6bDmV5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so12524165e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191981; x=1746796781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ3LimRO6FsoGl/TxK5K9OWXXlaU4y1qIyjhkeclqLI=;
        b=AK6bDmV5x8sAyJCCGWbBwGaQzTDjOQfAfMnuE2G1RG5dgZMOSx5wjPBguWmneKwBps
         crRyB50kRIXaYGsbu9zpkUFuzbPJwge8+N10xdMKnJD1oHHyxpaJica0aBr/r5D/Bvru
         XeT/cF05wdWx6REpVIhrl5RODzoDA/H6Rm8EuFX2Pz5HEzgzci/aNxPWqEvNRn5Dnz2H
         vS56YUqFu+QTTUL9SQ6cTESpYoPYm1Q4VaFwsvOmoGby8JSCox2W6EOYsPPYN6AWDbma
         tvGGenNW1IT0PPFQyDpsInjcbBFIqCjNsz6E09bbn6u+sTM/F/YNH85BU2iTqBP0DrC5
         NNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191981; x=1746796781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ3LimRO6FsoGl/TxK5K9OWXXlaU4y1qIyjhkeclqLI=;
        b=GgAyN+kb7MYv1LA7JK5iL7fEOLpHrv4Qrnd2JMPk71FvXlH9c88GDvJSqqRPXBdIhn
         embP5Ws5hC7RPPOA1LIgscuMwuHLTxIULx0KMJ4BBwTd6EcayljCFbxvpY2XhFVDTpSJ
         uBxExiMusvIdiKMgD8xyp0kBfsRcxEeCfGWNkjHL7xOtwFySovCdKbDT+V2W6Huq1FzD
         W54gT7I+ev2fB9uREE0TgQ6ch5GfksfuDMtHZWwL8dz/qMDE+devTNsPGTesooyE7fDa
         eaio02u4RXVbyNk4uvBFqIxABfMm61I+4mGh56aZ1jktKdHdHRME7q6/5+vMF21EgkM9
         xUiw==
X-Forwarded-Encrypted: i=1; AJvYcCV2RNr8QvD8U7yjS78WkW6kHzURCw0xE8mdV79mk258wxFWQIO9gtovNaFjZV+asEMADxbS6BO7T49LcWznlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQb47WVYlbqAT+mUHwGEaRv6UruVNX3wQILCBZGoe/TbS5fAx
	+zGHvthL9HVbhuedf0MLkBWnJnjC8NQXxs+0ywCRjv//kxsFrgF0pQfsEk5UrAg6At4Bs7ikalq
	QMhfMsftSUEhSJw==
X-Google-Smtp-Source: AGHT+IGFdLxIF2zFjzp9LDv0cq99M5Jj0pCAd48e2NBY0712BBTsbQDGWWrFm4DO8buY1w5pxldAL+U+ywHFRGA=
X-Received: from wmbem21.prod.google.com ([2002:a05:600c:8215:b0:440:67d1:757b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5288:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-441bbea13c3mr27862595e9.2.1746191981786;
 Fri, 02 May 2025 06:19:41 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:29 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Lj+81o/3csbNz20I8Z+JfMBxmhdfE+7rQlFxU0lvpD0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZoZsjjKw2dZC0jGRfcHEFHuq451GUXXmglq
 M7JCDXrafCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaAAKCRAEWL7uWMY5
 Rtm3EACMt/dY7679lCwQO5pRx93Tr8/Tblk/48CQMTtgxoULO2h0Ys8lbwNvYWb4Hu8iTcw+Fvi
 AdoHkrVZ5SDVMhUZaBquid58qkpeLY3jF7x5+1ucwuLGg4MvkPwSc/H16dAvWsn1iZ4kbgUgdMy
 xxJ8BkZk6/opyo1cViB+C53NyJmKhwlGQ27SpYZcQPUdsp9nidxj6TP2XGHqebiNCv3LfaMAZtN
 +6Zz7IyzqtUBGUNs6Mo8hdhvdbo3jHDiNfFiT+Py61ERjLTfNNa4/fftNYbwaYwEad33vkHCKLC
 yL7MP5OtHqx4KikIFYNr8MbSHsmCzH+c3bTbVBPTJszmgKt5olRKP/IAhPRcQlRMlQp3riokLJZ
 Fs3Q4772xKrBXrmxpuaC19UXVCJXD0XvaQdM6nw+e9yqIHY8dkVs/6rMpHbulSIepl34jKnBHRT
 lJaeJOZ35T+22/8b5VDHhJLy7kIXT6u+x8JO1/S3cCWCeaRfX5RsrbYYcs0G/cTUiA+Wdfh1AaX
 hjBEIVmpcPYVMNUiof/HCQ0SXuQe1IigIOe3Le8+C/ZncEbQL6pQ/33KkvoY1ndiV/5cj4ogL8L
 R7oSHo2Q/mI0HQ0+mMZKkUloWPf5yZmZevxE4VewfQp7IkzJoLiUEmcR4BnYHihR4wzTxqPaNRS Ozr4YSVWoD+XfJg==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-1-06d20ad9366f@google.com>
Subject: [PATCH v5 1/7] rust: alloc: add Vec::clear
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

Our custom Vec type is missing the stdlib method `clear`, thus add it.
It will be used in the miscdevice sample.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 5798e2c890a2140a12303706578ffa2a85423167..412a2fe3ce79a0681175bf358e8e0f628e77e875 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -413,6 +413,26 @@ pub fn into_raw_parts(self) -> (*mut T, usize, usize) {
         (ptr, len, capacity)
     }
 
+    /// Clears the vector, removing all values.
+    ///
+    /// Note that this method has no effect on the allocated capacity
+    /// of the vector.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    ///
+    /// v.clear();
+    ///
+    /// assert!(v.is_empty());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn clear(&mut self) {
+        self.truncate(0);
+    }
+
     /// Ensures that the capacity exceeds the length by at least `additional` elements.
     ///
     /// # Examples

-- 
2.49.0.967.g6a0df3ecc3-goog

