Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CF32BF20
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755540575; cv=none; b=gMuWH3DACoPYdvcbqyVx77udwsygVlS+jfzAVF48hwIFdmT7T+QaP8zU4mfLBD75UCq29D2m911ijlFLDik10SF+9CaP0lNmddnMN/fQpiexyqUpOfZkOUc5rJr1pMFOmC89jlNQbMJpccvoJw6lEjMo8zbJz9oOi22xFVfyMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755540575; c=relaxed/simple;
	bh=peVRwFkAy4cd93RYyjqqMQI+CX2IJLAUNljDQ1sWf2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/fuDjj37q7a6yeT1YBPee4cKRJnHTPH3VGVgbYsqbwq42dyjBmmF/Ib5XiyAozyi+KplbfIIjzWa/YF2hsZVNuAbmZTbfF2UFkSfNcoRkwGyimaSDpGLvkZfMXfmH0QTBz/XBmmFAofmUGKRWD9PYDsaZWwekMv25fFued6n1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8w4fxGe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8w4fxGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1F6C4CEF1;
	Mon, 18 Aug 2025 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755540575;
	bh=peVRwFkAy4cd93RYyjqqMQI+CX2IJLAUNljDQ1sWf2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=G8w4fxGeON7xzbM2S5DvVAZO9YhdnhUbyYeKhZxkXko7lGL1RH5A3Dlisc/1GpcgB
	 rNgrW0rDLKxofXJj6LFAN/D5MN/jWGwSsP5QUyDnCT5KNHaG2QKduzOh9sqtxfA7TK
	 3nNHRsRmPwDYnBNoEgZ4KBLKsy/nDQbBpPWgsTjG0VjlkAuBzHpxRTuTq6+7cS0z6S
	 qlFHwpCpv8ZT79NEPKg5TIkYI/FUM6D7dDFRN8005kdgilU6PiONI+1a1QPgAGcW5g
	 gLx/T1Ay2qh7XiXtEGYmf/hWmPPMmUKg8ysg1FZcWN4ZyMZTzXH+S3DwbpRmnTFTMd
	 H25e1v5RvGYHA==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	Danilo Krummrich <dakr@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: [PATCH] rust: alloc: add ARCH_KMALLOC_MINALIGN to bindgen blocklist
Date: Mon, 18 Aug 2025 20:08:48 +0200
Message-ID: <20250818180923.192042-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some architectures, such as X86_64, ARCH_KMALLOC_MINALIGN is not
resolvable for bindgen. E.g. due to being defined as
__alignof__(unsigned long long).

Hence, we have to create a rust helper, i.e. let the C compiler evaluate
the expression and store it in a const.

However, if for other architectures, such as arm64,
ARCH_KMALLOC_MINALIGN does evaluate to something that can be directly
processed by bindgen, we end up with multiple definitions of
ARCH_KMALLOC_MINALIGN in the generated bindings.

	error[E0428]: the name `ARCH_KMALLOC_MINALIGN` is defined multiple times
	      --> /builddir/build/BUILD/kernel-6.17.0-build/kernel-next-20250818/linux-6.17.0-0.0.next.20250818.423.vanilla.fc44.aarch64/rust/bindings/bindings_generated.rs:134545:1
	       |
	9622   | pub const ARCH_KMALLOC_MINALIGN: u32 = 8;
	       | ----------------------------------------- previous definition of the value `ARCH_KMALLOC_MINALIGN` here
	...
	134545 | pub const ARCH_KMALLOC_MINALIGN: usize = 8;
	       | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `ARCH_KMALLOC_MINALIGN` redefined here
	       |
	       = note: `ARCH_KMALLOC_MINALIGN` must be defined only once in the value namespace of this module

To fix this up, add ARCH_KMALLOC_MINALIGN to the blocklist of bindgen,
such that we always only generate the symbol from the rust helper.

Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Closes: https://lore.kernel.org/all/8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@leemhuis.info/
Fixes: 1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each allocator")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindgen_parameters | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 0f96af8b9a7f..02b371b98b39 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -34,3 +34,4 @@
 # We use const helpers to aid bindgen, to avoid conflicts when constants are
 # recognized, block generation of the non-helper constants.
 --blocklist-item ARCH_SLAB_MINALIGN
+--blocklist-item ARCH_KMALLOC_MINALIGN

base-commit: 7e25d84f460c59322bf01dfeb1fb4745b488f714
-- 
2.50.1

