Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828390;
	b=1owloTVRTFyS9Azo/NC4JE7vD+wRu0jNMz7provffG2fgIym8k0q347Lrd2TJX8ZGspC
	 Mtk/+vPws7O9ekt508hltVmNnwjA2Ihb0bx7ODFcSfwnFC0g82Cg77iHcmpgB+yoMMXgS
	 v5bIK3vfH4NvUr56LH4q6IGjDhKyVf1owiKK4pqsnjQD7rZ1GPUSRGju7lofnxUuczlxM
	 lakRJXjJSSZSTRQLfPoHv1yVFZowhlJSVOwJiLkDK4QARtPKQIdgCABlcuprOGbHZfw9r
	 ZDenJ7n6ImOtfK2YcXeUcjXNDESslLKZsYNdygcD7KIvhzBl5HijS1ZXiTDcmkuMhdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828390;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s4xb54yvnEDIUO7eMbiUDk2ZlPAQebc33VLVw1jzTYw=;
	b=dtWLOBdMBJ+YzE0iBM3mb5hBNViylQhpuZtofWkVXyKM3FWey5lSTHRsaY8AKz+OObXp
	 3efF+d12lZQr/KRiBxiFn9Rp8cMEkbGDqxOTpsIG7/8GS1D+J4Ta1p8RLfzhplUmMvrDG
	 peKR9fpCS7QWVouJMTk8xa9NHuVIAHH+bGruaHESiuPeT2a44YMW0X+5XsSqBwzOLOR2o
	 +eyPEny0jPrneuqEgUBjOWLnLatodgUQI06lY40vyOkZQ1xobOU5WlbpoNRqxvL+7XiY4
	 7/7mCcwSzLiBQIduR0nwVE5E6rMRSUFVt7O0lPAPEtAZwbJzWZaO00kzXb3Uzhev4gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rbE0vmEc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD52E606A7B8;
	Mon, 16 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD52E606A7B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rbE0vmEc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4421713;
	Mon, 16 Nov 2026 03:26:26 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9929D3F632;
	Mon, 16 Nov 2026 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828389; bh=NfxE1xO/t1Vk2YMpHozofJMQe4YwJPXsXGhRyHZVn2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rbE0vmEclrtL04MPR8Wlhz/OwvP/DuRRRWwGW8l5d/eVYGLzZiVw1z2kFfNN099nC
	 ogHrxNGJazEdbwM/iGVI+BCbCX+NEd1F5lJA5OPLPs4/yX+z5CZJ0iOps2r5lhaEAl
	 LW87iXlCbP873VlPnBzu960FTR0Q2uq6OGQTqtjs=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Florent Tomasin <florent.tomasin@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v5 02/13] drm/panthor: Minor scheduler refactoring
Date: Mon, 16 Nov 2026 12:25:50 +0100
Message-ID: <20261116112601.3483649-3-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116112601.3483649-1-ketil.johnsen@arm.com>
References: <20261116112601.3483649-1-ketil.johnsen@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florent Tomasin <florent.tomasin@arm.com>

Refactor parts of the group scheduling logic into new helper functions.
This will simplify addition of the protected mode feature.

Remove redundant assignments of csg_slot.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v5:
- Actually handle error from csg_slot_prog_locked()

v4:
- Handle error from csg_slot_prog_locked()

v3:
- Use panthor_fw_csg_endpoint_req_update() (was rebase mistake)
- Function rename to tick_ctx_update_group_prio()

v2:
- Moved option to ding only the CSG doorbell to later patch
---
 drivers/gpu/drm/panthor/panthor_sched.c | 135 +++++++++++++++---------
 1 file changed, 83 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a343c5180e01e..d632fe1bf4db8 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2345,12 +2345,85 @@ tick_ctx_cleanup(struct panthor_scheduler *sched,
 	}
 }
 
+static void
+tick_ctx_evict_group(struct panthor_scheduler *sched,
+		     struct panthor_csg_slots_upd_ctx *upd_ctx,
+		     struct panthor_group *group)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+
+	if (drm_WARN_ON(&ptdev->base, group->csg_id < 0))
+		return;
+
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
+				group_can_run(group) ?
+				CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
+				CSG_STATE_MASK);
+}
+
+static void
+tick_ctx_update_group_prio(struct panthor_scheduler *sched,
+			   struct panthor_csg_slots_upd_ctx *upd_ctx,
+			   struct panthor_group *group,
+			   int new_csg_prio)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+	struct panthor_fw_csg_iface *csg_iface;
+	struct panthor_csg_slot *csg_slot;
+
+	if (group->csg_id < 0)
+		return;
+
+	csg_iface = panthor_fw_get_csg_iface(ptdev, group->csg_id);
+	csg_slot = &sched->csg_slots[group->csg_id];
+
+	if (csg_slot->priority != new_csg_prio) {
+		panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
+						   CSG_EP_REQ_PRIORITY(new_csg_prio),
+						   CSG_EP_REQ_PRIORITY_MASK);
+		csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
+					csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
+					CSG_ENDPOINT_CONFIG);
+	}
+}
+
+static int
+tick_ctx_schedule_group(struct panthor_scheduler *sched,
+			struct panthor_csg_slots_upd_ctx *upd_ctx,
+			struct panthor_group *group,
+			int csg_id, int csg_prio)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+	struct panthor_fw_csg_iface *csg_iface =
+		panthor_fw_get_csg_iface(ptdev, csg_id);
+	int ret;
+
+	ret = group_bind_locked(group, csg_id);
+	if (ret)
+		return ret;
+
+	ret = csg_slot_prog_locked(ptdev, csg_id, csg_prio);
+	if (ret) {
+		group_unbind_locked(group);
+		return ret;
+	}
+
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
+				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
+					CSG_STATE_RESUME : CSG_STATE_START,
+				CSG_STATE_MASK);
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
+				csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
+				CSG_ENDPOINT_CONFIG);
+
+	return 0;
+}
+
 static void
 tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *ctx)
 {
 	struct panthor_group *group, *tmp;
 	struct panthor_device *ptdev = sched->ptdev;
-	struct panthor_csg_slot *csg_slot;
 	int prio, new_csg_prio = MAX_CSG_PRIO, i;
 	u32 free_csg_slots = 0;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
@@ -2360,44 +2433,13 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
 		/* Suspend or terminate evicted groups. */
-		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
-			bool term = !group_can_run(group);
-			int csg_id = group->csg_id;
-
-			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
-				continue;
-
-			csg_slot = &sched->csg_slots[csg_id];
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						term ? CSG_STATE_TERMINATE : CSG_STATE_SUSPEND,
-						CSG_STATE_MASK);
-		}
+		list_for_each_entry(group, &ctx->old_groups[prio], run_node)
+			tick_ctx_evict_group(sched, &upd_ctx, group);
 
 		/* Update priorities on already running groups. */
-		list_for_each_entry(group, &ctx->groups[prio], run_node) {
-			struct panthor_fw_csg_iface *csg_iface;
-			int csg_id = group->csg_id;
-
-			if (csg_id < 0) {
-				new_csg_prio--;
-				continue;
-			}
-
-			csg_slot = &sched->csg_slots[csg_id];
-			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-			if (csg_slot->priority == new_csg_prio) {
-				new_csg_prio--;
-				continue;
-			}
-
-			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
-							   CSG_EP_REQ_PRIORITY(new_csg_prio),
-							   CSG_EP_REQ_PRIORITY_MASK);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
-						CSG_ENDPOINT_CONFIG);
-			new_csg_prio--;
-		}
+		list_for_each_entry(group, &ctx->groups[prio], run_node)
+			tick_ctx_update_group_prio(sched, &upd_ctx, group,
+						   new_csg_prio--);
 	}
 
 	ret = csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
@@ -2425,34 +2467,23 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
 		list_for_each_entry(group, &ctx->groups[prio], run_node) {
 			int csg_id = group->csg_id;
-			struct panthor_fw_csg_iface *csg_iface;
+			int csg_prio = new_csg_prio--;
 
-			if (csg_id >= 0) {
-				new_csg_prio--;
+			if (csg_id >= 0)
 				continue;
-			}
 
 			csg_id = ffs(free_csg_slots) - 1;
 			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
 				break;
 
-			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-			csg_slot = &sched->csg_slots[csg_id];
-			ret = group_bind_locked(group, csg_id);
+			ret = tick_ctx_schedule_group(sched, &upd_ctx, group,
+						      csg_id, csg_prio);
 			if (ret) {
 				panthor_device_schedule_reset(ptdev);
 				ctx->csg_upd_failed_mask |= BIT(csg_id);
 				return;
 			}
 
-			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
-						CSG_STATE_RESUME : CSG_STATE_START,
-						CSG_STATE_MASK);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
-						CSG_ENDPOINT_CONFIG);
 			free_csg_slots &= ~BIT(csg_id);
 		}
 	}
-- 
2.43.0

