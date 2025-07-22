Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55A2882BB
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187636; cv=none; b=doOHYR/GjTEhgKdnBA+pqVZ8arvFrjfAKvff3x6i7RdincwX2VMFZeUfC/GYVXEsA8bJepjAHun/qCUL0ocDOykxq1ZlOXYjqCrcgunmgdS2LX6VnGpxIarFf2imp5vxhFkym7CXyI1B2bNKlqVZz0trjV6fZ4/Ib5i3oRzPLPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187636; c=relaxed/simple;
	bh=C9gKVmSrwbpNQgbhebrjRyRWYFKEemLWvH8Id0ZWV6U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eP1ufNWEgxUfoxmS2mGtsPMCcYw6n7TPInedAdt7ZefOEqSvWCpy8DoG8o9wIGA8kqCxNx3ZllGtCJS/NWYqY9h1csrq5o1r5vxCJhgB9B3kBmpN4sMSiRQYwvRiXlhPO8aHOfIKshRMvuqNdoDszRnCo8HaAVaNgF3s8y7KvJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bpzKjW7+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bpzKjW7+"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a579058758so2160397f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753187633; x=1753792433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jV2mP/8/x5O/YT0L0hZguIqmWOyTTn11rSQLXu2Qjo4=;
        b=bpzKjW7+KP7j8l6REsUmn1SxTN4E9E2e/1Ppjb/8R+DB+m2ku/h/S84KWtY8AIDryQ
         FmuDiBrIabKPAi09M1kEU1YZCbDRhA+ZzcTvpTaniwQ9gE3KEj/NmuMvw1k/1Cml4FhJ
         TifkQxGOpDs4aY3E3WryrUsVwzZsEDZjkkp2RzVLLKurHuFji6zQO2X/mVGhDPZpYLk+
         6YsFfrfdBgnx+M7yaUUQHupM06L6w+8bl0hdhSyajhO98FjXxWe1PTC4DcAkLZq336p6
         +YFzxrjMdICeD9w2z2Iw0G70XkilRpDHzanoXFYhQ8zmIl4qpqV7952NQv3Egy499LHx
         GngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187633; x=1753792433;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jV2mP/8/x5O/YT0L0hZguIqmWOyTTn11rSQLXu2Qjo4=;
        b=mfizhp8AKF2PPwnjiFznSv7oGg03jM0/nmfZ3sVtxgpaiBF1JVig+h5shQ0aQOpVWI
         dwmkgC5/r8+fQvZAL/7QqeOcvkF8nak5oPSrZWibnydPRmyfreRNuU1k6jiXqvjIHU+g
         fpSfUjfifaxoyalwGClPRpZvmnj/rC3Ljc/kzXYH7Pu/S72ztWQJK2bcopfvp3Uq82aE
         aA9iwx6Ekm55Yr399FlhhbAEZj7aPHl9ADveBG0nmU7vlFMxNnte7Ev4DBqDbYTwICwS
         go5L0p68D+JG9EKrrgrKLrqTXre1jTUc16Cw7G5QxlJ8lRfudAydQR7ekngnYi1qqRe1
         2mcg==
X-Forwarded-Encrypted: i=1; AJvYcCVB1GgHRpu3D/DYyCex7kqqtKkwXFV+mU587lUk6eMyD2mRzsaHOVnoE8chbtSAjCP1rtUWwtvF32DT/mZhGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSWrTJohY2PhPe9f9XoHa+NXAMe4LvzznO3dAHTbxPymqhM/a/
	m/ulkwhm+jbMOUJnqRHILL3Nrwvb6Vjs24AZgavT/Mpci5Emm5J9Qkf03FfnpY6H3hBgErlsCHt
	zyOFMR7kG7Xz05JB7bw==
X-Google-Smtp-Source: AGHT+IET7l93/cjKvj1gTGg72sexUir9vNPbYFq2LL19EP0drB7XGgPi/HjMKBAksg70BtuRlwgc2oIEITKIJNQ=
X-Received: from wmbjg15.prod.google.com ([2002:a05:600c:a00f:b0:456:2080:97c0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c11:0:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3b60e4d025emr18097495f8f.19.1753187633374;
 Tue, 22 Jul 2025 05:33:53 -0700 (PDT)
Date: Tue, 22 Jul 2025 12:33:08 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAWFf2gC/22Pyw6CMBBFf4V0bbUtVR4r/8O4qGXASYBqWxoM4
 d8tsFATl3dmzsmdiTiwCI6UyUQsBHRo+hjSXUL0XfUNUKxiJoKJI0s5p2gCRQ+W6iKXChTLKp6
 TeP6wUOO4qi7XmO/ovLGv1Rz4Mv0jCZwyWp90wVMJKhfy3BjTtLDXpiOLJYgPmTH5RYpIwqlQK tO8lgx+yHkrZOE5xJf81orclAMa9x36MrF1e7CD87SH0UdifgOfr1WKDAEAAA==
X-Change-Id: 20250311-iov-iter-c984aea07d18
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=C9gKVmSrwbpNQgbhebrjRyRWYFKEemLWvH8Id0ZWV6U=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBof4UhqjjYp9fgUuympu9i6jQhW5+moUpxVGH7N
 iHTAlf+Lh+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaH+FIQAKCRAEWL7uWMY5
 Ru5ZD/4liR2/N/ubji2/PRknIFuSW7sLdtfwLa2RhDo/WJ9v/j5w+pG+0J+7xFA8ITHgRBjYkzr
 hIu/0nYFaNBoiR1rz0FivQDLXgKneI0REmk0qz7ptvluX78wWO7R9f3cBbsXccTv2SRZbJrHPSh
 X6J4ajrcuEbNOzF+0Ac7v75mPgtyA+NaN1OLxsra5jFofeiaNi7WgSgSmLcRRYidIwz3bUpA5Uy
 lwMa9QUC2uOVvEAtAAsZkZ+K/0EMlObwGOUeLR6NPALH0N6PP91PS1OimTmj0eLuihNRLemyYa+
 4qQt380n71QUwWZsGUK5e4/DQpplpqNfwBzvQDRmmejDTZKssT0PrG7zDnttbIlQ86Jf0oRY30t
 oREIuJUOSMVfO2OeuE6IQUMM9TZvOUiCqfaSrI3kPZ9GlqTs8QiXO9cG0GWkWZxR4gR8tmJhN/5
 kjeg/v84A3wq56R9eJJ3RPAIGzra+OgxORH1FNaz00yYElxBa5jzJCXAVo43mbSo32XQxR2OjJj
 gDOKf4RPB+soiopyY2KbXeDkG/sxVt16eaiHZ6VLEZgfMf6GpiKC37VPALXSV3vGp8VtP1wUIQN
 mUCbMX8IAYoMwJK5P8USzhv88vFPHJinQ5qsB/thWk78RO40Iks48TtMc8+Z9Hp8EOXvKZMbeBu w9zE6LojAhOvLPg==
X-Mailer: b4 0.14.2
Message-ID: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
Subject: [PATCH v3 0/4] Rust support for `struct iov_iter`
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

This series adds support for the `struct iov_iter` type. This type
represents an IO buffer for reading or writing, and can be configured
for either direction of communication.

In Rust, we define separate types for reading and writing. This will
ensure that you cannot mix them up and e.g. call copy_from_iter in a
read_iter syscall.

To use the new abstractions, miscdevices are given new methods read_iter
and write_iter that can be used to implement the read/write syscalls on
a miscdevice. The miscdevice sample is updated to provide read/write
operations.

Based on rust-next for this dependency:
https://lore.kernel.org/all/20250612-pointed-to-v3-0-b009006d86a1@kernel.org/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Rebase on rust-next.
- Use ptr::from_mut to silence warning.
- Move Kiocb to rust::fs.
- Rename Kiocb::device() to Kiocb::file() as it's no longer miscdevice
  specific.
- Significant rewording of docs and safety comments, especially patch 1
  and 2.
- Link to v2: https://lore.kernel.org/r/20250704-iov-iter-v2-0-e69aa7c1f40e@google.com

Changes in v2:
- Remove Send/Sync/Copy impls.
- Reword docs significantly.
- Rename Kiocb::private_data() to Kiocb::device().
- Rebase on v6.16-rc2.
- Link to v1: https://lore.kernel.org/r/20250311-iov-iter-v1-0-f6c9134ea824@google.com

---
Alice Ryhl (3):
      rust: iov: add iov_iter abstractions for ITER_SOURCE
      rust: iov: add iov_iter abstractions for ITER_DEST
      rust: miscdevice: Provide additional abstractions for iov_iter and kiocb structures

Lee Jones (1):
      samples: rust_misc_device: Expand the sample to support read()ing from userspace

 rust/kernel/fs.rs                |   3 +
 rust/kernel/fs/kiocb.rs          |  67 +++++++++
 rust/kernel/iov.rs               | 310 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   1 +
 rust/kernel/miscdevice.rs        |  63 +++++++-
 samples/rust/rust_misc_device.rs |  36 ++++-
 6 files changed, 477 insertions(+), 3 deletions(-)
---
base-commit: 07dad44aa9a93b16af19e8609a10b241c352b440
change-id: 20250311-iov-iter-c984aea07d18

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

