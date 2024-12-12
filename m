Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CF22331B
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018481; cv=none; b=WMWdfgNBnbfffoL6VMsv9WsEp1EeEsNfiKGnF+BjuG6auh+XsGEln7+bsjj86wgK8Jg5OenXm201ynx/8VGN5U27xIFU9Ocjv46FGHID0XqWM0Zu3zCuNTqhdAiaPLtc2BMBFrfnxbnrHMjJ3hh+vog6nJPZ0ku15bGcr930+O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018481; c=relaxed/simple;
	bh=3WYdMQkhckrDwTHO2KC2eMO0/yGt7G8S5Rf6vGsaWZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPpejjAQ7ID1RX+fo3ksRhze3JcQQV3pC82YA+dRHhtD32nQMjDwlvTzUY8kCF1nVtnAf6/4Cj97dzhIOHYqhhCh8Cus5NH44eUp0aSxiy2FswsDLEXIclkjMYks0GbitGEboGm1ca2AgfBm//F9EM/JSsWW//ryJssKNV8fQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hL46ElQQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hL46ElQQ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ee27e905so957795b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 07:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734018479; x=1734623279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUI5yEgTd4WX9VhXN6l/5iAt8DorYvvUuTlDkNuiq+M=;
        b=hL46ElQQB6Q1VKcyl3ye/IZDecJiXn/D8B5ikM8HRAl251LfacTWMyqAzXiDmm6mbD
         w71Ty5dn9nSMyvCBIohPZByKDZQzLG7Y76C+RXlkPhLSywf+NDq+IZyEFnfPkgbgtU+u
         6aFLGV6ChCi6qJMgwWYbi1n3V/Wqs4wwqhtdBnusP04YeVfL0NJqHYbKYMBU7dmgUZH5
         sBWqhQP7leF9WS8gZNiD/6nN7APccflm8anlB23So98PsKJmfS4Im+fawtVVt0QTmXUn
         K4zIGO8q/jkOiGuZL0vmKVNego2AZGxnqWguk/ELfz+mcJItFBsA9ZXMVtszl8qNXMvU
         w12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018479; x=1734623279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUI5yEgTd4WX9VhXN6l/5iAt8DorYvvUuTlDkNuiq+M=;
        b=nih+AHMKywohoqAezJVyDP9plnLRQT2hRiUI04x3h5Ein/uCH54hGJWMy/YLB1qnXP
         Y4lQoCeVlHiJFi1NaO3uvEu4D1A4HiFA53Be7o+HRpcNw9S47FRId2rBUzQylTb/e3h5
         lpKrb77Xvs3Ytv0TrWUw8NKEoz5Yttpif53ElbRaZH82cpV6bvmk1yLarQ3yBmkoCe3r
         1mfsxn0HgjEBWIt72Xk/2lDGnwd6Mmii7VfQblWVvHAVOgPUlqG3zWr9sR+efYduMvZ/
         qNhHXefUF/ni+22k7SelTfA2Jl9SMF8QHAfruN+q9dMW5kzoGMG7lSicu19cTO90HROq
         Bedw==
X-Forwarded-Encrypted: i=1; AJvYcCUEDoxVs122lkkcVr5V9bXzjNxk2O7AXXgrCqVjF2cyivAybVMBlp6gy3GHEq7i6mU7At7e8lCsDWbmYyN23Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxknim10azIfBF9s50rZRRST7EVnihd8ITvnul9lm6Mr4BjtG5Y
	Zi8V9I2Mz/3UJPxGCB/bL+qBuou9Gqv1GMWrusoj29dX7hUOsvV2
X-Gm-Gg: ASbGncv9EpnVhJlP19T0TV3oojbbpKs4WotbaRYoF977lBoQk0EEEiDzZHm0PIVHI7R
	GJlgrAXuCTUOh1V5th3PQfMuyiSeQUXw8cW6e7Oj5oRjXRCJ7j1rQfrgZZ4de998XhvxqKQWfj9
	MHlVt+jp0Wx1NYPrlWVRALwIHv8Aq5u+678hPT0dX1bZ7sY9TbIjuufdwCUxeF1N4h3RueqqzKG
	5Vyhb0oZ3+tSzzKl8BtnbuT+lQ2YJhOQsL44Moe8h+LK1ckDwqRhlTSbxXM/g7VfKbI
X-Google-Smtp-Source: AGHT+IG6hegoIO8ucMbj5OAK/JFqawTbXgW+cUDhWhKA6/EiaVvEv4jd1KJ6V2gI4AabQbvarnAurw==
X-Received: by 2002:a05:6a00:cd1:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-7290698039cmr907296b3a.3.1734018479596;
        Thu, 12 Dec 2024 07:47:59 -0800 (PST)
Received: from localhost.localdomain ([73.109.132.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7273c38502csm5814460b3a.5.2024.12.12.07.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:47:59 -0800 (PST)
From: Jason Devers <dev.json2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	boris.chen.czy@gmail.com,
	Jason Devers <dev.json2@gmail.com>
Subject: [PATCH v6] rust: sync: add #[must_use] to Lock::try_lock
Date: Thu, 12 Dec 2024 10:47:53 -0500
Message-ID: <20241212154753.139563-1-dev.json2@gmail.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
currently does not issue a warning if the return value is unused.
To avoid potential bugs, the `#[must_use]` annotation is added to ensure proper usage.

Note that `T` is `#[must_use]` but `Option<T>` is not.
For more context, see: https://github.com/rust-lang/rust/issues/71368.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1133
Signed-off-by: Jason Devers <dev.json2@gmail.com>
---
 rust/kernel/sync/lock.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..aacc227536cb 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -147,6 +147,8 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    // `Option<T>` is not `#[must_use]` even if `T` is, thus the attribute is needed here.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-- 
2.44.2

