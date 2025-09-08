Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845021255E
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347379; cv=none; b=KiRv8sCW032dsClA4524UH33lTZg5TBITefjvBmyOYkrmslF/8yuh7bqE7VsbNcnOJckjMElVUYVsiMQQA7WbNrwDZ9Qosyrgz3SXT6DTCnVDiKCBljMx/7+zpHIO3REUSaWAEFLMFPQ0MsmjXlVihT+kwl7johNUVzu0nhzvO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347379; c=relaxed/simple;
	bh=HZxc6F66+G0PbyVH2yadyP9FcEUJBc5LxZa/NglwtPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BX6l8JIxNcb3C8bZDOZ31pUJlxMPiMazdct9OeSZJgZmgjCOTenT4HVHj9lN47s9OP3Rn88ScsesZA34nTgLo9h+SRaWZY8U8OYxYzmFvN1EuGW22XfLSo2vp7Gu9rQ+RVqXB07TXN9L3ZpOVyl5gMwBNhKbcxhHUHIdgbT9euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IWijZDdr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IWijZDdr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so38091625e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757347375; x=1757952175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwyR31UmcDpcvwrohT3/mVpzqIRzkBLSvGxGe00o824=;
        b=IWijZDdr5umf5b8gNiY7MEfWB9sCAV48sjeqLheDeM3bzCswRWpHmLCNwqS8/bW5Nw
         H3AiJspPnt8R5ct3G3bo4hzYN7JZXL8mDbj8C6ZQe8MxNQ7LK7ll+CviwnY4PEwx/5IO
         249J+W0H7qKvtWVSr1AshQ/YYYQW8bQ4nGnUAjJCMIv79cs0ovgKbF2ZOU6AhLTVMiAF
         EEj4xJ/+1xJIX1MLIqBq1bz1xmYFOZymaU9sgEPstDLUONrNKtQvnNeDYsgCpDnk20mJ
         4hnhdY54PPnSJg2a08oQc7cnz3Yj7Pyfd3tOEqLNrUTOYBWP5QbPBqSCBRrIJlqNrlsf
         wZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347375; x=1757952175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwyR31UmcDpcvwrohT3/mVpzqIRzkBLSvGxGe00o824=;
        b=HaCzSpOZMzaAF3SP2Xwf9HnwbDnu320+symnV7WNqBsIjX//p1h0JkXsm5JY50ykHl
         LQl7u+XbbRA4IFbzilNRZM9PllEcO/9K4/MdgXv0Hjc/AWYPLXEfPtOFzr2ru+j8WFYg
         5gv21c0A4vF6NHFYhf5NEBQVeCJzxJNdrCbfuptA3zKRxub8KYxNa7Gk09Hte23zwvjm
         GLOn26FprV/yajQU3j2rGkqbnSFVgSMeOa328XU8uE/+q+2nxFhs08p9vyyopGBo727f
         2k23n3TXhft7Iv6XsZnzWfa10waq+7g8ptJcah+KIxBlnfmNplKRdvJwfqgRJRfJjLl/
         xEDw==
X-Forwarded-Encrypted: i=1; AJvYcCWdy86Ag1nCAe1ZhnvktZy+hP10d0N0z5pV0gpOKsCezGzT7O7wWfVMxPQS03tyClXfvHK7qll5JRBZd3Ctcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRClvQq74TrIHPZcr+U4yGuOnw3rvKD6qd+Em5gxBx2EQ3yEe
	/SjDkyzXIm8EA00vHpkT4HFcrM8eFij+yI6s7qYG6yWAbAjx5eCBlfqdhWOrrSv1eU4=
X-Gm-Gg: ASbGncs0wuaYHapvvB7Q84T86uNfzVf/+hdOFG8eNQj0BVr3lEAHpiJXeAlDxXUT3GC
	CE57JcjsTzCRIsM7GotppbX2Wmyc1StuW1w+E1+PO2T8crQqPMo4x5tab3/rIwM9YT6eOiENe0f
	CjZa83tS4d/TCSq3hjHhVpjWoO9rLwgTuJGNnWM+6sByT9CZUq2c0/wvMjDYW5o5hF6TznxGqsr
	d22dph8GuLner86aaUFE9DmWJdiRJZ+Tqo8UeWIiBNpZKMbGZQ7j/adqKfB89UBOL9u47NvdvOa
	hmVmwaJcxyM4+j091zDKFaMyws0D0jTn3nwBbPqUHVEC5Woe3XU7bgoTkdU83DJgxM6wCi5V53d
	UiWcVBBarAdVm1JLp49a9kEVEx/U3BKEmNwXsuuwCmZ/6bKE=
X-Google-Smtp-Source: AGHT+IHLOU6+4TKAD332EzcBIyoD7KeqXED7b2WNoVJGjyakCj5fEbIKQpRk/M2dyIBXDyvuvvoTdw==
X-Received: by 2002:a05:600c:630e:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-45dddee5da3mr65643835e9.27.1757347375224;
        Mon, 08 Sep 2025 09:02:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de5eabdb0sm55358075e9.8.2025.09.08.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:02:54 -0700 (PDT)
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
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v2 0/2] rust: replace use of system_unbound_wq and system_wq
Date: Mon,  8 Sep 2025 18:02:22 +0200
Message-ID: <20250908160224.376634-1-marco.crivellari@suse.com>
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
1)  API refactoring (changes introduced by this series)
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

---
Changes in v2:
- added system_percpu() and system_dfl() in order to use the new
  wq defined in the C code.
- fixed misleading paragraph in the commit log (no warnings are currently
  present).

Marco Crivellari (2):
  rust: replace use of system_unbound_wq with system_dfl_wq
  rust: replace use of system_wq with system_percpu_wq

 rust/kernel/workqueue.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.51.0

