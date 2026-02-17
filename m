Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2E32A3C1;
	Tue, 17 Feb 2026 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328044; cv=none; b=t8cAZokpn9jrp+w866LvJte0EKYc+DRS49CCjLhqL/46DDpswk2KXrp4foyKgR2Xb6nb6gsXIK97apgMX7ydyFaf79cZLZFNXr2LfxoyNy5iswKvXloaFdWChHZ4HC5hVjbFyX3IWX4A8G6PG2huu/hwPakkQw1h/L5EBuycEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328044; c=relaxed/simple;
	bh=LV3jUL2UP1KL2QagXkM8DQrfPbVTS+RWLcvVnZs54XU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ECUNReZXA8jpnUkGgF1BvAUtEENPnPNIcZOPCMpygb9dTYnFeNbyQUlCZ7tyHEHQRzbcSN2x8icwWy86DO/ywZqk5JyXHLJDwMtBpo59b422UGvEbNOLdIAZwDaQbQMd4bChYXyQWXFEXtUod4skl8P/8Ju2Ja6ibEc6KGtnyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMwv43k3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMwv43k3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5638C4CEF7;
	Tue, 17 Feb 2026 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328043;
	bh=LV3jUL2UP1KL2QagXkM8DQrfPbVTS+RWLcvVnZs54XU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NMwv43k3/ARhjfdEv+5CuqpT5SjuOqHMOOfr2nDH+cKFv0JJroEQLoMQaTbBQfSvl
	 UdqGTtHdh8/jg0/24VzWirWhYaxTX4Y2UL+oL231uye9mCgq0ClrRZXNMlT1YDN48u
	 +7T6EAX0UkTZhZCMtNVcoGDJ1lVHRW+lgFO9J89iBEiC4NKrU0hQ+zonWqaUgx64fB
	 rqkOTa7swYjXt10isbzgDiKWV2M5/VCe7Pc12P0lS/siSnolsR2sgUoOlSms7u2flC
	 grAokBAFSOA1EUzpif73/NEqjWCcxQssJy8DTAvwCSq/DhURaUPE5h2m8s4qDDaggD
	 vF4xyP/qRrrlw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:33:59 +0100
Message-Id: <DGH7DVJRH25E.2C9F743QLF6IA@kernel.org>
Subject: Re: [PATCH v3 0/8] gpu: nova-core: miscellaneous improvements
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> A few simple, loosely-related small improvements for nova-core,
> including reporting unprocessed data in GSP messages, removal of
> unnecessary code in GSP and the sequencer, and leveraging the Zeroable
> derive macro and core library's CStr. Probably nothing too
> controversial, so I plan on applying it soon after -rc1 gets released.
>
> This revision is based on master.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With my comments in patch 7 addressed,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
