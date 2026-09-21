Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B0234994;
	Mon, 21 Sep 2026 06:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972367; cv=none; b=kqAMZP4XLPqLlNmEn7LqATsTuCPU8Uf0H1XthMyTjLU9OlVMNcWLcPsY6AgN6YsUpx32Vk85dVhU3PrbRl/o4Xn8pMDXZglwiB/qIjdtxMJgQY2fKS4GNLn1iveO5fY+ZzSiJ/X4HI+kcs7/NnWork2LzmGCdIhJChODrYnPZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972367; c=relaxed/simple;
	bh=h88Tl3sbVFQECAY7ZHT2VvuvbhAp032nbtUBKdZVrpU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gyoA6ARTvwLj52BAs1Xx97tibmZYVgVrY4obc7LvWTtfCtR252l/Ea+W9QWaWKWSs2ur+3FmOjQzZVCB8YFmVJmYeEcbBHQr2SeAwb6NvS3Mbr8NYpWJZQspcr04rMClHM76++EGX4WbnTfpFdmkAWieQM9G2866OuvOdqg1Gjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=T1m31DUW; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="T1m31DUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789972354; bh=+UphFfweXGstPshNkFfmpHUX3tQJgIQCJY33Ara9nFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T1m31DUWCmvyx+sznvDONxck2D3px8uOqCbHTS+7BZziqVLzXQR6/jYYQao9MsEbM
	 TiJXEYIp9gkfbsltEpaAAHAB2wsFriYRuJMNqidZbCefnMeNBy8bUrALxoxYT/cLDp
	 f1lrYUthUMZaoOOXoqnRBNa148o/GgKQdSvDwntI=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 8203A873; Mon, 21 Sep 2026 14:32:32 +0800
X-QQ-mid: xmsmtpt1789972352tvjnsfpby
Message-ID: <tencent_BECF7D8D0F045D49DE115EED535736C7EB08@qq.com>
X-QQ-XMAILINFO: OFArnyxfXusvKrywOgBLuVxq+itKYIQbcGOEyU0tDfWUtmsbAn27QGfenKkxzj
	 uDfbDRH7zoWr4WwG9bjv09J+ye8JVZucaq4sxQMrQuBaILyACETRiOm9UtagR7Nz6djqu+J4YhIu
	 u4GNtmapUWlNI9HUeQjMXVibJmnlev1G+MqSN/2qFlEAwBAESr/x+DUAwAuagtLxFfVBfkoXs2od
	 PwMd29N91D3L4fM5ADABmt13k0uewLgtaQj17GABTNmegUudMxY+cepcogdw36msTGVcLe2rUlU8
	 bROezXVk9n1In9H8CRLA3a6ORLpfKWUF3FILtuyR2bo2wW8C9EJEn5V/4ah/VEoT2xcWc0flenm2
	 NCj+w1FtDia/ByyCi3UebU3NrB8z0QHswYbjLltoZB91EVbNoff1Dkgdqh83Vw4Us7c56W2yzbRt
	 66NI+QuJE2ysote5PKFPzfPiWUrrcHwq/Q7yhicn/DVYy1w8wpLQs4D07M5xGVB/l3fEkEB5zils
	 kutbmiK3IUIfVvpV1toC0VmNBWfSPp22bCMMqAY1PAWknnWn/rCQAiXywdwAhw60J6cJwC4CkTyY
	 oJfmPpaRnzzuO+PmgBuPPOkB2L/P9NIJ08lIK7g1nOVg1v7hFtBPlQ5dm1dWaODM/20HOINbUcHW
	 Qsv/jWxjznVZsWfNQ6qHJIk/X4gG1iK8FZY2JWrjd8bLbjiC9TqXylbZHjRdVdNA6M8xt1dw/yNM
	 5ykbWWKh+6filDaTtkd3LIldwDt/MGwSE91Zj5FKZfvoGafYDAfqaPTa+VmWbck95404ijxKr1Hh
	 kZDkvOe+U5VOu7+kM9ir2Kn0o2UfLcd/GGuKuIZAq5X6umTBZVxYWKPAqyLWLYl6nBX5X/9GpYqk
	 G8NKmgFW5DMMymhLw5AMC1tYgf2ktLS0orp43kF+pme2yOScN5iBXHbPFQHpl4dRMAeWU6y3A0Cq
	 M8L7U3yqCAGaxA3VRS9eLiysrWioEM8KIPKl4JwFpT0BCsNoytXBDt/97yMRR/0R2ZtP+xGQySol
	 z1ssb9Ydw1q0+Y99cLeczL7yVb7GulgPSC+gMQnaeMP2xgU4xvYPhKUdKYBvQC/qsAdn1x3fylit
	 KJa4qz
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yilin Chen <1479826151@qq.com>
To: Gary Guo <gary@garyguo.net>
Cc: Yilin Chen <1479826151@qq.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	acourbot@nvidia.com,
	yury.norov@gmail.com,
	ojeda@kernel.org
Subject: Re: [PATCH] rust: bitfield: require Zeroable storage for Zeroable impl
Date: Mon, 21 Sep 2026 06:32:32 +0000
X-OQ-MSGID: <20260921063232.1263203-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <DLEFXN8E20PU.3GJN24VECD90Z@garyguo.net>
References: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com> <DLEFXN8E20PU.3GJN24VECD90Z@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Gary,

Resending my reply for visibility on the mailing list.

You are right that a bitfield with at least one field generates a use of
`Bounded<$storage, ...>`, which requires the storage type to implement
`Integer`. However, `bitfield!` also accepts an empty field list. In that
case, no `Bounded` use is generated, so the `Integer` requirement is
absent, while the macro still generates the unconditional `Zeroable`
implementation.

For example:

    use core::num::NonZeroU32;
    use pin_init::Zeroable;

    bitfield! {
        struct Bad(NonZeroU32) {}
    }

    fn check_bad_zeroable() {
        let _: Bad = <Bad as Zeroable>::zeroed();
    }

This currently compiles. Since the all-zero bit pattern is invalid for
`NonZeroU32`, the generated `Zeroable` implementation is unsound. This is
why I think the explicit `$storage: Zeroable` bound is necessary.

Best regards,
Yilin

