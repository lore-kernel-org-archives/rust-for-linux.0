Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608196;
	b=Hf2fBbjaup6lQUHlAxa9Nm/fiiu1h0rW4Qum1QhTguDyLrqGeihyoJrKfvHwZpjCgK+n
	 dBeoehJZi9fRbUA5fJFJ2XyhVCmpxUKYCZOvq+90FFbG+bomEMqzBHdyBJYyG/BSSmvYv
	 c6HtBGP8PUw5Abr8/UPPOytNJcUHfsUT0sLlR0+QXjeOAhTIz3eaPjBayGejYEG1zQNUN
	 kLFzMxamt9ZhAkL/CkT6OqzI7ZDITak3y75Zx3US+rg6VkAzy00a2yYjKUuK/NKQjlpQ0
	 zfNue0b4hF5QERaX7HOa1HCURcnevkJl3pCvhJSlQ5P0KL34pKGRdwFv15OahgIDF+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zmdVCyES1Z5dR10b8jDmGep4AsueZq3jndQhX7uyqEA=;
	b=k6i9FzwaOsr0IvcHaLZFEdTYVqWwVKgqutGM9BFwJ/14xXzSvO0KtP8mQvZkQDEY/y9V
	 +8/95YaQPej7WQqJSstSc+snNyN2i37FfVDdECPXGCXEL3S761h4pneA4rl9bQcX5bBhY
	 dzR+Qk2rtrtskMgnIbL4KmCCSN67WibQMcqbsfFBTnaKHW9KxMimNmQmJBRAgud/guyoS
	 I7ZQzEibemJwMEnDwMBsSZsAVcDB/SGw0tjkw5K4xvj3YRMGhHl/BbLu5+yTFHTjBHvrc
	 Thcu/D9s0d+Wfh/WDB2zbQu6+nI+TfTd8tCrZy1kctZflraJC5h9S0xi4cFotYRHLkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JkaYobyP;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1848606A33F
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 12:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1848606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JkaYobyP
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso49701225e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795608194; x=1796212994; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmdVCyES1Z5dR10b8jDmGep4AsueZq3jndQhX7uyqEA=;
        b=JkaYobyPESzkFhDEdX+cvPmYJQXmz6i910XI6H6GEzkLpjS0AJXbBWoSWEveOh5vcj
         zCSQ8AsbEWa1wI3ZPMmKtZZqpNpqo8xeYkezdeno5BBVujd4YNNVhq2zpRUUEK9dmOC6
         cSIksxW4NZfiEUCm6+ftnyyFSix5hZaw5Rqj099rL7tCK4L35Zk0hReCls9snwBjZNLf
         8qGQLQnP5OBo+tH2mS2aCg81xEzQhFGkZbgKzwYi2+ePGMKEzCTvs3CUtLyauQnpjrLO
         QPCERVb6/BuuRQ4UdPtMy+YxPTg1+TUJnO0Y8+a2Uh1O270tjaZl98RbaDJsawebAHii
         JC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608194; x=1796212994;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmdVCyES1Z5dR10b8jDmGep4AsueZq3jndQhX7uyqEA=;
        b=ywBN1SXSipuwDcDRW5Xd+n8imyx/BVntyO8+0N/xyR3Mi2Jxnu+LVJtcUNrGxxJ+WG
         I9/Y4OM0bhU9Kad8XGKCoJ/+05R9D9J7LQVlNYcRj8n0/Nk7jeMsjPVF7eG6hITANvW+
         sJ5ConHhDtVppsVwDZNQ28GuN4cF/wYcNu1f93exwDRzIJaTYagWxB/AyHXJgpfUqdjS
         F6s6nXoY56L5QzJnion/5glDIrgaGw+zeuocN3ZOa/+EbeN7oW+ouvRDJz2Y/93OWog9
         jToviSKscoylyzlQFoA4+YsH8N9wTgyTsixrvGvU12DZsXAviho3PMdHQ4xqJyidwi4f
         yF5w==
X-Forwarded-Encrypted: i=1; AL+hErGijvPPQozpcg14YzRW1LPNdZa0q6uvznp+bMfhvop3qT6KLzTxOvGEBL/mTtfXmAQT5Xe5p+2i3pXJNd143Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+J2AN+NR/v5+TAQGPhmObFHsNUIQpty3v5ODmK05QBtSWd/r2G
	ok9rmUn96gNFu2Tp+6UfpbhNafGXrDAAC1bj+SzOIbFyPP7onXB01Br/iOaZ1aFfDDOPL+3ZqBg
	31X7rjz+lYFkLE+L4dw==
X-Received: from wmfq11.prod.google.com ([2002:a05:600c:2e4b:b0:4a3:5dec:ff72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e40b:b0:4bb:9a6c:8712 with SMTP id 5b1f17b1804b1-4bb9a6c8724mr143643655e9.12.1795608194039;
 Wed, 25 Nov 2026 04:03:14 -0800 (PST)
Date: Wed, 25 Nov 2026 12:03:05 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHjOBmsC/32NQQ6CMBBFr0Jm7ZhONURceQ/DopZfaIJUWoMa0
 rtbOYDL95L//koJ0SPRuVopYvHJh6mA3lVkBzP1YN8VJq10LSInDrFDRMevma2ZLEauDzeloRy MPVLZPSKcf2/Na1t48OkZ4me7WORn/9UWYcWN1FDiGuMcLn0I/Yi9DXdqc85fo7B99rMAAAA=
X-Change-Id: 20261118-ordered-wq-cancel-63b02e0feac4
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4860; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MEqp6I5oT2DwwWG++mrJvLdQqFqXXQNSXG2o5tVy1A4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrBs597HHdRB4YFrPM62zg+Un1OBq5rHO+JQWi5
 ndixzfGysqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawbOfQAKCRAEWL7uWMY5
 RsjWD/93B2e6uccyr9nPTBtpWLMQMe79t5s8KHITEgNqBTKW5udxk2H7X1Bp5+7YH06jKqilyKO
 /IuIQ0hXXTC2kgwqQr3rX/7QgriAet8Neg4Hv2pu92ezFhiKeTujBOolRBvbf097wkzfUz2bAph
 vBHDETsqbE+jmTwNfZqSa1kwhVbMpkcTirDhyiBvzQ/Nitg1Qb8b+iC9LQ/dUObn//dh+7xIsEw
 NuS263rYySpa+2kiVGVFwZA/MWwQpPeEX/I3Fh9CA5OjPvy3CFncddjQFWhMqlPCKcexnVe3EhJ
 hyqnbR8fGRe9HTvYS4qy965R/mY29ExbeC7K+7GyXOMtBr764QvnZGJtxYmhKY/PhdBhUTuBpPU
 2z9msTMWyH5PSW4Gr4066nhFnk675S2eLLJH4C9FepAF5nJ7Lh7vYNSUstfwkxwYA+jCVtn+9BV
 L0vltE8nUVTRsWOrDvClJMQO3PhmBFNAGB8ZUMJOSCulUa5/w01vqUMgf6jidSS8rm26k/v50Cl
 7osTn6PxAv2wFFnY85/QxpK74fssMnmT5o6jRMrO0JdH8XDs5HB0BSrArc0kn7ZGbTL4X3tbfir
 FfReMYRlbEP9yfel5EuuITyXdQa2jdNKYCx2zoFVIZBr2l1sas5fB4jkvMyeNU7ArBH3UWejeY/ LU2qI2Dc7wNAO/w==
X-Mailer: b4 0.14.3
Message-ID: <20261125-ordered-wq-cancel-v2-1-13620a09773f@google.com>
Subject: [PATCH v2] workqueue: fix cancel_work_sync() on ordered workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There is currently a scenario where cancel_work_sync() /
disable_work_sync() does not wait for the work to finish execution on an
ordered workqueue (__WQ_ORDERED). This is because ordered workqueues
contain multiple workqueues internally (pwqs). Consider the following
scenario:

1. @work starts executing on pwq A (pool A), the oldest and only
   unplugged pwq in wq->pwqs.
2. Writing a new cpumask to /sys/devices/virtual/workqueue/cpumask
   allocates a new dfl_pwq (pwq B, backed by pool B) with
   pwq->plugged = true and appends it to wq->pwqs behind pwq A.
3. While @work is still executing on pool A, it is re-queued to the same
   ordered workqueue. Unlike normal workqueues, __queue_work() skips
   last_pool redirection on ordered workqueues so re-queued items do not
   jump ahead of work already waiting on pwq B, so @work is placed on
   pwq B->inactive_works and work->data is overwritten to point to
   pwq B.
4. cancel_work_sync() or disable_work_sync() steals @work from pwq B,
   and try_to_grab_pending() records pwq B->pool->id (pool B) in
   work->data.
5. start_flush_work() only inspects the single pool recorded in
   work->data (pool B, where @work has never executed), finds no worker
   running @work, and returns while @work is still executing on pool A.

Unfortunately, this scenario can lead to UAF if a driver uses
cancel_work_sync() and then frees the work item (or resources used by
the work item). And this happens on ordered workqueues in practice:

- drm/sched: drm_sched_wqueue_stop() calling cancel_work_sync() on
  work_run_job and work_free_job before scheduler teardown.
- drm/xe: gt_worker_disable() calling disable_work_sync() on
  gt->reset.worker and gt->wedge.worker.
- drm/panthor: panthor_device_suspend() calling cancel_work_sync() on
  ptdev->reset.work before suspending hardware.

Thus, fix try_to_grab_pending() to record the pool of the oldest pwq in
wq->pwqs when stealing a pending work item from an ordered workqueue, so
start_flush_work() flushes pool A and waits for @work to finish. If
@work is not actually executing on pool A, find_worker_executing_work()
simply returns NULL.

It is also needed for the soundness of the upcoming Rust ScopedWork
abstraction, which binds a work item to a single workqueue and relies on
cancel_work_sync() in Drop to guarantee that data borrowed by the work
item is no longer accessed once drop() returns.

Cc: stable@vger.kernel.org
Fixes: 58629d4871e8 ("workqueue: Always queue work items to the newest PWQ for order workqueues")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This came up while figuring out what to do about this sashiko review:
https://sashiko.dev/#/patchset/20261020-rust-workqueue-v3-0-ea7c74d02068%40google.com
---
Changes in v2:
- Drop patch 2 ("workqueue: doc: clarify cancel_work_sync() cross-workqueue
  behavior"), already applied to wq/for-7.5 by Tejun Heo.
- Use list_entry_rcu(pwq->wq->pwqs.next, ...)->pool in try_to_grab_pending()
  without the redundant NULL check, per Tejun Heo.
- Link to v1: https://lore.kernel.org/r/20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com
---
 kernel/workqueue.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index af845214e78b..9566e8822686 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2263,6 +2263,7 @@ static int try_to_grab_pending(struct work_struct *work, u32 cflags,
 	pwq = get_work_pwq(work);
 	if (pwq && pwq->pool == pool) {
 		unsigned long work_data = *work_data_bits(work);
+		struct worker_pool *offq_pool = pool;
 
 		debug_work_deactivate(work);
 
@@ -2288,9 +2289,18 @@ static int try_to_grab_pending(struct work_struct *work, u32 cflags,
 		/*
 		 * work->data points to pwq iff queued. Let's point to pool. As
 		 * this destroys work->data needed by the next step, stash it.
+		 *
+		 * For ordered workqueues, __queue_work() skips last_pool
+		 * redirection so @pwq may be plugged while @work is still
+		 * executing on the oldest pwq after a cpumask update. Only the
+		 * oldest pwq is unplugged and can be executing @work, so record
+		 * its pool instead.
 		 */
-		set_work_pool_and_keep_pending(work, pool->id,
-					       pool_offq_flags(pool));
+		if (unlikely(pwq->wq->flags & __WQ_ORDERED))
+			offq_pool = list_entry_rcu(pwq->wq->pwqs.next, struct pool_workqueue,
+						   pwqs_node)->pool;
+		set_work_pool_and_keep_pending(work, offq_pool->id,
+					       pool_offq_flags(offq_pool));
 
 		/* must be the last step, see the function comment */
 		pwq_dec_nr_in_flight(pwq, work_data);

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-ordered-wq-cancel-63b02e0feac4

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

