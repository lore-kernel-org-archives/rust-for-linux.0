Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A562566E9
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759830000; cv=none; b=Z8u+r0rsW77FwgxIQ5fhnDDOLHtikiMg+PXSix93ymCmaQ9A4nBB00gxVQhnuOEQfPAp2wHF29oRtWAgotI9oZZHSbJodQNQbMi1AdJRJchGX1iKVHXmQ7x8aDvFJmxFuTNiovmWMcmwJ1nlWvj6tJNX50H+c97m+CvM/26DQiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759830000; c=relaxed/simple;
	bh=7N0Fpu+DW2FdFHlxjkDuD/i4liq/xoZUtf6juSwFCIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=leqo47hcMyHh5JfnlxIn5KMluZ/KsRlEpstFgKeLk5rnOU5A5n5I8kOHScQyzVcvx7CuNbPmAN7KNz8b6eMoT7GZ+7VGbZuZ8MAZcgl+QbMZXwDhiGbQ+Aa3R0cJNa2W1zGE2jQpLGB2O3zoz6jI1Qm0XCa8cR4u4bWudYW7DMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xCCUwfP4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xCCUwfP4"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4255d025f41so3553275f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759829997; x=1760434797; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7kCRzDJbTfZJ5zf17A4CJd5pPrUVwju9fZumSQIDms=;
        b=xCCUwfP46+xcrN++5jaQrrPRzrAKkBB0c31Pl/+QfgOU3uFldV1QB+AH67pk4vJSHf
         HEYwEEX3r7ocV3s0q7Ua+lBIfFpK7dWYNbXXhJNbGKwB3eFeiNGsBUd6ICyyrx1uhkCX
         KFAbVouVXQ9GomNb4bIZpUCWhh/jNbG4feARn6/R90fGVxlj7xFzJX1Cx/UEk4VKaq03
         x8fChBlYuJ9Sy6IRPqV6mA77v8gL5WgxQ+t4APZL6vV9DLCxn3STAL4as/oBXqkrf7sP
         nnjkR1vUqPl5o3+fh6Aj/V6h4WnVohiRZ8atfFcg/ATHtrMx9g1bnTOAd5ADZwDHtQ+9
         7rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829997; x=1760434797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7kCRzDJbTfZJ5zf17A4CJd5pPrUVwju9fZumSQIDms=;
        b=BZaiOGrUsseRJhI151imksN+K8DphsryGxeDU2WpvmjgPyk886YkE3goE/UbJVnOxt
         Og9U4OrxLRc4CeeWRoPHkNowQ84mnHZMCFZzG4iz8SFyEtwfgzlcF4G/jBnLol9unnD7
         G+Dp3Nyt07q0eI9UhjBVs6Z/kKPeblfVehZ4bjOV7L5nbgPUeGSAKMVm+mvIsCLxjYbr
         /TClBdQy67yYPusJmJTQPDFSv8XVybRyB4xZl5+c/R501KUzb7BtqBadkMl1/nSAMQtY
         o8TBD7MMIpnA0lMyp9OvNtyAfuzjvFKiJlqCseru9dzUWv2aWI1+9oFeoWKeu+Wv7x/Z
         wSdA==
X-Forwarded-Encrypted: i=1; AJvYcCXTwh/7qf3QtMwBCkJqS9UmP+SjQa5FrYxGDdeqY1hvAoLej9FCZE51amPuakweYZphtP8wzwMk+bHMiBLnnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3SXMTKM6Jg/ghSIGd5LRHve4fu16WEVGKb8zfqKRNJ1Sq2Ty
	r/+CM+yOETRUQ9VJSe7srjlBWZdswdxzfOeN4g0ad/6xwafpzFYpM5i6F7u7S1yrOQyMwgtqsJg
	jncY5Uf0x2I09aLqerg==
X-Google-Smtp-Source: AGHT+IFO4CqjO5nPGPXwSJVJiJy5zlzTJ7nJsiT95xswmLvz1roDo3Osf2T/vNW+nd7+XUdjCceEPdKtOI9V2QA=
X-Received: from wrbeb16.prod.google.com ([2002:a05:6000:2010:b0:3ec:d7e8:dbf8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310c:b0:425:7f10:e79b with SMTP id ffacd0b85a97d-4257f10eaa1mr3945969f8f.44.1759829997393;
 Tue, 07 Oct 2025 02:39:57 -0700 (PDT)
Date: Tue, 07 Oct 2025 09:39:51 +0000
In-Reply-To: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7N0Fpu+DW2FdFHlxjkDuD/i4liq/xoZUtf6juSwFCIM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo5N/rMBrA3Wxl96WFxVfdz4qD2ZbsReDpeHo9x
 KTcMvZqgtyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaOTf6wAKCRAEWL7uWMY5
 RmUYD/4hC4y1PzRnxvjz7/mkes20+s1JYIu5T20U0vpuEKUv4qWrMxF1X0yvEAFMU31hKjvFDx/
 5G/z4fHeSD/h47l9oGUuIK3pButPgcZvRnVdeGM4aZMWSvfSNU9ACUOqsT7n+FRGKY+N9l+/IMm
 7nTb6Q69Ek4aio5kvEKWvptHgRydqEwG48xLk8I+9dmNPcbjKX6j5l2RseEl0fi9koWsD4D/E8B
 HTXTVI2I1MXkhepORIfLb8NOXe+9KCupuDQzr7Vhdnt3l3KQEujP8QcyfJ/aCxxYe4pmdDJ86fw
 cnC9BHyGtS2a4xpQF2rU3VWvH5nZRZN/tB/LkSm3f/AoZZ6kM5/xzhx+5qYz1+qlHB0Mlh5TeLb
 tEqotQoLtlt4ulA46wr/H4g5ugDF5KhnlLEGPhC/h87Y3/Eedrqq7Knl0DChHplU3lE2sPjSoxz
 hCqLb5YbdLCTNtWlWHBaEVOxvB1DRngkODub3TTTun4QTB79hJfVixHgopoth/9UkzoqkUIbQxy
 7q6Yi6428zTBfpHa/RSdSCofqANZG3aty0/QDdQvv4dTroMhvzte1mzp3ocBjb/QzCpwdmWxWIs
 MbUWYCS9+v+fXbhJD/qUMF+YpLcx5gAO6z71PMJesAqGPjAq0b2zwceXtT44U03TmPW7rK/+w4t J6J8D6o+E4LoC5A==
X-Mailer: b4 0.14.2
Message-ID: <20251007-binder-freeze-v2-1-5376bd64fb59@google.com>
Subject: [PATCH v2 1/3] rust_binder: freeze_notif_done should resend if wrong state
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Consider the following scenario:
1. A freeze notification is delivered to thread 1.
2. The process becomes frozen or unfrozen.
3. The message for step 2 is delivered to thread 2 and ignored because
   there is already a pending notification from step 1.
4. Thread 1 acknowledges the notification from step 1.
In this case, step 4 should ensure that the message ignored in step 3 is
resent as it can now be delivered.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/freeze.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index e68c3c8bc55a203c32261c23915d8c427569e3b0..74bebb8d4d9b24860eed34363ce69b1c6df58028 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -245,8 +245,9 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
                 );
                 return Err(EINVAL);
             }
-            if freeze.is_clearing {
-                // Immediately send another FreezeMessage for BR_CLEAR_FREEZE_NOTIFICATION_DONE.
+            let is_frozen = freeze.node.owner.inner.lock().is_frozen;
+            if freeze.is_clearing || freeze.last_is_frozen != Some(is_frozen) {
+                // Immediately send another FreezeMessage.
                 clear_msg = Some(FreezeMessage::init(alloc, cookie));
             }
             freeze.is_pending = false;

-- 
2.51.0.618.g983fd99d29-goog

