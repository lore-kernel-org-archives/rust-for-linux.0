Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A972236F0
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806182; cv=none; b=plglLSjhWb/DAceiQKA/WN7D+asb5kiLuoycG/ER/Km7J6dxOLXZrBlaR6e34UhdETCFZqmi24N7c5t4dyEgQmOC7Vw4g5UILAYCNMCWmcF1jXMArY/O/BUFbQWPHSTWxsaw73O8ZS6Cj/4TtiPNXm78PlH9S2kMkbAOP48DRaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806182; c=relaxed/simple;
	bh=A3QW38qDYUoVLDFk9H1w0o/ysF5g/novqjoPiVXHyw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nipzjJUHrvEMCKx22GLN20kTWs9lQuF+1kxn6bSJjFMzLgBPbz1txk1WJ+NzRaFpHyCBmV7Y//l7WOKhGDzHdkszy/mibdxwNq7oiQxa2km/sfrMW+r5ylJAMjoz88/oRFaB6+6EShd8b+FoYUwPlkCPKBa3VM3Cx1KAOY/ZQLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c47ee987401so1663984a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 23:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806180; x=1769410980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSmDJwA0kw7CcIZslDARhH5y4gs/5Fi4LbdxsUMInnY=;
        b=LwusT5z8WqriC6yLR3L0JIhd6dqCYFO5E16cbQujIMJe+WZlSUSrZzRdp8+EzfNZlZ
         kiUAoiIPytLmJT5LJxzFugBm3oVGw6GjPeek17Co1d4+xZyC0IkelBzOGDVoEm6/+p25
         NxxXOMCYFr33cprZdAW7rjUxq6XO6UfJl2CvvWOKOTC3Rxj55VKu/8WUBwyAYVHVSHhs
         OGE7yyJZVhDTBshjubBUKoKg4f8XNhC26Phlw6XLPKQAQGL0P4FyuPevXHgtiLtvnO99
         nlCgifS6moeELGgo0D4saNCPJ7XdUKglnOMRsCcIvbdG/bYfL1ihEZrPFjfRdBjlrOXK
         WDNg==
X-Gm-Message-State: AOJu0YwTN7eD4uSfrCAerDC4I/6PIGzbaqBxdwiQKzXULuVENtChU2Kb
	1r/DP9Ji8T3BwkoIGxCqGiveCzWUMmxhDvJwfItnEDUUPreqhj5LfyWQ2VN7tzvh
X-Gm-Gg: AZuq6aIQLYiCey/RxSyT729ws7iP7Y2MrOwZ8qsdcXPp4uZFqxQhLU1bSxaw8xz5MUn
	o1qgYSO2XDEg+N7jHM56knJfga0EQrMZTReWqfTF+5NehRidmpi6ECBcMuvZXlIazbWxK6PacOw
	41JSIWmz0g1Q9opwosJKQCrdfVYJuy36TWQbixXVd6kj3D8EPlt3z/f/FVGpQEk4LMdB1GduyO2
	r0k8XqR2ANHb7QD4EcQU2t+7Cz+WjS+QzYKJvz1kffRy5XyOQ+pjLjzWzyFdmeR3vP+q+gEdSGR
	I3OzjjRmDToHixv0FcKpwPSuT1oHMAr3rpopG1n67VOY00SKY8WpJ8+jZ0+ZZ1Hica8/oDNmWH4
	20bDkqkIvzXbRHb68dPZSe6yWDmpTxTk2LIdDAb5fe/O106Rs3Nee3PVUGUsV1YbKidk8HjSyTA
	NFGRu6thl9N6+UUR3FgToRfgl7wBFo6xRw3gxXmWANlsFw
X-Received: by 2002:a17:903:986:b0:2a0:97ea:b1bd with SMTP id d9443c01a7336-2a70087cbfamr128207655ad.0.1768806180439;
        Sun, 18 Jan 2026 23:03:00 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d16a8sm85105785ad.39.2026.01.18.23.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:03:00 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1 6/7] rust: pwm: use pin_init::zeroed() for pwm_ops
Date: Mon, 19 Jan 2026 15:02:50 +0800
Message-ID: <20260119070250.1925175-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119065859.1914178-1-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
pwm_ops initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/pwm.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index cb00f8a8765c8..c1178ec51e388 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -496,9 +496,9 @@ pub(crate) fn as_raw(&self) -> *const bindings::pwm_ops {
 /// This is used to bridge Rust trait implementations to the C `struct pwm_ops`
 /// expected by the kernel.
 pub const fn create_pwm_ops<T: PwmOps>() -> PwmOpsVTable {
-    // SAFETY: `core::mem::zeroed()` is unsafe. For `pwm_ops`, all fields are
-    // `Option<extern "C" fn(...)>` or data, so a zeroed pattern (None/0) is valid initially.
-    let mut ops: bindings::pwm_ops = unsafe { core::mem::zeroed() };
+    // For `pwm_ops`, all fields are `Option<extern "C" fn(...)>` or data,
+    // so a zeroed pattern (None/0) is valid initially.
+    let mut ops: bindings::pwm_ops = pin_init::zeroed();
 
     ops.request = Some(Adapter::<T>::request_callback);
     ops.capture = Some(Adapter::<T>::capture_callback);
-- 
2.43.0

