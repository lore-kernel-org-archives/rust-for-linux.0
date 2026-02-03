Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015053C1960
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133611; cv=none; b=QNiea4DaldotzIMXR76x/ae+UQyUMimCMfZYmqflwKfrooIAeR3iPdZQAXVT224QPVlAJ8b/q393jojQO/a4PEGt3EWWoZC1rBIbM7bu3mmkssfpVYq+IdRJlas/rqqvrp2n9mqx81Wes9/xSnbxgYMeGoqrCxTSv/J3cwikadc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133611; c=relaxed/simple;
	bh=WtZdKvjX12D2Jmn1kMkn/+vs+NvlqXqrgcd1O83Ixd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CDIgiaNKP2MR7x7kkXvweCSHkdd0y+3bfobWaRsc8tyJhVNuYtCGkJPilX9YN+03iZGCU0yRAlOe3ZL78Cj8lneHBmdv31ddu4fSWLgugpvHoaNu/95TlJ50AFHAVbqkD+c284pHbPREuoLq7/4AM4MrPrRKKkwo3DDx88luvEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JMhDliBQ; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JMhDliBQ"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b71d3ac508so5518404eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133604; x=1770738404; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wdhof5UcFa0LauNDEG7A5hw9JfGF2S2FIbHiIBJlkVI=;
        b=JMhDliBQdB401m4c4C0KNuAymBVfVm7HIC3RuXQTEm/8bbPFzsTTksVSBFYkqmOyas
         TXkhkwlbVMspSvdCp5nC0BM718ZtxV7B48osVyq9e1zAuefYTAuJogGA5DHYFgwoxQ6w
         xcMWnRMmRdSShoDOXPoQLtJ+C+H2dnQr6FndrE1wF7Ql7lTZ/kYzmsVGqNdTLUxlo0Ja
         a7QdvpZKPZnEUyFzXIvct+1HAHp+4atlbE5lFJJbF2SIgOCQ4MS5BAqTvbO1Q8VxgH4z
         u4EbCQjPrPxXbgmM+oVuRXGuHU84jceziqxUbHg2fIGaFLSa0+mB+oiPSypwmS2vmRCU
         MKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133604; x=1770738404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wdhof5UcFa0LauNDEG7A5hw9JfGF2S2FIbHiIBJlkVI=;
        b=pT8SIDFDzvA75sutpeWtIYyqgHZSMz9iwLBjQg5QGYabbRoGwMdKd8rqoOv/l76KDm
         nc5Z6fwlO+2LLcZL8dO0Zy844RQh/y7v905AVKc8HwXoNcLSTbxLzjGyQTk/b/UNG7WV
         5Y9jNRtnFaszbZETUuoLvl9lRUEgNYV6JQKjbu7SqY1iCiQsA2QVewvYZSNvBhXpYT7N
         hwj9t2nVByH8W0kah5+k9pb6w20v0DQetrmoJFJPNbhjhw5/Q14Z2yYcbfsVxmY/hgrq
         Mj8e2Og6mmkHSgXqWDcBWSoOQT68PQFEGesqIrJlMbb3LYB2YqyERQKeNjUyHPeFEyvX
         mNGg==
X-Forwarded-Encrypted: i=1; AJvYcCVE00AdZ4kuz2X11gTCFf26jhy24o4fYRJxagGyq+sgOlisFKA/B5Q2VB7gbMhO0SnHybOv92m8ShnYqWE6Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEv3gPJvcPLxJWa3gYQhitjHZ/Q5e0/RBHBfBd/bmTY3899muX
	KOtpR9UzV0CgNXFFcqkg/nCRu9OzonidhtlwfGKzX+YK2QnFl46RvtL02Ma/AJVZtJDOUmnJifd
	7nsx8HOId0w==
X-Received: from dlcip4.prod.google.com ([2002:a05:7023:c084:b0:124:a6e8:e9eb])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6281:b0:11b:9386:8271
 with SMTP id a92af1059eb24-125c10081bamr8120436c88.46.1770133603693; Tue, 03
 Feb 2026 07:46:43 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:34 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=2442;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=WtZdKvjX12D2Jmn1kMkn/+vs+NvlqXqrgcd1O83Ixd4=; b=y1zunl2p/I9o6cmWUb2NnYfAPstnO8iv9BQaW1CxpWleUmklNBei8N2Of6dN4lKwNKIrkORJy
 w7+q2IWbzENDidaJ41cve7e/37dXsY/YHczM8JnE76IbaJ4tUPyi7qM
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-5-d6719db85637@google.com>
Subject: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This adds support for creating a DebugFS directory which is aware that
it is bound to a device. As a result, callbacks under that directory
have access to a bound device which gives them efficient access to other
Devres, ability to use dev_err! and friends, etc.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b669e9ba61958bec609e 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -11,6 +11,11 @@
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::{
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
     fmt,
     prelude::*,
     str::CStr,
@@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
         }
     }
 }
+
+impl<'a, T: 'a + Send> Devres<Scope<T>> {
+    /// Creates a new scope, which is a directory at the root of the debugfs filesystem,
+    /// associated with some data `T`, enclosed in a [`Devres`] for the provided device.
+    ///
+    /// The `init` closure is called to populate the directory with files and subdirectories. These
+    /// files can reference the data stored in the scope. Because it is stored inside a `Devres`,
+    /// the init method is granted access to a `&Device<Bound>`.
+    ///
+    /// This can be used for cheaply accessing device-protected data inside DebugFS methods or
+    /// accessing device-specific methods (e.g. [`dev_err!`]).
+    ///
+    /// The entire directory tree created within the scope will be removed when the returned
+    /// `Scope` handle is dropped.
+    pub fn dir<E: 'a, F>(
+        dev: &'a Device<Bound>,
+        data: impl PinInit<T, E> + 'a,
+        name: &'a CStr,
+        init: F,
+    ) -> impl PinInit<Self, Error> + 'a
+    where
+        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'dir ScopedDir<'data, 'dir>)
+            + 'a,
+        Error: From<E>,
+    {
+        Devres::new(
+            dev,
+            Scope::new(data, |data| {
+                let scoped = ScopedDir::new(name);
+                init(data, dev, &scoped);
+                scoped.into_entry()
+            }),
+        )
+    }
+}

-- 
2.53.0.rc2.204.g2597b5adb4-goog

