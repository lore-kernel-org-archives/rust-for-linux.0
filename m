Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86C72673AA;
	Tue, 23 Dec 2025 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475631; cv=none; b=jhVtmM699oriQh6wVkGbUlbM2V8TaPNv/siFmP9/wsBzSSF+UaUrNCBL3dw2kGmyNKl04/zI/pZcjX2t9w0Fpr7LZPtZyvZXNAcOAYNzIXkHcyH6iZYfnInoqnDIM0t7fEeWIExT7uI8YftCbuJ6hAj/0RqjcC9MaJcIqDR6AgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475631; c=relaxed/simple;
	bh=UW5HbN6yO9LJ8iDgB5Ii6rK/IdZgfGxp+ApRXp4BcsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X3qsIkLmJ0LWClZi2ZFZFBxr0BjvsTonc7cL0qSq8nILQjToagnibg8rirkcfsEO5ZJ35Ys/EINP36sTLO/SCHebpMjU3b5gA9XGyJI+0jnR/HhXCgaBYahd6TM7IRFi/wYQl8kOlfvYODR57ElJguG8H568By5BXoDKsweiyHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnHOrvHa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnHOrvHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A8DC113D0;
	Tue, 23 Dec 2025 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766475630;
	bh=UW5HbN6yO9LJ8iDgB5Ii6rK/IdZgfGxp+ApRXp4BcsY=;
	h=From:Date:Subject:To:Cc:From;
	b=PnHOrvHaMRmydJTu9kOe1eSHmWAm78u/qsFn5zJQ2JYse/laheId7WqMgjHkfYU0j
	 6hQLNDWCm3oPK6+VAK6sm/fg5LH+svVck6+2ezcwQHc0vTJUA5gOWoPgOmPfkE0t1d
	 x6fIM6BxNkdzgEanyfSSOuZNsSP+PxVZoPhqCRWdku2nMQGM2PLu8thzRC7BMzpZPp
	 nZCg6hO1m9CYMREiIlPdrzgSXo7nMwhIW0hDUBcMXEOIIX4QNqNqY4U5XYz2i/eeVR
	 00ys19k3zs9o/sA18Nc4AajO+ZB3Hgl3sRIAcfPNR+qcYap4zXtRPkKNVgjqNoDHxL
	 hu3a8lKx4bDlg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 23 Dec 2025 08:40:24 +0100
Subject: [PATCH] samples: rust: faux: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-cstr-faux-v1-1-ee0c5cf1be4b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXR0hBXEYtqB2OBdFQkjbsrl
 i/5+REYPSFDm0XweBLTtibIPAM7m3VCQS4ZVKG0VKoUlg8vRhMuUVe2cA6bSqOB1O8eR7q+V9f
 /5jAsaI93APf9AGOZsPBtAAAA
X-Change-ID: 20251223-cstr-faux-74c0dde845ea
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766475626; l=1446;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=0ocY9fdOlJR/F1j3Vttdyt12otrQLMDZ30YuvaZc5F0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM+HBC7Fa18tBeNYIl+spL+HSI2i9k9BHJNmUE+Kt/tyvqk4xs3W5nAX+h5qLEQBbAdQjw1tpJT
 COxteevdGwwQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_faux.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
index ecc9fd378cbd..23add3160693 100644
--- a/samples/rust/rust_driver_faux.rs
+++ b/samples/rust/rust_driver_faux.rs
@@ -2,7 +2,7 @@
 
 //! Rust faux device sample.
 
-use kernel::{c_str, faux, prelude::*, Module};
+use kernel::{faux, prelude::*, Module};
 
 module! {
     type: SampleModule,
@@ -20,7 +20,7 @@ impl Module for SampleModule {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Initialising Rust Faux Device Sample\n");
 
-        let reg = faux::Registration::new(c_str!("rust-faux-sample-device"), None)?;
+        let reg = faux::Registration::new(c"rust-faux-sample-device", None)?;
 
         dev_info!(reg.as_ref(), "Hello from faux device!\n");
 

---
base-commit: 185c81461ff4987d35fdfc4c8da46ae51ee5ada4
change-id: 20251223-cstr-faux-74c0dde845ea

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

