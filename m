Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F2C26296;
	Tue, 18 Aug 2026 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089845; cv=none; b=XyKodsAhp7vvqDLKhjvMw8Jmj0z+6cQfu5UOoVTOOdgy6kgIdzA0WKgw2d1kEH+Jp7B9aXZPWOlmv+Tpw54WW2g5POUP5AOxs0LQyRlEk10dsecjHPIC41dh7LqA9lKNSa8CsZO46/lc3hJMvTZFrZvkiV6x8r6ubnGxYlMu44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089845; c=relaxed/simple;
	bh=BOfIbt7VCfuHhrWRVqLOZ3sRsvjFSCZIALpoCn+FbVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N20DCR7AA+lQstT+7s/FnUg91OoKKYW2tbi/MXq2NHXN3Ry9JaMVj/cEYu98dJ8EPIAndijIbGvLjEdxmBwUE+Mos1Oak0lJq0+5L92PW5X24z4jd8CWBNHtGTFAwgr1isPpIzE07wUbthT+MVG3Pp+YzZjIQ1eA71jJ1rtDKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvL2agjo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvL2agjo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 614ECC2BCB3;
	Tue, 18 Aug 2026 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787089845;
	bh=BOfIbt7VCfuHhrWRVqLOZ3sRsvjFSCZIALpoCn+FbVQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QvL2agjoqFQPmYPw6Ram2OQlDpzGvZATXUPa8G4j4VM78G0eeews0HpvYzs50NxfQ
	 0v3cKEHSq3lrRbsgSJY9XYbjuUisYmQmk7fI56W7vwFWvUbzWb9kOkydVv+L/uLoEv
	 xhcnECvoxnkoDy39XAxJ5+nTWx2uJtT/rK/Wku4v1CxLOpKMdu7Xw45j/z75iOdYih
	 eQGA07wB2CwG2HgCVZWXUSn32QHo3KzuEAU1pbaJy8NGMBi3dVrhSJWezM+NOey+4t
	 wQQqqd5/vix2AmKZbi5TDfxe9eR6YxwUKxfrh33fMjtqC5NUDhPIcso4G/gS9oGGMU
	 ZQihd9EtsKRBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A863C5DF86;
	Tue, 18 Aug 2026 21:50:45 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 18 Aug 2026 23:50:33 +0200
Subject: [PATCH v3] rust: configfs: fix object initialization cleanup
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-fix-rust-configfs-registration-state-v1-v3-1-28b5cbfe0a72@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OwWrEMAxEf2XxuWodG5K4p/2P0oPjyIl6sIvkh
 F2W/HvtlEKPpaDLiJk381CCTCjq9fJQjDsJ5VSFfbqosPq0INBctTLa9HrsBoh0A96kQMgp0hI
 FGBeSwr7UKEjxBWHvIHprYwi96werKu2TsUbPprf3by3b9IGhNHxzTF4QJvYprO2VmRZKL2dXw
 ltplrUWZb6fa/euoX6GjX8eVq+D4IxzTk9hxHi95y2hPFNWbdhu/sk1let8wHm2etBx+M09juM
 LsQiOzGsBAAA=
X-Change-ID: 20260817-fix-rust-configfs-registration-state-v1-fa33fcc69673
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787089844; l=5746;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=5QJkFcGkA+N5L45CLyT0WQfSarA1PWSqeUxnL6ZOWqY=;
 b=qaNLbzbo7A5Rr44+LXvoUG+iKMvpvzHIMBunJfZy9FARZ3TNQ6/gG5oU6El6hy4M1oRUf9xln
 KusGrQCF3llDazytq5sYPZ2AgOiyDjoZ2yN0XKBrJWxk6HBU0XwthJL
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

Subsystem::new() calls configfs_register_subsystem() at the end of its
pin initializer. If registration returns an error, release the config
item's initial reference and destroy the initialized mutex before
returning. Otherwise, long subsystem names allocated by
config_item_set_name() leak.

The initial reference also remains after a successful subsystem is
unregistered. Release it from PinnedDrop before the Rust container is
destroyed.

Initialize driver data before the C configfs object in Subsystem::new()
and Group::new(). Then failure while initializing driver data cannot
leave an initialized config group, and its allocated name, behind.

Keeping registration inside try_pin_init! also means PinnedDrop is
installed only after registration succeeds. A duplicate name therefore
returns -EEXIST without attempting to unregister a subsystem whose
ci_dentry was never set.

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
Changes in v3:
- Initialize driver data before configfs groups.
- Release the initial group reference after registration failure and unregister.
- Link to v2: https://patch.msgid.link/20260818-fix-rust-configfs-registration-state-v1-v2-1-9acedd3070f7@younes.io

Changes in v2:
- Register the subsystem at the end of try_pin_init!.
- Destroy su_mutex when registration fails.
- Remove the registered flag.
- Link to v1: https://patch.msgid.link/20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io

To: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Tamir Duberstein <tamird@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
To: Onur Özkan <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/kernel/configfs.rs | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..d28ac9a648f1 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -150,6 +150,7 @@ pub fn new(
         data: impl PinInit<Data, Error>,
     ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
+            data <- data,
             subsystem <- pin_init::init_zeroed().chain(
                 |place: &mut Opaque<bindings::configfs_subsystem>| {
                     // SAFETY: We initialized the required fields of `place.group` above.
@@ -172,13 +173,23 @@ pub fn new(
                     Ok(())
                 }
             ),
-            data <- data,
-        })
-        .pin_chain(|this| {
-            crate::error::to_result(
-                // SAFETY: We initialized `this.subsystem` according to C API contract above.
-                unsafe { bindings::configfs_register_subsystem(this.subsystem.get()) },
-            )
+            _: {
+                let result = crate::error::to_result(
+                    // SAFETY: We initialized `subsystem` according to the C API contract above.
+                    unsafe { bindings::configfs_register_subsystem(subsystem.get()) },
+                );
+                if result.is_err() {
+                    // SAFETY: The group and mutex were initialized above, and registration
+                    // failed, so configfs does not hold references to the group.
+                    unsafe {
+                        bindings::config_item_put(
+                            &raw mut (*subsystem.get()).su_group.cg_item,
+                        );
+                        bindings::mutex_destroy(&raw mut (*subsystem.get()).su_mutex);
+                    }
+                }
+                result?
+            }
         })
     }
 }
@@ -188,8 +199,12 @@ impl<Data> PinnedDrop for Subsystem<Data> {
     fn drop(self: Pin<&mut Self>) {
         // SAFETY: We registered `self.subsystem` in the initializer returned by `Self::new`.
         unsafe { bindings::configfs_unregister_subsystem(self.subsystem.get()) };
-        // SAFETY: We initialized the mutex in `Subsystem::new`.
-        unsafe { bindings::mutex_destroy(&raw mut (*self.subsystem.get()).su_mutex) };
+        // SAFETY: Unregistering drops configfs's references to the group, so it is safe to drop
+        // the initial group reference and destroy the initialized mutex.
+        unsafe {
+            bindings::config_item_put(&raw mut (*self.subsystem.get()).su_group.cg_item);
+            bindings::mutex_destroy(&raw mut (*self.subsystem.get()).su_mutex);
+        }
     }
 }
 
@@ -260,6 +275,7 @@ pub fn new(
         data: impl PinInit<Data, Error>,
     ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
+            data <- data,
             group <- pin_init::init_zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
                 let place = v.get();
                 let name = name.to_bytes_with_nul().as_ptr();
@@ -269,7 +285,6 @@ pub fn new(
                 };
                 Ok(())
             }),
-            data <- data,
         })
     }
 }

---
base-commit: 47f27155f17498fccb1f222f79089642337498a9
change-id: 20260817-fix-rust-configfs-registration-state-v1-fa33fcc69673

Best regards,
--  
Younes Akhouayri <git@younes.io>


