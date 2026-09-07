Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE551FCD4;
	Mon,  7 Sep 2026 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803298; cv=none; b=aa/9/lZKkU+nyQntMGCEgi+IvK8noxvhYrY659zw8yvVuQUg5OUDt7qdDkylY/E5mjLiL19+6ZsxSVoQIClmw9UyNR5wv5hUdPyrTaEH7VADLxlVKc5DWd8mupStSovrdr40/fQFp47s9X+tvDpihHl0MmGiJRA1MY4aA9qgxxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803298; c=relaxed/simple;
	bh=gVcHIR091nKe63kW081P1hu2+NxnGR6WHkyTfC/Akoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtjuAAyPGyVziJ69gPqloSfkHQnn1pd9/7jZ2lWqRHlOEwaLixPl0eyVfBl6HJtKDiYDfs52A7JJstwXmRmk36d87u8YCgU158SZfEQzSdNcZgoQ4Vbv8IZWIVM2DYS1NZ1S5hDYmmnOJpL9R01tAhNAVOG7yZVxMzjPRrKLWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqQJEem/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqQJEem/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5E81F00A3A;
	Mon,  7 Sep 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803295;
	bh=bS1qZ/XIBX3jq/MS6/8/SYsogjn2xT0pzwijJAZpnT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YqQJEem/l3sQWCzKDHeiv2Zn/9ofYsiWZL7n06Rgp/+XURvoYGgUTQ+WBYiw9qx/5
	 Ce0cpFy3pLkoU1nq1dRKMYbKLg1R0m/jNYfon+cUau4IAmc7Ceo5zooRuSzugsVO6N
	 vwHcw0zoelak7tQa2DnNyfB2qmZuQvtsE97672k5GHeKyVrLIcc9yf62UbzMFyxwAf
	 N3QnVnKzN5QdjC3kLq9JmRsz+8Ezd1wWAvlw0agsEDvcAVVYcGT3HzP0UiXWyhIT/y
	 kEvmfNpUFmn7Pdn086fVsM//Ry9WbtJh6AycgGX40r5DNwYmIDB9CYawGDmSCd30/Q
	 jDW8r6Cw/JMyA==
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <burak.emir@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 0/2] rust / dma_buf: Add abstractions for dma_fence
Date: Mon,  7 Sep 2026 19:47:30 +0200
Message-ID: <20260907174729.3669166-2-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905085343.1827305-2-phasta@kernel.org>
References: <20260905085343.1827305-2-phasta@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat,  5 Sep 2026 10:53:41 +0200, Philipp Stanner wrote:=0D
> [PATCH v11 0/2] rust / dma_buf: Add abstractions for dma_fence=0D
=0D
Applied, thanks!=0D
=0D
  Branch: drm-rust-next=0D
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git=0D
=0D
[1/2] rust: Add dma_fence abstractions=0D
      commit: 3282d5916019=0D
=0D
      [ In dma_fence_callback(), split combined unsafe block into separate=
=0D
        blocks for container_of!() and pointer dereference. - Danilo ]=0D
=0D
[2/2] MAINTAINERS: Add entry for Rust dma-buf=0D
      commit: 7aa432f5121b=0D
=0D
The patches will appear in the next linux-next integration (typically withi=
n 24=0D
hours on weekdays).=0D
=0D
The patches are queued up for the upcoming merge window for the next major=
=0D
kernel release.=0D
