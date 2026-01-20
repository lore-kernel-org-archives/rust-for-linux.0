Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C43F23B4
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933150; cv=none; b=tb2IgfCmTbQC67OgVFjL/VyePH1w3DKKMRrYQIWkXeOcVFEAV8tgbS89Ll6Cwcg07Cnt9ZfPxX2440whpfDU1HpPr6Z1HZivYC9V4HhnsiYzbSg9SMfQSLahoJzz7fqeTeJ7cPuQ97g0NpIPmwmvjDb2CDpma0oyLIhAa3liQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933150; c=relaxed/simple;
	bh=DZHCHrPai1BOZjzmTZ9umyt/NN5XiM6GOrFB1Vta06U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=M5xdisNMtMnCbgIpRUO7vnqlQkGRwYVjkfo+UnnUaWNgt0betEcE+L5PX12C28M7qbXyFudawphmj1KMkcYPlHPNkr8xnRunkk71iXHESVWaatYSl/6ROBziQMHIKcQDNAs2GlBk1W/DnJBThkgq6yoLVJ+V8LNc8kOrkhR4AWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMovZpB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMovZpB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EB6C16AAE;
	Tue, 20 Jan 2026 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933149;
	bh=DZHCHrPai1BOZjzmTZ9umyt/NN5XiM6GOrFB1Vta06U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rMovZpB8F5ReSdV8dzwdJlwVP3Bz/Wfssa0fCWrr2uhx+5Dafo19U8MrJxk4lDk9/
	 apCvKGHAtRu0qdGfdDH1lrT9pVTIPHVp5XWC/fArUa79TXzV0dduXXF7BDsrwRcJ/f
	 pD44ag4ozatad3RA8uWXcdMuC1n6i0LOvGlbOb59sImEDMHBCsYcazG/23OLPTH35h
	 s9Fh4eIXg/lFP4Cu85jadqgmqmDfCFD/AJLWyWUk/YD7etdiCeScBmd+nsCmqlgonT
	 8LoVzLnq5RNCaG5Lo3oWw6dMjD8mThmDpCL6qfVhsW+C/jn2N35L8bgZTcYGHEajeX
	 Ea/4F8BmwU4JA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 19:19:06 +0100
Message-Id: <DFTMGSPH6EGO.3NVQ4DRVVCDDF@kernel.org>
Subject: Re: [PATCH v5 2/8] rust: debugfs: add Dir::empty() for conditional
 debugfs usage
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-3-ttabi@nvidia.com>
 <CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com>
In-Reply-To: <CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com>

On Tue Jan 20, 2026 at 6:54 PM CET, Matthew Maurer wrote:
> I thought the whole point of Greg's admonition to never report errors
> and to automatically create no-op structures if debugfs was disable
> was that we *don't* do things like this, and instead you just do
> something like
>
> ```
> // Always do this, whether or not debugfs is available.
> let debugfs_root =3D Dir::new("my_thing");
> debugfs_root.scope(data, name, |d, s| { ... })
> ```
>
> If DebugFS is not available, it already returns an empty fake
> directory. That variant of a fake directory is also size 0, so you
> aren't paying anything to use it...

Correct, I also explained that in [1]. This method may be useful if the dri=
ver
conditionally wants to provide debugfs entries regardless of CONFIG_DEBUG_F=
S
though.

Of course, we should only introduce it if we have a user for it.

[1] https://lore.kernel.org/all/DFR7AHOX0T8G.2NB9VOS3IZRZE@kernel.org/
