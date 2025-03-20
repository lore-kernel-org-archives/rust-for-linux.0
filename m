Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B011DFE26
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436491; cv=none; b=Gp+Te0HDhPzGf/bhKTC/b4SE7CxokYKXhGgGoLONnGzUig1CvqHtnlepaNTEbQCPQj7LSl/5dkKM+ncQ/m1BkNu8XcclF/EMPBl7Xi+PMZ69tOXaUHQfnpRH5IWpZJaogW53RifsT92ZzojXauxMHGMbwAinEdV3PDGdrxVCmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436491; c=relaxed/simple;
	bh=03IFx5F/8s+ERTelQ6QipCTshCLvkxnBip1S5FpTytA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmjpijHtisYdjIvnDFONEClInx94ffAlPYCVNhjSFZyMky+BBIcop30mY396s6PgP0IDJSsH1W+kR2E2BSJnJzsyrt0Xh+T0wwbvG9YmEK9lOubRF/7cbKdaXptjxgI37DvFoODp9tyQKf66hPgwbhmviWmyVYvqP9c2IIsXslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=y1xvEpuO; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="y1xvEpuO"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e634c42a296so185147276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436488; x=1743041288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuXZhvGZx7xMwwoF8Xjn7fJDSV5CszWctHzFd7M09OI=;
        b=y1xvEpuObKoy4SZITMEFWbgFoCVFFS9OH8GotC0i/DWNL3NTRe/DYNaZ5szPmPVAD8
         QLyKkBLvoPTdBPF3cyS15LP91HmvL5KpeX2sIP1LP4JlsiI4mjDSrJzqd1oIxXHKdZ/v
         dI51iQ1gDVnnsksJQd3eutz0dsWeyOYRiboX9rGjz6VasYRHA+WFKU+uS75jab0wghYa
         3KG0hznOoljHsTelVtiJouUy2t5Z/FpzujvkzNIsZaxJKVqXz8ObMuoJMyJV+ufuT+9E
         EDE4zb+0ewfWNMxLDz7DB9WenF951y/Z651zShR5pNjm1xDf82c5DDMMKJJN/VDQ3cWy
         Yalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436488; x=1743041288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuXZhvGZx7xMwwoF8Xjn7fJDSV5CszWctHzFd7M09OI=;
        b=TQ3X5f6eXDZxLLNz6qlt5/wDEpNopJmnUqd9JI8Itp+qOQxOtlV/QJfpg/4cEAHVxV
         rhmO7CLi1nquBsROzrSl1KTIAeHmVuSE4gZjPaycgAJwJDc2cUFiILVBn57XjP2tv8ez
         EyJvRDksB9N5ol7CdV52zN4vMwPRU7JyLnXX1wKJYz9nSeFBmv0pT10oTiue5D4d5VUe
         ZhmsMMixVyoFbxrCvX2p4+ZiXOhmiF8bKIafY2o5H66xHy5G2OAv/OT2zwir6ZU3ww5Q
         PZhjDFl6uJ48rfiQpKvxWb/UsMbn0EFJ7/hR83/PfuKraXEVv81DsDAVf6+CKm5x4buh
         CPgw==
X-Forwarded-Encrypted: i=1; AJvYcCXKXIb+z88nA7dwIxAJpIs58Odvk4llKlE0k1T8vzSb1VZJbeRQh7few8Lmy0f5IyfQ71GD7q288rlRGYq+Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KXiChzubwPTBQ2p5kBfX26HnPQbRMJm231Bbu+tSg/5dmjDq
	52UhMV3k8P4Rn7NyRK5na9Qu0B3DHAKJMbx9tOChaFXnz1WfgBmdS5K8XxWpUkw=
X-Gm-Gg: ASbGncuD7xZ8grwx7tqmDxKBoLmvMS2kbCrAtIHi+NEucYQ/yin75D39jvL/UW93Sln
	cqWQ6BmjIxi+WyGCBdZ56henLHu4OGPALBNMky4YsOJqPAIciMdkHtVZg/AETuxYlHboQWW5aYX
	1sUk2TTEjovNkvy5C2FaCZdTdc01bTJ7je1eRba2Z8o2MnDGF8GFXKPVZp4WcIN4jG/1urEbyGl
	mChWm24CsS6oDFxYxUqF9+roS7HWGDjAEM2Km84W4fe4NaopIyoEF0r5zrjQHRcVV5LHk4of2EE
	Lc8rf1SjT2HjNbsTTakNZGn61YKGdIWP1Z2dwnOXTSqv6VKUV8NLW2/ncbWC+WwB1KYbMYKKNjG
	92ow76wXyn+BUENJ4ltpS+0t8V6RRJA==
X-Google-Smtp-Source: AGHT+IFTW7X0utxwDE7gdYWpCHlNdJyLmZKN2FueLNxq4+vvY6Arwtu/HikraiAQxOArkDTjw8Fwdg==
X-Received: by 2002:a05:690c:62c7:b0:6fd:4367:e31a with SMTP id 00721157ae682-7009bf83c4emr62770207b3.9.1742436488474;
        Wed, 19 Mar 2025 19:08:08 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:08 -0700 (PDT)
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
Subject: [PATCH v5 04/17] rust: task: remove use of `addr_of!` macro
Date: Wed, 19 Mar 2025 22:07:23 -0400
Message-ID: <20250320020740.1631171-5-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
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
index 49012e711942..568b528e2cc4 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -257,7 +257,7 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
     pub fn group_leader(&self) -> &Task {
         // SAFETY: The group leader of a task never changes after initialization, so reading this
         // field is not a data race.
-        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
+        let ptr = unsafe { (*self.as_ptr()).group_leader };
 
         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
         // and given that a task has a reference to its group leader, we know it must be valid for
@@ -269,7 +269,7 @@ pub fn group_leader(&self) -> &Task {
     pub fn pid(&self) -> Pid {
         // SAFETY: The pid of a task never changes after initialization, so reading this field is
         // not a data race.
-        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
+        unsafe { (*self.as_ptr()).pid }
     }
 
     /// Returns the UID of the given task.
