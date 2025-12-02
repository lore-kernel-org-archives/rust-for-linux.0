Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D12E040D
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704275; cv=none; b=RTdLRRE6UaQK05cy/DQjeUaswp0s6uRgHP4XzUYQx1sO/WGpWBhM+inTRj3vtkIGGAZc7KQh+7FBt0lLd+rbu2OFFrJPE+6CdgG2VVD0LC6qzpcVzZcV0oZMYAHNl0eaYxH9r0h/5+t7O2zdfYkwM/fgY1uOcDKSyBBg/hywO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704275; c=relaxed/simple;
	bh=vm6Wf1Wd4ic3j/FfAZO3AmNOKApA9t2nGPy2yseb8Qw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SxTQbubNk2ApkMs8/65zrjG54sK/p6K61+b0BdJyxFouzxELyv+w1UNWb+rpE66EO+8TNrHkPPJeMrClVQ+PqiifLTk1zwC2rcAseDnPjmBTO7w1PY8wJi9qy9VspDUQ/kkbDYhroDt3QIYuo0UEstwHXRdLfJER8h6eIr12eWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jKTBqLx6; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jKTBqLx6"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2e448bd9so3722962f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704272; x=1765309072; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFe5bmfhiLyCcVhQmcwuWyTvbJt7v/+I11HunR0UnQc=;
        b=jKTBqLx658PiMb8LuerLVRNwvY+GZgLTmTnT9wbdK7bZ9UJfFiNONjBsUrcx0uhwqk
         W2Oh6k3+4cyd84E3Khk+HlZg8Zc4VyC69XVU/UaTdmZuTsKbDcWhjiGbgdsZ11ft3B1/
         ApfHa55gP2r73RQpN+5779TIsFORA9tVjs/guT2RiYdRWr9Xu3gFUIFb8HZniNPP+/6Z
         s3+Nv3iCvqrShuCtlT1dQ2PNSOUvw6V9NoAihy4TNI6VPMV/DOaOrai4lU9u8MtNK3+H
         LqhcfST9eVhcLezChFJ0Y12RjSGchyYyWo/7mBwSUX6wq5x0av3whHgwmyuHu64nXUFP
         Ka6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704272; x=1765309072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFe5bmfhiLyCcVhQmcwuWyTvbJt7v/+I11HunR0UnQc=;
        b=s+5GUIjGMW+knN0IGrKIWY7d+PXdLtt9RaHEGaP62maMgOMDhZAlsAyYPv1B6Djnvv
         gI/J0qRSZkVQicEyBuBhWv2VRnARJSqB5DTbPTfM5CyDYT/DhIe8l8gP1QlkmqVS9lrw
         t1F1ctIMxhtbNZtRpVUbC5gQGyvDf0mirBMH9WIv8vZKAYyER4ItZNI5nFsDxoRAfV5T
         +xvnPzFpKAQISOICejb1b55g7pr8UoxStq+COwvTiUd+YX0umbJkkhTZzd0u4pCNne1M
         IxJ9HmiS2DUj2cWjgrCsrtPMjCLYbCBcCx595T6OI8eo4RaYc7YM3HGuAgwI2gtQYXJF
         i1AA==
X-Gm-Message-State: AOJu0YwawUtYm7WMLX1waWxAa10JRa2mCs2H99r5mdI//9eJKHUh6Lxe
	2SIS7AttA8NucOnyJNDlQ4Vy1ETvSc/03MECc7OongG/CI7XLIQ44Bl4IT2+/QRMJzHt91xyxP7
	JDdfJl1+wyFxjJYHZ7DrW08hMEY7jaPpKEvhNYdA2G7/FNKRdxvkSiFFe9EMHdsnazpNQ8XL4JR
	pRBCFD2KgUY/CY4IVzTcnvKtTnmZsiUdr51F0xhLbwKaOSA92/MpQicED+Xkmt7VY=
X-Google-Smtp-Source: AGHT+IHm+hugQkulk9EwGwcwh9r2QFeBYCjxWRVpn72SgiBAavS1T+bxwEOMDJ+0mSgvzFKkcKF4HZgNdfGNT6Y=
X-Received: from wrtn6.prod.google.com ([2002:a5d:4c46:0:b0:42b:48e6:2125])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:290e:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-42e0f3491ccmr33287068f8f.33.1764704272435;
 Tue, 02 Dec 2025 11:37:52 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:27 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vm6Wf1Wd4ic3j/FfAZO3AmNOKApA9t2nGPy2yseb8Qw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AG+DKfWTuZlNNxSVfXVmW/NdkyaCDUNq8o9
 NCCJ8KBHqCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABgAKCRAEWL7uWMY5
 RjLOD/9kdn+rLfin03t+sUWhFm+M81rS5qZLh9dL+Kk5wlKaAqvYmvBmISECY1bFGlltmQpmH0Q
 LynMgsdrzoHMBJDi4D+fFTCJWH85UADVYE3K+HCX88AjP/m9vcghC06a/YCRqFeAyarzn6ahpNA
 4A6KuC9sMA3OMFZ/YEtbuR5XgwSBKEvf1qZRVk66aSRcpzpkkhSR5eUE3nhYVcbFka46hNdgHc5
 1mkrlEWnYJyjD/FpzZFw7TBobtTPcCKbqI2a8KU6w1CUWU7qddvG4FqF0vyZubL33SJZYGV9LUe
 ynLuHgrCrrGKdjI/Aho1L8/UkFyXiZ5lCe5ocmp01DRW+ziCxAsquCBMv6ods0pQI6PxlcNujin
 ZwqrFGSPH6uyXjcnq35Ijj6Efg3zcJ3KiztC2Oeu3MfNEZm+6J3GE6Pk7PE7RviSanqn2NZoGs0
 1KNImsFzbZKbMmd+dq97lG2ENQexxOkbDYTImOCL/b7sCWJ7j0I1GeSjUIomYS93qDm53Ohr9E2
 DO8SCopQlSwFXe5LFcAW4kHSCa3+9K3XgH6C3LPhtbTywJ7jNe4jxZB8eHWdCayPQaK+IzwPQ5E
 wPbSZPyVV8OUVRSjove1LPXuUG/Efa7c0PFzgTMa7WQzkfbFcDWack3EcQmYBB+sU7NPuOgnAjp cioA82VXKPPouKw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-3-a2e13cbc17a6@google.com>
Subject: [PATCH 03/46] rust: binder: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>
---
 rust/helpers/binder.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/binder.c b/rust/helpers/binder.c
index 224d38a92f1d985d78767d5a72f5ff60765b8508..a2327f1b3c9443df0ecd33275f98d4719f0ab8f1 100644
--- a/rust/helpers/binder.c
+++ b/rust/helpers/binder.c
@@ -7,20 +7,21 @@
 #include <linux/list_lru.h>
 #include <linux/task_work.h>
 
-unsigned long rust_helper_list_lru_count(struct list_lru *lru)
+__rust_helper unsigned long rust_helper_list_lru_count(struct list_lru *lru)
 {
 	return list_lru_count(lru);
 }
 
-unsigned long rust_helper_list_lru_walk(struct list_lru *lru,
-					list_lru_walk_cb isolate, void *cb_arg,
-					unsigned long nr_to_walk)
+__rust_helper unsigned long rust_helper_list_lru_walk(struct list_lru *lru,
+						      list_lru_walk_cb isolate,
+						      void *cb_arg,
+						      unsigned long nr_to_walk)
 {
 	return list_lru_walk(lru, isolate, cb_arg, nr_to_walk);
 }
 
-void rust_helper_init_task_work(struct callback_head *twork,
-				task_work_func_t func)
+__rust_helper void rust_helper_init_task_work(struct callback_head *twork,
+					      task_work_func_t func)
 {
 	init_task_work(twork, func);
 }

-- 
2.52.0.158.g65b55ccf14-goog

