Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F023B5837;
	Mon, 22 Jun 2026 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136647; cv=none; b=NDwy81KnDY192dkpfJ9UwgDsPa0aJJ7DgYSYPmPcBNqvg0GYzOTwgbGCmK6MGwY63rO8IsvBWlUzASyD0Edb23g5CUkwSTxsiFdLvuWaufpjagg1TCiDO+BpW2kXwVtDTVSo6PjCnXjOxaqOOiDVD0GtrCtIXOsGcCHplkwS37w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136647; c=relaxed/simple;
	bh=URbWDWpf0PAtCp8OcPQLWWMlHlkAyNGidSdZ+hciKvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLSx1eRxwl4TeS4WviorjYKWqEtAU7hJCQb2Irg9WcLnxhqTBOuX1h+qQAHWBxJrD8/VaOHGTFROtqKaENhmQpxPSCViAU9bAIX6WWmUuhnf2aihEsvIlUmRyg1U4SXtreppISr6KIRjrBB/7Py8fYkdcmsIAnnd9JiRUyarYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj2RWPUQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj2RWPUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E3D1F00A3A;
	Mon, 22 Jun 2026 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136645;
	bh=bF28Yy97ZS3HuaAa6rSSBBjFbEvbdFbPcqNff/KsiVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mj2RWPUQd7LTkoqyPVmbe0L7b/LUOl+eBcS40e5PI+y/66J6khrIq0Wm1d/wiu17V
	 UuCNosvweT6pITyyydebQUcYUGTnc5GqBNIXNx5WB6i0Ce2HuwELeueUYnSAERMRCG
	 ITUS2aMEA3WDQu3O5gB1kMfdJq8XwroNUTFVbw9DfYksbGN38bN3vdnOk3jYd6K/H/
	 moGpqKkanZw84VssFm74pzznNRH8vYqs39JR+LzRVqJdZ/qxLuhLtjTswaFf0SfjN3
	 DyF4YfsNKFTy9e2C2fGKciJ8/52Xq3cJMXKE/Mz0gjID05iOs0jy9rxtFnTZanx6tX
	 vusJb5kCtmI8A==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Burak Emir <bqe@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 3/5] rust: sync: Add abstraction for rcu_barrier()
Date: Mon, 22 Jun 2026 15:56:51 +0200
Message-ID: <20260622135654.334961-5-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622135654.334961-2-phasta@kernel.org>
References: <20260622135654.334961-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rcu_barrier() is a frequently used C function which is always safe to be
called.

Add a safe abstraction for rcu_barrier().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/sync/rcu.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index a32bef6e490b..9196feb62d6d 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -50,3 +50,9 @@ fn drop(&mut self) {
 pub fn read_lock() -> Guard {
     Guard::new()
 }
+
+/// Wait for all pending [`bindings::call_rcu()`] callbacks, if there are any.
+pub fn rcu_barrier() {
+    // SAFETY: `rcu_barrier()` is always safe to be called. It just might wait for a grace period.
+    unsafe { bindings::rcu_barrier() };
+}
-- 
2.54.0

