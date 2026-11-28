Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795836032;
	b=5lURTglBDmP76r6ISKSZS9C+JhcAF5V6O3PzVt40SMm3eS6vnwrrKUKzyPJKNq06z+Nx
	 AzPH2r9hOspD2h32dCf35JSy1+EyCs5WybXXRgCJ7ApfkHo5h7hsZabNusICR3ILN9/R3
	 6fDJ2e1gtF9lXiW8q0e38IWdc7d2hDFjmM1nBLH2OdZgpr+3o1RsmsSaQQTGUSnpwEjmR
	 6Eli/7Mf517BzfpePtu0wBKBN8M2nSmpWAGUHLt4uSvIeSfoFGMCHSijjz9rAYXw3Y43X
	 Re5chYDkS9iKwMNjQOM+j7Pf4QD+7dG0tZZLV+h9L1XfjpUXbp2/W559Eku3fFQXtsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YxeDnJT9qgAKa6RUhP0MRuNZNGp/0+2Z4aItwnCVnOg=;
	b=VIx2TDXtG11Jmv4qKxNqmk9eexclPBgJXlvm0+KC+0hoVOGYfYnzvYOYzKeuyg3gtmMr
	 bvlTotTUDWKZCwDAif2RbJMwFd9dx8fLHKnCtarr1/oiWkm2qVzHpClmuqOUzmSuFM6W9
	 ppyURO14jstS49a5a/KZAJzM0ZkT/eusuP2EknnauPy08bgKpp5LPgp1ZinS4nQRFTHEW
	 aF3mJwkO7b2f92AADlowLGv1Mhxgzdb8mwKpZXs4Wny9NE3/XJz3vL45WmGA/W+5KLoUX
	 kWDLUqPbNAdrpqJfsCEL7hXgSA7G1RYyYBRQSTeXTuiQfTmN9+aZ8M6wLk2a/P9oHZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b="RH/oXc7b";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51773606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Nov 2026 03:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51773606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=RH/oXc7b
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so6124724eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 19:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1795836031; x=1796440831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxeDnJT9qgAKa6RUhP0MRuNZNGp/0+2Z4aItwnCVnOg=;
        b=RH/oXc7bsfHNfPpx0xNG0WmvgH5uPT8JW5FiwtUwY6Jwih5Akc3K2HNCHpRrYTsUWP
         Ra7yol/hbrorRv4o/xRF42r/FkbujVMDGCnL4kMoDq8PSNYlwSpnQYBedOGfrIRhEab2
         +VhnaFgRtQ8M95EIF0DUNMh5SBrxRpa3ExCwaEToeKd+y//Cxe7nl6IUh4eYvC2FQnrW
         nYpi259ysszb2sipJDjD99NaYHOa/RUtLWCT0iHVncUbfOPqeeo7ELuwb2jCaRcYXZu/
         h3zaYposb8Oo0k6qh/OylqMrCfNny99Vse6KHWDzAv7ff9Q1i4jwfyerwctVyPRNixqB
         ivLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795836031; x=1796440831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YxeDnJT9qgAKa6RUhP0MRuNZNGp/0+2Z4aItwnCVnOg=;
        b=z4qFdqWt1kJkfNgCiHLmIeviH0HowaHBDeHwJI0i+QX2PR/3cOAa9caM+4y35RpOEp
         Tr/IOOTCxszIo6ZQy+qeOQ32wAnSJA/POCxfIJN//kUAgbyIBvGDRkGM2CST55puQzDl
         Qnto7ai1uUmHKnpptVTUYG+KD6bCi16NIZyT2I3LVYnZnrScu7NWa6Dbzvu1GRGCO9gl
         KiIJlpxeGaeOtK5gCdjS88V5e0ZB8Q20GshV/JiwSiKwxY9qMs7PunzwJ97fVkVP6teG
         92gt/FcuylEE+FiqI2A17Nhc52GjuwZcblAFIxdaKeR6cCt+6FMZ5ax3aFMpcc6GSiI/
         N3UQ==
X-Forwarded-Encrypted: i=1; AL+hErGgnT/0YzYX6T27s0Z66fQUqwQ3QQWkNzfNBs3CAfSzz6uEwEebauLbLS3kWYvQJ4I7kqb0vwDs+tIeFszu4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S4eKczrja9/MrTxBvXX3b7CrftkZM2lzqw76BpP2TwYrELeau
	THvczC9yrzhg0m9aZg6SBoQjUXDn2Un/2kuuXOkAPgu/qO5Or6wzWW5TX7f8BbQhSD0=
X-Gm-Gg: AZFdTZfLz0AmJ9aXvhEelhJ8l72jOcOkwqaexkQU6EnWIVJDbsiSvT/nNt4LmVj7JR7
	SooCb7emlH60GkR1A8tLabCMptWq2NpxGpYzB9R/P+cb+YKcHtpn5TjeItfbSkJCZKwJPt5Pem0
	oJf8Ns18+NfA4xTRu9iat3xIwylLqiDfqbnlvkuMa4oiZo27WQSShlRDjBazXIijoik87VDvFjK
	P/Pd0W+CXH9DPjm4C1z4diN1Es0QzdAGfxAAR88UGrU+RxcwhHGFO5s4St1+XHXG1zGZYc7FDQN
	Zrf6SJmt30V5HTmnEpG3DOG7f8mxqVIvIelOkMbqrj2Orl8e37/GvslPctRhQAKmyyHTOpNbxfz
	4u27cfk28igDKD6ql7kq0uId8cBBHpQuoERCVUmo54FQCdrMAzEO1vM45smZ5+6Ea8mFVLbatJo
	USx9WI6NM20mC3ta7lU9B8jAKs9AVOUzVJcDqzXX+o0VdQCLlxlnFuFnGq7gZMY6t9N+Utl3qOA
	ly5uSYxXxtHqw0pyAV6s4rVLLZLpxSUGbxq2zf2W0j3m7FKiySa9njszy7lk/St+1ABt573/Vm5
	lUtbbDyrThmuX+9nJVlsqiKoW99VQrgjI7CpV8aUV2J8dHu00t4mVBuN87dR0kAu27eD
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr23758705eec.25.1795836031344;
        Fri, 27 Nov 2026 19:20:31 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm86275702eec.21.2026.11.27.19.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:20:30 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: m.wilczynski@samsung.com,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	elle@weathered-steel.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH v2] rust: pwm: reject over-aligned driver data in `Chip::new()`
Date: Sat, 28 Nov 2026 03:20:29 +0000
Message-Id: <20261128032029.9516-1-pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
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

`PwmOps` does not restrict the alignment of driver data type `T`. In
`Chip::new()`, the call to `pwmchip_alloc()` allocates memory for `T` and
aligns it to `PWMCHIP_ALIGN` only. A `T` requiring greater alignment
can receive a misaligned pointer.

This is a soundness issue and it is not triggered on any of the in-tree
users.

Fix this by rejecting over-aligned types in `Chip::new()` by asserting
that T's alignment does not exceed PWMCHIP_ALIGN.

Fixes: d8046cd50879 ("rust: pwm: Add complete abstraction layer")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
This issue was detected by FerroLens, an LLM-assisted analysis tool.

Changes since v1:
 - Moved the definition of PWMCHIP_ALIGN to include/linux/pwm.h and removed it from drivers/pwm/core.c.
 - Simplified commit message.

Link to v1: https://lore.kernel.org/all/caddec5478a0d39a73152247a60bc21b3c609cc7.1794600927.git.pgovind2@uci.edu/

 drivers/pwm/core.c              | 2 --
 include/linux/pwm.h             | 5 ++++-
 rust/bindgen_parameters         | 1 +
 rust/bindings/bindings_helper.h | 3 +++
 rust/kernel/pwm.rs              | 5 +++++
 5 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 4c6d716e5fde..520e5b788958 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1594,8 +1594,6 @@ static void pwmchip_sysfs_unexport(struct pwm_chip *chip)
 	}
 }
 
-#define PWMCHIP_ALIGN ARCH_DMA_MINALIGN
-
 static void *pwmchip_priv(struct pwm_chip *chip)
 {
 	return (void *)chip + ALIGN(struct_size(chip, pwms, chip->npwm), PWMCHIP_ALIGN);
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index b11ae91723f8..efd14a777b44 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -490,8 +490,11 @@ void pwmchip_remove(struct pwm_chip *chip);
 
 /*
  * For FFI wrapper use only:
- * The Rust PWM abstraction needs this to properly free the pwm_chip.
+ * The Rust PWM abstraction uses PWMCHIP_ALIGN to check the alignment
+ * requirement of the pwm_chip's driver data.
+ * pwmchip_release is needed to properly free the pwm_chip.
  */
+#define PWMCHIP_ALIGN ARCH_DMA_MINALIGN
 void pwmchip_release(struct device *dev);
 
 int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 5bab3cf06336..8e70ef2e34fb 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -50,6 +50,7 @@
 # recognized, block generation of the non-helper constants.
 --blocklist-item ARCH_SLAB_MINALIGN
 --blocklist-item ARCH_KMALLOC_MINALIGN
+--blocklist-item PWMCHIP_ALIGN
 --blocklist-item VM_MERGEABLE
 --blocklist-item VM_READ
 --blocklist-item VM_WRITE
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..2af0af4f6858 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -114,6 +114,9 @@
 /* `bindgen` gets confused at certain things. */
 const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const size_t RUST_CONST_HELPER_ARCH_KMALLOC_MINALIGN = ARCH_KMALLOC_MINALIGN;
+#if IS_REACHABLE(CONFIG_PWM)
+const size_t RUST_CONST_HELPER_PWMCHIP_ALIGN = PWMCHIP_ALIGN;
+#endif
 const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
 const size_t RUST_CONST_HELPER_GENLMSG_DEFAULT_SIZE = GENLMSG_DEFAULT_SIZE;
 const gfp_t RUST_CONST_HELPER_GFP_ATOMIC = GFP_ATOMIC;
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 8aa47304bec3..7fd93cc644bb 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -587,6 +587,11 @@ pub fn new<'a>(
         data: impl pin_init::PinInit<T, Error>,
     ) -> Result<UnregisteredChip<'a, T>> {
         let sizeof_priv = core::mem::size_of::<T>();
+        const_assert!(
+            core::mem::align_of::<T>() <= bindings::PWMCHIP_ALIGN,
+            "PWM driver data is over-aligned"
+        );
+
         // SAFETY: `pwmchip_alloc` allocates memory for the C struct and our private data.
         let c_chip_ptr_raw =
             unsafe { bindings::pwmchip_alloc(parent_dev.as_raw(), num_channels, sizeof_priv) };
-- 
2.34.1

