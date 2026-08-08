Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A93451A6
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170585; cv=none; b=jwvz1f1wvXJktfmHn4AuujQDn+RDmm5S4kuiHTDOY85CNBU6AZCo1oA+Zq474zY0l+Ye+Dz5FX5G+Jm7+HVkwfpUlgMbTzEsaMZdxaTPT/bJLNQLyPlts/ODhCfSAEkYjXpX7ZehJ6SmwVjgAroSfn8tOsnZpGZ9SpUJjWlGBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170585; c=relaxed/simple;
	bh=ESTqt6lzrRMdLSwkG71wwEgE7SUabxHN96oFaipiYA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dctyZ8uRvG5pTx4nLJOy9JmNsJOFCZJ2wtCQhmfuTH0FZL8FxbYhZWpv2fYxEN9UnbIusl5kcy6BHlMSLgoSlSn749mLGBXERCcBq3Vjq0iXLAL4UlqrePj9Lym0z7EYgWheDlRO4PSq8pb/L2SZ6VkWNNQT8X/5KzFUqTjgGMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=B65I9bdj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NGTsa077; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="B65I9bdj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NGTsa077"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 838ED13801D1;
	Sat,  8 Aug 2026 02:29:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 08 Aug 2026 02:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170583; x=
	1786174183; bh=A56WNCyGSFrEKYEGFLmGhJuaOlrRUgmfjHTlueZFEzE=; b=B
	65I9bdjaKG6Xrk9yiwZqHj7+IkARMpL40PpbKXqRX40rtdWcOAzR3aEWVxRhesyQ
	htHoZ6lniEyCCuB5dXQI9/fWfJtnJXSgRZhG72QCYGkhmFBuG/aqyl7n5WAc+0AK
	AgeMsACasYHsxgsF5G0w0H/MahsrzPbLO4ZqsIhh1c+663qOvQO4dXthCxh6wmqM
	m/77aYTgtzc7wIQxbVW613CltMdoQcZR+bG6Xy9HMZDgKH2i4ZCgsf1LsknIZDgp
	Dlb81gPULnQtB1RbX26hmEOyn2m4ZvcEhi7sAG1WymFZkHoFvIsWgOiVcR2YudGD
	RzZLlJZNeUSuC5d4kABbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170583; x=1786174183; bh=A
	56WNCyGSFrEKYEGFLmGhJuaOlrRUgmfjHTlueZFEzE=; b=NGTsa077Rn/R5TiOf
	mtVFUmQJOTv1l7FPKfNUB9cEyJfuJWjvF2sqe5bIv2B5kRkhwdXnCyvN8BWzgHg6
	7KBZHnuXjifUBlqNuXnuPeY8a9D7j4yuAOD4i3Ny5BbVDBv8To1mBBHl4HwAL4vK
	p7TrFaIH19FyqmwThvTsVFYT3oPE0UCZQKpC0pg4EcH7UWiU0JqLuqLFNH9BLk35
	VtusRln9Y3dvygWYHf1Z3m+wMWqC6J7x3DHIhCjWwieeKhpyZN2s/fOIwF9m3JJO
	h1tFrNS9Qde3b/qGJsaR00wlWB/aIGQOgerniY8QFz4A/HlsmKfGtnXrux4t8P9f
	sjkBg==
X-ME-Sender: <xms:18x2au8OJQwt5Uwr9PIn_BqwVXSh-tkA354Q4m0kFHSKCtFxuBnQOQ>
    <xme:18x2aq1EKNYncjt0VIdx8kWXtTiNvJ86Pdbvx6iyY92OCt204MpFudN7t3Cj-hV8E
    ecqHSXJrfHvvygupSL88hISaR27AOsjgiCtvVf4RpL6b_fJ5EW_EhV2>
X-ME-Received: <xmr:18x2av33ntqeUfa2lS2SW94iFzEOts4ViyhV8s0OJlyU1V4p2l-4UxO-qm1suMOhK-v9vsQPJ7yyWmbh3i8>
X-ME-Proxy-Cause: dmFkZTE0dfxVECSSQF1vvrBTGfc5cUDGQSXG9KTKo+YUs7jArQRBN91Xzf90vKOMDtBcHd
    E5QjGv68+qeF6qQ8f2z8N88uniZAiz2b1DdFfqBGAEKC2YihEqPrRUJZ9jj1ZpmXDTn8W2
    wTaz14Frhx87mchLwaq1Gs30lWoTAWj57vqCNagqHmQh+/E1ox9UUZ4oUluK6EctZCVWY2
    52sgdBqdgBJerLx1XXY95pHOPYhZjhVT8EQJFtwHEoRXNeJJ7Eg5UmfZeDljYezmrtGbxd
    tVvJklsn5W3KAATdtROthAPlvrpvh7tRj6ENZufYyWPIjQCXHmcFDpwe6QOaeKd7Qq18MZ
    408RTV5ok0QAt+Mh2shLOlyQrS8VpLpsBdKKtw2kgd9q+g0o5qSx3ueE4TLsbXTp9Il12+
    cMJMfw2fl4WGFYOM1i6X+RzAcQ/vN82nNyO8xm5qJd/j/mGWXW6PIFz2LqG8SbuP5A4fUF
    rr/BVd+YFF1z35223lSSsc/FGytfpSri4VK5JbOSnDh1kD90Na6pXbugksgD0M+gF9Oc5C
    SavS+OXQmvUqusYsg283Jb8uRaAmfQRmzuJ+IHqNWnShpJgCiZcRxefRtMstuH6+wDMTP1
    aa6oufMO28Aa1zOml1BpQLvdUUwT5r0Pb8L69Ekgrma5wZgvwF4pGZmFxckA
X-ME-Proxy: <xmx:18x2avx_FX8jSJ1rblDd-1dAkL7jm-AwgqeS4NpzLdqsOOX6J_H5JQ>
    <xmx:18x2ajWXcu5kl3a8qYLdNTBGb9pF6CredKu_ap8LhLpBtElugB9RRA>
    <xmx:18x2akr17i5tTV6nld3jxuh7P1pzCbOTbc0h59Q75TozeQMxWdoKuA>
    <xmx:18x2aodJw_zZTtwtbvB8XgtWtQsv3B34-OniQ60WamrznffbP0eaSQ>
    <xmx:18x2agVHYeeE1HEHjka_5ZPr5hsTwbUCtjNb-hdChvkUN4zNve_Z0VBu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:38 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v6 7/7] rust: time: remove unused Jiffies/Msecs helpers
Date: Sat,  8 Aug 2026 15:28:39 +0900
Message-ID: <20260808062839.1159990-8-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

CondVar's wait_interruptible_timeout() and workqueue's
enqueue_delayed() have both moved from raw jiffies counts to Delta, so
nothing in the tree calls msecs_to_jiffies() or uses the Jiffies and
Msecs aliases anymore.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 83891dab3aa7..e337a219a310 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -39,20 +39,6 @@
 /// The number of nanoseconds per second.
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
-/// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
-pub type Jiffies = crate::ffi::c_ulong;
-
-/// The millisecond time unit.
-pub type Msecs = crate::ffi::c_uint;
-
-/// Converts milliseconds to jiffies.
-#[inline]
-pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
-    // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
-    // matter what the argument is.
-    unsafe { bindings::__msecs_to_jiffies(msecs) }
-}
-
 /// Trait for clock sources.
 ///
 /// Selection of the clock source depends on the use case. In some cases the usage of a
-- 
2.43.0

