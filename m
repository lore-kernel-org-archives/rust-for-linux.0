Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EBA22F389
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725091; cv=none; b=AtwfHgqu50wQDrSFOMfJaIc7rtSptsNa8U4hYXK4wg+UCijf7og/PB+ojXQTuQm71qFxCoKzuSQrFZBAljOLrXNqRErMMkiOJreAg1zhX6q0QuNndJIlEr+IAbI51UGiJ/W78MiL/5Mpmn1JQiVe8LdojTqIP6r1uAf5WD8XfUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725091; c=relaxed/simple;
	bh=vipvqWY/c47GVY2ecLz3MC532b9GPpeAVV+aqHCbxZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxtRajZQnege8qD2SeyCFCt8qLR0JNJccvDDYlHmJ4DRKPxTX4r1cAPfnX0FtLd8C0pLwCvQ6/fLa8RGUSXjW3I69GEk+UoZGqHGalKJto/xfjPzIt11Nf9gM2WwlUQhGizAhB2g6zljhrfjx/aNU6WE+SeyAVEIAq+T5VTwkvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qekT6s2u; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qekT6s2u"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235a3dd4f0dso5312655ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749725089; x=1750329889; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d647YjF3bYSyN8nr4z9fJNlObTSg64SSy5tUR37XPGc=;
        b=qekT6s2u/fv0z1x9Ag8WF+qWT+u9bWM8XwYOLPjkoE8+d5nCu33njCeJQZD8OmflC4
         mIi/sxfNaUt+ZYtnPPNClv/032fbTO0BVFFF0paaj1Azk4qFq+YDA5s21w8kJE2BqVvs
         aD4WgkAEpDhHFuzK0HERPtLX1t7lipKXPRkzBFvw397EA2OTRwtitLvRmL0iNDC+Q+WI
         mlhNBclmVGcSpnqfCGoFjRQRkYIyoQ3bctSXG/PPqSo71J9RSGVI66iuQCYs6hJB/iWg
         Aho1hZIOgtd7EqSgnhjiVVQl1BMiq2cLEjianx/vXHPDJKINOIST60NZIDrQoOZy08cN
         9GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725089; x=1750329889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d647YjF3bYSyN8nr4z9fJNlObTSg64SSy5tUR37XPGc=;
        b=VYKBQWOrGXluzzJNjyhHEzNj6tQrM7RNdHtJWRHCiM9JuXbAW5tcG1DHugnu72IREA
         n2uOnjBj0Q3C6UKJuvnF5lVdJ/sFNExWavMNWWIAvV5dOZYDQnr6O+RzVxtZdCgQBZ+I
         OZjcSxxYIc+PxCd1NsZrkU8fLuY/A1k1PJkJCK46LnIX7qUdWlXsznLvVe/x0cAyJu5n
         2twrkY8zpTMceA08mN/eQLcbTzxU442xi2tpjj7AqZYSzXBIKZrkNNjvv7XVUByvabwk
         +TMPfXzqsVqDZdBCOd9xKmLXGz+CcDy1k+3hDZY8tqZcmLJko8QWtVNi1b6sQgNj57sZ
         k6wA==
X-Forwarded-Encrypted: i=1; AJvYcCXg3VbRe6JAvXGRYjXaoqROL+Hpjp7SArZHR8oaEeCHche/nDXrbpFF7fF+vWRTCqfl1e+Jv5QhCekC/gzZsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmd45YkS9AkiLFU0WR71Teet61D5SGrRM6MH9Kv8uGs+upkjC
	FWkqJqS5rGhpgIyaSVSU5VpjFaJMGTKtDuz9G3QxQCXuHNYSgFxq28jAUbROkcyOq3g6e4W9nPN
	IO/ju
X-Gm-Gg: ASbGncsgVvrxfPJL7+wKBXg13x3xM+Wcmsyvo4TOW2huuwAM1at3nLR4NdtIRjZy1h9
	j0SqvJ/AYuV6aEZPj7G0IcF9GhTIai6P4Z1byrncr4170JZfbVXcdyAQlph7WoAwQHNgs6VVF4K
	2vYirqYxBwdbyO5h5Q29O5/vdTHa7/U/XSOorGffCKuYzsiFnyv0T82ZrB+qsVLkjU50jiZfFbJ
	woDXp4/qgSXVh0+prERvUjGlM0AZ6acn+CsqvmXR7Ou3vB+dHQyy4rHMLKWGGQu+V5JQ3jpfmIg
	RDa1WLdGjcIwYt3SZdEsy5liAgTKugnN4TaYPMhUj6aXakrek6wLiF0l11aw5/X1RW+ehA6DLg=
	=
X-Google-Smtp-Source: AGHT+IF/vOYjRTfyGOGArqX+efBue3d71exYYLP/krSi/aUTaqZSdIzBKprHd9c512ba/0k/qNTIjA==
X-Received: by 2002:a17:902:e74e:b0:234:8ec1:4af6 with SMTP id d9443c01a7336-23641b3291amr94548145ad.45.1749725089252;
        Thu, 12 Jun 2025 03:44:49 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611e32dsm1060210a12.9.2025.06.12.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 03:44:48 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:14:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, rust-for-linux@vger.kernel.org
Subject: [GIT PULL] cpufreq/arm fixes for 6.16-rc
Message-ID: <20250612104446.hhwn24f3nkasyefa@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rafael,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git tags/cpufreq-arm-fixes-6.16-rc

for you to fetch changes up to c7f005f70d22cd5613cac30bf6d34867189e36a9:

  rust: cpu: Add CpuId::current() to retrieve current CPU ID (2025-06-12 10:31:28 +0530)

----------------------------------------------------------------
CPUFreq fixes for 6.16-rc

- Implement CpuId rust abstraction and use it to fix doctest failure
  (Viresh Kumar).
- Minor cleanups in the `# Safety` sections for cpufreq abstractions
  (Viresh Kumar).

----------------------------------------------------------------
Viresh Kumar (4):
      cpufreq: Convert `/// SAFETY` lines to `# Safety` sections
      rust: cpu: Introduce CpuId abstraction
      rust: Use CpuId in place of raw CPU numbers
      rust: cpu: Add CpuId::current() to retrieve current CPU ID

 MAINTAINERS                    |   1 +
 drivers/cpufreq/rcpufreq_dt.rs |   4 ++--
 rust/helpers/cpu.c             |   8 +++++++
 rust/helpers/helpers.c         |   1 +
 rust/kernel/cpu.rs             | 125 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 rust/kernel/cpufreq.rs         | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------
 rust/kernel/cpumask.rs         |  51 ++++++++++++++++++++++++++++------------
 7 files changed, 299 insertions(+), 64 deletions(-)
 create mode 100644 rust/helpers/cpu.c

-- 
viresh
