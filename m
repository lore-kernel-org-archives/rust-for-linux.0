Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E582063FB;
	Fri, 10 Jan 2025 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540263; cv=none; b=BgRt7Cx7aTnCxCMfgprwfTm5nKTqitnYPn6waGZWD+ewQ8Jr0jL5q5FRw4viXJrRWtKbF//OSgnVYQTpnpiI3r3UpwX4fl3ahYJjStugOnTn2NmzlFvIcGMa3tIauveatK8q9JOMB8ycfOJiJAkqCYNmV/Djx+fXgIWD3+JGf5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540263; c=relaxed/simple;
	bh=aU3i369UGy3y1q8jWHIGozb7YdRezhyOhvtwK08LAa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5HGkk9aZNsfeparG4kMAaNxqR8eBOrORaEUI/GweEUdMGOq7XnppJIH+/YFH106wMNJCEk6bUBnnW/qZ/se+bIgHdLPqS7Es6nozFGsf2jUINfQdO2LBok8Gz0W+a5LQaZ+10quWiEEpiBOUJG15tVGe1XkuGlsU25GpriNj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwZbVymm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwZbVymm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE89BC4CED6;
	Fri, 10 Jan 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540263;
	bh=aU3i369UGy3y1q8jWHIGozb7YdRezhyOhvtwK08LAa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pwZbVymm45Tm6p1Iut4Amaj3bR/FhIHPQh082TcyoFXaWUgsa6gFVx7cJbfAtG1YG
	 5PAuBfMsFKGnwOdyv0H0fgVYo/wwBEA1D+Z/OKXOSttxN7OIlMtwp8I1aZciy+HNLu
	 hZTL5zM79DEMRyiFQcuzjdzk4jSgGQybdgUxSilV0UDVvLYN2oN2UVJQjFKafM+c9C
	 6YdyH18j3t44hN2QJykXXhqFkr1AAyfOO6xvMgR/dpcucG/ug6qhrxoAGYfJXZIZ01
	 sl2PcjZsNleRIfjGxbhPonQGiSuKqXgSwASVjUcciCHv6MQi4S8jkZ5w7g4XMM3ANn
	 3kihKVQV3bTcg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:26 +0100
Subject: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=aU3i369UGy3y1q8jWHIGozb7YdRezhyOhvtwK08LAa8=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/hTO1CSieyfVZSB6Qki2DBY/nYSd8Zls9sP
 ROkhjjVnFiJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/4QAKCRDhuBo+eShj
 d2CCEACgQeBXdnCmpZnOa5JMa8yndJLhY57/2Calqg5+6/MumfGBETDL7dZkc6sIfTNR6CnYSWk
 VLM8O+o73HJ4CO4bauopE1MF9hTUm1qCHmX25bYlkQis5nmO8YaNCcG2z22E7HaQuS7mJwJq8DS
 GrQtAiRuFZ2P8g398qtDJOfR6lKgOYBqQbcHeUzZAlZqy2UPftVB07RokAwbnN+rxHLZH4aXWrs
 N5bnxxe6sg97alHhgxrHElJIDSDGHO1iZkiLMn4dCzhr/gTw5O/m7C7iVcUjwHXt0rk8XQiA6jt
 zzdKy4Z2eVJuLQ8r1Ync7Q529MuzQrJmXalff2gY6SkFWsmTGSguixsOCkIGiF4Mf1GwQ9jimg7
 vYoj6MVfDVwHbHZJ++DxqO7yapxujMPLRsvpSdFjIsGLYT9PpTl3PjZfDv8dIJ6JRbta6yUC2ta
 rBaBh/4CHeq57be7eotKBMP5/IUwRxHfqgoZ4Y4xhENVrTNPIHOP7pZz2r1P8jJG14P8PuyDyCf
 tr+hhGDGuCUYxZ/DLbcQ2pXhyZqImbYK1KRRecMEkaGS1lDKti2mQmhKm/9Em4480nELVok4O+N
 MTv1NFrRvYFc82dfESf/GvGCoKz0dWXOQYZ4ACejN3h6jg5Ijx2tJMS6nCuzRkdsEJ3zAjZeRAQ
 oQNxwUEO0zhEclg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to get a pointer to the data contained in an `Arc`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/arc.rs | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index fa4509406ee909ca0677b78d5ece966089ce6366..3d6111ddb007285b26eca2177a412033f4ac5dcb 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -233,6 +233,15 @@ pub fn into_raw(self) -> *const T {
         unsafe { core::ptr::addr_of!((*ptr).data) }
     }
 
+    /// Return a raw pointer to the data in this arc.
+    pub fn as_ptr(this: &Self) -> *const T {
+        let ptr = this.ptr.as_ptr();
+
+        // SAFETY: As `ptr` points to a valid allocation of type `ArcInner`,
+        // field projection to `data`is within bounds of the allocation.
+        unsafe { core::ptr::addr_of!((*ptr).data) }
+    }
+
     /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].
     ///
     /// # Safety
@@ -508,11 +517,11 @@ unsafe fn new(inner: NonNull<ArcInner<T>>) -> Self {
     }
 
     /// Creates an [`ArcBorrow`] to an [`Arc`] that has previously been deconstructed with
-    /// [`Arc::into_raw`].
+    /// [`Arc::into_raw`] or [`Arc::as_ptr`].
     ///
     /// # Safety
     ///
-    /// * The provided pointer must originate from a call to [`Arc::into_raw`].
+    /// * The provided pointer must originate from a call to [`Arc::into_raw`] or [`Arc::as_ptr`].
     /// * For the duration of the lifetime annotated on this `ArcBorrow`, the reference count must
     ///   not hit zero.
     /// * For the duration of the lifetime annotated on this `ArcBorrow`, there must not be a

-- 
2.47.0


