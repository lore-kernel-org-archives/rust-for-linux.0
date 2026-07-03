Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8C36A017;
	Fri,  3 Jul 2026 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063932; cv=none; b=DtxQn7fWAqNBBFHnjbd9DRxvL/6or9ecQHPIkPrDtA3F8HiiUJ79yHsgy+wsqUZYedYwSpGTon6yFyM2cG0TX1rAqEFywrSQix08kGkHU4Bxjaqe847JuHwX8HGXOvW8L+bFDdmwMRkehhwg0OoelbW+pgXfIy+nkUhxQmo7zpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063932; c=relaxed/simple;
	bh=2at2wL65W1O6XizCe++49CjEmSF/7ZfF6Y5WV1Dfdbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOm3K9EzVr9gTgMIm9Ba4kBu1012lT2zgs+kxkgzlNQDFyhRY5M0ZP4bdW12VVc8CdDd7f9yucTUAZCUldB7nuAuU05t4+tC9/AJ2myhoQJS7Km8RKt3/XH+1KOGZNhU40f+Gnq27jzSV0bDGSxiPqOXWrNBusA9eMEWIgpeK1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOib/r6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOib/r6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACFF1F000E9;
	Fri,  3 Jul 2026 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783063930;
	bh=0+6Xx+eCxdL9yQCTyX7ae/7D4+D0am5ePJbYaSONlzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOib/r6IXI2SEIEVmzr0KAQ02bmLQfBYMzIDGRDGhxtHj1QNtPP/p7JUqTNf1DUvR
	 vm+zo4e1PAJhjcP4ALEMAADWshez9KzL6UAaMXntW8Xu4BGPBmOyYiHReCShJtzgYP
	 8YQXUvM1VRIamQ3AqB02Pqq9T95XuDmfc4+IhtROzyEuQHvb2QHkTVQzkr67R9odsE
	 H+GS6LiZgIHZiHpTfltoqJ7qzRyl9us7cdofBmPfaIyZbEKCam2j4u8z0xAbABYDm4
	 0NSEHy7VyuyhbOMC9mrzVmYmDwmsl324AlTYP+CNo7p29pJf3DgbNYgXG/FH1RcwYg
	 R2xkU+pUg1C/w==
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
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <bqe@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 2/5] rust: error: Add ECANCELED error code
Date: Fri,  3 Jul 2026 09:31:38 +0200
Message-ID: <20260703073141.3962604-4-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703073141.3962604-2-phasta@kernel.org>
References: <20260703073141.3962604-2-phasta@kernel.org>
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
index a56ba6309594..cb666f0d42ee 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -67,6 +67,7 @@ macro_rules! declare_err {
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
+    declare_err!(ECANCELED, "Request has been canceled.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.54.0

