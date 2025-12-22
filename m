Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E969C41C62;
	Mon, 22 Dec 2025 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405687; cv=none; b=p0q+TpXZSGfdY0ljMb0zZ6bq82Ex64XZRT3tToZi/WnQKWSE6B6/CnGkn+7BqhDjPB9sGKSV73CHJqmy1iB66ro+4HM1nyKJtye/zqfBegmC+5p1l8HFuR2y3CS01oiWSeEfIDBKG8we4wuGQAgzcRD+f3j7iA0Jllfkvd0CHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405687; c=relaxed/simple;
	bh=RZeHMaQWuBnm0I0bJRfnTc6BV3QILxnT50pOKZUxQh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3ly3svSKDtdIZQnRUnW7XUj6nLnD1bRdLP0o1vEH3bI/q7KCKMGTGyx9Y22jetpydGkulEkX5V8blFgi7TWUu+TsvMm62Vd4K3zbfPuAWK4RqOJsgygUsm+t5G7r09DMmxWAkTYFt8ZzSwRAod7f2k8ufybdUSC5wRjVfv2iYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQK6s1Sz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQK6s1Sz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89D1C113D0;
	Mon, 22 Dec 2025 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766405686;
	bh=RZeHMaQWuBnm0I0bJRfnTc6BV3QILxnT50pOKZUxQh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TQK6s1Szhrs4uI4pSnhM7U8mPIm1GkhN/IfjFHo20HqrK157L3QgC7yGUCye1gw9o
	 fyfcqA9FL2bFkI0l4IKLC9OQM0rexr+9whsPh5GqIh09daMUlJ7pC4Orzb+FkBguBM
	 uNrLqDHi3H/i/OfXOCu4gUEK6a8JkYhEI5blVghnKaqTQo2a9vVjarE7qzmZmYEQ4R
	 zCjSGQ5qdiQG5pC8ll2i4TbeCg7nlL5YRYpWH8ZpobelqAWirzQiqLxsM7IxXre9jM
	 UQydGNpPhfXFodJC395DLg7MAPO2bmYO9Gj/+Ifxf04lHg4v/ERHNYBA+suQnM49/Q
	 kwfWjlPVLz3qQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:14:32 +0100
Subject: [PATCH 1/2] rust: i2c: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-i2c-v1-1-df1c258d4615@gmail.com>
References: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
In-Reply-To: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766405679; l=1531;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=HPJmWKMG9wdsh/oNvEgt8OonxR2OdRnCsLVZPkcVDOc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH8iJYIIdZ0yAoTgD8cbYTqvL1wO1X3v36u5NeQdOcFlCzCe25vk2/NOGTpKkIBsC2TxqBkXKAa
 U1lq7yF+Grw4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/i2c.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 491e6cc25cf4..792a71b15463 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -253,7 +253,7 @@ macro_rules! module_i2c_driver {
 /// # Example
 ///
 ///```
-/// # use kernel::{acpi, bindings, c_str, device::Core, i2c, of};
+/// # use kernel::{acpi, bindings, device::Core, i2c, of};
 ///
 /// struct MyDriver;
 ///
@@ -262,7 +262,7 @@ macro_rules! module_i2c_driver {
 ///     MODULE_ACPI_TABLE,
 ///     <MyDriver as i2c::Driver>::IdInfo,
 ///     [
-///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
+///         (acpi::DeviceId::new(c"LNUXBEEF"), ())
 ///     ]
 /// );
 ///
@@ -271,7 +271,7 @@ macro_rules! module_i2c_driver {
 ///     MODULE_I2C_TABLE,
 ///     <MyDriver as i2c::Driver>::IdInfo,
 ///     [
-///          (i2c::DeviceId::new(c_str!("rust_driver_i2c")), ())
+///          (i2c::DeviceId::new(c"rust_driver_i2c"), ())
 ///     ]
 /// );
 ///
@@ -280,7 +280,7 @@ macro_rules! module_i2c_driver {
 ///     MODULE_OF_TABLE,
 ///     <MyDriver as i2c::Driver>::IdInfo,
 ///     [
-///         (of::DeviceId::new(c_str!("test,device")), ())
+///         (of::DeviceId::new(c"test,device"), ())
 ///     ]
 /// );
 ///

-- 
2.52.0

