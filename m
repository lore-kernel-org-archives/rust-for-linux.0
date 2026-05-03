Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BE16A956;
	Sun,  3 May 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810910; cv=none; b=ncwPY6yZ7gLIo16Cs2fzTibJjtlgKl8pBRYCoBbsC7SFdTm+wRbJ1mO6JewiwW+jKnGp9PMKLU/2xknXnYrSN9YzWTPlgIwsRWeXwV/broWw5BnhIPlXF+Er+kOSM7RDeLfXgpsKF7RZ9+elqXSBMrJ2TqjvDvt0ySl7fMlkZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810910; c=relaxed/simple;
	bh=1BXcDviF4zSUJSTg/STgwuPXEr4+vGruBJXtASu+ZX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SXtkrWyJFqdBIYKOmoFvX9JaI7Nj51YKgee5ia/P7/K33ttMeyMYBhLI5pJZUajiD0y4n++y+uZfk1cJfCxZZ4SmgSowRtsgZFNczKdaJMleRmHgi3piya29srWNk6gFZaiDL1yIl8LQhPv29QTo5R+dAAxiyjdbgq6X+vl9HQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7pE1hx/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7pE1hx/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27177C2BCB4;
	Sun,  3 May 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810910;
	bh=1BXcDviF4zSUJSTg/STgwuPXEr4+vGruBJXtASu+ZX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b7pE1hx//qw2Tk5rH2OpK6yCmpzNWEj45E8c8ONAmLj9ertHLo0ESTPLYwQvkANKW
	 FDYb3f+s7kgBYy4u7FgImM00PcPfKkjLyKxYtKks9mSG/btSe8DaPvPi6n6EqSqkEA
	 5VmTc7D34clAZB7LCB84hqYRWxpg1e6fQqBD5v3EDoDvtW1NJK+xrCTXt0ASuhZqH2
	 Gpp9G7f/qLTLFUJm9tZ95j29m9aCsNjT2pepJqM8pk2ZYT40kcwaUjExAeyvdwgPLz
	 9JWpB/x4Es4IdUil3OrXhooVyoUxqr2etLHMpKSrQebfMhQ7YpbDtRSGh6t8eX4L4F
	 KA6edIctuXYPw==
From: Danilo Krummrich <dakr@kernel.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: drm: fix unsound initialization in drm::Device::new
Date: Sun,  3 May 2026 14:21:44 +0200
Message-ID: <20260503122144.1115392-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501-fix-drm-1-v2-1-5c4f681837bc@nvidia.com>
References: <20260501-fix-drm-1-v2-1-5c4f681837bc@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 01 May 2026 19:49:37 +0900, Eliot Courtney wrote:
> [PATCH v2] rust: drm: fix unsound initialization in drm::Device::new

Applied, thanks!

  Branch: drm-rust-fixes
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: drm: fix unsound initialization in drm::Device::new
      commit: 0a69ac25bd59

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
