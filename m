Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057B39D6D1;
	Wed, 20 May 2026 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315037; cv=none; b=LSt5gaFCdadyDmz082ZyRiSiMBfASr1nzM83vao0ndwiI2yDWUd7FN2/grc3mAfcN7gNAkvtOTfgfpZUH19OfeZsLPv6gE8GUTj3oB13MnX0ptsGrBJkzL51DGAgna5aayybRTEYKPk5r0UT+Ek4e5GmGuZNDGfJdMtV26ndrOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315037; c=relaxed/simple;
	bh=DJYs0o7Gmd0qmhhQyTGy4BBUbVNaK53s8/T4SwM62Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agGZMblDNbOFVtUprcBLC85Sc+CCk56NQ2LCerV2reUq263yFN7pU7xldl7yzW5D8zhaTumsXYkI1v0f2Xcnzz0R3syyfGILvyEH9zJeOPf+vg76d/Ryz0jhfSxZP9jDSt5miQ4g6KLKmCmt0lz58B30CgVTfjT0uJKaMVDWPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKyX139U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKyX139U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6C21F00A39;
	Wed, 20 May 2026 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779315035;
	bh=qvR6igFIZ4NuQYxYWfXCXe24V5k882YYuT3X7sjt2JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKyX139UZ8XUx4Px/1akoZsz0qSwA8foO7qJWNHEx2wwaYm7LPyyTGiD0TeiZ44Wk
	 PPc9p/at480kbsyZ1uGiJWLrFUel5UvcuIJmanBWp7g7dQubcBNBQGN986DYgKCvqD
	 BEKbwUgSfgSmt9RvozUJBYx6FjDD8hJ9P5JEuk6iOcUPj/51JIVynxjns0TXc+SWEj
	 abguouDJ9OZSCy+21pskgn+rrk8ftVNDJbaVJAPQxuAa6bosILv78oykIZzwEvFhVt
	 9bZLxqMXDOcRiSfjvw/zq/883L8xHS5q6CB4JT4AG1q4F+gOQuAnx96+Tk/p9UzZl3
	 wAh9oJbgiSM0g==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ljs@kernel.org,
	vbabka@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>
Subject: Re: [PATCH v2 1/2] rust: alloc: cleanup imports and use "kernel vertical" style
Date: Thu, 21 May 2026 00:10:27 +0200
Message-ID: <20260520221027.366964-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513190946.619810-1-dakr@kernel.org>
References: <20260513190946.619810-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 13 May 2026 21:09:15 +0200, Danilo Krummrich wrote:
> [PATCH v2 1/2] rust: alloc: cleanup imports and use "kernel vertical" style

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/2] rust: alloc: cleanup imports and use "kernel vertical" style
      commit: 9b25d4111e91
[2/2] rust: alloc: cleanup doctest imports to "kernel vertical" style
      commit: ec51531fb8ef

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
