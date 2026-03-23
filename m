Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC938656C;
	Mon, 23 Mar 2026 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308475; cv=pass; b=ElYNXOs8GXYPdYck4q3EuZvHazn9NRKlSXc9WuiOK99gv1sgaX8ZE/peYXavVY/7ICaHfBW7PDYWtIY1IC1JDpCCOjER2p/LUQN0ygCwvItx8dIEb8t0OM1o/qMlC7ah7TquDs9E76BixEUe5zxZnJOpTg6PLw+oPJVH9MIXizE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308475; c=relaxed/simple;
	bh=j2sACktICz+B0u+QUJrYfCFZZlLghdbCC9AmBrT/Gg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDVtPUzXjeQXgkn1Qx/aYkeM6Uo+nkSN4N3sk7dHxfbulb3v7pMC6jaG0J7WHdMRZ+CR+Ga+CADUNSNoNvG47a3Q1fwcqVx+OKy5iNtSHPXuXAmm9ILJzQcZ+ODDZmKTQsxqXG+dokgZfgYBMuq/ply+K9mIWKddUrtWGmCAiM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MC0Zvl9m; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MC0Zvl9m"
ARC-Seal: i=1; a=rsa-sha256; t=1774308460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=df0PnsAi/fYQoxvhh62YTfmt+gDZNAZGU6KOnNTPlqWJ4SIdgLm6OguBWC3LOmMmk7Ld1lx2GxQ/vfQTxGe/dbuC9R4rY14qUA4h5v3cr/PvreRgMVSIaQPB9/A/zLu+94ghUtGfsVsbbh5qWP7v1q0X0IcsWqfRxiS+86tp6oY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774308460; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B9GTeddBPRV1DGgLqH3Ls9PLkdYCJyyYaSiXhSEZxIo=; 
	b=ZuVP2nEfLGsgfjTzd49li6FuBEzElQOyGQq+5gWF/i4QLK56F9JBsDC7TyFA8Rvx9jdECFch8jAX7bDAvRL/B7zOaNONTdnDaXt5N5nRYZ407mkauxPGFMBGNrxcgQz3i5fL1DYWDFObWeTvVkfoFnWtqgzTQSlglJPIjHahccw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774308460;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=B9GTeddBPRV1DGgLqH3Ls9PLkdYCJyyYaSiXhSEZxIo=;
	b=MC0Zvl9mdBvmOwxtnsQ8bvSiKxQw+u4x9blxgOtHjIX9aWrwLQrGUGso3d8UE2qu
	NRGatnyplaMe/6vdIczwB6tnh6wPPXMG6h0CkpdC5rrCnohyvhww7CP/lIA0FKo87sP
	L82rW851feDinN4ESK66VTfsUfhTBgnAe8KSkLdE=
Received: by mx.zohomail.com with SMTPS id 1774308459125951.9327010750577;
	Mon, 23 Mar 2026 16:27:39 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Mar 2026 20:27:01 -0300
Subject: [PATCH v3 3/4] rust: workqueue: add delayed work support for
 ARef<T>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-aref-workitem-v3-3-f59729b812aa@collabora.com>
References: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
In-Reply-To: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

The preceding patches added support for ARef<T> work items. By the same
token, add support for delayed work items too.

The rationale is the same: it may be convenient or even necessary at times
to implement HasDelayedWork directly on ARef<T>. A follow up patch will
also implement support for drm::Device as the first user.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/workqueue.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 6ae7f3fb3496..4ee4ff567197 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -1007,6 +1007,17 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
+// `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
+// the `delayed_work` has the same access rules as its `work` field.
+unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for ARef<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasDelayedWork<T, ID>,
+    T: AlwaysRefCounted,
+{
+}
+
 /// Returns the system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are

-- 
2.53.0

