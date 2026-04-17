Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394672571DA;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388291; cv=none; b=f121amyTMfkv3k3XOY41lyFXILcPORR/Wl8iKG4Od7D3PrpS3NyfLQe+O9PfUeSQL/ErfGU6fJ+VKYYB5egwRfXG1z7LxFsRxtqhPzgJdF8mkH2Dp4cj+2gxq1HNiQTpJfvos+I7JnYuzKerCVnaSKrRdxTjVfNh/9dHBnowf5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388291; c=relaxed/simple;
	bh=hv4TGP+tCPibLRF/F0RTc2CpoNa3r8c8YYHZgnw/d40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuJBuuRHh4WBNYNJxvpTpFn7O0E68T4EtF+/TcxpOmgtj7TNm2nNOeLWQwGvIePZ0SC5ilsIUf+IooEMm+zUNBuwWJnlpRW2JgPf1eaMmKhwiVYbyOsTYjPgVWv/j1xng1tkNJH+SnjVLtq40HxiuJ7Bt8VBGsnXz4qK5j76QmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i8AMfNng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i8AMfNng"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCF45C2BCC9;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1776388291; bh=hv4TGP+tCPibLRF/F0RTc2CpoNa3r8c8YYHZgnw/d40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i8AMfNngDCDZb91lDsQvXzYUhSWj58fXjzfjM1iZtDmJP+h/w321m3HW883F2d5hi
	 o2XeDVryOXExKc8DjjVN/7e4J7vQCaCJY75TDslFIH1dO8q4EWU5PA8lwxqZ0wj7js
	 JEtHhegt7YplY0sWBY8VQLvQF6DmyJj4K2L7MKos=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EBFF8E49B;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 17 Apr 2026 09:05:51 +0800
Subject: [PATCH 1/4] rust: sizes: add SZ_4G constant
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
In-Reply-To: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776388289; l=622;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=hv4TGP+tCPibLRF/F0RTc2CpoNa3r8c8YYHZgnw/d40=;
 b=S+iNkF483U9WR+fhQWZU8CgLNpKK5tzKrdQpDfJeKwwAKFnq1eIQG1QE2Vbudm17yD5D1Q1Ah
 LRbBsIrxCZ2AxirhO4muyub2XCtogmNE3/Jmde3gYKeYH9JshdNEVqm
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add SZ_4G constant defined as SZ_2G * 2. This constant will be used by
the Tyr driver for calculating user and kernel VA layout.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/sizes.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 661e680d93306..872f5bb181ecf 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -48,3 +48,5 @@
 pub const SZ_1G: usize = bindings::SZ_1G as usize;
 /// 0x80000000
 pub const SZ_2G: usize = bindings::SZ_2G as usize;
+/// 0x100000000
+pub const SZ_4G: usize = SZ_2G * 2;

-- 
2.43.0


