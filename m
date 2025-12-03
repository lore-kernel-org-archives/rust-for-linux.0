Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FF482EB
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 00:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764720307; cv=none; b=lDiXS/aWWqf0c7tAH7KRsTDy13jMDQtTjVaiS6+ZTuo/WhEMdnkbNVtpQZs4DwRJUVRE/Ktk3YmGKXr1beaW991aUQ2mQVwHZNO2KbhtBpm69lN1WdNPS9Ncp7NlMp0OY3yGrg40CmWjis8cqFSug7BuVrSM1RtULjE+huFzESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764720307; c=relaxed/simple;
	bh=pU18xr9Qg6TGS/CroaoQM15YOSZGIEUw5cd5ZzWiQz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+ortVF6E/CcFwn9HGVAziJgFRkYmbbAVSWm14U/RXfOt56uNQ5PliHbeFOKkYRsg/6tugpmdCj9TpBXe0qWMJVowqi+uEYEGV2dWYRx/c/kRnugVsWAezcU3ugem43b7OdGu83DbzJtdpidbOwVYbq8KdH7SBKySk+KY4DXfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExQej7Vj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExQej7Vj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298456bb53aso78811325ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 16:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764720306; x=1765325106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftJBnY95jyv5ox9re96RcI+ZHKByIBF1FKoHIwKf2Cc=;
        b=ExQej7VjSe/CuE5kdK+9fY7cAfgtnY2g+0A6UvlOFs/hJ2S9bp5ipy1ntINzf6ukll
         pmKQH2pO/6+rlW4KvBeDPDbTFh242A4LRAdNpu90qPCIY+y8uDNDyPzG2dtNacjR4VJ8
         yWSXM6s2vhw0o7oOInQH9rjshKO/ehb55ohi6oq6v4Wn326ynnszAWxP6G5e62SaY4JJ
         usAW5+WhvuXdn7CBc+ycvgkru8NzT1sbxL7hzfCH1Tei3VgncRAdWrASYKgRPPX/NoFg
         EZlV6Bgpn1gHDIul597z/cTislaQDRe3Wg8JigIU2hkX/S3odJiTK+T7JWWhQQnDzUZo
         oxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764720306; x=1765325106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftJBnY95jyv5ox9re96RcI+ZHKByIBF1FKoHIwKf2Cc=;
        b=StroOtCtCLrsM7qz3H+3PQu6juM9RrIPO0/teMm6Ou1ct3FK33m0YaieeiaAui29Mz
         TrSfzazwkMPe97aCBIwHiAv00g80ORTnecvIGLkvYrprJZ4CWB93IFd1sSiXyE3CR79Q
         aEidqTlaXjjG8o3+HRHTP2N31cQBnXXcIvfNI/uK5EzNd3ctmww13mVT5zx/L1hbOd3h
         t1w36dRfYJ8QE9gM7RRPRLyK/F0tMMTUJY7pEoE2cot7CvZ8ooHxra+C+OsgFE0yytof
         h0PAPNcCA+qG11lTyl5upX0ZYqLy33m5sS5wgsdFMEQg0Bcd4VutGOIi862c92NypdAj
         YUvg==
X-Forwarded-Encrypted: i=1; AJvYcCWDl0G8naWSI+aL1kJCLNJgjjtnostKjJ/JG8hFs76qNEBwWUzKPEn9EtzS8XuTgnTVDJDH/378vFsjCVLzuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjgsXqNBm89ESmPXXcYBsAAM2JWa46IuZdO6v6NJZEmpwko8W
	2zaqzrJkN1dDhsK4xTa0Y+mYXM4/3NtoSxmnWzGO9DW95kFyvCb2NXyyr9kpZA==
X-Gm-Gg: ASbGnct4Bx3OQ6eW69Sz+Jiyn9zyY2ExQkWjc1b/nFdnu505/OOwJaG6A90hkdTJ3Et
	EdN0xTtfLnY5LdQLQMk1D5xdrxQ0Qpeekw7Ll//U5OaBTNXtc3hcL1qwQt8VlH07EBYBEr+LBOk
	ehBvCCb1GbJ3S0VKIBDUNSRi/MPqL7B4tSzBTkpEwdJkeXU2ryVwEPgz46iC+tY0toWaxi6Km/h
	uhHzVdesXQjUjEKfStB4KhpScKg8r+Dx/2AK6kv6pUSUpsI6lsMRu96AsguFvnCtiYOrfXW64EB
	F79cz5Aiw8h1viyBR018Upsxm1AGsdh9+DqlY9r9OVHi/DcSWWCM3HrGg0ci8rUa5ueywHXYcRM
	ZENa89gGE5IAsBZ7IJTBFnvHYlFxnKf3wO5cNxw0yW5lA4NIp+rZ5Y7LR/pLSgJSKHlcB5Iaigv
	VgdDCCyt+a0qPsvfuT6If/WuZWLlDIDj80behNoF9cboPNGQZPD9wCJisV5XQ=
X-Google-Smtp-Source: AGHT+IELVNFtmtQ5ejisWD6FByM3WirUboFUM09wqQB4cY82Jx86Ijo6e67qRYE2vGpFXH6VJ7eVUA==
X-Received: by 2002:a17:902:cf08:b0:295:1e50:e7cb with SMTP id d9443c01a7336-29d68303466mr4617025ad.23.1764720305515;
        Tue, 02 Dec 2025 16:05:05 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a03a3sm18370912b3a.29.2025.12.02.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 16:05:05 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	rafael@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1] rust: debugfs: Use kernel Atomic type in docs example
Date: Wed,  3 Dec 2025 09:04:11 +0900
Message-ID: <20251203000411.30434-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the read_callback_file() documentation example from
core::sync::atomic::AtomicU32 to the kernel's Atomic because Rust
native atomics are not allowed to use in kernel.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/debugfs.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 381c23b3dd83..9236866d6285 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -158,21 +158,21 @@ pub fn read_only_file<'a, T, E: 'a>(
     /// # Examples
     ///
     /// ```
-    /// # use core::sync::atomic::{AtomicU32, Ordering};
+    /// # use kernel::sync::atomic::{Atomic, Relaxed};
     /// # use kernel::c_str;
     /// # use kernel::debugfs::Dir;
     /// # use kernel::prelude::*;
     /// # let dir = Dir::new(c_str!("foo"));
     /// let file = KBox::pin_init(
     ///     dir.read_callback_file(c_str!("bar"),
-    ///     AtomicU32::new(3),
+    ///     Atomic::<u32>::new(3),
     ///     &|val, f| {
-    ///       let out = val.load(Ordering::Relaxed);
+    ///       let out = val.load(Relaxed);
     ///       writeln!(f, "{out:#010x}")
     ///     }),
     ///     GFP_KERNEL)?;
     /// // Reading "foo/bar" will show "0x00000003".
-    /// file.store(10, Ordering::Relaxed);
+    /// file.store(10, Relaxed);
     /// // Reading "foo/bar" will now show "0x0000000a".
     /// # Ok::<(), Error>(())
     /// ```

base-commit: d61f1cc5db799f4e44a63418b2dc19396787427b
-- 
2.43.0

