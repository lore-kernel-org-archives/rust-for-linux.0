Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475033065D
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 06:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514786; cv=pass; b=eINIZPPbZnn0iVhaaTGj0uXoSi3C8Hn5CqPsgrvjuS6WlOBCpIaQK55yBleq4mBJoZxampPN3D6MaBfc7DQaxUINYwJAxFr/E7vtsWuRd7YAuAyzRb4VUHUXQSPSJgm62aOHrbNts+3c+e2WbDzL5Uq6jG8qXu5aj/o3ivGUWNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514786; c=relaxed/simple;
	bh=OP14j1d2ZzRDj5jja/IAv0HFahg5Gvbb+4QuDi4dbRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWECuyXm7fXxdqWg/OFaHCFeQCN0jwvC5GlB93DfIRW05oZwEgCpg152sOGDO4P8QyRWFwcoOnFVYs3oXHFYHki0bpo6cGvc1wJK24RL63FdQorYgVf5ufDO6nF6g1SLT8Ns6eBox7IuijfjU7PVrPLwwNmOihUNt5/rYLFF0oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFerj0RQ; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFerj0RQ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedf082ba2so40816a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 23:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786514784; cv=none;
        d=google.com; s=arc-20260327;
        b=gnmByxLpa4rST+fvUBUKSFO0ilXJheXS2R3hCTQQch8j3VmJ6xQcNZMqqFKQ+kfREF
         dehE7eJ1rFFa5BH8TfGzpJAMzWH2GtSpLxCm67+CRJV0jfRLiBUHwW7ZA31bWwAOKmqt
         zq637sVsZVMfliJSlc82zc/BB8dZvbfxPdvRsHdV0/6dGZJdK2SuchAwPFHlziOqgZya
         Dj6V42tYd/0HNhI47BX4bQXSfwEjYIzB0zW3h9ccyeuYj3DKRwh0+eRWFvZC2Ktk70O4
         IV009ug0pII2IOF5NunFdjOKh+cjf/ciOFXzR6LobrEkjCWny+JJFKpaDnQZC2ODgx4X
         fnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OP14j1d2ZzRDj5jja/IAv0HFahg5Gvbb+4QuDi4dbRY=;
        fh=bWqx/HC4o/O4Rbe3AnMWJxmM/HAIvYkcl3sYAL72NIk=;
        b=mveGBGz3aFMwRY8PXkImAEPJxhkgW3RNO1j2l/SMtZK5MrbiXK+bdKTm/r7O2mSQ8w
         bHSstAGgmKWTar3QGfcG+K6wnLeRsQ2n1a1RC27Ee0BPtIxT0a7Rz0w/3m/+tavT/iQC
         O0b7s6pPMxQoyN2cAlYk+HB0QsOv4g95kYQ8V3PY5VueVCm7gjLyRQWICCvgCRNGc2vH
         nI0anSBRumtyKZVTlW1FOS8dFMJ9UXGixYf6XZS89Sk5vvKSyVOPJtsUNJNRRls9g25G
         n31zK/YTbhX4JrIZF63z9fYJkIInLUZ9B/Gj3D+zuGCI+bBPhHKppq6WlZfB9iND2U5X
         WWNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786514784; x=1787119584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OP14j1d2ZzRDj5jja/IAv0HFahg5Gvbb+4QuDi4dbRY=;
        b=sFerj0RQvcU6ywq289fDuOZnh7qeQW3of+ctpRqPxi+dKXOB3evKtSEfpVxSxAQRPW
         h+zHRuNtuq4fzFBeYapzhIU25bJUAkoL3LK9nqjKHK9TSamkD37/eqvK8amCgfBoNNxy
         gIu4+ofzD+gJT92BZj9TZNBsQeu5tIV9OvyBVtpSVTa58MtfCBr7eGumoI2egA1WqwAI
         iNNv/OuKHGAXrViPFmlLJCtBRffL6xMtMoDnQJm4jSREwnr3FbZR6xputQIGj0NoCfOn
         bxXL2bownWmELB0JRquzivpLTy+4qG7B+vYfaBTqOALwUb8oRkfIa+Jb16vjd/Bh3o8P
         QLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786514784; x=1787119584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OP14j1d2ZzRDj5jja/IAv0HFahg5Gvbb+4QuDi4dbRY=;
        b=b1ckIOsEBB2CtO7Jq6WA4ohq0xs/g7JcJ8caVOlokznnl7yjCa6ppRI8/qcEbzhCd5
         jtXaCn8oe/oaqeo58rWamMyUkJIqnDXgGmaT1Z3wOFq+0nRIVjimDECnQB0+c3KALDFG
         ek3/tsR94XOrxRKE0NEBR36cTPIGDmuxTXiPAVgXIoZfc+e/pjX4LltYfXWWW9oAkUkx
         GdCijN5ebFKa603RK3woBdCzS/ObTvT9CNP2E4fXKyz34K/76wmxZP79VYqBQ2QzlunW
         Elywe1f1Z504zqYiQgp6uv+yBKnO2h5gYfLWG9f7Xop3q3gXcehojFzZL+OGmX3cO0Qo
         UddA==
X-Forwarded-Encrypted: i=1; AHgh+RpV/bPFHzOMeUOgktlZisW/GdVgmFnrsa4bebVVyynBRDgjVcX0neOMoxddv5Nmugj5s/k6WABcEo1obSRxrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9cq43dai/rsf46jJJWwmaF/3MAGe3WMO+N6ToUUM5SAw385D
	Iqitieq1UKp+sSJqi0cO+qnEWtimWE4AOjYv+B34KWFG83FAya3WlB+nzWW8LASFWqEJpw9Pcb/
	SAovE3DDmR1Yo4AB/OSvZrg28rnbFNBU=
X-Gm-Gg: AR+sD12BjoFjrSzZtSX9TZZiqRgu0LxCZRF17fEPfY4SSQGPb9VmwymGFeZGKux7D7c
	YJhjJMo5yUovfgtzb90A7S3XgqWBAJ4X8xTslvF/iGEcgUVyaIctZcY25zO7dr34aHS7Hf0ZUlW
	jNlfThN9Ah15GPbUP8Au/2RGoyiayZ82SSTaXUo88pPzfaCZH3M5FwPL3c+APxpzouPbiEbqIFK
	9/ICKMuMXoRjiZnXZK8jQvZOlPwSZK+NICwGDaDmb40wD0VB2RCtMhHHoWbOTrGYFFbKJkcyCmF
	CLOqMOP6K3I5a54OFR652phk3i1Z/5eShX809PxZU8iVdad28TKm2YMzEhqO0dzpMrO33IW06fO
	+LM5krO6qDNH/I1wo4rcBushq1cDt9/moobBoN0sZxFEAOsDvU04+DdXMHDZZ3Q==
X-Received: by 2002:a17:90b:580f:b0:38e:6d4c:14df with SMTP id
 98e67ed59e1d1-3930121d20bmr1952709a91.1.1786514784074; Tue, 11 Aug 2026
 23:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811150147.1360102-1-tomo@flapping.org> <20260811150147.1360102-3-tomo@flapping.org>
 <DKM9KW3ARL1K.1JFJOBOB5EDKF@garyguo.net> <20260812.090516.1638662871785456326.tomo@flapping.org>
In-Reply-To: <20260812.090516.1638662871785456326.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 08:06:10 +0200
X-Gm-Features: AUfX_my01Um9d7EZIuX66LDFr2Rf4YYPkCrGU0Fco0AbDfQ_ocK5t9GVq-lVv-U
Message-ID: <CANiq72kuOa-EKj7MHUwzjn4WiZ9f9mWJbuYsfe+PcrWgN2PgfQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, ojeda@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:05=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Miguel, you suggested landing the minimum set, e.g. the first 2 or
> first 4 patches. Patches 1-3 are already in, so that leaves patch
> 4. Would you like to take this version, which clamps the result and
> has a KUnit test that fails on arm with HZ=3D1000 without the clamp,
> or should I hold it for early next cycle? Either is fine with me.

Up to timekeeping, but it is very late and I think Andreas was already
on the fence of deferring everything even before this version.

But I appreciate that you reworked this very quickly as soon as I
found that issue -- thanks Tomo.

I am happy to give a tag or similar if needed next cycle for Gary's
use case etc., so it is not a problem.

If we were to actually take it, then I think that, generally speaking,
any version that works in all cases is to be strongly favored even if
it can be optimized/improved later, i.e. what I think matters the most
is agreeing on the documented contract, i.e. to agree on what we want
the function to actually do. Function bodies can always be improved
later.

Cheers,
Miguel
