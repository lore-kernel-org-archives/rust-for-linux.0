Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B71E0B9C
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940527; cv=none; b=HkKBhUsaimqDa85VFWbam3p44bSA7ESGP0o8c1rG+IzQ3rZv8SfSqUQDDNHM4Dq1VOJ6Ry+SBV9sMf5n39YzxxkBSi+5v33S1yjQMj2xrXMuSwz7eBjr2rlxff8HTn024otcxQhDOazH3exfi6P7nPp3cxc+nPIgTUzg+KMWLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940527; c=relaxed/simple;
	bh=iKnr6e8N56z9qXm9fEUldRgB1x8EQ77GX5xNtNprJqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7cgTk5wsJ9jLvBf8uO4D+scaCRklsLpuJTabISRHvla3fk2hTbVZF32IJcg17L2arV/sbOrpJ5VcozvreGPpxUSx4c3cqzP8ybGmcXtSd0fi6BPNVlXO/Z/x2TF9WbgQ9zKGdjV2fi0sGKegiu20XfZ0pDSIxaGA2KC3jh/U1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=nnou6hUo; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="nnou6hUo"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-706cb438672so4577417b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940524; x=1745545324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQWNy7W2o4yDQUOqT2/+qBcYzZtm3FQaQ3Z5pYP4aMw=;
        b=nnou6hUo0BzPOEUjTPP2e19bu3/uqAoX/73GSHa6FiBnvEGQH8gx5Px9Po/ZEhwo0S
         g9tdy/o1xHoR10RexTkKSpZqki2gWdZyqmltMhk/zBSBgPKqYFw1uXOlCrW/mDX1fa7k
         gucW/NyJvWyoU8JV5FBNQpnzjhVN4bciA40bWP8aRpCr/At8SV+7tL4AlBVQgs4Q+lKD
         3y19Gm+9VKvelms8ltHtt/yPNr0jOQDVk70jmD6NLouKpyp9phPiqQ8jMLg9FiOcuKpN
         vBype8p8r9Eeb4AeI9H42j4OW/5uPAaP5hqPrpgFqSUlfDMJ3lhSNU/2uui8Yak1BRMT
         4AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940524; x=1745545324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQWNy7W2o4yDQUOqT2/+qBcYzZtm3FQaQ3Z5pYP4aMw=;
        b=qQALGHCkcD5oVuCpWVSSQ+qI2Q1bY5fymjtvZrqa8I9QmdyybR+cTBoOjZOY869Nmy
         IVK2NFUvH/VBqay3t6mhnhNLk9iI2eIAtRG5UOmE/Uxfhvjo8qxL/x30SJUZQ9wrSwEM
         33WAhyu+nCUo4J+3lgOthFRH5KmuVmX9JCpdDEq2/Yh0+g7r9rwgwks2qGW5EXfHMOLo
         a9memkw76iXsHQMFNfoeawywKJh10X0S3k90bNcDYV4I2K6sfkm5JObkaMEA7HuNZFgW
         EluIWS54nU1xfOOE/pJilDQ/oe2XaKnbhaLf9bcnQ1Xt+KXE6mionK8yMi1jpyMnzSOa
         j4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUR5AePoRaGKHj4nt/H2oQHYHTOBcIXg9ULFoWXpP2auSpBQhCOgm4GavQ8Q8/kQ6alf8Yfn0/mMKb7/a5P7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSVT41gjKy2fBTIQ1ON1tKqNKGgRvOKEEpT/34/ecGvEG3VDB
	YUqZ0bGFY9ZsFK/1ASBfsT77O3egaJIqXlYpLF2y23R/dl7Ys6v5QjKyLm3f1UZqaLJTq3TqaaW
	p
X-Gm-Gg: ASbGnctGYYGtdR724iRBLgf6HvbLMbFrZTdc1MD2mi/Q91LwacJBeXE9G8Eivo8eGAF
	dFj6sJMmfUeJyaq7PWSwtck1/8OGoRr6TGHsmbS4rIZubyf+rgfHXxMJhlPQDP8JzZQ1Y2Y+WHt
	+s/P5vPDu3qJiVDuzBN8uJ/yTsV4zdnDecfJZuDHxrJ3gYy1KbLekvuYb9C0/X79PZnargMceRL
	PEoxD06BOEYrQ7U6/lEQWIKAyzPxUBQeSyyraimClA8+vnrbzzg1+fYv1UnsQKYAjfPrHzD0h6r
	4szyqGFfOu+BuMtSrIKbkxxxPtbYEWWuo4o5WZGUpHqRxP6kKzV3v9cKWJ2fDNTINKlweQsBh52
	sRnk9XgH7yPWFg1EuKkzfnnhNnB3M0adSPROcUKYAfDKjTQE=
X-Google-Smtp-Source: AGHT+IF9KFMNEu6jpa97QayMti4TKcnPXsAq4MGAEYM4wdITHEEiEhaIFY7qZGhVB1Nqbo+5GqNr4Q==
X-Received: by 2002:a05:690c:d07:b0:6f9:447d:d1a2 with SMTP id 00721157ae682-706ccdc6e66mr14828297b3.29.1744940524334;
        Thu, 17 Apr 2025 18:42:04 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:03 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/18] rust: task: remove use of `addr_of!` macro
Date: Thu, 17 Apr 2025 21:41:24 -0400
Message-ID: <20250418014143.888022-4-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of `addr_of!` here is unnecessary since its immediately
dereferenced. The main benefit of `addr_of!` is to avoid intermediate
field loads without immediate dereferencing, so there's no benefit in
using it here.

We can achieve the same behavior by directly accessing the
`group_leader` and `pid` fields, which is more idiomatic.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/task.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 9e6f6854948d..554b42c609af 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -259,7 +259,7 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
     pub fn group_leader(&self) -> &Task {
         // SAFETY: The group leader of a task never changes after initialization, so reading this
         // field is not a data race.
-        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
+        let ptr = unsafe { (*self.as_ptr()).group_leader };
 
         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
         // and given that a task has a reference to its group leader, we know it must be valid for
@@ -271,7 +271,7 @@ pub fn group_leader(&self) -> &Task {
     pub fn pid(&self) -> Pid {
         // SAFETY: The pid of a task never changes after initialization, so reading this field is
         // not a data race.
-        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
+        unsafe { (*self.as_ptr()).pid }
     }
 
     /// Returns the UID of the given task.
-- 
2.48.1

