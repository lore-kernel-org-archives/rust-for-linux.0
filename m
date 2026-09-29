Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257E3515DE
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675747; cv=none; b=WmkPSBxWjjCCaZNuNo+nWsRTo46dSO2gH+5EyHdsZIcyqC+zF6cQrBH9MfCyjgvMI0ZiiuErq2GcsQYPMq7SuEdkGAgZQgwW68j3s3Cvk/rOxu0T2MzZckbYHzRtreK/9fMdb2h4bBSRd/w9Vyl9cXYqzri/HboEevwqSHg7uSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675747; c=relaxed/simple;
	bh=07se/JviETlMYDRCO0tPeNRK6E3kx+s1WEeNG38MRU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQOUXy+o4RlhdpFTCX7hsSELLdl/Obkrz4Cjw82f5BqssaXplaDz32nbMtS1iPIXtp39Q36wkySnJqjNFWAF4RaiX+Ane1HlFLo6HoBzpDaHZdhXOpkOIKK7w90I/jIT9Zhub93fMkfhv6JJA+XLvP6ybHB4OcZh/KkN9vmbCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouCN2Gqs; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouCN2Gqs"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso5199850a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675743; x=1791280543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07se/JviETlMYDRCO0tPeNRK6E3kx+s1WEeNG38MRU4=;
        b=ouCN2GqsTA7bAtO/V/w8geFI9GhJJ8LPSpsPkiKmWpCVYPSn0lHisUJrocuRTN2Ky4
         X+CD/k7qB7CZYVci82VyOomR8H9Xv5AESATOMuU0hq8x0HF28nBHPbnKFF7R2nzMFxUY
         j7oy3+wgvxPeKxNjJcniLjLT64Y8qy7d6KeuAKPwr5OvWh47Wmr+NSTooRvL5hGF2VFG
         qC7fuO6A2RnVZtX4/woJiOwF6wog3NRsPSA4cfCECDam6kPSFKux/LwIZMoKuqIbQoAI
         BB80lT541nYHE6eQKvWprNB6V0z27ONvGtwMrqtRMAK5HTG8FharwBpkkYjcQUlbZ5l7
         ZvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675743; x=1791280543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07se/JviETlMYDRCO0tPeNRK6E3kx+s1WEeNG38MRU4=;
        b=gcPDMt+Yt5hoYXPf6KxWcYidydLnqIU9FVPq3aZDAkylsVeK0VRT4wYAWN00j7Kvtn
         K1pz94pCH9kypnUVySyjIVQRJ7MfnSer0//yKSvf+gWtdEcqWdIqAWh1CyWU3tzbrFU1
         llvOUK550dkTO5BqLOf1ADyEAgflsQxKHcVlhxkpJz9QHgF0rZHANdufS28tUBLaVqqU
         uGA4vrppjBPQZAVficHi2+EBFbA3hzXj1G65T2x59fCS/0xVTwYO+t5ovjk+kP0qIGiB
         N3QY9yDq/MEdjBxhAAQowmkgbg8pdKHsefVASa4/I4r2t3ytBWiR6j4xlJTh+GYkF9gF
         yUlg==
X-Forwarded-Encrypted: i=1; AKwUvByzjW2o+xxW38DNuCM+nBTMJZGERuiJw3BVN+3zt1Oq6gdCKyI2/i8WIkmo9dQeFdVSAY6IUd8EN/WzTcmpwg==@vger.kernel.org
X-Gm-Message-State: AFuF++nDEXfeUATx+mJ9jYeVARhoUBx1tISDZjG8X5y7ntJN/1oAksga
	NLhiEwNehNl1S+1QdzxfN/uzW2f1Vbp2iEOLD/emsbqf14z6k2r0CR88
X-Gm-Gg: AYBFou2ZzGoLUjQ3vxxVfSXtKptz9PlcWdoJkogT5ahodYFlXmlDYrTwlA4uNmydBDI
	80dWH7llRfz6IwZBeG5WVIuduQQ9pUsWhmdE4mVd2m6uaN8nr3ptuxNT06cXV1998s1WzVmd0sK
	YlRlRDQRfBKccYcB+RcYg4FNY+ZbpYHyLIaj/ddzboBx7COp/MIu+CwLM6rz2vbaK5Yzuo1HMcr
	s1dAM3cp16Tn9r1sVv31j7HNiq/QKPGMBIRoWVaT00RX2Szli/pcKeIHkTfjSxYxnvzQiMGu/eE
	m4P4Ut/2e8rU7rWAZHqUgcLuN7Llt+FcMOhmTfOTh0QofzYSG8aWfHmHq9Z7wXrK/BqeR/oweie
	t4qhDZPscd8LNcXl9vQee7TxedXGkpDk8oeU+3Q2XNX5QeATtw68n3Y9kDH7rsJd3Rr5xXOFluJ
	rAe4/R3Sf/xObLAH/IACVPb+c6FzepKTZ5itt4P3wgQuz62n3jB6czxkPv2C2C2L6RlBz7anSwQ
	sPMDeBqkA9tQ5yXNCq/gmgKW7BIUrh2OTBadcqe4PoQUlz1Wm0=
X-Received: by 2002:a17:907:1c89:b0:c29:65ef:b907 with SMTP id a640c23a62f3a-c2ac24bcbe6mr1252123466b.26.1790675743155;
        Tue, 29 Sep 2026 02:55:43 -0700 (PDT)
Received: from sp1der-OptiPlex-7080.epfl.ch (dhcp-122-dist-b-107.epfl.ch. [128.178.122.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd1153f09sm323000566b.15.2026.09.29.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:55:41 -0700 (PDT)
From: spidermana <xuyiwen14@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
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
	mehmet.mkoseoglu@gmail.com,
	ojeda@kernel.org,
	rafael@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	work@onurozkan.dev,
	xuyiwen14@gmail.com
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Tue, 29 Sep 2026 11:55:39 +0200
Message-ID: <20260929095539.1398671-1-xuyiwen14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
References: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 19:17:08 +0200, Miguel Ojeda wrote:
> The From: doesn't seem to match the email of the tag, is that intended?

Oops, no, thanks for noticing! Please disregard the tag in my
previous reply. the correct one is:

Reviewed-by: spidermana <xuyiwen14@gmail.com>
