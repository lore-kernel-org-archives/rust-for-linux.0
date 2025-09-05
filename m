Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4326F2A0
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063312; cv=none; b=APWj2JNtgdaEdIP3tF2ffdv5ThmimLHjF5LOE1aSEVEitLg9Q4QGv9AZQIGzxb4Bpo+OCKV35mWYyzs+7sVbc59EyJJc2SbfowjpFWtf0t9Q9lsn/nlM+peoT0IebvYawIkE4HG9MhBtEKdkSjqT0zkxRYbfMOGVRGpKV8Ma6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063312; c=relaxed/simple;
	bh=pfUYsJytL5Xha+9fmGtXNsuTP5Iy55visY0fvimyZbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jyJ3ID/ZVbH1khXE8izoCgo6hNtgLLQUL/DCEYXH3feH4DAku/z+K6ebNUY8V9uBf62X9IIZemjx4MUQg2ziCQxu7SBG0WjwX3E2TKhamTBkGaSxaMZNGXUY83xlFBG9Y8dufm3DJG8jhmDwdJG7aXBJi6170JxwOvqMJuwHdxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hog5+1Us; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hog5+1Us"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so11331765e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757063308; x=1757668108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfNHkuuYJisQeLCjdnmFarVASjjt4pqTTKCuIEhNpU0=;
        b=Hog5+1UslOdFsaPl3KvhmRVcpoT0JvaPMjqSpsRWTdvvG6sFubfvYz+P/7rpTzdkJq
         xdS7P1YTVFleidcF5Dupgz1RmG/SVdc2/N1kSOIrHXAAYlcw7zshCwgIexQ6dUcBxV8u
         hagR86hBw0Up6mHvvIISqPg8D/cwgYVVyAUam5i1/ef+BsEjHDUFWpTDEN5+yU/lhehf
         yYrHE69+8I4UvA5jW/50LOagD79xomZmcg6HHn2lZ+alDtruEFq8JjMtNCosXRY819YY
         v3DqaKqB9mLo9Bev/do0zRJ1XCR7P7dwFg4mKSTdNOtcP62yrlecKo48I4jvWoD+51VK
         M6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063308; x=1757668108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfNHkuuYJisQeLCjdnmFarVASjjt4pqTTKCuIEhNpU0=;
        b=JG0lOkJc8bG7rZQ7wStgW/bou17Vx/AAN0J5imAzsP8xStyY30qeM56B+dnjo0S3bC
         iobK51YZ7OCZZuHhB0i1xaItoZpQvtP/z/KT0BodcWyUknV+bMoBLg0qzfX3HdR2P0aX
         xFXcw3RkJ4XnmOKlzkw1MOee/VIJRrRSaBA2Z/STYbq9VQKinlditcQfXJoNh6JUN5d5
         6r7JF2iCsH6RuprvasPEFYRDAwsY+1mkKM+C5tzya250I8bprBPDlep23NtJjwmg7ZEs
         xv4Zit5XUrS0S679py5nQ8u4yM8hhyAwM8aqmXp98Nt1x3jWOpCKvbZK3XeXeQwp6UNp
         Gs0w==
X-Forwarded-Encrypted: i=1; AJvYcCVzPAvSGT2nQSfF6uupz8kxX4TTbzqC0l9vMNThL6h7OCZYqux82iJmm+litYHPUvTfliOqkNuJ1hRF+YlLhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HqF0NJ84rtP587bsAjT1kQsURNx9RhIJZGpfROYaLSbA/g7W
	XBxiDQLov4AwsrGjQp0SnAPw+NGZ/G5qCG/DTZAzFn2NDt1ocV3Av17/JUrQfemyi0g=
X-Gm-Gg: ASbGncv+B0cxuB9w/qyr4mkEyX8tgGbg45ViPPFi4aF6OVSALc2PnbkV1T93/RrAv7G
	71G/Fh8zQNLA/otQ1Z3EtrzLfNkqrnAL1A+EbDn69uhhS+HBdo6tq1A3ZRveufbnkhrtbcU4eCX
	+Xz9HJxAnK2w9Q13q8m3nvAZDCEFhuc9oGs8OQJ64PG1EbloOFwp0soNJBwEDF1fyWfffPGPF4R
	sHs8GHlxJlg3o8Bn6sgEhZPaC1hr+9sZdJ0pGzZrObIuEHuhjMssLdnXlEvQkXNBc+YSBhtixEz
	xliWppwdsEEFJ+rUjIom7kd6xfQ1Nr6qc91V8RVd4pFKzuruDdR1b6RAcKWBRtMyk4VO7qgfpj7
	UgCfLb3c8LAUnLO46/cyifwwwG08nVqacaa4bgieHhxjlkt68ZeuC2ikEpg==
X-Google-Smtp-Source: AGHT+IEe6Z1CIxc3wwR6bIcUETKibcIoiDaTx4IWniTQ7UYnUkWPwDFvUlnVCzahyGvL94wifXuujg==
X-Received: by 2002:a05:600c:1d1d:b0:45d:d287:d339 with SMTP id 5b1f17b1804b1-45dd287d512mr42523305e9.25.1757063308214;
        Fri, 05 Sep 2025 02:08:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0350e80sm68900805e9.22.2025.09.05.02.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:08:27 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Subject: [PATCH 0/2] rust: replace wq users and add WQ_PERCPU to alloc_workqueue() users
Date: Fri,  5 Sep 2025 11:08:17 +0200
Message-ID: <20250905090819.107694-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

        "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
        https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this patch is introducing)
    -   Make more clear and uniform the system wq names, both per-cpu and
        unbound. This to avoid any possible confusion on what should be
        used.

    -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
        introduced in this patchset and used on all the callers that are not
        currently using WQ_UNBOUND.

        WQ_UNBOUND will be removed in a future release cycle.

        Most users don't need to be per-cpu, because they don't have
        locality requirements, because of that, a next future step will be
        make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
    -   Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
    -   There are users that don't require a local execution, like mentioned
        above; despite that, local execution yeld to performance gain.

        This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this series ===

1) [P 1-2] Replace use of system_wq and system_unbound_wq

        system_wq is a per-CPU workqueue, but his name is not clear.
        system_unbound_wq is to be used when locality is not required.

        Because of that, system_wq has been renamed in system_percpu_wq, and
        system_unbound_wq has been renamed in system_dfl_wq.


=== For Maintainers ===

There are prerequisites for this series, already merged in the master branch.
The commits are:

128ea9f6ccfb6960293ae4212f4f97165e42222d ("workqueue: Add system_percpu_wq and
system_dfl_wq")

930c2ea566aff59e962c50b2421d5fcc3b98b8be ("workqueue: Add new WQ_PERCPU flag")


Thanks!

Marco Crivellari (2):
  rust: replace use of system_unbound_wq with system_dfl_wq
  rust: replace use of system_wq with system_percpu_wq

 rust/kernel/workqueue.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.51.0

