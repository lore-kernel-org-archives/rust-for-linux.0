Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00553B0AC8;
	Mon, 10 Aug 2026 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400393; cv=none; b=hi90x7FsPvGAIIAaOQ+yFG/JQUOjGXJH99sLkbuSF1J6l1NrKbo+FmAy485yLRKVcVvvtMU+A0QDFtDUQmM3XDZfiyRBdJzllpwSy8AzTB1AljRRSD2mK8ud+TW4svtKaPEClAJwxm8DwkN5K+TE9AUccRc9ufBGyU2+yVSP+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400393; c=relaxed/simple;
	bh=6VzMGGCDKZ2c03Qb8RlyKh4sDgz99VXrq656Q+K06uU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=i4VVnFwll+qyKZvrLeyjhCvMyTyWMN1g4WucTbYQltqfMGiVGlLJgbPCacyWwOxEpIkSr+PFrCluNQBi6/ADGt+sJOhOc5Ocjwnl4QStSC+0q3IwSgaPgp86LfzTVONbfWIZd05UW4uLCkxriPGdJZGTx3lsw/uabnxzIviUMmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS2tcSz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS2tcSz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CAC1F000E9;
	Mon, 10 Aug 2026 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786400392;
	bh=6VzMGGCDKZ2c03Qb8RlyKh4sDgz99VXrq656Q+K06uU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=CS2tcSz+axRoEgTMw8bybfVdLgPQpcHkuaKP2eI6sRWr9ujRcu33nlO062uM1HvjI
	 JWhqi61kq0xMaS7LURblKY4X0emgbNZnN1XsJ0b6QN+bu/Ul1wNfH1+eIFqr+yRZP3
	 rASH6B5XTMS7k6SLhLM3vBhVu9mMroZqMqvxwEt/Tt2g6IcdClONucpmfr0+/N/bYn
	 DaH7BApanFI4CuCgUFw3lzPeB+Puf9xl+lnC5DrnHZQh/2E9uSug8xEmhJ/6BqMDA7
	 eekpbrxp+lSk/GepcUjt64yLzXCg7ka9nX0zVb4TZjMwDFDIeWa1wygbzm0Zo0J340
	 oqwQtRPnmDWKw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:19:47 +0200
Message-Id: <DKLM34SJR4GR.11ABPWKZJSTK8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 3/3] drm/tyr: add GPU reset infrastructure
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
References: <20260708114358.957305-1-work@onurozkan.dev>
 <20260708114358.957305-4-work@onurozkan.dev>
 <D388C501-9903-44A7-BFD9-3BFD91502FAC@collabora.com>
In-Reply-To: <D388C501-9903-44A7-BFD9-3BFD91502FAC@collabora.com>

On Mon Aug 10, 2026 at 9:44 PM CEST, Daniel Almeida wrote:
> As I said on the cover letter, I'd rather keep the 'bound design for now,
> leaving the door open to the Devres approach that we will eventually need=
 in
> the future.

What exacly do you mean by this?
