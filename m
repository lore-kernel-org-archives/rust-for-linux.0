Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00583B47F3;
	Mon, 22 Jun 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136640; cv=none; b=PkWxxBU+78HGoNZuO832LA2GQITw6leOgnNxp8Xcinlh91SgRUEclOwARy5TLyJblX0Zl5Bl3W+chhtNZXrpgioUh55r40UESt8CL9UHlIqw+AIsXLPcj6tlRN6BG+bQBdvhiajiZ7M9xvmwXh9DzHtQn4N8y+KXFF19toSoczs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136640; c=relaxed/simple;
	bh=y4trm1FNVx06GttYL3fFxPbGstbm8V32ceo4omAX8fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U47cSessBKlVJ0j2yIgam2lSf/E3h00bYvlA42CuRWDCKP8fvooZnJSReWPYsSOBg8Xr2YHsQPpm9nLrBxyy6xZwiM8YPvFPBtqmLxm30tWN1HfYB5cLJiuYDfDk+/JvYapZ+pI1ZDFkNHQ1D9YfdDE9Of3p3z7sCtDEpcXrltI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAMZvGjS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAMZvGjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8210B1F000E9;
	Mon, 22 Jun 2026 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136639;
	bh=guvzPc7qWPNRSKn52LkUFgg+2YildN83eXRoL0QyntA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MAMZvGjSgtNlSoGTbWSMcNoOULlpnanbkFO9+miJlmPqM/JJaWol4SLe8IeJFy36c
	 XR+dselgu1cqak+dbMC2RuYbT+tsKd+23XaJ7LVW8ile4jrkJauh+pAJ0b1YPFhHou
	 noAaQB5UsPHEDdwXdAtrUqLsmUv+vaa4ujhogOmPagEy+MIQ90BBVnI+3wi2GcI/5i
	 XlVpq0MjvN4D+afH+J/0m0rQMKDg9iL0ftCpWO87EFRfPLPPOeOhe8NKjn5iRjI4rf
	 2jeUsetAjr5laCKdK5MJfCXxuRE0NH8sMRAXIADXDus3F8oG7Q/yZelDEc6CLgSuBh
	 oUeoNg8nrmn4A==
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
Subject: [PATCH v4 2/5] rust: error: Add ECANCELED error code
Date: Mon, 22 Jun 2026 15:56:50 +0200
Message-ID: <20260622135654.334961-4-phasta@kernel.org>
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

The Rust dma_fence abstractions need the ECANCELED error code.

Add ECANCELED error code.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 05cf869ac090..e376c60e21ed 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -69,6 +69,7 @@ macro_rules! declare_err {
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
+    declare_err!(ECANCELED, "Request has been canceled.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.54.0

