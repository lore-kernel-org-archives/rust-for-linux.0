Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602836D9F5
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112261; cv=none; b=WrXzpJYMVcTyz4tjsCWEVogLgPdDNGJncaMgxHTlhNL1Yl2mFEXBoenWwmF8wRfqnHwmRf7XQN9MG8txrUf3yNwGWg245NdCHJYCGg7B5oMOpHSh2poROUZOqLby0Y14h+jDISOf2zgPzOqMxrARfXJ1AEr4zTInhGRu4IIUslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112261; c=relaxed/simple;
	bh=s8F2VwsCQFItRIMq9aC5imPqe58TMV5fV0gERnAbnmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGsul6aCL3Cfj1sKavDnehqi5CfiPId80oXIykj0RtEYxssrIrFj1bErgZE1uRL2CdRd/OH3bReXDSXwBACg3JEovpgpAs1I7c88WKX9+smuht4pKNja9nEnsKBQcb8cZNNmUoqIfkVxE2iYLsyHf4j7UUxpdGd1hKDc2LsIQos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbHgPsvm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbHgPsvm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso5715895a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 03:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777112260; x=1777717060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEF/R6vlMczxwH3w6bi10lGCqqa0aVHAJKNJ2+jwDlI=;
        b=IbHgPsvmNScPRN6HLCSlW8CUX4fOnBsVU0nCT3rHtghKP0lah6VLjDqOBiV57GD3rZ
         O/LoXqjiQ1efIIUzirTKnDFKXqk+MJ0e3B8X6YsEHhcaZp23nOwfnEb8mGdnNJq32PwW
         dfpe6TH5SKqFP77KP1+vCSqTFfxtXAi7zlx12GcxW6XsbhD3/34n1CicIPM3LIcKYkY0
         /TensPa/XHC1fItE77ribiM2CLi5efFbzt4ghVtQ2tcTY5c2ywcSjcjRvZUAXUJT4hHr
         aWC/fgV3ppIwkMzgENiUeEBgW25hPZM1toxZgrcKBYqWDd8ezulpCRo/xetZDlyU0DLM
         rU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777112260; x=1777717060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rEF/R6vlMczxwH3w6bi10lGCqqa0aVHAJKNJ2+jwDlI=;
        b=SffJvMKuiFR344WWuD2Hvs677SzT7q8MU6+FrBjF006fv4uFrSXZ9pR9dpr9Lx5/KD
         EiWEKL2ef4E8fIVeZ5vZCP/Cv6cRxf04jfiJTuXJzb2SQwjMUMPRaAp9kmhfvsykBoMy
         gjhHX6QaEaLPQ0Bu8YJE9hekhvr0BG+OmrYWBT0SOAp5Og4ydupY83KkwvVS+WC/cEPi
         rGtsgcX1Bf9PrgiwNLjhFoR37mLqT3r3Sxhc4QEtGsRIga33kpyiiJU/8Zojj14seZdL
         U4+DW/14xarOdJb8YCctOKJF6GV0+TACyPimEk1Pav3aGX/aqBh3sm6xzB8VHWq95b3Y
         rLRg==
X-Gm-Message-State: AOJu0YxrWOtbaQ3TgciFBoWChW/0zz5ace6BEl3bWKmcfkDNShB0G3Sx
	MFlAhcFKJ605/ru777b72Amk1S2HFFDtQim86Jw/wtHmTVmfo8p5XuAEQ/IIr+En
X-Gm-Gg: AeBDieu99VJBm4cfg9pCo/8YBmbndwIZo+8fbUl/Y7jqw2khqj9JBC9H5I5qJP/vQCB
	geMhwJ1NSwQAJqm/LB9mfoAOX5P7fQ10wUzb6xFOba5uRkAHnQUeZjds7VZBRWByKvBnSuo5Dko
	U5LORB+wX2CB0jMHhE13RMnctfGay9siGsVzsnExt2bzlfILvu19E4kyJkmoK6y8kIsN+JwLges
	jVpJuje1ThhfiYPgG2cyrQtx0+R5kH51oldQeZ81t4QPUKjnxhuYsfPBdgUYa3XUMD/j3uc/Rh4
	XUKUuWfIKWh3e6T6xtVVoBMfCajiQj9RlbpAVTWVfNnZ3kn+7IP0ei0hSStulKBTCoEFmpXFE37
	IRpdMPYC3TwYszxsPGhNrVanqGCf72Cg79z1xBQ17l2nhjUdsdN7vDqFfuVtNsfLLWyuzu+N5SZ
	cyNMc5wc5xOakX0oB6EqCsBiaOPFp4zoGHXcpNrCQk/sAPZekmw4swMn8SGg==
X-Received: by 2002:a17:90b:3d86:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-36140490bedmr36435315a91.23.1777112259994;
        Sat, 25 Apr 2026 03:17:39 -0700 (PDT)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362bc4f9360sm9883027a91.1.2026.04.25.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:17:39 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] rust: alloc: add doc test for `Vec::extend_with`
Date: Sat, 25 Apr 2026 18:16:18 +0800
Message-ID: <a02bc604cde78ba505441a5555400e6f575e8a8a.1777111268.git.yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777111268.git.yu.whisper.personal@gmail.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com> <cover.1777111268.git.yu.whisper.personal@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a doc test for `Vec::extend_with` demonstrating basic usage and the
zero-length case.

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..408a51ad3623 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -737,6 +737,24 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    ///
+    /// v.extend_with(3, 5, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 5, 5, 5]);
+    ///
+    /// v.extend_with(2, 8, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 5, 5, 5, 8, 8]);
+    ///
+    /// v.extend_with(0, 3, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 5, 5, 5, 8, 8]);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
     pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
         if n == 0 {
             return Ok(());
-- 
2.43.0

