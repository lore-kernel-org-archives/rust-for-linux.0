Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B413A1687
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 12:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513802; cv=none; b=gQvohiKPPZ+n8dzpViKv6jPL5mRLw4gjuE+3lelVEzwspH1THcy6bmDnULEEnfAiY5NlYZuFT77Z1uzo1CEW7OL7wJQce/QE45YNix2YZrqrP606j4YUh1+D5skU8O2Mharc0hb/zkfhg6WBQJY1YIU/D1arDPKV4+dABwba65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513802; c=relaxed/simple;
	bh=lF8OWxrOJBVXnnR+rpd8VhBWzzBYthhJIgtf339V5tc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AamjSixKGbPHerE85PAOra/rdTFAIqQe0u6+QaP9e7+c+toDqyixyYlzTtcPtKNj06YHiuTuK0cPBVcWiPth00rts8Xi9+swkyHSFCVmRWkRFOZi+rTe80v2uw1a6oe/lHpzGSZMgWQS+ELvNNVIMp1WXDJT1xNPAauWs8ZQ86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PQTFMYBy; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PQTFMYBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790513791; x=1790772991;
	bh=4IQPwimybYlH01nkzOyva75CCOzN78/1PdOKzqX8nLY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PQTFMYByAB8sGCGedkW2HvsC5EQFv4sHftYH+kutnIWXw9bL/xYUW3Fgsyx3vbuRA
	 OQN0HqK0uGTaqS7mZKfDmViNNefYqjd5p50jX6XtibruPygzMntmJlt9y5GxxUwraV
	 hoTE1tfUAfT8CU3TepqRVSLOW7az0lsdTm0khYfUyqgqlTV/vwDaXvifed8+yMsKWk
	 VcTJlVsKhzdxaTnGWqkeALtDkNIexr40SiGZIS/QypsxEGzfFDKixau90c/bgklA7i
	 fsjBK2IiwZhf27b/pa80n7D2XGzgBSNIa0TFQ64BE8oATh6n2iF7THaHA+7/YpbW6d
	 W7RUjYra0VOkQ==
Date: Sun, 27 Sep 2026 12:56:27 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 0/4] rust_binder: add  transaction buffer tracepoints
Message-ID: <20260927125622.676342-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 2a768b563f54d8de35b522e4d8a0a16c57cd4fca
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series adds the following C Binder tracepoints that the=20
Rust Binder was missing around transaction buffer:
`binder_transaction_alloc_buf`, `binder_transaction_buffer_release`,
`binder_transaction_failed_buffer_release`, and
`binder_transaction_update_buffer_release`.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>

Sagar Taunk (4):
  rust_binder: add transaction buffer tracepoints
  rust_binder: allocation: call
    trace_transaction_failed_buffer_release()
  rust_binder: thread: wire up `transaction_buffer` `alloc/release`
    tracepoints
  rust_binder: add call site for
    `trace_transaction_update_buffer_release()`

 drivers/android/binder/allocation.rs        |  7 ++++
 drivers/android/binder/rust_binder_events.h | 42 +++++++++++++++++++++
 drivers/android/binder/thread.rs            |  4 ++
 drivers/android/binder/trace.rs             | 37 ++++++++++++++++++
 drivers/android/binder/transaction.rs       |  2 +
 5 files changed, 92 insertions(+)

--=20
2.55.0


