Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760679;
	b=VJ8JkN7AbswuISV440wsFzxA/a60bNQ7xfjNoF5t9eO7GMnMoZrfQByXYc4QvrLWprQ2
	 NXXdpMQHBTnKkBv5aDcIGSxR7VihN5ky4vokyAncH5A/2Qzg6DooHMl1fbJlAOl618nlP
	 45v7/4pMK+M7si41aK1pGp9AmLEyy+8+IpKpbaWBmJQ2MpBKJXzpfvqmjPAqRGGhWgHfW
	 IcsTmHdYH1J+yNV64SjAeEHH3JiLpfLH2TXEDxjvOzoXvKKBy76eUxgjNfBwHOZPHZ2R1
	 zztB98kl6TUHSwm8yIIh/L3QUyXcS/z6L5D8PsWS+Z8DanehSBixqMXQ9Qh30eOWwUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m2cOO5Qmzsel13rD0d2Ch8Hy2dAKGNhwuzhw2PgQ5Ps=;
	b=e++24g6oPpBCKew4XF/QOxKnOf1ovZf4+MzAvHQjRhxRDdh6NqvBHQGoQdMxiKQk78dY
	 /f7Dr+93+pNqkEQ48hECQR0iTZOg2626wXacUpWAwoYL8tT5TGV7jBir0JSDeKFR7ShzP
	 oFRqzrabyTscIIdyeHjEVDEzXa75aGA+PuHhKz19GFYIKR46MAUlifiYHx3Xq6paSEihP
	 ZGcKcider/O5Itikyj5iPxZZIHLaccsLbzjZrJscpbxqX7EXMN54NtT2PXZUfkSugKtLP
	 GOFkygQwDYwmrhxNEHqcMmYCSKCg7Tc/AKICLKOzOWrd/+BEWx6jbIbeo8hvJOhoq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lody6JOY;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F644606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 13:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F644606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lody6JOY
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada2f39f30so220625a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760678; x=1793365478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2cOO5Qmzsel13rD0d2Ch8Hy2dAKGNhwuzhw2PgQ5Ps=;
        b=lody6JOYmoR5Ixf41CrcWzhJx7o1D5JML/EyQN9jrlJH3u5aECQWyw3U4Hb8STtYoD
         E1CHTWPAWSiLuzioHSPhqQ2mwanOGgeaDkB4qeSQVW3sCTg1FxDp1X+o/nFw0Up0rQoc
         1Vl2rvrIWgelIA/aP5M9oMsi8x1zgxoK+S6GDPLH7UeHhb5FwWjcEK+TfMSjZO4SeJw0
         KcDu5u0/yELowsCoi314qQqJlVsMt2JU2AnVZV57wj3FnkLDJjnTHxsuOtT4CEssv2p/
         xomWbtGma/06G7aCzjTdaFcCwUrmCo794208gPOT0mdV/iHfrLv1yLlqagaDRe8ceIoy
         FR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760678; x=1793365478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2cOO5Qmzsel13rD0d2Ch8Hy2dAKGNhwuzhw2PgQ5Ps=;
        b=Z3g43zBbwueh9UPxG2Sdr3PQwrQRfCeU4LipDLLESh6M9TgOQnUSXl6BQwBIT70UWO
         TZK8l7UZyVQRcWmQip/a0x37wUcyLc+AaMZi92z/1lAtPsP2iRvw4K1yq1IqnM+5dQP7
         nwbHPHEi4Ryh+0v81qUTfUfW8cWtDOWpSaB+KaB663ZhR12iRMJ+TCFsjliUjvOIHT6o
         SSbtk7xZ0w0WgJkTcZ6ztXCq/PkYLiEpmcilJA7BXdn/VQ3gtISUtZK7gJ3PPo8RWj11
         XDzfaClR1eHpQSnc34OW1DkfQ4rGNp8y1x8kiPofcWkYzL9zR9q3wQr7jsxnUGMQuIIx
         tJNw==
X-Gm-Message-State: AFq9FYIpODpQZF3yUNCfoyc6ZKa8OIm83xZxamT6A+ZC/oZbFsE4sXLl
	9D6N+R2/AbfKuKKhzeQGbyBgwzzyrJQQAH8nCAL/YFoEaYZtA5pxXmKzQ711TNO1Ax9WUiwjSQ=
	=
X-Gm-Gg: AYBFou0VW/tdwfvOH1sjrTTzCr6GDsqEpjKuwilAb8YpMIOzcX8oKzTFi0nmPHZoxyd
	qBACvUeZtHOVSIiVjXz8QkY3kYlG/7LZilgrjl11XYgjpoe7/6SlulkTyZiWZKgSZPHBclIn/Ga
	pz+adqcV2Qx6eZCEZsyQiQXwri7V8O+QvfXZEkRJjFKe8HGlwyklDWRfGVc3mIbQXj9J9aBLQib
	kP87cAs7Z/zhtwUY3VgT/iKnnR9k3DA5516zrbCIky/E8iMYaGlcBNQUy5rKfWw6OtG+2kIMgAs
	GntqXejazXRynxrajtfXlk02bcHcQ4bmLe4g3+Zod9uFp004fbAjJHPSCBAdhi63Sh8KJb/CE+F
	O3+2thgTbakcbsnxvjP1F/I8qSj7hGeMmfW0g2E1SsMMvLmJZVSWr6jq4sD62ggaHyfFE62JIFd
	qfhN0vawsMxXmOvEBXHSaJJ8BpJfsjxI/WUFmxggdDJgFbVU0plsNJS5iLQJdjD6+yZ9o5TVxc9
	IChUQFAwKD+/OWvj3wCQ0mJkj7kNMNs2gvgTFkWQXSbPUURCCkoPMoGo2GGGsM7n6Uu+iWZpyBz
	TwecDrE1Lw==
X-Received: by 2002:a17:90b:3810:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3adce09fa89mr1966572a91.55.1792760678220;
        Fri, 23 Oct 2026 06:04:38 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:04:37 -0700 (PDT)
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
Subject: [PATCH v4 1/3] rust: time: rename the rem_nanos() divisor
Date: Fri, 23 Oct 2026 21:04:11 +0800
Message-Id: <20261023130413.178487-2-chenhan0017.work@gmail.com>
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

The argument to rem_nanos() is the divisor, while self holds the
dividend. Rename the argument and correct the documentation. Drop the
architecture-specific implementation explanation from the public API
documentation; the argument type already states the divisor's width.

This does not change the function's type or behavior. It is a preparation
for documenting and checking the invalid divisors in the next patch.

Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v3:
- Carry FUJITA Tomonori's Reviewed-by; code unchanged.

 rust/kernel/time.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 5ae377e70dd8..16b44e82d2ac 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -614,16 +614,13 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
         Delta::<Jiffy>::from_jiffies(jiffies)
     }
 
-    /// Return `self % dividend` where `dividend` is in nanoseconds.
-    ///
-    /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-    /// limited to 32 bit dividends.
+    /// Return `self % divisor` where `divisor` is in nanoseconds.
     #[inline]
-    pub fn rem_nanos(self, dividend: i32) -> Self {
+    pub fn rem_nanos(self, divisor: i32) -> Self {
         #[cfg(CONFIG_64BIT)]
         {
             Self {
-                value: self.as_nanos() % i64::from(dividend),
+                value: self.as_nanos() % i64::from(divisor),
             }
         }
 
@@ -632,7 +629,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
             let mut rem = 0;
 
             // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
+            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
 
             Self {
                 value: i64::from(rem),
-- 
2.34.1

