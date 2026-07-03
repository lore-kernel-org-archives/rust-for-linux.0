Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A912857CC
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047643; cv=none; b=PMFXWhj7tDU5ZyK6/fdul7s5OXKv/TfFk8UZNNqxFX+rLQiYts0AualnHxxw3uBP6D6tsnz21YyPXxRofJfQHPsESvyYkb2oTjyftA+yQYQVCSrosLkyvj+ZDnSfpJRGsIKpu5jJAuibV18VdNNXxzhIR1kKmtuBP2JJopE/YOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047643; c=relaxed/simple;
	bh=fRVxTWmWKyJ/dlHFPAIT3qfu7Qi7JrOMUPD+ztEjoew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOiVF9TzqYgLuVerI2UmBk2eHbW0sPePy9LbIaA/cMYS6PsENhnE0z1+2QNP19lZngZBon7wu/CxC+SfhEjGSBlugheGQ2T76Aoj+lJ8Ijtrx2alukDWAiTXeNjM7wj+6zVnogjf699v2YB0UC5dd3C0hz9NWhxC6riIgjiFIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=JrzzfYKp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="JrzzfYKp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493be1b9564so288925e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047635; x=1783652435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jZ6/ZhLN9pWf6x+Z/4DuLuOEjzAKiEmsSW7t+CJTno=;
        b=JrzzfYKpHtqPA2Ty/Pp3X24MYkQT8c8a6pBCxdiTaGQx8YpqTW+9si83Bguef9S61g
         +A2IuWLTFEVnhPt4XTyzlZlNYFAhs8u0pMCi+7kWOChwfh4Ke+qVdISVgp1Kr3JZMh4V
         wxigEpZAYSh1qpBSJQ8ygtnbUopo5Odw7OgTNOTxh9i5btVaWDOZLJ8YVicog32JWV5I
         X0fM/2efW9Al0yNO4JSSA2t+ZnjVMc5iFu6fhZ7JthORkwrvnlHENEkUE/1YqvVCyARs
         ywl//lNpMsO+0PDFEd0uDTqHVYcTLHBO7x/oqjgIh8DU/WMSVnqYgR2WMmd5kyjqRd7r
         HAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047635; x=1783652435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4jZ6/ZhLN9pWf6x+Z/4DuLuOEjzAKiEmsSW7t+CJTno=;
        b=p9lOly9hDuxr2YIYFwBRQpOXmIcU/8rbykeG93/yDI8lGaaX9vvLQxbEPhD3pa9kx7
         jd2SuL90+mK6O8loDz8uOyM4+UJlBQJP9GHxFGYjkqol+FeRav9pd3Y4aDEZwQAa+TtZ
         F4NnO/Mp5u9P9xDaPed2DXnCY+gZWx+358uc41Qy6XP/uG62Vtd4XBLC2VDWS1nztqub
         yBtBxYVN2B3m4jYlvwssOkgTSXkE3qM4Jfr9iHj1pJBcd8U0K4RJRueFY56bzZg5KQP3
         ovtuqTUMEcDxkMUtqxu3VZuoycqfQnx1G/CyX9fBfxtEv8Tx55puGUJhuAv79G4bGXAI
         09UQ==
X-Gm-Message-State: AOJu0YykRAO5qfGzPbbxPL+teauSKGkLQ+CRtkEZN0XFSaSvAZpJcDjZ
	tKSGuFC4Rl5pzRG8+SRLFLhXIdO93qDiac0xc9yLhZ4IjjyrBvaQjRTQPHEGl/6cm/SxMaGxFES
	l/0IkjIrR
X-Gm-Gg: AfdE7clOH/wwOBGh1vXedzyW4d4PhdLH8Fl90xq1r7ZQC4+PEFtnRkRFToWEuAdoq0l
	bzcpSn7X4lX2/vig8uf+vVgCUw4CkFROGVbW3Jw+DTilql0GS+Noe1V9sH8/Ep1VvfoqLoCG4aB
	yG4sZJ7XoKe8tpZwqSA1JLrEnJ6C3z+Nh5k9f/F+jXK5BE2L9dki3toabPxu2gTtG9iqDuc76AM
	XY1Fzq/4NGfPBxyiuDBRgHv/AwmzHae37++oziOecAXTTipY4xD3j4+la5VGfee6vNsJNSZ0uan
	kE+jPczYC2hYHMCPkzt8ZLZ7m9kxK7wj8maMOA53AyZad2NB45pynK7bdnRovF+MC+L+snCPMwL
	p945+IegLBDhirstqFz1nVbY1/3oaMcTcFiA2OnboYqL8U0qpWbPYmKZPDpi3PNOJ3A6e7dlyxO
	RkcRd3dLuCSwGZTennnFowxn6HY6r6Yws6WBs+xej0bmiLvcddBqdE/uAa
X-Received: by 2002:a05:600d:108:10b0:493:c337:db19 with SMTP id 5b1f17b1804b1-493c3cdf959mr88703925e9.17.1783047635243;
        Thu, 02 Jul 2026 20:00:35 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:33 -0700 (PDT)
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
Subject: [RFC PATCH v2 03/11] rust: usb: add usb::Device::set_interface()
Date: Fri,  3 Jul 2026 04:00:07 +0100
Message-ID: <20260703030020.2694-4-mike@fireburn.co.uk>
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
2.55.0

