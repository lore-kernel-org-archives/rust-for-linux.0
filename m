Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784E3C0605;
	Tue, 17 Mar 2026 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750680; cv=none; b=DXFyhSoRfS8vEOMIrWFomvsUylFf1a0ExvNhOie+ZWhNTh2AnRUkg1YuBscM3U3me0q1O+o1i0hUqNgclX4TxUArFDDCLw3lGNvP4Q6ac9MNr7KMIUzImlLJ5JXeRlJwiAG7uZXbguyaa0Wfnf2iUK7kMYIp7ZSiEwm0JFvd4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750680; c=relaxed/simple;
	bh=56angGCweoGn9FLhrMkqisw0KYpqcITVs2BooUSEKc4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MaY5rf3ED4So2NElB6JXjwM6chVzt+LCVLvSUpaH7L9Z9St6K7wXGmpJ0F3qtyPYslmyory8nmRTmcCUAMj0Zx0zbDdEbhe/846QUpkOEVqS+WU2MTkqzSJMQwzdNtuS5AInfZlXDQTk145dlh46bX/eYtyA6n9WhpaJZOpdtB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFuhshYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFuhshYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081FFC4CEF7;
	Tue, 17 Mar 2026 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773750680;
	bh=56angGCweoGn9FLhrMkqisw0KYpqcITVs2BooUSEKc4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=vFuhshYdAtDydW8t1pwnRKL59aVXpcHA4tI0XQjWcT+xnVXNigksOjybgBMxFmdpo
	 jXhC8dYlvzBSI2m1LCctuEUF23MEYphII0zp5NMl8V3W6egS2GjKAUH6QsXAWv+b8q
	 rfSnM/ralK5e3V3ik+V9EamLu4k3wnJ3Sk2wSF3sHB59CGa2DfGGXc5iGk2rvG/WOf
	 RQ+mT3D017NDBhZlRbQ25BzolqfHihko3nH0Xup75loBIyI9InyYnnrwHYD8Q4xqk9
	 oxT/+JC0nGk7nHv7Offax699j+T95jHi1cPtpz07gg+gdMCSYOZBFRyMVuS319qSTS
	 kdV+tQm/JInTg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 13:31:14 +0100
Message-Id: <DH524YJD4UD3.HLHJP0AM401N@kernel.org>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Tvrtko Ursulin"
 <tvrtko.ursulin@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David Airlie"
 <airlied@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Philipp Stanner" <phasta@kernel.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>, "Sami Tolvanen"
 <samitolvanen@google.com>, "Jeffrey Vander Stoep" <jeffv@google.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Daniel Stone"
 <daniels@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <shashanks@nvidia.com>,
 <jajones@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "rust-for-linux"
 <rust-for-linux@vger.kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com>
 <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
In-Reply-To: <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>

On Tue Mar 17, 2026 at 3:47 AM CET, Daniel Almeida wrote:
> I agree with what Danilo said below, i.e.:  IMHO, with the direction that=
 DRM
> is going, it is much more ergonomic to add a Rust component with a nice C
> interface than doing it the other way around.

This is not exactly what I said. I was talking about the maintainance aspec=
ts
and that a Rust Jobqueue implementation (for the reasons explained in my in=
itial
reply) is easily justifiable in this aspect, whereas another C implementati=
on,
that does *not* replace the existing DRM scheduler entirely, is much harder=
 to
justify from a maintainance perspective.

I'm also not sure whether a C interface from the Rust side is easy to estab=
lish.
We don't want to limit ourselves in terms of language capabilities for this=
 and
passing through all the additional infromation Rust carries in the type sys=
tem
might not be straight forward.

It would be an experiment, and it was one of the ideas behind the Rust Jobq=
ueue
to see how it turns if we try. Always with the fallback of having C
infrastructure as an alternative when it doesn't work out well.

Having this said, I don't see an issue with the drm_dep thing going forward=
 if
there is a path to replacing DRM sched entirely.

The Rust component should remain independent from this for the reasons ment=
ioned
in [1].

[1] https://lore.kernel.org/dri-devel/DH51W6XRQXYX.3M30IRYIWZLFG@kernel.org=
/
