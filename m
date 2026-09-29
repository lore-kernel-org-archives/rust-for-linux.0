Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5545C565110;
	Tue, 29 Sep 2026 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709321; cv=none; b=X2ATeziIGyPiRAA1H9+oWerNBZPSncR2Z7UgFkvN8qQD+WBCLHHVHUa7viVjMD50Eo3c6WIMRgRQuQTw5LmL5IhnlU8FBkkER6pLt4v8t4SksPGe1pDyqzGJEwOlD9msO2zJXRK7eAswoV7MKChLj5GYsj+kXwO22AH+C/MbRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709321; c=relaxed/simple;
	bh=2IQdkAUjyKnO+5+TN18b2hC+AHO3jZKYr/hFYsdJY/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+KttQaNmXf740gXs+JPPZfDmpH/xuYEWftSSSeO8Qgu6TFRHmuLNyWVvjuEIXR1NVKXseGTOeHVAl+u+uzyCPdqmnfkMP6JtEO7cuuTwAUvoSxC60Oq2ebMtcvLmrsd7URKyWYqDWoPAJkvmfrZ+9lUwNH4qaKhxexJ5+GN6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCfKiFHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCfKiFHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241A31F000FF;
	Tue, 29 Sep 2026 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790709320;
	bh=eDWP1sutXlUePBlrqFuro3SK2Y9lWmPWzbFBSoDiSMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lCfKiFHMwT+fuQpb/ZMLvcCIIz1QM9uGk5dTsvidNp/uHMFG29pReIBkCRy4wBSvH
	 SuNFOpFU3x0222LUtDKsKKUu5LxucbreCqG4zNOMnt4u+wTagynXjc5a9DTC/Szd35
	 7sY/6xRxnEz/qpeqvCic8K1wpBwHlr1wkAe5sIsXaLznQIIi6Bfut0MREzkPToc7Al
	 TRjxGhZpq/D0OvhTorxRvX0LF8MQvknbLMX4XERZ6gSkqcV9IAwzCWr2pQHgDyu1XE
	 qYvUBrVeIZfR6ZW03ihj0AMRxIp6isb3gQtDAKayYbi1iY6s06JkSsFRQIeIvuYK0/
	 PUHWP0Fh6KH6A==
From: Danilo Krummrich <dakr@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: add `NumaNode::id()` accessor
Date: Tue, 29 Sep 2026 21:15:14 +0200
Message-ID: <20260929191514.2261126-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-numa-node-id-v2-1-fdd2c0a49412@kernel.org>
References: <20260929-numa-node-id-v2-1-fdd2c0a49412@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 17:18:24 +0200, Andreas Hindborg wrote:
> [PATCH v2] rust: alloc: add `NumaNode::id()` accessor

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/1] rust: alloc: add `NumaNode::id()` accessor
      commit: 6e8339118040

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
