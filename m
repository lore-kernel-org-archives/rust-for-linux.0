Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00030DEBE
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776360234; cv=none; b=Gjs5WYD9N9Pjpopo4vEOB3UA228TTb1zQQSmQ4iHyEF8flHfO5Ih1JyKy/faOdi3lKPC7UOtT2eISS/naRhVBcZmnPu2VUb2fZKcSHVXi8S+JQzBgbcR8U2d3jvVkZSiOu16kZYmobRKs/PrxZXFbi4N8SU6tBelC1u2TiNJ7PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776360234; c=relaxed/simple;
	bh=7jR5K0JDU2aqQv9LKEFbJRhj8e7y19nYeff80TvfV/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/FilTnOGZtT7JPCwNBraXb/WUMcmWV9jQtPWgGhT6yfVW1/vCy2+Rm8ZaEG3t5YRs3YWdJnr5sKyFXDi+pmeQLLAQrsAZI+ssffxlpakx3oxaCxjIZnd06Nq6Z1u43erEPPgWnNxg9ME5z0y26/Yux+JQy+zOnpyDE4/QMiRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=oask+gMV; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="oask+gMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776360231; x=1776619431;
	bh=uQhh7fVSeHYthfwhCsVo3JOVslYa6oeMekXrkvuQWs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oask+gMVH+Kf24r8B1EAjCDdwMOw4KUIObsiPI0dKsbjeDerjCZ3kJUeJ+Y/Mt2rq
	 WwMYIjSLd1B/X+GRtyqAtoNzFSwDN8BztiItL8vk1vht8FF6irT3T4t04UPbZw1hZT
	 +s03YfKh6Q+BhpbSQPOMZAGYdOMjby9ARnFScOgtYpoRPCHLLsfqP4MScWsOVSjo2C
	 V0Him0gvrhex8LdUuwFRnJd7YU4WCSLkB6qzw1KWBQoJPwHFYeR9Pr/A7U+orPKmRL
	 kbtZhkL9B4iIfi0EbOAGqb/mm+N3JgMzW9s82Q4KGTO6SZxLllCdKnuqY75W0v65qd
	 wQ4MBrV+aZ17Q==
X-Pm-Submission-Id: 4fxPxd1vCbz2Scm2
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/tyr: implement GPU reset API
Date: Thu, 16 Apr 2026 20:23:45 +0300
Message-ID: <20260416172347.209317-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260416171728.205141-1-work@onurozkan.dev>
References: <20260416171728.205141-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Apr 2026 20:17:26 +0300=0D
Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
=0D
> This series adds GPU reset handling support for Tyr in a new module=0D
> drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset=0D
> controller internals and exposes a ResetHandle API to the driver.=0D
> =0D
> This series is based on Alice's "Creation of workqueues in Rust" [1]=0D
> series.=0D
> =0D
> Changes since v1:=0D
>   - Removed OrderedQueue and using Alice's workqueue implementation [1] i=
nstead.=0D
>   - Added Resettable trait with pre_reset and post_reset hooks to be impl=
emented by=0D
>     reset-managed hardwares.=0D
>   - Added SRCU abstraction and used it to synchronize the reset work and =
hardware access.=0D
> =0D
> 3 important points:=0D
>   - There is no hardware using this API yet.=0D
>   - On post_reset() failure, we don't do anything for now. We should unpl=
ug the GPU (that's=0D
>     what Panthor does) but we don't have the infrastructure for that yet =
(see [2]).=0D
>   - In schedule(), similar to panthor_device_schedule_reset(), we should =
have a PM check=0D
>     but similar to the note above, we don't have the infrastructure for t=
hat yet.=0D
> =0D
> Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351=
c38f@google.com/ [1]=0D
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/29#note_=
3391826 [2]=0D
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28=0D
> =0D
> Onur =C3=96zkan (4):=0D
>   rust: add SRCU abstraction=0D
>   MAINTAINERS: add Rust SRCU files to SRCU entry=0D
>   rust: add Work::disable_sync=0D
>   drm/tyr: add reset management API=0D
> =0D
>  MAINTAINERS                          |   3 +=0D
>  drivers/gpu/drm/tyr/driver.rs        |  40 +---=0D
>  drivers/gpu/drm/tyr/reset.rs         | 293 +++++++++++++++++++++++++++=0D
>  drivers/gpu/drm/tyr/reset/hw_gate.rs | 155 ++++++++++++++=0D
>  drivers/gpu/drm/tyr/tyr.rs           |   1 +=0D
>  rust/helpers/helpers.c               |   1 +=0D
>  rust/helpers/srcu.c                  |  18 ++=0D
>  rust/kernel/sync.rs                  |   2 +=0D
>  rust/kernel/sync/srcu.rs             | 109 ++++++++++=0D
>  rust/kernel/workqueue/mod.rs         |  15 ++=0D
>  10 files changed, 607 insertions(+), 30 deletions(-)=0D
>  create mode 100644 drivers/gpu/drm/tyr/reset.rs=0D
>  create mode 100644 drivers/gpu/drm/tyr/reset/hw_gate.rs=0D
>  create mode 100644 rust/helpers/srcu.c=0D
>  create mode 100644 rust/kernel/sync/srcu.rs=0D
> =0D
> -- =0D
> 2.51.2=0D
> =0D
=0D
I messed up when sending the series (part of it was sent as a separate seri=
es=0D
[1]. I will resend this properly, sorry for the noise.=0D
=0D
[1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.dev=
/=0D
=0D
-Onur=0D
