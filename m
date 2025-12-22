Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D6299A8F;
	Mon, 22 Dec 2025 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406952; cv=none; b=TVe8A60e+8/NoWWDlXNheCGiSraetzLk/tfpqdwOx0A3woDS5UusqtsUsqzG3O88J7SEmN15kN5hQLAO5RvCQMhZiHLxeXBJlbSlxZjaZAdmhfzg2NyjjRqDx80ihIf2xyPf1DLp/bG91lEW9ri2+FmGYvdFdrEBTBbM950Qy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406952; c=relaxed/simple;
	bh=MFh6mggRYW3+kj5WDpGpaaaM7+3cG6rn3t7+x13dnTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIM2lfHWBvaZ7lbN7gTwM35JO1YrKmTrAdR8sBS61BXSmQt23NXWAibenzRqrhStD7TPwhLyfWrU+m/ucHizG9FjWHtXmRqT+fAV2tcK2ihcWoWyoLXW0Ux5HP8T4Tg5tLfpr+NCoJms78BlVSnR3/V37hsHtf6oUMGIwj3CxYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/y4zDMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/y4zDMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5841AC4CEF1;
	Mon, 22 Dec 2025 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406952;
	bh=MFh6mggRYW3+kj5WDpGpaaaM7+3cG6rn3t7+x13dnTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m/y4zDMMjepLhYLxi+xqbjp+eatZ7aUlVuKQEB7Hx4S9k0R3VQbxJabpVMNR5mgaC
	 qsyOqXC1VAdbBlSYVTw+IQrtDymPP39FGVnHX7vuHYQutdIXDKhnRLdaKt0ky8AF6Z
	 rZEhrW0yiPtV1hzG+ClDazc/KSecKfVcjwWivLc5VYZQ7gnuWa8/SGZroNlKPMjNWZ
	 MpiF//tti70MkpqT+mXp0RYzo8PuEFnhBlWyd+Men1HiZYO7tx6NAptxuuTkHbBqmB
	 Lo45kyhepETgYiTLysYGX06HxpScsy05VEu/f+dF2vi2WHO4jdmKQ3PKb4GNvl4CJW
	 arrib+hOuvGEA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:35:30 +0100
Subject: [PATCH 4/7] rust: io: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-driver-core-v1-4-1142a177d0fd@gmail.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406930; l=1697;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=XRqPEc+02APN7oufULgtA4lYVdXfRUqvkbUWAXMp5AE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCW84UhhUAPsc7t+I4FrOEVUp608OXG+5Ez1004s9XKoB730WzzVi5xrzcCWtQ3b70/j3QlIWbs
 lLzpXQpF8WQM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/io/mem.rs | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index b03b82cd531b..3b131f6f7733 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -5,7 +5,6 @@
 use core::ops::Deref;
 
 use crate::{
-    c_str,
     device::{
         Bound,
         Device, //
@@ -52,7 +51,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     /// illustration purposes.
     ///
     /// ```no_run
-    /// use kernel::{bindings, c_str, platform, of, device::Core};
+    /// use kernel::{bindings, platform, of, device::Core};
     /// struct SampleDriver;
     ///
     /// impl platform::Driver for SampleDriver {
@@ -110,7 +109,7 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     /// illustration purposes.
     ///
     /// ```no_run
-    /// use kernel::{bindings, c_str, platform, of, device::Core};
+    /// use kernel::{bindings, platform, of, device::Core};
     /// struct SampleDriver;
     ///
     /// impl platform::Driver for SampleDriver {
@@ -172,7 +171,7 @@ impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
     fn ioremap(resource: &Resource) -> Result<Self> {
         let start = resource.start();
         let size = resource.size();
-        let name = resource.name().unwrap_or(c_str!(""));
+        let name = resource.name().unwrap_or_default();
 
         let region = resource
             .request_region(

-- 
2.52.0

