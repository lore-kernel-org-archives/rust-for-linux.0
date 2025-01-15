Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A211236EDE
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948168; cv=none; b=gwhYGnC9t6rbljPG9fmho9qJSq9QWv91iXdU76M36PFJeQ45MfcHRzA3wklvUkCtsPB41CF/BiRWWoXKDDq3FG9dqx/eXioWWTuhaHJCRUegD2W3eKkKttVgmA11fJQ5TbasepQPWAWqOgrRDdvsts4AMFIj8uLYk715ZV4/UMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948168; c=relaxed/simple;
	bh=Vm4YeMs1sTGWonvj+6yAEU1SHf+sI2+UBVeCMDhl7q4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=L2bV304NHD5GZmxIWfxRNaKrjfc5zxFSgYaDnvpKXBpUGObxKaOK2I7EuMrMUYyxOXCqG7PVYW6XKqiC6Bmlv3iovrt2ldGt2CDHecIOlmmV/l0adlQGelSj/vfCeIWNhita7o4r2LjoMoDsRtwSaDXuREqgj0ldIPq2Vez8jDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=faj8tNTW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="faj8tNTW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-436723bf7ffso28581895e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948164; x=1737552964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QJt0NwnF+zEPIT7s9Z05/9x45r5eY4ar9nsfpGZZ6/4=;
        b=faj8tNTWAfE3Sv2G1g5FD9Dh/+5ceBcEz6vsKLjOhK/NTtoWzYjLkyekimXiOXEtMU
         hQgyRdPZjszyBSy4MskjXW+2tD7bwYkX1PEGE48h5bZHRXn8pvXoZDcdxFMbp9cwHD4U
         Vjurdh2Br1JNZa4vhYeVz4cayEM5V2aE8CCAoWHOZRlVzQKux52fnKYttXByY9K4CPQv
         XdvuaEBZLdxt6u0Dl+gzWryNHaXoUl+x2hXSxBjyKyxkwVVX6bgsqiDOoaO0bDKOSU7O
         kdNVmbCfSxaPnVw3qBEmumcWWMhxhlXydS+V1K/AYdDgJuy0Yonl5CgDwlSSYrcdmwhn
         nXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948164; x=1737552964;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJt0NwnF+zEPIT7s9Z05/9x45r5eY4ar9nsfpGZZ6/4=;
        b=tNN/x6AOlAZZCxA3yz1wRlol2ZpaXCmbCo+CJjVTUKlmJ0YCYjYztjd7+8gm4VtGTg
         PMn4hIA6e8awgM8FA5qYnyFSbpFoj605TFNw0wH8ccFJpjC9YiQJgU0PwUqTyAoTaYE9
         T65+VYuHkMbqy9Q9pBdUY0t8PWoWllaDHZcei4iu6gl9T4+c/jDPT8qKClSGJHzcNvvS
         Ap1+IaDRHbodwENEq/f5ue3OSOaJUhmMSYEEGxAxfRwawMO6ZFYZahxJDSwukAN7a/6u
         VRuzzooAZcs9NP+7YC1/wsO+oXLznh38bl/f+abfvuexiitOvHqHrOo4Kr5VMZVNSKIc
         faiA==
X-Forwarded-Encrypted: i=1; AJvYcCWHDvr8bTuSqgzTE9WQ3OvW/9oHyfKOdGL37jaLMEvEpWfz+abx9o9b1qBqW1WLO9NCx7AU0QE6kqbyKGy+3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjnmsvRrTXlTSgDA+XVtjHOyJj1Hy2Lsph2LIjA5CELP4gBZ5i
	q/M1OtcOoZy0vmuEtascSeqlRgbFFhjGcoWaDeMKrgOeIpvbpdHXldJaXOnCDaFRgFiR2m+Zw3R
	fYBvv6+0RrlNkvw==
X-Google-Smtp-Source: AGHT+IGK1xZTOtHdTgRlhLDWD+ToXxEeoqzsoT3aptOIZ7komuwsaBRBJNe5QrfIeGYwbIsagNZ6Ds4T0K+ARh4=
X-Received: from wmbfk15.prod.google.com ([2002:a05:600c:ccf:b0:435:dde5:2c3b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1987:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-436e2679e05mr275323325e9.4.1736948164552;
 Wed, 15 Jan 2025 05:36:04 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:03 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIe5h2cC/2XSzW7DIAwH8FepOI/JNt877T2mHSBAG2ltqmSKN
 lV997lNtKbihED8jOU/FzGVsS+TeNtdxFjmfuqHE2+QXnaiO8TTvsg+84EgIA2OlJyPUVYPiKG
 GmpQRfPM8ltr/3Mt8fPL+0E/fw/h7rzrj7fTZzyhRKorZRC7kS3nfD8P+q7x2w1HcCsy0RW5Bx
 CgmVUwglzsVG6QeiBtckGKUk+2wg1hzDA3SW0QL0owgYPQOjI9aNchskV2QuSEN6CuYXCg1yP4
 jBIQFWQky+wAqJFuNa19yW6QX5BgBFkXVW87BNMg/ENL6kmdUkkJNJkdr2/bCFq2DCIwckku1y 9noNieErQprutye1LlWnkSKnFbLHp8CCdeoeGVmrdWgydfueRjX6/UPCdAc6q4CAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5088; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Vm4YeMs1sTGWonvj+6yAEU1SHf+sI2+UBVeCMDhl7q4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7mXx5k0dTMzrixzQLfhcBrHgnBgjhc8I71tE
 XISPleDzzKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5lwAKCRAEWL7uWMY5
 RvY4D/97j/AY3Cb9bMxXhA8VWbU1gQuoE+LTkDzBYjjw/YhPkUUC3lOSNwEzLWe7mU+gnO7Yamm
 PKqfYJR6B6vExINgT6GedzLsLeYFU5F25C4HJb/1rp72hzTQZjjVnlyYC++MkqHH1ellZIxDVRw
 c3qqW2pzroTxGnmrr74253bfU8YMaRQ9MyejixpAzzNAtB5MkQ6qx/WTzAlXNrqFCSl0gc8kX/M
 ULLqdwjFxVSXuLfG+xzuDarYvJ6JsdbxlsYvmRaFA3h5TjpTjd/119njvINJ5+BUx9EYDasVlXl
 ZtOZnTdSDamkf+wXl7b3v1OTs2h3QZlHvefMW0TcThqc215Zxedd060BamISqBEAfSLDoBCTzag
 jO5wqbxmKBbDDJLRLk/GzQNawga3cGhzj2pFIjDUM1NNRwW1u50DwiWkuvMJe+v+TDd1hrVxJpL
 hgOYmHlaHeRcVd47cwool0h7cH9orvaH9eIStkJo914On0HRoY6pDj6LCccZ3rSa1+nrAXI1pWs
 h+FR6s7U8zG+22dqvINnvWvl04+813qW+X/NO115f9sxD1GxEGpb/7+yZpkGVf8c0USxCKmMVw9
 9nFXQhim7uY4EpKryrPdcIggkAw7ei3gUekABuGxQk23IM1Qo66C3UOVcnv9wyTyZT+YYxDjODC S5AM3yOpgY9CZ0A==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-0-375099ae017a@google.com>
Subject: [PATCH v12 0/8] Rust support for mm_struct, vm_area_struct, and mmap
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This updates the vm_area_struct support to use the approach we discussed
at LPC where there are several different Rust wrappers for
vm_area_struct depending on the kind of access you have to the vma. Each
case allows a different set of operations on the vma.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v12:
- Add additional documentation to modules at the top of mm.rs and virt.rs.
- Explain why the name Mm is used in commit message of patch 1.
- Expand zap_page_range_single with docs suggested by Lorenzo.
- Update safety comment in vm_insert_page
- Mention that VmAreaMixedMap is identical to VmAreaRef except for VM_MIXEDMAP.
- Update docs for as_mixedmap_vma.
- Add additional docs for VmAreaNew struct.
- Rename `get_read` -> `readable` and equivalent for write/exec.
- Use mut pointers for `from_raw` for VMAs.
- Update safety comment for fops_mmap.
- Add additional docs for MiscDevice::mmap.
- Don't introduce and immediately delete mmgrab_current.
- Reduce active_pid_ns comment at Andreas's suggestion and link to get_pid_ns.
- Fix documentation test in rust/kernel/task.rs.
- Fix warning about unused variables in lock_vma_under_rcu when
  CONFIG_PER_VMA_LOCK=n.
- Fix minor typos.
- Link to v11: https://lore.kernel.org/r/20241211-vma-v11-0-466640428fc3@google.com

Changes in v11:
- Add accessor for the vm_mm field of vm_area_struct.
- Pass the file to MiscDevice::mmap for consistency with
  https://lore.kernel.org/r/20241210-miscdevice-file-param-v3-1-b2a79b666dc5@google.com
- Link to v10: https://lore.kernel.org/r/20241129-vma-v10-0-4dfff05ba927@google.com

Changes in v10:
- Update docs for `set_io`.
- Check address in `zap_page_range_single`.
- Completely redo the last patch.
- Link to v9: https://lore.kernel.org/r/20241122-vma-v9-0-7127bfcdd54e@google.com

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
- Link to v8: https://lore.kernel.org/r/20241120-vma-v8-0-eb31425da66b@google.com

Changes in v8:
- Split series into more commits to ease review.
- Improve read locks based on Lorenzo's doc: either the mmap or vma lock
  can be used.
- Get rid of mmap write lock because it's possible to avoid the need for
  it.
- Do not allow invalid flag combinations on VmAreaNew.
- Link to v7: https://lore.kernel.org/r/20241014-vma-v7-0-01e32f861195@google.com

Changes in v7:
- Make the mmap read/write lock guards respect strict owner semantics.
- Link to v6: https://lore.kernel.org/r/20241010-vma-v6-0-d89039b6f573@google.com

Changes in v6:
- Introduce VmArea{Ref,Mut,New} distinction.
- Add a second patchset for miscdevice.
- Rebase on char-misc-next (currently on v6.12-rc2).
- Link to v5: https://lore.kernel.org/r/20240806-vma-v5-1-04018f05de2b@google.com

Changes in v5:
- Rename VmArea::from_raw_vma to from_raw.
- Use Pin for mutable VmArea references.
- Go through `ARef::from` in `mmgrab_current`.
- Link to v4: https://lore.kernel.org/r/20240802-vma-v4-1-091a87058a43@google.com

Changes in v4:
- Pull out ARef::into_raw into a separate patch.
- Update invariants and struct documentation.
- Rename from_raw_mm to from_raw.
- Link to v3: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com

Changes in v3:
- Reorder entries in mm.rs.
- Use ARef for mmput_async helper.
- Clarify that VmArea requires you to hold the mmap read or write lock.
- Link to v2: https://lore.kernel.org/r/20240727-vma-v2-1-ab3e5927dc3a@google.com

Changes in v2:
- mm.rs is redesigned from scratch making use of AsRef
- Add notes about whether destructors may sleep
- Rename Area to VmArea
- Link to v1: https://lore.kernel.org/r/20240723-vma-v1-1-32ad5a0118ee@google.com

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
 rust/helpers/mm.c         |  50 +++++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/miscdevice.rs |  45 +++++
 rust/kernel/mm.rs         | 339 +++++++++++++++++++++++++++++++++
 rust/kernel/mm/virt.rs    | 476 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/task.rs       | 247 ++++++++++++------------
 7 files changed, 1041 insertions(+), 118 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20240723-vma-f80119f9fb35

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

