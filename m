Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778772;
	b=eYR45INLvV1KZCAtAuNqSkXLkizynrnMpXdsd6Nzyg6h7NhmCntkr5YRpAbDmrfrkY+g
	 TMgt522ucGcUBAIljCPUXlUU2TF2d1eVwk930UqNGAppJuedvaVpeVxVaMopFEoQ9uUPJ
	 Y53DWZSwCLW7jv1ckAdC22e9r9f3RqH9kLHR1XDaW19LXncktod90KmpC1ikq6mHA5e2/
	 ZZ2/FqoE7uXi7zCokI0uNHLIgbdli/FbRtLsCrIheR7WJvVorNjRvI5/WO69Ihv9lHStB
	 bbIAsODgB/3pB9JIUweHMXbyvqjjRpFfdwCRWpX5DPiXIp7XGfDnNrNS1Q+ZlQxkZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RkebxhepJ78TZB3fnHTnhlAKTz7Sll4zIjTAt/wCAtw=;
	b=3db4nhKhgFwJwupmMmUtffYFMzbRAEiQvYuOmsvu5bk0Z6ElJHyEnjkL/mcIUfC9DkrP
	 CDY5kPASOfSl9cIIFXmUsDlCCJEC5ycdTyvfiZjxa2GwfAmT0v0titzvlQyLNn7GKCz6T
	 tSUw9vEKwY5O0nwRhOq8KjSo7Qm9wDaCk2PMA/xVPg4kddpzoxr5FJPYjWStoQwRZC3Nk
	 MnkhO/3+QRFAUQMEtRRV1OJCoHCbocty/g0gLbO7LAjNBN38XSlXeZSoj9Y1UHZ0wWuSU
	 6OiKnbfSpIjhTTBllNCDk4a64JYpcX/jY3UOIY6ifdZ1I8eB1PrZEbUDCz6oci/AI6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/YzGea5";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B5606A328
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 07:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190B5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/YzGea5
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso169584f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778770; x=1794383570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RkebxhepJ78TZB3fnHTnhlAKTz7Sll4zIjTAt/wCAtw=;
        b=b/YzGea5le2NLiLV9IA4m5eyzDb06iVw5LaO56+9lpfwmtHxUE9VaN2rvT1nZ7oBOT
         3IKmI9pboXsoyQz+huvqZCKrY7Es403vo6U+Rj5+Al5/QJQIlq1am6P40GciachO7cJ5
         QZK3khQmpJPEf3om+GQdexR3aIRby/C2V1ZhvBgS5Fvflo38l8Adb8hMAsDhtaVpxJ3O
         NCRZ7KBNnX3SH3rX+Ii5eQVIAeiUAAGH9Nidq4DYUreQ0c1Q30puugtCkp77B16E3UBV
         TvyNg6IPibiv12Hrwa9DZkHLErg8c0NT/XThUT2E47dH3G9/whqIHAu1YPCmdaEZSASD
         RQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778770; x=1794383570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RkebxhepJ78TZB3fnHTnhlAKTz7Sll4zIjTAt/wCAtw=;
        b=OBaUKxinMQ6TxlWFW/HGbze0jKMWl/tN3Lr8YffodIo2NSsPSn4xl8JSGG1jiLLXpl
         m181LEEx9cKOI8uWFurJ+aUcn3hFFl+N3XGmtNBbxFoj1rYEhXqQ/o37EudQ5MF+7AHk
         Ul0gLjqTpjJPSvf0z7TCXh02yybyCWV6Fh7AGgzIcTyNng6BoO/14kHAJZ3+q1u4Z8cM
         hk0GHatwi8O/0c03BZQZUW+g4wTWFZXPi91cGWtMMdMwN/lsGRTDw6o+lrkgpA/ATu0F
         FzsL4qJjO3YVglj4KJQj8mJXc0DONsCMrHeEAcnsvSVzlRr4k49T8rDR+Cfj+B20TBHH
         dhgg==
X-Forwarded-Encrypted: i=1; AKwUvBy4eo6V9u+5Flryrwl/UeG5jO3d4oFrmNGbkVZGlgs1RogTU3SSnXTmid4S6KByuCQhJuN7a4J48tgs8lElNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hgVKajkNen341kgrXXHH/++2M46EJh9zZ9r6wV6JPajxb3CV5
	hoeczpRm9lci0GqyWvvharHsh4sdxeBy9kCiuROnLXM3BWlOqQwC2tA0
X-Gm-Gg: AYBFou0pAnIORxhVRXa9PbrLD3F+//b1lVlJmfUThgvl3WXFEIIVz+0Pl577fQ5KlVg
	Wrc3ZLhbmqOeambrvbGGkd8zy+6cVOaL+Fap+ca1jvJogjJ49qD75qD4kf4/0B4uPK385l1yHYU
	4a/kBbdqfDKkmJCvQbb+Ur8DG4ye5PxMp+5WLEivlnBHkUQn2Q+4rjkT8ARf30SR0bC+PXKjjQk
	DsalNXHsOgI4RHDKLySAtLdesBNnrXgiQ2EkCsBPuL3wZlBt3QYlD+ifMfxGal/13M0WrSCib/W
	34LsVNZyzSEKDQ/xx9sRMmclXzOIbIKNAm+TFSwSFx6/O71DlOxCuhV9/1MHgFzFMUJrHRl9V9l
	N9zT8TifI/Ax78iGR430eJJdQQwDpWbp6Wp64uDvQL/87oAQAxgDwwh/M6Y5OP1ZUYEX3Od6TjO
	m/Y8lAglrSobajfWBiBm/aXGTHyYocJQ67hloVfWq6xAybv8UQE26fVV3U7pfWmFUJLwB7GM/Za
	6UGEG8k4do+NHHs9Av7lRiTD/Rf6V57CGfkEeEh7Z7Sbvuob5kxO6FgrkDDLkENxBmY/lul472E
	4p1cEDYzt8QnXxFld7QG/1p/GCbrU/rmpaRZ9Aujccu5o8gjDhBEmIZV5LhgLX0ANmG2umGSliC
	bJ7fFd0EH1QhbVJY4tQt82K4wjC0LsUG1J0nWzVueyyGIZLJyiCM=
X-Received: by 2002:a05:6000:40dc:b0:48d:fbf4:895e with SMTP id ffacd0b85a97d-48e6e30721fmr34220157f8f.11.1793778770275;
        Tue, 03 Nov 2026 23:52:50 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm2200785f8f.52.2026.11.03.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:52:49 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH v2 0/3] drm/panthor: Report fault information to userspace
Date: Wed, 04 Nov 2026 08:52:38 +0100
Message-Id: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gb6EUWvIi6KJhqQVlotgnh3i
 8u3mHkgURRKMFQPRMqSJPgCU1cwb86vhLIUg1Gm1Uo3eDh/biEiu2s/UTwHzAatVa7nrtO8WCj
 tEYnl/r/j9L4fPFXOTGcAAAA=
X-Change-ID: 20261014-panthor-fault-info-v2-330a9f771fd3
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

The Panthor CSF firmware and hardware report extra information when a
fault happens. Two kinds of faults matter here:
* faults raised at the address space level. These are fatal for every
  group bound to that VM.
* fatal faults raised on one of the queues of a group. They stop
  further submissions on that group.

This series exposes that information to userspace, so the
VK_KHR_device_fault extension can be implemented on top of it.

VM faults are reported through VM_GET_STATE. The VM keeps the raw
AS_FAULTSTATUS and AS_FAULTADDRESS of its last fault. Queue fatal
errors are reported through GROUP_GET_STATE. Each queue keeps its raw
CS_FATAL and CS_FATAL_INFO, and the ioctl returns them in an array
indexed by queue. The kernel does not decode the values, userspace
does. Nothing is allocated in the fault paths.

Changes in v2:
- Report VM faults through VM_GET_STATE instead of copying them into
  every group bound to the VM.
- Pass the raw register values to userspace instead of decoded fields.
- Keep one fatal slot per queue. A queue stops at its first fatal
  error, so no allocation is needed.
- Store the uAPI structs directly in the kernel objects.
- Dropped the recoverable CS_FAULT reporting for now.
- Bump the driver version to 1.10 in a separate patch.
- Rebased on drm-misc-next. The queue fatal info is protected by
  events_lock now that fatal events are processed under it.

Link to v1: https://lore.kernel.org/r/20251215115457.2137485-1-lukas.zapolskas@arm.com

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (3):
      drm/panthor: Report the last VM fault through VM_GET_STATE
      drm/panthor: Report the CS fatal errors through GROUP_GET_STATE
      drm/panthor: Bump the driver version to 1.10

 drivers/gpu/drm/panthor/panthor_drv.c   | 26 +++++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.c   | 33 +++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h   |  2 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 32 +++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  5 +++-
 include/uapi/drm/panthor_drm.h          | 52 +++++++++++++++++++++++++++++++++
 6 files changed, 143 insertions(+), 7 deletions(-)
---
base-commit: 6f7098738fff3ec7393f924343188cb8e6ebc5d2
change-id: 20261014-panthor-fault-info-v2-330a9f771fd3

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

