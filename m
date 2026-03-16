Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C439EF38
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673910; cv=none; b=Khuq5N6/qgbt0DYVcupsUpUua9bbeiLs5rvbGizypCAk5VYtC3gJB1zi5CjYAaet8XP45iXIUNhRybhpXWhaln6zHqFFjlRx+BpXIOtQCdv+svYtxO56lwps5WsN1LVE4UKzKKj3DO/YKkUDR7mmo+gXVJvxbk+sY8ryvYwKaTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673910; c=relaxed/simple;
	bh=a7LjpIRLtduMI1slCOFjGjpplJ7F4DqyS9udlUVEVEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZh7o8n58/gyXkh7giR9QXh9AFnvn0yOaQzOJ2zBCYCAcAUML44eQhPJ6xYTYd0r8wz0keghbf/ZSRAbVpwhUgnHZ84p3GnniXGJCMyTB/h9774CnmyktZYfN5MygxRNiPAmhNaLZzEPpSVYnKW8mbs555iSuQPm1IvUtLeMrTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alice0.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alice0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b6c3e0166so2691214e0c.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673908; x=1774278708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5u6dZoKz+wI1BLXz/khSv4YC5M+tZfUmqiPDGsRfLc=;
        b=gcarbIBvidzHscFReD/qJtM1gjbVfZega0p68er9VhYs7JieABEldVky5IlIRWZ9j0
         l5BjKdbpTs61kJ0KX5oxFLPKVHcUOTcAc/REJPlHbrYIAYx49seXVFidmcurzSWrSOa8
         rdhhRyy+SfIAizfFzqdb55Pi+NROa1PcDeYOefH2ahodpIt29xm4tKNq0tdfPKtkO/CI
         UnveH8UH11dO3NRLjktp6gF4Zokjk08I8GJVMfx6UT2DTAUwEJO7ijMbN5QmSSYIhBkA
         Friqnf878ZaWii3sSA+AOJoWoxDJAOjvb/ZK8bSCZs4jmXtzLjY7uxBunjkIMvXHDjhM
         hSFw==
X-Forwarded-Encrypted: i=1; AJvYcCXZYD+FnAgYPoj9F7Dx5wZkqUkNE3WSn5aA4Xil7/3QOW5IPe92Qru17d/Ws4dZDTvl1lVSSCfk5Ioty1CVJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NDZqD63Sdw3G6ZzOAwxO1FOrmK/VWpGwJcXOyE7/Qj96l2b8
	K437D17x+30dcnHfeBg5LtpJdfHht0nMrCU1xvTqqBaQ3QFu37PS3jk0
X-Gm-Gg: ATEYQzxo7HQIZ8U8VYXEle1R50aA/QhGxRk7bb4kZ9hYS4a7jmLW+cV2NLoumOO455f
	rnMe1dR+A8B654nEvkZEdAxjcqbBSaOuUYZQ1qfivdkCbKq7Soc8d0TX31FPgwxpWSnosHgfCip
	wjz9yXjPp//k8FskcmUFphT8qUEearH7jlICrwKgBpvV0ZMHqFUwUxMk5LkvdnzX9egbo61Q8GU
	1GQmExGBB5NgFgA71RWDCDNnlzlPM0LMXGzgKrsZG1FQefo5PuWFz80lW5fEHTFYnPrvDdP/Yrl
	VIezQpbHjU0dDf9yhndA/9YjHyorxDBnCdWOYZhhkxqYzhR6yxBEE4ra+G9U7RDegOTcmoQumL2
	kjyQ3d6kSzYHEbFYEie0khPQAD68UWmJJ/uYj/GYmXwLwwaqeTMZICmeXXqQ8k6niYsBUAzs6nh
	cpSfypE+jaUfC+gGpvWw==
X-Received: by 2002:a05:6122:1251:b0:56b:7ec7:bcc6 with SMTP id 71dfb90a1353d-56b7ec7bf74mr1506388e0c.7.1773673908401;
        Mon, 16 Mar 2026 08:11:48 -0700 (PDT)
Received: from W871.localdomain ([104.28.153.56])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b88bb5271sm1386273e0c.15.2026.03.16.08.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:11:45 -0700 (PDT)
From: Fabricio Parra <a@alice0.com>
To: Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabricio Parra <a@alice0.com>
Subject: [PATCH v2] rust: sync: completion: mark inline complete_all and wait_for_completion
Date: Mon, 16 Mar 2026 11:10:56 -0400
Message-ID: <20260316151056.287-1-a@alice0.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
References: <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
toolchain provided by kernel.org with ARCH=x86_64, the following symbols
are generated:

$ nm vmlinux | grep ' _R'.*Completion | rustfilt
ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_completion

These Rust methods are thin wrappers around the C completion helpers
`complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
the wrapper pattern consistent with other small Rust helper methods.

After applying this patch, the above command will produce no output.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Fabricio Parra <a@alice0.com>
---
v2:
  - Fixed malformed email header (RFC 5322) in the From line.

 rust/kernel/sync/completion.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..35ff049ff078 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -94,6 +94,7 @@ fn as_raw(&self) -> *mut bindings::completion {
     ///
     /// This method wakes up all tasks waiting on this completion; after this operation the
     /// completion is permanently done, i.e. signals all current and future waiters.
+    #[inline]
     pub fn complete_all(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::complete_all(self.as_raw()) };
@@ -105,6 +106,7 @@ pub fn complete_all(&self) {
     /// timeout.
     ///
     /// See also [`Completion::complete_all`].
+    #[inline]
     pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };

base-commit: 79e25710e7227228902d672417b552dd1d7e5d3b
-- 
2.53.0

