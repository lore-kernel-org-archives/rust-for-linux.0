Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A37A59
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766850452; cv=none; b=le98qBCL4HIu9alULO9iWmP4KeWBjPZud/loWT3rhyK2grrb2RKiuf5ZwW7aNTS0UaAhbZ3X9IDrWfzAZXc/f1+eR9n0a5uzUZ5/MNrHNspWjP3UFt7VC9/OD8U4sMgM8F9Wfb4M3h83M9OsUWYVBuNedsKgApTkOWFTxF+Sll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766850452; c=relaxed/simple;
	bh=ugEVu7ukFgEeBForjMwizsSpeYMh8Zpix3Wci8jVNiI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iTB6qZo1JICmOeiOjoHCyY0AWg80TT9WYyNoblKRkyfs8UJ4ysLONFofmVZDM3U96uPcSXxhAwgTd8ezq+ZiOEyRq74SSuQfdbKb1jyoWxY/hDwBAlekR+kox+/ROGqbncct+Xpe1bCnNKnPjtR9/EKkuydq0/4HeLNyOTydi0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SEB/wS+h; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SEB/wS+h"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477563e531cso52703615e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766850449; x=1767455249; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N+drOL0+Cvcr1jFf6wD8Nm0/3jquhQQP16UntNjt9bM=;
        b=SEB/wS+hdq6TzP/Cyh/L6VW9BkJvmIZ7WV41VUMEeGyJodYc4R3L59UdkjqBseIx+z
         otjq23YIhWwzxcijycrxRKt5kp2N3qqepH3utpVdZgkyCNrhv+9/L2utSMLOKb3GWPAk
         /mLN9q/LEqdKePlw8f1cyXOMtc/Dxqyw3dpIYEbQGIqHgbOFcaRQ+n6MGjDsYQ40db5W
         JC7JEwy93vDuwZub2iPyY9SnoYfaBLGtln8kIDV2kke+YtKUOWf3Ji3XzsDHBVVMfYst
         hBRk2mGtLZHFGsJiHXomGMcEOGUZoT5iK/oIq1Yq50oGw55ZemDNeT3U3925pCBsDIIT
         MYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766850449; x=1767455249;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+drOL0+Cvcr1jFf6wD8Nm0/3jquhQQP16UntNjt9bM=;
        b=YV4P94Du5mSwOHRMoGZd9BypKbF1ZIorcH1pYjk2Vfbpdj723EXqdKJNItbnEp0vbo
         H2bs3242+/tFgfkdyxlOiZAA4i94kaHrnWaiadaga6RozNMYpcr/zwaC55BukwrhskI1
         F/4HWEy7HqIJMqbzv6nmoqST2/hhqLkJte9lp4AT7h9SdQbSIxoxDzHQN68HouK2gHqj
         BfuzC4PbIOEwo1CXKWXV8VzU6cZjAzPF1Dlb2HgQ3zYLCKQmgSQTF7I05eEqUESUhljr
         5ZM9zKNYMEFG2HeaoKTOuwmAUclb73GEjP4awdsCdKf7dFI7f/2Wm4KPqVCeF2cB2PTK
         0yLw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Qu5mQCLix1E9K4bw3mHL1VHQiF9TtW+e6YYa20EkjUr3k4SjH4iUZ3PLMW1OKG7n7g4/rdokJxR8U/zERw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73rwdQvsUEi2k/s2qD4ZR/RSP60ltQ6Dg/gmExpBM5LWHGDnE
	of94LuzyJSyiYPs4qGVe6qGN1q/mdRIM3D7U4JkDsvxHUFXYIze2GPOJuDwCf7RvVGX37wqUuf/
	pZg9erKPXcsf4OYRR+Q==
X-Google-Smtp-Source: AGHT+IHll0VxKOQ/mpDMRMfORazWLU946K0+iKlu4OUY3tiFT//MR+nHUpC+CXdPlr+xMX88Vcrg1dHIbUPqVsA=
X-Received: from wmbfc17.prod.google.com ([2002:a05:600c:5251:b0:477:7a96:c9e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35cb:b0:479:3a88:de60 with SMTP id 5b1f17b1804b1-47d1959e061mr285246035e9.37.1766850449271;
 Sat, 27 Dec 2025 07:47:29 -0800 (PST)
Date: Sat, 27 Dec 2025 15:47:21 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIj/T2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNz3ZSizLLUIt2SyoLUYl3TRBOj5CQLI8skc0MloJaCotS0zAqwcdG xtbUAPGV1uV4AAAA=
X-Change-Id: 20251227-driver-types-5a42cb829b71
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2544; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ugEVu7ukFgEeBForjMwizsSpeYMh8Zpix3Wci8jVNiI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpT/+LeH+AawZJTrL/LD8PxwZ8o+ARRZ0bMLSNF
 HFgZnOYZ3CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaU//iwAKCRAEWL7uWMY5
 Ru7GD/wIgfrKI0ZPLHJniMunkl/PfjYAjwesMl5jKtTQ8JWu+wmn8nAN/mRuxbbXfNjI9SebQ1K
 OmAQrsKD50cUfS3qfVl+TfgUtt27BG+K2MpbLrLfO/CMYB3EAsddyQ93EoHmI8Z3yXLhSikvd0w
 JwQPM3Afoknl9SItrKkkU9Wh3cl+GY1gn8ye6U+ZjjX0VzOlNVS4eCxceu8P6XuQ/Bz6x1EPK3T
 fNRUlXE+Emj8EH9D6cupbSFHclqhuhuAh8cmsDSqrMfwzYLZ9qsPcmM6+Q3NDwCpEXAqZXAI0h3
 IxEsZ8m2L50nvKF57YRJ1SeENTR4U+HPS9Hdl+c9fHrwBgj3Oc1DPrDsYrIZGEaYjAcoYn4WGw9
 5oa5+BWExSbhcd+VOC2n5bWxGjhmfMfNowbgF1u4HCBWxHZQobwB9St70vtry1ku88yboNLqAl/
 I9sv5iynhS/jhUaCs9VGqc+pSsDnHa3ewuCLhCEk/eCbjrsXn+lZQftfObaaZ4K4qtM2fBmMRXk
 cIaheC2GwkmxarNM12QuzwZcBxHBxo4/KacsAt2cIw7o1xqbsurv426iUtoZWGQcMR+b8ZSEYbV
 MHVsXapwlUQgyiwhlHs1uvE5mXdHRFsR+JgLcAtBn7sH5fVeOGm2XDHBPzf0SI/UE6YgNF0Il4K w8Dph9JH6oL3qHA==
X-Mailer: b4 0.14.2
Message-ID: <20251227-driver-types-v1-1-1916154fbe5e@google.com>
Subject: [PATCH] rust: driver: fix broken intra-doc links to example driver types
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The `auxiliary` and `pci` modules are conditional on
`CONFIG_AUXILIARY_BUS` and `CONFIG_PCI` respectively. When these are
disabled, the intra-doc links to `auxiliary::Driver` and `pci::Driver`
break, causing rustdoc warnings (or errors with `-D warnings`).

error: unresolved link to `kernel::auxiliary::Driver`
  --> rust/kernel/driver.rs:82:28
   |
82 | //! [`auxiliary::Driver`]: kernel::auxiliary::Driver
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ no item named `auxiliary` in module `kernel`

Fix this by making the documentation for these examples conditional on
the corresponding configuration options.

Fixes: 970a7c68788e ("driver: rust: expand documentation for driver infrastructure")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/driver.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 9beae2e3d57e72d5155419bc16f58896a3fc38d7..649d06468f411ddf80fac5f3be22d9f83fd404df 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -33,7 +33,14 @@
 //! }
 //! ```
 //!
-//! For specific examples see [`auxiliary::Driver`], [`pci::Driver`] and [`platform::Driver`].
+//! For specific examples see:
+//!
+//! * [`platform::Driver`](kernel::platform::Driver)
+#![cfg_attr(
+    CONFIG_AUXILIARY_BUS,
+    doc = "* [`auxiliary::Driver`](kernel::auxiliary::Driver)"
+)]
+#![cfg_attr(CONFIG_PCI, doc = "* [`pci::Driver`](kernel::pci::Driver)")]
 //!
 //! The `probe()` callback should return a `impl PinInit<Self, Error>`, i.e. the driver's private
 //! data. The bus abstraction should store the pointer in the corresponding bus device. The generic
@@ -79,7 +86,6 @@
 //!
 //! For this purpose the generic infrastructure in [`device_id`] should be used.
 //!
-//! [`auxiliary::Driver`]: kernel::auxiliary::Driver
 //! [`Core`]: device::Core
 //! [`Device`]: device::Device
 //! [`Device<Core>`]: device::Device<device::Core>
@@ -87,8 +93,6 @@
 //! [`DeviceContext`]: device::DeviceContext
 //! [`device_id`]: kernel::device_id
 //! [`module_driver`]: kernel::module_driver
-//! [`pci::Driver`]: kernel::pci::Driver
-//! [`platform::Driver`]: kernel::platform::Driver
 
 use crate::error::{Error, Result};
 use crate::{acpi, device, of, str::CStr, try_pin_init, types::Opaque, ThisModule};

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251227-driver-types-5a42cb829b71

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

