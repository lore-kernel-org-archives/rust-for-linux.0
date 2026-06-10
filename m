Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637C3BED79;
	Wed, 10 Jun 2026 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082059; cv=none; b=pxVWjAbUkYFCrBuPjxiq/30A0l6CXCR8bJK2e+L+ls9kNibwhtgPu/glP1GCAmJq2+wdNKepezhItVwff+/TUCox8xOWYLL/z7HD4K2lNISD9rpTvIeSStaVPtXLcfvvMNB2DOmTNFRET2lvFFMucChGicRqPOGaNruaiQM32FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082059; c=relaxed/simple;
	bh=4xZH8EKC20wOL1zK8SrV71TOgTZvNK+Q2MCOpHnV0qk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hkdzISrF2O1ISiAonjCKc3Ipujrt1EK9SMpAZ7pn80pJfQJlNDsKrtPgabTB+M7ED0t4vsxtThL7EciGQD1kTRgUJHR6MBg6ewiozqoCtxGULt7P2umkK3IVeuRQ62CCg24MNIkKEhcrTkRNAeJiw8GWloCZ/au90Nv6sov/iy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcMwQW8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcMwQW8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCB11F00893;
	Wed, 10 Jun 2026 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082058;
	bh=4xZH8EKC20wOL1zK8SrV71TOgTZvNK+Q2MCOpHnV0qk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UcMwQW8baf1BbQC8hY62Pe9fOuFUnJ+5pZl56Q8GGZ901VZZ7ed02AStcU9fGWSPK
	 RNZbKC3ojytfUijJoHkpOibsRZmdqGaZjlzHyIx1FqbZHuasb8+2IumKQAHzKqbrUC
	 1E2Ja++z70UtQYNDfXHluXf6YVky4NGxticx9hHKT2lA3NG+fFxJr8zHWCLCfgqSpW
	 8IljHP8oqDczRHMlienVePoW+DKWjNR2B8pmrgbIn9GOViM3ZohwRoHMRXHotvBPzI
	 mwi5yykONmqUrhu2qjxvzLeYw46n6hwiQGXVAIYRcJws7Dxu1wP2501nAwCA+ApuGF
	 aDGHfJiKr6ocg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Boqun
 Feng <boqun@kernel.org>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: page: add `SafePage` for race-free page
 access
In-Reply-To: <aikJoacZW5JMEx74@google.com>
References: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
 <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
 <yztg3fMt3nlpoB77WlDBGmKhdPr_eF3t9L_v3G6i6BFUxNZbti0dHS1WDhIQDulHmXZ-YxOcuKuL9Tkr9pRI5g==@protonmail.internalid>
 <aikJoacZW5JMEx74@google.com>
Date: Wed, 10 Jun 2026 10:48:53 +0200
Message-ID: <87a4t2hjbe.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, Jun 05, 2026 at 02:49:14PM +0200, Andreas Hindborg wrote:
>> `SafePage` wraps a regular page but adds an invariant that the page data
>> area does not incur data races. This means `SafePage` cannot be mapped to
>> user space or shared with devices, and it becomes simpler to directly
>> reference the contents of the page.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Perhaps it should be called ExclusivePage?

Yes, let's do that.

Best regards,
Andreas Hindborg


