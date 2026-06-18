Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B023B27C1;
	Thu, 18 Jun 2026 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789228; cv=none; b=WQ6zSWxx5s8z+YcCbDGp+4c9POkcmhQCBGMIu/C5s476gtsUG9lFQkobqPINoaDwmUwgrPX72BDHChnL0U6yStc6bOX/BwOARmUtvYXuLCLfp4zDWwG8jIwV4dRfocX7joOnvWkbqZ9IcLmt7xndAj0PxsXatrmmumgepmjF22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789228; c=relaxed/simple;
	bh=86bBO8Ak0FXwxnzFY6WMMdnO28JETZTD9dGDreZM0H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5n2IpuDQJkVwg7lsfLcTLXGxDRYgktZ4IqqnT7EVev06wye8eVAvag3LTNFWHhHLSdN2SXNyljfKTZTvsNYm1PGoU5cx3aLdSevhw7Teenhyqv9bqOWH3MD7n3Qtfeic7epy0dXBFVY1NPhLCEH+yWTZAQvzl3Os+OTXapNsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrAV+m1j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrAV+m1j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9208B1F00A3E;
	Thu, 18 Jun 2026 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789227;
	bh=BeDFsg/78jza6BxYbsL8y7J1iZTkaCdIxTax0jYm0Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mrAV+m1j9IzuRAn7zc3xxec1VZtjL16Rl9+M+1MfLHNmWTvnlMbcDS17oHvldpvNa
	 sle0ki3q0lXq0IFbVIwHIvX1xSAGPnqEQCsthaq1uf1d9Ff5MaTyF6K4mScUdq7yCR
	 R8uOWXe8MLf/BxkaK0JIpZ6a5K4Mewss7higKUFzQeMUWpnMTlq54YDCyKYh0rOXcF
	 agCCN1U/CEQClpjb4g7+goNAGfV9u9N8C1cGd3+OiM44PLzgI7YqfWwi7cGCk0ThN5
	 RajLOHHPfcMkno3sHjkpDW/NTdLB1T5lAT+zO5SdLd64hNQ4Hm04LQoA2YcM8/Qko2
	 +u6b2AAu1WR+w==
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
Subject: [PATCH v3 2/4] rust: error: Add ECANCELED error code
Date: Thu, 18 Jun 2026 15:26:25 +0200
Message-ID: <20260618132628.3811068-4-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618132628.3811068-2-phasta@kernel.org>
References: <20260618132628.3811068-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust dma_fence abstractions need the ECANCELED error code.

Add ECANCELED error code.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 05cf869ac090..dda15db7cddf 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -88,6 +88,7 @@ macro_rules! declare_err {
     declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.");
     declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
     declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
+    declare_err!(ECANCELED, "Request has been canceled.");
 }
 
 /// Generic integer kernel error.
-- 
2.54.0

