Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9D3C0A02
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828892; cv=none; b=bfqXV8kOusSPJQqtYtEr4TkMekb2nb16r8Dgxxb8R6CYn6RzyhLT/2EsxVLp0WsNxzDB8iI6JdoqDN777atDOGXPseO5F0mt+8Nm917lYK+vilrZ0Uihjyxi6Uy7ZFe1kx4LW1HsdjCtdQnzQ/QGGfeceqeD8A3JEsCun00AeDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828892; c=relaxed/simple;
	bh=MrTkfmDf83gaBbKz1p+h1nqg8TL6yUkib+CRXlnBFDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3Wl8SBNesPnexYqYciWJ9u52rjLtOHlcYskdiVoWKSZmdekELXKDUL/sa5CtKBU/2UrSxPSjhE2A/+vhwWoWb4wpXk7eHzO6Ci3AHfc1fRBGxTNztZP5cKnDOxonHcHze/3y7L09/A5m88Q510DpGZOxMhgzLfG+mIJGEnD8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4iW6iV5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4iW6iV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779828887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTXkVWhfiCkPPMFCSefkBsAtfCVesv2uIIO2EqJJ/8Y=;
	b=W4iW6iV5i9olb6FxJaE7KWDuSZQCS5Vr9l2X5CHEcmTg8i++jKQBH2yaURIFxKQ8pFtP/5
	GnH7oUieCh/EK3z987kPj7jndkNuIPSl2yyVS78pncn7ceZRsef4KQ7obe931AlhMrPCki
	lpe47yeyb9rxZUTiGXIzHqYLzxCsbkA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-Lu9AwNRWOHuA8Wdb23izvA-1; Tue,
 26 May 2026 16:54:39 -0400
X-MC-Unique: Lu9AwNRWOHuA8Wdb23izvA-1
X-Mimecast-MFC-AGG-ID: Lu9AwNRWOHuA8Wdb23izvA_1779828870
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95900195609F;
	Tue, 26 May 2026 20:54:30 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AEE0D1685;
	Tue, 26 May 2026 20:54:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: "Gary Guo" <gary@garyguo.net>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	"Tamir Duberstein" <tamird@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 1/2] rust: sync: lock: Add Lock::get_mut_pinned()
Date: Tue, 26 May 2026 16:41:33 -0400
Message-ID: <20260526205419.1055109-2-lyude@redhat.com>
In-Reply-To: <20260526205419.1055109-1-lyude@redhat.com>
References: <20260526205419.1055109-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: _TD7ru8r9HDrpNQ3NMdnZi4nk6ivLCqTg2kfneBmjdo_1779828870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These two functions are inspired by the Rust stdlib equivalent:

  https://doc.rust-lang.org/std/sync/struct.Mutex.html#method.get_mut()

The idea here is very simple - if the user has access to a Pin<&mut
Mutex<…>>, we can guarantee that no one else can look at the data protected
by the lock. Thus in such situations, locking the mutex isn't necessary to
access its contents. This can be useful in situations like `Drop`
implementations, where we may want to access the contents of a Mutex within
a struct before dropping it.

So to do this, we add `get_mut_pinned()` to `Lock` - which provides a
function to access the inner contents of a Mutex provided a Pin<&mut …>.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024f..5ca36baed34f5 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -190,6 +190,17 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // that `init` was called.
         unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(self, state)) }
     }
+
+    /// Returns a pinned mutable reference to the underlying data.
+    ///
+    /// Because this borrows the lock mutably, no actual locking needs to take place - as the
+    /// mutable borrow statically guarantees no new locks can be acquired while this reference
+    /// exists.
+    #[inline(always)]
+    pub fn get_mut_pinned(self: Pin<&mut Self>) -> Pin<&mut T> {
+        // SAFETY: We return a pinned T, ensuring we don't move T.
+        unsafe { self.map_unchecked_mut(|data| data.data.get_mut()) }
+    }
 }
 
 /// A lock guard.
-- 
2.54.0

