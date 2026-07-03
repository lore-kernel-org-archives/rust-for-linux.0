Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375B268690
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047643; cv=none; b=BtVFQ5bUVmR3eepNbO9SIf7lTRlJvFXnLEW0rAVvAQ78/z1NTpJHI+rI0Lqi+gFgM7aSFuV9XptnW9487Sysq4AcL0U4+HShRnm1OST+x9ZeGYBgSrgIYgfJYNuMlr0UZlyRWo1iWVj81btcNOPpZxodsUWiVBcJcv6mK4gfk88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047643; c=relaxed/simple;
	bh=YcMrtCPBehMskMth8A+KALp71as8gO2BryWNL/Me5vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uT3985oPqdoBO6YKvdD94g15vsSSRotgu8TgVzfIzyZIsYSZqocOOQMQpIgRLaJ6SiKWmUZgK5oA18MnJXOOm2hJOGFfXkOE68SYHh6DxophPtOlVOMAnsXdbDOFXzTSzQ3rSKofVKnEDd0GU2elgeSL2NR469vjeWNuPKa2EQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=RXmNUPd6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="RXmNUPd6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-474560436c3so103671f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047637; x=1783652437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfulRQ67b4sKix536dVwI9SyCCFZIN8ANRqkC/OFpvs=;
        b=RXmNUPd6RTU8f6DFGLUHpkPOlK+/Jjmy1kUjoyUItecZO5ekzOpEQESH1KUUhslZSd
         ZMjoAyJotaMpkqUyfl3c2PZGHxmV14As3mfAaiuXqraQyxJVwxNfdKYNX9ELIBBTXuHP
         3wsidmE6/0NbP3HH8oIBYA6ux3bAY4LTZDazGJ+aGPYSbP6x8zC/+Ya/ziLhPHDP7h+4
         lcE5uI+9PS4dIrDm7xYjk4bMIrVAWl/4WJjNVaJjnhqj78FOZnHnexvKj72+i9t1I0O5
         BZMDVxnTbjUKNgchHnmEqqWoy9oTG2wS7aJwocy0pDI5VU2SxqwSHWUUPYuWIllhuev3
         X6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047637; x=1783652437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfulRQ67b4sKix536dVwI9SyCCFZIN8ANRqkC/OFpvs=;
        b=qfZIzsUeHgpUNPrvZnoYb0ufrXP/PpZmMSq6xwzuuXm4ZsH81Kw2nvYztc/7ZzoEne
         PNPrvXzjPy/yagUd57FzxBdR1bHiuxqLTkhTxRb4xBPu2w942waa82mm38RlEcjSBE1w
         DwYkH3CiEc+7SYKTznjH1xA4Nb2P+YxY88dOImSxwfpinaN2wZ8zBzpvcjXc9qzVA06b
         gbmT0qiIXoVQztQSc/Jb3tvHhJIbxc6q9E6I7EhrzyiKcfZ8HdvAIekLpMbGHzicDeVr
         V+d6+zTpnMG756SdWiysgFjfJraEdi45mv425fl79M8CHi/p63ZQOT1JjXQn0+RKxDec
         Ro6w==
X-Gm-Message-State: AOJu0Yw5JAnihrTWl7DtMLyf7m5vlbVPVHse4aKS9mS5jjJkyxxGjWgT
	Bih3dXdCRMXg/Ln3i3WOPuA0GWSPN995GlHCKjfEv+F4q3rmrEMTkoVURSZueQXZtTEVMW20aj5
	1S/8rOIUf
X-Gm-Gg: AfdE7cnOp9gyg+cI64UfOUqLG0oRMZF2j/zTatmDwMCCCN/xjNd+MGbReah+QJkzZIe
	Mkk2Iq1drBqHUUdYUvUg4ErUYbAbyc0LuKZs8qd36q83D9k2q14sMBC+utvUqg+1HS4hqES7g/a
	hHHNtbaWxQuew/82J8QP2Bt3LJY/e6cDRkcH6qPjBUcvMUdxeZijki2RE2FpLvohqCYFzwC/0wk
	JUymfN6xSqZf54uPX4U6IeQCw7KBSWCZPIH1qt1kwwuSepB9YBowSgMk9db5WO2Q0Xq16GbvRF9
	q7R/ZkaQbHnc2WRS7OpOQwaZtLafACRrL7nBCqntTsSeZS8MseGUlNiLNwdZfz5fJI/v6iRKf8j
	XmBSqAxGJgE+yCtNaALFUelClJ5O0CyuHzqqj18+f5iUdc3fH5EOjV/aGupGh0fI9TnesSvWoS+
	8deas/dqhU2lQYAPBWE1VldAr4pY4/FcMla2/ZKoWye2nwysG6NyYudk5k
X-Received: by 2002:a05:6000:70d:b0:476:d52b:b85 with SMTP id ffacd0b85a97d-477af217c63mr11901030f8f.16.1783047637615;
        Thu, 02 Jul 2026 20:00:37 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:35 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 04/11] rust: usb: add usb::Interface::number()
Date: Fri,  3 Jul 2026 04:00:08 +0100
Message-ID: <20260703030020.2694-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030020.2694-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a safe accessor returning an interface's bInterfaceNumber (from its
current alternate setting). A USB function driver's probe() is called once
per matching interface; a multi-interface device therefore needs to know
which interface it was handed so it can drive its protocol on the right one
and stay idle on the others. This exposes that number to Rust drivers.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 73637e3467f1..683e8b52d6d1 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -357,6 +357,17 @@ impl<Ctx: device::DeviceContext> Interface<Ctx> {
     fn as_raw(&self) -> *mut bindings::usb_interface {
         self.0.get()
     }
+
+    /// Returns the interface number (`bInterfaceNumber`) of this interface's
+    /// current alternate setting.
+    pub fn number(&self) -> u8 {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` pointer by the
+        // type invariant, and a bound interface always has a `cur_altsetting`.
+        unsafe {
+            let altsetting = (*self.as_raw()).cur_altsetting;
+            (*altsetting).desc.bInterfaceNumber
+        }
+    }
 }
 
 // SAFETY: `usb::Interface` is a transparent wrapper of `struct usb_interface`.
-- 
2.55.0

