Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD284582F6;
	Sun, 11 Oct 2026 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728108; cv=none; b=ZhVE8oNqMHm3ETrMgpDIgiY0EKcgg2PjDf1PYjtneKnsaMgYh585wknIH3oMKhVCzCUnM2wujABRZlW9EJx6b+mqtp1TQR/6KSv2/Ns2D1OD0A0AFCgsdfqzGROCiAWgSub8tKwDg+0qjs+l6WKm+EUxHM9W65OgdK7IUFEab98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728108; c=relaxed/simple;
	bh=bl2Nw2AhT90gDQDGPIhRFLgTyPIspKHmGhQ0q/jKfQY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=uiX9v2LZzaOnH+IKG+mp4McPovtlU6xB2LJ3CetOGwtqFocV2jYhRX0HFNPgHkPis1gEbRoQkNYO/3LR6b/MBOzDGIBrrRLJK4i+W04LH9gSY+K801j7VMLqUu3LIXg/Ft4d0/b3LB6NqbNh6iggadhz9Z8zYY8QtsBjQWDbOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fESdRv/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fESdRv/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF7B1F0089B;
	Sun, 11 Oct 2026 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791728107;
	bh=tMb+fCTPASOG+FUIG96jLuenOHATpxK+gnhKNBdRgeI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=fESdRv/POaGngqe2fampDQOt0VE9ZJhnqCICpyHvceCq3QgaDG/8qxV9O9Uyy3x4t
	 92+dQJCAwVSEBhJqWasz6WmE8lLuY0cnHRBhaw1gsxGFPXTFVpRnKxY9Ca3rVZ7BHG
	 jnZ2x2gMID87mLuv+wrhiWAgGX1BU9FdhTYMrL90tsV1tHVjm4XDWvtA/FI52Ae6+0
	 jp6m3yK8deErnGAGsUPbOBG8Qyo0D8sFFlugmAcmuQHFylbNc4FDUiCmvPcT1n0wuL
	 tE8Me0Gh1VMH2CTi3pYgcJiqrhuFNewEpqoE9BEXKJDBZsb3+e8m7+aFbN8To8Yznc
	 ZprmosSCp1qMA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 16:15:04 +0200
Message-Id: <DM22LS0S86HB.2G9NWE78JHV0@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "rust-for-linux"
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with
 RegistrationGuard
References: <20260814230923.1292966-1-dakr@kernel.org>
 <20260814230923.1292966-3-dakr@kernel.org>
 <20260814232106.01AA71F000E9@smtp.kernel.org>
 <E989BBD7-DF97-4384-AFC1-3D7448A1C747@collabora.com>
In-Reply-To: <E989BBD7-DF97-4384-AFC1-3D7448A1C747@collabora.com>

On Fri Oct 9, 2026 at 7:39 PM CEST, Daniel Almeida wrote:
> I wonder if this is a problem in practice? And if so, would passing a e.g=
.:
> Option<&File> be a solution?

No, it's not a problem.  The callback is only ever skipped when the DRM dev=
ice
is unregistered; this implies that the drm::File and drm::Registration priv=
ate
data is dropped. I.e. there is no data left the callback could do anything =
with
in the first place.

> From a purely logical perspective, I do agree that a balanced open()/clos=
e()
> makes more sense than silently skipping close() though.

close() is a pure optimization callback, e.g. to unmap memory that userspac=
e
can't reference anymore anyway.  For the reasons mentioned above, providing=
 it
to the driver after the DRM device is unregistered is pointless, and callin=
g it
when unregistering the DRM device would be pointless too, as any data it co=
uld
ever access is dropped at this point anyway.
