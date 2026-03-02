Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F041C0DE;
	Mon,  2 Mar 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469462; cv=none; b=D5sUSagT0gLMCd/l/JFgMwYWsbJ7N/rdMRT1zrwzcYNAvaMgUgfDtejDimSq8to8agM1mnmsionT7Vg99cFaQsGrg3mMD0f2HcrnhVlluIz7/BWH3iZK9MVEskfo5/5jPU6Gn2zCeJZ6EI2LmHCLL2KbtL/ADB6mWfiskcQ3yWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469462; c=relaxed/simple;
	bh=SbuaOkmQETdOs40eX3qaZEGrmcOaEisBDD3bITXPnmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoHSlRO5vhlz5FrbKZ1SmqehqulHRGo84OMDKJM7m9ok4Cy8hh+qKnkAPVOBLZdT8HI0NyxuV2/prXavkUIf5qpmxeszediioIbkn2arbcQ4uCXG1Udl4Dzne6QBwccUM78pjbvSeQgtN+tjwAymipHiOHItdHp4B8focUmm+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cROor4FJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cROor4FJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B8EC19423;
	Mon,  2 Mar 2026 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469461;
	bh=SbuaOkmQETdOs40eX3qaZEGrmcOaEisBDD3bITXPnmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cROor4FJMuVwMAldYwfaUD9dpa76OIvXcT+yIStVUBEG00uukeTS5vdrsonvlr1ge
	 SRchBnOACgtIP97Yyg+bcC8H9+k2nZFNCP0JwcEyPK/EVzJanOTriUcHgAJu6DFrCt
	 xQqWD/0EfrHWHBjqNORBb9OXANvNdhEyhgLXiBu9Pvg3mvZcqFbfTmMyO0ZBxy35pG
	 NnGlX3ArPSmGPmTdnKBHMwOZnMZN/JGgXrOZuiDhdzccnWAblIs+qbJ0nea/lv/kAm
	 zoPPw8kaTCeDm972HaNuGPdWpSat/uqFI/gShoIEvGZ6Lf1QI0d7tBi2oIzU/p05aU
	 bOiesmifD/bNw==
Date: Mon, 2 Mar 2026 06:37:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
Message-ID: <aaW81JU7P82nXNbd@slm.duckdns.org>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com>
 <E0BC3E06-FF0E-4EAE-8B7D-FFC1630F537C@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E0BC3E06-FF0E-4EAE-8B7D-FFC1630F537C@collabora.com>

On Sat, Feb 28, 2026 at 02:35:05PM -0300, Daniel Almeida wrote:
> Tejun,
> 
> AFAICT, there are no further comments on this series. Can I get your feedback here, please?

I don't know enough to have an opinion but if it looks alright from rust
side, please go ahead.

Thanks.

-- 
tejun
