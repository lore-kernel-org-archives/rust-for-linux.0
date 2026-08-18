Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B128391846;
	Tue, 18 Aug 2026 17:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787075054; cv=none; b=UDIHHcMMETxCSQx3j6DY7+W8b6IwwLWZINQ/0SK98ttVBgtBFTe4eEIHPATTl/xKKcNA4sK2+QipIT1nHgg5zKu0GItrgSGbgGAzWGSU/qds1geeYbEfwLhqB+1k4JjfI0XnegSsFckDMlOFAewdmSOwRSP5IELQMr3vM0qSqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787075054; c=relaxed/simple;
	bh=Eh8xg+iFyJUmLu78iGCSA07pw0Ii2oCpTmh2Aus5aTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gjTPx3jWMyVC25OVjOdW9TF4MrTEvnUmyqtKlXYryYakyp/UoWoGqOAZpuYzXxKx9jbGIFfJizoY6lL1f+sLAWC0SvbRz1IMK7cXNeCgGRm+gId6ty/YPI1XSlqfowNlkG+q2Oef3TjDP7xLI+PBbKzVvDT9uIxABW4upC7joYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N49IBCY5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N49IBCY5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BA75C2BCF4;
	Tue, 18 Aug 2026 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787075053;
	bh=Eh8xg+iFyJUmLu78iGCSA07pw0Ii2oCpTmh2Aus5aTI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=N49IBCY5z1fJ0Q1yF1voPirUBaf69C/za+rfu6YZ+UpB6g2i1QUzoFCssmiOlpFkw
	 AZs9aPUIXoPjKib2by20c2v6td4RXe4XabpM/Yv+JQXym4nog92PLSJp3O+/1dMS3t
	 sp6yNJ+7wfWkXR5LoCKi8IuHAcXBTD8Oa/YPoO7Akh/60iU6vgufOmSIeDCTJkAz7W
	 yBI7/xJBRmlii0745H8DoQbgHaBUr//hEyGWYgHDqL9UN81LYLE/Yw2xdvZ0ZZPVKb
	 d5qEbvlni+abXclZOvvZ6K3DdIF1wytLt/zxyLuCOs+NHKwlajjcsHJG7VwX6rO5Jq
	 GUK4JQKQbGHuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55149C5DF82;
	Tue, 18 Aug 2026 17:44:13 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 18 Aug 2026 19:44:03 +0200
Subject: [PATCH v2] rust: configfs: skip unregister after failed
 registration
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-fix-rust-configfs-registration-state-v1-v2-1-9acedd3070f7@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OvQ7CMAyEXwVlxtAfqTRMvAfqkAanNUOC7LRqh
 fruJEXsSF7Ourvv3kqQCUVdD2/FOJNQ8ElUx4Oyo/EDAj2SVlVRNUVbXsDRAjxJBBu8o8EJMA4
 kkU1MUZBoIsJcgjN17axtdHOpVWp7MaboTrp3Xy1T/0Qbc3129EYQejbejvkVmAby553lcYnZM
 iZQ4HVfO5e56jes/XtYuhKsrrTWRW9bdLc1TB7lREF127Z9AKj1f7wTAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787075052; l=2560;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=XigsFJKQzV5Pl7ZgU85X77cuEEIuQrLc6riQN8BqfPw=;
 b=x5akoYK46SUGtsHm7ObWCU7My6p3+YJmpPwukjrMVRSzJH9fMgD23KXSkJXEsqBfo3IozKeYI
 8FkigleehaFAXGqEFlga9/fGCiZZQNpx2p4cT/+2kbx41WJNCHdZra+
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

Subsystem::new() calls configfs_register_subsystem() in pin_chain(). If
registration returns an error, pin_chain() drops the Subsystem. PinnedDrop
then calls configfs_unregister_subsystem() even though registration failed.

Registering a duplicate name returns -EEXIST before ci_dentry is set.
configfs_unregister_subsystem() dereferences ci_dentry, causing a NULL
pointer dereference and kernel panic.

Move configfs_register_subsystem() to the end of try_pin_init!. If
registration fails, destroy su_mutex and return the error. PinnedDrop is
not called because initialization did not finish. Successful subsystems
are still unregistered by PinnedDrop.

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
Changes in v2:
- Register the subsystem at the end of try_pin_init!.
- Destroy su_mutex when registration fails.
- Remove the registered flag.
- Link to v1: https://patch.msgid.link/20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io
---
 rust/kernel/configfs.rs | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..770e0a022b42 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -173,12 +173,19 @@ pub fn new(
                 }
             ),
             data <- data,
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
+                    // SAFETY: The mutex was initialized above and registration failed.
+                    unsafe {
+                        bindings::mutex_destroy(&raw mut (*subsystem.get()).su_mutex)
+                    };
+                }
+                result?
+            }
         })
     }
 }

---
base-commit: 47f27155f17498fccb1f222f79089642337498a9
change-id: 20260817-fix-rust-configfs-registration-state-v1-fa33fcc69673

Best regards,
--  
Younes Akhouayri <git@younes.io>


