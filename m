Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380142F8BC0
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704305; cv=none; b=g6OkvjWdjKUm/wQFGyeQ6L7QaOnqdjC71U6B709VEZmtdDeRLrl0gUd/ofNHbwjVLkaRdpqj177NNU9XWnYyBI4LMLhRlO9zVxAtAS9XALrYhhhrLopWfDwme6mwJnj5IqqKmJ35IhbreMJNyHtYbM7wudenjX63ClF2Kaxu/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704305; c=relaxed/simple;
	bh=HQPmlZuqmy1jvaqXEPB8C2ivHe450I5q9ZiPbZke5PY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S+qzv769io1lGanSjbzksULyxa3EMaaRLglFPeBjXebh8KuSnHp0AYPxvSxj0yz/fffwukiri1ZOZmgMiFaVdFEGUBLV5+Esa/cLQhnY7On9cRvZnd2jZ7SOTG4m9Az/2zqjaH4uZQN1xZi9+IVt78FjNNtajmvn+V8PNMFsRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=en+DfVD+; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="en+DfVD+"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42e2e5ef669so2052915f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704302; x=1765309102; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GADi53shPuPGoaiF6mJrq7SoXgEzWuFl0LmVcCyBVzM=;
        b=en+DfVD+OYs2d1WhePT9jXrhnSh5ixCnTYRXyzoLjjPFTsnJx70MrrPP5oiSvUedWs
         8qLfGLLhb0e9ms9+wh1Smh06cctvXkY5Bl1G6FmqNAXAsKqm+KUy9ESy8kmDwAfwSDyL
         VWcGU1fNN6Gr0Nh61MXiCNSOPcngXOi2ys4ivxMTgP+MyPKuyZTBW9s99QKaIWcdwrca
         S/1OmNn+Ba3wvkN1Ss8xvNIv4+kXcfZmGIIwd6tKrPRI3uIv3b2+3pkDckLaxdIdOBmI
         DvG5voFzNuueiX+7CFjyZXEiSOLoxI/JTjdT7Ac2uiJEssxhf6BZoCSsgCm1RcfMX/f8
         1jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704302; x=1765309102;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GADi53shPuPGoaiF6mJrq7SoXgEzWuFl0LmVcCyBVzM=;
        b=jNvTcK4cPfiyd2MSVjVN9nwBimCDHIFq+TcNLlTy2JTLKOmEDCIdcdXnc8HbTQUk8m
         Uk/Ej0FHWaP9s1S7p8kiermy5uJutYFsfvfBNyJSfd7NZwt3J7asdABem2PiYIWX7bvq
         iCZM4xlnV2qFB8ygwUhRhzR4Vcp2uJuVD42nG4Ad1/1js6CPknU2FddElZ/1gXsnrXs9
         9VDS73d4Hb79q28yVcZBfFjZr7m+rJCsS3K6TcokXZHqaC/wqbq/RYX3KqYnk4MdsWIF
         abaH5ZtO7x7DzJJhce8vnCIeOICP8VF4oKe0hVbV2XLjbcTdsjI7ZC2GAtA9d8+lcODF
         ZWmg==
X-Gm-Message-State: AOJu0YyP+JW978pr2ow4jB5e1WpiybSOETeIJWPyEZNJ4YLYCZc864rg
	IbxxRvq0XJREuxRvgyUPWi4lldFJdsIGAeuBIQDkdlU/CXwsLJ99kQ+8pn+tI97OyaIWpkkTaPh
	8aMnh3SwgI0jPc2ZKwNXI4dMHE09yEP1MrHI7MHPRfX7KJ/UI589b3J5ysTZuwJA1td4vGmZ+rp
	vAWRZiBkNqMuJvoTFunnZXkbRBlrDVOTAg75SNe3H85WaTi8MMK0eXsXWq34gVZ/w=
X-Google-Smtp-Source: AGHT+IGivwLFquKKyG5s35oMf6wfTUf0UfR+ZxkDHpD2o1P62MgxX1Lca80vTDDPywDVEqthNU45oDE/TbH1WWw=
X-Received: from wrxq14.prod.google.com ([2002:a05:6000:ce:b0:429:de3f:8271])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2482:b0:42b:32a0:3490 with SMTP id ffacd0b85a97d-42e0f356837mr33418843f8f.49.1764704302663;
 Tue, 02 Dec 2025 11:38:22 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:51 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HQPmlZuqmy1jvaqXEPB8C2ivHe450I5q9ZiPbZke5PY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJ296M20eaXTn5iHORSLjRa4kioC3pSUgCv
 5qxgOseeOSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 Rl6LEACUhm6wg6FScz7UhWQKnntpwfOKJ1ySq8N9dMY8FBpurIiGreTpKT5FRtehtUkmfYw1VNQ
 +ko+2QeozmL5fSqzKSAwQHtMlrsQHPvNXqtkjr/bFYPc6ykbIM2cfMiJuXSJ+U7R2mswhQpcsPE
 GQLv0+r5XSKIL1BUQuibfWc77NOSGPDTzYun5AmdjwYGNdEieFpeiqRRnvgKAXuXxwTVJDSQmGm
 yxJCYow5AUM+okFK4QgdtRi5pP2qey96nTyhiBnMZ4IB55OgunN5+9MunHy6gxPSTDtM//83M5I
 FVpdt+VN7/ZMdCal5nlIGqCx7RZhYhIhC2B+DPkeWcfbUPhyHT0mNSMVoOhz5+bYCjwZ6VrPlr5
 IkbV2ean1sU2ekMd0YtAy88bNSTnQNS7QH4CiPjJSRjC3/k4bXVUXVXNsotk2+mjpjyes10Nr8P
 HqjVjT9wfCNLB3JQTDv1mIHinVIwgr8gc7lMt0wMA42TTKpQaR2cCeEL3em++seMzo/dPO1clw6
 BJm/3Ef6RxXdwhlNn9n4d6LI17YMdqUeTpLKhXd3uECBClI+I7uWKU1EoagOPVeP26eqvBIc9NB
 5Gam/Bs0Xhn9lQ3A+gNkuWNuT7a2MivBIlLzG5NgIG/3mKi1WiYWnqUV4Q1cdeE7d0ZHhn48maH X4dSF1YHsUk3XEg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-27-a2e13cbc17a6@google.com>
Subject: [PATCH 27/46] rust: pid_namespace: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Christian Brauner <brauner@kernel.org>
---
 rust/helpers/pid_namespace.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/pid_namespace.c b/rust/helpers/pid_namespace.c
index f41482bdec9a7c4e84b81ec141027fbd65251230..f46ab779b5279f0912c7c7440885e1c006f5b875 100644
--- a/rust/helpers/pid_namespace.c
+++ b/rust/helpers/pid_namespace.c
@@ -3,18 +3,20 @@
 #include <linux/pid_namespace.h>
 #include <linux/cleanup.h>
 
-struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
+__rust_helper struct pid_namespace *
+rust_helper_get_pid_ns(struct pid_namespace *ns)
 {
 	return get_pid_ns(ns);
 }
 
-void rust_helper_put_pid_ns(struct pid_namespace *ns)
+__rust_helper void rust_helper_put_pid_ns(struct pid_namespace *ns)
 {
 	put_pid_ns(ns);
 }
 
 /* Get a reference on a task's pid namespace. */
-struct pid_namespace *rust_helper_task_get_pid_ns(struct task_struct *task)
+__rust_helper struct pid_namespace *
+rust_helper_task_get_pid_ns(struct task_struct *task)
 {
 	struct pid_namespace *pid_ns;
 

-- 
2.52.0.158.g65b55ccf14-goog

