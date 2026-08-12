Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E91435531;
	Wed, 12 Aug 2026 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534454; cv=none; b=RDaSCea45Cutv7jAvkmpc0YQuFAkj+pwKCqsP5GOAEsCJ3Fx7FkgvEI3SwKXa2LOO6t5y39ZLp4PZSboOCJMc/Fyvz0MYG4MG1a5gB8gL2PaDvOmvXZhHW6vsyX+7Uk4zfXLjVCvHYWyG7DING2TbNzATkawYA1n06WgojDKr1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534454; c=relaxed/simple;
	bh=nBTiRoEW8QO/FJFjHhrcmyDEv8teQSnGFnFzTPjcrzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRxIEF/sHBWsViLhHUwE7gusp8DziCaj1w2zavUTbdiObsqOMXFdG5E19dUzx9H0C+a54HgqdwIHAEdhzY9dk4PjrVAa+LoJwQADRljQDEmHw+pROZYpqjjF+wKTHaKTa+KudRkoI5znUULPxsDTtESXE64m5VOGgh8KnZcokZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZRuPkjAn; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZRuPkjAn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sNc2iY5E2VBsuWmYwQX4hJPFb74Z6H8owBWeShbqwuo=; b=ZRuPkjAn5okDpRv5O3mn+fPScJ
	urL/Qk6N0GLIzIRmL+MlVLaaC+dPVEmEL8HObIpiWcghhFULLfQ/hH0I/0bEGgYq4PBjzNWro2nQG
	yDdBjre0iIRHQl+4oO61WhC8JfXFQRdQbZgaonBRzgTh+sJigs2gZaP35WF+MD8nDoylqcxBjuls1
	1qSVYz2qS+LqKwotNEozVTOq0RJxOeLrgpnEz1+7E7jeYl+s7RxrGLigPNKBV9qh6/YYtGdP50QFT
	KjOByMvtS9UzCpvPQLTDkSymuSufeix2uUfhj4RE3AK6cFin/hlDP5uLI78dGqdKTP167QbAJ77OB
	yyUmN1UQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wu7DZ-004JR8-2U;
	Wed, 12 Aug 2026 11:33:58 +0000
Date: Wed, 12 Aug 2026 04:33:52 -0700
From: Breno Leitao <leitao@debian.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: configfs: split configfs entry in C and
 Rust parts
Message-ID: <anxaFDVTzvn7cclV@gmail.com>
References: <20260812-configfs-maintainers-v1-1-ba1bd2f593f5@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-configfs-maintainers-v1-1-ba1bd2f593f5@kernel.org>
X-Debian-User: leitao

On Wed, Aug 12, 2026 at 01:21:51PM +0200, Andreas Hindborg wrote:
> Split configfs MAINTAINERS entry in C and Rust parts. Mark Breno Leitao as
> maintainer of configfs C parts. Mark Andreas Hindborg as maintainer of
> configfs Rust parts.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Acked-by: Breno Leitao <leitao@debian.org>
