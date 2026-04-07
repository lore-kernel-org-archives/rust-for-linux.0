Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAC315D46;
	Tue,  7 Apr 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559412; cv=none; b=PG0FDIlzBxcs3lkkbho3MCSsmva5NYirs4sIcR6Rk1f50AmKYXwG4GzcH/H8CzHFiY7FHjH77ykUkai/IVhFZOy/lxt9By+MdSYwGF0wlpXT9A0CdGTubRJ+n88KVurGQFjDU8pbIX4DgO87eXxtE1E6SnVuRQvSNwqvS42f7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559412; c=relaxed/simple;
	bh=vi6h+oU1AtrPwyy216NypW9GBaAGILDhZ2QBErEvkOA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EVEb5tsnnmnv0m0fbiu51i6WuUPfblmVM4IL0GAcz3LNSH+iKS3oKRBGX117TPhtSiOPLnjw2tfMPt00Ej7w5im5/ESCoP38fnCZHvde6dvwJvuaS7OkmlKlLYWEUPGii+hrTfCbBf3rsQdGDBR+R54SOwBqOA5pTQzOnxQdiwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOx/AhKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOx/AhKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A42C116C6;
	Tue,  7 Apr 2026 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559412;
	bh=vi6h+oU1AtrPwyy216NypW9GBaAGILDhZ2QBErEvkOA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=AOx/AhKDiHc6IPL8eZ5Cd6yeXHwdWLO3q5GG1rdSRd/jHZxzoL8qHbsYf7HZvBK9n
	 0wBDJDpKUAXw9z4seUzHWKdix3T7F8h+8NChay46FX2CeeFBXfy5+jRe45QOnSJBRr
	 15Az0YFG4qP9Xi5pddsPUn9e1Nmulcur/Q5c66jTK1qQcn4idCudOK76BT3WXmDLp9
	 f5rZOziSDVpsT3Qkr7SpCmkhayGEIPmLPfOJDrS/zjN+m2DOkcHHepjTb+eotXs8Yr
	 PzePGTHE4PoYZUUptxUscWVwe879QSoMrtEr3sbsxKgwTtwqsyTCjMEizhCNrINRoG
	 SIfocU1brVXOQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 12:56:48 +0200
Message-Id: <DHMVA3S2MZWV.1JN7WUBZLRWLV@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: require little endian
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260406-fix-kconfig-v1-1-8f634499f7f0@nvidia.com>
 <a66916c8-8e82-4e54-8e21-b312a7badfc4@nvidia.com>
In-Reply-To: <a66916c8-8e82-4e54-8e21-b312a7badfc4@nvidia.com>

On Mon Apr 6, 2026 at 6:30 PM CEST, Joel Fernandes wrote:
> Nouveau does not do this, and no other GPU driver afaics either.

Nouveau has nvkm_device_endianness() [1], which it configured before everyt=
hing
else is done.

I assume that's not an option for later GPUs?

[1] https://elixir.bootlin.com/linux/v6.19.11/source/drivers/gpu/drm/nouvea=
u/nvkm/engine/device/base.c#L3111
