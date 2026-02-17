Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93828640F;
	Tue, 17 Feb 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327991; cv=none; b=JNS1KzKTOnC7+DWOIBfTK17gn0C7B33ra8uh8xmxhhtXj6bzfKkgH5S1hkPx6j2RaupixKYE29c2+2dub5t15AnQ5WDwTqoW/4zkVY8RKSvSWjuJxAITno2a03KhUe7BbMBZ6FYMlCYivQ99aeswgBTgvGwBziApbQL54rgIs0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327991; c=relaxed/simple;
	bh=uoRAXvmYWx2i1bPxXi85jlUQdsQ7xtn+rljs8en2JyU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=dsefdDcAbqVLLmWJRKrPp5S97+wAbMTsMwohGblCBGSS6cZzlIbFGEgMfWX0Wjfb6xe+sSZdImGbC4LbJ6tW0YXWCJTvw2gSNhTOspWMfGguFhEjqlm0CLGpwPQgZsW8mDYFuLhQI3V19e7qK0k4nGLudMQEr7jmU+2g6++z0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lENEajt6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lENEajt6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3628C4CEF7;
	Tue, 17 Feb 2026 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771327990;
	bh=uoRAXvmYWx2i1bPxXi85jlUQdsQ7xtn+rljs8en2JyU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=lENEajt6/0VVqpbW+LbJsYtgvGFKFp+AXEIGtw4mCLACaqZhIKV+K8+wkX1CHkCpl
	 54R0zqB05jQ+KNnrbRngQVUqlMtOYLvJVhVs0c4BocIoV91I8l4FjfPpdUBwc3ZJXt
	 fgygdfyQ/cNIUYhuLMCMB/UNTWMxd1SsKH3DZMU0p5Rox8UtHHUA/eR4NDc3iuSyfU
	 9srcrx6/n+Vmj05+2K2TN1A6cIwRKfz4JnFgYgZUesJKy1nQaqqxWXv5LiRDHOsg4s
	 Zp2ndCm7SIsmzCES/9Cjl67Lr61Bg2FTlYDL6pOyTVQz3yzAJgnVruzldAlgQpnhKv
	 pMYiQhUm5OTKA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:33:06 +0100
Message-Id: <DGH7D7B7GEXG.2QQCBZYWQ4GP8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 8/8] gpu: nova-core: gsp: use available device
 reference
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> We already have a regular reference to the `Device`, so we don't need to
> repeatedly acquire one in this method.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

This conflicts with [1]. I think I will just drop [1] from my queue, since =
for
nova-core specifically using the base Device here may be better, as eventua=
lly
nova-core will work with both a pci::Device and a platform::Device.

(Which also reminds me that at some point we have to treat pci::Bar as gene=
ric
I/O backend.)

I hope we can actually keep as many code paths in common as I imagine.

[1] https://lore.kernel.org/all/20260123175854.176735-7-gary@kernel.org/
