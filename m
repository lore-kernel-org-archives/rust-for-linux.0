Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FDA1FFC7B
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402762; cv=none; b=uIbANBTvexmNxjZre84UmaZQYYD1c6sKJJCew6xw6mwDNbs+BpKvlOI/P8cilHQvU3CgeMtBPho3YsFMpAaAItD49fWF8n5PidZtt/S78oKfxajjW+Lcq5b3/0c+KDW9OvRLJRjT31A3NsRhph6PVll2pFXLzxYIjFpTh2X1O+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402762; c=relaxed/simple;
	bh=7inUfeL4iXoWEN8KQCUXVzIGFwKhSb19V12WXUhx85g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg5Gl5JZHz9LGA7WOdSaXV4ugnFlSFUdARj2+FV0PjVhdEKwc6AyyIhFvBvSm7SK2/CuBPMuZ3/QX3Fj8UDa4J4RYoFATvnuGHh9cX0KEgRUp5WRsKZLG8o/3RdDn+/25xgi4Uv51pdTL0Fj4wyOuRRCaEvvszlxn/aBIdcX9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ODs7c9Ig; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ODs7c9Ig"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f76454f69so4958229e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757402758; x=1758007558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7inUfeL4iXoWEN8KQCUXVzIGFwKhSb19V12WXUhx85g=;
        b=ODs7c9IgYkys8UB0jUCrGrMWA6Ua/xACuwga4FX91iWx/Fsd/n1sbw2Iwj5biHHZhO
         C11+hlO1q8PTgnX8OfA0rdeLsYza1oepTcRTU6i3eMQqvqVqihpN/FLLyIOc+decyvUM
         81v+E6uZOLvvRyMFLG7xxprOzEYjt93wUra50U3z3Rt7S3F/vzQKq5i8W5dYve+6DDxl
         8S8IRXYBv8XShs2J0YA/8sUQ0UU2XzrwoHX6xp6SpOiyzDrGbqcR3lWTn0+aVgwknPUk
         hJNltnthqziXxtAIIe8nkMyTBTtp9RSzHygEvjL5oj6epzXFDEze5t1wXV0wmzSRVl+L
         6bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402758; x=1758007558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7inUfeL4iXoWEN8KQCUXVzIGFwKhSb19V12WXUhx85g=;
        b=aB7Si6FXleLKZAun+65xlhDVz2aO6Exo79LkfOgQILG8XwoojgeMH3bt9CEL7SSYGj
         hTyeKcaXqslo5If4N84S1qd1rsYkmCIhf9a32rdJ8uTypDoXH8Q13jHn+idO6FZLyx0D
         SLu7mukOZvkZYtUADoplildIce+UoDC3F29UsNfflV4b6unPYLd7dAGlDh1pex5fhYlm
         tsFt+Bnz5oKoaVtOjTQW5YxvYy9OmLQEh1jnkLqXG6KvQNcFrdrNS7fjymQSSTmwnXwF
         BkeHFNDHUMxpP7BqMDpGwH6kbfWSFowA8Nu7yhaIUtCahPPFZDNiGOd0jFF05mopMEmY
         wo8w==
X-Forwarded-Encrypted: i=1; AJvYcCUA9tvP/kU1dUBjpopyfhwa1HH8S5AYbdXl7Hb/D1f26Hq9lHtGaKzJUWOCnW8+VgMKbHRFkO1VC7dWX4W2KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx19jRydBELrrhydHouVR6Caux8lvmyRb2Kwu965pYINh57ciZZ
	TgcPK0LKCuZIieAbES+vpA/GYLlh0wdL6lkoO5+i8vvShr2K4S96XUD9/FIdwGzPbjXnh+P6koU
	6TQVHA2nEEcfvz/QPvjuL7ZKgevLAaNLqarYFHzMxoA==
X-Gm-Gg: ASbGnctZTUPUQPTGWGg7Gxy7jjMwGU06uYZwG53Fgx1bmMSa5QPGa700gsgpG9Mn0S2
	7VN2KLt203/x6szlqZ6P4lNHLe/t8gpZKw5n3aMR7fAYxOJCvhPGHXT0u2OmrusF50QAubqP/fp
	zLBhsQqfpm8Q5DnqjRjGGDVtYzibFjGS8+sEu7FEr+l6TAHfn98OzI9ibkCaBwuPY//3e7HS5NK
	vevvcA7kYjSUPHyVZ0SRbLsPxbwfjdJmgwriQUzFjytWhahfaM=
X-Google-Smtp-Source: AGHT+IEAItx5LkxY8bTTPzFu+ytmMJgwFxFU4kyv09Ue8x63R9gquD9wuNy4+Xc6/sBQ575h9u2bBPxcfvQknO5Np5A=
X-Received: by 2002:a05:6512:3347:b0:55f:727d:408c with SMTP id
 2adb3069b0e04-56261db51a5mr3072329e87.50.1757402758113; Tue, 09 Sep 2025
 00:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908160224.376634-1-marco.crivellari@suse.com> <CANiq72kJxwEncXVVrZoMyjXrtsJUGf+kamz0G+d2we7Fk1Vp6w@mail.gmail.com>
In-Reply-To: <CANiq72kJxwEncXVVrZoMyjXrtsJUGf+kamz0G+d2we7Fk1Vp6w@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 9 Sep 2025 09:25:47 +0200
X-Gm-Features: Ac12FXx4zNW2OZlT8is3cwmhq9h30yBg847pi9uvblZgAiJ2p8d049FN04Yni2o
Message-ID: <CAAofZF5JbC0=zKMXRDSGfbLaZ7y8Ems0x-5GEVADkHJyY3BkMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: replace use of system_unbound_wq and system_wq
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 6:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> If I understand correctly, these two patches are "just" following the
> C side, right?
>
> i.e. the summary below comes from that original patch series, but this
> one is just adding the `system_{dfl,percpu}_wq`s that were added on
> the C side.
>
> In other words, I would have just said that, plus a link to the patch
> series or commit that actually added the new wqs.
>
> I would do so similarly in the commit messages.

Hello Miguel,

Exactly.
I kept the same cover letter for every subsystem involved to give all
the information.

> This is not what the patches are doing? There is no replacement nor renam=
e.

Yes you're right. This is done on the C side, the rename of all the
uses; but the old wq(s) are not removed.

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
>
> Why are these prerequisites if they are already merged?

I kept the old cover letter paragraph name.

Unfortunately I noticed I made some mistakes not updating the cover
letter accordingly... sorry!

Thanks!
--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

marco.crivellari@suse.com
