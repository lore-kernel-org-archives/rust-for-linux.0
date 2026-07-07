Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F823E5562
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420146; cv=none; b=Sz/EGQLUQ6Lma2zoQGxVnGTyi2QCf9uLGeUhxsPsE0UzYjM5yBbCy/31l6NfwmT+Nq0Id08z4cUS9W81EFV/UO3FN63uqP/Ao+8ASTE1v2ZrM2ZpXo6bPFd2VFrdvrCurNZh+EuM+iqvoZ942LYuem9J/m8Estw+hYXE7BoCBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420146; c=relaxed/simple;
	bh=Ik9UgXREfTt+HJZU6vGo9xw5gL/5eqDQLuZZeNACvmI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p+fGuam5O/3I6OU8wMTA/zMydNVsFy/g5KOBlTLLxMp1spFng04PFiWm6QeVapU+r0tcSRMgTV25sDtJ0KseqH3jbeC8/ZGyUQlMSj+hosgQ0JknulWkz0f49mrHAtnrcnigBcyNJyA9vPjj7g5DvlvwgQbprz5T82fFe17IkO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a2VaezSG; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a2VaezSG"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c12c2d67af1so251929966b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420140; x=1784024940; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwmrvkhVumeXTpOXUxTquPJkVGcs+B2a1KUlGRGepTo=;
        b=a2VaezSGLOETjH9ALCUJQQdhlU9ck2dqyfpZ/qUqO2+1bb7fUEC89TrqtOGlnvrKGZ
         Ibl2Lc2Ab61DXNOIoO3okqfEmlklPUVz/MF+lkDI4cRtJ/6LLp88xQlp8jpWeB2PkDAe
         g8DnGOskdufE574xtDevH6GeBrHXbXnVyWSnVE01ABHYAp/2jNKFoz5TtCcyQ5Y+strl
         H/G7XJPapU1WyJ3+JEVhmV+LUKTEroSgMyNg2+SppzFVJnmGkWwo3ZYqn0BsJPPwt4VN
         aBQOvO7UKECY3oE4kaucbYLgfj7Xa5gDl4zIKxmO7siItAPF7iMrTplK2m/ZMaTYtiPC
         y/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420140; x=1784024940;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwmrvkhVumeXTpOXUxTquPJkVGcs+B2a1KUlGRGepTo=;
        b=aKUp4fzp9rwg2OP+s2kh6zuSpYod+myOAiUfyF77U8qzHJ+3UXZmYVUDlvETACr8J4
         SnbNg8VXbJnr0QBp1dRJHRg81brIs5kNtdZsNhOhOEgDTXrwyfMqCErjTIyJDkDL7Zce
         PeuLHft00087A8NtD5pNPVbSpI78xuIvXROGvAIYVX+SLxKDSEyPkzOctZ9Ui9obnL+k
         SWKBIGqlGSeacMRk8RRYoayOU4LiXoQ2eg4YZx/TefnPmMX1inqf3JnarqqnISg+wJW4
         MX0PTRllv20rQQgZKT3MjDloBvo3fdycGSbVaA97r9pVMXevwUPQgSHc5aNzmnvE+u1l
         4Rcw==
X-Forwarded-Encrypted: i=1; AHgh+RrRww9Lg62a3p6ogqRpUu0EPPuzTDQSnX5ih0ZSjcrRzihP2Dd0zplu9RYP+h4F7fbQTa9Qtc1kdu1xIflE0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXb3rEgQMQvVtRsGCbPO7qEwceUmITlAALNKCsLrItZDwt5sIE
	l7sQVTIEIjSfBUJ+iBMDVz/Uf9WiIV70xZE7li3nqowdx9D2ffxU0ptAqe5oBT+IbAY2x/q35N+
	ZtdAVM9i8+/QNh3dELA==
X-Received: from ejcko12.prod.google.com ([2002:a17:907:986c:b0:c12:68ac:135e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9304:b0:c0e:4017:6471 with SMTP id a640c23a62f3a-c15a6797c24mr257092466b.16.1783420139933;
 Tue, 07 Jul 2026 03:28:59 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOLUTGoC/4XNTQ6CMBAF4KuQrh0z9AfBlfcwLkqZQhNtCTVEQ
 7i7hRXGEDeTvHmZbyYWaXAU2Tmb2ECjiy74FOQhY6bTviVwTcqMIy+wwBJq5xsawIc0yUaIvfM
 gNJJBVVYoBUunfarca2Wvt5Q7F59heK9fxnzZ/gHHHHLgqpSmliQray9tCO2djiY82CKOfKtUO woHBNK2IW6tOBXmRxEbJVc7ikiK4EJZpQWhxi9lnucPiNQ91UUBAAA=
X-Change-Id: 20260608-binder-noderefs-spin-3a0ec0589043
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Ik9UgXREfTt+HJZU6vGo9xw5gL/5eqDQLuZZeNACvmI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTl4LpoWTEFQezx8aEHKSfsynW/UEt7LMKPA
 7qigX4pNMyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU5QAKCRAEWL7uWMY5
 RptBD/0QH8e0+FJ9beLxWeXWPGZuFXdGTYRIpUVqwT0mfdSaiEqPxRJo5yPudm2jmOQ2KJa7MV+
 iXy0tSAThVbH9JkzttdDqnKM4Hx7yM2ZJcsb34D4K0cQsnF2aujmXa56KT5wI2ItP6OvM2NLKet
 7U94daboSLzfcPknz2efnVk6ydqi3UaYzcOBrxDPhCLHLIv/rRDh0tb3+0qKwWd91wDyj7KHzTZ
 IPuvMutsLk1kj49UOhYvFwLjryTOdTqT6Il5D1IzahOuLh8B3ATpmgyn8a/gL2VS3/03UlRTzt4
 H2Clc+lhJ3EPFvAN4OqhQZJEr+S/Z/JeYUJNTDHiNV+k3Vm9+6M6VTRjdVj0POpHqwAdJylb/2m
 0LeWOx3zDZuUN0gnA8ilXLK3bhpG4snKVU1joOVaNusx1sISX+PFT6vqJesMGuqsZd8uMMTeyPs
 P3JGgz1vgTdwfgSzntq8sK38WNenzDJJ/D8KkhppkqslIqgkCWH4VO01tqwdwxNtFItoqhg0JuB
 i+4cRL+DvSMF8D2l/RR3WVgQU1oifZq8s50KBY6eUJc9Id2RFo4E27SzMbZoFqZPW+Dzf2pytmx
 VU0RYhFgbp94zixKNRVmlVCQmAI/+4ehvbDMQFn8fkftMDYnxXd5SkHUOQVZ/ucqlDmFFqTphgB 03ssAZmf4YAiGuQ==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Subject: [PATCH v4 0/6] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Unfortunately the current use of a mutex for this lock leads to priority
inversion. Traces have been observed where a process is trying to obtain
this mutex for 22ms, but it's unable to do so because the thread holding
the lock is scheduled out. Since this occurred on a UI thread, that is
an extremely long delay.

This patch series fixes that by first making a series of changes that
remove the possibility of sleeping under the lock, and then finally
changing it to a spinlock.

Based on top of:
https://lore.kernel.org/all/20260707-binder-netlink-v7-0-42b40e4b1ac8@google.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Fix conflict with commit bc4a98288978 ("rust_binder: clear freeze listener on node removal")
- Rebase on top of v7.2-rc1 and netlink series.
- Link to v3: https://lore.kernel.org/r/20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com

Changes in v3:
- Clone `node` after loop in freeze listener patch.
- Inline `resize_for_add_freeze_listener` in freeze listener patch.
- Pick up Reviewed-by from Matthew.
- Link to v2: https://lore.kernel.org/r/20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com

Changes in v2:
- Make more tweaks to various critical regions and extract them to
  separate commits.
- Link to v1: https://lore.kernel.org/r/20260608-binder-noderefs-spin-v1-1-2584cb4e49ff@google.com

---
Alice Ryhl (6):
      rust_binder: avoid allocating under node_refs for freeze listeners
      rust_binder: avoid dropping NodeRef in update_ref() under lock
      rust_binder: schedule NodeDeath outside of node_refs lock
      rust_binder: keep NodeDeath in NodeRefInfo during process cleanup
      rust_binder: avoid destructors in insert_or_update_handle()
      rust_binder: update Process::node_refs to use SpinLock

 drivers/android/binder/freeze.rs  | 65 ++++++++++++++++++++++++++-------------
 drivers/android/binder/node.rs    | 41 ++++++++++++------------
 drivers/android/binder/process.rs | 57 ++++++++++++++++++++--------------
 3 files changed, 98 insertions(+), 65 deletions(-)
---
base-commit: ffdd0cba394c502b1d7c936586b2a09bb235aa8b
change-id: 20260608-binder-noderefs-spin-3a0ec0589043

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

