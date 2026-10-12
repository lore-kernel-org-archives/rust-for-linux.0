Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDA94AE102;
	Mon, 12 Oct 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821555; cv=none; b=m9sw8/OMPJm7WdRSWveL4PRhNyr8hSJBIn7pJqNEAu8xjbxLtotj0d80YyhNAm3SASNba6NbnflTNnxbVjzIz+MDbhrewaGNb7rFpLE21GNnYvhtNQyflwyM5hTgm6nKpi8lxPUcsoca1czDjt+adLoF2K3lTiKGmNZhlgAGdIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821555; c=relaxed/simple;
	bh=4jBk0BqfKfq6OA2JcWH4OFG7l3qjYp6eGHGKvqK6Ccs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZG/EskrjKfWwg2Lhjb7+HYTlZo3pNOChiiHsFzJahL4FuFLpJzHds1WJUk3jkwDRG4usLALHXYK+IdE3shp+OTAPqJfb1EenObA2vjabHD73l4cQRm/syXjw3yuUvSzNKHgbGlvAGbmDYz9zSmm/OF1XC3cv5L9oGnhF216R6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ni+fFged; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ni+fFged"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83611F0089B;
	Mon, 12 Oct 2026 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821554;
	bh=SaLW2FJlto3Qvv7X/qyeniECA7NTJ2pwwpj+4jqSVtg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Ni+fFgedygYDm+tg97lg0hq/n+kkD1IblbhAUblehNd7tLWPV6yQzEhQC3QREd0UB
	 1H40sFcJOBjcW0rV8E0FUiDDeuN31DeRm36yTuV5eYeLCJnffvNFF4rMruHd1bU3bS
	 +4VzIL1AonF4px6+iZhLFqeLdfAreGzotqBCM300RiumaLCoARq8bN4jF3JTl/YcyC
	 uv3tPQc/I1Za0rFYgR+EdwHokM6MqqqK/tGGeQbSLOL6Huc/KT21G4L7DdB9MK0ru1
	 mt14SWvGOBOGOjf+3l6q+EtyuFJc/jSrpJAtZpwMDtdvVaQKc0h78Ubn12zNQKRH72
	 MIoks0m3OOmsg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 18:12:31 +0200
Message-Id: <DM2ZQ8WLXOLQ.Z4U2APODVLL1@kernel.org>
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with
 RegistrationGuard
Cc: <sashiko-reviews@lists.linux.dev>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "rust-for-linux"
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260814230923.1292966-1-dakr@kernel.org>
 <20260814230923.1292966-3-dakr@kernel.org>
 <20260814232106.01AA71F000E9@smtp.kernel.org>
 <E989BBD7-DF97-4384-AFC1-3D7448A1C747@collabora.com>
 <DM22LS0S86HB.2G9NWE78JHV0@kernel.org>
 <0CA5ABE5-C198-45D5-B393-50AA219D6F14@collabora.com>
In-Reply-To: <0CA5ABE5-C198-45D5-B393-50AA219D6F14@collabora.com>

On Mon Oct 12, 2026 at 6:06 PM CEST, Daniel Almeida wrote:
> So you=E2=80=99re saying that close() can be removed entirely? Or did I m=
isunderstand?

Not entirely, it can still be useful when the driver remains bound and the =
DRM
device registered as an optimization to release resources early.  It's just=
 not
useful on / after DRM device unregistration / driver unbind as it implies t=
hat
those resources are released anyway.
