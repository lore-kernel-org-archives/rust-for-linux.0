Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8EB13C67B
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762313; cv=none; b=F7cikXpZQZPUdCICf+dBum8nRdc9tC65yctVHjZhnXYRDqKkS1YZrORYkPglT2c10iKF8efbQIotbkQ3d061pNP7pqgac73ntDINVhTrg9DEnglTm+vhWkFxCN8JGoehp+R1Rah6FAReoz0vIiBieKTSN4cNBKh6Jq5ujWmiuDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762313; c=relaxed/simple;
	bh=5KQKwqP+iyNwDZknX2vF1/0SHIiJy3SofrKc3jZFtgE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q2nBbOJJ7tqDimqtjEbkTlu/OKD05FSY0xIcLiTsaiDuwBzDQfBSTr7yQpcy8szjRdNsLrm5hKKtkMPyp+PGfinutRFNH+VPW5WbtgLpvDznoqu/5n2z7ZjqBnmN49yz2LGEDMJ2kt2s14Gb+f4kz7miZ2+DgD9mD57TPVLgIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZz00JQu; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZz00JQu"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b97f09cde3so262789eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717762310; x=1718367110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ejJYUTymxXCdJXCEblRqnmvXk+rUpZBBw17pH+ow8E=;
        b=XZz00JQummIBGdOhyAjN7coPsyshR0FwBXR8Ak2dZh5DvstbfRzIQq+TJNgpN/WPDO
         W/9URmZP//SAG9ZlrgTNAYiwaX6BRnFGBEn+CJ+fT9KHZM9nY6aUJDJ2YjI25f/a/eJL
         R5/UplnI1nU3QE6oElbeHSgiy/HiGyulZ8FGjejBFbP5i74ZnifHYhPPO95uqQIOXycZ
         8lFULah1n1WuLrepczH3NrkQ+oUjFh/Xi0oPOZig1UrbydabWOiWGQI0xCAnfTZD+cp2
         BGzpKr0yq2zGhxEjxLHudJPSbcFmdmyAfkSshw5b1GdfTtyZgRVHLIv1VzudM3Y/zwze
         0WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717762310; x=1718367110;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9ejJYUTymxXCdJXCEblRqnmvXk+rUpZBBw17pH+ow8E=;
        b=ZwN4QdKtXmSWmb0jYPRp/lqjG4SkdRmQL5k44IBm5V8ks4Hg9Xma/dlQlrm1oINcy9
         73CZE1uLVAIp2vRn+PSUoav2al2bKVeUU4u/aQhNYMNga8iKK/Y4rtOzshoFEafbbUcF
         vpj2GVxvIT1gpqxPTdQb+mUNM6OwdcxkuoGLriSZjbjShedN+5sGRstJlykYXnKf+5Ch
         dMi2RM6w5hjEzQ5mSH1fGh1Zj+3l346UxPS+z8SjEtA0X1crDtCcTVZo7vLhVjGR8Zhh
         +KYkLa8F2j2GF5YQ7k/2UtR+PH1HkcjmEq+AKSpJ2ctwPaKZmwFO/DF+Srw6iOYN2JNu
         9Hng==
X-Forwarded-Encrypted: i=1; AJvYcCV9kVgoegkzEvgz0d+EREyQbSlq2iaC5r1NAgHnrTUCTGjpeJFGIuwH5mJN5Kfo2L2gwrgEPvet0CRk3Y8g8kzlSDCDNoqJrA+1OP+WTFw=
X-Gm-Message-State: AOJu0YyzOrDaSWSTRab5sL24LMl6xdrU5+SkNUs7sTSmiHcUG/sA4pSx
	DmabMEd1/+1YneR+vU4GlraPWgU1MjqEK0V1GBbhz1AcjmAtdH8N
X-Google-Smtp-Source: AGHT+IG93K5LasDx76aB3h60qsup/I/V+qgt3wQKVPjU0LZk7V6uDStCyNutIbwM9d0MAoOglo2EJQ==
X-Received: by 2002:a05:6358:70e:b0:19f:19dd:901e with SMTP id e5c5f4694b2df-19f1fd06835mr256324155d.1.1717762310161;
        Fri, 07 Jun 2024 05:11:50 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de2017fc69sm2165585a12.17.2024.06.07.05.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:11:49 -0700 (PDT)
Date: Fri, 07 Jun 2024 21:11:32 +0900 (JST)
Message-Id: <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, gregkh@linuxfoundation.org,
 wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Zlmfkws-QjNmFxfr@pollux>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
	<20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
	<Zlmfkws-QjNmFxfr@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 31 May 2024 11:59:47 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Once we get to a conclusion I can send a series with only the device and firmare
> abstractions such that we can get them in outside of the scope of the reset of
> both series to get your driver going.

Since your discussion with Greg seems to continue for a while, let me
include the following patch that Greg approved with the next version
of the PHY driver patchset.

You have the new version of the firmware patch? The unused functions
will not be merged so only request_firmware() and release_firmware()
can be included. If not, I can include my firmware patch that I wrote
before.

=
From: Danilo Krummrich <dakr@redhat.com>
Date: Fri, 7 Jun 2024 20:14:59 +0900
Subject: [PATCH] add abstraction for struct device

Add abstraction for struct device. This implements only the minimum
necessary functions required for the abstractions of firmware API;
that is, wrapping C's pointer to a device object with Rust struct only
during a caller knows the pointer is valid (e.g., the probe callback).

Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 rust/kernel/device.rs | 31 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 rust/kernel/device.rs

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
new file mode 100644
index 000000000000..55ec4f364628
--- /dev/null
+++ b/rust/kernel/device.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic devices that are part of the kernel's driver model.
+//!
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
+
+use crate::types::Opaque;
+
+/// Wraps the kernel's `struct task_struct`.
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::device>);
+
+impl Device {
+    /// Creates a new [`Device`] instance from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of 'a, the pointer must point at a valid `device`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::device) -> &'a Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: by the function requirements the pointer is valid and we have unique access for
+        // the duration of `'a`.
+        unsafe { &mut *ptr }
+    }
+
+    /// Returns the raw pointer to the device.
+    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+        self.0.get()
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fbd91a48ff8b..dd1207f1a873 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -28,6 +28,7 @@
 
 pub mod alloc;
 mod build_assert;
+pub mod device;
 pub mod error;
 pub mod init;
 pub mod ioctl;
-- 
2.34.1

