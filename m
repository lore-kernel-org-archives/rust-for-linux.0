Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7101DA0E1;
	Mon, 22 Dec 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405766; cv=none; b=hmFcGNHfkG2jqzUKX39jtQ6ksIkyXUJp6OGeak6IAlCIJEHv6KRlBtUtA7/T9osHGY+y7FOUhRMcUQhdtftdm6IJ/mQdjtRRT38KU5sKv8uehfJR5CgDGzkJsx7QvI/FHl4sn5skmfX7S4dyEaU1pikWkDR/7POsvanmM+SO2/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405766; c=relaxed/simple;
	bh=t4Oz61Dgm/2dimK/o7t3SrWwHLV7m4JgNnd/fBrRbVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lMtcIpf+NFwerNsm7otv/V2v2127/vfCw346p1dkEpLsPYoDaYWuRzVbHjpb/+DFFOgzai8DmC0bkj3uYjesgpYnMlwLKUmEufKXhrqGDXoeczN7ZPnJ+frR3qlBkdyCTylrmYs1wPHK8Fy8XvHjsfoZUVbLkQ+TQpGzDu2jw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCDQOd4E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCDQOd4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04536C4CEF1;
	Mon, 22 Dec 2025 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766405765;
	bh=t4Oz61Dgm/2dimK/o7t3SrWwHLV7m4JgNnd/fBrRbVU=;
	h=From:Date:Subject:To:Cc:From;
	b=oCDQOd4Eiq3LfGei+WnztrcMSVrFiVVHFVWm9v9fjDM6NvAOMYw59TdZcANSMrBmA
	 7kI/2P3y8CybntG5TAcieo3eGe7F5jbSlc6ZiIAy4JR8k4k1gTV1yAr1v+6SfhyqZU
	 cCKZ1aOHrDZMLLdaLmqKYRX9J3KwL6f+JPIfFS6K8tNTVLevJR9YPzJt0RqVXMFS0n
	 /7avVxWJ8Mq0wlr3eYioNsHGWzL+Ddc5x7ouqhE1H8aXMWkOzCfMI9Joqt69wr5hsO
	 YxrFrBnoZsAc83AtNfuweO5dJH5fvgm2hikCkbsx0589qVbKEVWwULjyr7QbbNKxKA
	 VV7WOPg0b3Zjg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:15:58 +0100
Subject: [PATCH] rust: regulator: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-regulator-v1-1-430e3d517025@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g7UjBbpVYoLzWRsimhJxlIQ7
 +5Ul2/x/wbGKmzwKDZQ/orJMmdUZQH06ueRnYRswBs2FSI6sqROeVynPi3qAvl4Dz6Sb2vI0Uc
 5yu8cPrvLtg5vpvS/wL4f10fogXIAAAA=
X-Change-ID: 20251222-cstr-regulator-dc3f6d3fc384
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766405762; l=2700;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Af1jpseohVS80o2ky3DpbBz0nWx26cBTWBlvjXzQZog=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOEjmjKCa1rypjHtb8W+UqTDL87D3U+f+HuZnxR3TS5Ie+6pxP7itPPPkENjkJOd1VYwUJWsNOR
 dtFv0jWUByAM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/regulator.rs | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index 2c44827ad0b7..4f7837c7e53a 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -122,12 +122,11 @@ pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
 ///
 /// ```
 /// # use kernel::prelude::*;
-/// # use kernel::c_str;
 /// # use kernel::device::Device;
 /// # use kernel::regulator::{Voltage, Regulator, Disabled, Enabled};
 /// fn enable(dev: &Device, min_voltage: Voltage, max_voltage: Voltage) -> Result {
 ///     // Obtain a reference to a (fictitious) regulator.
-///     let regulator: Regulator<Disabled> = Regulator::<Disabled>::get(dev, c_str!("vcc"))?;
+///     let regulator: Regulator<Disabled> = Regulator::<Disabled>::get(dev, c"vcc")?;
 ///
 ///     // The voltage can be set before enabling the regulator if needed, e.g.:
 ///     regulator.set_voltage(min_voltage, max_voltage)?;
@@ -166,12 +165,11 @@ pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
 ///
 /// ```
 /// # use kernel::prelude::*;
-/// # use kernel::c_str;
 /// # use kernel::device::Device;
 /// # use kernel::regulator::{Voltage, Regulator, Enabled};
 /// fn enable(dev: &Device) -> Result {
 ///     // Obtain a reference to a (fictitious) regulator and enable it.
-///     let regulator: Regulator<Enabled> = Regulator::<Enabled>::get(dev, c_str!("vcc"))?;
+///     let regulator: Regulator<Enabled> = Regulator::<Enabled>::get(dev, c"vcc")?;
 ///
 ///     // Dropping an enabled regulator will disable it. The refcount will be
 ///     // decremented.
@@ -193,13 +191,12 @@ pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
 ///
 /// ```
 /// # use kernel::prelude::*;
-/// # use kernel::c_str;
 /// # use kernel::device::{Bound, Device};
 /// # use kernel::regulator;
 /// fn enable(dev: &Device<Bound>) -> Result {
 ///     // Obtain a reference to a (fictitious) regulator and enable it. This
 ///     // call only returns whether the operation succeeded.
-///     regulator::devm_enable(dev, c_str!("vcc"))?;
+///     regulator::devm_enable(dev, c"vcc")?;
 ///
 ///     // The regulator will be disabled and put when `dev` is unbound.
 ///     Ok(())

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-regulator-dc3f6d3fc384

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

