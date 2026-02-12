Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C5B3C0C;
	Thu, 12 Feb 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904302; cv=none; b=u2JoIK1jUZ84gcHVX4TEk4KWvqT6zCuR+6weZWH9lvtOe/bmRzudeCmGnz7c8KLFBorettpQiDAKy4eY+vNhu0sOteuC5YXfQzC9O1e3FlWHLmR2I2S6NUEFKTKN1c3SAg29IDp7ul73VLX6hfNVBEYBtm6WJdUsSnWPnMN4SKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904302; c=relaxed/simple;
	bh=KXp5PIZr2r6XgFNs8yYqQ4IvMkQUNH8siQN0UWiN4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P0LXGxq6iA4N/J5+ZXJ5slXK/g3I7/N6ueWFf5F1cWzNL+K+abWLwab+LBp7LLLO/taoJvS2DPpZmdP+tSG6IgDcDS9Vor6i9Pv7bTHl6bdIitsNt5p3RG1R1z8gUpE3Nh1ZFy/Eb7rQxrHtnKKcK4vWHgLeqKW66kzSoWdV2ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UZLjdeGi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UZLjdeGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770904299;
	bh=KXp5PIZr2r6XgFNs8yYqQ4IvMkQUNH8siQN0UWiN4b0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UZLjdeGiMtMZvtQ72rGmKiH9yzJ4J2ol2Tg4wVI7ScKbt4Q0qciqdzsfnChroOPM1
	 8U+yXsw+l9pZ41ErP71QygKf/RqzWCZIm+OSJxb5FjlThDF/13Z6FxVbuc5yR8lx9W
	 sKA56VSF9t+ReCfBJxO4LBGGjgLWKxWL1OM/0t31AMk+rHbT5Xi2GN84RROfe03fhS
	 6qi5GC4cD7oYV8dJ9ZPUdT5wEdy+VQ9XJD5DupfjrvqTaKibArLD6ljQhOUby64KRZ
	 b9A/ELZo7p+ojE3ljMB7foLKFh0hvlt85p+RwpJh1yB9FAMp3urCn7y3pdn43ZUq1u
	 cmGRqSNoR8jLg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C870D17E0E90;
	Thu, 12 Feb 2026 14:51:38 +0100 (CET)
Date: Thu, 12 Feb 2026 14:51:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212145134.799bb6fa@fedora>
In-Reply-To: <a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
	<20260212100538.170445-2-work@onurozkan.dev>
	<4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
	<20260212151644.4c179594@nimda>
	<6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
	<20260212134601.7760f414@fedora>
	<a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Feb 2026 13:13:31 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote:
> > Mark Brown <broonie@kernel.org> wrote:  
> 
> > > The panthor driver is buggy here and should be fixed, the driver should
> > > treat the supply as mandatory and let the system integration work out
> > > how it's actually made available.  
> 
> > > Trying to open code this just breaks the error handling.  
> 
> > Maybe, but the thing is, the DT bindings have been accepted already,
> > and it's not something we can easily change. What we can do is make this
> > sram-supply mandatory for new compatibles, but we can't force it on
> > older/existing SoCs without breaking backward-DT compat.  
> 
> In practice you can because we do sub in a dummy regulator for missing
> supplies, it produces a warning but works fine.  If we didn't do this
> it'd be basically impossible to add regulator support to anything at any
> point after the original merge which is clearly not reasonable.

Okay, I guess we need to fix panthor then...

