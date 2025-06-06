Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A91F29A2
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175575; cv=none; b=f2L9sTihwyPfnNjm9M4hf51UZLR+7IVtK6fJb6YRU6QK1qp1oYyRwoET34sdkl5IqsYyqBWQ/2QKbHiTXhXMBYYw+PfiNFC7y5eH+dpWdrOphhb8dtPd5djJuDmjV+2Q+P2s/TTm6kP1t60YLqb+pnxAoVef99hbsJLSaxIn1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175575; c=relaxed/simple;
	bh=snS4wPjSfYEx2lJC3zad7KVc1kooMU4u6GCPw4RU6I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBBSYbj8WTrQJUln/cMwpm6Jgz2KB3rRdUsX4KWdXHvyrooO1/iB1DJwA3edRrV1CoKgY3suaslacC5zw16uXf0FXZBiuobjOrFWzpTIRTR7tBu1iJ9x3l/dNy2D5eygory4hUP9NGEF1KsawA4v8sig8pGVoJj1A2+ikurXaKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dD80rqjp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dD80rqjp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747ef5996edso1305200b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jun 2025 19:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749175573; x=1749780373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRA/CkKHJ/bKnFt4IksGqDjOr0lIUJBfdxf7yd8h5lI=;
        b=dD80rqjp1A1/dnnOYz2OtpDzTHZsZzqJGcb9NxzPLGT3hUb0J+4xTxttxOCE23Km/T
         BfrvmCWv/a4aJPBgBr5lIPT2MYIpqJn0+iLvSuKz7aVgJj16zbVR+R1fN7DdVChaKJvl
         DDEi/0uKZgFlSMl9pn2eQyPgBsuLVw8mCZii+WvO3uu1vsp3xON6IAX0FzO5+llt5xXy
         tjLNQ9ba9ehvUrJqMiYWplUCqk/osnvlM3ARhPJJAAW7sUIBpHJJ+Cy/7toZ9wZn9laN
         6gGfL4rwaPOpQoxvK9HmRTXkGYJmv9ol7jdEuu3W1SEQQoRHlpImplbE2Sg2Vjm5qAII
         d3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749175573; x=1749780373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRA/CkKHJ/bKnFt4IksGqDjOr0lIUJBfdxf7yd8h5lI=;
        b=fbHC36Q023r/a8btsg66qyyqDICL/iP4s+fb9oJ8gdEUkubRIphDnrlS0pFLa7K/uR
         xAad0yNNsjCBkifTMis5TuLrdWOX3t2DOcQJSqMJAKlabYLYSCwmRcZoMAF8AhECDUFT
         1KoKefoMPKphKROpMtxIBqOgxLDepuXytkyIWgZcqtIxu0JiYMnTMeKzB3+w4KqIqIyM
         SKoLbc8/kOKS/BlPteCO2zJEIZqCdT3vmFdNwIxAScYGw8XVruSzk1ok1sj6O7fmM/W0
         tyVKUIqowPOQZqjTK0xEoEnF+EEYJYdMLfayXm7ja8pVm9XXV9jY47TKkXi6/YagZeXs
         k2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAg98YouyObADSHvEm98orKgkNlrSh1ntjmW3LWJ7ivIVS9sQre5L3j++iWfKYVSoVY7rLpoB/gZKsEKRxCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNndazP/na/O7Yv0fZA+KYjw6eXMk9Ln+tCVoxc0e5ClVzukGA
	yPqbsWZN8rBngQArpepO61rgaX9cNjcLX05ArBrNef9oFtEz++9OymK0
X-Gm-Gg: ASbGncvoPjV76yu5MNHX/Qi+OQjd3L/K28XX3hS8s6ZtDH73htteO9WbRkGz7ME3Sl5
	v3oEiQeXdzyvCJs//hfIlpSoYjhx/fy5Csk8Z9ntdaYScRFkaQJcPIMrXnMxdb3uvngzcyEZCzW
	AF1S+I6hfGGLYSDj73bZf5sKT4qVLTxZy7VNjke8b5opP4guOmgAt84Lpeej7ZxR+hqvuENQZwS
	IiKCxqNXmzMzPrtl8w5JuDzD5Wj2TEl4554DV9HaUd3VAgGTqj2P+NcVEEMZIzFEeZH17Sg/1P5
	apSk6ylCkHaGZQS/ZjDHT3FRsuzsZfQ85GJQVfkW9yoBsuVaO8rBXxh8cXy/+9XUF5+lfa+5snF
	islshpW1Bwg399d1i0aLmC/V7lP0n
X-Google-Smtp-Source: AGHT+IHMM8Q8mn11WCgEuSOFdlOrTqghktKJ7Hu2SUFfdVba94tvyj1ZA2l71GcCSXsGok7PGbvhzw==
X-Received: by 2002:a05:6a00:1ac9:b0:746:3025:6576 with SMTP id d2e1a72fcca58-748280191c6mr2116517b3a.14.1749175573574;
        Thu, 05 Jun 2025 19:06:13 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3aba1sm315060b3a.33.2025.06.05.19.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 19:06:13 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	tamird@gmail.com
Subject: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer macro
Date: Fri,  6 Jun 2025 11:05:05 +0900
Message-ID: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a compile error in the `impl_has_hr_timer!` macro as follows:

error[E0599]: no method named cast_mut found for raw pointer *mut Foo in the current scope

The `container_of!` macro already returns a mutable pointer when used
in a `*mut T` context so the `.cast_mut()` method is not available.

Fixes: 74d6a606c2b3 ("rust: retain pointer mut-ness in `container_of!`")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 9df3dcd2fa39..36e1290cd079 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -517,7 +517,7 @@ unsafe fn timer_container_of(
             ) -> *mut Self {
                 // SAFETY: As per the safety requirement of this function, `ptr`
                 // is pointing inside a `$timer_type`.
-                unsafe { ::kernel::container_of!(ptr, $timer_type, $field).cast_mut() }
+                unsafe { ::kernel::container_of!(ptr, $timer_type, $field) }
             }
         }
     }

base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
-- 
2.43.0

