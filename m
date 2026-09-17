Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6284551597A
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667005; cv=none; b=K58lZC8fWHkz3T3xkhX+BckUj0jVBTD+G+krReuEFjcfhphiBBJHfI8OA2drTijiFyI3wu8OVtI6pt4u2adtYe26nZHDAzNw42S9xWyIbDwh4dYRSSeoE6WF7VmU5mFQKIC10UGnUZswm396PTUgiSdIXBlSSrPF2WFtX9zN5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667005; c=relaxed/simple;
	bh=xRIBk/+4aAdTisP5cPXKdrRiblMmTACWUkNkYGUGEqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tf0Pf1G15Ji97BEb7QUq3L3oVCxUwEvvX0Ik2MBPs/HT6aFZSKmyesb15OGUBJowg8cZMCoOfUduYeaic+Q+HzmUadBY790w0JoXorlcAUDdyC3pSPSKy+bWvctvRSlYvdFrC6/gQxnLTvbS7760bR3fWqZ1rjcn9JU9OjcDfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=WQyHlb/L; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="WQyHlb/L"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so5856845ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1789667004; x=1790271804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTn/g/T+EO2MriuUGZpknmrePNwnpKu/d81Bl6mlyW8=;
        b=WQyHlb/LpyYQxb1ZROlvJUWDDWztMcD39XzPwteiVdqR3lmSP48T92lTTDSAMNPGgR
         g07uaNVsByAc0s4LDaiZ+90qKx2AjMgpndw6Mb/VLZJDKD2iO8cVlcEKsf0AAuX0Bllm
         rerSEXNppfv68FRrQFlPXw0hKVdR86grVtQStITkmAFbDqLKc7tmRWfuluIdEAocQJ9J
         LmgfSuGjscG2H985BJq0gfSYdydoMipvopaf3UkCQbtRx55g8XvqRVqVKpGGtGoas+9r
         9MP2Sln6QYtedid4UIi3WpQ0Yg+iuulX8xa3fSPBe6rTDV9IhCH8kS1sSM2aNdylYeN8
         wiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667004; x=1790271804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTn/g/T+EO2MriuUGZpknmrePNwnpKu/d81Bl6mlyW8=;
        b=D19x8N1mxDlSutao2BbKdpNDud4ixSIqtENV5C9+4rta87gScjlIaMB+Oe1wqAoFKm
         sEF8fPlD6VI41S3jkI404XR3Zssa/cWfhYEn3IPPsrI6D37wDRnpmmm5oG43rRuhbTwr
         KT9FXrCYqmKDvWDsGBiYStjby89l1y6vfowUByu/cy+iOPm8QEtHOB0tXOow8aLGJKZ8
         5auopTq4j740Y5x8fKs6zDgk4PzJsdLhTJyPtBPTQ55I0i2MmGFA52ALrQUshcLNfIcb
         eyhdRAMNwTkw5Ve0LA0K6kzmlokstKy433sGbCZdyFMpPcAof/OnNBmbe6Gc/a56hY8v
         OnDg==
X-Forwarded-Encrypted: i=1; AKwUvBxPnAY4vhEOXVnHq4/zGLIT9oBAhD9sn3ldc3e98nBjAUpejxofaU2mijFw/KD3k4eNhlDs4LjFoX4d4EG7dw==@vger.kernel.org
X-Gm-Message-State: AFuF++niWop3hZxm4gjiaY5pVNN+G20BeNMJyJiCtHKCzb3IWfsVRW5z
	q/oYp300B6rWBZiYRlmc1eJ8Vw3Kn4s0dD21+b4wlkdJPjvHCnI7062YxGPLy77wMuo=
X-Gm-Gg: AYBFou3YWUjsL+L5H2ySZNttgshkMeMTZYB9BQlzOP9EwE6OKXxLF3zw7xrG0glMKRD
	65wCKagGFq1NJK3i2gUrscgOU8BeLxJEe10S0YvJPJkVO1p7owuMP+eXJmoDFU3J57voOL7WEkV
	X2m2gq2w0loU5dTO7Hi2TeB9MO3X8OJlKSDYBaEz7A6ZqvYmVYQWYXDyjB017zwQcZ8AAny+vzs
	+RhxqDR2EJxg4v1wc/j7OC+aIwFy70tgAgRg9hSLgIl/VSwUX4Voq3EWrlZTfnfwD66Hpa8J2rk
	N8nnBcQxMtsC/Y9arMYCGknh7BWUV+a4am6h0agUfWOFR+JsjoQKEqdZcxW2IRhN10EapJHYfYG
	LTtcwgJsHBjnjjhsdI9BfQoGbyhTU1gZHrbl0BmkVO3VmtE0G3Pp7vxozijPO28phBMgzbriEzd
	rClGM9M0/N2yZekXD5ynZlQwmD3WKKJfNY+IkfNXppPWsYxBS44LYlaoc18yQw2IIu3nZmOQn7r
	GuUV/7g9awkdKLVlq9QY1oC5yEZ/bESpoaf
X-Received: by 2002:a17:903:3dcd:b0:2dd:ad73:5b74 with SMTP id d9443c01a7336-2ddad735d45mr13537105ad.36.1789667003705;
        Thu, 17 Sep 2026 10:43:23 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm19657730eec.14.2026.09.17.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:43:23 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	ojeda@kernel.org
Cc: atomlin@atomlin.com,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: module_param: Fix potentially incorrect access of `SetOnce<T>`
Date: Thu, 17 Sep 2026 17:43:20 +0000
Message-Id: <e65203759411aeca4805e3f619f3dd20839dba35.1789426258.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1789426258.git.pgovind2@uci.edu>
References: <cover.1789426258.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `set_param` function casts `kernel_param.arg` to `*const SetOnce<T>`
But the Rust module macro in rust/macros/module.rs initializes `arg` with
`#param_name.as_void_ptr()`, and `#param_name` is a `ModuleParamAccess<T>`,
not a `SetOnce<T>`.

ModuleParamAccess<T> has default Rust layout but `set_param` accesses its
first field SetOnce<T> assuming it to be at offset 0. This is not
guaranteed by Rust and could cause type confusion leading to data
corruption.

Fix this by casting `kernel_param.arg` to `ModuleParamAccess<T>` and
then accessing the `value: SetOnce<T>` field.

Fixes: 0b08fc292842 ("rust: introduce module_param module")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/module_param.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index f9a14765a926..7ae87ffe1d6b 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -75,7 +75,9 @@ pub trait ModuleParam: Sized + Copy {
         let new_value = T::try_from_param_arg(arg)?;
 
         // SAFETY: By function safety requirements, this access is safe.
-        let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
+        let param_access = unsafe { &*((*param)
+            .__bindgen_anon_1.arg.cast::<ModuleParamAccess<T>>()) };
+        let container = &param_access.value;
 
         container
             .populate(new_value)
-- 
2.34.1

