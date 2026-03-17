Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CFD3E3C56;
	Tue, 17 Mar 2026 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757999; cv=none; b=o+hl30kMnQhJxglnqHmldOOPmsBgUK6D/f51dhRI0QOOe/z+sbDRXyK4PLlaJCtIGoKfvBeIXWgxcHUMs1K1ip/aILxNiE41GF85WjJm9rMdMJuQ4qeP3dfXHMvVW3ZAZ7YNpVTUwx86J8BScgdT99m90qw3ePvY7KtA/KEpcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757999; c=relaxed/simple;
	bh=UMKGlEB6GEb6d3+ga9RF5Uym94ud3HWbnp9OP+wid2Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Y5qn1p671Kl6/oXoiGI/5+uZFupMxhUKZlji0+rUBatWoTBW2gjZ2e+s9ddd+lRE/Rc3WRKcYFnMkKioybUs2KUQsX+N84IMSsao97H7SO9wOhesJp/yKnL5JZRtjc2Vaztsf58EDBAQpsad3kUezOH9srDoRfFr/Mid3ED6QjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HF1ZiEVK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HF1ZiEVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB59C4CEF7;
	Tue, 17 Mar 2026 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757999;
	bh=UMKGlEB6GEb6d3+ga9RF5Uym94ud3HWbnp9OP+wid2Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HF1ZiEVKHe1ymrCoIKfF8q078IFJHcAcjYeIk1K5k/X6OPIHqRshn79IVh/mcojhc
	 Qkl72/vCSsXRxwiK010QnUwPMfPCjYLEkdjOF4b0a3HG+9qyQRiEc6+Rr1SpQ33Gts
	 KpZOTikBPCsb2OpgbWLjO8GfkhCkhNPPyZGDYozdrBNOppFo624sX6QOlNNVhmsIXs
	 vYMqlNWWVGebdNOPNDxH5+n+W4Uc8rTkNT5i/mpH7xsVZYGFvXYUrtTwCnddqPSCAM
	 EWlA1c1eDfUW7hPp9kFlaCSIPTR5jMzZN/pjtbwcBFys0XRPU2/oBE3n9e6o+JdNKf
	 KVZnlBDjxvL7w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 15:33:13 +0100
Message-Id: <DH54QCVVTUZD.3L5VPUW8B38V5@kernel.org>
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
 <DH524YJD4UD3.HLHJP0AM401N@kernel.org>
 <974E3052-FCA8-4985-A37D-A1F49C06A77C@collabora.com>
In-Reply-To: <974E3052-FCA8-4985-A37D-A1F49C06A77C@collabora.com>

On Tue Mar 17, 2026 at 3:25 PM CET, Daniel Almeida wrote:
>
>
>> On 17 Mar 2026, at 09:31, Danilo Krummrich <dakr@kernel.org> wrote:
>>=20
>> On Tue Mar 17, 2026 at 3:47 AM CET, Daniel Almeida wrote:
>>> I agree with what Danilo said below, i.e.:  IMHO, with the direction th=
at DRM
>>> is going, it is much more ergonomic to add a Rust component with a nice=
 C
>>> interface than doing it the other way around.
>>=20
>> This is not exactly what I said. I was talking about the maintainance as=
pects
>> and that a Rust Jobqueue implementation (for the reasons explained in my=
 initial
>> reply) is easily justifiable in this aspect, whereas another C implement=
ation,
>> that does *not* replace the existing DRM scheduler entirely, is much har=
der to
>> justify from a maintainance perspective.
>
> Ok, I misunderstood your point a bit.
>
>>=20
>> I'm also not sure whether a C interface from the Rust side is easy to es=
tablish.
>> We don't want to limit ourselves in terms of language capabilities for t=
his and
>> passing through all the additional infromation Rust carries in the type =
system
>> might not be straight forward.
>>=20
>> It would be an experiment, and it was one of the ideas behind the Rust J=
obqueue
>> to see how it turns if we try. Always with the fallback of having C
>> infrastructure as an alternative when it doesn't work out well.
>
> From previous experience in doing Rust to C FFI in NVK, I don=E2=80=99t s=
ee, at
> first, why this can=E2=80=99t work. But I agree with you, there may very =
well be
> unanticipated things here and this part is indeed an experiment. No argum=
ent
> from me here.
>
>>=20
>> Having this said, I don't see an issue with the drm_dep thing going forw=
ard if
>> there is a path to replacing DRM sched entirely.
>
> The issues I pointed out remain. Even if the plan is to have drm_dep + Jo=
bQueue
> (and no drm_sched). I feel that my point of considering doing it in Rust =
remains.

I mean, as mentioned below, we should have a Rust Jobqueue as independent
component. Or are you saying you'd consdider having only a Rust component w=
ith a
C API eventually? If so, that'd be way too early to consider for various
reasons.

>> The Rust component should remain independent from this for the reasons m=
entioned
>> in [1].
>>=20
>> [1] https://lore.kernel.org/dri-devel/DH51W6XRQXYX.3M30IRYIWZLFG@kernel.=
org/
>
> Ok
>
> =E2=80=94 Daniel

