Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92074246BDD
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561727; cv=none; b=r7v+LmoPs8jeUQLW49zHxT8O4r3fvf4jZ7QFn9HbS2wra+LT5wFG/HUDwm6kGDVkpMDohdNaAbc9l7Rykd0MwxnK+oJcrMLd7UJ45ugFtIaOjxN9jOMB3Q5A3N5du4jbJ3nNSV4rUxdYSJR8jIvAUDNUUEXri8Aco4XAu3fg36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561727; c=relaxed/simple;
	bh=ZbpgeYrVuAYbhNHnQFhuKH95YnD9yc07elTjyZVn4yI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=b2vp8WvVuScgCM24ei/zTvZbKEyHtmqIyORRmjRxeV2jlXiwjlNhCGwJKXjoZIvBEucWv26vuWEOV4fjk28N0Tfw6lLPD1htLHbAZ9N7yqfLS2cg5rUeNpUXtpNIk77zW3D8DzYb3+fka/w8CvjhBkfOrREf1Y2m52bnijMlOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRrEY2rP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRrEY2rP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74267c68c11so4306678b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561725; x=1750166525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5evA1zkRlXvY4KWokBRtcOOniHWMY26cBM07CIpPNKA=;
        b=eRrEY2rPgLLHxaN+MWbAJY099E6AumbVvrdWUPUM+F5sLPmHXGWyX1G+degkqmD/WC
         oVuszPsKqQniZrk2GrUV5ZydK4UWxv1HjfUvTZNCVRcKwSLUgDho5EdfhvjYCZHUBCI4
         QWytu5WJQS/GfOnyyvntIlgxHwvYX8+tWc9y3SEXliwCD20+kxCbCVj5eR8fZgSpa8QO
         axZ+/pFxIPs2f0MoNy+AVGCUrNlm/gleuiVv4f3REbVE1GB54cL8vbDAblxErAZGqFXJ
         6hrZvtqsvnjYrsAYpQpjLNcchfyOIJ0iQ6c9jUJNpZ2v4vtjr7O29VuKtH6TF9xv4OdG
         JF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561725; x=1750166525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5evA1zkRlXvY4KWokBRtcOOniHWMY26cBM07CIpPNKA=;
        b=uUCPChDpgd0+mHDnEj6iOONSiQhSJVous6oRCvYtINZGA7/su5GS0L6ESkvlqY/OxV
         odY612xRTAScEHYFbfwP8z9s5GWXGVbIMIX+GXvIflOeadZtJnSihw9JJKCiiceGRKyZ
         3+aTfK4qycdIaM11rytz5ezUxkQUWSWShJK1syM/S6sUWBRKYt8nHqpwl0CVcBFZ/Ttn
         h+f8V5qCbFjQkJyzoswY8Cjgh8PmgppJ5bsD/6tvzqg4UM3EB+PHXPKZYq7/QpfWWqX7
         1hd9qSy5/NiFTos77f4V9kiNXNG+gmR6mOLmTeIVfCDXVqKEEgRGwINM3iSVP6rY6v0c
         S/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpntw1KmDQcJ/62dbhd87lWHXgI60VnnUGS1oQ6/kGawGodJ9saSVTYkdos1H0GdFK48mLUcxcuNxWSQeesw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxhj5+WagtfBD3SBT6CHlUVhUYoOl3YMijTEdyq2jjv8EceMd
	iot8KWWkEfCjn2w7vqh/pA3c55+mUr8FGK//xfXljRGTBPKG9wVRcbt0b5RLU6lvqJw=
X-Gm-Gg: ASbGncuUpViNlfjiNve9Q+KWQS4QnnGc0aYESziO0r1Fqwz/IV1bPYbPVKj6h8vkvaH
	npkkS5LwcdYFT2AVc7ZzquV5E3R56HjMrPFIbNxHlP1vRLLXuuPyeDKhFImDzJ57YgA/fX6BJhL
	Hryj/CtAs5Wkfb7uFVUT8lwyVwvcXq0nZWSD3DpFHLPMGS3KO3kqBJR8VPu/a8EUI9iwPh51SGV
	DiRZdg8gjjAUkBVwhaeXa+8AGGjo93dX1I7ZgVB4Lw+0y7o3dogBj//HQGEpTcEjoEowhvMhfTg
	L5h7A/Zk890DHrF0I4NaOGgysnD4XCag9c4gsPcAn2GqJpqDV2KJsipWV/C2ps4=
X-Google-Smtp-Source: AGHT+IF0pxGC5ku+v34hFKnUOuTECTUe2ClpZ+fIK73rQMcI3yEkP2695ZO26uA1FjEKIfmzHL7xdg==
X-Received: by 2002:a05:6a00:4390:b0:740:a52f:a126 with SMTP id d2e1a72fcca58-74827e8060dmr20474817b3a.9.1749561724752;
        Tue, 10 Jun 2025 06:22:04 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea430sm7366201b3a.150.2025.06.10.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:22:04 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 0/3] rust: Introduce CpuId and fix cpumask doctest
Date: Tue, 10 Jun 2025 18:51:55 +0530
Message-Id: <cover.1749554685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Here is another attempt at fixing the cpumask doctest. This series creates a new
abstraction `CpuId`, which is used to write a cleaner cpumask example which
doesn't fail in those corner cases.

Rebased over v6.16-rc1 + [1].

V2->V3:
- Include the separately sent patch as 3/3 and clarify about `unstable` CpuId.
- Add few debug_assert!().
- Improved comments, commit log.

V1->V2:
- Introduce CpuId.
- Use CpuId in cpufreq, opp, cpumask abstractions.
- Fix cpumask example.

--
Viresh

[1] https://lore.kernel.org/all/4823a58093c6dfa20df62b5c18da613621b9716e.1749554599.git.viresh.kumar@linaro.org/

Viresh Kumar (3):
  rust: cpu: Introduce CpuId abstraction
  rust: Use CpuId in place of raw CPU numbers
  rust: cpu: Add CpuId::current() to retrieve current CPU ID

 MAINTAINERS                    |   1 +
 drivers/cpufreq/rcpufreq_dt.rs |   4 +-
 rust/helpers/cpu.c             |   8 +++
 rust/helpers/helpers.c         |   1 +
 rust/kernel/cpu.rs             | 124 ++++++++++++++++++++++++++++++++-
 rust/kernel/cpufreq.rs         |  27 ++++---
 rust/kernel/cpumask.rs         |  51 ++++++++++----
 7 files changed, 189 insertions(+), 27 deletions(-)
 create mode 100644 rust/helpers/cpu.c


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: 1917103231ee798c4217f6da8bafa603b00e554c
-- 
2.31.1.272.g89b43f80a514

