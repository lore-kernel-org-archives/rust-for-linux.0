Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780891BE875
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952774; cv=none; b=M4aSBcpWWyUs52k1J4itet46dODwZiXsNzhGZMQFdluHayeFNgFn8PcY8mwbgT7t59DQxPNSyOtfPGbxA1CQnOXhK5540+AS97GAqHeqmVeAE5nvVj058ZCHvPQb3Lcosd+cv2+kAhbzPTtyf7oYsOue67LtxG1Nmy5O07NXWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952774; c=relaxed/simple;
	bh=KTgJoZOazfrdYAie9gC7fulCwwFQtzVqz/Rpj5104aw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=O2bUh4CPF9NoGpbK8fTlcF+VXhdzNAbxbNXjpro6yCwoq1JC5/LrXMTUjcYL5QucWNerMpfXByqtnUAa/9ojLWKcmns/uq7MpUBlQm6SXlycRgOQUKkUuhLda67W3uCd6EQvqpVkP7aPoBpdsMYgsKVDt5bzhgqyUlRNwETiWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yMpLrNu6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yMpLrNu6"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4280d8e685eso5702445e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722952768; x=1723557568; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QvHU5d/wWcGkM15ZRtoIhzlr4qncO7gLekwnvJlzJnE=;
        b=yMpLrNu6kutm7gjk+GSMVTEr8ZtRH1b5mhdWob0oNML0lDN1R7gk1EUVftxnl+GKor
         WQefzK9qpwdP35Sr5vQJA6y206Jp0Tj4aRcmPXG0QCPjM2GjuxOfrG2MS3tluaLH6VmQ
         ifYQKjAs3dLFNPq44+gBU0Z1/iVLH3ccht5KMRZo30w3xMgfceGIXpB589RHxi5GqW/A
         kCaXKO9/jFxLqxTN56W5NkCiKfjbOaK10UbK3t/JcZDLuOsWz35394vXKXXzecv6kL+L
         aA4fnqV9/W7OjUYJJbGIGInsDfMLSIC8zpC0Rhparr3Twzn8xEJT9yNY2v9KVycuZXsr
         lzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722952768; x=1723557568;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvHU5d/wWcGkM15ZRtoIhzlr4qncO7gLekwnvJlzJnE=;
        b=IKDlCWuCm8sUKI2HyQMNCPZBUvURNl0gpTv0CvMpDlRs251ea6exMmu6/C/+FQ28r/
         mhP91IcLjkz44Ny21yxnxjV1oZSe7UwJpHQTKhz7D+bDkskKUC4KfgysxRXPL24i/9F8
         1T7vzXVKYXnwLUBwLEYsnAdOI2CH27nnoJHuux7IMdDDquSiD7tlnP5XxEIZs+IkSYXE
         BxmPO+pSPNBlrej4ddOKG7dZxblZFfvw3VMDH42MOrUkUXkWTq/ixSRJ1wy06Y7Nj2CB
         QNuKu9HaS5DBairRcuZWg6geavw7lPN+fPKCKeXY5bENPL5dkljI3+HBtfZTBmACU1D9
         BtCw==
X-Forwarded-Encrypted: i=1; AJvYcCULeKYY9TDdtiN2riu2jDRJZKw/cHPz6UNkY8DgLlB2/Zg+jzE/r+4WcDUC1dCLnwuX8S/V43bc4t4DoNDwlSIoKqL728moOqaI7zF4GQw=
X-Gm-Message-State: AOJu0YzCLZhUUZ0g00mJZEiXbpz/aC7laDKEPE7szZqdm2v0IDm7ywr9
	0z+FruXV5IrCxmwmix/JpId0G4uS++d5GVpPhy6gVgW35O/xTr0eAVH9MG/81E6b8XCYaOxS+EU
	a68pJqQtQiZ3cgg==
X-Google-Smtp-Source: AGHT+IEFOuE8NU2BaX8VMTKXywtGlsM+muat40pADUmqd2QLjAxXGaQo+cBe7XFUqyNSIjzBAO+sT8jJvMEhFe0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6986:b0:424:a3d1:bdc5 with SMTP
 id 5b1f17b1804b1-428e6a603a4mr650735e9.0.1722952767742; Tue, 06 Aug 2024
 06:59:27 -0700 (PDT)
Date: Tue, 06 Aug 2024 13:58:52 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB0ssmYC/2XMyw6CMBCF4VchXVvTDuVSV76HcdHLAI1KTTFEQ
 3h3B1wQ4qo5zXz/xAZMAQd2yiaWcAxDiD0NdciY60zfIg+eNgMBSgBIfg/9DT09w4tDIUtttDD
 KIyPxTNiE91q7XGl3dBTTZ42Pcvn9dai064ySC26lK7Q1lcHcntsY2zseXXywJTTChgtR7jEQr qyWolbCadn84XzDFeR7nBOutbcaXOVto3Z4nucvE3sTwCEBAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3980; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=KTgJoZOazfrdYAie9gC7fulCwwFQtzVqz/Rpj5104aw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmsiwkXY3U0EdT+rgZoZ/ddXwPWz8v9EZA5vCiZ
 dTNjysif7qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrIsJAAKCRAEWL7uWMY5
 RgmkD/9eifnRbUPge29QnXT5pEu+gK10wY1UWHC7T5Q8bt4/5BySbBk8cocdBgmce/CGXLUHylF
 bic2PChVBNbC/ew360cIGZU4/0vwvSGO+9RF355iHX6+KI5hgbtehAqhU+CIE4RH+3XtdeKGFfJ
 3WJuyNnTBD70z8pt4XwwZcE+ey5dEK5dtFBBwvCqpJxMAtC6dvHwING11PaqHQ8bI+9sI4DEmRN
 T21ZqrV5GY7i4vcQxDNo10aQ66WGdJiK2cLvV9fMpiK900F7ViDFi/knteMHGbnve0JYjM3oRLK
 rP9ZJ6VdrvIf9JWDbgWOkLvNZ7rVPht2XurjZcPwuFrWEZp5MSJ/5nYVph0fLVBA1C5vbn9UZLY
 fYc8ZkXlwlUiOLDeqOwB0TwCpN2Xgu++diXNcks0ToGAzev1r4Xlp0lNk+HAdQlmEyKwHYrO7qE
 Bzk9lTke368eqEzEf/QEWFMJOcwwNXNirDhCmaUP3c/RImjY9yI70W/P5Jp62mG9/Or4mbWK4dr
 3XR9gsLA3X+8q6k/FMbwAs2spwvXsF6TVS9ZBT/Uu8cn/KJ30IPjmxxHFt2VH1v3kKz7XVbRz6b
 hfy/sj+u7mrOZ7Tk7Dy9EXyKNEpfPMOyLRoWJ7OayuUpUf6PdbgShlDAbiANja6vkS2tRDEC2eH ay8Pymy/oDnHHUg==
X-Mailer: b4 0.13.0
Message-ID: <20240806-linked-list-v4-0-23efc510ec92@google.com>
Subject: [PATCH v4 00/10] Add Rust linked list for reference counted values
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, Coly Li <colyli@suse.de>, 
	Paolo Abeni <pabeni@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="utf-8"

This patchset contains a Rust implementation of a doubly-linked list for
use with reference counted values. Linked lists are famously hard to
implement in Rust [1] given the cyclic nature of the pointers, and
indeed, this implementation uses unsafe to get around that.

Linked lists aren't great for cache locality reasons, but it can be hard
to avoid them for cases where you need data structures that don't
allocate. Most linked lists in Binder are for collections where order
matters (usually stacks or queues). There are also a few lists that are
just collections, but linked lists are only used for this purpose in
cases where the linked list is cold and performance isn't that
important. The linked list is chosen over Vec in this case so that I
don't have to worry about reducing the capacity of the vector. (Our
red/black trees are a much better place to look for improving cache
locality of collections in Rust Binder, and the upcoming xarray bindings
would help with that.)

Please see the Rust Binder RFC [2] for usage examples.

The linked lists are used all over Rust Binder, but some pointers for
where to look for examples:

[PATCH RFC 04/20] rust_binder: add work lists
Implements the work lists that store heterogeneous items. Uses the
various macros a bunch.

[PATCH RFC 10/20] rust_binder: add death notifications
Uses the cursor. Also has objects with multiple prev/next pointer pairs.

[PATCH RFC 15/20] rust_binder: add process freezing
Uses the iterator with for loops.

Link: https://rust-unofficial.github.io/too-many-lists/ [1]
Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Support several impl blocks inside `impl_list_item!`.
- Link to v3: https://lore.kernel.org/r/20240723-linked-list-v3-0-89db92c7dbf4@google.com

Changes in v3:
- Add `assert_pinned!` macro and use it to ensure that the field is
  structurally pinned when using the tracked_by strategy.
- Improve ListArcSafe docs.
- Use From trait for UniqueArc->ListArc conversions.
- Implement AsRef<Arc> for ListArc.
- Improve safety documentation related to ListItem.
- Improve invariants of List.
- Other minor docs improvements.
- Add Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20240506-linked-list-v2-0-7b910840c91f@google.com

Changes in v2:
- Rebase on top of the new allocation APIs.
- Implement Default for List.
- `on_create_list_arc_from_unique` now takes `Pin<&mut Self>`
- from_unique now calls from_pin_unique instead of the other way around
- Add #[inline] markers.
- Use build_assert in pair_from_unique.
- Simplify transmute_from_arc
- Make macros consistently use full paths.
- Many improvements to safety comments.
- Link to v1: https://lore.kernel.org/r/20240402-linked-list-v1-0-b1c59ba7ae3b@google.com

---
Alice Ryhl (9):
      rust: list: add ListArc
      rust: list: add tracking for ListArc
      rust: list: add struct with prev/next pointers
      rust: list: add macro for implementing ListItem
      rust: list: add List
      rust: list: add iterators
      rust: list: add cursor
      rust: list: support heterogeneous lists
      rust: list: add ListArcField

Benno Lossin (1):
      rust: init: add `assert_pinned` macro

 rust/kernel/init.rs                    |  67 ++++
 rust/kernel/init/__internal.rs         |  29 ++
 rust/kernel/lib.rs                     |   1 +
 rust/kernel/list.rs                    | 686 +++++++++++++++++++++++++++++++++
 rust/kernel/list/arc.rs                | 521 +++++++++++++++++++++++++
 rust/kernel/list/arc_field.rs          |  96 +++++
 rust/kernel/list/impl_list_item_mod.rs | 274 +++++++++++++
 7 files changed, 1674 insertions(+)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240221-linked-list-25169a90a4de

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

