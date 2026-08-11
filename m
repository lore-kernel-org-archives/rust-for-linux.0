Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529BB3603C2;
	Tue, 11 Aug 2026 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473367; cv=none; b=C+ouSw3I9bHvpX7V4WJbvnaDcpX8K8OtZde/lZ1QB/rfsQ6KXdz2ZoOG6Za7vJdYLBQmyOxHx9PxC2scA3m13E4lC6wWMuQ3rDldhoxBVJfgIDan9JtHSXNhGOKQV+nfSZX0Wh9GjX1OgyDrB8KiFlLAjTrKVfPoeR7v0s0IPpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473367; c=relaxed/simple;
	bh=bcDNjEdQaPQPkOY5VGsJziPTr311stazIQAzHgxRWr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SF9OnFsUs8XhG28YH9uFE6+TwHAaFEHVLq51JHoDku/Bv0Fzwg0UucUUA1x15hgKB4ltAMDUPDaG2y6F9BT36dKPcd4v15NzISkp/qZQJJmP/ylNab3RxYjGGKqs1CCW8Lp9S02FfJAoozcEIUNg7S0SAhbrRko3Vx9ulApsJ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maHL0IRQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maHL0IRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEE9CC2BCC7;
	Tue, 11 Aug 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786473366;
	bh=bcDNjEdQaPQPkOY5VGsJziPTr311stazIQAzHgxRWr4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=maHL0IRQpTRHWcJeW8WQlqpBl9Aw/9zs1OFRvRR+sE9bUPVcpnPYRJKtOnt4XCfn4
	 BokCnUjclwciM9RvTmf+fWAhhmxQjzNehJ0oGSuxrEpT7GCIAIPTpk+8eNihEJ0+7i
	 75KHkj2DSrvJ31GI1fFoMxSzNbgeARzIg9h4yh8zDjwLabsrpq5FJJT8md0hc9kZXR
	 3jVYbsNhBUQrKXwjoSXg9HoDB9q+rx+HF57QksId+UNJQ8r+yjrudlKIN0/KifT5xC
	 ezPj+4joeCWsLixzG+hYmw9qDyorbBJInx49yeWyrtq4cDEXDg8P4yqSAXGOakQ1TR
	 CRGiZvv60pylw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9606C5AC67;
	Tue, 11 Aug 2026 18:36:06 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 11 Aug 2026 19:35:49 +0100
Subject: [PATCH] rust: sync: completion: document Send and Sync safety
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-docs-completion-send-sync-safety-v1-1-0bc663ae967f@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBBFr0Jm7USKsVGvYlyU6QA1OiWdYiCEu
 1t0+X5e3l9BOQVWuFUrJP4EDVEKmEMFNDjpGYMvDE3d2PpiDPpIihTf44tzcVFZPOoihOo6zgs
 2V9sZ6605nQlKZkzchfl3cX/8Waf2yZT37m60Thnb5ISGfYop9EGOadKMwnOGbfsCZZU9X6cAA
 AA=
X-Change-ID: 20260811-docs-completion-send-sync-safety-296f16d6135c
To: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473365; l=1455;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=lUXX/8VrrDvj2MH58FPRom93+MLZWViupLexp9ZgA1g=;
 b=/TKaSloBlVR3N8B0kkRVoB4Hh/LFDdl6iHWe0C6esiacLthEpsQQfCSyCHDJ2PZwKBu3GZSYb
 D+W50kmgmhhCuR8HviE1KGKQHebeSl94EHUZ7ZkRONSiJAgGhKJzfAc
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

The existing safety comments only restate the guarantees provided by
Send and Sync. Document that completions have no task affinity, that
moving an owning pointer preserves pinning, and that the C API serializes
access to the completion state with wait.lock.

Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/sync/completion.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..b5842f04887b 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -69,10 +69,12 @@ pub struct Completion {
     inner: Opaque<bindings::completion>,
 }
 
-// SAFETY: `Completion` is safe to be send to any task.
+// SAFETY: `Completion` has no task affinity, and moving an owning pointer to another task preserves
+// the pinning of the underlying `struct completion`.
 unsafe impl Send for Completion {}
 
-// SAFETY: `Completion` is safe to be accessed concurrently.
+// SAFETY: The C completion API protects accesses to `done` and the wait queue with `wait.lock`, so
+// the operations exposed through shared references may be called concurrently.
 unsafe impl Sync for Completion {}
 
 impl Completion {

---
base-commit: 8fe5e5f62bdb9660999449a4b5eaebcc37d7f842
change-id: 20260811-docs-completion-send-sync-safety-296f16d6135c

Best regards,
--  
Younes Akhouayri <git@younes.io>


