Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF7C38F644;
	Fri, 17 Apr 2026 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412966; cv=none; b=DH7T9utOHe8+SlOwKP6s8W2OKf6k6kUS5JAEPdNlBg838H2clniT5r/AAJpZjD/JswyUM+TDfUKBC1P+YnYPIKEE9FFFQEmybUXQqwGpaWPrpkUnHTdnfadIQ/WBi7RPnkeTs2ZBR8SeYS6hxvUPJMhBoQLzZL5uqORA40t59yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412966; c=relaxed/simple;
	bh=nV/U+prIWJNGHApug0J2tdnjsYA986hzDV/sFd6lTKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2NI1ErZbCOeP+JqBXqf3IBeZ3fEXOnGKyPyDUFmkgGUdq+rSBSHUTSSyoHaBLVKEMh+PouY+wB4j5gF+AZmScTObAZ7ca+I0k/nJb5JY+l1KWtGdEoVyuRpWW8oKjcayCzih7eMxlniQ9BOZvrDXeYDeOmf3LRKw/YPpRfd8XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=cz0N/xDc; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="cz0N/xDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776412959; x=1776672159;
	bh=oZT21xVms6KRsm9WahXjn1zVvI7GSjc+hC4hDo4rYG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cz0N/xDcE5bEdLBrH3t0c5Q77t6NmO37lu0wFY9o24NbWwvmB5WHqLRq5NenQKGu5
	 lgvSYHzGHP6O1HPvoeJD2s4XoqKXRNe8mzjeawx3ZJRn/Gpv3LHffPoJYgqVYaephR
	 I4bEoAcIN+q96bIa3sPmGEpb0TAddnQWy9KQcUxaRJ+ptMz/ClK4qdQcl6rlvnXr9J
	 EKNC9vCceNtuf0C7G3Ry//qCgLR37N1BuMEP9ur3xgP0t2h9g22TA/FTZDHXPWcZmV
	 4/QY021mEAaMvoPBgoSPx13JXLZuhKJjUq0tnPhvIB/TcCFv37hx510N5IfE6HaR7A
	 lfQSkg56D7J0A==
X-Pm-Submission-Id: 4fxnRc60pJz2ScNh
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boqun Feng <boqun@kernel.org>
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/tyr: implement GPU reset API
Date: Fri, 17 Apr 2026 11:02:32 +0300
Message-ID: <20260417080234.111992-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <aeEuZKgnvaz2Y6WO@tardis.local>
References: <20260416171728.205141-1-work@onurozkan.dev> <20260416172347.209317-1-work@onurozkan.dev> <aeEuZKgnvaz2Y6WO@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Apr 2026 11:45:56 -0700=0D
Boqun Feng <boqun@kernel.org> wrote:=0D
=0D
> On Thu, Apr 16, 2026 at 08:23:45PM +0300, Onur =C3=96zkan wrote:=0D
> > On Thu, 16 Apr 2026 20:17:26 +0300=0D
> > Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
> > =0D
> > > This series adds GPU reset handling support for Tyr in a new module=0D
> > > drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset=
=0D
> > > controller internals and exposes a ResetHandle API to the driver.=0D
> > > =0D
> > > This series is based on Alice's "Creation of workqueues in Rust" [1]=
=0D
> > > series.=0D
> > > =0D
> > > Changes since v1:=0D
> > >   - Removed OrderedQueue and using Alice's workqueue implementation [=
1] instead.=0D
> > >   - Added Resettable trait with pre_reset and post_reset hooks to be =
implemented by=0D
> > >     reset-managed hardwares.=0D
> > >   - Added SRCU abstraction and used it to synchronize the reset work =
and hardware access.=0D
> > > =0D
> > > 3 important points:=0D
> > >   - There is no hardware using this API yet.=0D
> > >   - On post_reset() failure, we don't do anything for now. We should =
unplug the GPU (that's=0D
> > >     what Panthor does) but we don't have the infrastructure for that =
yet (see [2]).=0D
> > >   - In schedule(), similar to panthor_device_schedule_reset(), we sho=
uld have a PM check=0D
> > >     but similar to the note above, we don't have the infrastructure f=
or that yet.=0D
> > > =0D
> > > Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39=
c351c38f@google.com/ [1]=0D
> > > Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/29#n=
ote_3391826 [2]=0D
> > > Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28=0D
> > > =0D
> > > Onur =C3=96zkan (4):=0D
> > >   rust: add SRCU abstraction=0D
> > >   MAINTAINERS: add Rust SRCU files to SRCU entry=0D
> > >   rust: add Work::disable_sync=0D
> > >   drm/tyr: add reset management API=0D
> > > =0D
> > >  MAINTAINERS                          |   3 +=0D
> > >  drivers/gpu/drm/tyr/driver.rs        |  40 +---=0D
> > >  drivers/gpu/drm/tyr/reset.rs         | 293 +++++++++++++++++++++++++=
++=0D
> > >  drivers/gpu/drm/tyr/reset/hw_gate.rs | 155 ++++++++++++++=0D
> > >  drivers/gpu/drm/tyr/tyr.rs           |   1 +=0D
> > >  rust/helpers/helpers.c               |   1 +=0D
> > >  rust/helpers/srcu.c                  |  18 ++=0D
> > >  rust/kernel/sync.rs                  |   2 +=0D
> > >  rust/kernel/sync/srcu.rs             | 109 ++++++++++=0D
> > >  rust/kernel/workqueue/mod.rs         |  15 ++=0D
> > >  10 files changed, 607 insertions(+), 30 deletions(-)=0D
> > >  create mode 100644 drivers/gpu/drm/tyr/reset.rs=0D
> > >  create mode 100644 drivers/gpu/drm/tyr/reset/hw_gate.rs=0D
> > >  create mode 100644 rust/helpers/srcu.c=0D
> > >  create mode 100644 rust/kernel/sync/srcu.rs=0D
> > > =0D
> > > -- =0D
> > > 2.51.2=0D
> > > =0D
> > =0D
> > I messed up when sending the series (part of it was sent as a separate =
series=0D
> > [1]. I will resend this properly, sorry for the noise.=0D
> > =0D
> =0D
> FWIW, I didn't receive your patch #3 (even from my subscription on=0D
> rust-for-linux list).=0D
> =0D
=0D
Interesting, it's actually sent to rust-for-linux list [1]. But yeah, I tot=
ally=0D
messed up with sending this series...=0D
=0D
[1]: https://lore.kernel.org/all/20260416171728.205141-2-work@onurozkan.dev=
/=0D
=0D
> Could you add a doc test for disable_sync(), I'm curious about it=0D
> because you may disable a work that has not be executed yet, and=0D
> wouldn't that be leaking memory (IIUC, we rely on Arc::drop() in=0D
> WorkItemPointer::run() to decrease the refcounts), but maybe I'm missing=
=0D
> something subtle.=0D
=0D
I was expecting the C call to handle the teardown properly over the pointer=
 but=0D
I wasn't aware about the Rust side internals on the workqueue abstraction. =
I=0D
will check that in more detail during next week and I will definitely add t=
he=0D
test on v3.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Regards,=0D
> Boqun=0D
> =0D
> > [1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan=
.dev/=0D
> > =0D
> > -Onur=0D
> > =0D
