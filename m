Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEB7347FCD
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898336; cv=none; b=ex5JV0jXnBThhSFnfyWTHBt9YnOb4MiKM4+ZW1fg5Jaij0IVnW+ONIO4oN6bzJWoMvRr18lRZm5sVkTHiAXlrn58sViM+b7K7vXua6E4yL/dA4J1ZuYalWahTm2OITDwcOy1HhbuE28K8kQ/mqtrRePpWX8ucpUJA+aPkpwgRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898336; c=relaxed/simple;
	bh=Opu1D2RjNfdP2fA1ZdybKGAdLJOesPAJ1vUr36aRdPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDrRJd6iJ7+I2bfh4s00l1n7TbMutB3JJyo2YRGv3t0LN1ebilQQr9KsT/xgcxhVcMzkLqf2N6PPt7ueXKkqdyXgFRrrdpRGvbYWAkYz3XETYxRFW9ctxJ6Kvg6cf/bUHUfjMMX8Tpkewpcu7PydtTt4KU/OtkYjahIdnH2wv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0bae9aca3so34302625ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898334; x=1769503134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8rOtmZKuaNriBpYyMa83uJp/sBBJRks1Sjt+oph2IY=;
        b=GfyMLVEawUdCiSUnGccdjxTfbXUhlZbyx+koKYfNGtCROwy+pi2M6shknoL3biDNmo
         wJc0KVL2+tNcdtMcEDr88oC16BmhW8i3aBT9x84x5nmsI2wh65vPrINEujxiWUcrI+OR
         83mrC8+6FyaoZXWpepucZLLmgKnFVmBHycUCsT5yhZeUdHmpJVqr1z4e/vM1BinS8Xfd
         3WN97zczmfZM+QMEFTK7CqurIqI3kN1tRLGdpc+3mw/SiY7ls/psEgpAGUOL3nIO+bRT
         uy/ByfLfTdzXpmY/xBKrjYUxNLQn6Nx3U2UaVKmBRGc41ROUOdiLOlpTgfAI+7DvgfXG
         JYRA==
X-Gm-Message-State: AOJu0YwHs0h0GR4zWbUTR6O8hENTjYEs5ZGD/ir2+L6pbrUhY9QtIa/+
	Kv7OVB5BDwh5NjrKoZw+WzU5uffZyY9o/BddExMefsprZf5PUOkX4OgBJKm35g==
X-Gm-Gg: AZuq6aLEv/dnLkuc8nV+keKkpFfdUXbNMsll/d/oNaFTQNC6htlSg5LKRSB2ExGVPRm
	pwWhLSuc4+ARY95NBwHchQFnwVJgN0chw0sgZrhj53XCgxawGIA2s8PzMhSnOBoqYs59ydf+wrM
	8scJty+XVUewJ8osWcvj0aADTBXRAxOvmQvgAN/5kVlw8o54IDFUyEpe44qA3ZR9GnvbqHBvRzv
	lpXu6AKoytE1XTYfZDkzqaaRdWtfTyduqTxciKuYLvU7BWKALOOVPjASFQjlB9tmnp/d29BDdCV
	hZ/qWYqreAg+LxrjValDlKA4Drg9zDDvu7vwwgv+eK6/u6haZNcwR2FGP8qEHYbCIjpNuOsuTUC
	YjBqJQtpl/M/RXm6aZXFX97MCs+qxyMJukP27CyTOGyc3i076VPQ6f3yitsHIyTwNaMhWxhxlar
	0GhO4mF8puqCiBdWKJdrcJFFxtyZwTtg==
X-Received: by 2002:a17:903:238b:b0:29a:5ce:b467 with SMTP id d9443c01a7336-2a7177d74femr108783085ad.54.1768898333661;
        Tue, 20 Jan 2026 00:38:53 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:38:53 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v2 4/7] rust: debugfs: use pin_init::zeroed() for file_operations
Date: Tue, 20 Jan 2026 16:38:20 +0800
Message-ID: <20260120083824.477339-5-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
file_operations initialization in all debugfs file operation
implementations.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/debugfs/file_ops.rs | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 8a0442d6dd7a4..6648e6f464b1c 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -126,8 +126,7 @@ impl<T: Writer + Sync> ReadFile<T> for T {
             llseek: Some(bindings::seq_lseek),
             release: Some(bindings::single_release),
             open: Some(writer_open::<Self>),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };
         // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`.
         // `open`'s only requirement beyond what is provided to all open functions is that the
@@ -179,8 +178,7 @@ impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
             write: Some(write::<T>),
             llseek: Some(bindings::seq_lseek),
             release: Some(bindings::single_release),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };
         // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`
         // and `write`.
@@ -235,8 +233,7 @@ impl<T: Reader + Sync> WriteFile<T> for T {
             open: Some(write_only_open),
             write: Some(write_only_write::<T>),
             llseek: Some(bindings::noop_llseek),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };
         // SAFETY:
         // * `write_only_open` populates the file private data with the inode private data
@@ -288,8 +285,7 @@ impl<T: BinaryWriter + Sync> BinaryReadFile<T> for T {
             read: Some(blob_read::<T>),
             llseek: Some(bindings::default_llseek),
             open: Some(bindings::simple_open),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };
 
         // SAFETY:
@@ -343,8 +339,7 @@ impl<T: BinaryReader + Sync> BinaryWriteFile<T> for T {
             write: Some(blob_write::<T>),
             llseek: Some(bindings::default_llseek),
             open: Some(bindings::simple_open),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };
 
         // SAFETY:
@@ -369,8 +364,7 @@ impl<T: BinaryWriter + BinaryReader + Sync> BinaryReadWriteFile<T> for T {
             write: Some(blob_write::<T>),
             llseek: Some(bindings::default_llseek),
             open: Some(bindings::simple_open),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };
 
         // SAFETY:
-- 
2.43.0

