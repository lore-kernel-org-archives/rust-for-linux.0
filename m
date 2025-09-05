Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D42FB0B4
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088366; cv=none; b=uFbAQDCAli2rdF+C1r2zq2lDutmyUw8YZY5GeZrL8Qwrzv2dwQ8YOakwHXiMMnn9EHDytToWtZfRFX2S6SwkrTL45S7o1Wp+6Ok7Fgqj7aHXBnY3PtBrlW2rFlYuvWPNoz8cHawPWWl2r7BROBU23x59SGMy5sQo2W2eeNBSnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088366; c=relaxed/simple;
	bh=rbw713hpMczR5niSgaTPGzwcXHv2l1ZgwbQtx+R+Ri0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLegStPGKmkP6FOf/l7PXOPSYnZMWsUIuB0tVye4cBPEquCcpYIKu8KoD01fcUrTykGGNVOErQx4ERK5pKtJn8/tJxQve88kbjLwYRYjzxLTZA43bi1R9qgbxunjM3GLLDrjr+RgTQTm8XKm1RygdELFKPo2vkbpcmA3Scmq/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d4/sKj1K; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d4/sKj1K"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336bbcebca9so17894501fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757088362; x=1757693162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lihAk1zlJzbEEWglnO/tBSIm+NSFxuLLjYLLkgXyvA=;
        b=d4/sKj1Kb1+oRWComTE4mbt+UCEXtLeoxfUfDidsoiJdjtHXX0tV/YpnFp2nqkokif
         gpB4MKtoGOcEPpyqqWFKFZd2i7M3+C9RqAvjyBj08fUl97ibKGpdJqkKuFnbDytAJYl9
         7mItVlNYM0H0nDLFunVgQH/2HSIM46/A1gx81ttFw4BeoXWo67I2WGmdoyzAUToWQVLE
         ZmkZEMTqwvjl6LL8Uj6JmOSB+CBj9b8mejlE2WM50OUDq5uhnh53Ph3Jfo7DDkkVpWar
         gYq7tWZ0en58/MZEM3GWWfDrvcWdJy6NTNrMrU9ssy3IX3e/m3jPCSrUjETaAxi2oJzI
         jtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088362; x=1757693162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lihAk1zlJzbEEWglnO/tBSIm+NSFxuLLjYLLkgXyvA=;
        b=QcENT5pd5FRxx4pXIkRBs9ijRkLLTBmfm8qh88LEi1bzJeY8ACV135OjlKs8Yg0tY1
         rf8GekGb8ZeBTc5Xo/lCV7uRSrz7sCFkt9lGAsEtVE7dJ+m+QsNkL8l3HYuCcou+cg05
         aC9VhCqiDocBFt6sUR0bmToUOCC2m+KyD6fnAvQkYiwIZc5rH61KezoslOJ6PhpfdjmV
         6XN35Cme4I/LAwgJAXarppze1uR6JMWI6DcDk4iGM60laLvZtkdEia21Dhr2M0VGUK38
         oIZEeoveQOir3y/JH9YHfaR3kVAcDWoufEKNDzkAIdMsS5AHS01I/OcA2DxdI+yfx+Gy
         e40Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk1rXVr4O2ppd/JGhz/zVd8/EK/382flp42uEEftwzauQxWgtpBEXRzkl7rGMMBdQK2t9jLnKhvM6pW6L8+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YysDuEp5PDWTyxhdlVV7NHPJCbL5uWg7OwBapb8JgEzrIn41ixK
	PX4PhaEOUL8EuNhF/qoy7TYiVFKsVf3edIGdhzhy5QLwsp3SY72R/1oFKbY+Hhq0LSzumAjbZBJ
	vq+PJG0QVWAdakO5UWBegkVmwUqu3kP/WijV/69FpNg==
X-Gm-Gg: ASbGnctlmWRBc640dCsE9bnHCDzRt0uPXYzNSVT5DpY8ZdsjLAThRq9MzUXwxmT2jHD
	zVOzTKu8HJI46/U/3P7cAcxfgOaxcjGh957+Bqw9NJlVYKdiKvWL3D/SQbS9Vy2ZLqBR2tSpxlY
	LpJwQUMUg4lBVXv5ijG4Qr/axE9E6qe2Lwzt64GIREqDOetvk7pjG6jrtzWRnEXzfJ3B/BB2HfG
	kV8K4kGc9Tfspt/AfQAJ0JADE+eATsH1R8TUR2jjWyj9bXWnAM=
X-Google-Smtp-Source: AGHT+IHXUWQPrpS/b3UZ92Bp9Qullh3Hp10tvBjpiDCHlHGpx0wXOLzSGfwFqlrfxSUgT5ssXvD5Ogmtnh7+ci9swbo=
X-Received: by 2002:a2e:a54c:0:b0:337:e29c:b0d2 with SMTP id
 38308e7fff4ca-337e29cb4c7mr52650471fa.41.1757088362422; Fri, 05 Sep 2025
 09:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905090819.107694-1-marco.crivellari@suse.com> <CAH5fLgiZnCbNLpuphv4Kgsu48kRkhf6wJiSLrrgsqyEDvU3X3Q@mail.gmail.com>
In-Reply-To: <CAH5fLgiZnCbNLpuphv4Kgsu48kRkhf6wJiSLrrgsqyEDvU3X3Q@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 5 Sep 2025 18:05:50 +0200
X-Gm-Features: Ac12FXzpmbrQXYGXnLoh647PhbXI9AifnMkqB6qAWjBBeBaXJW2taXq6Ty_dqas
Message-ID: <CAAofZF4a6ARXOS0rmK5zY1Kd3xdODqdkj_keZmEYx8Z-JRvhng@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: replace wq users and add WQ_PERCPU to
 alloc_workqueue() users
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alice,

Thanks for your reply!

I'm not entirely sure I understood your doubt.

system_dfl_wq and system_percpu_wq are wq(s) also present in the C code.
They are part of the prerequisite already merged in:

128ea9f6ccfb6960293ae4212f4f97165e42222d
("workqueue: Add system_percpu_wq and system_dfl_wq")

Let me know if I haven't understood correctly what you meant.

Thanks!


On Fri, Sep 5, 2025 at 1:34=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Fri, Sep 5, 2025 at 11:12=E2=80=AFAM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > Below is a summary of a discussion about the Workqueue API and cpu isol=
ation
> > considerations. Details and more information are available here:
> >
> >         "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNB=
OUND."
> >         https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.=
de/
> >
> > =3D=3D=3D Current situation: problems =3D=3D=3D
> >
> > Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumas=
k is
> > set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected=
.
> >
> > This leads to different scenarios if a work item is scheduled on an iso=
lated
> > CPU where "delay" value is 0 or greater then 0:
> >         schedule_delayed_work(, 0);
> >
> > This will be handled by __queue_work() that will queue the work item on=
 the
> > current local (isolated) CPU, while:
> >
> >         schedule_delayed_work(, 1);
> >
> > Will move the timer on an housekeeping CPU, and schedule the work there=
.
> >
> > Currently if a user enqueue a work item using schedule_delayed_work() t=
he
> > used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> > WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies t=
o
> > schedule_work() that is using system_wq and queue_work(), that makes us=
e
> > again of WORK_CPU_UNBOUND.
> >
> > This lack of consistentcy cannot be addressed without refactoring the A=
PI.
> >
> > =3D=3D=3D Plan and future plans =3D=3D=3D
> >
> > This patchset is the first stone on a refactoring needed in order to
> > address the points aforementioned; it will have a positive impact also
> > on the cpu isolation, in the long term, moving away percpu workqueue in
> > favor to an unbound model.
> >
> > These are the main steps:
> > 1)  API refactoring (that this patch is introducing)
> >     -   Make more clear and uniform the system wq names, both per-cpu a=
nd
> >         unbound. This to avoid any possible confusion on what should be
> >         used.
> >
> >     -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UN=
BOUND,
> >         introduced in this patchset and used on all the callers that ar=
e not
> >         currently using WQ_UNBOUND.
> >
> >         WQ_UNBOUND will be removed in a future release cycle.
> >
> >         Most users don't need to be per-cpu, because they don't have
> >         locality requirements, because of that, a next future step will=
 be
> >         make "unbound" the default behavior.
> >
> > 2)  Check who really needs to be per-cpu
> >     -   Remove the WQ_PERCPU flag when is not strictly required.
> >
> > 3)  Add a new API (prefer local cpu)
> >     -   There are users that don't require a local execution, like ment=
ioned
> >         above; despite that, local execution yeld to performance gain.
> >
> >         This new API will prefer the local execution, without requiring=
 it.
> >
> > =3D=3D=3D Introduced Changes by this series =3D=3D=3D
> >
> > 1) [P 1-2] Replace use of system_wq and system_unbound_wq
> >
> >         system_wq is a per-CPU workqueue, but his name is not clear.
> >         system_unbound_wq is to be used when locality is not required.
> >
> >         Because of that, system_wq has been renamed in system_percpu_wq=
, and
> >         system_unbound_wq has been renamed in system_dfl_wq.
> >
> >
> > =3D=3D=3D For Maintainers =3D=3D=3D
> >
> > There are prerequisites for this series, already merged in the master b=
ranch.
> > The commits are:
> >
> > 128ea9f6ccfb6960293ae4212f4f97165e42222d ("workqueue: Add system_percpu=
_wq and
> > system_dfl_wq")
> >
> > 930c2ea566aff59e962c50b2421d5fcc3b98b8be ("workqueue: Add new WQ_PERCPU=
 flag")
> >
> >
> > Thanks!
> >
> > Marco Crivellari (2):
> >   rust: replace use of system_unbound_wq with system_dfl_wq
> >   rust: replace use of system_wq with system_percpu_wq
> >
> >  rust/kernel/workqueue.rs | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
>
> The functions you are changing are intended to match 1-to-1 with the
> wq globals defined by the C side. Changing them so that Rust and C no
> longer agrees on what the wqs are called seems wrong. How about adding
> new functions instead?
>
> Alice



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
