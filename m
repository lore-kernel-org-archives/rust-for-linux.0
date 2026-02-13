Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4D17260D;
	Fri, 13 Feb 2026 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770992784; cv=none; b=PyxEt/exh1vacKe85gFH02r5yQVU7UA1OQEdq8JgUQJzYJCPGku0hNKW4/hjVAc12DKxURYTf3ev8FxmbDwLxVAIx0ZHB1cLjJzaMxTZVPkjCa1wpSfc2ABWV8l1+JK5PwpNswZPXT/AhD3ff+qzt2+E+H2wP0VMsuIYYbnJW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770992784; c=relaxed/simple;
	bh=6WxTduzf2yw11XLl9LWryJtmFhCxf4ZXNOC5WaFzXNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNSOqnpTzFiK3bRdyVSYlQvrD4eIE9du9QxCzDlCtJakojIbqcpLzGbW83NKkWhN+xoZ/DExW6VeHW2kJbZeD9Geggf1PJE7/lCuuZ2kwHGIYsqB61duA1Mf6Tuuf1PCB/4QISKHao5KSyB3cW21eFoeY3Kb/K1dbhQ4qQF+1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j7PqD45M; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j7PqD45M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6WxTduzf2yw11XLl9LWryJtmFhCxf4ZXNOC5WaFzXNA=; b=j7PqD45M8mqtAPftgrs3JShGuZ
	uZykIkreokT91r6p5826aiJL+XTjhPOWTjBAV1yMnJbfOu8q9sC0zRX4kLn4QcCsoFaNQtGZpzqgx
	wDzrDys1LsY6Lz/omDFT2gpYBalS1drwT0CwiAc7glYzTWtUUmfKTHgm3dMkkMNa/p2Yme+n7yYXZ
	i+h9oD/HNaw4tmwNt08weZpy3wcGofFYWnkOQbG9YzzGeHEJ1XG3likxYLsTCG8r73itxNBn526E/
	97KvSHdcbFwOAen4ELbjM/38VS+uf/6eBQKFonJDkMzBE/DGkNKt/Y8ow3IleLuc/oP+3wGwmOQFw
	V33S5qjw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqu7V-0000000CKkR-0wdV;
	Fri, 13 Feb 2026 14:26:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0BF0A300969; Fri, 13 Feb 2026 15:26:08 +0100 (CET)
Date: Fri, 13 Feb 2026 15:26:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873434u3yq.fsf@kernel.org>

On Fri, Feb 13, 2026 at 03:13:01PM +0100, Andreas Hindborg wrote:

> C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
> driver [2].

Right. And that is *fine*.

> Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
> informed these are not safe to use if source or destination may incur
> data races, and that we need an operation that is volatile or byte-wise
> atomic [3].

Safe how? It should just copy N bytes. Whatever it thinks those bytes
are.

Nothing can guard against concurrent modification. If there is, you get
to keep the pieces. Pretending anything else is delusional.

Suppose the memory was 'AAAA' and while you're reading it, it is written
to be 'BBBB'. The resulting copy can be any combination of
'[AB][AB][AB][AB]'. Not one of them is better than the other.

No byte wise volatile barrier using nonsense is going to make this any
better.
