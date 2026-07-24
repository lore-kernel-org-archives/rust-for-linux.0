Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076D47669B
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 23:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936324; cv=none; b=ZbqSpXYB+9ii6lx4x3YOUoU75xJSygrqVQGXCqv/JuD+ZInN0cYaISRsor5JEGS+GwKx/7N4lqw372jjqNtjvaUl2Wf5QsbevqQ2TSPH7Ptv5H8B7VXYQ6oh0qHS9t1+6K6VSFcXXqk1ecn/h4sG4y3Vi3mY/MU8dlFMsz1tvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936324; c=relaxed/simple;
	bh=kKKmq7jufGIPyfk8VrnaKD8ZMuWoYzZl5hWNdLhisvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFyNaMjZnpdvKdkNfNBAJz+uNqL7d6N5FGxg0eGdD+pz1scI6JDM41+Jp32H24Bcxxkhk2mSe4xw3Ag1RQVbJpISXD0kWmgeaTUIFd+dLBUvHLl84eJ5+/FFIyQWeQDyJgxHxxcuau8Cu/i0jmfi3eKQ4/aUqAQrZtok+xPx7iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0le2ZHr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0le2ZHr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso7176835e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 16:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936321; x=1785541121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUkrcS3bT47EateKo7yg7zIM6h/BJq/nEtdQpmc8z04=;
        b=f0le2ZHr5pmz2++EvZm4f8hvpnqdGYriWvb9cox0exePPzKfDPZ5xhM2wFtuj0DZ+W
         OFVoQkKEIxRIgEjpj5voPhsN3jA8bEaieHxRExsI1KMzfprX+tQZ5KIxU/S+Zwns8K1U
         X4QJok12Hf3zEBrEEY3fXAyxje0Em7w6TdKkpOhb18VgM9+FhV7cI553byzNWt9xcaxN
         XmJm3ywk4PygEwbhfhtseyCCsoHZT/Tkt4S/YH0FFQCLMNF69EEHzc2p/UBuil3yBWWB
         jgmRXSUgP0xzdbYOwl/2+S4gh8vvj/jmIGFnUdf/VaCMb8vroyaQycP8OywjhUzt6HuU
         qNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936321; x=1785541121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUkrcS3bT47EateKo7yg7zIM6h/BJq/nEtdQpmc8z04=;
        b=sIzK90tSfWOUe0YFL7a51YDhYhnyMHzI8cSicCRO4vfdNyCGXxl7FxCLQRmpi71+Ff
         uG91hH7Zeq+IB7seXHpD5XyFdG8FJMkc+xVhLarhz8mlYB3W5ub0mdJa4FGZ/OehO+it
         iW+JuiEOmQ5V3n4Le3qGa7WLwp1J+VPebc/Jev66WGf8/9v47RO01pFPgdYE7nTgyiUK
         NulJcSm3CjZDHmFjvk+UUZVV4swkOqDxWT7/pPrRY98x5+8JRlWzpkGl74WoepFfYZoO
         a2cljea2Zhv4tUx/BWDpJNo7hmGvpZe8aS/Mh2YKvdAdIKR/gN0qI6pPKDMEK+0m9YAI
         uAqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfOzOeObKWqXemmVtxIOsYmUD3nxVZ9f3ukWmGeyL1pMXmPU9ja9PbZMFMZ59wxc+eUHDuBHWkStK9UvehcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg2o30PdJWJun2eQyPKMW8jMD/WTSPfPyXU/RXPXDei84w5FBH
	+H/7QK2n2TB6VYuliFGDaIwURladTuEFvkiPfbxS2+0p4L7qIUHCoG2x
X-Gm-Gg: AR+sD12ghC9NPO3Wr6NLZkl0C/8VuPPD7/fcIv536uyUoKYSOlGPeRYOyxL2d0Z5c18
	SeE/ObITpo0jNJS4PvPqMKIrOoyrRBj9bsTnDuDNMhghEovdFg9jCD3gYJLB3wWXQttmL37amdq
	/hQbBLyA+9imjf4aEK0hlhpI2Z9VmcdwrlnBtcirUuOEIE7VI4WfRD4rEUl6/BjN7MCWrlxpyUG
	wTQewYoIEzznQ5jo0AR/5nnq9mHII3WC1ZSM4w3eVbYjr6ikce5xZl7CHNjsFUpIphTzT0o7Yrm
	reAOL0WTUbDITIJxXE8LSp2WgtgYMzgnO0CygxC7PijArQd8zr3TmF4EENKeO8+x5ep8bFJHUsW
	RshGKXvklE83RLlmfT9pL1vdUUUVdrTGfFnJBVMPEEBzgJsud/UVgMH2Q1DpaQT8tJE51Dwfd0W
	TKvh1iUtaNTev9bBRvtSjr5Et8tSrOHEYrFwU+ChfYkBO5qgGQMKda+TTE
X-Received: by 2002:a05:600c:4ec8:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-496b56f3705mr3664245e9.9.1784936321038;
        Fri, 24 Jul 2026 16:38:41 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5f35a1sm72226775e9.0.2026.07.24.16.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:38:40 -0700 (PDT)
From: Cian McGuire <cianmcguire167@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cian McGuire <cianmcguire167@gmail.com>
Subject: [PATCH v2 3/4] rust: list: document safety of List::remove
Date: Sat, 25 Jul 2026 00:38:24 +0100
Message-ID: <20260724233825.1321247-3-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724233825.1321247-1-cianmcguire167@gmail.com>
References: <20260724233825.1321247-1-cianmcguire167@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The call to `ListLinks::fields(T::view_links(item))` in `List::remove`
had its SAFETY comment left as "TODO.". This call chains two separate
safety requirements that need to be discharged together.

`view_links` requires its pointer argument to point at a valid value.
`item` is a `&T`, and Rust's reference guarantees mean it is always a
valid, non-dangling pointer to a live value of type `T`, so this is
satisfied without needing anything beyond ordinary reference validity
(`view_links`'s own doc comment notes it "need not be in an `Arc`", to
head off the assumption that anything more is required here).

`fields` requires its pointer argument to be dereferenceable. The
pointer returned by `view_links` is guaranteed dereferenceable by its
own documented guarantees: it is either the pointer from a preceding
`prepare_to_insert` call, which itself must point at a valid value, or
it points at a read-only `ListLinks` with null fields. Either way,
`fields`'s requirement is satisfied.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
---
 rust/kernel/list.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 406e3a028c55..22b497eb10c0 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -599,7 +599,12 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     ///
     /// `item` must not be in a different linked list (with the same id).
     pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
-        // SAFETY: TODO.
+        // SAFETY: `item` is a `&T`, and Rust's reference guarantees mean it is always a valid,
+        // non-dangling pointer to a live value of type `T`, satisfying `view_links`'s safety
+        // requirement. The pointer `view_links` returns is guaranteed dereferenceable by its own
+        // documented guarantees: it's either the pointer from a preceding `prepare_to_insert`
+        // call, which itself must point at a valid value, or it points at a read-only
+        // `ListLinks` with null fields. Either way, `fields`'s safety requirement is satisfied.
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
         // SAFETY: The user provided a reference, and reference are never dangling.
         //
-- 
2.55.0

