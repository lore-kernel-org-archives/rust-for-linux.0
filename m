Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CF91384BF
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Dec 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733570716; cv=none; b=ihITEMr1AEir0A6paGI2L1AcNLHwLtF5DnykkUBU8ee7j4sgGUb2vzQb2D3cCDUnM2fkzq9F6y6R5Se1IeF726eFhNEuOq5nQRexeJxLsUWIDyVE+9Un5NVQO/A5dUYT6BhoGNXyPBLHll3oilA5XO1jdAqfw4eoFsl0I88zSw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733570716; c=relaxed/simple;
	bh=qFuGG+N9tgcUee753RHQEEseqIMRd9ls0yMhoONlTOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKN0VV4VugIDkoWIATP6K5GOK28RMuL0sJd+zCpR79wXOc6nGHIq0oWBN2ZWKEN0pUkiwyyipqTfKSBadU7HCz9K4sFfE64MtGH8FYz4nWTn2lGq0NLv7bwCD32RFkAa4n1BHfDWoDPbHVvWgar3MZqexbLWqg/kugg7Vcd3uYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=S7xu9ANE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="S7xu9ANE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d123ac1c3cso3135657a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Dec 2024 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733570712; x=1734175512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V82OCN3GZyXBk60yqJAVkpi9cFXqiszjtTz599Vjfkk=;
        b=S7xu9ANE638pPHwtE68JWDphq8DhMhrHXAZu9AqPK9mMLLq8CNo+nXWHkRcjNdGAbv
         1xLaVXxGQR7rL7sy+l2l8a+xVFSWhjtWLRoroougxyAaVojU77aeWmDk4DT9mEOM8X/j
         XsBcWWJZTsbm4iylmQX+G5mcEVxmeP5Td/FjSRvXRCJUKP97wxh3e7q0qZ6NLnlF1u/E
         qNtvNQXFUjr7ZQ/dwnQ+W25Eh77izNX6Fit11vmc3C9HO3N5tBdOSL/KfwUJPDStlTZY
         T39AcNUel/YFZLGZKTWqOWFf2YIxDHGw009t0L4+Zhf1PbBr2ESoSoiCxjBjkIl26V2x
         /p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733570712; x=1734175512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V82OCN3GZyXBk60yqJAVkpi9cFXqiszjtTz599Vjfkk=;
        b=sxCyDiujdo1S5nHz0XkeVjjrc8vaXH8A3B98mA6EzxuI66jsnB86jK478SMuXR9Eq0
         6SWsYelqFjIZP/Ac/u8nu6j25oeq58HFloPu5IjxAqvSYuQfLnTZzdgWm32eIuJt1Mtm
         Oi5h4BDpyHuL6AMnIqs8GRXL0OJMlvRAdjJ34M61e43eXUMnJooxh7bjnWNsg1BAiPhu
         gCbwUBaG8UXTJAMDaqyiUakwghFXJgPMVphKqQtKBgNbxkfOVUu7x2Pj/BYeNUUUKY+L
         OfAXEsv+wVGF7OVoiuiuBOgw1tNQ4gncmgANMH8KR8tBxPPWS2KFU1jGujcMIu3Mv+nA
         zQxw==
X-Forwarded-Encrypted: i=1; AJvYcCV4vJ3CwAALnsXVrrVKWOzIwmaYy2zBExH7xMrzn5apZCBvDADWlw+HfSz2RW1E44T1g09/y6SBakcdonk5Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrLt9U63i1d0grnUUmmMINWG9B7WEvlLBY1lP20klzOek8Bzl3
	8O0lcNdAaeeTl6RqGVmN6zcjFIcqCxJiQWvKImXHyqC/may1rSbKwEsikd81Q8yleduu9VTMoLf
	CC1E=
X-Gm-Gg: ASbGncs1ZmsDPzg7DZYuNnFtdigPyiP0oIbVmW3tXxudJk26pm7Qq42nyZhElQSrqsa
	8/VA5/gerD6Q8YwUZixjpL5n4r1ZCLHxVmiyfJ7EoNYFS2uFyiYUz4BPs6k6iYOyT1Q6U+cKami
	MaXqsiQzlJXNz6jSSKbplnP9DUTZ6VTEd32LscSITQIEdmaEGxbKvQ+T8sbEOKkvkcbkw7ZXvuv
	Cncn0mNcpP+I/FLXiCkZM0rsJjZSxXUaukx/N0MYRg=
X-Google-Smtp-Source: AGHT+IEbyY39trpMS0oKnt8+hnPjyjVxjvw4lKkuwj1wqoENdh+gRxz81DkQCeADRYLOnc3UpHgGrg==
X-Received: by 2002:a17:906:1baa:b0:aa6:2f8e:1f21 with SMTP id a640c23a62f3a-aa639fed46bmr399454366b.12.1733570712498;
        Sat, 07 Dec 2024 03:25:12 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e5c76fsm371404266b.8.2024.12.07.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 03:25:12 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
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
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v4] rust: error: modify `from_errno` to use `try_from_errno`
Date: Sat,  7 Dec 2024 12:24:45 +0100
Message-ID: <20241207112445.55502-1-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the from_errno function to use try_from_errno to
reduce code duplication while still maintaining all existing
behavior and error handling and also reduces unsafe code.

Link: https://github.com/Rust-for-Linux/linux/issues/1125
Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
v3 -> v4:
     - Now everything should be rebased correctly.
     - Link to previous version [4]

v1 -> v3:

Currently, there are three patches for this issue. There was a race condition between
me [1] and Guilherme [2] because we both picked it up as a "good first issue" without
knowing that one of us had started working on it. We both agreed that one of us would
be the main author and the other one would be noted in "Codeveloped-by." However,
Guilherme has kept radio silence since [3]. So, I am resubmitting the patch, which
builds on top of [3]. 

Link: https://lore.kernel.org/rust-for-linux/20241104185135.18974-1-daniel@sedlak.dev/ [1]
Link: https://lore.kernel.org/rust-for-linux/20241104200014.12996-1-guilhermev2huehue@gmail.com/ [2]
Link: https://lore.kernel.org/rust-for-linux/20241105114819.14051-1-guilhermev2huehue@gmail.com/ [3]
Link: https://lore.kernel.org/rust-for-linux/20241123104857.49385-1-daniel@sedlak.dev/ [4]

 rust/kernel/error.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 52c502432447..9b508f10c211 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -101,19 +101,16 @@ impl Error {
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
     pub fn from_errno(errno: crate::ffi::c_int) -> Error {
-        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
+        if let Some(error) = Self::try_from_errno(errno) {
+            error
+        } else {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
                 "attempted to create `Error` with out of range `errno`: {}",
                 errno
             );
-            return code::EINVAL;
+            code::EINVAL
         }
-
-        // INVARIANT: The check above ensures the type invariant
-        // will hold.
-        // SAFETY: `errno` is checked above to be in a valid range.
-        unsafe { Error::from_errno_unchecked(errno) }
     }
 
     /// Creates an [`Error`] from a kernel error code.

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37

Daniel
-- 
2.47.1

