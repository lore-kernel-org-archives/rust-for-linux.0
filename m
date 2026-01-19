Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3A26FA5B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806149; cv=none; b=IlFrFfmAwPSxvDZCxm16T3aZLxfPtjpgFPq6RyJxZxQqBwNe8ABpRk3LGmXFoyvLwzBFgMoheO3WA35DwnU9Yxie/6cHzp0Z6a0lMv+nQezitZkNvhSnjUugEHPffn515LEUKHEfC4kYnh0E+JJHLl/GQDb3WnmKcZ4gPyHHSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806149; c=relaxed/simple;
	bh=KuGQmgTzOgkXTt56QmLwMnAPiLFO0rF94eGEIOX6QA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMnsMmSu8QwVmLgg+K9xnlIFSQsQBRs0HhCq7hSGPPPpbqv4BkjwAgZZ4fa3K76cGXBgzw4yYnJP0W1cNFqJcFTpujRMWINv8tka8mgNiszogkGtCKFEMceIClIvjGTbmRIYOzEDIJMbk/Rnnzhf3Bu0o6GstbOgkzE0p1ykASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c565b888dso3176593a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 23:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806147; x=1769410947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNbqXdlMuncrdAkCL64ApmcGzjuQ83cskCvsV8WdjrQ=;
        b=jMFsJ9OXLIQNec8dQkVg36AHfI2Mtushfxv8N3aCpIgm7UBDVrOuH53EGMHAdwG3w9
         g2uP/LcczK/3UMnAhWRIuXiO6eQ2RbOhy+8TW4V81tvwQybw+nB1BMs6zVmfKFEP/ulJ
         73X7h6gWcL5+G33ea9dq/9AZamvLw0n6+70Ttps12PTb5yMrUM5ErPPxYMyiUjqhKcY1
         Ya8EQ8K/yDQycMfVUth90ikLowsdGYrguFi79oW0yWgiArZgT8ePfycMOu+fCenhKEGE
         FwCk0CoR36A2difdLgfI45DRkJoaUQmtusygf2HXXUz1WGUtnFZsCaOxFtARXGJKBBIS
         StGg==
X-Gm-Message-State: AOJu0YyRvjFhVqVsVvJ0l5qoDWvrVO90tlfQVQhrPqP3De0IA/eMyIqG
	CyV9wwtazUGTed/MyT+fIHXbXvHMeubX0hbFYx+YihJJaR8xR1vsFyrAVbjZePeu
X-Gm-Gg: AZuq6aIIdoY71CpD2PFZfSSd5UV9MqtTRPCjMm4Cfgwjw9uHU7n68xktTPULVRjwGnD
	qMf9TTz+c7XsMJFdqphRZCyIfsejxGj9Mllu4s6Xf6sHO9dZDffgI0FAaU9L1z5sNk1XWJaV9Kb
	7J70sKCVGLraOF37ti/iXCD1D3d8RomaBn6TOUPXiGB7mWIuOBwFmszNrXTFxfF0U9gMI26eRxG
	w5cs+oRQUTaB9u6lct0TQeuBmNr2QOzoY5O0lo+jiGd8dc2NLGAzwH8yYlMdz6G0S94rj72tscn
	KPsciNnK5g6YFOTC6iJik41VFdv5TAsxuTQRFU9m+TAqKnEcttv7+q+LFHgiKO1ST/SZxGAUA9W
	RYGIUYKm63ARNJzQVTs/TCQaRLacjCyNbCUU+rPLbnU07chYlXTXP+yp9DqVyviwIvajDyE3JSW
	swsp9jhP/Um//VqSt8c/ROw12q/+vEiR3m9Xc7aX60lR8awWpJ7YArAWY=
X-Received: by 2002:a17:90b:1f91:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-35272edae77mr8025762a91.4.1768806146831;
        Sun, 18 Jan 2026 23:02:26 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ec7a8sm10430272a91.7.2026.01.18.23.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:02:26 -0800 (PST)
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
Subject: [PATCH v1 4/7] rust: debugfs: use pin_init::zeroed() for file_operations
Date: Mon, 19 Jan 2026 15:02:05 +0800
Message-ID: <20260119070205.1922608-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119065859.1914178-1-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
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
 rust/kernel/debugfs/file_ops.rs | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 8a0442d6dd7a4..496a8790f6473 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -126,8 +126,8 @@ impl<T: Writer + Sync> ReadFile<T> for T {
             llseek: Some(bindings::seq_lseek),
             release: Some(bindings::single_release),
             open: Some(writer_open::<Self>),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            // `file_operations` supports zeroes in all fields.
+            ..pin_init::zeroed()
         };
         // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`.
         // `open`'s only requirement beyond what is provided to all open functions is that the
@@ -179,8 +179,8 @@ impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
             write: Some(write::<T>),
             llseek: Some(bindings::seq_lseek),
             release: Some(bindings::single_release),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            // `file_operations` supports zeroes in all fields.
+            ..pin_init::zeroed()
         };
         // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`
         // and `write`.
@@ -235,8 +235,8 @@ impl<T: Reader + Sync> WriteFile<T> for T {
             open: Some(write_only_open),
             write: Some(write_only_write::<T>),
             llseek: Some(bindings::noop_llseek),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            // `file_operations` supports zeroes in all fields.
+            ..pin_init::zeroed()
         };
         // SAFETY:
         // * `write_only_open` populates the file private data with the inode private data
@@ -288,8 +288,8 @@ impl<T: BinaryWriter + Sync> BinaryReadFile<T> for T {
             read: Some(blob_read::<T>),
             llseek: Some(bindings::default_llseek),
             open: Some(bindings::simple_open),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            // `file_operations` supports zeroes in all fields.
+            ..pin_init::zeroed()
         };
 
         // SAFETY:
@@ -343,8 +343,8 @@ impl<T: BinaryReader + Sync> BinaryWriteFile<T> for T {
             write: Some(blob_write::<T>),
             llseek: Some(bindings::default_llseek),
             open: Some(bindings::simple_open),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            // `file_operations` supports zeroes in all fields.
+            ..pin_init::zeroed()
         };
 
         // SAFETY:
@@ -369,8 +369,8 @@ impl<T: BinaryWriter + BinaryReader + Sync> BinaryReadWriteFile<T> for T {
             write: Some(blob_write::<T>),
             llseek: Some(bindings::default_llseek),
             open: Some(bindings::simple_open),
-            // SAFETY: `file_operations` supports zeroes in all fields.
-            ..unsafe { core::mem::zeroed() }
+            // `file_operations` supports zeroes in all fields.
+            ..pin_init::zeroed()
         };
 
         // SAFETY:
-- 
2.43.0

