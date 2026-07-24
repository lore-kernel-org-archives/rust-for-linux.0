Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62641377EA2
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 23:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936327; cv=none; b=XQhRvK1SYFBnxntI+tVOEBlA8IkcVd48leruBdCVOla70Nc9USwMA/qlkNcWmhjt6NvTDqDZpBEmXFt005KcmQ3MN4OuKQDC1iLrcCk9XWQQZYKjO5ublRycqOfnqGFQnfWTvbpIr5UAPMkLlQtbyP41GwFQtq6sv9HgywCMWxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936327; c=relaxed/simple;
	bh=52qK/YudMp2ThqOHUaB4gro4ZauViPO4HJFIpihKe48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDLxsrqHnATPJagkFz1JdCU0bQ2X0Brric8Sn3hOIF8t5x8No5FwiG5D7z2DyACeSRFXLclk5wkshgoPc1kyT1N8iI9CXQnuQ1jvhbs+8dnM7UOlqjUon62L8GJvXegwT6UpzbrqQRy9q3y0SJAF+vYAtssiiHux0R27V0s8xZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CugTZW0m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CugTZW0m"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f6de72faso8018505e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936323; x=1785541123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38rdguqgiGdbvLnKonEzw8VooCAv+0ry5WIpDB9PR/0=;
        b=CugTZW0mV18Ctv+vlq9x7ykIAoIBxAuSGC0pGIdHcRNmhIzYHrYqNryisxz2f4oZCX
         J3hyKl/iHf8vvlHjAlJ9vQ+eM/S1KaApAzWqkmdOH6Cnk3W+sbQmfIN3DQps4tZphw5q
         70jw0I1SdTOFk7nBf7+4ax9O70ZPl6Fc0/KAeQDsG+JajOjXVLl2NZkGNNFM6E3yhiLa
         VSYqiuxcgtbkje53NBxbwuv10xOOQ6Aj5q91YtzClRn6YSedpxPmD2pvBhnU2CwFlxoE
         xqtD7NthRrPr7Jl6OZtAU1u9djkAJX3Fn1d8tdymBUxKlnpNAKMmeK4liUn+O1GiNhFA
         12nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936323; x=1785541123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=38rdguqgiGdbvLnKonEzw8VooCAv+0ry5WIpDB9PR/0=;
        b=lL3m6UXp7DsZJ4vqoUfDij1Ku8w8psMCXO06qCqvi9a38Xu0M8cwWqh1xI6gglPiNl
         2MheFJKg2qbLDFj3TIa+4EPni81zXUeiGgi4bpUsi3tVIt7q/Iz0QWBXxcQiZcE/jlN0
         yDWL9H/QW1ffvlLc6Wnr+ByBU5TCdJ0E97bfkv5IxvAoBZJgYxQcEfNJSqsY9XsXXiAa
         JRxEJR3riA8umlAAW6TfUuwQGAdU7dP+4pSUDLbKzMsxwq/7/EniolXR3n67t7C/ihkW
         0GLPfBd/jU2jsnb+bjN6nEDajQksa5Hnb2aWM4nTtoTL4jjVpq8NIVLWBH610txHGohw
         h/cA==
X-Forwarded-Encrypted: i=1; AHgh+RobFjN9gVQX0aT0jM+I9/lKzrF93Df+3YGtwnJJgHeKPRgp2qg7Y2XVOc7RC/jOC0zwgzHaq10lCnZ5oWlqjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymwyErPffxVTjU4LyPxlksisFGIxot7eOREpJorzfw6fzdvFBh
	6asipt+eaKCulmlcp/aZfWvVhC+bptRbuOSQeFJB1mWsoWfsFM4TOcDK
X-Gm-Gg: AR+sD13L//YE2HL355ETFZLg1TOrAFvNHpQAZodmXtDNpm+PH0bcDZGGwdw/OcGDKGK
	Gws7u5Kot4pXyoqY+kIbcz0tx6osYOB/wuDYsjS6k9Rgjq0nvPSLuOSD+ftiAPNn09DQJoKAZ8h
	ApwhLUTEJJ7bpQri2jUF9P/EUgoj6xEadZNugMBn5qAYgR1xeRQzr3yBBU1P040ejc9znHYdT66
	CtB2Ws65qLMe5Y9szl583oFWTEwlyS4rmFE+7XO7cDNZgucJ5RyODSPLvhpdgY1Q2GZNprxFT9G
	pPSPPlFhKHkNoy39S6IposkdkYQeSc2e307ETZhxWzTFfxnuysTATE8ufaBDuTcrqbJzA3+8xpg
	MmbotY80fE1Sp4W3fDqCdCyu8GVi7jH/KgEOlqxwcrO8cGR6dbKt/OfKs3318uo6rJWeh+ny3Li
	WHZhlGvsz34JvWWYxy06SKBmTTxwqEdcyiKfALQdH59f2KTZ9+W1WHkHGPivyhNgUeJzE=
X-Received: by 2002:a05:600c:4f09:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-496b5b438f3mr2190285e9.5.1784936323508;
        Fri, 24 Jul 2026 16:38:43 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5f35a1sm72226775e9.0.2026.07.24.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:38:43 -0700 (PDT)
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
Subject: [PATCH v2 4/4] rust: workqueue: document safety of Pin<KBox<T>> work item impls
Date: Sat, 25 Jul 2026 00:38:25 +0100
Message-ID: <20260724233825.1321247-4-cianmcguire167@gmail.com>
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

The `WorkItemPointer` and `RawWorkItem` impls for `Pin<KBox<T>>` had
their SAFETY comments left as "TODO.". Both traits are already
implemented for `Arc<T>` earlier in this file with real justifications;
these two impls follow the same shape, adapted for `KBox`.

`WorkItemPointer`'s contract requires that `__enqueue` use a
`work_struct` initialized with this impl's `run` as the function
pointer. This holds regardless of which smart pointer type is involved:
the only safe ways to produce that `work_struct` are `Work::new` and
`DelayedWork::new` (reached via `HasDelayedWork`'s `raw_as_work`), and
both are generic over any `T: WorkItem<ID>` and always bake in
`T::Pointer::run`, so for a `T` bound by `WorkItem<ID, Pointer = Self>`
either one bakes in exactly this impl's `run`. The argument is identical
to the existing `Arc<T>` comment and does not depend on anything
Arc-specific.

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
v2:
- The `WorkItemPointer` comment claimed `Work::new` was the only safe
  way to construct the backing `work_struct`; it now also credits
  `DelayedWork::new` (via `HasDelayedWork`'s `raw_as_work`) as a second
  valid path, and updates the closing sentence to match.

 rust/kernel/workqueue.rs | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..2a6bf0b9b83c 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -881,7 +881,16 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
 {
 }
 
-// SAFETY: TODO.
+// SAFETY: The `__enqueue` implementation in `RawWorkItem` uses a `work_struct` initialized
+// with the `run` method of this trait as the function pointer because:
+//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
+//   - The only safe ways to produce that `work_struct` are `Work::new` and `DelayedWork::new`
+//     (via `HasDelayedWork`'s `raw_as_work`), and both pass `T::Pointer::run` to
+//     `init_work_with_key`.
+//   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field will be used
+//     because of the ID const generic bound. This makes sure that `T::raw_get_work` uses the
+//     correct offset for the `Work` field, and the matching constructor picks the correct
+//     implementation of `WorkItemPointer` for `Pin<KBox<T>>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
@@ -901,7 +910,14 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
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

