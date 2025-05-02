Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B971D90DF
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215388; cv=none; b=h4HCAAMqo6M1rgnh3VWAwTQDrTEBxvOhkjKXBOscSLRyljQGiYYYPjxGd4toNzq2iuCy4qVBRZhbfNi1y/HAOfyEsZ033DnSExcRDSRZwOrp3AkKT4EvTHxuW3qRZJF9W7WVYg+4qVtJZT1UFc28k+fXenAUjbTUmSTN0UbzVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215388; c=relaxed/simple;
	bh=a8DL26eOTtjtZlYdE3uFqnVxCM+SRHnboVP11zp4b14=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BCdYzh039ACogyCkSf8IbyLWonWnnd/c6heTAi9DL0BPhWtmTgk8aNrcwt/+iOQRtfwczFaSDHGqZMR10Hkia/oZ7o+9F7Sq1OkdcTrminQ/CjLELRTBj2pP96eR2jWzR+wNlBOuh99AOElUpPJ8c9ibkXpn2kdOllEavMr7AaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UAJocoxd; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UAJocoxd"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff68033070so2359693a91.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 12:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746215386; x=1746820186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rEom2B0/+QsY2mJGxKybOcMGisbWwVWvCcvYQUQEk7Y=;
        b=UAJocoxd//9wRHxzm0H6wFWpSdw/E6HXuvfsvjoILT0bVeK75nJ8z//ViX3z+CxZ2H
         xVJArZAxLGCe2Qb7rlj1sYjOM4QiA3NcgqBk8BToATskAQKKlF5tnmpug7468yqi1epS
         8aobY/NLDOc3Oup2ihnDvt+bxK7FTB5dGhI+wHAxHNGi39EEGdni4/DQdF6WbmGpy7f3
         rf4ONMWCntUHgrMNIfHpMTYijK6H/MvZtqpASEsqis5V/929j6/iNnAIKPKpPJc0scOJ
         XyjiwEx2qNSBvZGfYxolIwm/JgxVV5Mti36XULtGd7gJRl8/6y/QpLlElEf0xIhB9mFX
         56Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746215386; x=1746820186;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEom2B0/+QsY2mJGxKybOcMGisbWwVWvCcvYQUQEk7Y=;
        b=A8WKXKCdP3284FN82C3dTsdPxeFgQKxxmdAPMDtes1VyDn8IDMdJDkEHf67do33Jq4
         kuzW+UEj6pLy+8csTCEh/bECZqPiNu0IPML2jhNEYHdPv0GY1fJyXViTXfFUWxAkNoDm
         MQQq5baTABnQZYuNDvSOkQNmUVpvtm7+f1lZ91O0M41z8uSoruFCMLoWD7hfjXjhWsaJ
         Wx0uSo+sajBDRYieBuLdv/9cTx0tq68v5UbkSy7N5k+lpaxfgAUmLgxxCcUlYGXiARB4
         NpSs/ln4SUiEgq832ttstcRw4IkeNccZt2unaAc7+TPsfP7ZsdTQ7186AM2E5OZu5PJv
         f1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWTaBvm1oC0cDTJN1xEKuLSKh+hWECbJRB8C0pbZK4VtBNZoO2Y2H1zcFartzuAAaNGBQTGjbQM+EXiAhqCxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIQ293mZISQAzmCJ2TFryPbXKgRH1HpZXcwzFZuYUVju+nLeG
	oU3MF3A8hKpuNAKiWUdeRYurOEoo/dVmhS1qvxR4lnx1kCK/sdMISZACl6xu064u4yvY/QimrSa
	gA61TcQ==
X-Google-Smtp-Source: AGHT+IEeF/qlZFNSOu5ATAMiJc/pBeHbZTgZzOF9VK+lkoBDTcsmn8w/mlz8S58hWVY5/nQE3XXnNlVvbCmt
X-Received: from pjd15.prod.google.com ([2002:a17:90b:54cf:b0:301:2a0f:b03d])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:58d0:b0:2fe:afa7:eaf8
 with SMTP id 98e67ed59e1d1-30a4e5a5be9mr6030694a91.13.1746215385892; Fri, 02
 May 2025 12:49:45 -0700 (PDT)
Date: Fri, 02 May 2025 19:49:29 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMkhFWgC/2XM0QrCIBiG4VsJjzP0d07tqPuIDqb+W0JlaI1i7
 N5zg6jV4ffB8w4kYwqYyXY1kIR9yCFeyqjWK+KOzaVDGnzZBBhIVoGmHu29azNN93yjwnnpjEK
 rPCeFXBO24THn9oeyjyHfYnrO9Z5P7ztklqGeU0ZrW6NyVhkw7a6LsTvhxsUzmUo9fGnBfjQUD ai9MFpqDvZPi4+WjP9oUbSWTNembWytYKHHcXwB8u+FriUBAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746215384; l=3114;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=a8DL26eOTtjtZlYdE3uFqnVxCM+SRHnboVP11zp4b14=; b=np5y76UuQZXHYh56y1HpzxF1BlaXYmAYv+ZFMnCtN5jUW8ozqJKec2jlei/m9KW0rxsmd7I/R
 jvu9ZppzZibAmGHDDZVDVWrywcJB7rAvdLh1j4oCKWxpFfFgpXLUm4G
X-Mailer: b4 0.14.2
Message-ID: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
Subject: [PATCH v4 0/4] rust: DebugFS Bindings
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides safe DebugFS bindings for Rust, with a sample
driver using them.

This series currently only supports referencing `'static` lifetime
objects, because we need to know the objects outlive the DebugFS files.
A subsequent series may be able to relax this.

* Directories created in the root of debugfs are assumed to be owning,
  and will clean up after themselves when dropped.
* Subdirectories are assumed non-owning, remaining alive until their
  containing directory is cleaned up. They can be promoted to owning
  variants if needed.
* Files are non-owning, but can be manually removed by handle if needed.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v4:
- Remove SubDir, replace with type-level constant.
- Add lifetime to Dir to prevent subdirectories and files from outliving
  their parents and triggering an Oops when accessed.
- Split unsafe blocks with two calls into two blocks
- Access `private` field through direct pointer dereference, avoiding
  creation of a reference to it.
- Notably not changed - owning/non-owning handle defaults. The best read
  I had from the thread was to continue with this mode, but I'm willing
  to change if need be.
- Comment changes
  - More comment markdown
  - Remove scopes from examples
  - Put `as_ptr` properties into a `# Guarantees` section.
- Link to v3: https://lore.kernel.org/r/20250501-debugfs-rust-v3-0-850869fab672@google.com

Changes in v3:
- Split `Dir` into `Dir`/`SubDir`/`File` to improve API.
- Add "." to end of all comments.
- Convert INVARIANT to # Invariants on types.
- Add backticks everywhere I found variables/types in my comments.
- Promoted invariant comment to doc comment.
- Extended sample commenting to make it clearer what is happening.
- Link to v2: https://lore.kernel.org/r/20250430-debugfs-rust-v2-0-2e8d3985812b@google.com

Changes in v2:
- Drop support for builder / pinned bindings in initial series
- Remove `ARef` usage to abstract the dentry nature of handles
- Remove error handling to discourage users from caring whether DebugFS
  is enabled.
- Support CONFIG_DEBUG_FS=n while leaving the API available
- Fixed mistaken decimal/octal mixup
- Doc/comment cleanup
- Link to v1: https://lore.kernel.org/r/20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com

---
Matthew Maurer (4):
      rust: debugfs: Bind DebugFS directory creation
      rust: debugfs: Bind file creation for long-lived Display
      rust: debugfs: Support format hooks
      rust: samples: Add debugfs sample

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/debugfs.rs          | 418 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 samples/rust/Kconfig            |  11 ++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_debugfs.rs    |  56 ++++++
 7 files changed, 490 insertions(+)
---
base-commit: b6a7783d306baf3150ac54cd5124f6e85dd375b0
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

