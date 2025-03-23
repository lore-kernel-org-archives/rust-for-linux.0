Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4855204587
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Mar 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742725968; cv=none; b=FYMPxAlc4ZsnDvJqpayOx61zQbUm/sjDaJHYS3cFeQcKpXFncUaMN5hr13vBEzF5ZH3e4M6OKCh7gWFNuHcFif4IYsJhGQcXmJOwnnIctRCmK+11qZZ0JT7tRecnD4gTgvyxP7bEUN0OIwmwmLCHLQmxgp+2rf7T5WxDWU6nfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742725968; c=relaxed/simple;
	bh=6l2eQCSW3JNYIBYkHrSb3EFJN8alvjO6wGejc8D1AqI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fLiCrb8dIgGctyxHjJgktca+yH172jDP1KPTjONyzJXZMaqLxfyL4Tvk1C/QBQ1SHO5mquFvYDQz3PlWH5bKsoOSCRU608KU4fVJqInw76MxXNPEb958+Ehm5aVRpTu4U2Mv+P83OTK3kmSwW6Y34Q/APmWwkUodqb16Rt0+sww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NKBcmdpb; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NKBcmdpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742725958; x=1742985158;
	bh=rEFExDG0DgUmP8S1Fyzj6/pKJXTe3E+Sz6RF5IpWpsQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=NKBcmdpb6OoAOBWfB3nWSjf4HGihO1PkHgufLY08//j4JYa0SK2KCZkS6FAc0h1ZX
	 i06i3S7zC81uIv2HXTjFQAP223hXaVe/VtZJ6KUKEMUXCT1L1IKRutYzoaggZh2WP9
	 NOiHiMJfGap7nEPKoEljFWr/GeUtwAxFdS+PwBMZtfz1Uhpyip8TzAtORWXFxrYL49
	 LD2byOr4jtxlLJKOMXKZt55W2up0V/GpoIfk/Au+FNpmYArBmwS+p6SxTRo5h+MO/t
	 fLbgmfFo3+46U0zC+EOZkAx3WjSMIEOEKrw7gHPOxHw2yJj5qK81a8vln6ch4/izVG
	 efEiCqQLjYBbQ==
Date: Sun, 23 Mar 2025 10:32:31 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/17] rust: task: remove use of `addr_of!` macro
Message-ID: <D8NKSFPTB0OG.3QION5HVGH7CL@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c83f0c40be50c89859a9bca3b25058e5eb809b71
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> The use of `addr_of!` here is unnecessary since its immediately
> dereferenced. The main benefit of `addr_of!` is to avoid intermediate
> field loads without immediate dereferencing, so there's no benefit in
> using it here.
>
> We can achieve the same behavior by directly accessing the
> `group_leader` and `pid` fields, which is more idiomatic.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/task.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

