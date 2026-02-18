Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F78319873
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427614; cv=none; b=tro5vI0vyu9tlBikHUevVIfozrqxuXmoba2h7ft26yLpLAx9ybqE1wfGwFbLgJc/ZX96+On/U0IkM8zaMhfAIvLiCsaxj2jwdLLaJFijPW7jf0Upj3ICJGnfdDSau3QNRq7ddWSHxuHP8oIA+zF7+kP8QXISmtsyL9tdyg3Ehwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427614; c=relaxed/simple;
	bh=84Ip3tw5AbdKr5Kyt979OjbY4zlojv3t7VOkkXCJsi8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TIb+3fKop4zShEbUqdFFBs2IQq5zTCurTU2UJxFwjFTMqciEBpkoiKugAANdEnXfl8f2AvFSJ2vEfZFs88p++k36d/OsHv/tLRO9wPJTzGMBuGHZ5jMv+hZLj1vKIyo/FiX+h1GfD9Fy/vKFScXUbhSm28BUgHrO2bdOqsddNP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MxKZtR41; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MxKZtR41"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b801784f406so508811666b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 07:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771427612; x=1772032412; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1/Ls7LwysFMM1ACNCIQCse+fYSn6YnlDM357NSCbtY=;
        b=MxKZtR414pnzQX/rXJA7PABWOSP9ffA+3vbS+oEkXWPDcQZGSFF3SYHxgp659+VPrg
         8HBA991goB2IsKzqi5o1Ingm0udaZ5rI995jv8Z4VYgOsyGIBa4XfaM4qfT+dFzTrMkk
         XGhCem13PA1ajKsV3L5Zh5YbeXtR8T9Oa7IaM5VxGMGguB7CzTOwY9f4gxa23GHUHNK5
         cs6Tq+ef0Zds9ZI5tpBgQIPngpY85hN9yBSExiQjVuzsJp4d2bEGeb0zreyJAXqQggvC
         Lg9fcLH5o8u2G91Awv9jeidWohgf8dflYMmyCIl5n9xp3b5N8ut+h+AuBvPXJkQydYde
         Y05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427612; x=1772032412;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1/Ls7LwysFMM1ACNCIQCse+fYSn6YnlDM357NSCbtY=;
        b=lpE9vPSeZur051onWxEgwexYgEMMzNqOaXB3fifRIqXTaqadBR4YakcVaXzp1ZgB28
         qimNp7w3xt7mDqnlXDOpD+TUpnYsP/pK+pqwq2CbTROZimGH/Vw0UTDqyYZDG9IXiGrG
         f+Z1S7OORddSUqIe97PcW0rDWRiG/98G6vSR0IkTLinsww3DZSaeNJGHrnIXJ4Anj0Jx
         gkPB5ynOXVDgOXmB6icnqfNCZhMPscZq6XDA0vshb1MTcTXNUmpB6ULqlrSx7Ukfo0Mj
         6hRw+hoDkk3+RIW2WnVForA7hPGKPfH4ngOWBLKvxrBDsVzCA6ai+4aAhlrLapV2nkH9
         nbkw==
X-Forwarded-Encrypted: i=1; AJvYcCVXl6amXiWII7kR7nQT/E75VRxcxv374/RYvVMYdLgSmY+c/a/AZkT7Hwi3duvJw2LDV4yli+Sa1egMGmZMBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykh5qXuc4KieF3DgzO1qJnwy9PB2t1WCOxwiFMhUspEc9kp7Ud
	UaVyY72UlNhppQAR5t7biWTHUDcJG3OiyDn+ggQBN4zZKYA5SM38VmnpOpas5YYWBjaGP1c4GO+
	QVx9O5z5+zLHjJt/0Jg==
X-Received: from ejcr2.prod.google.com ([2002:a17:906:2802:b0:b88:4b98:9b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a49:b0:b8f:7014:8437 with SMTP id a640c23a62f3a-b8fb4193791mr846036466b.2.1771427611551;
 Wed, 18 Feb 2026 07:13:31 -0800 (PST)
Date: Wed, 18 Feb 2026 15:13:23 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABPXlWkC/23MQQ6CMBCF4as0s7YRqhTpVQyL0o4yMQWcFmJCu
 LtVFm5c/i953woRmTCCESswLhRpHHKUBwGut8MdJfncoAqlC1XWsqPBI8slWMlulqibxld1paw
 /QT5NjDd6fcFruzfjc85u2scfa8Q/1PXoHrLTN2fPCpuLdmZRH7mzEaUbQ6BkxDzFxGjDMdiYk KHdtjclkO0hywAAAA==
X-Change-Id: 20260217-binder-vma-rcu-e699d5752ad3
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2675; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=84Ip3tw5AbdKr5Kyt979OjbY4zlojv3t7VOkkXCJsi8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpldcWKLJgmMWFi2DkcATTG2dyWp/K26cydARhq
 CloiIJ/C0GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZXXFgAKCRAEWL7uWMY5
 RnjED/4k82Ivr29rMWQ77Z8WP7YeiFsjTEkeoP2bk8cr0uF6Of/W9lSj2QtQGXskyQB521HIxgd
 nWfplqXli9EtKksgcLh046LavJWk7BoXwy3Hh4J7hw181wQpG6sRKOKQFzdbAdQcqhlzpGGA+Q7
 lFIJ/4eGqX9A7aWQBodTREnOqNQvmQ/oCFCgsPVjnW0OkiuQQH46pR1KPCfH7GnjTTfjvUmV+nn
 GU/keDlCm891o4WsLg528CprWGmO72vq8MEjzZVrO1iE/bqra6QbHW5Q4DJyPrl0LkfXyXX+Bwv
 ZiKDTTc5oCNsSskyxe55FPlxUCiOV6ZjdSJf7TGL8vOmimEvS4jNpE/Oi82cCMGLG+RUBwUY2I0
 LIadEqhc3H6wdMq4fuEXuf545CwLzqGQ0OKz0mxMr0l7+fakls9dBw0iGMxd7FESouU1e9Sis4l
 npfYT9QFQgIta/Jxz0nn4IXxeRf73U6dpHYtWZLoJ2QGZJ+JWTG/AoA2q+fHXVH3KaUmg0rPc9f
 07+ewFAE7izMtFVK7sepppAH/SNsP3EEtsxl5eJsrOwF4m6ji9eAU0Pw7pnUzJBgheVcljWJAEY
 9+xQoWJgE+YoPvTlZFB+JvRHIMN23K7uWBG9YrBZLfVrezbtN57bxO1DjuehmokeRBoeRAgG28t bH7Mq26FTP/92HQ==
X-Mailer: b4 0.14.2
Message-ID: <20260218-binder-vma-rcu-v1-1-8bd45b2b1183@google.com>
Subject: [PATCH] rust_binder: use lock_vma_under_rcu() in use_page_slow()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There's no reason to lock the whole mm when we are doing operations on
the vma if we can help it, so to reduce contention, use the
lock_vma_under_rcu() abstraction.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Depends on:
https://lore.kernel.org/all/20260218-binder-vma-check-v2-0-60f9d695a990@google.com/
---
 drivers/android/binder/page_range.rs | 37 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 67aae783e8b8b7cf60ecf7e711d5f6f6f5d1dbe3..9dfc154e5dd4e889c4f3aa89e5edb89434113e1a 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -435,24 +435,25 @@ unsafe fn use_page_slow(&self, i: usize) -> Result<()> {
         //
         // Using `mmput_async` avoids this, because then the `mm` cleanup is instead queued to a
         // workqueue.
-        check_vma(
-            MmWithUser::into_mmput_async(self.mm.mmget_not_zero().ok_or(ESRCH)?)
-                .mmap_read_lock()
-                .vma_lookup(vma_addr)
-                .ok_or(ESRCH)?,
-            self,
-        )
-        .ok_or(ESRCH)?
-        .vm_insert_page(user_page_addr, &new_page)
-        .inspect_err(|err| {
-            pr_warn!(
-                "Failed to vm_insert_page({}): vma_addr:{} i:{} err:{:?}",
-                user_page_addr,
-                vma_addr,
-                i,
-                err
-            )
-        })?;
+        let mm = MmWithUser::into_mmput_async(self.mm.mmget_not_zero().ok_or(ESRCH)?);
+        {
+            let vma_read;
+            let mmap_read;
+            let vma = if let Some(ret) = mm.lock_vma_under_rcu(vma_addr) {
+                vma_read = ret;
+                check_vma(&vma_read, self)
+            } else {
+                mmap_read = mm.mmap_read_lock();
+                mmap_read
+                    .vma_lookup(vma_addr)
+                    .and_then(|vma| check_vma(vma, self))
+            };
+
+            match vma {
+                Some(vma) => vma.vm_insert_page(user_page_addr, &new_page)?,
+                None => return Err(ESRCH),
+            }
+        }
 
         let inner = self.lock.lock();
 

---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260217-binder-vma-rcu-e699d5752ad3
prerequisite-change-id: 20260217-binder-vma-check-b6fca42e986c:v2
prerequisite-patch-id: 4ca86894150aa7ee26c04440100cb71ce599ce80
prerequisite-patch-id: beb72c0aa2ce3d495dd69817507ae6885e5ae1e6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

