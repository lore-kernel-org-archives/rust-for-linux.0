Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10E35B634
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900877; cv=none; b=sNPTfbtokAfXDv5NJ/+fP7L9dwYvclhIzBlMRaOj7LLbz1wLQ1t5ojSOMs9QimbNxLQzZhWGziUF97Ko8T3NHHsXdsREgd24yG+UUlFTDdiX8LQpLC4HTr7uFwnwD6vSVwGGSi86eZqeM9udVM83ax+FNLGlwoNVuwxqZ91peWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900877; c=relaxed/simple;
	bh=ZmCJC+3PxtfBRFMR0Q0h/S5P/IBWgD2M7c7Z1sDmFTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4b3Qgr4NXJmGJQ8T8WKNbL72lx5uauTaZ7MBYiMCHSRQIRn/rhz6zleZcJ4aJlrgKAUTsm7eQ/xCB9lNyVI1sEJkxf2gQqHyXVDgY+bxi3wuYBjUcvBmM1JJrFgn5cDBRyDHchMIaV1QuS+RNydDFpLs66oa4kQBcWD50QqAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp4K8afG; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp4K8afG"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b8d7f22d405so431145766b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 04:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770900873; x=1771505673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ngBYsx0oS6SQtxkOaPFh4bnuuSWOALN53KHhyBM130=;
        b=Gp4K8afGdCAtBHg2aA2oLZU+OZ3GnGTV4IZ5iXWIdhfEuj7JS/S3/R6NPybZ4AX8Qu
         TdBINdS4FedwXnDDmMwhGGqb3nFlQrhb0+Hexl499XSvtuHCQjURBLOS48XjlDYpKq7R
         IEdmepq8An72UktlMAEAieZm+LanXUas9wxE2AqbJVRCNz+lRHG2XLwV5oQ83CwYtwKw
         0FM6W/eX1OuKlMPKmKHBMWsQ5lc1nKuzN6dQEvd0QnDJsJ1WhYjDwnhD1/OlgrVMu8St
         XbtvrCu85f/cmaA6bGiOjPCXEP+l5hZ4Kw/zALaD7zy8ODiiEPIHMFnmOnm4s8ZSP4L3
         18ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770900873; x=1771505673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ngBYsx0oS6SQtxkOaPFh4bnuuSWOALN53KHhyBM130=;
        b=D9EtmA5gAfrQt4TB9qHtVW/J7E5GIG/bqu8zxQlqHTcKZ18ZA8vC1M3vDcj4v7QXy4
         RosYh9jfEddK1/3ZwodcTDyk9iMsrdo861gNx25QCazJhvxFFOvBWeln3Z88mpAK5fX2
         wiCqfYKSVD1Rnax78UzbcJa9IhVcWIrU/W+kknZWRx+4g24ZGSNlhYPSXXA5thejbHcr
         pbz2OLnbvJf5npUJokfCynHedssMnwQ01XQ495QDZ+uWmO27DNcm+nYvQhTfc4Fe0+1x
         yctrPKM9Yj1TsTguVc3vSFUlEbfYG0hIrkw4aNLejnnyLJ5KXFq8Dw9Ffsc6xO471Qwv
         hiHA==
X-Gm-Message-State: AOJu0Yw452+0sYBaNQ4VVNbPa3cll7Dw9MCvOA8OPY7BdbQMtcGuJugl
	lsXrfPcA+fsv+i9M4flEKz5c0yN4csAAsKaaGuRxX7qXaX5JbMGnLqLX6Psm2DaV50bz/Q==
X-Gm-Gg: AZuq6aK/hy75NcEUxHFU8q5sCDQQ3bXq7DjbpwgSAM+mqBk3Onp4nXhsvpilJsWCozH
	PNbL7s2i2pDxh0QEvf4DL73nQw1DCH0Re1pJssxjGnObWPNleFRI9fj3+yHrZMNjJAoU2iRwMMl
	Mbvviy1n0bCC75bVCk8GmmumZy1QDJFhDqDcqjYzrLSSl/G/0ddDdofF42NbXehTcnJyzvyu8DR
	6qIRY7NDBpob+vSSvz1MDloRrEC9/jlnFl7ma4kbaJ14q/OBsGwTnIFo0tz8E9dB5CF5mSw3bXE
	p0gpTkaanC1xOxAUq1dvmrnMbeS+1hB7jyy6FdmxQTo0fgLPaHisn/+QcHxzgEMDXNMHhSZHG8u
	KWuPr7hVx4HnpnFYhsvrGT85FQmDE2DMbJBbJAQXuAZAdLY19yMipsjoEf5hK+7tKF1xmgtPhhL
	UD4CIRjpziBws=
X-Received: by 2002:a17:907:3d93:b0:b8e:a1ad:36d3 with SMTP id a640c23a62f3a-b8f92bd5f36mr141197366b.46.1770900873235;
        Thu, 12 Feb 2026 04:54:33 -0800 (PST)
Received: from localhost ([121.91.57.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fa374f079sm6285966b.22.2026.02.12.04.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:54:32 -0800 (PST)
From: Ali Zain <alizainuimx@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	Ali Zain <alizainuimx@gmail.com>
Subject: [PATCH] rust: print: Document SAFETY invariants in rust_fmt_argument and call_printk
Date: Thu, 12 Feb 2026 17:54:27 +0500
Message-ID: <20260212125427.122362-1-alizainuimx@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace remaining "SAFETY: TODO" comments with proper explanations.

Document why the raw pointer cast to `fmt::Arguments` is valid
and clarify the invariants required when calling `_printk`
through FFI.

This does not change behaviour.

Signed-off-by: Ali Zain <alizainuimx@gmail.com>
---
 rust/kernel/print.rs | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2d743d78d..2ae7b4ce9 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -24,7 +24,11 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+
+    // SAFETY: `ptr` originates from `call_printk`, which passes a valid
+    // reference to `fmt::Arguments` using `core::ptr::from_ref`. Therefore,
+    // it is properly aligned, non-null, and valid for the duration of this call.
+
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -104,7 +108,11 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: `_printk` is called with a fixed format string generated
+    // at compile time, a null-terminated module name, and a pointer to
+    // `fmt::Arguments` obtained via `core::ptr::from_ref`. All pointers
+    // are valid for the duration of the call and respect the C ABI.
+
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.53.0

