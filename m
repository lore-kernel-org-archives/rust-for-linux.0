Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A301805A
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072052; cv=none; b=tCWjezb30GTZ3R1uBq+psHkXgPuDvEgxWXWW2AkQV2c1+jwpqN+VQC3BSKwBFy5iB8iQrr8QmIm0Dz7Hd7PI69t22VFZPAa+0SmorBT5hROH7gk3U0WvGZdXQJ7+kfpd1jtA7R7KonwroNpWFfsYFwM7+hR7EJeFSaa4MH0roEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072052; c=relaxed/simple;
	bh=gI79STuomZdL9o6m+TVp0Q1ayFNIxYM8hEwMd4OxsKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9w9HcyecMX7LYO6Iaoop9qyYmxd6YLLZkC0xusLM47ETJBYrUYKCiyC+oSRE0p7XRkc1q66+oc4b7MSIVq8IxxYxpDyxgMShJNo6jP7QlKOj7IQ7yuh+cxdJZ1ELfpIwS08CtnDqEKesFbVfWMnwCREvBsJmK8uV+qE/+UYh4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4YH4z8kC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4YH4z8kC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so1825587f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757072049; x=1757676849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9p8Ednxu5nU/nofok5DmsRxs4m8cs9tVr0AC5pk66w=;
        b=4YH4z8kCvgkDmPvE/9PkO8uWIid/RNEGyCMSsj3swqq5Gj4qVvv29lU+SSKAJpK7Id
         XfUL4qHmOloBF56SR7nLvy5sDRilDn/+lXhv7mRj7EfXMC1uglB1ZImkfjwISAo2/vW2
         givaDEu16fToRRcYdeHEy4AnEhUmMj/m2PCipZfi+CJ5iHAy7FIIZzHzHSvBIHPfUTVw
         tlOK9P5KjCyZC6zvTXM2m/EjYRgJFEZJdEDunED8ePhVeHoMxjmZQ3oBL4JdgZP5+GWt
         fHhxWdmbQNjwQdU22ST08YpSi+5zsOs4wVkYJCm0GjjSIp6xMo7jei2AqSx0TKI4podN
         q1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072049; x=1757676849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9p8Ednxu5nU/nofok5DmsRxs4m8cs9tVr0AC5pk66w=;
        b=EUM+p92+ObWg4jSjETlere3piqn2CE+4isvyBUPxq/IEnpkujOAkuTfuuUxhkbhM+H
         yTdWjpkx3uqiezjHxEvotSM/l8wwV7v5Rr2OTREZ4i/t51k4kTN7NHHnIW26XbCJTCzF
         2/3raAJsuxTiuUHrKGsQ0FUAAR8xZ0O2UrrS9evODiP0keumcXqV5MLNXp9V/XPs3nMM
         Q7iCOo9NlpLjPPEzLaDsp7VdLS8wYMoKcERLLdeZsuw35OON5rqNXFVGTux6BOeWn804
         j1k04oUgoaBqaqBy94QaZNywhTx6/6HHQZCqERnB19abfxekY0Zngc6Ej/0Wd2O4+qDJ
         5yqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQHXbCM/HhvrPz3chiE8DzIqLjjMNwcLLM2GxjFAXLOXouUG1PubqJuZsk1iljQ29xArIVIbla5WHwNkALDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxovbmJy9NHIS5dg+Q3y/q6yBiEdYyqF083Ss3pObMpYqp4sc9X
	w5ITco1DImT8UR7DIyNXCmh8DCRNVrrmnFTPtU9fK9yBIiPLg7iHnh7qX763AfcX8lLTJz8lkyd
	QlJiiL980FDZKHn99JAnmw6LUT/gfV43L9M7x4nGA35w901jzxYTUKjtu
X-Gm-Gg: ASbGncsZZIl66ky1uSm2TGC/tR4N4+7qLpqiaFCOaKaTnyLBCAAt0/nA0dw+6/gPoQD
	6/buB1kImD1oDXIayJ/gItg9cJqJ8le05fjgUKP5ROVLuMH+nk0ObYOEUb9wT5A/PrHtiv0UBUr
	sGCnhRs7zcx0nK5JMV9/3tkIf5Eq2auhsmhUTgf+l5OS1CVi1M6N2ZelW4cohQFb2yjhzyxCkPU
	AU+p3MRAzVZ21PNxj14mRsx8IsOqtXS16ywxKpw6Qh8oZ1EwsHyrMEMglqNpR2e17FBXlve5jip
	wnWS27BLQXLZWQjI8VI4ZA==
X-Google-Smtp-Source: AGHT+IHbm99eCpz6pmNgIVI3YAfPfFjfHgdX/M/7/80v249u9tlCHQ6PgHSANl/f/pJiboTfF/etBph6p+hmyFWS7pE=
X-Received: by 2002:a05:6000:2dc6:b0:3dc:b041:9919 with SMTP id
 ffacd0b85a97d-3dcb0419c22mr9739898f8f.11.1757072048338; Fri, 05 Sep 2025
 04:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905090819.107694-1-marco.crivellari@suse.com>
In-Reply-To: <20250905090819.107694-1-marco.crivellari@suse.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Sep 2025 13:33:56 +0200
X-Gm-Features: Ac12FXwOFIo7MW0Xq1R5Gef_lsZ8di8V-7GrfYQ7fe3KT0Rs9Jyhi-v12jX7llw
Message-ID: <CAH5fLgiZnCbNLpuphv4Kgsu48kRkhf6wJiSLrrgsqyEDvU3X3Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: replace wq users and add WQ_PERCPU to
 alloc_workqueue() users
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:12=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Below is a summary of a discussion about the Workqueue API and cpu isolat=
ion
> considerations. Details and more information are available here:
>
>         "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOU=
ND."
>         https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de=
/
>
> =3D=3D=3D Current situation: problems =3D=3D=3D
>
> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask =
is
> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
>
> This leads to different scenarios if a work item is scheduled on an isola=
ted
> CPU where "delay" value is 0 or greater then 0:
>         schedule_delayed_work(, 0);
>
> This will be handled by __queue_work() that will queue the work item on t=
he
> current local (isolated) CPU, while:
>
>         schedule_delayed_work(, 1);
>
> Will move the timer on an housekeeping CPU, and schedule the work there.
>
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>
> This lack of consistentcy cannot be addressed without refactoring the API=
.
>
> =3D=3D=3D Plan and future plans =3D=3D=3D
>
> This patchset is the first stone on a refactoring needed in order to
> address the points aforementioned; it will have a positive impact also
> on the cpu isolation, in the long term, moving away percpu workqueue in
> favor to an unbound model.
>
> These are the main steps:
> 1)  API refactoring (that this patch is introducing)
>     -   Make more clear and uniform the system wq names, both per-cpu and
>         unbound. This to avoid any possible confusion on what should be
>         used.
>
>     -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBO=
UND,
>         introduced in this patchset and used on all the callers that are =
not
>         currently using WQ_UNBOUND.
>
>         WQ_UNBOUND will be removed in a future release cycle.
>
>         Most users don't need to be per-cpu, because they don't have
>         locality requirements, because of that, a next future step will b=
e
>         make "unbound" the default behavior.
>
> 2)  Check who really needs to be per-cpu
>     -   Remove the WQ_PERCPU flag when is not strictly required.
>
> 3)  Add a new API (prefer local cpu)
>     -   There are users that don't require a local execution, like mentio=
ned
>         above; despite that, local execution yeld to performance gain.
>
>         This new API will prefer the local execution, without requiring i=
t.
>
> =3D=3D=3D Introduced Changes by this series =3D=3D=3D
>
> 1) [P 1-2] Replace use of system_wq and system_unbound_wq
>
>         system_wq is a per-CPU workqueue, but his name is not clear.
>         system_unbound_wq is to be used when locality is not required.
>
>         Because of that, system_wq has been renamed in system_percpu_wq, =
and
>         system_unbound_wq has been renamed in system_dfl_wq.
>
>
> =3D=3D=3D For Maintainers =3D=3D=3D
>
> There are prerequisites for this series, already merged in the master bra=
nch.
> The commits are:
>
> 128ea9f6ccfb6960293ae4212f4f97165e42222d ("workqueue: Add system_percpu_w=
q and
> system_dfl_wq")
>
> 930c2ea566aff59e962c50b2421d5fcc3b98b8be ("workqueue: Add new WQ_PERCPU f=
lag")
>
>
> Thanks!
>
> Marco Crivellari (2):
>   rust: replace use of system_unbound_wq with system_dfl_wq
>   rust: replace use of system_wq with system_percpu_wq
>
>  rust/kernel/workqueue.rs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

The functions you are changing are intended to match 1-to-1 with the
wq globals defined by the C side. Changing them so that Rust and C no
longer agrees on what the wqs are called seems wrong. How about adding
new functions instead?

Alice
