Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222BD519DFE
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683322; cv=none; b=Ubc3qdJyniSKa3U+yvUjkU+qSNJQOiRK+nEppWs3KLYbcdHNJz2l5MhTrIC1yT2KHLp/cfDPQtES+KybGTgBiDvVzvyoBvDm6cvHVEJcL4I3O0YRvES4kr1P6cKLWmviDwQNO7ckXZeSN7j7M0rT7OsLhn3jHcM27FNGRO+dvF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683322; c=relaxed/simple;
	bh=s/9mIv0ITmLyiV+de3wxWxqlQ70bDYMET12ZAhr5hHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+Pfss1NF2AlJai+7mzVWEDdjPD8ZeUQ1rUH5upY0uhVq0GLGju4IF+d+ibmLpzbplJYnEnI8WvXyGl4gKjtQfuP0tPDwNNV4sNDvqX/Qbs+2Tb2sWcgtR1jVPouSwboj9wpRW7i0+StnAii4PAZ+xueXtJyAF38YPQl+4xxVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0kRhE2H; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0kRhE2H"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5333a59e20cso19899261cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683320; x=1791288120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/9mIv0ITmLyiV+de3wxWxqlQ70bDYMET12ZAhr5hHQ=;
        b=E0kRhE2HYf4cefoX2coDNb9pNEz4X+1qny6a3a3a4QL2v45OWKQM64gDMhhBvA4OFS
         lnzYHPXDT9axMYa5rDS76uTYu2LfT1nwbLjp2lJsQbpsj6vug6b2HKFlEBofgfWn4R4N
         UzcrtPuXY8Rcdu3HAQhUlNGcaBlwGKixfAo+s2sQPyhywsk7ZCntgS0vhAbooMe0gKVb
         uytMg5rC7xTnnOtNn8fGbi+RgzECfj/JsQT001TuOkZQ0Xrw4456yXMZ4f4Q4GqucwVd
         +/TuJQCWm3nzSJV0HJ+iaetLt8DIivuXz+PAsCr6SNpWvaiLQdhKnqRThNy/0k2K2zSS
         Rrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683320; x=1791288120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/9mIv0ITmLyiV+de3wxWxqlQ70bDYMET12ZAhr5hHQ=;
        b=hjoYHXoiBVr8XZ7ASAJGi1xyatUSZM5agKXIo/zJZqusIGcYYyOV52f85zFjWRPpB4
         Sgcs97MyQmrWDCL58wh0NXzQoE7Xm20KPJfxFkYJmnppls/KAr2XG8RTHWRVNNbxa9Aw
         xF5/0gzxIDQ5Gx1V4s43sRz59G513+P7DQCwEWd2q9OFTUzZmLzWC7NPbdDngP/iWg6l
         g4Q+itFP2wLFIUlVjKm1yG03Pa+2yXtUO3PV6Oz2esK6YDA0uvs4ff9XxsWtxBrlvunj
         kBe+Vpiqt5yivsPXlq+liKLYg6mn4BHztTYUM7iNvFmxjoA6RoKNgrnPFlANG0nhyfc8
         95dA==
X-Forwarded-Encrypted: i=1; AKwUvBzAVpbN/FMZhdOPqS5r/DGx1OLk4MjChRZz2zfegG5CdGtkMCM9lNR7to2KG+HSyZPFuiGO6bxd/MgELaSszw==@vger.kernel.org
X-Gm-Message-State: AFuF++kUXevpB21D/rIJrRbstXosZnm07EBFiSwppYzaDRshqDSv2oxO
	2YH6Ava4Cakuu6ZawdlvQXHkQHxRy7XYN57KOkiD2PISTU+cEJVMUjMY
X-Gm-Gg: AYBFou0aqTDBFmFtkRm7EiyUeue1yDYCjhumt9pjvyai1R87toZgpPW6Nx7lq97r4qD
	7PuraK4pBziP6H5vyGQD4zNkoBSVd86G2juX/6o4vrM/ipsQhwL4nk5JRlqyWaXCT1lFDIMUzNy
	PvIqZDKSdnEUfEAb5rIdDyCfT199hmvEuAN96dAVOSade55t+i2zbpOx3pSMF1Qd5WkEQf70O8a
	g7YLq9VTZ51OUxnfMsnHguzehkRE3EOdmrHKXC1A/vqdhNobA7icPaBbj7jNkQOH7FuTWLwQpnL
	VGgGBNN1BNTEGgoJPgLkyfHvuRDOl0VDUf/OOSmYVYRt3coAMK/V2LPhig28UeJ+LBEdBG/ltaF
	8Pj1n74TD5AegIoIQRnIH6TFNqGsPVC0L9dpXimWMZ4zxlidz3e8t7o6hKyn5IPq+DveMxk+K0S
	sca3fNOz9ZFnFxlwlZg7IKdDS1oNVluPMv27usBUv4CLKB2jOwi0DkEfXr7yJYwgOavUJppg==
X-Received: by 2002:a05:620a:4111:b0:939:13a7:70f0 with SMTP id af79cd13be357-93c43b7f202mr2660453085a.5.1790683319438;
        Tue, 29 Sep 2026 05:01:59 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c81425bf8sm374586985a.28.2026.09.29.05.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:59 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: chenhan0017.work@gmail.com
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
Date: Tue, 29 Sep 2026 08:01:55 -0400
Message-ID: <20260929120155.2283113-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for working on this.

Could you please also add:

Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

to the commit message?
