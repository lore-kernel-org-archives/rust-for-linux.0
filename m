Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E53431FD
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898327; cv=none; b=lx687RTpU1+WICmF4DGch90TBIqkoYFyxUuD5Bpe5VQjIAkYGOvSluZ5+ANkZxoRw1wHzO5lGnUDIkKgxqDygCxldX5CGwZezn1R3NtHFA9JUl5LkZdwwJeixJzkFlqvZDgFgpbW3evzy8KkXuUag67RdDM4YgFFKf971BNOIyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898327; c=relaxed/simple;
	bh=DgiIvqia0JAzNsDIwf3e1W2V3JY6TgGiAqvtqk3JkIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtwuIu3NAMLmWcGj1U6x5nigaCJQr85ZSqWgp7/OxchzAgYdLB5vkM0G1dpl5to1D9d3x+76MiGThVOtnzEHr78BwveXlAomU0RnJG3o2Ypju4KPUrBvkDx8a9z5Yx9NeeLOcliwMZJMmP8JarbRgYqm6O0B7zJ14HrKqtAH06U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a7786d7895so1023745ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898325; x=1769503125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8uSh+dzlQQyHQlzcimRQKaFwXy4NPjwBWSrPuISq7s=;
        b=MIRbN1Hz5iwavRxvFoPfq8ubnX3PYqArhZb65LinMVz49i53nFV/L+Kc7ouT0840RV
         qcpWg8JwoiU9d4VllVBQKoN+VOSjj6sW/ikdFHyGJw/YR1BJ1P9xOVI26sRHLEVDFuh2
         cQwa2Mk8fiGEjhkCwf2xyARvSU4RhyCxtcxgqu9A/JO1cEETDs3bYMvbmGruqUC5IpjK
         Ec7Zc8ej6dfFYbgx7lwn/Pjo+yF46zZZNY1W7N814ry9gvRTc3pzdNNsjOyB0wQh9yuC
         pgpzbw1HVxIxfIrG9WtQ+X+4rodcm4nzm0dzK9PQO8yq2KjFPDaORhuQ6PhKScoAFBk+
         QHKg==
X-Gm-Message-State: AOJu0YyU5UGmcSwL2NbXSJ1NXtST0ss8qG/PF6jhTC8A0ZEU73HQU9gg
	Fo88/e8vV/SnEyeFApNIbFEqVgRDjRQI9kAze2BC/2kUs+PFp6AsDJ6o47fTZg==
X-Gm-Gg: AZuq6aJG51cXvZmCDg19RIhe20IF5Ztk4l6fsgiA2CPmmvuiKfWzj2VJ+YtoLuXnLjI
	a3K6IjLB5XKS60kXOmJKDtqlVcgc805KmE1SYRkjf0vioDbIiRrTBJc+JUH45WsPeHTeqZQiLlB
	yycZJbjtDCK4j9kXNvQeJH/o6GOvz57aqs2qnCQRDhR0MbcaOyFOqKlsB4pZZPcWRuAH009M8IT
	PJmWS8AbYiUWYbttWy+8nz2Xp/mSEkK8aIxbxq42BLwdrU7rSeInECDdGPdX9nXBbpSh706mjBW
	ZMAdZ2ofvkcGNWR+9cQhfFVPqYiLcEzLNN6eLSO0lFcp0LRLBghIBjfILriIdv4sLCcuMsdYknP
	CSUX2L+DZB29OrpFwuh4nhj5Kz+WfnXKDDyjxg/mQDaQ8RUJixoHquuJAwLWsQMMDs8E4AKeRNU
	VnIrVqvPZiv0+Shmv2J3k=
X-Received: by 2002:a17:903:124f:b0:295:6e0:7b0d with SMTP id d9443c01a7336-2a718946967mr118843095ad.56.1768898325074;
        Tue, 20 Jan 2026 00:38:45 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:38:44 -0800 (PST)
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
Subject: [PATCH v2 2/7] rust: block: mq: use pin_init::zeroed() for queue_limits
Date: Tue, 20 Jan 2026 16:38:18 +0800
Message-ID: <20260120083824.477339-3-sunke@kylinos.cn>
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
queue_limits initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/block/mq/gen_disk.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 1ce815c8cdab0..c8b0ecb170827 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -107,8 +107,7 @@ pub fn build<T: Operations>(
             drop(unsafe { T::QueueData::from_foreign(data) });
         });
 
-        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
-        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
+        let mut lim: bindings::queue_limits = pin_init::zeroed();
 
         lim.logical_block_size = self.logical_block_size;
         lim.physical_block_size = self.physical_block_size;
-- 
2.43.0

