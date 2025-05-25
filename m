Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485257260F
	for <rust-for-linux@vger.kernel.org>; Sun, 25 May 2025 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748213970; cv=none; b=LlZ3O3GyazjlT4Nn5zeD/GamvADlt2YngZtJ7OmoCeH9NBNfvRr+dvmyvCI4JaFzW/Hc3btjljHkzU45OKZJaGopb5RT+4FqoJ3ZRgFqdPx36q4pYIAvzQZPPBhnZnWzgDFMhSlUQFXHficEtHBQEEICfiKFiWmuRd8zIpYG0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748213970; c=relaxed/simple;
	bh=XzNn1hEBUN5DiRQV5cYLq+CWgu7pJ7TVMd7W6yhwJk0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AGr1SRf+7QPPj/phSz7R9GOc5B4WGboNbDGBogneiur0DSOZ3ZLbERnen+h3kLEOQ2cgvIgnuDihST4h3k0N8wUnBx5nV5qInJ+pwK14bGUl9Asa5uwrzFVSi5I/F5lcnt2jBRQTQQ6jFKgdw0m+1VwwOtZC6dUa0fnDe+a9P7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMTLdtN9; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMTLdtN9"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c53b9d66fdso235249385a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 May 2025 15:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748213968; x=1748818768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqucush6JMkRyFTK9ShVSfONJsb3INsMZ4/sWv4TM88=;
        b=aMTLdtN9BaAFrex5qPFyVXu113v3NJ3Ae1UzvPABkhzFjxUKtfmTMau0JWWv0H9t0w
         XBZ/dw92ubxMfs1ZyjUL0NwCV3iHiAIoQ/CDNMH5TeNR4awHPwB6Wk3VJ82YCgSGzaCq
         5J2cc6lCRo7MgReeeljFIs38cMFGjzyG8dG5wgC55OTaDLpy1j8JxOUM/o23RLbIY6Ba
         3eJr2X0hTK0VUP91GYJpscSMUZ7AsvIWCzgfc3v7o5vPZC0NYMdJDUfJoc2518e9Y/an
         g5IqPDvgdfJUq36ONd8G9HDE5PgLju3z7xeK5cb5fcUsp/DN3YZs3PDIuh382toRhs7N
         i8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748213968; x=1748818768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqucush6JMkRyFTK9ShVSfONJsb3INsMZ4/sWv4TM88=;
        b=Kz3BIa7GeYpQaHujnVai+3m6Gtdf3cRDnYTLOnDSVTX+AWqbJjNgJDEuE3VWHj1/rR
         QJgTA2I4l46pfUO81MTqIHUeYLdsWUwV3L3TSd1eaUsWKJR8bvkcqDqpudW4smDioLT6
         CewGkad5O3nfSO0FlrEnbybehnsPLCb5QQ8MT/F6YB15s3MCkdHw+X64fctgzZm+XXnF
         OOsn8MeRkhE+zfdMCm/XvMvmD6KPZwSuRJWYf6acvjI+Y+m4VfVSTaHNGbk26OXaQ7LC
         2UasX40aoNTlIRB95MXj8KSa5Yu0v5sZnAIhzHUcjZAeWW3jclykyGTitIIW0yKA4LsE
         vmKA==
X-Gm-Message-State: AOJu0YyLO0MMwNSA3mXKN73iHdCuLr8ZowrsdZATC+g9xHiwNHd6KDC/
	ngbZTnZbMMsKGTqinUvLh3NLtfYd4Ix5bn9lIt5qM6M/iMsgCVNVxclIr1DK/oVC
X-Gm-Gg: ASbGncvBxFrOb2bW+/zNjTozHb2nxHFJzA3vQbkl4qPH3JaSmc+qRCOBqojoei7vWbn
	zl/13Mi58Y6NW8RZM9Ct7hdLZO4dXzuChYXuGCf/WLDHcU8ONepdwZzi2wTTYf7B6xVGM20CDKT
	WNd0ftnDBK7OQ/GMb/1xwi+96v53UdEeK/1NFDCITNVHTc1PqmLmHqpkbl/egRGeBqZztrvXxKe
	a+G7ASN01C6JfK6SAqUulMJnSOLspxy7aMGjkRaHu5IV2+Afxft1o8mhGgSuDccjrl+XZ8fyLhQ
	nCCKS6kOzj5MxboHsB/mLSaY/aLh1IuZXPltdsDIB3zCbBgg5GCQAOk6xCQGcw==
X-Google-Smtp-Source: AGHT+IHWUVH3WQp4QcGh53IqbBS5sSeNeuN1cOf/zmXGXPKZ5cquJtcU0DVeOoCH51YQJChrEdf+PA==
X-Received: by 2002:a05:620a:4505:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7ceecbe7f93mr1038490785a.31.1748213967666;
        Sun, 25 May 2025 15:59:27 -0700 (PDT)
Received: from localhost.localdomain ([2607:fea8:54de:2200::dd7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cedf7930b5sm506867785a.89.2025.05.25.15.59.26
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 15:59:26 -0700 (PDT)
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: rust-for-linux@vger.kernel.org
Subject: [[PATCH]] rust/list: replace unwrap() with ? in doctest examples
Date: Sun, 25 May 2025 18:59:25 -0400
Message-ID: <20250525225925.14797-1-albinbabuvarghese20@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace panicking `unwrap()` calls in the `kernel::list` doctests with `ok_or(EINVAL)?` so they return a proper `Error` instead of panicking.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Link: https://github.com/Rust-for-Linux/linux/issues/1164
Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
---
 rust/kernel/list.rs | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index c391c30b80f8..fe58a3920e70 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -82,9 +82,9 @@
 /// // [15, 10, 30]
 /// {
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 15);
-///     assert_eq!(iter.next().unwrap().value, 10);
-///     assert_eq!(iter.next().unwrap().value, 30);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 30);
 ///     assert!(iter.next().is_none());
 ///
 ///     // Verify the length of the list.
@@ -93,9 +93,9 @@
 ///
 /// // Pop the items from the list using `pop_back()` and verify the content.
 /// {
-///     assert_eq!(list.pop_back().unwrap().value, 30);
-///     assert_eq!(list.pop_back().unwrap().value, 10);
-///     assert_eq!(list.pop_back().unwrap().value, 15);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 15);
 /// }
 ///
 /// // Insert 3 elements using `push_front()`.
@@ -107,9 +107,9 @@
 /// // [30, 10, 15]
 /// {
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 30);
-///     assert_eq!(iter.next().unwrap().value, 10);
-///     assert_eq!(iter.next().unwrap().value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
 ///     assert!(iter.next().is_none());
 ///
 ///     // Verify the length of the list.
@@ -118,8 +118,8 @@
 ///
 /// // Pop the items from the list using `pop_front()` and verify the content.
 /// {
-///     assert_eq!(list.pop_front().unwrap().value, 30);
-///     assert_eq!(list.pop_front().unwrap().value, 10);
+///     assert_eq!(list.pop_front().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(list.pop_front().ok_or(EINVAL)?.value, 10);
 /// }
 ///
 /// // Push `list2` to `list` through `push_all_back()`.
@@ -135,9 +135,9 @@
 ///     // list: [15, 25, 35]
 ///     // list2: []
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 15);
-///     assert_eq!(iter.next().unwrap().value, 25);
-///     assert_eq!(iter.next().unwrap().value, 35);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 25);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 35);
 ///     assert!(iter.next().is_none());
 ///     assert!(list2.is_empty());
 /// }
@@ -809,11 +809,11 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 /// merge_sorted(&mut list, list2);
 ///
 /// let mut items = list.into_iter();
-/// assert_eq!(items.next().unwrap().value, 10);
-/// assert_eq!(items.next().unwrap().value, 11);
-/// assert_eq!(items.next().unwrap().value, 12);
-/// assert_eq!(items.next().unwrap().value, 13);
-/// assert_eq!(items.next().unwrap().value, 14);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 10);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 11);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 12);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 13);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 14);
 /// assert!(items.next().is_none());
 /// # Result::<(), Error>::Ok(())
 /// ```
-- 
2.49.0

