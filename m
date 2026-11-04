Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778775;
	b=KSkI+PRbb2iKeSd9+M65urQzD9It7nS1mZUcpm9Ixu9joWb474ggo42vltAMBr7O3fzH
	 VUwNBs8R5yMuytAb53kPkyBV1d1xYe2dWP9S8Q5dVjFJgTNvEGU7gCrgC0DQVOMtvLukA
	 BJ04qE/bDoKLjzP5JSRVLYid/Bu8toVRCmXhtNf3GNK1GxfGKlf7TMnzEWSF0/acF6P9d
	 wRNZ/FXddkTr8zuvnWymvs1HVIqtVHFYQbI/qubgjD1n3w69YJho2PKiVuY7A6+sPpX//
	 gQ4EfmcsO11bigWDdajt/8KHkWzO/5jS/q5XsBFMkYhEB3rukYIyO7lLZXoIkWj48Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cqycFgOKVSS6NgUhwtTP0dN9smWY70wXU/hFF4VXYvY=;
	b=f7MMOQinTjmWuO/bDhazRhbYR/DxbuX0B92mIKQtJ7uEhWuCPFyGu63LpaIx0Z500RXZ
	 nuSsjDo5LBzfCipK0fXjXFBOyN1j47Wq0HfW/4zZa2oPlh/ZgXQRPZO0e52gbMqXGXuAU
	 zRrTSJqpW9quKcbINCpqLsRoLJT5au6m/3LNE6SJ4XkbEEYg5ydCiYKDYykCZ87y2gr0L
	 0pikDqUVcmFzX/P3EjjoMOQlYvY3oO9EHflGqWzmjvq8NnZmcpS12qARXfppsoag8RCyH
	 yrdwezJkWsBJe/Y+UhRMGjrSXebWDBBhlH9NHkJrGXcA6bwaTYofVM7wvGx8oPShTmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jbX/OYnF";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F51606D802
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 07:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F51606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbX/OYnF
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20edd106so246385f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 23:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778773; x=1794383573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqycFgOKVSS6NgUhwtTP0dN9smWY70wXU/hFF4VXYvY=;
        b=jbX/OYnF/U24eJbovm5b2eqMvqzlgy6JmTceKraRz8B7IBdkpmj1EQlxahp9nCiC7S
         53QINHgegY3lHwC2DNJKaPGxXa8KrIqODe4EQt1NN6fgyR3bAfe0MlC42HlMb9aCfTZe
         AbtQVq13IacmyqRoddrQWw8NZY519bX1zPvedZkEf4rTX5TZ4G7HrntUCauHEjtG5/Kz
         654GfysVCW0SYkn7jyiHkyxEV/lKxRlUVJxFZgKQM5wNgW84d6W7RNTZ4HRPkcFQhJtG
         Cl+skBqMvS1yoJ0vXjjxftAzaeSGHecnN58lLB3Rs+wGsqRA7LiGHgSyS+79i/txZ1z4
         QBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778773; x=1794383573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqycFgOKVSS6NgUhwtTP0dN9smWY70wXU/hFF4VXYvY=;
        b=AtPMan5f4nnn++yPGkOB9gZCiYKnbwbf8SDF+IZTj/xq+sre85FADWv6YGFnntFzZp
         gyFtzOZJQtDCWd2b4klNqaMuxoEDrLzTYT7fNaEsO5j2qU/f+JNJElFWuzWbDQORZTs7
         hVBKCquspuHMldquSyWgq2yckliu8Er4bcs6gMWR7j2sG6MjvaxIQPB4MOKg+TBqZ+yK
         XbmRb5Wv3o+Mk5SNlEBTMMsIwy2x8KJEL/gDAITg08tvrL8D3I9FE8RApt5eECR1Hdly
         i/oJ26Odgt6J+o6iPyAWNw6dw4rnMktMEfQDeZ0A7dCRllepGQij4Q17HY2JnozmGZ8v
         +Ieg==
X-Forwarded-Encrypted: i=1; AKwUvBzWuRs0d0NnkViqrF1McbQSvc3FmotqS1cYFbaQmRON7hCZL/AeTd4sT5iWA6ZQ1p8E5DgrzIeZ+BbuapuHPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9h7z7k7irNLfNDvePUBJQGpy4eJFOXq+aLWqV/M6zEDMZGKeT4
	qHiollimw8uI994NN/dT3hgVAQJ6jtH5oQ5s2tcevVYQb987hRdjqJo2
X-Gm-Gg: AYBFou3iXE3L3nXJReus7EfXi7LhC49C4C+AZVJGWqwgCHtStESWa2usxn/x9561OJG
	N3cC01RHt10zDGQqMrz7CaOnl31dg0uPzGI9VJu1o7lB1jniThz6Y+LTOj+IfsEBZxQsFUYxG5Y
	z/bnjioDka/7w/ctPTGJ0Y472kQRZeep4daKT7fzPcs36O7oBETh0qwro+6yaJ1uAMoR+NRRq2N
	DaHWWvEVj94OHEu6QDc7wJATT+2L4QrrJbPjfItxbe6WUBEaKWhsVnnKWw0bMM/QeMX8Gponn57
	CPsA0UhmnAfaApoToRgwbnKMwCS+MZQG51bNKKUKJrjNDNQseVa073Wt0gtRhLE1n8t91u2g9IV
	FTox7I+eTUVcK46WmfnowbqJy6wb9J+v0rm2a+rJ1alw1BElwf0zfnbZlFyLsKkTcwNtaq4EE3B
	xQYNCpnh/YHOsYsf45yIToyFS52r98wP1G1oLMCMqox7iRZ9b6IYc2eS09O2GhpS3/iBjl9ohbj
	dXgNPgHO/ODfoquWnManyQT47wqKJwhMTbTuBL0ESbiRMSspl3VrHX8OKGIBADoSHNJyb43ItId
	9FnIRTVSMwONUa4Ck+7rhQw4IZURpTRARfwvkTsmyKTbX96mdtkQWrK4WQdJVQ4EXg99oqY35Sf
	B2hoaeNrHyLCmwemAC8OyGytM0W6v+YEtUtDNQG8KiYxH2psnx2U=
X-Received: by 2002:a05:6000:4a13:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-48e6e2b9ce9mr33693968f8f.1.1793778773094;
        Tue, 03 Nov 2026 23:52:53 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm2200785f8f.52.2026.11.03.23.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:52:52 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 04 Nov 2026 08:52:40 +0100
Subject: [PATCH v2 2/3] drm/panthor: Report the CS fatal errors through
 GROUP_GET_STATE
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-panthor-fault-info-v2-v2-2-673b31f3840c@igalia.com>
References: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
In-Reply-To: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Paul Toadere <paul.toadere@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

Keep the raw CS_FATAL and CS_FATAL_INFO in the queue that hit them and
return them through GROUP_GET_STATE in an array indexed by queue.
Userspace decodes the values. No memory is allocated in the fatal path.

A queue stops at its first fatal error, so one slot per queue is
enough. The slot is a struct drm_panthor_queue_fatal, which is the uAPI
struct, so the ioctl can copy it with one assignment. The CS_FATAL
event handler writes the slot under events_lock. The ioctl reads it
under the same lock. The slot is never cleared, so the values can be
read again after the call.

The ioctl copies the slots of all queues to a stack array while the
locks are held and copies them to userspace after the locks are
dropped. It fills at most one entry per queue of the group and leaves
the rest of the user array untouched.

A queue can be flagged in fatal_queues without a CS_FATAL, for example
when the group was killed by a VM fault. Its entry then has a zero
exception. The VM fault itself is available through VM_GET_STATE.

Old userspace that passes the shorter struct still works, the DRM core
zero-fills the missing tail. A zero count skips the array.

Link: https://lore.kernel.org/r/20251215115457.2137485-3-lukas.zapolskas@arm.com
Link: https://lore.kernel.org/r/20251215115457.2137485-6-lukas.zapolskas@arm.com
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 20 ++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 32 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  5 ++++-
 include/uapi/drm/panthor_drm.h          | 30 ++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 7572cd7d6423..fb5fdf848dec 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -181,7 +181,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_fatal, exception_info))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -1254,10 +1255,25 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 static int panthor_ioctl_group_get_state(struct drm_device *ddev, void *data,
 					 struct drm_file *file)
 {
+	struct drm_panthor_queue_fatal fatals[MAX_CS_PER_CSG];
 	struct panthor_file *pfile = file->driver_priv;
 	struct drm_panthor_group_get_state *args = data;
+	u64 usr_ptr = args->queue_fatals.array;
+	u32 stride = args->queue_fatals.stride;
+	u32 count;
+	int ret;
 
-	return panthor_group_get_state(pfile, args);
+	ret = panthor_group_get_state(pfile, args, fatals, &count);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < count; i++) {
+		ret = PANTHOR_UOBJ_SET(usr_ptr + (u64)i * stride, stride, fatals[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int panthor_ioctl_tiler_heap_create(struct drm_device *ddev, void *data,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a343c5180e01..40400b2e4551 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -485,6 +485,15 @@ struct panthor_queue {
 		/** @profiling.seqno: Index of the next available profiling information slot. */
 		u32 seqno;
 	} profiling;
+
+	/**
+	 * @fatal: Last CS_FATAL reported on this queue.
+	 *
+	 * Never cleared, a later CS_FATAL overwrites it. A zero exception
+	 * means no CS_FATAL was reported. Protected by
+	 * panthor_scheduler::events_lock.
+	 */
+	struct drm_panthor_queue_fatal fatal;
 };
 
 /**
@@ -1412,10 +1421,20 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	info = cs_iface->output->fatal_info;
 
 	if (group) {
+		struct panthor_queue *queue = cs_id < group->queue_count ?
+					      group->queues[cs_id] : NULL;
+
 		drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
 			 group->task_info.pid, group->task_info.comm);
 
 		atomic_or(BIT(cs_id), &group->fatal_queues);
+
+		if (queue) {
+			queue->fatal = (struct drm_panthor_queue_fatal){
+				.exception = fatal,
+				.exception_info = info,
+			};
+		}
 	}
 
 	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
@@ -3818,8 +3837,11 @@ static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
 }
 
 int panthor_group_get_state(struct panthor_file *pfile,
-			    struct drm_panthor_group_get_state *get_state)
+			    struct drm_panthor_group_get_state *get_state,
+			    struct drm_panthor_queue_fatal *fatals,
+			    u32 *fatal_count)
 {
+	struct drm_panthor_obj_array queue_fatals = get_state->queue_fatals;
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
@@ -3833,6 +3855,9 @@ int panthor_group_get_state(struct panthor_file *pfile,
 		return -EINVAL;
 
 	memset(get_state, 0, sizeof(*get_state));
+	get_state->queue_fatals = queue_fatals;
+
+	*fatal_count = min(queue_fatals.count, group->queue_count);
 
 	mutex_lock(&sched->lock);
 	if (atomic_read(&group->timedout))
@@ -3844,6 +3869,11 @@ int panthor_group_get_state(struct panthor_file *pfile,
 
 	if (group->innocent)
 		get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
+
+	scoped_guard(spinlock, &sched->events_lock) {
+		for (u32 i = 0; i < *fatal_count; i++)
+			fatals[i] = group->queues[i]->fatal;
+	}
 	mutex_unlock(&sched->lock);
 
 	group_put(group);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index d87cbdba4d40..dd3d31c06cf1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -14,6 +14,7 @@ struct drm_minor;
 struct drm_panthor_group_create;
 struct drm_panthor_queue_create;
 struct drm_panthor_group_get_state;
+struct drm_panthor_queue_fatal;
 struct drm_panthor_queue_submit;
 struct panthor_device;
 struct panthor_file;
@@ -26,7 +27,9 @@ int panthor_group_create(struct panthor_file *pfile,
 			 u64 drm_client_id);
 int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
 int panthor_group_get_state(struct panthor_file *pfile,
-			    struct drm_panthor_group_get_state *get_state);
+			    struct drm_panthor_group_get_state *get_state,
+			    struct drm_panthor_queue_fatal *fatals,
+			    u32 *fatal_count);
 
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 85e197d7a528..c9a681762b96 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -1072,6 +1072,27 @@ enum drm_panthor_group_state_flags {
 	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
 };
 
+/**
+ * struct drm_panthor_queue_fatal - Fatal error of a single queue.
+ */
+struct drm_panthor_queue_fatal {
+	/**
+	 * @exception: Raw CS_FATAL value.
+	 *
+	 * Zero if no CS_FATAL was reported on this queue. A queue can be
+	 * flagged in drm_panthor_group_get_state::fatal_queues without a
+	 * CS_FATAL, for instance when the group was killed by a VM fault.
+	 * A later CS_FATAL overwrites the previous one.
+	 */
+	__u32 exception;
+
+	/** @pad: Will be zero on return. */
+	__u32 pad;
+
+	/** @exception_info: Raw CS_FATAL_INFO value, valid if @exception is non-zero. */
+	__u64 exception_info;
+};
+
 /**
  * struct drm_panthor_group_get_state - Arguments passed to DRM_IOCTL_PANTHOR_GROUP_GET_STATE
  *
@@ -1093,6 +1114,15 @@ struct drm_panthor_group_get_state {
 
 	/** @pad: MBZ */
 	__u32 pad;
+
+	/**
+	 * @queue_fatals: Array of struct drm_panthor_queue_fatal, indexed by queue.
+	 *
+	 * Entry N describes the queue at index N of the group creation array.
+	 * The driver fills at most as many entries as the group has queues and
+	 * leaves the rest untouched. A zero count skips the array.
+	 */
+	struct drm_panthor_obj_array queue_fatals;
 };
 
 /**

-- 
2.56.0

