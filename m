Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D014B086
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724955558; cv=none; b=bTjVRoVSDNeDuXD3Q/UkS3+niJnAVs7VuL+qKMHPb7lehje8H3Lptqckgl+X6YqC1ItRA6UDDm6xWAd8vJ+ooJn5RG2MyNXG1qOCDL9J5Kf50pAji5r2UFNd6mVKj5rAMAiRxcKcSBokw8dp0EU4zSBZcRjaEKt4CpFKC5FcI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724955558; c=relaxed/simple;
	bh=h3FeHrXdQcOSknLmzlELlkNf2rblPiuIhon54Vp0OAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1BdrvnMQm22O5Iu/hlFRasa4klxcCfZpIC5DdyF+Z+mcZydVjQjjsClKoHWs2DBmuIP8R7b+rM4anfv/gIGJnskme2axktgjFSZNcVMy5KcwZMsKiU9J/l3u5VeEHBFL2s5JeiupH3WT9GOPAW1dj01VcJ1DBGQKLYXuGO+RHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=j26c9S+d; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="j26c9S+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724955555; x=1725214755;
	bh=h3FeHrXdQcOSknLmzlELlkNf2rblPiuIhon54Vp0OAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j26c9S+dFupn+t1U3Oje/yxSGYbZnxMC/XEXQovK+KqjS8A2fvFAtfj9PTBdmwtv/
	 X8mjjPkwoQpuoJa171IgR3VCgBE3eGv3QWi0g5Idz8IikIi2RSVwIlazVVd4I7ebQC
	 J8LiziINqDK7jJ0IWYxWtKHTfRDiXZhV9csb+fI6wxeY61x1z6T9cAR9zvi5n6L9nw
	 zrjMIFf4TveSj8QOmf/iEOPNGbIHbrABII1Xmym3MMfZFIcOoMxcd0YN3P+g5kx/l4
	 XKwhMpJy9AOPqNsJVEGzYMBDQir3FSlvNAhNhUOoYgf/6nWvxaOYh1jvJaJdbvh9ac
	 pjLHfDEGkuCOg==
Date: Thu, 29 Aug 2024 18:19:09 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 01/26] rust: alloc: add `Allocator` trait
Message-ID: <60253988-37e7-4acb-b2ae-748b30a4ac21@proton.me>
In-Reply-To: <20240816001216.26575-2-dakr@kernel.org>
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-2-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6bc830cb4344c3a2d832377fd8c8b4022cb0514a
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.08.24 02:10, Danilo Krummrich wrote:
> Add a kernel specific `Allocator` trait, that in contrast to the one in
> Rust's core library doesn't require unstable features and supports GFP
> flags.
>=20
> Subsequent patches add the following trait implementors: `Kmalloc`,
> `Vmalloc` and `KVmalloc`.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

We discussed this in our weekly meeting (I think ~one week ago?). If you
give me a draft version of the comment that you plan to add regarding
the `old_layout` parameter, I can see if I am happy with it. If I am, I
would give you my RB.

---
Cheers,
Benno

