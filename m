Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD032AF1D
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965184; cv=none; b=bB4rsAZ7H6l8IQlwM1xfeQXcYBI4hq/292UQ4197kTLtCoUzKtUgizyhr9gO7i8WltaBzgix3Zb3U2eJlbRNXGcuSyj0P0NbS04aMBLSR9Jtqj+ak+KDttN8KHXHAixOxB8cJFL3uQB5kcvufuNXpPl+EQz+Wfvnub+uCNUA97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965184; c=relaxed/simple;
	bh=p71N8964LBqvhBqgZHta4Nl494pO+a7xh/lNHOCHzgs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=g7/qtaF4Q7oXZd4s2Y6SO8dsSIcrbLwl6UJlPpUV7XArmk6Di7hK471EirbMdBIv/82SGH1vsO3w0fX9x48gz5qw1yR/9gA1lZ4glGCu4uPWTBWvPv7LScUPRmR4SxEw9odGzB4q6Pq2C9cCHgzhWqlRBu9gIpqu4/CdXh2pcFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aCkhMiuU; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aCkhMiuU"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-137dd5100c7so2297535c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780965182; x=1781569982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iqgDnjvMyYqmuGAbRvuofHjYhHguWO5xVMhmFAiKp9E=;
        b=aCkhMiuULl1meSy1dm0rhg38n6DOpe6R//+vIMoX2fygJEtAeNB9augnGr1Wq7M7vE
         2lIcdKDs+9V9F6jfHJzB7Q+s3qWpTptIdEdYoS3BL0r9+ft4IfxfKr5FBGs8IGURf2rq
         FW5pDRaCw4gpmcHqaY9C4EgCNBzKnOtr3kJ8wSR2l9vpDOyvj6z8TSLClYD6JZOEkVBB
         CCInsqoj7HvQstyJTn6Y29qV7+S204QBom/R6gof2WPAhFqs/6uecY7wFi5tI+c84xfh
         /d0pYinGIQtlNI6hyjJOSYU1pn7DyKF9/m2uOfR5YmAUGi4LcJT/SndMUXX2QlSnXmej
         oGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780965182; x=1781569982;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqgDnjvMyYqmuGAbRvuofHjYhHguWO5xVMhmFAiKp9E=;
        b=DXulVYh1Li9pQQ8Yui6rmlR2LXrfkNQN0BQSTQCFNPB4xyIFpK8MZg/S8HFSxjzCVe
         SjNw19545qsZtvFfK9RVh+i+z9jdeY3SYvlc/uTWbuM/jo/PfZQ9Bj2Epr1MP++SsQRu
         y4r8BAsyOlIDEKQitv+ZhnPnTQ0Kgc7/RfsiQl1TE/Rx48F/CQ9CeqIMLUxxFOizOmh6
         UikoekQIfWg5aE9/Jdo5gQV4cxJjbwrqlXlvDGKpJ/8yquXi0rOBtm/bxf1PEeavrwsS
         6cTL6NeVcR4iiOlrTo4Vwmy/RDzY2eKuQZDhe+XK/7wsjmfXazfVrCpDTYcmMR0fkJfZ
         x/xA==
X-Forwarded-Encrypted: i=1; AFNElJ8eY1pGGKoMiD0grz5c//MF9Mt3jygwJAZeL3upLzzCZ4ahAO00UMoP9mgRLaf5H11EWhpEQBQoP4oWvhGjIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw923QYTp7PwAo4bRqad8BSOKUSA8MdwU11cbOj48Ous4FWMxp4
	frx3Q9kLKL2TYqp7cpk7CTevywvBy3JZf36FcrBtaE66HB81Q1DODtxymNntYP/JK1cy+hMOt5p
	bOR4g0ecIMOcWwak5qP1wRScMm/ABQQ==
X-Received: from dly15-n2.prod.google.com ([2002:a05:701b:204f:20b0:138:7d2:f099])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:390:b0:137:1ae1:bc2f with SMTP id a92af1059eb24-138066d196dmr8042191c88.13.1780965181629;
 Mon, 08 Jun 2026 17:33:01 -0700 (PDT)
Date: Tue,  9 Jun 2026 00:32:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=samitolvanen@google.com;
 h=from:subject; bh=p71N8964LBqvhBqgZHta4Nl494pO+a7xh/lNHOCHzgs=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnq8Ra/19+fza1cdvaGYp5119YdSfoJ3N+0QyKZP27+v
 Gb9I7PLHaUsDGJcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAiPGaMDIcTVq6b0LHkIreg
 rmHn1qj2+UEqqzT3ezw9Fl1tlaaQUsnwz1zD4mStqqHVkYydT4o8fxaxvVkePsf02MyXBQGZDv4 xjAA=
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609003256.1829625-4-samitolvanen@google.com>
Subject: [PATCH v3 0/2] rust: drm: gpuvm: implement Send and Sync for
 refcounted handles
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

GpuVaAlloc and GpuVmBo implement neither Send or Sync, so drivers
that move them between threads need their own unsafe impls. GpuVm
implements both unconditionally, which Sashiko points out is unsound.

Patch 1 adds Send and Sync for GpuVaAlloc (unconditionally) and
GpuVmBo (similarly to Arc). Patch 2 gives GpuVm the same bounds as
it can alias types using obtain() and drop them across the threads
via deferred_cleanup().

Tested with downstream Tyr as there don't appear to be any in-tree
users yet.

	Sami

---
v3:
- Added a patch for GpuVm, and changed GpuVmBo bounds based on
  another Sashiko analysis.

v2:
- Added a missing T::Object: Send + Sync bound pointed out by
  Sashiko.

---
Sami Tolvanen (2):
  rust: drm: gpuvm: implement Send and Sync for GpuVaAlloc and GpuVmBo
  rust: drm: gpuvm: require Send and Sync for GpuVm's shared data

 rust/kernel/drm/gpuvm/mod.rs   | 22 +++++++++++++++++++---
 rust/kernel/drm/gpuvm/va.rs    |  8 ++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs | 22 ++++++++++++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)


base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
-- 
2.54.0.1099.g489fc7bff1-goog

