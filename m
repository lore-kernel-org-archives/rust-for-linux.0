Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C72F066B
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704291; cv=none; b=lKKHYzhkhWVEVOUNuiJODnd3Rqz0CmnWjwYZpHcXFrtEK+sDa3jXK8Gm+9CpbDG+3PB9EFPwGhc2EcKRbcVY88Svt3hEKB1mmbeyAEx4m7SQXK5GTZBBswcmUF2S+uMTl1Pj4m2L3Cb7MfhWQvdiuSkjoh6wLzaqD2BTypiHgis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704291; c=relaxed/simple;
	bh=sST1c+3ZyzAW/E80FcjGAk6wD43FYvTDqpSCh8gNtPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U84sIJvGjoYfBIourhOrDo51u7iP4XoUUn4mq5dS71cBtqiTxpLjfgws0eT+TB+JjCpsoq1S4/VwN8YqWL/ueWFeE2IQrBTkizeyuuCHjdH2nV6i5ofsOx5TuO8mTPDF5hCaylx5iB/FOS3Yol3hM852S/8cI6L8lg8FboJ7YZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xvTBOJjr; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xvTBOJjr"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42e2b9192a5so1569848f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704288; x=1765309088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfLoGU+E3p+RrNIMIuq46mbvUH2DGFHCCTDh+/lSjFg=;
        b=xvTBOJjryCKo/pkANS3HVUbnyddtxlY/HHx9Xrx90F/qoYzRs74ov5r8dCCj4njOCg
         pS/0gF1klTigfEXA/UFhv3NG4s1IlIqnYC3uyp3E6OqTvmqHrvBJRPemdrzwTfqVwZTN
         jCrE1o1C+knxlj8m/RgZ0fBEjUohbo4eFl4oIuIcb+exqL672q5qjZ85bd9lpcSCrkP2
         nkbVlNY1UAaq99U+i2bO32qM82ZchFNRY00inMMY9I7jHNMAW83loNQFGl1rFdegC76G
         JvVIfZFZ+2/OFpeiRInNuySDqBVlrmkkWISgqt09l56etY3PSSVlbt6TWOWYYvuA9ibx
         At2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704288; x=1765309088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfLoGU+E3p+RrNIMIuq46mbvUH2DGFHCCTDh+/lSjFg=;
        b=tHqvFwDH6Rl2wP5EqCxG0zxddJWxlYCnkNlm/DaO3fuHit/QGKKhgXCkCobDDCQNzB
         cfz2Ete/6xUGIDENslD7sqhUWp2o2/GZSaQ0r3BQdvn36i0w7HSdS/HD89zhxfB6x2dH
         TGlREZepV0mePHkMzKap+bz7eaWsSSyCpF31TS1uCgPVR3N0RqR3xKQm9zSYc0XXra4N
         zQxB0dcH6VF7HacIv52rUdFHNraWcvygH/OBQl2SeQZ4eYBm08/BjpH2Mp0jwcMSgjn/
         GdhWU+97hVFvGvTSryKJX+4yktGuylip3JjbTO5ofwxSTgz5LUKH0P+DAa1oo8ahvqq8
         rY4A==
X-Gm-Message-State: AOJu0YzDHbE8rrBmH2K30nq/uQZIhKH8mDxccydrjWu6ExRLfCdql5Uo
	EtFS1OIBW1C4S8c5Bq/16WcAyiZS9OlrkCtPTsl3J34i03SkPFY6BRgX3EFM+hGzo/tjNsmY+bj
	zvLL0Z1FaelppbP8tCwQkK/LlkaNDE7bqQMKwRbiaxVxAFCjS+SggsQaVREKBoRFLFuaSSAzJa4
	EfZwPwBbxXWqXOS7WPirA52vZkbfRc5WcR4l+RdCQ5L0dfxVh+FxrlQ1kulJJawX0=
X-Google-Smtp-Source: AGHT+IHCJs9DCLp6lX8zcuuyuXzAWqOm2o2jHoyKCx8BF4VgkI61l+lypwThJWpAO2fl7b/Ej96PMm0qjlZYpug=
X-Received: from wrsm11.prod.google.com ([2002:adf:fe4b:0:b0:429:dc18:dd64])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4203:b0:42b:3dbe:3a55 with SMTP id ffacd0b85a97d-42cc1cee3dbmr44714640f8f.14.1764704288473;
 Tue, 02 Dec 2025 11:38:08 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:40 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sST1c+3ZyzAW/E80FcjGAk6wD43FYvTDqpSCh8gNtPw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AIMEAmwihjM6RGs9E6W/WhMe4RZWTlHjdVW
 6gJ4QE2URSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 Rj4SD/0cxHq3vUR3Q5TbVfh/kEVY7Wus12D+u6RIRBco1tW2zyRMwqOfLUMlN2wwnmq4UQ17wOg
 HuiCRNZsNPC1rkA0zEsuDVSbMGMdr4dVPsvstfzXu4pVc4FtW3YU+gqqU+/cSrTvojq1hXUHZGm
 5doS8Ewf1ExjC5lW1YLvNoEZ0zN2fE8VCz4qSY8GvTo8Av1oLbrr/Ga33MHfxklhMPingaop+4y
 FDDz4S7/HIIcc+Iff1Ary8ZjVwPShG3vefBKUa4coa+9TgUUXMkBmNIgJQggRMviFQJtEyUVoVP
 adMyB9fgqAsOOIZPMU/WAMksCd3i7BU7Gh1KOuZextcOdsMuttmQpWunT4f44vxna4RaGwUDA3d
 G9iwxG0e+xLHRnSh3qaSuMePJi3pyY0N1B7p91RwSITEXXdTCzjC2H7aObQMkx+LqRTfRKM0npP
 fLHOPyXGTNXX83i5qwxuAAJCsBXeunikZLxdGlxCu6PFvq+1LZVdkRMXjWvD79qI1wjfjCis9eh
 /E6NdyE3Y4seXXxSs0goWcktdrhK/ekAHCwwR3SHzIYJEQBTWGwszpT3vFaRDfgyPlMot1iJqfs
 LVgd3oMPntCW59FmRS6kE2A5t+V3YeNt6nbigTpaGTzqjvj9okXO4hfKfC2E30uNcj6ntmgusZ2 8/obwN+FVZBuxcg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-16-a2e13cbc17a6@google.com>
Subject: [PATCH 16/46] rust: drm: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
---
 rust/helpers/drm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
index 450b406c6f27390084e041f9bcc527fe3ce429b6..fe226f7b53ef0c02e6b715e53e01e76bca9bea56 100644
--- a/rust/helpers/drm.c
+++ b/rust/helpers/drm.c
@@ -5,17 +5,18 @@
 
 #ifdef CONFIG_DRM
 
-void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
+__rust_helper void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
 {
 	drm_gem_object_get(obj);
 }
 
-void rust_helper_drm_gem_object_put(struct drm_gem_object *obj)
+__rust_helper void rust_helper_drm_gem_object_put(struct drm_gem_object *obj)
 {
 	drm_gem_object_put(obj);
 }
 
-__u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
+__rust_helper __u64
+rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
 {
 	return drm_vma_node_offset_addr(node);
 }

-- 
2.52.0.158.g65b55ccf14-goog

