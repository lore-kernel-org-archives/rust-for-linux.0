Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF1299952;
	Mon, 22 Dec 2025 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406935; cv=none; b=ZixuELcvtWOpxjb4A8SJ4FlROEwmPby4gw8lIxhbVne66ULmeY0zuxnsZdiarxu3ZUK4e8jaa20Xv7gh9TD0wRsYQkWgGS2o269SvkN+5m/BPUIe+tmORHoDBzmJqXwpX4DCMS6AAF+WW7ssanMYec8pJ2HH9gpqmvlXPpt3Bi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406935; c=relaxed/simple;
	bh=PFg7CDPmD7eb4pfOkU3lUuqgep/h+jFBdQBcHkuSNtM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rtk0K8XOKafFFt2QtJmybNoAHQdlXdcpOhIGq8Gc1iu99NYkuy48wzic1fWAzMw6gZ1M6Jx8DYfvTgBp0pT+/ntY3KiEDUEREeNIdQvjVP7hmGi5yoGLi/B9QU4lcKhcYpUTKiF2yXFlB85crCRAegvIWnQfApuzoJUkDHS+dRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhHSgcr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhHSgcr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAF2C4CEF1;
	Mon, 22 Dec 2025 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406935;
	bh=PFg7CDPmD7eb4pfOkU3lUuqgep/h+jFBdQBcHkuSNtM=;
	h=From:Subject:Date:To:Cc:From;
	b=GhHSgcr1uZd1H400PNVo01E6/J5njE+oDFxQZjPSo08Wocxz6uyU1w+vADF9466h9
	 /XtR0KjRKqFhDeYYY213SZgE2sWPl85fVqNj8xEgnYaUC9upyZG/mVgNC2UJXQQD30
	 z4OfNXOPHWalH3KvTehPuNrKZbO0AfZE5uyxscwopiU8X3PBsSdLQVI9SIyshj0COG
	 8ao61SQRB1XhM/JrK//rRkGypRMJ9+PtoHNjwJzYdrofgol7o9EEkhJ2Q4WEjsZ/P9
	 TtwDkoXF0p9UthbAqe8zuU7qXQkTSeufrug4SIdWOKAuzO+XtAlNKQ3hHg0lOD/rbg
	 kmrByaZS9S27g==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH 0/7] driver-core: rust: replace `kernel::c_str!` with
 C-Strings
Date: Mon, 22 Dec 2025 13:35:26 +0100
Message-Id: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EQAyA4VeRnrcJZUS8iuxhjQ51QForEvHuB
 sfv8P8HGKuwQZ0coLyJyTxFZJ8E/PCbekbpooFSchkRobdVsVPZWNHPyli1oSxdkQeXE8RsUQ6
 yP8vm+9r+7ch+vT9wnhfw8LuBdAAAAA==
X-Change-ID: 20251222-cstr-driver-core-8bf66543f532
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406930; l=1500;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=PFg7CDPmD7eb4pfOkU3lUuqgep/h+jFBdQBcHkuSNtM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBXz7hSRkSklMDHaXp6rj09psjTfoFbWf257IJZcROJKJYYLYuaDc5ck2zjSCwUh8dVxLHwsEyt
 spVeB7URYiww=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (7):
      rust: auxiliary: replace `kernel::c_str!` with C-Strings
      rust: device: replace `kernel::c_str!` with C-Strings
      rust: platform: replace `kernel::c_str!` with C-Strings
      rust: io: replace `kernel::c_str!` with C-Strings
      rust: irq: replace `kernel::c_str!` with C-Strings
      rust: debugfs: replace `kernel::c_str!` with C-Strings
      samples: rust: debugfs: replace `kernel::c_str!` with C-Strings

 rust/kernel/debugfs.rs                | 23 +++++++++--------------
 rust/kernel/device.rs                 |  4 +---
 rust/kernel/device/property.rs        |  6 +++---
 rust/kernel/io/mem.rs                 |  7 +++----
 rust/kernel/irq/request.rs            |  6 ++----
 rust/kernel/platform.rs               |  6 +++---
 samples/rust/rust_debugfs.rs          | 17 ++++++++---------
 samples/rust/rust_debugfs_scoped.rs   | 20 ++++++++------------
 samples/rust/rust_driver_auxiliary.rs |  4 ++--
 samples/rust/rust_driver_faux.rs      |  4 ++--
 samples/rust/rust_driver_platform.rs  | 30 ++++++++++++++----------------
 11 files changed, 55 insertions(+), 72 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-driver-core-8bf66543f532

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

