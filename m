Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96E51815D
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667004; cv=none; b=tD5ztBMfHKc5I5IKHbfOVhOD/bAUjjmzZLZMBinE+JoPncRLVJlJZVbtGMjDG/6dZLvXauUSgl8P7nl/XFjmg43BJiM1ehyQLgUENttSA6YKYZfymaSX3qGfj4nbwBv8GE4t7yJzqPJ8tGC3RoVWw1txdpyjkUj1VE2qs62EBjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667004; c=relaxed/simple;
	bh=444jU8uxONFDfWRTdInIMtXV5eo1AbdDgMSf0Q+N+2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fp2CMuHjPzbcnilV2SbT0iy2QbQ8of2NIl3tjzi9gfmVNQCDzl47V4nqchPNWI/8vefPQv4IzIiOC1vcf0o45A2P/ZIoL7DzIRf87lX2nWYrkRtu2oGh3SenqKimi6QNm1l3tomEka+74bfD1EJgrk+OFIxjB4P7SxIlzrA9wUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=I2TP1KkU; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="I2TP1KkU"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso936406a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1789667002; x=1790271802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5eExaHbJZnwQdAGroZ7wxeNna2+m+5wmicEcqAFsiQ=;
        b=I2TP1KkUaEkPqnFuU+N/gVG0S5Xtco+Fu2eiHIkAm4mfRZ0mVfdcqUDHhCBrhC4uAF
         N4d7pqh0phcqHIVJdm6wcdSbb6hfens1BlJQ5ResM7k6kgt+6Cjh/sJ67hJWl2tpwLYL
         Ku3WRWEHvdKRgtfFD5KwRaq+u9+PkmGIDny05fkkaAL4Zlktiz3Tbqc2q425VfEKWpj+
         webQL9eyPY351F+foQhEF+FWl5mD4O9wOED5WqCLhfLLUrMG1JCGF/D6dko7fHlYfaOw
         nb4qKSAb1MjMPgCYQpmJn37M8Vp79N8gtjAcxwClxRaOY/JSrUBc86CVa9vwRX6XbDSt
         QnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667002; x=1790271802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5eExaHbJZnwQdAGroZ7wxeNna2+m+5wmicEcqAFsiQ=;
        b=mUzn9seeJsy320Y+JcBM+2lIifS4njKnUV7VhEyzI6+w3QjlYROm0yGb/tZlWAQMrQ
         ZYjByXQO0CpllWZMJjmC5EkVg+oyjxgPPC105djklGVE7URAgQPo7mTJx/iDkFc4hhzQ
         ZYufu1zix+R8jrTKx3VZ7KbXq4w11o9o3sTE4BOKgTAm0N2uAyX0wOJZNfHYg51jzGbm
         ZdvC3XxDo4464jIGFXzLUGIYjEda3ATbC7y+yMNzEmEg9u/OeIW242fMosyBng70feIM
         d3weIDnG8LEflJIADUUKrx2rXAK5iOa8j5ITIXCF/HPuz426v+laeKxRotbaHR1St6Sf
         c4GA==
X-Forwarded-Encrypted: i=1; AKwUvBwSJlBzNwwnItdTQfCe7kRYL3q6Eg/4tKcfR2NJipN/MktQinfNcVhT5Dz0juO93Zqn7TMDvQtS6jHqjnj7Og==@vger.kernel.org
X-Gm-Message-State: AFuF++nNhGtIEZTm+KM1mSOwRpMSVHmDVROGGrojdUetnb4rU5sCzalj
	E/9DQtTs3nKTmf3ZlpT7vSHuUvngY1pwgDjWHrCB9A3erAYPAeyjf5X2+kWVqvnBlbE=
X-Gm-Gg: AYBFou3RCIlsX1nvAfVhtJdQVKh8uZ3gwLTyoTnjWqPrkM6gNwcNdkRu9hUh3qiQ4sP
	UqhWaZHErVDg9sGiWhNXUhsp1mL9geTDFdYwsPw50mOA9Wfh4VJNRM1e9Bbb8oRszS77vo09Q5i
	E3PECNZifD0Xko2tLvqueJpdoMvCLv46DNp9CEDnRsOybqo/mhf5WQbBV+8dTxFSt8fE25nv1RM
	sWka9NjgXUY/dPcCgDlQHjlGc4NsaL/uq/GzDY5CY9NQ7ZrzzWBc4mzy5zwcCfDgEFIYOtz0JOC
	8JTO0Cthya1Rw5VM3Grw8evgRI33v7iZjZ2qsfbv3W95qH4OgdcOp79uAh6QQBeIxghRom+D2v9
	IrXea34eim2CXncvN7hYspffOurdxEZ+oXymbAAa57Iwz1r88jNXaqSfAXhcWNDvKf9NEOOmnxF
	w5HNMwWRWcMH2KGaZqJbXwXH8WhD4S3kwfuBHK6bSlDPHiaWVDQvQOOSaQBpWeOwNq6uRukEmee
	NAD7kRKF9p5lnfWw2J4+vxp/lMAjRC5T3Cz
X-Received: by 2002:a05:6a20:9147:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3dd5f57c1bamr17309358637.18.1789667002542;
        Thu, 17 Sep 2026 10:43:22 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm19657730eec.14.2026.09.17.10.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:43:22 -0700 (PDT)
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
Subject: [PATCH 0/1] rust: module_param: Fix potentially incorrect access  of `SetOnce<T>`
Date: Thu, 17 Sep 2026 17:43:19 +0000
Message-Id: <cover.1789426258.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential 
unsound behavior in Rust code in the Linux kernel. The tool 
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports. 
FerroLens reported the following bug in rust/kernel/module_param.rs:

The `set_param` function casts `kernel_param.arg` to `*const SetOnce<T>`
But the Rust module macro in rust/macros/module.rs initializes `arg` with 
`#param_name.as_void_ptr()`, and `#param_name` is a `ModuleParamAccess<T>`,
not a `SetOnce<T>`.

ModuleParamAccess<T> has default Rust layout but `set_param` accesses its 
first field SetOnce<T> assuming it to be at offset 0. This is not 
guaranteed by Rust and if SetOnce<T> is not at offset 0 it could cause 
type confusion leading to data corruption.

In particular, if the kernel is built with a randomized layout 
(e.g with KRUSTFLAGS='-Zrandomize-layout=yes -Zlayout-seed=1'), 
the first field of `ModuleParamAccess<T>` may not be at offset 0. 
This leads to incorrect behavior when loading the rust_minimal module 
from samples.

$ sudo insmod samples/rust/rust_minimal.ko test_parameter=1 test_bool_parameter=false
insmod: ERROR: could not insert module samples/rust/rust_minimal.ko: File exists

[  854.638251] rust_minimal: `1' invalid for parameter `test_parameter'

Priya Bala Govindasamy (1):
  rust: module_param: Fix potentially incorrect layout for 
    `ModuleParamAccess<T>`

 rust/kernel/module_param.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

