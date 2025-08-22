Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F9A2EC544
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854930; cv=none; b=CjHwCOsoeOwdV/WMDI5fXa3UPkpiWfVoc/SV/1PX+/z+dat5UXim2A03pzMeoKQI0LScWoMzQHP6OM94f3sci+djZKiJPIrHC23ecX6jOAAtuTeEm8Y6O+RVM4adhSPo20a0udPdy3g7bdBNz/1zfyWsPRWHRBknC+YwH5yQICE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854930; c=relaxed/simple;
	bh=IbLEAjuHyqoZRTWTQ1Get3JTdLxmKfmmH4b9vD9fY7Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tkIi920oluE6Uns8xsT+GX98kf4cja6VQf0e9yXYm8CLvrNKRBZNWMG7suIJr0C8SVZTLqgN52B/BTQEnsB3SmpFGJJ1qeOr4FJJfyL1GoslC/SJT1jQiE+wplivXuuwXxg5+QRiaSjZNOSvo5HYEBWCvSXiPMmCalBpczbWS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HYojqN9S; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HYojqN9S"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b05d251so11082645e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755854927; x=1756459727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tdZspPlKaSzIHZ+2SN/TDgYtX3ulzfnLR3chwiPSwtY=;
        b=HYojqN9S15y8qfkOHoF9u3nBL4XkHfd9nD1KRznW0YjguFEsTsf62xtit7phbBIDBO
         iKzYMl5cMbGNdPV6YDAgE/uO01S8ZUQ48GOZoQeelVuKueOKTS4/R3FQZathCEbwFek+
         r1VB3uebrfg9NFvI6Gy1Mo5ERidRJhqOsqqC8N6hlqZgCCyp9oCmLb0eIOOk6t75i1Yw
         EZ6PTFQU9zgpU3/vSUPxBtVBPh2kFAwAbIl1xRSdNaS7f7QhLDvAvPxnfWJBhq+UR2CI
         mg9W6H6Gs7ZykUDRvwGLfWrZhk0NTMpr5XDde4XkcysjRUPTigib3BzbtRrPBRgvcoyq
         kdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854927; x=1756459727;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdZspPlKaSzIHZ+2SN/TDgYtX3ulzfnLR3chwiPSwtY=;
        b=hTRrxj12XQNu4FWwavkaDraWiGBX2hDmadbiAUWPgU4pyoKhLHx9RNw2zt+K+d3DYw
         S1ULMk4RYTtS7o0wp2wGJFSSXZEgmpAT5kfhHn+jv1VYeNl952ynlGA5Ge3zaFD2HSV1
         Xfs9OxLQW7PVL2gJQcHAzK0EHkx4ys8kJ9UTU2XSCpmlOqnuyU/cUT9izxpcYEZyVisP
         TNBFGTaq41oN0SB4264tNcW/RR6F2WIks00D1cmZjRguQIy1qWfM9liWyt06dVxTcWbZ
         d+hMLHXka/oNCba/Vjj0I1masMDjK5vockmwGFK5+vqvyx6MeK1ZZ30zwi1k3HiGArkX
         CjMA==
X-Forwarded-Encrypted: i=1; AJvYcCWiSma4VKlPjtLxcbRs7J/Esl7X4LeurU30dbbetFt8lViLnA5cD71FAQN3zxYijWPgMzEJ4dSdyZ8/m6WhAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvqGS9AuS16S46KhoNle68gkmXEZ5VZVaRq/Am/eU+swW2w1t
	gdRal4XwqK2RlOrM+ajjZhCgOwiQ6pkbaIZWJ4nyhHo+Irf0H7+sIaHIczyVaeZEj+t0MWkMqGi
	90bAsaGepLKECnXtoSA==
X-Google-Smtp-Source: AGHT+IFR6iebHf+8m9CthwrSpnbKhlvbWxtJ/c0VWjlsjpaPAyeik2NIhpLjJuZj3UbyEmu0IRZMKxiqKzeCS3M=
X-Received: from wmby11-n1.prod.google.com ([2002:a05:600c:c04b:10b0:459:d6d6:554d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1548:b0:459:d709:e5b0 with SMTP id 5b1f17b1804b1-45b5178e893mr20589265e9.5.1755854927367;
 Fri, 22 Aug 2025 02:28:47 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:28:23 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADg4qGgC/32NSw6DMAxEr4K8rquEv7rqPSoWAUyw1BCUQESFc
 vemHKDLN5p5c4Inx+ThkZ3gKLBnuyTIbxkMs1o0IY+JIRd5JVpZol73oNDsGx3IC2oyqGrRqr4
 oSqokpOHqaOLjkr66xDP7zbrP9RHkL/2rCxIFUmoM/UT12DRPba1+032wBroY4xc4q3GTtQAAA A==
X-Change-Id: 20250814-gpuva-mutex-in-gem-a608ab334e51
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IbLEAjuHyqoZRTWTQ1Get3JTdLxmKfmmH4b9vD9fY7Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoqDhI7cJ5PRI/lSv1X75CC6AIfMHgMPZS1RZIN
 g5Lt7w1VqmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaKg4SAAKCRAEWL7uWMY5
 RlcaD/9/NlLC8uUEjxawJfxBiv/2EsetL0ASiMNHOOfB3U8qD816yL7nN3UvHwlvTrXHzhT7A22
 Vgbq/nU0Be2ft9I0TEzz8MIFc5iG66Q2TM3txaBp96519MrHNj6eZT1WBRC/ceFcOZYEWqlRDUL
 8K6QrGpO0DA3R2/xwFLBiTyNlZ/fmx4m/ZG48Et1sB5RpCSyu1aMGx8JallE79LUd3wlLYaJW8f
 bBa7iWaB5rLaPls3w9i1RorovONa2VUt9nqc/Jzh8TVuueKvcPOfS/01zeDnZXgexESZQQejF1q
 Z73usLjZ09gSfOg/TMwTjzj77iQ5vZnJnecgDaMNcKucZ1d9+NM/aOwjr1RUUXsUfqHQs09bspJ
 aHwKl1p6fQdDv83GK9qRKAXKuH53SmCIb3YufjTQhpoB1q/KctdRAA9sBhHNFUUrB/j8pyPeaLj
 ynhWmNIW8OXGFykqExurrsnJw0wq9lU1cnXy2G3+N2CpoxE4gweveYIUQFYUDZPknZas1nng3zS
 S/+z6oRE13mtKcNv8ECUK2LVceNOifVVZVIhxLUGY8/inWuPJv+qc8b/Dbx1yQnl2qpLNcbnVlf
 C6RvPM7HvcXdPvCrWTttwRJswy87NqMqXMuoSck5WftFq3XiwuvhEBbc9jPqQfAcWaPuN3fb00T ExxdTky9MUx9uVw==
X-Mailer: b4 0.14.2
Message-ID: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
Subject: [PATCH v2 0/3] Add mutex to drm_gem_object.gpuva list
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

See the first patch for motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Move the mutex_destroy() call to drm_gem_private_object_fini()
- Add a third patch to get rid of the lockdep map.
- Link to v1: https://lore.kernel.org/r/20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com

---
Alice Ryhl (3):
      drm_gem: add mutex to drm_gem_object.gpuva
      panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
      gpuvm: remove gem.gpuva.lock_dep_map

 drivers/gpu/drm/drm_gem.c             |  2 ++
 drivers/gpu/drm/drm_gpuvm.c           | 30 +++++++++++++--------------
 drivers/gpu/drm/panthor/panthor_gem.c |  3 ---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 -----------
 drivers/gpu/drm/panthor/panthor_mmu.c | 21 ++++++++++---------
 include/drm/drm_gem.h                 | 39 ++++++++++++++---------------------
 include/drm/drm_gpuvm.h               | 30 ++++++++++++++++++++++++---
 7 files changed, 70 insertions(+), 67 deletions(-)
---
base-commit: 3f13bcc886fc034113cb75cb32b8d9db1216b846
change-id: 20250814-gpuva-mutex-in-gem-a608ab334e51

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

