Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DC3AEF52
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184910; cv=none; b=rdG8AWjPGNvbx9OSyDNoqU644gAJPipFogDctAO5hzZ4SdVJTK/R4BCUstrl6eyV/+zDB7if6DGXYDdkgg5vCZJ1IkCdRHJ8saHe1d/5ho7C2DIpaS8w5RZwXq2UAF/US65kIHVxLfkAShqzcjoSZSeSr1vkurIl9YiQrIS5xvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184910; c=relaxed/simple;
	bh=FTKtxrDMWAPs9/YZKz4bMujAf/Ljs0I5QuoQbjKaNpE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oYnQzJswlAXWeL0K06SMQHkFcLHrU41gbmppWGOl/3URmr3wbT4aPBAljyjCS6PqMGd+xM/MEarkGFxmEztWGF32R00dp2DXamQk4KDVd2dmzwgJvlWAcOYl7N0oApphy91TFWZ5ihrSU3Vz9JQcTicct50/eZAms/ILnwurowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YYA3CRoV; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YYA3CRoV"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65fa4aba477so2139164a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 01:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772184905; x=1772789705; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWVvIEgQeJcNm1KdAZ4hLHy83wx+q9wzmD28Xs83Lzk=;
        b=YYA3CRoVOQRagA974lq3EU6UC/aqajvf/LI4pOQK5QDWLuaBI7mEah75LGC/TpobzM
         37dVjygaPPWGwbCbrfCXCa5ZCEdvqOtVlaD+DKqktCNAA/W/QHdBHX4eQY/smTFggtcE
         YUguQRvOLoAhkVrkTZoxiCJ3gWblCAfz8DQuEKCfvS93pJZv7vy1FLPy8+yTqGb7eUuz
         ae32DyPEiDlmk1KqlvxKTm7jfhYNkwQjeBsD9WlfBThIbXX29cBI6zMeaVDRJfPUFJDW
         cDS+JE28Pu27ty42qt5xVdH1xii7M8yDhCoUrpJrdRS3wqLHgSBPGp2jYs/Nq79WnVDL
         Vcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184905; x=1772789705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWVvIEgQeJcNm1KdAZ4hLHy83wx+q9wzmD28Xs83Lzk=;
        b=LO+QAdqxg84wr0j1v1TG9+3nVtJhAPBLziNU3JzYw0/LFf+HmRm+XGKkuVEPfeO20T
         u5uUi8YFHaro7j0IiGMddJl5BrUp4lRjIr0kYAx/+/YVqHZE2msQkK9lG6Mq24VLNfo7
         GjcKuySAjkuXy5MN8junp15THWTmlmyEA/k26DNP18ql1DmYkPyYZzY6JeOA7Yh4jqwe
         nfYlZAANvHFNGmEKiW2/etsBd6WJnNNEDrdYVt6ZInCVTfIMBa8Rv4uYgPCDacVfnGTd
         xEp0JOXx/gAHBvjiNtPKr27+XeUeZeHsZAhPLsDsf57ALmBtqI6E9cz7FUFx1Y0grHut
         Sb5A==
X-Gm-Message-State: AOJu0Yzv4t79TH2zEBjbnCbTVSkHUnS5LZGMGJ0XzVECl+drxTahvU0H
	fl1iuZl4bFBabKEqzitXAAaHqrIkCaZnwCDbU5HW0L3eUUf4zQQNZPEsR+BTVesG/bbSzfTUfhd
	lxoWpHJiOX6BkZ/Kxig==
X-Received: from edrz5.prod.google.com ([2002:aa7:c645:0:b0:65f:71ac:2c0c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4301:b0:65a:3de6:c55 with SMTP id 4fb4d7f45d1cf-65fddee7ae7mr1548476a12.28.1772184904552;
 Fri, 27 Feb 2026 01:35:04 -0800 (PST)
Date: Fri, 27 Feb 2026 09:34:48 +0000
In-Reply-To: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FTKtxrDMWAPs9/YZKz4bMujAf/Ljs0I5QuoQbjKaNpE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoWVBRb0rpWbJIEXEPJbxQKqEgtLAFKYr1pw0I
 rRLUkafsBWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaFlQQAKCRAEWL7uWMY5
 RoJSD/9mYEGnLpocEzx+xiXdmOSNY+N55K41lDn0hIvM48Dr7qX3KJ1YU2QHdmOanPMTvaRXwbB
 E3mDWKLuM9OkINDJX27L1TVOvZcMqd35R4E4SFkE8MiQwbu7e6tKayqz1p4pD9SbZEvY4gARJW4
 6R+/k0J+KxJVoET7tkINSBMjaLPIpD/XXKkmFwyTSLorJ8DFr3heg7Ymttu9RvRwHsBShH8HGMs
 t8jNtvjqrSDtYySQ4W7voSrJy//dj7jNwN+uB70jZcaERMCyJit3bL8uGd5JmkFG3dZEM0zV9Hr
 76Gthb1+ea08sD8qUewlbEctr8uzECCBco1EvuRjvbCQ0FnUAahhoWlwaZlfwIeiBWsPY1X0DT1
 EO01P7mpWXYZ2Z3fYF4/PV+vbqIzgpWl/4Dfek7PpG1KYbVEDfj7NrX0Ggfr9TUc/MZib6IaYth
 N6fVfZPol4eHHhMVoccTR+E/Hq7EuT0u34mrB0f1RPgRN4rbfWg0fb2PGbazdIXaugW7TF9ym/M
 gPKVLCnT0+ryQMb0yl2WRtkNnNFUYzOgfid9U6tqifdqQySRDI/P+SslLbOa5g6pDwGOs7DOHu5
 vIrdnbfvRMyemULwQiidrPZXP/GAeycgLmBjCyNaSR8LB+wux4uDFVqkuSHaeWednuLbUP0bayI ML/yGSTCTbmYmgg==
X-Mailer: b4 0.14.3
Message-ID: <20260227-close-fd-check-current-v2-3-b3347edbb310@google.com>
Subject: [PATCH v2 3/4] rust_binder: make use of == for Task
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Now that we have implemented the == operator for Task, replace the two
raw pointer comparisons in Binder with the == operator.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 41de5593197c..b78c1490e654 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -681,7 +681,7 @@ pub(crate) fn get_work_or_register<'a>(
     fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
         let id = {
             let current = kernel::current!();
-            if !core::ptr::eq(current.group_leader(), &*self.task) {
+            if self.task != current.group_leader() {
                 pr_err!("get_current_thread was called from the wrong process.");
                 return Err(EINVAL);
             }
@@ -1669,7 +1669,7 @@ pub(crate) fn mmap(
         vma: &mm::virt::VmaNew,
     ) -> Result {
         // We don't allow mmap to be used in a different process.
-        if !core::ptr::eq(kernel::current!().group_leader(), &*this.task) {
+        if this.task != kernel::current!().group_leader() {
             return Err(EINVAL);
         }
         if vma.start() == 0 {

-- 
2.53.0.473.g4a7958ca14-goog

