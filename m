Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760691;
	b=kKijpquIDEwbstWpIWuxBKmwYDonIA1amjV6vrmsZrIf65PjUHG7RYHuXkCSiyEz7y5n
	 BKTWgt9arHv7h8CqoYAleCVzXYmUM5eH1qiWDfrE8HwVpaiYprGMtEfBk0DgZb/7DJTm1
	 gKsvtnjg5OdrNxj4cOlNxU1eyGQPsO/o7AT0P7szX2tXOtvjOVCDUQxN9zOOIfZcjukNo
	 uAuL6dc724dCNrKTd6D1ALwjrRW8YtVKc1mt9M1yrAge70YYX8bYoWTJPPiCNu5GGCGJ9
	 0VYqvCmwqsPmC1SGfAf6GWSkloH0eNKbPQnRLEJ1yFbkDfih8Nj4u8RqhsF6c0RpBgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J/9Qj668b8yCGUf9keY9GwKS6HdGazYw0/H94SqUfB4=;
	b=p59Ra3OKnM4Su+/K75QjhrE8QY0YyDllGsNM7mjZtIUDdnvkbt5k5/rbKEv0T3yF4fX6
	 +6YusgWLF0XqmW/gQnrg+0WNPadAcqsOxLh2X7z+Ki2rnE/Dx8paSQ+FbEf+WT/cMBKCl
	 CUXacvRUJ9z4foQm6IeL3Ap5DZDvzHC47EPQgxs0jmPOA5WVn9gC+j4i0jFefT5wXK9Gn
	 BwgitNKf/+lEOBeIqyKhEf2wssEXlr1TuDmrNGn9KYpuPtlHxPBzXrZ+hWKxZDuUSOrTb
	 mW3nZMtR1PCgOBxvpsa0yu8L0Mmv1ZEmchMa66e1aKBihu3kkYvy4gXemVijyiYbS1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EXIEDt/g";
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0A606A31D
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 13:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D0A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EXIEDt/g
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so437076a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760690; x=1793365490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/9Qj668b8yCGUf9keY9GwKS6HdGazYw0/H94SqUfB4=;
        b=EXIEDt/g77XCyjvCOrXALm3ZjHJcurzVbgOuPo4yHc8b9BSFah8t+KxTVfVdO5QG9V
         0NqJXHIxid2iTef539sMqBLQYJxS/4iudVK6vuejtUfgqVySseLWHX5eE1iQOu81gAqD
         MpsqSTgdIxnQyB8lkVxQJuMSL/PFLJIxgVdgMsEEolkqIQ/jOhqd1FXzG2LYLTo8mvyq
         REBZ6f1G0tkhszg83Eo7BPUKLk+tRFdu2ZfhneMHQ2I2QroxV1mxQ+1EZ4Av0U+wtswl
         cmsRBa8cCbx+OuY/8T2FQTy034Rotx+u+UwHD5V7ThgYg+58uHbB1iUuOy+AvWeVZWM1
         oVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760690; x=1793365490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/9Qj668b8yCGUf9keY9GwKS6HdGazYw0/H94SqUfB4=;
        b=PS3TeWnJujSsLgDxyDShhsWl/jd48nfnM8rWjSpSvZJBETRi0BJFvlNYhT9yr6xMz9
         zsQm1ep8XLZdJXThglIk5HYVRmMqx8VeZo/SmkOBQeSSyJOYWyTO+kB2IMTRyizKKGCx
         keNBw1vC7w8DIz5VYpIuJotBldCRXsSpNXNM/R7StO4T2ao5or6kEqcftxf4zJ28aM5O
         Sg84H7CdM4uX93NQmqlhPFqXYjg7B8oGzLM/wxFKx+0Zizubna3jIQS15IdPZVxvfhfP
         X42Kz6Q8EHAfZ+tdhip8uF6QRw7MAj/23i4/AX2avgJpdsX3RLoCOOux8BCc7SQMZiux
         PjNQ==
X-Gm-Message-State: AFq9FYLZFuWKcQni57f9vJuDNhUQlk6CiCRl15EVSFi+ydFRn4eha/OK
	8+JM03guOaOW+Xy2A8tvXgfsnpRmW6qnWbedQXZskF2/J5XTlK8rhwteo/wdPCBHQfr9+eCyuw=
	=
X-Gm-Gg: AYBFou3Pz8x8LPvM0TxK50JOmCOj0jef0OQifo45PJWV5HKcsKOePqviMZKnKPeiQYk
	WkC4EcTtmog+sraQ4B9EjM150rI3yBIjWou/iEFK+EBECqdW4Nb/0Jb5QAb0n9Czca0dq0SzEDd
	foitDRWP48IRJmEay2K2Spq0HIxAp2P1+2EcxKljQ7NSqse/y6RcWl9gFcj2oK15cqKR2Zpjwzi
	FOeWDrV4omPUY6enjdLMAQMNa1hsZ7MGsTzYuXfH1ZrCUeBFqdmOyNAA/OAEuC/x4Iwjb2e1LFy
	I//GpF8pz+0ME7nCfSfQe/XdtJcJm690JN9OwlqTmS6Bv7nX03XeUNOyGu/ustc84Hd42CnXjnV
	yoCO7r8B59r67xjs5mQdCuJzIbS9gGw1XIpPfpo5idgtR0kN+SSl+3l8astHNc3ombLCOCt14zs
	UCflYqSLRwoCTKWR+2w6G9s//JR9M7rWz6fkRQombqZc0K5VwraSXrcilpkpIiUBKWFk+2pJl2o
	8XI8vL0sotzElggjA57b5WPC/HjsJiPSkcBJPVxzua+fsmv1X/0yLfdJd5N9uE2NJqAmxWCXFuO
	0CM4nbj9+A==
X-Received: by 2002:a17:90a:e7c1:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3adce02ec99mr1936652a91.14.1792760689865;
        Fri, 23 Oct 2026 06:04:49 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:04:48 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] rust: time: make Delta division and remainder fail consistently
Date: Fri, 23 Oct 2026 21:04:12 +0800
Message-Id: <20261023130413.178487-3-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023130413.178487-1-chenhan0017.work@gmail.com>
References: <20261023130413.178487-1-chenhan0017.work@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delta's division and rem_nanos() use Rust operators on 64-bit and C
helpers on 32-bit. The report shows that rem_nanos(0) can return 10 for
a 10 ns dividend on ARMv7, while the same call panics on x86-64. The
i64::MIN / -1 case also differs, and neither API documents these inputs.

Check for zero divisors and i64::MIN with -1 before the architecture-
specific code, and document the panic conditions on each method. This
matches Rust's signed division and remainder operators, including when
overflow checks are disabled. Valid-input results and API signatures
are unchanged; invalid inputs now panic on 32-bit too.

No in-tree calls to either API were found at the base commit. The checks
stay in the existing methods so the fix does not depend on introducing
a math module.

Fixes: 4521438fb076 ("rust: time: Implement basic arithmetic operations for Delta")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1254
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v3: none.

 rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 16b44e82d2ac..4415e91a5227 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -412,8 +412,20 @@ fn mul_assign(&mut self, rhs: i64) {
 impl ops::Div for Delta {
     type Output = i64;
 
+    /// # Panics
+    ///
+    /// Panics if `rhs` is zero, or if `self` represents [`i64::MIN`] nanoseconds
+    /// and `rhs` represents `-1` nanosecond.
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
+        if rhs.value == 0 {
+            panic!("attempt to divide by zero");
+        }
+
+        if self.value == i64::MIN && rhs.value == -1 {
+            panic!("attempt to divide with overflow");
+        }
+
         #[cfg(CONFIG_64BIT)]
         {
             self.value / rhs.value
@@ -421,7 +433,7 @@ fn div(self, rhs: Self) -> Self::Output {
 
         #[cfg(not(CONFIG_64BIT))]
         {
-            // SAFETY: This function is always safe to call regardless of the input values
+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
             unsafe { bindings::div64_s64(self.value, rhs.value) }
         }
     }
@@ -615,8 +627,21 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     }
 
     /// Return `self % divisor` where `divisor` is in nanoseconds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `divisor` is zero, or if `self` represents [`i64::MIN`]
+    /// nanoseconds and `divisor` is `-1`.
     #[inline]
     pub fn rem_nanos(self, divisor: i32) -> Self {
+        if divisor == 0 {
+            panic!("attempt to calculate the remainder with a divisor of zero");
+        }
+
+        if self.value == i64::MIN && divisor == -1 {
+            panic!("attempt to calculate the remainder with overflow");
+        }
+
         #[cfg(CONFIG_64BIT)]
         {
             Self {
@@ -628,7 +653,8 @@ pub fn rem_nanos(self, divisor: i32) -> Self {
         {
             let mut rem = 0;
 
-            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
+            // `&mut rem` provides a valid, aligned, writable pointer for this call.
             unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
 
             Self {
-- 
2.34.1

