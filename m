Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB32483824;
	Wed,  5 Aug 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947348; cv=none; b=SaWLZmamvwhevPgqhJaNW7Ej2mCTKOfVE7tbYhapuwyMBEgY4TdICzIfIsWNiSSEw3RaquZ0kd0KAHDV/Q4XCYvCBwxxKeFFA0+uQarxC0Q9/r5AVpt/FrnMVFcdk0z601VTFHrlKmONFy4bJgWsVKIetApDUqmx5x2BtnUKKLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947348; c=relaxed/simple;
	bh=mPEM91KUXeLIKkK0x44aIiEGCFfBFkkupCERjPTwwrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DQCOmmQL+yVpzhi3ujSG94IlK6AEjPDQkrhePsQtTH3JDAT9xPweW8QRRq8gSYtpwc8tqtloFm8laFhefBh0TQRXt+eNQMaw5WRPAl1Txf3Y+yvuAMoYOxvPf96RnszPbJH1sLFYxXjY64w2pLFvDD6TGGz0imeEdAZk5T4yOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAHvYEKK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAHvYEKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9941F000E9;
	Wed,  5 Aug 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947345;
	bh=DmP6xQCHOKQgnic6zEyzMlMnp8CXbn9EWT3jAz8M1II=;
	h=From:Date:Subject:To:Cc;
	b=kAHvYEKKAk8bpPclqOZhW3gSKsQI6ZS4bDChmvxnlZCp30xFF8Y3+HoYH2VXCwPHq
	 q9xbv19oRCg2s0ZGlw0wcY4nFxwU1nTwfn0+SDnuxIzBAfe69/y0xW4muoYdRtXN5m
	 69YuCA8NR8s5ZlH70h0H5x44eHjJELEE9cjWAKGSh3lLB4rysRJor241i44gu1u2fi
	 jCtD0Rv2+VOtxNEE9L/HbBFZlWA1j1wIG0eJHFfsE7OfVmlV44s2e4amWC1s9wVpXl
	 5J86IpDI0hEom9Ib6BTbMel2MjGvM9TITaxfgt/uTKeQDEtIxDM4ZN0ClEKGOKku0b
	 BZ+640mkZIWuA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Wed, 05 Aug 2026 18:28:45 +0200
Subject: [PATCH -next] rust: poll: fix compilation error due to
 kvfree_call_rcu changes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org>
X-B4-Tracking: v=1; b=H4sIALxkc2oC/yWMQQrCMBQFr1Le2g9pihK9irho4lO/SJT8VAqld
 zfqcgZmFhiL0nDoFhS+1fSZG/SbDuk25itFz43hnd+54LZijzFKmazKRWeJffAhcfB7DmjNq7D
 p3+8IyZwrTn9tU7wz1e8L6/oBF0MgZngAAAA=
X-Change-ID: 20260805-slab-rust-fix-b1828ce329e3
To: Mark Brown <broonie@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Harry Yoo <harry@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hao Li <hao.li@linux.dev>, 
 Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>, 
 Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-next@vger.kernel.org, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.15.2

kvfree_call_rcu() changed the type of its parameter to kvfree_rcu_head
in commit acc6fdade62c ("mm/slab: introduce struct kvfree_rcu_head for
kvfree_rcu batching") in the slab tree

Meanwhile rust started relying on the old type in commit e5e86df8b666
("rust: poll: use kfree_rcu() for PollCondVar") in the char-misc tree.

Reconcile the two changes as suggested by Gary [1]. This should be
applied as the merge commit for either slab tree or char-misc tree,
whichever is merged to -next later. The code it changes comes from
char-misc tree.

[1] https://lore.kernel.org/all/DKFF147BG8PR.I12RKSRFQS1B@garyguo.net/

Suggested-by: Gary Guo <gary@garyguo.net>
Closes: https://lore.kernel.org/all/20260731075644.20215-1-ojeda@kernel.org/
Closes: https://lore.kernel.org/all/20260731122826.737703-1-spasswolf@web.de/
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 rust/kernel/sync/poll.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index 684dfa242b1a..f3cdf95db12d 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -124,7 +124,7 @@ pub struct PollCondVarBox {
 struct PollCondVarBoxInner {
     #[pin]
     inner: PollCondVar,
-    rcu: Opaque<bindings::callback_head>,
+    rcu: Opaque<bindings::kvfree_rcu_head>,
 }
 
 // SAFETY: PollCondVar is Send

---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260805-slab-rust-fix-b1828ce329e3

