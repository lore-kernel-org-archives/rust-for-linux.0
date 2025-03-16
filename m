Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADB1991AE
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106050; cv=none; b=aNxyYqJyU8vJg2XdFz0fABKaDuKBW4fbgG3Wab6iWs2T3jiqAA/QzE7c/t7DH8iMICzeo5kL6ISiBg7VA0jnEfCKeZvrSortpA1wcTFZm5HZmzpESmEUO1Ms2kEFU/IJt4Ty2j9327GGX1pHrYF/RPofRnmb1IiykL/pHVpfOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106050; c=relaxed/simple;
	bh=Z9A86z+YKnLxj6Pc/4Sz3VoZKlmxCwyepSUhZmQaVOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6KTD/qFnm9uvqEqWeBDhTDi5vQ3+e86MgxGr8ZWlEharPTV4rMEDYZ52fXIE/p96hVyBszQZ6nu2/g5zcw5Dl9ZSPe1ohCPnaBO93bActC94WtZB8trcEWN4N+0Nu0eQer30GfNEj5y8wZb4W0mKRsufKqHRhZQOdoIf4wBdIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=uAHK1fk6; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="uAHK1fk6"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e573136107bso3162667276.3
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106048; x=1742710848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08/cACHsl0rJnzSWTKso2YB6xU3/2NCWI6+gK/VtywE=;
        b=uAHK1fk6w/3bPszhkV/Et5IbYBa9BzC/ERRRgsV13FwxxcsGt2AyGbjmkI+rviB3Gl
         UIdHTF8E4oDLBIguGTIxkzVp6ecz+uUwkI2MQ9l8+rhm/P8ufECooiW4T4hyiQPEkiQI
         UmBisY0n2gbHRjFg2zYdjpJfeHJyjEaG+JUh/wDXF1ApXoldJkMFXQkBZRnELdNNhvwh
         5LN/+Uv1mlBvXp3kfy+FG8nuvZMWr9ZstfuaBm0gV8Y85wndI6PA/yoTHkf/JQliotf/
         GhM1ljKLA614XcEDAxkKhQeC7FWqjzHuRiMC3biAgp1Gq3s7KpufhEXayqkRc301TzDk
         17rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106048; x=1742710848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08/cACHsl0rJnzSWTKso2YB6xU3/2NCWI6+gK/VtywE=;
        b=trQqQ+sFgE/0eY3brr9CI/73t8bZn5Dnr7wgRXkL/2lXNaWO8+qMjjhaYSX0FSPVm2
         jAXGb4BWQeac+WEHVflmh/b3f/i1mmzcXQCWKD6q++605C99fJT2tJzZmTRTr8q3yOWP
         uB0ZGHsZrK99FdShaADKOCRIPh7uBk0ksC6Q0Pkrl6fo0QiUM/wqD6CINPkcRFxidf87
         JMiwuJNKJsk2DFJaJFx1gPorao2eTmH47MrStU/D+qA55yj9ejGjypX3yb/v4VbN2PbK
         2pmIkTwDHmY90zHEblW5LY4E0yaNh+mLfyozT9emAtm60/GrlxIfSdLwhWjwQXCtSqTZ
         j9jw==
X-Forwarded-Encrypted: i=1; AJvYcCWt23VHn+ll9VFeScG28F/5YHbh8NKL53P7LPh46+7quGIF/GGOucdA3Tz5bA3GsmsWe4Z2r9oBz9dYgqoZ/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpy6AGBSNquTSkdElebsRQpmFhAMsTEletwtCiNlMTBmuiN0oN
	lU9VjuEbprtycV2H7oBwVpB1b7foKHdVmYFqoth9OO7BsjcHiyU8BoOp/zWIf5IfugBtBaL/eBO
	0oX+odA==
X-Gm-Gg: ASbGncsUXaQGFgtPA3sfMxfDRgS/6XFvs5aKYsDdhIKNDe2Y5q7kedeYulh1wCGx8f2
	SLsaXnF1Jn+8dL7BJhcIccQbiojMaTCYJ4rF9z34ZQFdC/ZHiidhGCYTEXWtYOcncu8dreHkLOy
	KSDpEeS4XJDdftWOBUh6zFruwQK+Mudg3pdw0Ox0UVc+3INjx4BHICRWxCU29LxPEKetD6J1Bmr
	gfdFYh09O//LR7VuxASpgad/OngKi0DVT+QeQ4SR9D9yJvwxOZfKHF9DLEHaHZ0qkoHYcmP2fd+
	TATmOGxoDhuxTqV8GJ3WYxljpaVxcZrD0EgdE2wcD6ZRp1B9he+eS/qrUQ91NCZ0n0INDyrG9YG
	JOk9IE56sUc+PdsoyNoeiqiw4AlJVEQ==
X-Google-Smtp-Source: AGHT+IEhkAJsWUyybL6v3YR5TpDlL4AmHn8owFLVBv74QVPjBUednCbEsjgV/C0cbes2j683eM3uXQ==
X-Received: by 2002:a05:6902:2009:b0:e61:1b6e:b34b with SMTP id 3f1490d57ef6-e63f6608fe1mr8701587276.49.1742106048097;
        Sat, 15 Mar 2025 23:20:48 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:47 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
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
Subject: [PATCH v4 12/16] rust: sync: arc: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:21 -0400
Message-ID: <20250316061429.817126-13-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316061429.817126-1-contact@antoniohickey.com>
References: <20250316061429.817126-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/sync/arc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3cefda7a4372..81d8b0f84957 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -243,7 +243,7 @@ pub fn into_raw(self) -> *const T {
         let ptr = self.ptr.as_ptr();
         core::mem::forget(self);
         // SAFETY: The pointer is valid.
-        unsafe { core::ptr::addr_of!((*ptr).data) }
+        unsafe { &raw const (*ptr).data }
     }
 
     /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].
-- 
2.48.1

