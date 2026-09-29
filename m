Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9D5632BD;
	Tue, 29 Sep 2026 19:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709312; cv=none; b=JnIk2dy3sJosm05BGAMFP0BfYIsEMUZFPeY4hy0wGoJY6lWoKRwifZwVkE/zA4DStkZo/pQkryc2hIHvRN5ro3x8m96jPPB0te5GGkbyLd4H+nBr+S60es3w+s7dhzaHndgHkzohTdv/41jxeDfem7tse50UKYYU9VN3Ggct9TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709312; c=relaxed/simple;
	bh=k1zsjRMTBGi5BBdFJ9RHVAVyUaVxjNlMbHJbmHYA5I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3G1Nz8qxcUwhgpV0sAyL7T54FIiLjxNIvtVAGqpZhxhrvfmHZW5PBM/qWvqcE0nYrHq4dluQKaswWCEkyuc92LoSYa8N/oHDPqyZQP0IB3g67uwFyvXiB+0gjpKI3udojmXRg98vLUOcAX0OVmmz/mQTMFwJwrR3fpYysL6dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYoo8ISk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYoo8ISk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A381F000FF;
	Tue, 29 Sep 2026 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790709311;
	bh=NyY58ROhpqlUqpXh9viQdHw7C3tfm09vUojKoj3ENNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QYoo8ISkoDd89Msk8hgqv0IIVCHPT8D5Hm9D2B0GmE+WGSQLo2/dWigjhD3VaMChU
	 6L8AJw8fl3F4e7dCp2wB6ekVNkl6l4vJBYjyeSjuvEEUB7g963a4BE+qLIrALPqFac
	 IN4p0soENcK+pCWScFerYIeFs9i408yKsD8kcfSqbtUP+ci9QNmNimYZNLwYIS3xeE
	 hqlndPkUubSLpzbSxQQSCuewEdMf9YntRj8xHl4zV4GLSN3qSKHrz6ou3hsh3Tp6D1
	 VdUwbXeszotHz2UeCHunlosjAscuNPNTlkLjlOSxL+VCWOjL2BIkJmE6RqsYDTpnmD
	 vMwm5uLkgsHrg==
From: Danilo Krummrich <dakr@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: allow different error types in `KBox::pin_slice`
Date: Tue, 29 Sep 2026 21:15:05 +0200
Message-ID: <20260929191505.2261013-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260605-pin-slice-init-v2-1-b197e84040ba@kernel.org>
References: <20260605-pin-slice-init-v2-1-b197e84040ba@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 05 Jun 2026 12:56:31 +0200, Andreas Hindborg wrote:
> [PATCH v2] rust: alloc: allow different error types in `KBox::pin_slice`

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/1] rust: alloc: allow different error types in `KBox::pin_slice`
      commit: d190aa209416

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
