Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366604;
	b=BntWJV9pSKepBlIsMVkq/L+klARTJq/G15c4+V3SvC76wdHKyUlDkuSP+ZcpUo24sse6
	 4KHZh5EF1nto4cQxaT1eVuVNcz4ghikO3mybPtnoRGvNtTa+pndanta9dJ2FoVm1xlYHL
	 u0BT1vfzyDq7nAuy6XyxNBeWWl7K1cY4Tua103qME1hocPflMNPQqyaGD4su/An0vI0qI
	 AN29+eXmhwLR51ndkqAbxcCgZXSIVaHE4TlMk1uNNiruPSp/55RfuGftKSUeU6LbGKQ0/
	 YmuiPKyq4IGwoJMZc3KARKzolszyLXkW930WG1cw7P2z+zJippFr8LQUpwZsV6BdW2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
	b=dnVxGq7wA52/8Oel//jWMP0MpM3uqOTzVdVH3lZ89v3TXzvThyHvU3O/w1iS83JpSpyI
	 smy2ZlDOrPP/F1ubGcY3/hLXrdzd5cAvqVyhOxlGjHurbjsWZpdcLKFXKVRkGw/MCa3Fs
	 F5+CEKwjrmrFjD6a2XEolsrQ4DySR9ROsIgwohrTjdPraF5AYyE+SYOH2U9zFw8C2l6L8
	 dgMvl2+RfK+HUjRjDFuf8CsOPb4Nc6+q+fCnTgduQHkEjj/yPfZTbzMYdowfiElLoPPYA
	 SefTU5DDyTv0+VkRiY5iyYMJ2ZPBUEymyyu/VqnxCwmtZe0d5p8vDDsD1XV4a2IgbYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zHGVscF;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262B606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 16:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6262B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zHGVscF
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-945e6d9ceeaso239724885a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795366603; x=1795971403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
        b=0zHGVscFwJeaq32+axXyvuYPW3svBiVjLFTsk9Sb1nKxysCyACPp6SSLwcPgJRK00B
         zOm30roWW/hUXxE0/0yJsjm3b4qgWOtucvjqrIJKF5fwbbIlDwTUPr8IBOh2hhGDRCLL
         IZCaXnkkr2bF0TY0g5D609oDf7fh+Q573+yQaJFQaa+QLL7MFe2gVF6yHFyJh/czy1N2
         GEIcadj73HUT1fDOjw+26Ek5If7UR77M0esLOzixBxKJSgbVJeEUpcDq8n3h+71zsb0s
         Sr3YrcJ1zgf5GwvJ1gwETRoRiR1j/6PHXGMvwGL9Gc4RR33rtRZ69yvqY10F+pKfxai6
         O0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795366603; x=1795971403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
        b=lBcjMWf7su/xqhTlRoH8S1u+gpwjuF6yczjqwKu8afn/bYacFNsLk7wPpbT24R3Tyy
         4GzGuwoFhxV40Nv7kSw96pPPsLtR9+diHH0eMSFpgThWELfLVhCq29f8W2NkhLssYTfX
         w076Opm3LMopPCVu+QK7fCDGHIavw47uzILfj6SDnsbcy4e6Mqsg5ve22mMEf8C6SAWf
         qtnmVVqQWSyx2oeIyz9jmj1FAc4AaPOpkkLQE3/QA8+k3RV7QmqSaS0e+RSi4BhTMLUx
         2ofHssblzdLPiScdjq+OEqbfS9R/psG/3ZQ30B9xiL4Zc9ypWRi8Cy3V1kj9h+pw8x1x
         apyw==
X-Forwarded-Encrypted: i=1; AL+hErHcya52kNx8J35WHHTPmT8V+Q9pMCVISO+hmRxRrVSZxphleoZWrr5bPLg+X9O1hrqk9WmarvLbQ/jpC9lI2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+RV/qfh7HyVpOLTu/kqQ+O67kmb/UfkKxLSReT2vloO8csZz5O
	M5T8D6GHLjZk1RXPVuwDZENSRfgCBZsAdSptWo21j9e+QyqjwpmBWbD/nuOwyPs5
X-Gm-Gg: AZFdTZfaYkpTqb+Lsqy+T57CKcDsyc+4XZKqUNeLEMWfbPTFfhSLly915aJfLlyGpNF
	wLahYPEGIraLlb04wgXS2fYn6PzRsZ2NltHY0aZY5Pu6lEWrYPHoDhox9MEc5d04xAJW50y2OYm
	C6pD216zuZ66YBE//lw0rm6Prq0fNqU38zuWMarCq0NdTg0G4R8QAcG1ziu8VLTm3t9ia7fn2Q4
	UWL03zzvpdgxTm0i/a+vVNKhTUpuiUzrnp9cleUEe4ED8++NIbeFW/j91Rk0DjqSVT45wAnKgxI
	8PmEBBCtdryv8BqMIQjUGixmw0BXFstwDynnmECQstO2mXMFye00FNSVEXsTdEwA29qZkkQ7A9n
	2841g5Bcg08L/4p7ATCy/HcZmtt8fNsGI9x9GJjgDDE3lDY+Rx56aOwgWPGYW6SkVG43uXQ/lo4
	UiYcPwaQE/jaJoE9OELeDU1fenqXkuqn7ZOR1w8JKD+jZDs74zMtqmaHKfKLgc6aeTiSGk2Z3e9
	K0/rKppiOYSwrHBMW1uvZmYLvKmP5tlj5zWGBELYnV8JpDaHiffTcCaXFVEZ0WaKZ11NoDtPsrs
	rknIKiSwRRHoU3SsrRFjTs9kVw3NA/KSyKrb+TlQS2riFjdoHQ==
X-Received: by 2002:a05:620a:6910:b0:944:12d5:fd45 with SMTP id af79cd13be357-949bab2a96bmr1590306385a.70.1795366603309;
        Sun, 22 Nov 2026 08:56:43 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm629367985a.7.2026.11.22.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:56:43 -0800 (PST)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: mcgrof@kernel.org,
	dakr@kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [RFC PATCH] rust: firmware: diagnose insufficient modinfo buffer capacity
Date: Sun, 22 Nov 2026 11:56:09 -0500
Message-ID: <20261122165609.1914670-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
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

`ModInfoBuilder::push_internal()` tracks the required length even when
the buffer is too small, but `push_module_name()` can still index past
its end. During const evaluation, this reports an out-of-bounds index
rather than the capacity constraint.

Check the capacity explicitly with `build_error!` so the failure
reports the violated constraint.

Link: https://github.com/Rust-for-Linux/linux/issues/1271
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/firmware.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index a18f8b84f3e3..54c6a13714c5 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -339,6 +339,10 @@ const fn push_module_name(self) -> Self {
             this = this.push_internal(module_name.to_bytes_with_nul());
 
             if N != 0 {
+                if this.n > N {
+                    crate::build_error!("Modinfo buffer too small for module name.");
+                }
+
                 // Re-use the space taken by the NULL terminator and swap it with the '.' separator.
                 this.buf[this.n - 1] = b'.';
             }

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

