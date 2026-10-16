Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF75616AC
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171143; cv=none; b=dstLk8dzmyonA3sRMrYmR07kZlLaCysjMmWSYc5BsAy5ot2/itKDXl/ymS8rqpX7ZkZX1tD1ayfSZnQ+xdlDA4TUE5Df14lcqSbT1MQ+xNTZknbdDPeWIeHv20xtEv7aV58IR4m8f/KFNdHkFQzlCmRJF0dNaplgfa3AoaJ2ae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171143; c=relaxed/simple;
	bh=dCoNr52TKACm2p/oCH+3JThbV8HfEWy42Og0vNiYIos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sW2S9PpAqXvCa7UWPgoanyBP1cMKu/ITgv5XUD50lQnGRxhZFE0TCWanFI9QnzR19PLlBQgSLxXkCkTrgYsuAQTK7fkcldwrWRf5kLaChSJ8bKq9lqs4vvn4Cterx3ELiw2vVOl6DAP8WhegRmggReY3HZlsqQSnSZO3K5+AD6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=W3npdIS/; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="W3npdIS/"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso221996eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1792171141; x=1792775941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUZVwJwXtHxNPkH93hu4ssfjbOn1aTg8s8YdaPCcYyY=;
        b=W3npdIS/bn3P4c3S0ICIU4uMbrcN66F5CCrV3WLAvJfpt6bMgZLVZRz5gKbi6IJlGR
         dEraeX/yOLcKu+G9ZBtbFM+mFItA3mXYqqW8KfLxEiMt2h1VhZeMZdn3hrdrxnb+zRTA
         PT9HUxJwcvWek0C0eNaeBNa4dQIXxyd3UN1GLcrZPmlpFCKWWy5i3ftAeKM1pXIEnkjA
         TdutNdlaqsaegqmDGyEdwnjrFrqUFLoSTEhj0Nc6mgGanSWbTSweFyYEVjt6hdQxySnj
         SsCQOEipIbP+0VGBukaWVSNyIkvnJvcLL5CF3LZ5F+zPJWB7LVc1LltgQogkMpqD42EW
         amMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171141; x=1792775941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUZVwJwXtHxNPkH93hu4ssfjbOn1aTg8s8YdaPCcYyY=;
        b=S7ib7ovIMa4X0hlAgbsdi7S2CMWyUtGysLEUp88x6ogBGYPbWR57BkXT2/TUKyBDIJ
         eyple5E8pKkkwIAtU25paQjmBqprh0X+H4LjpebmW87AK7ybuwcJdBqObU7M5jwct9Zc
         fRQBj7oPCPTyWmuOrxrybnnyS1PJdkyyM+St/qEt8ojn8y6cxkPjNh8vd3LHiwbxiuax
         Ne1SVFEMCiA/ZvocTB9FuVfTt3KsDOfHzYKzP2ekvYyuQlKz+R+LvFTFxF67VNbX2Nm9
         G50OFbfp06kj1qC+wzxMJthyeXSoLu8WiZ/0cka7qubMFJ9VODjAZQknqOVfrC0ziVVH
         h2jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuBT+2gMMG+T6KmkBrQBYR1Wat7xnFE9niz8+y6976Pxxrr2AKlroVG1KzxW4vgAChYpSWLh4bnsgG7GphDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0cCMsaPnKaStVJTT0GpupE6RLlA2UMMqbPqsotM8cvtrVArFH
	FB6M/xbHCN2qQGeiXP6n5f8qwK5YzhIMr0SDRIZ3QReljBoNmMJcCT09dDuXjx2mi7gIgivYQ0+
	G2J5zaco=
X-Gm-Gg: AYBFou2KcXvrgsKDrJshtN4+FSKLkNTPNXd07LvqsmbFXwQhspiGFz7mN2zFl7u8wI5
	QzaYkCh9g044vssGG95o29NQ0jwNHOsdwMmBWm7HVoGLo9Kr2hIZiGKwE+S/s4OR4DlkZazg8hi
	zskJ+xuW8tZ0vQeTl/HZtj9SWEKlsW6nL5biW8Us2WLtsjpTRc3I5BQWDUhZxptvvRxjVpe0t/s
	bDSMmOXsTKgECOv5ZHpmPp6Jcl3/z59NiMcaFv9NmVJkZZwxprmOWSAQdC4hSnNls+67sT1z9C2
	YAYTJCm54IsJ6MLvGPAUPS0lEWzbdZhtGVXPazIOOsqvYzgcypUknEoLNWeA3yUyLIdaDZrj/E4
	uWZZaWMr2uhUEE7T/QW8ngdZAtIqqIEO08DdUTPSY/oshMmaJpbdyqn9ESctDaMv08+HulBBSXX
	pvVBlf4uPVyKsNuWa6aqJd6oUtKch7aZ0nzmZDyuMHHe13/nO8GSt/1YQxsF/oF1M35gkjLhVZW
	WXgD+3rAmguJgb72r/MBuA8t9ayeU2ycc8=
X-Received: by 2002:a05:701b:4544:20b0:166:f097:6f12 with SMTP id a92af1059eb24-18511ad83f5mr614827c88.15.1792171140860;
        Fri, 16 Oct 2026 10:19:00 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1831b75be5esm10373726c88.16.2026.10.16.10.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:19:00 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com,
	ojeda@kernel.org
Cc: longman@redhat.com,
	lyude@redhat.com,
	daniel.almeida@collabora.com,
	work@onurozkan.dev,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: sync: Make `GlobalLockedBy::as_ref` unavailable if T is not Sync
Date: Fri, 16 Oct 2026 17:18:56 +0000
Message-Id: <b3cd79f567b83712155bec1a32a0e1fe174e9b1a.1791594262.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791594262.git.pgovind2@uci.edu>
References: <cover.1791594262.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `GlobalLockedBy::as_ref` method allows `&T` to be obtained from 
mutliple threads even if `T` is not Sync. 

This happens because `GlobalLockedBy<T, B>` is Sync if 
`LockedBy<T, B::item>` is Sync. `LockedBy<T, B>` is Sync if `T` is Send. 
Since there is no requirement that `T` also implements Sync, it is 
possible for multiple threads to simultaneously obtain references to a 
`GlobalLockedBy<T, B>` and then acquire `&T` through 
`GlobalLockedBy::as_ref`. This can lead to undefined behavior if `T` does 
not implement Sync.

Note that a reference to `GlobalGuard<B>` is required as an argument to 
`GlobalLockedBy::as_ref`. Therefore, this issue requires that 
`GlobalGuard<B>` is `Sync` which happens if `B::item` is `Sync` 
(for example, ()).

Fix this by adding a trait bound to `GlobalLockedBy::as_ref` requiring 
`T: Sync`.

Fixes: 8eea62ff94f4 ("rust: sync: add global lock support")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/sync/lock/global.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index ebb10521d8bd..76602d9719da 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -161,7 +161,10 @@ impl<T: ?Sized, B: GlobalLockBackend> GlobalLockedBy<T, B> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T {
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T
+    where
+        T: Sync,
+    {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
-- 
2.34.1

