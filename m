Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254728A1E0
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325224; cv=none; b=UoHR9FZ0NM23AEnRsoQppjDHCZMExfYy2jw1gHWw10CJCbSodX8NmJl7/G9NsFHo5CS5vzvPiHkArSPlTyiipX+jALdP04UL7WNQkPXPDDCCI8dEciOhrXzdUvMEZXrVSrstiPyzNGeaKvF0Sxn6y3of+tN1T2QPjhVAxa61Q3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325224; c=relaxed/simple;
	bh=/9yWr4VyyEEe4/M0GRL7z9tF1e9qb+Lnb8mwvJ2P5Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1rdDEme0cbzxMSg15dpXfU3ybrP/a9z5GpMJUc64k9Ld/dSWlwN+JCSP4/c/iUSp+SU/0vSGi1ek0tv7TkoOMwuE7tIq4R7SaD7DDaPZ2XvbGLxCezy+LPHrhCe7MijRVKWxcuOA8zCfWNyKB2C4wsMV/hj7R3tPAuUxybyOdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=XUDMePRR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="XUDMePRR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af59c920d32so3420719a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 05:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745325221; x=1745930021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u26R6OPpO9Ptto2bJTGXyxlaV262RvFifNUIYuW77gA=;
        b=XUDMePRRwau6hbXp2DRrqU0H80nbAERLpL9U41YiV6qEHRBkoRybdeYEgx/Qe97W/5
         kIFrkYY1znVsixHCClQDjbmHFScc6kQpNBiZQrpl4SvjvzUosXdaaLVkHkR+y6fBhMbN
         NmsqF7pxqdyMt7ivV32Do8fiXMGbN6nW0B87yzfFU81W2kEljZ2M9eJRcaMZLAgM4oD4
         Z9YmUL8oN6Q9+4fwL2BQsm94IcvoTsuPav1xYdc6m/Qhwc2ayUtoBj/7rxERNPB+d8XK
         X7QiHgad+jA5yPPqn++8LjTUqmUKJRg/ZcZR8yS+JyHYRKT2Ddnt8f2G5OLdJIqje6+o
         5pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325221; x=1745930021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u26R6OPpO9Ptto2bJTGXyxlaV262RvFifNUIYuW77gA=;
        b=A9aY1E5K+HxsfWf+Y0mkBXudyXfXuKIk228Fqr9IJpDGVIgZ8TFfsleEc2AMlo48o8
         1sHcXbs4ZmrLXJcuHk4/2MzRxQpZkqgoTz4G562lb5iX33CDCs0d8XJfjWeFe1A1PIhP
         RnrdD1YZ/5uEgqARoZ/6NmJQHSC4hqpCreJgl2Ek6Y9syDF4zcVyrlhpTBR7hKY7wAwf
         ym+G8r7u0G6b5JAOu/t+hcwE5tJGePOUipC7w7EOiqpk/LqbLR8WtB+LC55iyI10Fa60
         T6ZJkvrPD0Wm9HQj4XWR1M9p0EqWWzL4ohR8LeXOS3TkAJHHUQVoQzFVkrhQpIt0w+Fr
         kIZQ==
X-Gm-Message-State: AOJu0Yy3t6Jt73h7yanDEsmDmLB4ENpTY0etGT/GwZrCjHGs1F2bkH2J
	JjP5UPF9gpQ6Up6gdDiDKscc2/Vtc9m16plrqIeAtaycOzu4BFp4YK9A+AJCiQ==
X-Gm-Gg: ASbGnctg3cXg2+gfOgJsMJpEYcan8Um5ZOOQNeNUjLHKI0RmF9Xh85fnZlOAIeK5XIR
	k913htD052D/D+ezqtIeMLTXTeHDd1c5ncyjdjMli0vyGT95sC07LpVYjyB/n6030HTgd+17Y/+
	lX65nSaVDndoMZL9tu5aT/khyKDqvLvjxWChhw8i9PrdazxnGFyy3OCs6eebiCbxGVoirE0NfSL
	cuw5KZq9f0AWIcMq7yGzsmh+Q0iZJanPitwyee7f6kyy3/4yd6AzmaFDca/tfgeS9HtNZr3hbf3
	hJSmjka0eW6ZoHYHs8RDkz/m0cwMjkER5CUbjJrcN9V6Ay8=
X-Google-Smtp-Source: AGHT+IFvDd9T69BUDT328lJpIDvCDubF8fDxhHEgU/5Y0HSLsI63u546lW0N0LUSJcs29JlcJhJ4yA==
X-Received: by 2002:a17:90b:2b87:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-3087bb66561mr18646220a91.19.1745325221022;
        Tue, 22 Apr 2025 05:33:41 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df05025sm8484220a91.13.2025.04.22.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 05:33:40 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 22 Apr 2025 18:02:10 +0530
Subject: [PATCH 2/2] rust: kernel: of: Add overlay id abstraction
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-rust-overlay-abs-v1-2-85779c1b853d@beagleboard.org>
References: <20250422-rust-overlay-abs-v1-0-85779c1b853d@beagleboard.org>
In-Reply-To: <20250422-rust-overlay-abs-v1-0-85779c1b853d@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=/9yWr4VyyEEe4/M0GRL7z9tF1e9qb+Lnb8mwvJ2P5Pk=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoB4yIwAGNB+SDnon22g0SDNe6UGP4QO7zgqflx
 mIGzfE0+LyJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaAeMiAAKCRAFzvXHieVa
 dAtwEACrLPZNxfutVOjabHDh4MFYxyKWCDyQ+EKjWeTyzYHUoGw1isI9YJCjoPGDDL0aRw+rjah
 XWhzpQoVr1ttEYP/81Tma/JhowNJObfA/0JrTvL5Uj7A4709Nf3Fvrm9E8hSHe7n9EC2d8l4CYH
 YiP13Z1TPZ9LhkVnrr94BTcxLHDeLn0X25q0GqI0jbkZkkHJjYz1vZL9X8QUFRYNwBZkMPOnGYh
 mLv1ZLDNMjOfNAVWL1Fv75VsEHRnJV+l/+NPbT+3mK6ByKdfwOvusIIsUWq/WVWOBWC4INB4D7L
 jaG21kcGMdvjc1G8dovf11tEB+CNdNN5oZihDU3i6mwWHt4T4uVFTtnroZur2deBe75V/AAEvY1
 U0OL87i3J2HqWZcEoHBd72c5kdDFlwpfl/N75Q/tSKENWklpNt1DSzXahtUJgAiMsZ4BBuMmlpP
 ifSqdPIcDKuYG+Cat3CMA0fGxFzrA79GUAUh1T49fERjGZg1lcEDBtuycudwzwwvCnVEWpd8QiM
 WMD8jGIdAyeJ+NJDg4nDPNn7ClLcbIkQAE6+IJp2yv4RxfAadYczEVyugal90RmnemM99dq8D0/
 BJ6mssrg+sACgD9zjSnKeGWXapLrCx6Uz0e07yIJkHfm+geIad03YWMwlD0Plfqbgah6p3et+fQ
 xnKep5NwyFwMv8w==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow applying devicetree overlays from Rust.

The overlay is removed on Drop.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 rust/kernel/of.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index db4ec26ff7de024f5e513a2223cfd841f57b1434..76dbb118d2dc21d1174e0a1ca8f8610d1d176119 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -80,3 +80,32 @@ pub fn as_raw(&self) -> *mut bindings::device_node {
         self.0.get()
     }
 }
+
+/// Devicetree overlay present in livetree.
+///
+/// The overlay is removed on Drop
+pub struct OvcsId(kernel::ffi::c_int);
+
+impl OvcsId {
+    /// Create and apply an overlay changeset to the live tree.
+    pub fn of_overlay_fdt_apply(overlay: &[u8], base: &DeviceNode) -> Result<Self> {
+        let mut ovcs_id: kernel::ffi::c_int = 0;
+
+        crate::error::to_result(unsafe {
+            bindings::of_overlay_fdt_apply(
+                overlay.as_ptr().cast(),
+                overlay.len().try_into().unwrap(),
+                &mut ovcs_id,
+                base.as_raw(),
+            )
+        })?;
+
+        Ok(Self(ovcs_id))
+    }
+}
+
+impl Drop for OvcsId {
+    fn drop(&mut self) {
+        unsafe { bindings::of_overlay_remove(&mut self.0) };
+    }
+}

-- 
2.49.0

