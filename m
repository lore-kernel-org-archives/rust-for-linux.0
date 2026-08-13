Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0812241D641;
	Thu, 13 Aug 2026 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618581; cv=none; b=MTNujGQKn3IusYHlvGIhMZwoBVPbJKp0jQBffyH99Uw7vThMpmN6GY7cI5qtMRg9oNWZEkqcVwxPcoOp5uTYZz6qNZZRtvAvPyupEV3x20/bAZEEHTAYrLu5NnsgU6LpWDE4tEjgrn3PigfMty8HqgLcHBmLJPoJ9qOKLezXlZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618581; c=relaxed/simple;
	bh=aWlrS+4xxmEiEVx+PtCe15f5FXxI0/nGpNI0TJWQmFs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=N7ne9UMan3CMKMA2u+P/5B7WKGVtyxIdQDxf7YlLJOQn5qI2nqX13LwrKk1278rPxWPNS+5IZiUuulQmuq495XQO5mMx/mx74Xq/y1vtYEZqoSJjpAckGbfwNj6eOFp/dicB8nOfSTl48Ufxz+N58U8K01G4xjrRY2YWK0rqu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpfjxN0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpfjxN0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D401F000E9;
	Thu, 13 Aug 2026 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618567;
	bh=aWlrS+4xxmEiEVx+PtCe15f5FXxI0/nGpNI0TJWQmFs=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=OpfjxN0c1LVRbGxyZr80QT7zpz9wsWqb5B325j6WFKxpVU/9xBggEmqKtmhGblnKR
	 MpeFc9u2PAEwllykhqpcO1xAZDPGAyA05n0XZOvCZUhaghv+btZlAvOctd5JW07Xj0
	 k6docWHSaO/WlaYTurttQD8Pk7AQfO5FD0pBh8hJucmayc5EJoIJdUQLD4A+I6bwUn
	 sE4wbH57bZhu6rNMfuYpGLYM7SIrxI3ZI48i1efVGY7RF5a9uVhoaIqNdkhhTCMUIV
	 iPx2s2scBSTW6nh80qlnUfjskQYPNSAK0n/3rEm06AuaLI2o46XX4Q/cu3uSBcOTm/
	 kZ6JPrbZA+nOA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 12:56:02 +0200
Message-Id: <DKNRF8W502AE.VFY7PMSK7T1H@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] drm/tyr: add Job IRQ handling
Cc: "Laura Nao" <laura.nao@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <kernel@collabora.com>, "Deborah Brouwer" <deborah.brouwer@collabora.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
References: <20260728-tyr-irq-v2-v5-1-59fd9dea952a@collabora.com>
 <05F30B5D-B353-4AE3-933C-B42FBD35CA4A@collabora.com>
In-Reply-To: <05F30B5D-B353-4AE3-933C-B42FBD35CA4A@collabora.com>

On Thu Aug 13, 2026 at 3:22 AM CEST, Daniel Almeida wrote:
>> - Renamed JobIrq lifetime to generic 'a
>
> Why?

Please see [1].

[1] https://lore.kernel.org/all/DKAINVQDNE79.3JRKZDQJCSX9@kernel.org/
