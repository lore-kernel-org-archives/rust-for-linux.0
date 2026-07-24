Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482573B103B
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 21:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929834; cv=none; b=juMmSF8L//uzTAiMKakE3qtH+ThW0xYzuEWTmzlD+T1vSnl3rU5qPCQTDbquFG7DkJVLBgdwPVnPMaYDnHq3BoZMh6X2Rlt5wpl2dJqbI6UjCvL4dh2vKtIQsIQsrltJEl7l2zKskNmc9xBJntxx0b84iZoKec93eJkuT+hhYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929834; c=relaxed/simple;
	bh=UaWd0QbNGYlF/morEVk7/h2FYCuPAQBFuXLNexSojvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GacKAs/xeC7yp0e8kulv0Kvf5uAwnceFAH8xZm4b2P5guHMME3MJYKwL2KPK0L2fr3hefQjA9SnJbbMjSnE5XYJhxsFO6lbVaxBFcTN7/GrRhFvCfpFZlDlvZ9H3wVAMg5rcLTz2UUb9mIpWT4kBV8I84qj2sOw4TiLz6l50QhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krAa+otQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krAa+otQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso728462f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929831; x=1785534631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GIvJPG8iYopv2L6qw3Pa9hC8iyEnJZIfWHmy5oFTXc=;
        b=krAa+otQkYRgofelp4t8Lqd0OrjbQnFTDIL+OCfJJd7LftO16WIutvbe24Pa+mdyIz
         MYXUCM9iilMbNG5gFuX5rdIDh80DSnN91ouIDokye6kYWpFoyCNuOk1Q9mIaoUwREZbh
         AFrp/3vtUgwCnbzHrOsPURdZ5G+XjGRWehvIiTfYUJcBzSkbRP1o3h/0UdQGpBfy2pXz
         JFCbQh7JMc7j5QyG9kA23AlCxp+yQ2C7KUfWkbHHkjCeCxyweVQJgYsBOhAQK5sjG0al
         FScwtVeRNG66y2J9MJ4jcenOh0XlEeF6HBfgtXN6zNOemO5+FNo1uBr/bWSKE6pUS/u+
         zEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929831; x=1785534631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GIvJPG8iYopv2L6qw3Pa9hC8iyEnJZIfWHmy5oFTXc=;
        b=aUmX09iFo+P5h8tO9x5KIdlSCSr9rGpoiNM+2OQEbYL2WxR/hDKRrPKfyeSfx3qShD
         YXZw/G6GJA7Ot8H36JoXv01+sK0LtUPjZW9pYtmKSg48oDhB5xcXQRpMKmajK1xdQRz3
         LRZt+K5kfAp9C1pyuOp9v0VztHZVJZn5hwJKxwMqD4VdXyl1Mh+R6brI9iUFDcngQoKs
         w2vN+dxn0tE65u84i8gPorWqrCPNq1LZhIhIDsXPD5FlQp3ysnMXQ7Qn46uszvcZNzAD
         DC7IR0DmTnoiFphbYhTyjDHl/K2gqE/RQSrIh+NouPFcG0yNkuO9k27SWKp8gYVQRucw
         Wq6w==
X-Forwarded-Encrypted: i=1; AHgh+Rqcngu4+AnH5rli4uZPIJSm6kgFp8boJ/CZTXIbwsEDiv1Z82fj6unFL022hdcRIKGed5aXKotPpkyVXePzSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTueBtSG+d+sHonT+gU5JpD5NFC/ZEqqFoZmXYrHt+GYl4UtLJ
	Ccpt4repbg8JmRQjefClpqBTNVnuRAkq5ievfPO94mmf3DwczmHuzTca
X-Gm-Gg: AR+sD10pqVRDSBty7K1+Sbu8yVB/Q0hxglXo/7mQGLiFYdjshp6VHOsU8L3btOhiPCT
	tLfkSpGwh6NP75XUEA7vsQbGqEeriYhDaJLv21/JhjNeCWOO6E7liDJpQxyePXBVJwhCU8FfO/+
	HQfo62KsUew9MkNxEgVJBDU9vg03KZB3UF2FdPGZDKkXd6269E1ZKfjYuKHRVnoJPhi399Bh+4t
	SQlG1CANJkbB7EVNSORALbvwbtaCegr0VKysdDMLhBwpZJH+NAPxEmiSP51hMhXPx1xlq6+7xsR
	KFXgnMjBteFkTbxa/2lMth4calBWqjGHhPlqS2wHeAHyyKEvX+nW4WsK5jxrEnsA1p7kHoOC9N1
	GT32VP3Lo74zDd3tDiHkuYOKvHl5gG3uNw9Dqm2VfiV8RWRutT4nL8H8Py75OJZ3LIVg/7iwnoU
	atOTVYMLN9qAlJY4gRXy0Ozyx+22F8K9Bzwt1NFCcEt/gHcUI80uUKTnpC
X-Received: by 2002:a05:600c:1546:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-496b5717741mr918155e9.10.1784929831396;
        Fri, 24 Jul 2026 14:50:31 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm17588265e9.0.2026.07.24.14.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:50:30 -0700 (PDT)
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
Subject: [PATCH 4/4] rust: workqueue: document safety of Pin<KBox<T>> work item impls
Date: Fri, 24 Jul 2026 22:49:40 +0100
Message-ID: <20260724214940.1070221-4-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724214940.1070221-1-cianmcguire167@gmail.com>
References: <20260724214940.1070221-1-cianmcguire167@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `WorkItemPointer` and `RawWorkItem` impls for `Pin<KBox<T>>` had
their SAFETY comments left as "TODO.". Both traits are already
implemented for `Arc<T>` earlier in this file with real justifications;
these two impls follow the same shape, adapted for `KBox`.

`WorkItemPointer`'s contract requires that `__enqueue` use a
`work_struct` initialized with this impl's `run` as the function
pointer. This holds regardless of which smart pointer type is involved:
`Work::new` is generic over any `T: WorkItem<ID>` and always bakes in
`T::Pointer::run`, so for a `T` bound by `WorkItem<ID, Pointer = Self>`
it bakes in exactly this impl's `run`. The argument is identical to the
existing `Arc<T>` comment and does not depend on anything Arc-specific.

`RawWorkItem`'s contract requires that pointers passed to the
`queue_work_on` closure remain valid for the duration `__enqueue`
guarantees. This one is not a direct copy of the `Arc<T>` case, because
the two `__enqueue` implementations differ: `__enqueue` here leaks the
box via `KBox::into_raw` before calling the closure, so the pointer is
valid for the call. If the closure returns true, the pointer remains
valid until reclaimed in `WorkItemPointer::run` via a matching
`KBox::from_raw`. If the closure returns false, `__enqueue`'s own safety
requirement only permits that when the `work_struct` is already
enqueued elsewhere -- but `self` is an exclusively-owned `Pin<KBox<T>>`,
and ownership is only ever given up by enqueuing it, so it cannot
already be enqueued while this call still holds it. That branch is
therefore genuinely unreachable, matching the `unreachable_unchecked`
call.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
---
 rust/kernel/workqueue.rs | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..0a525746028b 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -881,7 +881,15 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
 {
 }
 
-// SAFETY: TODO.
+// SAFETY: The `__enqueue` implementation in `RawWorkItem` uses a `work_struct` initialized
+// with the `run` method of this trait as the function pointer because:
+//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
+//   - The only safe way to create a `Work` object is through `Work::new`.
+//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
+//   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field will be used
+//     because of the ID const generic bound. This makes sure that `T::raw_get_work` uses the
+//     correct offset for the `Work` field, and `Work::new` picks the correct implementation
+//     of `WorkItemPointer` for `Pin<KBox<T>>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
@@ -901,7 +909,14 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     }
 }
 
-// SAFETY: TODO.
+// SAFETY: `__enqueue` leaks the box via `KBox::into_raw` before calling `queue_work_on`, so
+// the pointer is valid for the duration of that call. If the closure returns true, the
+// pointer remains valid until reclaimed in `WorkItemPointer::run`, which reconstructs the box
+// with a matching `KBox::from_raw`. If the closure returns false, `__enqueue`'s own safety
+// requirement only permits that when the `work_struct` is already in a workqueue -- but
+// `self` is an exclusively-owned `Pin<KBox<T>>`, and ownership is only ever given up by
+// enqueuing it, so it cannot already be enqueued elsewhere while we still hold it here. That
+// branch is therefore unreachable, matching the `unreachable_unchecked` call.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
-- 
2.55.0

