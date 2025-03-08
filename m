Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCDDDD2
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Mar 2025 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741409140; cv=none; b=N+GHhoNmMAM2zDQ4xD9iNGsHuCjcVv8e5w29Beo6tQNJCD5fMrg2dS0Y4VndyH54i6gRAzVwm0fI5rhWIN7utVcYdH5H3tJLmsNyEkpvOM1TTA1vgGYtph20ryq+Y9Fl9y6m8DkVe6U5Y+q3WN6NzsBoDIbjYJMHHrbbfatpRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741409140; c=relaxed/simple;
	bh=IBudWUl2ls7LmiDiAu2Ky9IlWjBqIH29xpz1lgqBSjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmVgCZmkzGmGzaG6NIWwh6MLRwK1AMqgbJkJfJYc2VyjjziOtGXr0AKmkSkAGzb5bh93QEHgPZpfyxpPMi575/G4fJ0d8pNzUxZ4klhPURKKb+Z7+1GMzRakffUWrhcVS39dvpkGI0HheI76BhUP/WpNozxPmhOsIMXXIzOz/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erhez8J+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erhez8J+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2239aa5da08so41943125ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Mar 2025 20:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741409138; x=1742013938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGhcUqpeqUdHNZz/ZiPVeAeXjUxpJvkCkjVpTh10fZM=;
        b=erhez8J+SwvLxtUMVGtrqrdtfYp/PpB8vIDNmLmiulD0EA49mm2z6ha9njPhFKdwoa
         afQJncZoxWIrZ5zYsuhpMMINkHJ8A0VUGVHCP3ndl+slMgyNYaOWmUTe+mm5rPiiy2sR
         yEq4Snw8vGYVKwIcOtxBUPHX6yu4SfFWbsLxVI80jbEUOnxbWsgw7j2VJBU0rb3OmhJM
         yYKRdZl+jeIBQM5/cuKm+bydhMA3E7xHj82x6V5CR9+KdhP7wWTKyGLonuPcJm0cImoA
         8sfYbVif1DgAndOfWgqRgGfau4pCBIAEXEp69WaDD6Z1U81nIktWQisXEhNQw0IghT/K
         2Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741409138; x=1742013938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGhcUqpeqUdHNZz/ZiPVeAeXjUxpJvkCkjVpTh10fZM=;
        b=XZHwXSZxr+lDAn8YGvzFlwkSbK61tdSQyq1G9RXQBjoS3ufKHPO9+ID5UacUI9dh6x
         SYf5aBQbz/JKvR1XehGhAUK9K5sWbBQoOoKLYZ30qPjTkaYTWlCH5lKzTYD+AhOYYKcp
         T8SLn3GDZnMKn7mZ5S2xi6dOclQ0JeNcqbhKLsWZseVzGD7vq4lNUUjbtFdruG6opzAV
         mBF+V9votqtoOq8kVGt7X1yT99gnMyUMIsxr/G/Q7VruEG22HwI1xot7t4PadO1o8JFg
         EprHVLJdTUJoPbOYaEZTSvhwZdcnLjqox24VE5mySDpFXWNJdjoczByx4nhEHO5d5oHK
         4XxQ==
X-Gm-Message-State: AOJu0YwQ1W+po/TY5Khowm+Bkbd3dpvc3EOuYgrUJTknsnTsrtPQbdZQ
	jYN+MrbzVpXjyS74sCXVfbHvOfSA9/d+dG3YuSzkBm8s1M6sylP+
X-Gm-Gg: ASbGncscZcWXkR6YFEXl5PVgxZWbdO3/AOvrMVi0f4I4AjrXotMOjd5VU/4jhzaPzYf
	Bfu0M4B+8ZFGU7n3Gov0B6kqShOCehisZlDBl9qmlJaToWLBLBnUWh8Lq24xLa0zvCVxJVMR2/G
	CtMALyrYV5uK+XRyuDS7IoUUz7MVhyUPLHA7u15QmiiK/K9XQTRVBqmkOVyZRsB+oteUG8vMxrt
	68N+vw0+/Jbfk3OTpRFUBVnqAyp7NHyZFY3g8D6DuPW338yzoKLFJFYrbh2rdaARggun3VXSHlH
	+wf7no9SyrHitxBpu6UTsAgR17kPj6wka902uhJTwS32+mkI4fk521NJU9RVzaF3DDD1+0TRIAk
	DHEPXXp9HOM/XtgA5aNUWFg==
X-Google-Smtp-Source: AGHT+IFr2SlV0nkQoO9/beCahp1QzpbjlackkE48H203igvhmZOTd/eCE9q4xJ2PzGkXBDdhHdkfFQ==
X-Received: by 2002:a17:902:ce87:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22428ab58d8mr96470795ad.31.1741409138569;
        Fri, 07 Mar 2025 20:45:38 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a8209esm39026265ad.129.2025.03.07.20.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 20:45:38 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v1] rust: module: place cleanup_module() in .exit.text section
Date: Sat,  8 Mar 2025 13:45:06 +0900
Message-ID: <20250308044506.14458-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place cleanup_module() in .exit.text section. Currently,
cleanup_module() is likely placed in the .text section. It's
inconsistent with the layout of C modules, where cleanup_module() is
placed in .exit.text.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/macros/module.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..36daa149a691 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -275,6 +275,7 @@ mod __module_init {{
                     #[cfg(MODULE)]
                     #[doc(hidden)]
                     #[no_mangle]
+                    #[link_section = \".exit.text\"]
                     pub extern \"C\" fn cleanup_module() {{
                         // SAFETY:
                         // - This function is inaccessible to the outside due to the double

base-commit: 6ad64bf91728502fe8a4d1419c0a3e4fd323f503
-- 
2.43.0

