Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC312FE06D
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704315; cv=none; b=ZqYbOMvH+5tDxXI8TCuyt1owryTTLViiiQJ4C3WEo0lBL8nyiVUKAL1ruGZeNEWJsEbhIODxsLTKtsU9nFrlamJENaDxXxuB46WVlngyc+QaDLS08ultHWkH40LAvXr00ND+asEXQWZg+e6AxLEB9DIvU/BO11eSb2U1bK+ZoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704315; c=relaxed/simple;
	bh=QXDwV7c6I5ccFYbFpKbncYS7vrDQedc/CL/7TN6KLf4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mhIGRjHkxViZHZYSXVQB3bHv4EbH+T5/nTBoYbHbo8fnmvPzaw3lNILh8biAIDa0sI7VNNl7EjqTml4hRdwVLzW4Qc30P2cD+b7lJRg2Lr1zMuZ++rrmIs3cDY5m7XX/uDb5GBlc7mc5CIxOnslj3NUfT7AY3OO2JEoYPZiERIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=svRpukJk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="svRpukJk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so34648595e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704311; x=1765309111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GwKZZlFWofOBNIhvVvCg8fDrYWEwaIxXOdbqeyBSsYk=;
        b=svRpukJkIt6rCa9bLoWmlELvavW1TJyjqlRqrYV4N2ZrpJDb7yKV2pFOokOCNUqtgl
         6yghxdDc7vW1/zhCHde8Vq30G9ycLLCpMGyx4/HNQwRPSfFogWVbKGUYcPrWYIGgFrV2
         EkGhirLyAlU79oE29PUpWe44aDL4PLQfEX4jYMJMG0/ook4PAk5OsLdgtKUDHku0Ix/B
         CSQePQINkzXbK4beFRYA8b9bl9/eKKOKpF5dfiIAxerfaPJ8gogG5yPQA95CI/2O1ZRQ
         OWEqZN+PEzwAPm0fn4Gapk+pDu07xJHZrBdR/MVLHG00XOD4B5D+70Atv+AHdIX6qcNV
         UNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704311; x=1765309111;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwKZZlFWofOBNIhvVvCg8fDrYWEwaIxXOdbqeyBSsYk=;
        b=RSp97d1q7rNoyTq0AGPZ8FLiDZW2PE8QPAHMIWwB5KzWuUJiRis12M1VWwSaFLrZWq
         JU6hdnPtBiQ6LTZgJKmsKc8V5uasJjcDUPgNpGW9Ly4xfwxg5LazIrvWXCq9hc/Lixnm
         6b67W7umgO3znqHajhBqXa2jdhaLKF6WZ5RxthU89V8Wi36wsHf0wxHRcrkRlFIWVUor
         ALVGWGX1n8DybP7zzsa+DETOa9sYGP8cR/uo2zlk33NxCsfgCGJ052okZvqOMUh5AFPb
         Mi1II9mxvTBAtDxaJwRyEqUXDc1ZB1g7ksZUwPs8sK/BzD/lqTJMdrEtXmVkmqKhZdDT
         UQbQ==
X-Gm-Message-State: AOJu0Yzi6G+fsbvxkde/UTx5K1rFal7MA3V2BYJGl7VVOL6ZahHrHFO2
	Mkdm06oQHeXr2cpWDfI/dduWUIq/b+zHii7jVsfMI99kiQejTqUez7rL2EdNLTUCPHLocTj2JCS
	7deQnfDfjpvBHf2APWma7fwGDG/h02R89xoLXn70f0EvX930NUvmTEBJM8ApZxeUJxDDfyII35U
	j0Y+5uhND7Kt/xz/yIo6ME1i0sYaoXK0usViDtyc88tKV8HpJJqSpwFQ2lmZj3uPY=
X-Google-Smtp-Source: AGHT+IGYjRiRRmEYoIWiBAqVvlAn1/rMUUXjj3nCKM78lKsbIxj7Fs6oLnefZbSqLAcKF8DWjl02huczrcNd6j0=
X-Received: from wmjy23.prod.google.com ([2002:a7b:cd97:0:b0:46e:4c7c:5162])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e91:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-4792a5ddcc9mr7150695e9.5.1764704311516;
 Tue, 02 Dec 2025 11:38:31 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:58 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QXDwV7c6I5ccFYbFpKbncYS7vrDQedc/CL/7TN6KLf4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AKvYXCDN2x85iEPNFC+AtH8oiwYvPD4YhRF
 LUl1fm9hbuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACgAKCRAEWL7uWMY5
 RoOUEACcGa1ErFZhdYWK/LaEy1u/c8SZe22Fam5ByyEVolD7UvKUrWGMC1f5+rUOsLTrrBHQesu
 hQmOdDwVpH8mc3/TJbNhvDJJkmUGtYZ/QbRf0jNsv9NzrzeFcsFw5YBNOmqLX3qc8Yx+L+GycQb
 h8XelieOFuy/7PBLuo9SM+4PR1mOBJJkqIFUvy4X/5pYJF61j+nv02EDqL24nnJ4PmeGE7ReeDD
 9OB+g4yjaXZiYvNL2JfikGarLkj4OX6S+3SB7zGKIT0VBZ8WdiRagBIxUoWIKZmbFOvkWMkXsM4
 dWFsW0GeXowB4l+7aiNPst/D5TzzadbGvmqdowpWTeVW6igOg2OVtwKf8LiB3lEtFESvL/A67iG
 AT1BVa5SKO5xzOPoItuCl8HQ6ZhR0+xp5OyJgZWJZd+SWKA07a0032CB55FOkQBCM7YEJTM2JOY
 AwRkgPd9Y/2baUhBXbi7ZeZDdHfcg+0bgI1fKYqsDQndiCi4ObObFiCV4XcO/wE2neleAPfmdzR
 soVeVDu2OZ5NGbLZnBJF4PtWEwKoFzSH3nGxNU2bjcHwyYWM956JtSCLc5UHikUW0xuB8pWNzlx
 UaX1lGO0hsRWPrT0fAaXu/e91TKFZN32x8oSWxGiZZLDAm/ty/ylGQVzQ8wILuS+3wCnhfB9nxQ u/S8QTGXaAjT14Q==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-34-a2e13cbc17a6@google.com>
Subject: [PATCH 34/46] rust: refcount: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Fiona Behrens <me@kloenk.dev>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Fiona Behrens <me@kloenk.dev>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
---
 rust/helpers/refcount.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
index d175898ad7b81ee9da3d9d125764db02e837da52..36334a674ee42eb46792210903a0e3cf9debd9a1 100644
--- a/rust/helpers/refcount.c
+++ b/rust/helpers/refcount.c
@@ -2,27 +2,27 @@
 
 #include <linux/refcount.h>
 
-refcount_t rust_helper_REFCOUNT_INIT(int n)
+__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
 {
 	return (refcount_t)REFCOUNT_INIT(n);
 }
 
-void rust_helper_refcount_set(refcount_t *r, int n)
+__rust_helper void rust_helper_refcount_set(refcount_t *r, int n)
 {
 	refcount_set(r, n);
 }
 
-void rust_helper_refcount_inc(refcount_t *r)
+__rust_helper void rust_helper_refcount_inc(refcount_t *r)
 {
 	refcount_inc(r);
 }
 
-void rust_helper_refcount_dec(refcount_t *r)
+__rust_helper void rust_helper_refcount_dec(refcount_t *r)
 {
 	refcount_dec(r);
 }
 
-bool rust_helper_refcount_dec_and_test(refcount_t *r)
+__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
 {
 	return refcount_dec_and_test(r);
 }

-- 
2.52.0.158.g65b55ccf14-goog

