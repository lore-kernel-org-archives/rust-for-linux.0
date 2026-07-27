Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4740A93F
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155356; cv=none; b=ec4pm8knb+lIaY+A+d5Y/hDP/k/Dn5+7rJzD6mAsdZ/e+XIHHIYYcHZEX1KjOvSK3oDnvmYSiceCGiPqrOR1jA7p7xq84ce6JAlyV4i6w8cD8sjJBN7WY8AHkfiFUdocopjZIvgDtrdV/dIijfXsgdBaIA8j476AHF8sE2NHN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155356; c=relaxed/simple;
	bh=PgscUm7GMAptLPlNP/5OiGOeFvx+THHfSJroxVjNwTA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dDw7U/3DDlKfIQHNq05HQvLgYBJMAWWzerIHcEZ5OgFwxdD9nduUNUMn1oyNXgtdqpF2ljJXH7clZ9p+de4kAnZj6KDTG3MYtDPc8d19zibr2XTQ/hgl/AMZ4mddmMTvPNbHR+yu7raIG9sAe9TZ/xDf4s2wfmHOpvlLS0kjZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mUYe0pzm; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mUYe0pzm"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso30926685e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 05:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785155353; x=1785760153; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxX3YVH3x8AsIPSE7FkDkBP7QMxVO05d3xUXyEIKM/A=;
        b=mUYe0pzmHhWzg90vNZgOR26E7pUS2vLzSpQMirzxpMu+UhAyqAGpLxC8WnQX/miNtQ
         0cxR39txf6Hgj66yFCcmUqpFj8D+MzBF2Qlh9sCDvsQqXQWIUtukfacy+hCVEoc5wFtc
         XoVO5ZR0MCKLt2Ehd+pk5vmo/SWF2eUVkbBN2aBhCA0/xaTr9NyETx4E/YomqcC023dw
         yvrYDyVQRiIgK2Gw2jPdFMU5W+fNSHWRgTUdqF/WM8U154w89nUd9LPckeC3FX/VSEM3
         pjb/n45+FpmHA/sH3FZyZ9Lvq+IfW6oePDA/v1kXSft97wSVpgbfZoEVBhqxaWnsnIpr
         IFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155353; x=1785760153;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxX3YVH3x8AsIPSE7FkDkBP7QMxVO05d3xUXyEIKM/A=;
        b=d9N9dB9hW58RmPl9fVvT5d8O1g7NjtA+zeMbRbhDUrrT7jUPk7aYHvSP4xA3+mbylb
         sBt/wuoAYwBSQVHPXefeYRwsbpMR9Q2ubi3YZZ357bKmYBkienmyCyp/2otpt3LC5XtU
         UO1L+lNNw0Ec4Pz87w2aB6eI1oNY/MXUvNLA4DNeCHd+7cyj+80VBfOEiEYZnUP5UJoH
         esjtC8eM6+A9R+Zst41NEHr+DGdKAw4iQQIPy+Uj6A5zTQ/dOBOR2PaLx5O8yIvPKCbS
         nrmNtk7ZchixVFLoaJgOnPh/sp0LuAjN839yFRKaYPLyioWiqHxqyBO358bx2i5cvNqt
         b6aQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbJyKNLUt9tPFYnxH0KWE/2llEczEJ9i2oaBYPfEg/Q73Ryz3y49g1FFmMclW5jb2JQb5xvRE9VuES1aky2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj17vPOTiibArqh3HWgA6xqatPckAbDsghA7B+L3QjvgZuAZUF
	VkHCsZS9tyN6x6XGqsu9Il0NtEptQmdOBxc3XdqJpdkVTLfBxMT6wDmBXfvpTiqx2l4x/CkP0i5
	Q7QlpV8WYD4Dzi44VPw==
X-Received: from wmrk7.prod.google.com ([2002:a05:600c:b47:b0:493:b21f:6ccc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524c:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-496b84dd69amr97049895e9.22.1785155352466;
 Mon, 27 Jul 2026 05:29:12 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:28:59 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAApPZ2oC/x3MPQqAMAxA4atIZgO1iEWvIg79iTZLlVRFkN7d4
 vgN772QSZgyTM0LQjdn3lNF1zbgo00bIYdq0EoPymiDjlMgQX8JnlHIBhxNH4x12jvnoXaH0Mr P/5yXUj4YgdFgYwAAAA==
X-Change-Id: 20260727-binder-cur-thread-974d7ab2cbbc
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3257; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=PgscUm7GMAptLPlNP/5OiGOeFvx+THHfSJroxVjNwTA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqZ08S+0Sn/6ssWJ9dKipfnF+fmJxHfWYgY6FXi
 s8D6zgYgLOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamdPEgAKCRAEWL7uWMY5
 Rqx1D/9qUkQPxtNbs9BPHN/LJs/DCRb1GT6y9AHVRxUPheC6GXlJILC6B7w7VSt0P9uVEEdCKdY
 L8hsJYKpT8dPkseyNXKIle+poNqrnbBNomcYVHyjeS4Ey7/jMRmvYh/PKw6vu0D5HMWDhsJuE1A
 Hu9F2m/+BcMZCmcJLDRxPOIIDmSF9Gkzv3Z5dtACjrJRMajYPntzwHfWqNO2q2BoBbbIcIqLB/F
 ty3d8fnbNlr7J6SQutP1CL3/Gacz9XDEa0HuOGhG3k1IRjYmqgpv2n7qtbxpHndSh6nozUK/TH9
 hQ7kvRjZoASPcmqS5dULYbMllzyz+DgCkNm/km+O4UThq5ZPjAPNXAVKkPBcrOjtzWl76wJCYIc
 W4wehLafoulBE9xdL450NNlF5ZNNb+pbaXXGuqD1FFRfp11SKxyoE0h3Q9BCOft4gAYgKc/+wPo
 +c/tZwehlZ9Q28MkLzXMaem0ObuMe+S57NJdmDdpJeDM01YCZ0q34M4UO6Qzf75Xh4h+OB+cIx3
 pvLy/eJb8+t+5NrlUAT93Mb0G4K//nO5aKgDisLopUE+0MPEMNC+l/HYS0vDEPhU/Ei12jI0QLI
 jTjpB2l3JkRTU0wLK4Nal3hDXIvXTJfBwkRcYOn+oMFLT9F4Ey8tEV0PZ4bQW2PBzczjVMOoMvf NsUSAqS17mEFBjg==
X-Mailer: b4 0.14.3
Message-ID: <20260727-binder-cur-thread-v1-1-8edf2b64e235@google.com>
Subject: [PATCH] rust_binder: do not query current thread for all ioctls
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The get_current_thread() method is currently called for every ioctl to
ensure that a Thread struct exists for the thread calling into the
driver. However, not all ioctls require a Thread object, so this means
we are unnecessarily creating these objects in cases where we don't need
to. If said thread does not invoke BINDER_THREAD_EXIT on exit, Binder's
Thread struct stays around until the fd is closed. For long-lived
processes the Thread object is effectively leaked.

Furthermore, when the BINDER_GET_NODE_DEBUG_INFO ioctl is invoked by
libmemunreachable to ensure that objects reachable only through the
Binder driver are not considered leaked, this is done from a fork of the
process owning the fd, which means that it fails the group_leader check
inside get_current_thread(). This results in EINVAL errors for this
ioctl, causing libmemunreachable to report a false positive memory leak.

Thus, do not invoke get_current_thread() for ioctls that do not require
it.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1778628d8acd..5372bfbd93b3 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1662,6 +1662,10 @@ fn ioctl_write_only(
         cmd: u32,
         reader: &mut UserSliceReader,
     ) -> Result {
+        if cmd == uapi::BINDER_FREEZE {
+            return ioctl_freeze(reader);
+        }
+
         let thread = this.get_current_thread()?;
         match cmd {
             uapi::BINDER_SET_MAX_THREADS => this.set_max_threads(reader.read()?),
@@ -1673,7 +1677,6 @@ fn ioctl_write_only(
             uapi::BINDER_ENABLE_ONEWAY_SPAM_DETECTION => {
                 this.set_oneway_spam_detection_enabled(reader.read()?)
             }
-            uapi::BINDER_FREEZE => ioctl_freeze(reader)?,
             _ => return Err(EINVAL),
         }
         Ok(())
@@ -1688,15 +1691,16 @@ fn ioctl_write_read(
         cmd: u32,
         data: UserSlice,
     ) -> Result {
-        let thread = this.get_current_thread()?;
         let blocking = (file.flags() & file::flags::O_NONBLOCK) == 0;
         match cmd {
-            uapi::BINDER_WRITE_READ => thread.write_read(data, blocking)?,
+            uapi::BINDER_WRITE_READ => this.get_current_thread()?.write_read(data, blocking)?,
             uapi::BINDER_GET_NODE_DEBUG_INFO => this.get_node_debug_info(data)?,
             uapi::BINDER_GET_NODE_INFO_FOR_REF => this.get_node_info_from_ref(data)?,
             uapi::BINDER_VERSION => this.version(data)?,
             uapi::BINDER_GET_FROZEN_INFO => get_frozen_status(data)?,
-            uapi::BINDER_GET_EXTENDED_ERROR => thread.get_extended_error(data)?,
+            uapi::BINDER_GET_EXTENDED_ERROR => {
+                this.get_current_thread()?.get_extended_error(data)?
+            }
             _ => return Err(EINVAL),
         }
         Ok(())

---
base-commit: 2cedf2272f1bb42471e646868ac572cc5752bd91
change-id: 20260727-binder-cur-thread-974d7ab2cbbc

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

