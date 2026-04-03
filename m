Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7421F7569
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219833; cv=none; b=OWsDkjUmZzyx6d3AMAQMGyLFAer5IXiK2cMQa0VGSPMaPCtT2NKxRO6k/esr6ORQ8i7r4wCpZxDTgNB/JUr6pShMKVaL+BQQWygqjvlItWfVHC+B9Nyt624ZsDXg631TfGj/3YhSMM4uSpbSqmLeBJ5iHTZZVEzJU4TwcmCPSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219833; c=relaxed/simple;
	bh=fRh/5E60Camf9CwAwswqYjnOV1vjmWP0i88WnW0JKo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAFR7nXyy7YIjXdOyZ1D5sqVj/l/hf3Zf0C1nYX8OpNxp+r5fo8E9hvdr0L9K7EOX6j/sCRcyCw52h+Y32YMeC2uwxTZSn2bd/R2ecJjmOW9GL5nhHKleUoFyHxRIZh6W8fAoliUB8lhEF8K1hPsW/Xkn4ZPQaleHzC9aewVIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=h8oZ5GOd; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="h8oZ5GOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1775219818; x=1775479018;
	bh=0phKXVsn0v8TZI0BZf5p2UfFCsLfctecKR5sy/NqUG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=h8oZ5GOdyATdpVBXfA3dmIwXb/eiBBs7/VaAT5lqR7V/5OTnlUrh6pAGbLaLTDki0
	 HRYDew58+eE+pHJFjNcakQAEclX8OmW2ZH2zmJEhGGvGAs2V8/eR2uSwVrJBsF1nZ3
	 EbuKqUn9q/xUSRK2jTNjWJgW4TfCb/4sD8MteeYHArVaDK7Y9dkocpjf/CVORqa6Lj
	 16O8qwwfvt+F1evbEg6XH4IfN2HWrabpqBbyIsI5u/jzhZlwk8tubl61uZQIxUn8Bq
	 AjjfU/aUqbt2+Fb7lX5d06aN8Ujx52VzGX4FaWz9UF+qrFccbgUgCeUN5PiXCwwU/t
	 eTLjTfNrbTk3g==
X-Pm-Submission-Id: 4fnJBc2DMTz1DDLJ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 RESEND 0/4] drm/tyr: implement GPU reset API
Date: Fri,  3 Apr 2026 15:36:53 +0300
Message-ID: <20260403123654.155249-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260313091646.16938-1-work@onurozkan.dev>
References: <20260313091646.16938-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> This series adds GPU reset handling support for Tyr in a new module=0D
> drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset=0D
> controller internals and exposes a ResetHandle API to the driver.=0D
> =0D
> The reset module owns reset state, queueing and execution ordering=0D
> through OrderedQueue and handles duplicate/concurrent reset requests=0D
> with a pending flag.=0D
> =0D
> Apart from the reset module, the first 3 patches:=0D
> =0D
> - Fixes a potential reset-complete stale state bug by clearing completed=
=0D
>   state before doing soft reset.=0D
> - Adds Work::disable_sync() (wrapper of bindings::disable_work_sync).=0D
> - Adds OrderedQueue support.=0D
> =0D
> Runtime tested on hardware by Deborah Brouwer (see [1]) and myself.=0D
> =0D
> [1]: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/63#no=
te_3364131=0D
> =0D
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28=0D
> ---=0D
> =0D
> Onur =C3=96zkan (4):=0D
>   drm/tyr: clear reset IRQ before soft reset=0D
>   rust: add Work::disable_sync=0D
>   rust: add ordered workqueue wrapper=0D
>   drm/tyr: add GPU reset handling=0D
> =0D
>  drivers/gpu/drm/tyr/driver.rs |  38 +++----=0D
>  drivers/gpu/drm/tyr/reset.rs  | 180 ++++++++++++++++++++++++++++++++++=0D
>  drivers/gpu/drm/tyr/tyr.rs    |   1 +=0D
>  rust/helpers/workqueue.c      |   6 ++=0D
>  rust/kernel/workqueue.rs      |  62 ++++++++++++=0D
>  5 files changed, 260 insertions(+), 27 deletions(-)=0D
>  create mode 100644 drivers/gpu/drm/tyr/reset.rs=0D
> =0D
> =0D
> base-commit: 0ccc0dac94bf2f5c6eb3e9e7f1014cd9dddf009f=0D
> -- =0D
> 2.51.2=0D
> =0D
=0D
Hi all,=0D
=0D
Writing the current status of this work, I have 2 blockers to move forward.=
=0D
=0D
1- GPU unplug API=0D
=0D
On the existing C side, reset failure handling eventually needs to unplug t=
he=0D
device, and that path is part of the broader reset flow in:=0D
=0D
	- srctree/drivers/gpu/drm/panthor/panthor_device.c=0D
=0D
This is part of [1] and as far as I understand, it is still work in progres=
s. For Tyr,=0D
I currently keep this as a placeholder (todo!("unplug the GPU")) in the res=
et path,=0D
because I do not want to introduce temporary or partial unplug handling in =
this series=0D
before the unplug design is settled.=0D
=0D
[1]: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/29=0D
=0D
2- Design decisions for reset handling=0D
=0D
The second blocker is the design around how Resettable (a generic pre_reset=
 post_reset hook trait)=0D
implemeter should stop admitting new work, drain in-flight operations and r=
ecover after reset.=0D
=0D
My current understanding is that the cleanest approach is to keep reset.rs =
responsible only for=0D
reset orchestration:=0D
=0D
	- schedule reset work=0D
	- call pre_reset() hooks=0D
	- perform the hardware reset=0D
	- call post_reset() hooks=0D
	- propagate failure.=0D
=0D
Then, each Resettable implementer should own its local recovery logic.=0D
=0D
This is also how the existing C implementation is structured. The reset wor=
ker is centralized, but=0D
recovery is implemented by the participating subsystems:=0D
=0D
	- srctree/drivers/gpu/drm/panthor/panthor_sched.c=0D
	- srctree/drivers/gpu/drm/panthor/panthor_fw.c=0D
	- srctree/drivers/gpu/drm/panthor/panthor_mmu.c=0D
=0D
More specifically, the existing C side has hooks such as:=0D
=0D
	- panthor_sched_pre_reset() / panthor_sched_post_reset()=0D
	- panthor_fw_pre_reset() / panthor_fw_post_reset()=0D
	- panthor_mmu_pre_reset() / panthor_mmu_post_reset()=0D
=0D
The reason I am leaning in the same direction for Tyr is that "stop new wor=
k", "drain" and "resume"=0D
are not generic operations. They depend on the implementer.=0D
=0D
Because of that, I think reset.rs should not have a global guard/checking A=
PI for all of this.=0D
=0D
Comments and suggestions are very welcome.=0D
=0D
Regards,=0D
Onur=0D
