Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DA23FE36A;
	Tue, 25 Aug 2026 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660257; cv=none; b=gsqueIy8eo0MGYTNdk817NBO/9htm8sVB+3AqWPwqPjaHxeAm0y8FV1+YHgzdjs9fvwOgJmKR3WR+76VciNdgHpgj8TrKu5wBdvlzguWeIRDF0EPRFCjWaEaK9M3TvV8oI4z/EwBi4Ok2a6F2Ysc2qLKAF9obbxUwr3ixr5bWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660257; c=relaxed/simple;
	bh=CekYQelBSyoWNUa92eYguGVUWsMvey2D13eG9pkdMn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBjxKdGu4whYJ0uAHpHvBn/Csr4Pz2Kp9YjWzZE20at9MGM3+n+lt1s+6ynTG6GDbthPBwe3UBU+GAz6Kibaj/efRRNkUfVM8PljHTs4+2fcMNjwVBq6IVAI4zmaXJDIamkouzHI4W9PsY04yIuq4kPEP99fTnDKat0XLVje4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVaiRKIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVaiRKIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336311F000E9;
	Tue, 25 Aug 2026 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787660255;
	bh=E9PSra3VSH6kKr8A0EJHafgZ+AsnDC22yL+Tdqb5Mgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OVaiRKIxGmjjFj0Ei6jtwknX9f4ucUTIjlQPgb5DoFgjceCr/eBLsBBPy7udPs50H
	 PrQuM7EC4NILTm4kvvWc6CczOr6JImV8pZ6paUxaRD0otUM+k38Pb3kUr3q/xhOmNL
	 lh07GGggtEaDPneYim/zh6kcv2XvFuaMBhT7T+jfNEeSrHpXMDReMhr40Is8nav649
	 G9spac7mNIBwqLX9EQEJ2Owrw7PlWFZdG5YZ+9shvHLHTAwtSbW3PNjztDs/3XW7w8
	 fwSn8qZNHtQNt4udH6IRNNWYjSqi/0XqZPeyfrwDtPnas+4Mckj4zf4eAB/ACowk6S
	 5Ua9BR8AlZy9g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 25 Aug 2026 14:16:36 +0200
Subject: [PATCH 5/6] rust: hrtimer: document deadlock when starting a timer
 in its handler
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260825-expires-v2-v1-5-90411c6217c7@kernel.org>
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
In-Reply-To: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=CekYQelBSyoWNUa92eYguGVUWsMvey2D13eG9pkdMn4=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqjYe9N2SwrzZhZP8MZofe4lVbWY9ymG7+C/xM2
 EPwSwuaOleJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCao2HvQAKCRD6UCkIqsW9
 0B5uD/9/NAJZFlIEF26NrCGOYDblbntX/zdRdEh+a1QQlIMK8G/ZBZitSYfVcnDYOpgRFPIMDfD
 Izsn9Ga7jKGon36Id5z5/wEbvBPaM83cDy4De+7N1fn/WcLM6R+0MXCA6NRbYXzZxOMs7Dy4eDQ
 RM/cuVYev+ARaDgnmbqLtY08K+Kjk0bMWy/dsTv28Ko0izx7YxHhXeruQfstmOa9UeiPlz07Ip9
 YELTAPSJMLBb/F85VHNz97Ul4tHL/y35Pb4gk59FM8OBaDmjabodlIh1xlDEzAXFLnD+9y2RiT/
 Kx715SkEbggcJPp4OvSQyxdfy6BxLBKFhYvxqoJlC+13jkftLVP6+nVox6MDR8WL1t+3JKhGCio
 Sd0cex0RMjoMrXsC8WfaC0vOf55tXYZ9IQypZJeNB2lg/VnF0gDrlwiddGRQPfCPnNlhTweo29t
 l51kvquIIIBgc9wo37H1XYevkLnf+V39FZ+0Z7BaRK8a+nqKh0pJlxy5Wwu8x++M+rrGmtUirVG
 5GBdME4VI3gwaxtyKBF+Je3Q6EaQyK9e4d8Q/ViDWAavoZS2qhZHBN7i7khIRCcWk37PFaKy8CB
 pVinIDTGgxyGFvtVO7zZCr6ES0tgc7tn/I/WVTsF7lguAorBb0r+471gwwSfCAgL/Yk51AYlBid
 IKgZCGhj1DzhYug==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The state machine documentation states that for pointer types that
implement `Clone`, the `start` operation may be issued while the timer
is in the **running** state, and that it is then equivalent to the
`restart` operation. That only holds when the operation is issued from
outside the timer handler.

The `start` operation returns a `HrTimerHandle`, and dropping the
handle cancels the timer with `hrtimer_cancel()`, which blocks until a
running handler has returned. When `start` is issued from within the
handler, the handle is also dropped within the handler, so the cancel
waits for the very handler that issues it, and the handler deadlocks.

Note this in the state machine documentation.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index bdb6aaa22839..2a9abc9f5d8c 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -78,6 +78,8 @@
 //! handler returns, and a restart requested by the return value of the handler is discarded in
 //! favor of the `restart` operation.
 //!
+//! ⚠️ Issuing the `start` operation from within the timer handler will lead to deadlock.
+//!
 //! # Examples
 //!
 //! ## Using an intrusive timer living in a [`Box`]

-- 
2.51.2


