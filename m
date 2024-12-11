Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0FA187872
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733913457; cv=none; b=adfSlo+wYlPuyoe3++hXRy3JXi2RKZRZWOJf8gkxF/ZMYSVepoWL+YTLuWLoeVKJ8vIg4ZQD1KIMTr1/QNOPY7H/z4N0Zi4fcvbuTNpO8fy73m/IKBVUVYaw/G/yc2X4n19faeRR3I23J2hcV14fvFq78RdKy39pXt+cS+PQrr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733913457; c=relaxed/simple;
	bh=WUrp+/ldgDUnGVJX3Q2NimbLGUJ0ujuKpZbkVmi+/hI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kS5CQQJz3CmdCqIXighT4fTbsPsjqmLv8U1IXvtBpb3IVBrWeF+vlIhT4ti6Iqm3SV8MtMQkRRAriW4aXMBva6SwkzyUj9cJnsOU48Lr8aD7PGbSFkb0Y5Gdz9hEBS7Ss8oNmRj4WVZOSgdG85uaH8SP9v3hGcv5YUGaoTsd6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=or+FgScz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="or+FgScz"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3862c67763dso2798143f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 02:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733913453; x=1734518253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2QnY3nqUlMVid18sCVnINWo37cTCiIN8hI1LuQ+kCo=;
        b=or+FgSczonFU/QZYV7Y3HnJHYtuG0C9MsZMlcqH4l3TmIrkcGkuJkj+ubCg2qClV8G
         d5RrGNbrb0vVSPqBzEC3yRmbaR8UrvJMc0BXd4t3amC/jsTOP33q/bMebG5PQ+Vfie9F
         Den/0/7pLNhU6CA8AO1TpDp0RbhaMt3cBD1JWC48+t3hh92MQqy2jJTEokjLE35xckbq
         ++CaeH5QFhoUj+yZIJFpWwl1tN/Xwn68ko0x6TQuuL4E5gAuRc/GOqXYFAZMXLs8cyot
         k5S/NTI3tlJsd2nfhzdt9JOCjhfPm2HJwLvvN2C1DaAJwZy4BXpYjobsYc6YWqYuEDD3
         vIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733913453; x=1734518253;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2QnY3nqUlMVid18sCVnINWo37cTCiIN8hI1LuQ+kCo=;
        b=qWK32bRjxLMxDJmUIMmidwhkcL38D7BWXgBDIKvDNIDTvCe2pWWX9dfXxXhUi1MkLX
         gOn3nhuqFkrYGnGjwK1PWDX3a1gQImutGKjgFoK5yoeFO+20sFz21RhQTtYk52OrKfrX
         MBcFurkEr9dEJauBrgYJciLB7QPTck70ZXKOHPgjMeBAr4waI0ytn3z+Fx5UZi5XoKxV
         /fSubn/AxZYrFCeIZp1x51N7bwmvyXtr0AJL4sNwvngnc1CMFhpFIomyCDgShDRkbCI5
         dcsdeu4SL9gNEPH6fJMjS1H2RW+yYdczXRLPVB8Db1EUHfeBdiG/gmonAXlSMJyRUiXW
         f7BA==
X-Forwarded-Encrypted: i=1; AJvYcCWkHBwPl0nqPzCvFFhU2nwquwOw8Essakka/UpNbgN6lYyxQCROo3rSDqwLDgHWstdBaqavRAGCuwkf2SGktA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoqi7Dkr/O9b5jUsH7MJZYog4ukoUsinz8+rRll8XPCVp9rOE8
	YSHr1BgZDz5LO3B2TOY+j/JEtLJJy3Xndm4RKX+0Zx3smKhFqVNzt80c1VGK5jZhyCZjRThuUsG
	2m6OAxVvtAyXllg==
X-Google-Smtp-Source: AGHT+IH/c3Iu+nJ9Nv0o3TiAxZrdEhPU30LKeX5h/Df7IZ4hvGTeYRO+lhCWtq/FRJTRbo1Jx+ZfHKRQsIVq+/M=
X-Received: from wmfx19.prod.google.com ([2002:a05:600c:2d13:b0:434:9fab:eb5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178b:b0:385:f092:e16 with SMTP id ffacd0b85a97d-3864ceab3f6mr1868994f8f.55.1733913452975;
 Wed, 11 Dec 2024 02:37:32 -0800 (PST)
Date: Wed, 11 Dec 2024 10:37:04 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFFrWWcC/2XRzWrDMAwH8FcpPs9Dkr932nuMHezYbgNrU5IRN
 krefWpT1hQfLfz7S0gXMZWxL5N4213EWOZ+6ocTPxBfdqI7xNO+yD5zQRCQBkdKzscoqwfEUEN
 Nygj+eR5L7X9uMR+f/D700/cw/t5SZ7xWn/2MEqWimE3kIF/K+34Y9l/ltRuO4how0xa5FRGjm
 FQxgVzuVGyQeiAecEWKUU62ww5izTE0SG8RrUgzgoDROzA+atUgs0V2ReaKNKCvYHKh1CD7jxA
 QVmQlyOwDqJBsNa7t5LZIr8gxAiyKqrd8B9Mg/0BI906eUUkKNZkcrW3HC1t0X0Rg5JBcql3OR rd3QtiqcL8ujyd1rpU3kSJf64kty/IHUn8w3XcCAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5009; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=11pTYMTSjcFgpGSBp79ExVExpqHUXRE/LVnE2f2asAg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnWWtXaB+TtU9GC9bEJlYbOkV7yAW44AYxwLIdY
 kJilAsBWqmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ1lrVwAKCRAEWL7uWMY5
 RjoGD/9T86lVgm8PmdgyLpmX6TmenyGZJpOCn0Cb4+gZotZqvrSsTbfQ6KPYx34pC+cxJfgRXdx
 dzpY89pK8NNBBPTXDNMaqeDyHNDwHP0O9j5Sjh46nKmaCWP/cvLiuAhLA7EVCwXhQ1aPbAlYPRz
 rEvNzID+2rpmPE15edL/ZSJ8/2GS0AMLiR37yz5rCPxzR6HSbfiyn1u9V1wqEXR5VNxeaokJ1qD
 sd3tbTQAbuTtoOoi4T+RvnYheWntd5IVj6lSciZL0ELx8Heyc1saGtIBBhDr9/r+zq7FK3RnZv3
 IflhXZ0Ug2J/WPnPHzBlvnR7G6HlzkhAAbu+wFOZtq6tcDQauEztnxgsT/4Cy7N2uYnczyYit/o
 8MM/xesLQ7lp+Y5b2jyzQ9DrfxbWRkws6fkpYLdmHhPmtCbW49m880OnFsRuJjoaxzAsPs3b3o6
 YVyPuoK9BAUTUoBqCGqY56sL9i0ZX8SXqtgnlDT2wim7oqwsergdivAtxiOn5Ujv6dmDaJ0L09c
 o2lJTr374LTbqsBORd/4pQRF6ayPSklTCH3h6PmHTGiX54ZYRZJLoWoZBoWRjykknEqOcfT2VZg
 czosFNO0er/Eot5wxASryeyBgrvKY2TD48DCdI/2b1VwG6fQ56VDBxAXGP3x9Eefm3XskJbZpjX TXFZkuvd4BacsLQ==
X-Mailer: b4 0.13.0
Message-ID: <20241211-vma-v11-0-466640428fc3@google.com>
Subject: [PATCH v11 0/8] Rust support for mm_struct, vm_area_struct, and mmap
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This updates the vm_area_struct support to use the approach we discussed
at LPC where there are several different Rust wrappers for
vm_area_struct depending on the kind of access you have to the vma. Each
case allows a different set of operations on the vma.

Patch 8 in particular could use review.

To: Miguel Ojeda <ojeda@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
To: Liam R. Howlett <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Christian Brauner <brauner@kernel.org>
To: Jann Horn <jannh@google.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: rust-for-linux@vger.kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>

Changes in v11:
- Add accessor for the vm_mm field of vm_area_struct.
- Pass the file to MiscDevice::mmap for consistency with
  https://lore.kernel.org/r/20241210-miscdevice-file-param-v3-1-b2a79b666dc=
5@google.com
- Link to v10: https://lore.kernel.org/r/20241129-vma-v10-0-4dfff05ba927@go=
ogle.com

Changes in v10:
- Update docs for `set_io`.
- Check address in `zap_page_range_single`.
- Completely redo the last patch.
- Link to v9: https://lore.kernel.org/r/20241122-vma-v9-0-7127bfcdd54e@goog=
le.com

Changes in v9:
- Be more explicit about VmAreaNew being used with f_ops->mmap().
- Point out that clearing VM_MAYWRITE is irreversible.
- Use __vm_flags to set the flags.
- Use as_ and into_ prefixes for conversions.
- Update lock_vma_under_rcu docs and commit msg
- Mention that VmAreaRef::end is exclusive.
- Reword docs for zap_page_range_single.
- Minor fixes to flag docs.
- Add way to access current->mm without a refcount increment.
- Link to v8: https://lore.kernel.org/r/20241120-vma-v8-0-eb31425da66b@goog=
le.com

Changes in v8:
- Split series into more commits to ease review.
- Improve read locks based on Lorenzo's doc: either the mmap or vma lock
  can be used.
- Get rid of mmap write lock because it's possible to avoid the need for
  it.
- Do not allow invalid flag combinations on VmAreaNew.
- Link to v7: https://lore.kernel.org/r/20241014-vma-v7-0-01e32f861195@goog=
le.com

Changes in v7:
- Make the mmap read/write lock guards respect strict owner semantics.
- Link to v6: https://lore.kernel.org/r/20241010-vma-v6-0-d89039b6f573@goog=
le.com

Changes in v6:
- Introduce VmArea{Ref,Mut,New} distinction.
- Add a second patchset for miscdevice.
- Rebase on char-misc-next (currently on v6.12-rc2).
- Link to v5: https://lore.kernel.org/r/20240806-vma-v5-1-04018f05de2b@goog=
le.com

Changes in v5:
- Rename VmArea::from_raw_vma to from_raw.
- Use Pin for mutable VmArea references.
- Go through `ARef::from` in `mmgrab_current`.
- Link to v4: https://lore.kernel.org/r/20240802-vma-v4-1-091a87058a43@goog=
le.com

Changes in v4:
- Pull out ARef::into_raw into a separate patch.
- Update invariants and struct documentation.
- Rename from_raw_mm to from_raw.
- Link to v3: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@goog=
le.com

Changes in v3:
- Reorder entries in mm.rs.
- Use ARef for mmput_async helper.
- Clarify that VmArea requires you to hold the mmap read or write lock.
- Link to v2: https://lore.kernel.org/r/20240727-vma-v2-1-ab3e5927dc3a@goog=
le.com

Changes in v2:
- mm.rs is redesigned from scratch making use of AsRef
- Add notes about whether destructors may sleep
- Rename Area to VmArea
- Link to v1: https://lore.kernel.org/r/20240723-vma-v1-1-32ad5a0118ee@goog=
le.com

---
Alice Ryhl (8):
      mm: rust: add abstraction for struct mm_struct
      mm: rust: add vm_area_struct methods that require read access
      mm: rust: add vm_insert_page
      mm: rust: add lock_vma_under_rcu
      mm: rust: add mmput_async support
      mm: rust: add VmAreaNew for f_ops->mmap()
      rust: miscdevice: add mmap support
      task: rust: rework how current is accessed

 rust/helpers/helpers.c    |   1 +
 rust/helpers/mm.c         |  50 ++++++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/miscdevice.rs |  37 ++++
 rust/kernel/mm.rs         | 323 ++++++++++++++++++++++++++++++++++
 rust/kernel/mm/virt.rs    | 439 ++++++++++++++++++++++++++++++++++++++++++=
++++
 rust/kernel/task.rs       | 284 ++++++++++++++++++------------
 7 files changed, 1018 insertions(+), 117 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20240723-vma-f80119f9fb35

Best regards,
--=20
Alice Ryhl <aliceryhl@google.com>

