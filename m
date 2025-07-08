Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CA315C15F
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934892; cv=none; b=X7qa1m7qwp8l0M0zM5E7qLGlsqeivlg5lzxu36kHVexAEgmkNhnoSb4Z8qH/BplptY7u/4OAp1DwHlCjZijYQSYkD4ufT59Dp6VWdvWg7A3uVXnNg0iUIY9pkqPQXJhfPQXCX6mwUJkkP6wmvdy5CojtGQ/apDcP4ZG45t4K5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934892; c=relaxed/simple;
	bh=QiFIm59lLnxGJ6ccCD8dA6LHaxqwe2y+FKdZd6XIlEY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2ILnLLLfFg0TwfnuPPsxuoiKvQgERlwZ2ERB5a3mHD+wEFYUw+bw3Fgn3aze8kbXJyAZdhjyjOXuL2ol4oyMP2a1iOpUVvFDH5+urW++8fZnZ1IhWQESaQ2DD9v8Rq/HuzSgy9NHxudcmku8pqc7S/E68PdpzRlFaqH1gc41fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE9A3EBY; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE9A3EBY"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d094ef02e5so633170485a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 17:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934890; x=1752539690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSjMqbk17dPmnR6ku1sCl8XotAAIdcPvUToFf7TNFE0=;
        b=cE9A3EBYCfDdpPYqB6idsWpREwOsd41GqhMmPFgS93V/+NUKrVmcqSqul3CtP2nBNe
         fEYMVSguFRTnxx8rnB9ifONqj0HUWT+kwdK78j68Opoi3kBhzNZkriq84f6XTyXPHQ8/
         5eLvbodkq0S2L5I04+V5yN92eZG4qM+Vut9xqrXNkkg8RS48MTyU7FqswpVXkqVpUaC8
         d1NF3880G5qcIU5pFKXMnDbfNG27dT9tNrv21rHoGwu7BkSt09zGfv4usr33xEA2OTTG
         zuH0uhRc0XxB0bQaJTkqwHUgO0JUpXbFJ6Mg32CC60xMAWzafoROSo/W+zAczfJAn+cw
         ERFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934890; x=1752539690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSjMqbk17dPmnR6ku1sCl8XotAAIdcPvUToFf7TNFE0=;
        b=I66qRj2wIMOfTSrpyUhly0VTpzsIjdX67525M1QQ0oHx/SJYSZErzSPDyTUOA1ZfBl
         orIZ6Z6kCYMukHU5wfe1Ps2K0rzN9z6F3q/GrnujuS3NLEIhCqUsOwvlD4niYj0WQuhK
         Z7J9pAYYjxz5Z5DcXyqVDcd8X2+r9YiS9kelHewYPTIXvVwOMmVIz/2geb8DeYp+9kef
         +7bA6Ug70/jmnHRuhkLIN9hfvmO+yGi5YEF7Zn7M+4cz+lN8cATT0dFOHKfyNwHSWT5d
         LHsc797Ji/ig4j3hNs85Q/yjMXlVA35D+F/G9Ie1tr4A1LPZVDejiE5Lieps5jpzQWyX
         rBkA==
X-Forwarded-Encrypted: i=1; AJvYcCWzmNQcYwKXxW/E9iOz7Vo/SQxSmexqlbBZVIbFGAYt45ElqQsRHqsOLdz/nsMo3CrFVZS3TxYuKYiL7RCU6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2R761Eo0NgwCwayFRa852sCN0rwSXGNjh6OcconndJ7WUvrzz
	ZSQ+3nw7kMwKyvCVAF2V3jgJnbD0i7BYHkfDp72SsrbS9tQcOUFlqvgT
X-Gm-Gg: ASbGncsiqqblqJR80RuZ15KoMDcy/rxe3qjA6d4rz3DRslXk2eGkUoWFjILvsU6EHQc
	rO19JQFScU6UW81BGRIIowISOAajhTHZboRPkejVSzZtP6ZSRAx0QXcBbxSncwH63ZtzRYBGTwF
	djiZFN8dPsYhEtKp2YjZefnzLiqBmGlWKgxPMvRSAI7qOxsh7e84Ml/Zt1ApTZ7eteqy3TKszhz
	OL5E4AZnHmdQ4YdKSDrE8kPI4wIqAVEVCqo5NNAactJ3BW/wVSUFIoIRfDeE51NPpFcXUE6ffR+
	ChR8ABhtqd/7azqNbkjYXRMAROBkz8kV3gEBO77f+KsA8lTqY+LrBnbNLfc=
X-Google-Smtp-Source: AGHT+IFfw5A/YtgsO1ZUEab6KMeNU7XYbVm06sMlTeugsLT3E2LwXpiPcozbfiBCeKct5KSvrRA40w==
X-Received: by 2002:ad4:5766:0:b0:704:78e1:5938 with SMTP id 6a1803df08f44-7047dd20b01mr11948836d6.13.1751934889846;
        Mon, 07 Jul 2025 17:34:49 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:49 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 3/3] rust: revocable: Document RevocableGuard invariants and refine Deref safety
Date: Mon,  7 Jul 2025 21:33:39 -0300
Message-ID: <20250708003428.76783-4-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improves the `RevocableGuard` documentation by explicitly stating that
its `data_ref` member is a valid pointer as an invariant. Additionally,
the `Deref` implementation's `SAFETY` comment is refined to justify
the `unsafe` dereference based on this new invariant and the
`_rcu_guard` ensuring data accessibility.

These changes address feedback regarding the clarity and completeness
of `RevocableGuard`'s safety guarantees.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 6d8e9237dbdf..64fe44b4f5a3 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// - `data_ref` is a valid pointer to a `T` object for the entire lifetime of this guard.
+/// - The RCU read-side lock is held while the guard is alive.
 pub struct RevocableGuard<'a, T> {
     // This can't use the `&'a T` type because references that appear in function arguments must
     // not become dangling during the execution of the function, which can happen if the
@@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: `self.data_ref` is valid for writes because of `Self`'s type invariants,
+        // and `_rcu_guard` ensures the data's accessibility for the lifetime of this guard.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.50.0

