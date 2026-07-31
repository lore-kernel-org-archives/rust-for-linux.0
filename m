Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE01638A701
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529874; cv=none; b=fqVzyAYNZ+dVmnxAgg4PUut+nP5PLTe0wXISs0MykNNq6lWRQKi0m4cudSEpOmhuVF/fr4HlyyjmgSbeDPKfuLtWYnz6VP8iuzjKKC6/fqiL3Uvbx2L05KhQOtt63+qg797xoi0hBwtvT4YaqlFhl7k8QXXALWN1sY5b4MCr++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529874; c=relaxed/simple;
	bh=/R9Xt2cq7wR9LFr7KE/IiwroZVU+4G7lhcrzcWPSLzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z1lHIxYp+IZcuiPjrR6BBrP3EHXEJFHZSWdIDfOSEbRvKjykYqtcn9TH38j9Mjn9+87vdwhGJnpAjx/ir/EvQNVScOK29IS9/RYcSLjbVulPw9jw1nPDjeiv1a+xugo30w33+/5qU0JpJ+75/gqVSNxhvwiY89iH0F3NiCoNQ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHAOdbwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHAOdbwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FD01F00ACA;
	Fri, 31 Jul 2026 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529872;
	bh=yS8RNIIgYjKxdhvNp8TorwPekD/QFVeixdVx0VMVBqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HHAOdbwaPRnuPgkWwGKGLx/kAs5QH9BjzRlyvjTMak/YpUTem64q61grCCTFMC+bV
	 UbjzT3RMv8POgW/sDtcGbfi+L2kblk4KBxKtXM3SZ66O9nTe3M3M/fifW4Ht4dzhQ0
	 8762rSYkNTYJIRnXNNNcSjmvynSXfqUdCpo2ToC3rMZHEXeW1KWyFb8Q/+p3Z+1uet
	 CSaqk+6lrBbG6T8M4rxQ09RtIOz0PWEcuG9ujLRvozR2V/Qqa9FCygOcMQKH24gCW0
	 mCSR5EJLCz0jlJARZ33UW9CJFL1e0rfqIZkRum2T1svxk84Dv5do2Oj2Wx4bkahOm1
	 M37wObdArrfeA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C78AFF4007C;
	Fri, 31 Jul 2026 16:31:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 31 Jul 2026 16:31:10 -0400
X-ME-Sender: <xms:DgZtagfYn9O4_iWrdqPSkYRdbm0wQ8AmjmNcDFml-MJOsP7qyDbtlw>
    <xme:DgZtaslZznZOu8O6vLBULo4afIhcJXqksEdqc0110LjLPQiFHZ2_By2EN5JlPdNru
    KfQKGfCVAuHnv2oqE26xUKbfBJG49LuN9rYpsWLRlyZYGExgi5H2w>
X-ME-Received: <xmr:DgZtanpwmbqfE3I6RjfDwTkWKQGr5sIcNreGNK1A6D1L9KC4mzICJSfw1n5MBZAJ431wLMFhRRzBJEaY_TBrJOJBoEMNLihx>
X-ME-Proxy-Cause: dmFkZTF86Va7Dqpiv0HRB/Rt3CM1ZfwUI8sFdbNEysl2vjWzKGQHPL0vtJNxMWzwq4RCT7
    5MXz8yAQaenZ+l6ReNiQBMk90me+gM63MoAJ/OG6881cu1guy8MfcdgMgPRXqCdnOwY3UU
    Yre4T7XNVpX+hYLj1cR+5sDPDlXBwMgddj0S3Pt9EBEeMQP2C2QxRT89euxxh1RusxuOUE
    pjdPkRkdvSWh4KDKL7SA/RMgPi4/GzhXt7G4+N2ySbTjJeyTz6zE/2g6iZFhSAe8C+XsYy
    rTsuNdtrWKoEzpDq2SUPcIxKOwDbQW+j2sU4NoAonSXuB6sJUYCYCWtPGQc2h06l1wGha3
    VbqFlrpaSvkUv4cSFs/CIJZekmAwTH7l3kfd4bn136EBs1v7idVNEtI9xOp4t/6dYFYoZj
    HNOiwWO7BCYFcV86/PgAej8VCrrAn4x35QwnZ5IqN4BBMr28qVpGCj6kJN1xx4dwTLLt7l
    kFyGCjoNvm+ex0wlejYEREQe+6JPMXlzrlNlFaNFyE5mQoTWk3m4OxcpN0Oag2DIM720KN
    jP/YnkStKA4tkGWd+eCWSdlduwDEMcYWRoClRGFG2purHU6z0ts5HIiGTGxaiKe4iJY6lR
    megd0Ra+E6E9h6NTlhpvMgCOjoQcrVUbWV27mPjlI+HhP00RxJSjNfa7zK2w
X-ME-Proxy: <xmx:DgZtahGkQeb3UNVsPxWzTYq3rf1X5q-UXq5iW56AEZpbCAjfAYc11w>
    <xmx:DgZtalQmMZUjbakWLVACLIOpls7Dj3A5YokefBmNVJeLsLdF4LoJsw>
    <xmx:DgZtavM8dw9GgJ-vgZE5qkh46oInFJZEePVHiOmGuJTxx2qGHBNfRg>
    <xmx:DgZtaqm1bgE2_dxa9c-opZiSypTOBKxfZ5q0homd-gIQb0Y5MWkY8g>
    <xmx:DgZtapb-tm-KZMFKcJKAvqEUnmYUCzIx__fD6WCNSFeKtCT2vpvZ_yCi>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:10 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 21/24] rust: sync: Use safe synchronize_rcu() abstraction in poll
Date: Fri, 31 Jul 2026 13:30:22 -0700
Message-ID: <20260731203031.13679-22-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philipp Stanner <phasta@kernel.org>

We now have a safe wrapper for the foreign function synchronize_rcu().

Use it in poll.rs.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Onur Özkan <work@onurozkan.dev>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260624150704.1504001-5-phasta@kernel.org
---
 rust/kernel/sync/poll.rs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index 0ec985d560c8..5aa0ce9ba01b 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -8,7 +8,11 @@
     bindings,
     fs::File,
     prelude::*,
-    sync::{CondVar, LockClassKey},
+    sync::{
+        rcu::synchronize_rcu,
+        CondVar,
+        LockClassKey, //
+    }, //
 };
 use core::{marker::PhantomData, ops::Deref};
 
@@ -99,8 +103,6 @@ fn drop(self: Pin<&mut Self>) {
         unsafe { bindings::__wake_up_pollfree(self.inner.wait_queue_head.get()) };
 
         // Wait for epoll items to be properly removed.
-        //
-        // SAFETY: Just an FFI call.
-        unsafe { bindings::synchronize_rcu() };
+        synchronize_rcu();
     }
 }
-- 
2.50.1 (Apple Git-155)

