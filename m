Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3B350A03;
	Wed, 11 Feb 2026 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813936; cv=none; b=HOwII6nrgeV1zEn03cE8eAd0aI9VG1JXvXdl7MX0pEgiExPzI8niE1G2smel7QJomeiY3bLlCQNW1GX25cfOoxLgDObyleG1MjuCgFu5902rh97AFOHgdt0UYl3IYX2iSXWXykZFajw5jjZ/jJPoVYfdxtBTvjvMeoJSAZT2OAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813936; c=relaxed/simple;
	bh=cf0RymvMK2Xd/EWwaqwj6Io9Mjuj8YRPqOdI4Hwblqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YfOaBj7khC/YWLIsLB1PNrJ3SP67h46yuR5fUdwqFCuSD2fE404O1IE+3YfdWPJ9JjY9phZKIhO7pbvHFJ0Gw98nF0ypJI8Wu8jspan8C5y11Z+mzXSjOxLqHji0uFftkSPx54cDjfW4OduPwWd8naK3wXnqfY/yDlUcB3n9y8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geb2S/ya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geb2S/ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3062C4CEF7;
	Wed, 11 Feb 2026 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770813936;
	bh=cf0RymvMK2Xd/EWwaqwj6Io9Mjuj8YRPqOdI4Hwblqk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=geb2S/yaBQcuhgTcx0pO1Knn5CjoSJyI7mHxgvab2Pzkqy+0C13M5Zl3jIn8yWO6X
	 lbnYazn4GQSvPYxlSqQKIcj0sLnYlsW0NOi0u6nCon3J+WnSlb+wW0iZb+53W4RRiR
	 bK2tBOPwOGc+E8VGvK5IH1b/5vYnEYkUcmCBJonRjKfTwnQQkiZsKQfkqCUwt12LXp
	 yiRunhfqQiyq8QNjBIh0J6o5jifnQwGnj09DjLJsKL59zaEW+bsqMlwb1h65OhG82i
	 OY3H4E24WjNC+P+KLuf8u9ygdujgb+0y9K9f17SD4ehenHK4sQzwcAfU3VaWrnqFqD
	 hhELm9HGVjACw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 13:45:32 +0100
Message-Id: <DGC55DWEGVF4.2QGD0EBFPE54F@kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Cc: <phasta@kernel.org>, "Boris Brezillon" <boris.brezillon@collabora.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com>
In-Reply-To: <aYx0a-2eANbM_vnd@google.com>

On Wed Feb 11, 2026 at 1:22 PM CET, Alice Ryhl wrote:
> Rust vs C aside, linked lists are often used in the kernel despite not be=
ing
> the best choice.

Absolutely agree with this.

> They are extremely cache unfriendly and inefficient; most of the time a v=
ector
> or xarray is far faster if you can accept an ENOMEM failure path when add=
ing
> elements.

Not sure if it's really most of the time, but I'd agree with "in a lot of
cases".

> I have heard several times from C maintainers that overuse of list is mak=
ing
> the kernel slow in a death from a thousand cuts situation.
>
> This applies to the red/black tree too, by the way.

Yeah, that's why I would have preferred maple tree for GPUVM.
