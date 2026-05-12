Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27403D7A1C;
	Tue, 12 May 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606407; cv=none; b=V+hCQsyxoBy0kmSLU02lua2gPQdqh8tIYRF4EaSXbrJvfW3Adinq/M69siwPRLG7qo0ZkiIc/x0CPh8r//UKRIlj5f/IlIeg+FBOyDsC+FlMlfIG7TYoim9zFOEHfoAkGrNTZc5ovUxKHB3Szn3gv1A96FaV5XU9rrvrx7yms40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606407; c=relaxed/simple;
	bh=lG2FVYsWUwdYqeQjOhIJWYbObGDmrZM2rXD+GESXnE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNNcM0ZvsMtkfTKgLcf4aXmK/fCM5N7GEoJbTYz1Hv1PWUoTmJvJhBetO6qSBH1rdJ72Xv+8OsGdVHIKdG37xPPyEBNzEJo5cXIHiXM359Q/u0M9wQlVrC1mKLVQr2Ea3otPFNzJeErnamN1VDnu19pU3bKtfe/mWARUE5ki/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7r4Hwdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7r4Hwdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FADC2BCB0;
	Tue, 12 May 2026 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778606407;
	bh=lG2FVYsWUwdYqeQjOhIJWYbObGDmrZM2rXD+GESXnE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P7r4Hwdxz4xPv+0TVyEr9bfyuxPT+CvpOo/yD0YQ9Mw+xxAHzFK6klnXOCBYmn7Aj
	 CbCRbPEnO12tbIQ/QrL9rlPypXti8M0HoYmDo3UgK3n0J6Oh3y6aI31HVZyQLo/4hp
	 r5UH/ytBiQ3xpX6E/ZqMGfViK1iK9SVvZ7p+LF+fs7Jzc1gcORe0iN+4fe0K3z2PYd
	 ddU00kpXBhcXmhivXT+FOsciKxSnPqxy8lQ/9xaKwSOwGWb9yRJUKzQ/5qd3ImmLCL
	 T+e68Szzkdp9KuDIPLvV1S+aTE3oygiEcZXP7D03uQUFzoXnIpHrLU5wI5w/vvTPW6
	 OKzUPZtGXLAVg==
From: Danilo Krummrich <dakr@kernel.org>
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix assert in `Vec::reserve` doc test
Date: Tue, 12 May 2026 19:19:58 +0200
Message-ID: <20260512171958.4020772-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
References: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026 22:15:49 +0800, Hsiu Che Yu wrote:
> [PATCH] rust: alloc: fix assert in `Vec::reserve` doc test

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/1] rust: alloc: fix assert in `Vec::reserve` doc test
      commit: 75619f2df7a5

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
