Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ABD4E73C3
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612545; cv=none; b=dUsQHNnqJs/5MlR6CR5Kfze+/D3AomagnA8ZD0uknH/ksaDII7xLwzLJX8y2iOZUHzSvOvT8uqYqsfpE8w9XYWuiVCSfKaPhp44Ms/hhDYBKo0kxSTw0PagwHisZabFrtqASi4g/+EZC0xV0QAhnybiWKbJ+lR2euK6nM0HgOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612545; c=relaxed/simple;
	bh=T0BVWlH+xvCgpGrbu8nNWISjsWHXibM8xFq2to97JoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6I4w/dELRGocy9a10Cr42GoS/DTloiTlWw7QsPdGpjYezHd6Jgsav8qZljBZUUEchYOiwouzBDSW8GavCpClBcrJWzEjI7wZHPsOH0E9jRMGWpYl1cvyyoNZLoLCtDrfTC2sxx560FQ03iUzUEJiLmifcIFXg9esXiNKhExIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXBNNdrP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXBNNdrP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso24322205e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612542; x=1791217342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnCeuLGKaQE+iBUrLvw9M2eMKqv09/kl1t4RvltPK10=;
        b=eXBNNdrPIkTnwGz1WO2x3siSqzZk9NZTx99SD69BsgT5Wkoy0YZh2VInAruhjkYpXa
         ENYXaD2rYB/sSFVWSOwAk8zocTYvKu+cWGFq0Qw/ZhrWwSgU0pr+EmZD4Du6ps0BeOxJ
         xyn2eJi/0yslacFl4ibW0XxdB0e7nRVBdGuGQ+UeJEe1mDJfF+gvtGofBaCbren184BI
         1XgWBfNJCNdYI9QeapMEChSthDFCH/kd2YBn2r1YQla14ypMFLwqNzCNZkAXbcnCdZr9
         FgUn980OojVDTMtFM7N/rAsuYTBQGZErkgXmkOzCybLDzwUfBXzQqb4u/725l0A+w7IL
         XQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612542; x=1791217342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnCeuLGKaQE+iBUrLvw9M2eMKqv09/kl1t4RvltPK10=;
        b=BPffx8hKAZkxMnBzCgosdC4PE32KNQ8MPOmhvFvL34T79dlMVdqnwIu6MUFmO5+AUZ
         ASXbVqoCDOjNBB3pchViQrQ/+VadNOX9wU8+qprd7UFx8K2XPM5sWcLLPCkUVdH7hZpO
         npU8boJOwvx8o+RHrXw4CMkPgkwnzg+MLtconlhAxopLCNvMUlR6EILgXPnB2Qwbh7DP
         OlHKcpDpVkpSqQjTQtnMG/tcI2peG9ljmAVvdzEsOSXNk2GdSJIU9tCCBGhr86MtazBD
         0aKhQ5US0vN+Q9pbS5tcBmEtHxGPh7GnpbH2ObLGkrBrrxPSnWQuHduXHMRZMBLEYDmn
         enzw==
X-Forwarded-Encrypted: i=1; AKwUvBw7evPJQT5KuSmIUp/qbaGsXX7vdkhhnMlD+Me7VoPFgj77vueJU9ndTC1ajrFEQ0+f3Urq6QKmQ45RjtitvQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kJiKbbsFiEEU4jhXwqqKdie/OUWmrwNXXyN9m6X+cHBSvx8iB5
	zRY9xqtTSd5DBgMq81/yM8B7bVljlV7FYqv66nKdIH/1fm92E0tfCD7Q
X-Gm-Gg: AYBFou2HPEuPXyD6330hS7SV6CjYbuxA4J6H+UdYAVUonVUlLxFCqCZds7Yt+Kgz9IR
	KA6YYc+W64prFcoheX1pxCjAiyPhnQFcYUsS6Yy31fwNuKTJp6gFT90dYXS3Ly47pPc7qHPIliU
	NOktEsCNslEOdC3C5tPMHot0DelCxRII2rn5cANkOG8sam3TkFOmBt18RdXwnvXaf2gLN+7kKgQ
	+oHt0qcio4R7fWnUxunNCF1AhNFoh+T2PyemoRJ/asQIk0dw7JmCRhRjZzTicllm0wQC6/U9wdP
	vwGEKbrQuy/JEQksKf8KfQWUVloFD5LyFKPBMcDjpjLjuvNMdUS4GRoU4pDnGZfOko6FF7EY02y
	MCtMdGxQH5K+XffALxbUTbysEFg+gjHCmxz6mUOtKQzU9ep2x3NpnXffZ3R+9sCW2S8RKwfjsDT
	iDd3rFVcf0bztI3B6QbiY4AGUCPOcVjbQgMNe/yyFQJfcV66ZxoQDrOwDYW6G0jOkMwxbbwTSrn
	P8vOAO55NV0Ebxo19pJifZ1nuo+qPWqj8Vz0flwN8rcp4wsRns=
X-Received: by 2002:a05:600c:348a:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-49fe7bbaf83mr222889565e9.23.1790612541529;
        Mon, 28 Sep 2026 09:22:21 -0700 (PDT)
Received: from sp1der-OptiPlex-7080.epfl.ch (dhcp-122-dist-b-107.epfl.ch. [128.178.122.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm3372535e9.7.2026.09.28.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:22:20 -0700 (PDT)
From: spidermana <xuyiwen14@gmail.com>
To: mehmet.mkoseoglu@gmail.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rafael@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	work@onurozkan.dev
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Mon, 28 Sep 2026 18:22:14 +0200
Message-ID: <20260928162214.487564-1-xuyiwen14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
References: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 29 Aug 2026 19:10:13 +0300, Mehmet Koseoglu wrote:
> cpufreq_cpu_get() returns either a referenced policy or NULL.
> PolicyCpu::from_cpu() passed its return value to from_err_ptr(), which
> rejects ERR_PTR values but accepts NULL.
[...]
>          Ok(Self(
>              // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
>              // the returned reference.
> -            unsafe { Policy::from_raw_mut(ptr) },
> +            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },

Just a quick nit here, maybe rephrase this SAFETY comment, e.g.:

            // SAFETY: `ptr` is non-NULL and `cpufreq_cpu_get()` took a reference on it, so it is
            // valid for writing and remains valid for the lifetime of the returned reference.

Either way, looks good to me.
FWIW, I hit this too and have a reproducer [1].
[1] https://github.com/Rust-for-Linux/linux/issues/1258

Reviewed-by: Elowen Xu <malanalyzing@gmail.com>
