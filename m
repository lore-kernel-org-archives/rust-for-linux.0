Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097B3D6478
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649394; cv=none; b=qo6ZmdPpS6N6Dpy4GrkhAT+C4VET5TNAe/DytBEQXdwYwRtSykOipv1C93rqQaMt1pkE2l6XhFF91dwtzedM98eJ12iQLE7i2v/Jg+n2f4HStZz3agAfkLTjyESguULdv9tXJzHO36YXUR6F24XmKM74VSakNk1l7hxMkDFvbgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649394; c=relaxed/simple;
	bh=NACjCW4uUizcEdB6sSH9ZQ3fbHHJa6g3OJEVl5rRkRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ddwythns4LSZe6n7EMrRN9qGoeYPoE+c4k6Cpe+eqURu+ikyOPUc4Dr0izt4Ty9EEqsmOA6ARAt4qiUKD2sdZgUYYdcuiIax+fsbXYQREcErSrFoLme/ETOgeYKA2Pv+1KllmU1t25EvyHIiRf5V4CSQZjEs39YxIK2BlziVhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f65rhk5Q; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f65rhk5Q"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91591f19716so592805485a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781649391; x=1782254191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IoJP3ySdUx4DkxskDKQ8frRVgBTvEGDGFX0mngUY5c=;
        b=f65rhk5Qpxy6hBTeYsoyvqHDyWSd//OWnTEB4KaOB60Uy0d0BkPW3C0AvHuKwkPvqA
         Wrp121pKktWSnArwb3RTeLPFrR0sR5LrksdS3LardpfqG2OIXooEXO3d07R+vVuUEbPC
         otu3BfH5YutDu+jm4eR2ggK8PrAbZI7tg2Y/ogeXwRK106h0uG3Yci3j9HVnACM0FkVe
         cIa9roNp/jLSW2jtOAWYCAKquRat6hlkqv18LeyrkswxwFROe1TPVoeZI/XxCe3bVQno
         g8nzebm2B5yGwNKGWjcOzVIBe49lzlqMHQ3xN6l5GeHz+Gs9TWUIMRCer13cJZNAXXhb
         Ntaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781649391; x=1782254191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IoJP3ySdUx4DkxskDKQ8frRVgBTvEGDGFX0mngUY5c=;
        b=grR+xXlXVGV+Lwz6eQpBDvbmrOt+mJ/Pwu+TGz2UjFZK94fn7LndMu/oBY1o8VryTH
         4gl84v+y9rd/meEIvvVYTxpJFL+3RVS/o6ia/Y6RGLt40TMLH5w1X6OwIjcloqAGrsp8
         36R3LIf2LEuBjlbRrqeDWHjsNtBmJ31tqxa3jTI1O4Ok40BDKBc6ZYChZq0PaH5Lj/nz
         txyq4w6W+awObt6Ilid38+aUhC4WVjXJVn9hl14Q4t25WsSuzuHas0tpNHokWwvdMc0/
         MP4EZ9xZ1WYtGQCVZS5oO/rlUt1HHmzIBE/NzdHhDzHNZEzDh1IoPqj48QxC0L7NeYv0
         UaxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t1cAf1RI6LdHnWazGzhd3u0Q4dI20BE3U7PS9zxg15Beq4VaIWSlxIQb7KmAxR8KNbDAZT3vedecLwD1EDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+jibUDebtEWHqM6Gmf5+Mh8dG05vyEWh9nNXICkjm7lI/cix
	wxmtnW8EOwtvKaDof0IE5Pv7Y6/CVPL9bpw8SjNjWU+5dahyASNv/nw=
X-Gm-Gg: Acq92OH3NClnblO5U5/OSRsUUAPuFL85lmc/W7XS+1LJxGZTe5SdFE3AJyUkoNqWHAw
	fZZ4FfutOXnHEALVf0Q0rz8piuokIW4H3Gg0e+5IoP4Hkzy0tvV0vEtuFOJzQqcn0JyJ/JyKQ2y
	zw+ibsYWG9+hn2N49GcmNcdWL4WqjkEkQgwLOkVPmUoe7AWWAsNYjP8W4O1QtShB1ZP7/S5CryN
	sEiDOKtnbierokMQcz5rmFXRufMBsawD1i+ZybEEHY1vLH8cc6kw+mEVYGdA+jF2w1Y+MCf/Ofj
	EEQeFUJag4apXCsWQBaOHQhcvfRAeS+95dqRZWOVPKIAouBBM6w5Sv/SiCNbELpCv1RL3fDZJGD
	BDffoTNmjL/TYC9StArJKFXAQHZoYp7j0rBPoO2EN7CqJEcdbPlmbXucb3+4xPKJRnjqsiFqz2M
	+09arKaWb2SkQJnfc/hyb1UomCllawdn7LYujgRCrMXu0VOnJhrYMAAgPT/Rru3S4yHASlGjvcS
	yU=
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr140872385a.27.1781649391215;
        Tue, 16 Jun 2026 15:36:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006ef0sm1524236585a.24.2026.06.16.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 15:36:30 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] usb: rust: mark Device and Interface methods as inline
Date: Tue, 16 Jun 2026 19:36:06 -0300
Message-ID: <20260616223614.16444-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
following symbols are generated:

$ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
...
ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefCounted>::dec_ref
ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefCounted>::inc_ref
...

$ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysRefCounted>::dec_ref
ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysRefCounted>::inc_ref
...

However, these Rust symbols are trivial wrappers around the
`usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
functions. It doesn't make sense to go through a trivial wrapper
for these functions.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/usb.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 7aff0c82d0af..efbbee319b1a 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -393,6 +393,7 @@ fn as_ref(&self) -> &Device {
 
 // SAFETY: Instances of `Interface` are always reference-counted.
 unsafe impl AlwaysRefCounted for Interface {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The invariants of `Interface` guarantee that `self.as_raw()`
         // returns a valid `struct usb_interface` pointer, for which we will
@@ -400,6 +401,7 @@ fn inc_ref(&self) {
         unsafe { bindings::usb_get_intf(self.as_raw()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
         unsafe { bindings::usb_put_intf(obj.cast().as_ptr()) }
@@ -444,6 +446,7 @@ fn as_raw(&self) -> *mut bindings::usb_device {
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl AlwaysRefCounted for Device {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The invariants of `Device` guarantee that `self.as_raw()`
         // returns a valid `struct usb_device` pointer, for which we will
@@ -451,6 +454,7 @@ fn inc_ref(&self) {
         unsafe { bindings::usb_get_dev(self.as_raw()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
         unsafe { bindings::usb_put_dev(obj.cast().as_ptr()) }
-- 
2.47.3

