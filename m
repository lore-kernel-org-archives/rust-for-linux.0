Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774CB3A451D;
	Sun, 27 Sep 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518695; cv=none; b=o+LkqpiXnwO524a/8UU4mP8kJ1DA1USR4kLd4HXcl+4IfbanTym9HOVSYJPg7z2IhiN3drFlRbOU0YQVyxtVo6SMlmRVvB66AsIW9w/t4yQGJOg1da0SYIvfSGxb0J6oRdxkb30ClL98mG6O85PFBjS9/z44N+wYTcaxViFbJ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518695; c=relaxed/simple;
	bh=L3GP6+UT3BYQyEKUEViblc+a28A8/r8iOPjiWkUPGBA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=s/8o8EUbs/l/1VR84qkSUgOYu1sFl4uMxnbJ4IrQU3SkkIrgPv6kW8kgFs+VP7IZxBBPhoq67LdtSJ6HS1M7vLjUkz1LCvTIJ+Yjsll63mvYYcEySclT9qVXzColp9GsF1YCmv+E5cnBzDJdM59hei8euSxNQGsRcNl6Z9Y/9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vofLGP48; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vofLGP48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790518684; bh=L3GP6+UT3BYQyEKUEViblc+a28A8/r8iOPjiWkUPGBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vofLGP48HkNGGaAq5KTGIY6l3Qa0ZLM7fNx3LGPtkGZQ3O33z2VtieuWOTEuAggQi
	 X/hY1W4kEb0E1y6dHJ8PHwJ2vNszaST5Mz1IdDbFHWGm5yu07gKTdVSx2QFdEJ3Dt8
	 4rAyIMnk7AtqkWs91dmEdpbz2dQBU5wKr/dvnYLo=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 480198F8; Sun, 27 Sep 2026 22:18:00 +0800
X-QQ-mid: xmsmtpt1790518680tqw0p2zpi
Message-ID: <tencent_3BE378F939A2D19F002A693282ABDDE7AA05@qq.com>
X-QQ-XMAILINFO: NUYPVyrd/y6Pqpr6bTcTRJGglHbZqqPUW7Uuwcm42p+asj7NmY06hBYPoWpE7z
	 u5ikh3xjmYjdBaVfR/OMWRrlURKO83oDppb03mIVKbS0K/qo5vz5sT3fdYUQM+hW5GWfHQFwgG2A
	 7LmuPb7fV+fAw0VxIJm9IGNhdMdLqh3nib+kybqEuC6//RPEEyYu0JMKByJOJwkDz6L1xD5EpZ+p
	 ZOoEiI2xi74Wh16cVzOAAK8BYgJGhZqvWRvO2UqzmsFLaNIhFSiO68DbyEuaA64ZABy2MFCJiWvT
	 NxnDACfVk98egbAFpNq5TfWOmF9BJGy4iSX7nLzEKuCLiE6abFgW6TNwu0ulMR/q3XvsvFX5WwBK
	 zNVX2nI163LtM1BfVoH2PsEhC6IPd4WHO3PR4s5276BND1cUP5DWad16DKXQANi0t67kFB1i0MbE
	 2iCC1NfZW5bUXRGpzkSm8ZQyerhxt/UHt5pYTJ3WjsgJwplwudfTRHAJ6zX+z3IJFW25nz615rzb
	 tPgSsCEbWZnnYynSn91oUKvehd4U0dkvSSBf5zP/8X8RHpkfVulmcEycfkocbQ+m/Ettij7zC6PU
	 OVTtbmKKUXyFx7g6gvA25K3nkQMGM/Mxx4iTG8q0uY8YxtoqA2u/OLE3CbeA8WOhZkgMZy5EUtuw
	 sxmhhj6dwNcWm8rZMgJh8EPs12q91S637jyfx5Oquyutg8N4vyJjZ379W+T2w93xZacUUbZaKjGU
	 KHccwLe9P8+UHqpYMwqbjZIXVxEiclD5EOIf+ealo05v8o/cHAbGt6TuLjTBsdUzrOHhi0stNdQ9
	 Uoe1nxjaUFXSdvV/HMiQm4+CIBg/HmpFR/e2+D3KwxeqatKyjy/dfWooXPi1TesPLNJgK647Sv8Q
	 8S4wVzzFZl4j9BAJ14aDOIeCOEnbsSZYQJHbOpoN6knsnrUJXLXocYkhTSqoRr4/OjdVUHXQ1qOJ
	 Uj4XTBjUTuiycSMfltn/YdqOeWZyH/Ot+DGoUVwI8dJdFz/qGuK1HHTG647/H5LKuteFlyQu8iuq
	 HYP/NRE9DF3MIyhjB5p8f56JgLDQr650PoGv42NltIKZq+rbtOMYJtmdFeYL/mee8sX2RVFnPfoc
	 LubH87GNxrWSFn1Xo=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yilin Chen <1479826151@qq.com>
To: a.hindborg@kernel.org
Cc: Yilin Chen <1479826151@qq.com>,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: configfs: require thread-safe callback data
Date: Sun, 27 Sep 2026 14:17:59 +0000
X-OQ-MSGID: <20260927141759.4172056-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87ik3w2igl.fsf@t14s.mail-host-address-is-not-set>
References: <87v788t7xh.fsf@kernel.org> <aC94ccT3un1EKctso2G_kliI1gc8wSausWGU_X9r-V4YAhGjsYXsQCgdJxkzK8r17dZZlWTNqshNIMN3xs1LBw==@protonmail.internalid> <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com> <87ik3w2igl.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andreas,

Yes, this looks good to me. Thank you for your reply and complement.

Best regards,
Yilin

