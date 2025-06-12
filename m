Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA761DE4CD
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718043; cv=none; b=B6Ed++2ZntfqojTrR7UX9gqnFWwEpmYOlWric7kyqW5XMGMa34AmwS7ek3wDuxaSdYtWvHrE/hidLElNVkQOqSDqx5EsIO2uBntl9jYUCoFmwTsrxEiMa3hPNVrp9xSB1UIXYvr/wQAmpNzv2Do4nHuIryIH9KIaiaW/ac4/6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718043; c=relaxed/simple;
	bh=e0XZA+pEMbFKBFCFH2KvewQbzYTLb9Pk2kaoIMPIqqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RSTNcUyYv+RLDWkkn02V8vX/Fi44jDf969RneaSW75lfGo+IvDg23/7tS6wk0GHaGhReqoakihjQ81TCjTCPUi3biXdXJfjTl+BaZIyNgxKX09eFM1JTp3nqn19C1ToWxfpj7wUe+Gil2Yru7RgShqoYUuYvHIn2/xyb22l7mdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfEq48Gj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfEq48Gj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fc7506d4so738365b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749718041; x=1750322841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKBg/43Jgo/wQlg/CSGcCcnKsd9b2suV1RsudSx2eEs=;
        b=bfEq48Gjv+jIviONT9a6nrb+D9naXP2HY+9OOKKRSaXN69VPOR+XixuN7arNqv+0y3
         bXkkdfx5eZJODBEIX7stuB4YbJy3rWoUSRMhbiwg1eXHDL6li9c1DTVLH4+9tcogCE0p
         pJyvK56pwCiUGQ8XjKaDNU59IwldQA5/99CpwqIBIBpLtQ2ZxWcYJywdyPF7QMgf7oGC
         AlI2npjzPCj/gajBzyp6t9uLl35BVWDmfHwE86VKpmc6bujE60+PPUzUhcGzsux5NX8e
         BDNjUJHmeLbi94dNxx8bGyIoKdAWah85lPTqhAEzM8/HZE84Cx28g6HTvqo4aUD2Q8ZR
         WDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718041; x=1750322841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKBg/43Jgo/wQlg/CSGcCcnKsd9b2suV1RsudSx2eEs=;
        b=JNfCXHZBfO19atyqEd19DGsUsDi8jy1ViWm3FFh1eEI+PfFcZk0v9SlEhIB2qj6URy
         iSOk/h1i3BC8BdJYNsQL09UUOfcmx0JY/9eC7qQaoQ5sM+tyeSUbbJgV7C1VM9PVuyRF
         w6o93jcwGYgdUYIYRkEhQLCHnaTJN62vDgaNjffP6mqcIDx1VS9kJd5iSGzA4Iiht6XY
         g21TuQuQhdIQaApG3AkQLWdKcX3ETXkPybAIzqKdINWqh4jRV7R872m4cpZepiJa048u
         bQRtI+tK/5SbLcpcbmYJwbxARRfTAV8x7T13rA5/Zfk4SY9s5al8WuLy5h3KL+RyKA1q
         dNgw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5nfoKAh4rte2zhjB8xJwDUuxl2TMTFWE+mUxEsJyGsH/Sgsg4FxkACq1egqvhxU85Cq/ILHBB4SDwZZhkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYQn34/pNjaUFwol3dfllM2YauDLo1SaUN+CLiwZGrM5wAKYv
	ZH9RGvtG1MXgK4QWOqlcdwtY0p/kylf/dU7K9FazWflBGtySnjePnjNS
X-Gm-Gg: ASbGncsoicNM/D04+6JRk0yj7l5s35bOZp1JOmOeIAHcuLtVUcMqSXe3Yful6H6FGOw
	DBqV46srs9xzR2UeMYwnjvao7fq3ClQFkikwMMNIA4TToGOjZ1RHhjyQX2oj8bCny4fQu+x6Smf
	BUNNtpgs4bs1QISYMDKwQv4nDJ7ROsB2wbs711v7N9CBhhLwqXo9OeK9f/56NI/vbZc0gq4oeBQ
	u/1cYzubHUQQtkdB3UC6TTD1fJHOE9OauC6hYsAIhjXHi5JUBs4Ax9cAWSLUC7gtUskAiRjRcPd
	izwPnEqykxOlf4LLRWhTpFS/F6N+oz/xbv+x3ygwwggP6DbKZWdimPiYeSrjKSYi
X-Google-Smtp-Source: AGHT+IHwU0YwP5wqQIJUHCPlq8K5EWq/Cz0f5aHFRaJBTrxNdfRkdz48jMaX6lqrAW0ExwsGTajkwQ==
X-Received: by 2002:a05:6a20:2588:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-21f9b69eeb9mr3165399637.8.1749718041030;
        Thu, 12 Jun 2025 01:47:21 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c96:fdb4:2bbd:5e55:1c88:31fe])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611e308sm876950a12.8.2025.06.12.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:47:20 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Abhinav Ananthu <abhinav.ogl@gmail.com>
Subject: [PATCHv2 rust-for-linux] fix : Update the bios_limit_callback to use
Date: Thu, 12 Jun 2025 14:16:24 +0530
Message-Id: <20250612084623.7410-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DAKDXCX8JJVP.2MG7OCAEY73MR@kernel.org>
References: <DAKDXCX8JJVP.2MG7OCAEY73MR@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PATCH(v1)
Update the bios_limit_callback function to use C FFI-compatible types
(kernel::ffi::c_int and kernel::ffi::c_uint) for its parameters and return
value. This ensures ABI compatibility with the corresponding C callback
signature.

PATCH(v2)
updated the `bios_limit_callback` function to use `c_int` and `c_uint` directly
via the prelude instead of the fully-qualified `kernel::ffi::*` paths.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com/.
Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 rust/kernel/cpufreq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index b0a9c6182aec..e97607ed86c2 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -1277,7 +1277,7 @@ extern "C" fn update_limits_callback(ptr: *mut bindings::cpufreq_policy) {
     /// Driver's `bios_limit` callback.
     ///
     /// SAFETY: Called from C. Inputs must be valid pointers.
-    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
+    extern "C" fn bios_limit_callback(cpu: c_int, limit: *mut c_uint) -> c_int {
         from_result(|| {
             let mut policy = PolicyCpu::from_cpu(cpu as u32)?;
 
-- 
2.34.1

