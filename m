Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4B46AF12
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708454; cv=none; b=ZvLMWtQz+lZRuiAURIyrpXJbNDS+OssRfjqQotIhpe/C61BeMVvhXNRL4xROIw0zzn+amsHY7ZbABmNO1UtsRquZchJJvpTlQ9yZNeGXUm2lkFHwRwQeNIT6S1JFJKxspbhL95Gnukpe0HYka/PLTPZKrZpDghedqrRPm7d231w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708454; c=relaxed/simple;
	bh=sdp2t6vfqEppC/dVPMLIuJInICylhXtRkr9AwFlbGFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2fU4KIs5sXdob0vzebPO30/6hGtDmdCfOJwm7RLTKUDVnQCYHK/00Ltal2YGMrNzpb8R6L2kKeGIuSLyjt2VfM7oQiCD5lkA7IMZygorgXVEZbqJME26/rH7GZ5DYX9W7MMAY9D50h6LvKDlidNkSATuRJZOqpR0XHs/dzXjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LShXWH1r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LShXWH1r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso10724175e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708449; x=1782313249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+sHLws/3qJi46z31ZQSkIz66AhJ7UkYvYrNInNWLLA=;
        b=LShXWH1r79gml+u8JtYvzpMd6dn5phptv3uvX34ToEkFfThiGdh1sILnYhE3xiHCks
         Us2regbHUfWxBsh6kxbggcV7JYBRgMoBM9oY41ThEiv8ErDwzydAemcxQySrMm19FYrE
         0pof7IOkqfWQbAOPCe3kfsd/1nIkCuVQACNB/mDdNVWJkV+JJP3VPA3wxAaeiYV6lCnZ
         y6VUPDbtFmI1flhVPFr49KWkhtxiMrPB3PRg9y4DoE99fhFUroYh0ZdAdHcYccQAhP89
         zh3H2sI2kJVbMyaDW6JcdoflUPIOwGt1EC2E4+NPwmPvyNHE1YbSrMRzoTPehqhP+QnB
         i74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708449; x=1782313249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+sHLws/3qJi46z31ZQSkIz66AhJ7UkYvYrNInNWLLA=;
        b=Cvkxof09cGUy1m+NFSTOoGJE9YYsKHd05mH2MZiVfAWj1Ib0sq3vDg5i5SxXoeaPQe
         M4LWKrOME03f8xpIw95jVtfDYVCCH0TbG//OYGYvX1XsWKRSus/DJ/x7+YGtRO6ptHqv
         xjhVPAIEy1eP70zeaaIIPwsoiAn4tu2SPw8C4R6VjgtzxGOil2GZ8vR7yX6lVSsYugnl
         2cwHbmwEq5+FiWlUSEWOYbYlViX2kC5eI6k45GZayxZRN+q+ke9q+R4obGlje/bzOdv/
         VJpnuu0mN6iA+YpJeIqkTle5kASF0SW9DmdpsBRBte26MCDhJptPLeuSNeNVgDPtkJMc
         fHKg==
X-Gm-Message-State: AOJu0Yw5p/2YGGtnYySwBtVX3YkA/lw64CsXXO99/95vUo9JhDhN/a15
	vQs8Iw+sOg3slql7nHHruwgFXhRnW57XwpS+ROx+D1B0TAEvlgoS08WjwSLkXlUZ/PkmAsPHJox
	H8KQwzJs+
X-Gm-Gg: Acq92OHxC2qhq/fP/FDQtiqbFueEPa8tVrlReRSZTXGye4wLSsLZKcKytOBSMAlNwfF
	nCvsnC4BAvJybttlCcSGbOjWqiCAy9+Cpla22HNmf6gLAI+BABwaH3RYYMrziOnSpMSPH498zvn
	653Ovklhs2mitbTCFxRTQy5d4LmApaz1znDkJQo9rwAXHZf0D/Obq3FIByIuz/hb5u1dtMPsAWp
	N46NLvRuiBavwKYXYOPPt/0p6y11sNRDjPRqAiAZBmM2LfEZ8CKr3iSE2i/tMG5czRC7wX8OK48
	mvkNYQFvLIxlldhmjBOB99nTfR90UBCfrwnhqw+RnsNx6QaSOclvz0ChKIrexIQVJsWNK0ZWbDG
	/+8U58WXNI+7bwFZLVtZjSaoI7G9nj4wICCwFDj64c0amh1nZKDbXxuK7HyVzy3XQEv94MA4FzP
	fRCPUfMnxphVkhkC+ORjkEqGmG9+79uDapGJwu8hsthMX1EmAFTOxx/k3H
X-Received: by 2002:a05:600c:1e0f:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-492340bc974mr52545715e9.2.1781708448384;
        Wed, 17 Jun 2026 08:00:48 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:47 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-usb@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/9] rust: usb: add usb::Device::set_interface()
Date: Wed, 17 Jun 2026 15:59:15 +0100
Message-ID: <20260617145946.1894-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a safe wrapper over `usb_set_interface()` (the standard SET_INTERFACE
request) so a Rust driver can select an interface's alternate setting
during bring-up. It blocks and sleeps, so it must be called from process
context only.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index e1fb50fd6997..73637e3467f1 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -605,6 +605,19 @@ pub fn control_recv(
             )
         })
     }
+
+    /// Selects alternate setting `alternate` of interface `interface`.
+    ///
+    /// Wraps [`usb_set_interface()`] (the standard `SET_INTERFACE` request). This is
+    /// a blocking, sleeping call and must only be invoked from process context.
+    ///
+    /// [`usb_set_interface()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_set_interface
+    pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+        to_result(unsafe {
+            bindings::usb_set_interface(self.as_raw(), interface.into(), alternate.into())
+        })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.54.0

