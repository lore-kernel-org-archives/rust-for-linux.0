Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8534146AED1
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708597; cv=none; b=jxhwrIwlb/JDEWPv7bYkcDXwVB+s2/0xAX6cPaDBlJRMa6SFP+v7htmyldP7o2qf28KCl2YM/1vtANVvQz0TkyPncnuBkoszYwNerdF3CouUBo55xKl+eq1h6k5OGYYAYCYrsptEPY+GHGMnQ8cJlTRSz6iTqg9/xO5MHRR9h80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708597; c=relaxed/simple;
	bh=TAkzUuubh7L4KT1B7vjb7dtXUWF0L+WF10rCCZGgADo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FlrdweNytdOHijorhzsM9VH+TJMmlMQOoPxCPLDVS1iyUORrsNyXslb9xiCDcliV3dtaAMLJ3xYqIHpXFcJVIJxK3ZaYFYfrCK9zoguD2uBmoVm/cQ0Ug33iL2dj/K/q0NI1fNXIRG0bJAUPmQcpw5/J3oGOGmaJC8/sKDeYjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=0gw9oJe/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="0gw9oJe/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6958372b199so1074615a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708594; x=1782313394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPM0l7cGbbSYD6UImT0eFYRpGfGHF1+7B3QhvofMf/o=;
        b=0gw9oJe/1PRdfv0P1yt/VuDOXBEJF7uNHhGgB8ec7+NVet6IXQQaryOdpHkqKXgj6u
         tNqNfSclCFbdwI/jrF9pfvCeRQm8wJ0TtXMoFbPXHV0pMxwsf70UFVso6bGZdyVPZ4QT
         9c1ZQMIKJp8YreaPE9n5+DySKnL6wOkaW73Tj5JkH39Rxa0QQ0toT+572FPCTkdE/vXQ
         B+dZMielx60muKAwSmOOQ8wlLwzCwhA0Cd8ecAu7HIhnUJ8QIMupA43ckgKTZXh5dJ/r
         R/Hc/kTd11E/dg0UkSmn7+FqqY/FtUpPg2zv8UUDNC/+P+viiwwCbWkvj2iagWgibYv6
         QfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708594; x=1782313394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPM0l7cGbbSYD6UImT0eFYRpGfGHF1+7B3QhvofMf/o=;
        b=D/gK6aE6JOxB/U+vSFlc8771MfCzWExmUzJC7zAF6SMVM9aBf6yN2256iq3uMpP/Dk
         mrUWf8j77c4yLE9oAd6zDu3MK6eS436Uny0WgR4CyjoepCPeSyfz2TTxpPCqMYVCVqgC
         /cYzrSRGZCgrwJX9/y7J26ComkQ8f/PWhjbmPPvXeVZEBlKBQ5AsJRoEZrBEn0hQzoD7
         FQvcryGXgyv7/rJBjJNBxyHdqjQ40UFyFVqJTO16EBkFWE7OyoSuV3TxGGhQW+qDWBfG
         DmVAqG2iJJeLYid0xz+JJw9cRTl4dKoRXtA2eOvZKVyqqnyRDNkNOBxCErpNmfWue8Lc
         PN9A==
X-Forwarded-Encrypted: i=1; AFNElJ89maz8/j09M0JHR3BzK9THsz+LQli2FQCQjIUkdqNq5UBu0Oj9qK6LkOIPoZFjeLoMO9iazPEdhijt2hQ6nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjaPf2XsoIEZ0piglOSr7ZlEFo+bXbeAkBsYAteFt60vomUHs
	Iy3SgF+Hc6MNFjwv7ftWK/PeKXo7YZ8Aj6BDVxG98a0kMTqNkNHAxHyFgprnXK5uJQ==
X-Gm-Gg: Acq92OHkOQMm/wK7rTDf9T2qIAa7Ad0G7l64aTGZlb4WiB4rSFNLP52/SapCU5neLWJ
	mBE73EbPEaEn8QArtkhRzpi4xiAgCPZZSeVqLWLqw+MSEexjdnAk1OWtzkeGtpr0nSURpxbS8Wl
	JHuB8FVM1ygErML1h5yge0kvrsXTN9RZe+IJl0m8ODMQRbwthJF9GTXoWvydcwwOqxhXtiHCovE
	IrBEbjmrTnkiz4lWEV4INHE/5kkbWdCGxcl94lOz5ggqIT7JJRMPfMT48sFxfCevb5F+hmedwPK
	lAWSL+zla2JdJtEtBsDoFgrO+WcMWZmDhLA57ekBji4njYkBkdprWNnvA1puCMqnwqEHI9Nqu3P
	ApQLa0PJURBxVl5gm4Sfwp1q9D9hKJqfszGGKG4uDay8+M1ZhqkY98e1zl+9RzuKZcCrRBTIKU8
	nNp/yfweuliBOnKsqnJARc4Dvlsil5y4NilLPK6VtnKV5195Z2q569Im05
X-Received: by 2002:a17:906:8464:b0:c03:ff6c:5cf1 with SMTP id a640c23a62f3a-c05a4c03ee8mr167079666b.10.1781708593864;
        Wed, 17 Jun 2026 08:03:13 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm10065491f8f.10.2026.06.17.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:03:13 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: drm: unplug the device on Registration drop
Date: Wed, 17 Jun 2026 16:02:58 +0100
Message-ID: <20260617150303.2259-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`Registration::drop` called `drm_dev_unregister()`, which is only safe
when no userspace clients still hold the device open. For a DRM device on
a hot-removable bus (e.g. a USB dock) the device can disappear while a
compositor holds its `card`/`render` node, and tearing it down with
`drm_dev_unregister()` leaves that fd pointing at freed device state — a
use-after-free on the next ioctl/mmap.

Use `drm_dev_unplug()` instead: the hot-unplug-safe superset. It sets
`dev->unplugged` (so the DRM ioctl/mmap paths return -ENODEV to held
fds), drains in-flight `drm_dev_enter`/`drm_dev_exit` critical sections
via SRCU, unregisters the minors, and unmaps userspace mappings. For a
permanent device it behaves like `drm_dev_unregister()` plus the harmless
unplugged flag at the very end of its life, so it is safe unconditionally.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/drm/driver.rs | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 25f7e233884d..aa86ba136b03 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -135,7 +135,15 @@ pub trait Driver {
 
 /// The registration type of a `drm::Device`.
 ///
-/// Once the `Registration` structure is dropped, the device is unregistered.
+/// Once the `Registration` structure is dropped, the device is unplugged (which also
+/// unregisters it). [`drm_dev_unplug`] is the hot-unplug-safe teardown: it sets the device's
+/// `unplugged` flag (so the DRM ioctl/mmap paths return `-ENODEV` to any process still holding
+/// an open `card`/`render` node, rather than dereferencing freed device state), drains
+/// in-flight `drm_dev_enter`/`drm_dev_exit` critical sections, unregisters the minors, and tears
+/// down userspace mappings. For devices on a removable bus (e.g. a USB dock) this is required
+/// for safe removal; for permanent devices it is a harmless superset of `drm_dev_unregister`.
+///
+/// [`drm_dev_unplug`]: https://docs.kernel.org/gpu/drm-internals.html
 pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
 
 impl<T: Driver> Registration<T> {
@@ -197,7 +205,9 @@ unsafe impl<T: Driver> Send for Registration<T> {}
 impl<T: Driver> Drop for Registration<T> {
     fn drop(&mut self) {
         // SAFETY: Safe by the invariant of `ARef<drm::Device<T>>`. The existence of this
-        // `Registration` also guarantees the this `drm::Device` is actually registered.
-        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
+        // `Registration` also guarantees that this `drm::Device` is actually registered.
+        // `drm_dev_unplug` is the hot-unplug-safe teardown (it calls `drm_dev_unregister`
+        // internally after marking the device unplugged) — see the type's documentation.
+        unsafe { bindings::drm_dev_unplug(self.0.as_raw()) };
     }
 }
-- 
2.54.0

