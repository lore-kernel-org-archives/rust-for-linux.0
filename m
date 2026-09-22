Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E03C5DC5;
	Tue, 22 Sep 2026 05:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054916; cv=none; b=Xpb8ZzfhEXU9sLqmVytG+ug+yz1cMQRV1jL4JYeT9vbbC0pEcH8it6FaNWPWIe8gT9ZK1iUOEME3fYlkY3zD+sIDhAYkEqDExpAQU2HEqZNlW4r9J2l2pRI8Ghljat0skln1pdJd8iwnUkU056iQ+l7Golfme7j4Qddz3EBNZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054916; c=relaxed/simple;
	bh=LgUhF8W5FBpdvoPjv6BCIWTPNV7b1vFMopb7dSyWE1A=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Ku1imKfMECCmSxRnvYQXBOafIkVL0hhhV54Y3Snsg6uLR9tBrICf98HC6DUAbiui3oHwT3+Gw/E3KUiyQC4mJOcllBpscKV0Z8o8/IQGC8Ll7vaSPy2Xw27WCERBU9Dkz5wp3bTWWeV8Z8cKU4Z/bwEk7cuxexA50xO30Ss85hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MRG1/4oC; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MRG1/4oC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790054905; bh=lJ5E6zKcV2JOwE/HjCMM572a5dXU1W+S5zqTwARM8T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MRG1/4oCt/Wc7WXqOtdAHRfw1YeyWvDU2ZTBsUO2wDFEz4zPAmKxhPQI80WdfOOG8
	 RgaIsYKVwKUXPfWkDink0IAIFoK/T0eHn+y5q1WtQG6LYBahzMjnxJl/Wud4+CG0sa
	 PLOIQVmKCJjJrltODw+hgt3E83gTgXHomDcbvgmE=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 7172666C; Tue, 22 Sep 2026 13:28:23 +0800
X-QQ-mid: xmsmtpt1790054903tqxbf44pr
Message-ID: <tencent_6ED5B37F63268169D25F84557BD655D9B106@qq.com>
X-QQ-XMAILINFO: Ny1z5KCLb2WWAL+dmcj9RANQ00nJQHTrkJ8YJPTbO++GK8bt1Z6yu+auCY88F5
	 N4PEozs8LteDVlaKFV0Ubzm8vYj8BJMGkZUkTE6SGxKAVFETsTgEtPqjBm/oCmRB8Efkm9u7Gf5v
	 luSP6KlsFQ7VdKAe/MnCjgpSEaMugb0x2EZ4QfSB58XJsnOGmLEWpDwaL38iMiZpuMsx61iCilGO
	 kB7hamwTzhYilCOEHn4rnk/n0y7AaOZaW04irG6FpHWqxTSFpZsq2jO4R7OtH2KTsFOiPh8rExoI
	 Kg3xXcRWXPHzFnTbiLlUi5FVFm1hlvUpZOug6StDMDSYFTIq1m1rSGEHz/cjRrOfCSoS6RYcxImR
	 G5BNYong0+TrBY2HGAFcXjhfCCHRpORh+Igfa5zKeZguazqcP2VBoX21kIUN8eFUJT/tTDdUmMqN
	 c2JreMS/JclSOdu3MWruKMeYGkqvBcqDlCAAihw7VK3OaHY4YLK76xWqcly0pHFLlK2zXkDcnZ2V
	 r8J2sLso+hd8uGjHpIQzcooDfU3biG9IhsJGojwka1Nve/leJu4CR4WIdhf3XE+g9C/rD63AEHew
	 jSkIwiBgQHyY8L71NLk9bAAio+b9B4ldK3Dy+x8g22BT/ypatiBB9DDa9MVhzubFZmEqIODrix5+
	 f98JYXxuFBE7P6aAVspFMQYw4VMzyIHvZTFYGdVFoxUV5G+RVZ29uXQcP9YXLJ3qJuAJdIZJo3IQ
	 l6vVtCQLvXtWblb8aWjY6uvfPbF387BAEZpmBy3LjImznEtgXy8WvVduSFMPBf6qBQjRf9Hvn1Vi
	 fkiEnDoxrhoNbT0izRUdUHCwVVRmakB4n+ZBVKxznpneCgkVV3hhYWx4urCZCBn5IAVvp2nDAIQt
	 X+TcpuGwLrkgGaSgFN4hoB4PRlLsfPFmZbmTYXPW1DzWdWqDNfJeTpNBxO6uvbFUSm2KGqS7MT5E
	 4af88ftup5CR/v9h/hhfZy50MrM5LuOWRsdiuBtpbBeClGgUFlPMepE4b+NOcdjoCvUYMU4K8F77
	 4d9wrg0kCokNx/mvvJvTEQzzESQKZSOit+89j7iyBcQPkr0YHge3eq1MqDGnNThy7BoOoCON1YSe
	 REevhU
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yilin Chen <1479826151@qq.com>
To: gary@garyguo.net,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yury.norov@gmail.com,
	ojeda@kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: bitfield: require integer storage
Date: Tue, 22 Sep 2026 05:28:22 +0000
X-OQ-MSGID: <20260922052822.1758809-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
References: <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bitfield! macro generates an unconditional Zeroable implementation
for its wrapper type. An empty field list generates no Bounded usage, so
the storage type can bypass the Integer requirement.

Require the storage type to implement the sealed Integer trait for the
generated Zeroable implementation. This ensures that bitfield storage is
limited to primitive integer types with a valid all-zero bit pattern.

Fixes: b7b8b4ccdad4 ("rust: extract `bitfield!` macro from `register!`")
Assisted-by: GPT-5.6 Sol
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v2:
- Add `where $storage: ::kernel::num::Integer` bound.
- Update `// SAFETY` section.
---

I track the default rust-next branch, and there is not any code about
`AsRepr` in that branch. So in patch v1, I didn't know that case could
not compile. Thank you for your feedback!

 rust/kernel/bitfield.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index a0d089423f21..b1fc98d7f8c3 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -330,8 +330,13 @@ impl $name {
             }
         }
 
-        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
-        unsafe impl ::pin_init::Zeroable for $name {}
+        // SAFETY:
+        // - `$storage: Integer` is sealed to primitive integer types, for which the all-zero bit
+        //   pattern is valid.
+        // - `$name` is `repr(transparent)` over `$storage`.
+        unsafe impl ::pin_init::Zeroable for $name
+        where $storage: ::kernel::num::Integer
+        {}
 
         impl ::core::convert::From<$name> for $storage {
             #[inline(always)]
-- 
2.25.1

