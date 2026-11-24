Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523437;
	b=FfsMjnMvUqDgvAm182Qga+sZu8AV76/X6FismR9QifbawpgdSCuoggBDWz0Uo4NKtOEO
	 uwZEJqLAtyUHanC5bUOgGz8d6VxXLqw+qLhYQzbO0Y0Nofwg7TrbizMLsZzkbIn5YeRry
	 S1nUuStNIPieyp41C5SevGxa3MgQk7JCageZBqNBBGOa5/MFWun+cGDPN9vikGcCd/PIp
	 c+LODbaFnDBY/JqabVghJJvp7JI+ScWEikRdIuH9tXwBoT6GRkEhUB1jsdEEKgkrxSWhB
	 c1sZPyDYsK++KfIN5Wm5V2j2oULdh3qBwHHM3k2F5Z5fRST/FLT6Gy9VQAW82sELE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523437;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PVT/uh8qs9dBpAVxgilc94wnQtF3SxwpCd1hcz7yuZo=;
	b=EpCj0duCMwKgQvoPFTK+8JP5nhi6o9oZr/cnk/7iM89zPEItb9GKWZLniLuZfWbFAhFV
	 /e2Tu0r5OkzRiTtHVDbcH7OPGBsLx+h6fETS9nU5IYWDxMCSB7A+PWJCcJ6dovcqz/nOJ
	 owmNMRKbQ6AJXN2TZWkC+1sEszvGZMnLaFboh5cAL788obkpIsI62iEXVR+tQkZ0ewP6f
	 hD+wCNmBXlAC5ly7nYUBj4Cfd1tdj2FRgvcMbJ9i2g4/NZIYxpLI4pkutt8ypydGBtCc0
	 /DbHd8dP96G/RJFSoS0gnWPd59Ue/gkMR8uvAvBvubhYp/ipjUXAXlqsKXtPvk8gWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeOW6jJE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3C606A336;
	Tue, 24 Nov 2026 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeOW6jJE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4641F000D3;
	Tue, 24 Nov 2026 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523437;
	bh=PVT/uh8qs9dBpAVxgilc94wnQtF3SxwpCd1hcz7yuZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NeOW6jJEFaUEtShzJoylzw/9ksEqcOtNUORYL/3npD1cgLTc02yd3mKhQCaep4O0R
	 IGyMKk1Wrf9KG+3srffpCP5/MihVhvLH0ZbHKOeNoWhcuH2T+S7eTC1KHpZol1qCjL
	 MM/sIraz+pB8MDFqXz0SQsBZnsASpGytHpmiRt55zzFJPHjRVR7/9YFH1vxv3oY2iq
	 XLyv3buDJ3vtlny88EGVvd7zlfYfJ/HR7FrXqnJjnopAHqYuh+t9+ToLZoRjmLJARD
	 euo7EZhE0Ar+RPRnzcTY0kMAAmU8wlnXClsYkZLfMCY73U7HPRot40y6u7W9StXzFt
	 kd56nugVUFx0A==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 02/10] rust: rcu: Add cond_synchronize_rcu()
Date: Tue, 24 Nov 2026 13:29:44 +0100
Message-ID: <20261124122951.878199-4-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124122951.878199-2-phasta@kernel.org>
References: <20261124122951.878199-2-phasta@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cond_synchronize_rcu() can be useful for anyone who does not want to
suffer the overhead of an avoidable call to synchronize_rcu().

Add an abstraction for cond_synchronize_rcu(). Add it as an unsafe
function since passing the right grace period identifier is crucial for
safety.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/helpers/rcu.c      |  5 +++++
 rust/kernel/sync/rcu.rs | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
index 481274c05857..570ee76b7247 100644
--- a/rust/helpers/rcu.c
+++ b/rust/helpers/rcu.c
@@ -11,3 +11,8 @@ __rust_helper void rust_helper_rcu_read_unlock(void)
 {
 	rcu_read_unlock();
 }
+
+__rust_helper void rust_helper_cond_synchronize_rcu(unsigned long cookie)
+{
+	cond_synchronize_rcu(cookie);
+}
diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index 7afc78b34759..c395a493746c 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -96,3 +96,16 @@ pub fn get_state_synchronize_rcu() -> usize {
     // SAFETY: `get_state_synchronize_rcu()` is always safe to be called.
     unsafe { bindings::get_state_synchronize_rcu() }
 }
+
+/// Do a [`synchronize_rcu()`] if necessary.
+///
+/// # Safety
+///
+/// The `cookie` you provide must be one you obtained through
+/// [`get_state_synchronize_rcu()`].
+/// It must match the specific grace period you need to wait for.
+#[inline]
+pub unsafe fn cond_synchronize_rcu(cookie: usize) {
+    // SAFETY: Safe by the function's safety requirements.
+    unsafe { bindings::cond_synchronize_rcu(cookie) };
+}
-- 
2.56.0

