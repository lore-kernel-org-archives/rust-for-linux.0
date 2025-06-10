Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A227F72C
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551531; cv=none; b=eJim0aJ+3fUl/kDdX9wlcQEQU32yfmxY24tTxPZX5Q5m4VAqf9PtCK2jK/3V4D3UGrc9I2KyxSqbvPqS5zO5bCV5Uk2J1McBlfBTJmPNbg3BIc9k397Y6Z9Q3M0VhGEqZ2vaaZQ2Ne3RbjkXOGfocpVmFtyLWNBdAQfZzHxy4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551531; c=relaxed/simple;
	bh=MoQQVvQxFdG/8raL3pZU+XN7tPsl6Nf3fXBxf99VlCk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C1zvMk39l04GdQU3uxQE9gwRjCR4G21GyADjgJMMeEQ4sZMqh37ge7s6myXguTzYHJS3FhhpW8nUKygZr9HEMKV9mxGoCNu8xNds+IoUGqraB4knxPHv5XbmwsGehfykUI7iDyLrzF6K4v/G8A+Gq/TU7M28m+0csMuKNck7/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EU7JvLNi; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EU7JvLNi"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2424353f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749551528; x=1750156328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VkxcygRD9VdcN+IOxsdUezwrR9i2IQJgav8A95YBiYU=;
        b=EU7JvLNiUuFePMEsrfm9WaEYMRoB76KqRO1gTaZNvPqsIzZBoyz2DEeCkqMgFYbctR
         j7E2AOhKf4nVr+dOhG2C3SAxW/3/6TRAgANQPM4d3UC3N6dP+A9/VVJ8jBkgKBW6FHYQ
         aMYiZA8vOXObc2inljmYo6mTGrfDh+Rkxsyz1Ka2qy0uh9SvDq/v78YFcz5KfdxZR7kU
         E4W/CqEXpeaPHKuIMG3PEfc/b9vB61UFfpZOfGVgUR2067Xh1zy3+R05yobKadAolVWt
         pqr9KEAhUi6IeyFTzhNxCVeEPXrjvk5Qp0pTIk89ajx4z61LTHL2rewbaoj42Qg9alNG
         bFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551528; x=1750156328;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkxcygRD9VdcN+IOxsdUezwrR9i2IQJgav8A95YBiYU=;
        b=VL3RUTuN7JfdIUXfkJYJV9sP4PjUNSnQlj4iQwMUem8PC76nDnGIbF+BxfBL5gh3HI
         bgxO4aMSLMmna+IzAAiv9QmeQlgMk+XLptAaGok801R+7/cdfA2Ij2FVZx4jO4enuGd5
         vMxMHTPLi938TlJZi/xV8H4FiQhAovKlDG/ehaegdhaEysQHk+vpKl/JijOkvgJhYwnW
         vorVecK8naTmKXtMvyh6VuDwoY2Y2mJRQxPC49arPWGW9Aimgym+wRbykkAOBa6OL4iq
         HfqgHaZJRAy0gCFLPImcnsMmTD51gJoG1L4A2VLGj6myaLgIDmo96Gjg4MZyzOgRA0e6
         6EAg==
X-Gm-Message-State: AOJu0Yzoo52efcMDliP0uKjEEZBgHNx4hWUJqX/2cDMtTY3RqM6FgSgy
	hdsa2i+4J8z+cXAq0KUSotsvP7E12K/bqyEbiR8V2KuGHEm7fvOtRl1vcbxMekiiFk7dbVaEqvR
	l7o8lD1gyJxbabVoxkg==
X-Google-Smtp-Source: AGHT+IE5X6foiyj82qBhHJXL07/+UW7C/YRARnJPnO7KBNZHnH9XXa+3JQ49GJd08zEmXwFCtKt/QpVFtp6UHkY=
X-Received: from wrpt13.prod.google.com ([2002:adf:f60d:0:b0:3a4:ed10:1aa4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2511:b0:3a4:d0fe:429f with SMTP id ffacd0b85a97d-3a53178688bmr13822736f8f.14.1749551528502;
 Tue, 10 Jun 2025 03:32:08 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:31:56 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJsJSGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0MD3bLUZN2U1LTE0pwSXZMkg2RTk8TElNSkZCWgjoKi1LTMCrBp0bG 1tQADsPZGXQAAAA==
X-Change-Id: 20250610-vec-default-4b0c54aadebc
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MoQQVvQxFdG/8raL3pZU+XN7tPsl6Nf3fXBxf99VlCk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoSAmfTIYos3bwmKoRvyzXbhVB/IJKwSlpo9GSZ
 ODU9I50oeiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaEgJnwAKCRAEWL7uWMY5
 Rlm4EACacLUFsmr1AwCr1DMl628TGjBrnhwNnB7SPuL6Coz8OSgR6XtK/qNMwZOq0rkiye+RthT
 UTKyCuQPWedK5HToe7QuiAWN+NshnOdy2YRH/C0d0Vg0AKcKZpgs/gWD8chn/m4p9up7AJYXu+K
 LcWaONz2AL8yiwsinRa2Li2yXbOINE/BbfgUDQDbltdZbVlBO5pGekhy8bhvrAANBEyX/eSeELv
 wz09nUiCtpjKD+abFYTwhy9SvYEwedEygoZhnygPucdXSgmP0JdsQWwfw/7ISnka6P4W/YCprHN
 OuHZmkEBeW4To5TacxfNVMKwxOcZqef0TPaA9xnXCGO5zy1HlI5El8zUO8ujr/JOB96AVvLw6yx
 ecOq4LTPxD/zoWrh9go9n2WmULcMaYJM1dHA8lju3+AtCRPt49GdjfdZLQUow15SKf7N5jS04yI
 XDH0HWFs7Rsy3mOjivKpNRBNk669d/yS9i5cBI1pnYr8t35u4RtM/hVbHmWfV5FL6Pgh5ixHPMt
 2eLk/C27pYxlZLRB9dRlfibyBdoARuAqpFZAapyeH+4wIlLbiGPTF3vAMjZpq4m8xo4ginrTfJ4
 ZU6Wf4CAZt3j87uaam7zSxXkU0JblS7rbuQI3rN7M6EYHpcxSNNnOCeo87vMExow/SeY4hmeBFX KDjcL0vy94Pluqg==
X-Mailer: b4 0.14.2
Message-ID: <20250610-vec-default-v1-1-7bb2c97d75a0@google.com>
Subject: [PATCH] rust: vec: impl Default for Vec with any allocator
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The implementation of Default is restricted to only work with kmalloc
vectors for no good reason. This means I have to use

	mem::replace(&mut my_vec, KVVec::new())

in Rust Binder instead of `mem::take(&mut my_vec)`. Thus, expand the
impl of Default to work with any allocator including kvmalloc.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..606616fc0e592f87264bf905c88ef44e19739c0e 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -851,7 +851,7 @@ fn drop(&mut self) {
     }
 }
 
-impl<T> Default for KVec<T> {
+impl<T, A: Allocator> Default for Vec<T, A> {
     #[inline]
     fn default() -> Self {
         Self::new()

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-vec-default-4b0c54aadebc

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

