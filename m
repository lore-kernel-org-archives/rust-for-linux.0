Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEEC1F30BB;
	Sun, 28 Dec 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766940958; cv=none; b=j3qJZV32uJ+g9s4FrvGDXqPG9gqdPRR2JbUrCZ+Q/aTkguIYvvWHNLdTR3cULaNYqoIaKVo8D6qf92iHO6QVmKlhiaZHUQvvCN91NbeNOURgRazmIBbBtZNDLxhdGF3GFEHGxqh5UWTJ7PYKDlE2oWerFabELRp2c0qy2TJ/yIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766940958; c=relaxed/simple;
	bh=y7LATHLP2gc+oxr5yrjJwMfCqKXYQCbLBffxSP4eQ0I=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=RUDdXRKsAcfC0Chc3otB5zyuIi9DUPeJ5zo2EDCxx+yhWHx/XRvCJFx+m7gVBcnrqxi5Wti8UCZ4c4X4MPvDCI2UqdICCcpM4OTpKltnlnFWjEdjxaPPTBHGE/mc1bgTJN+jq9d+S3aN9RpQDgRrlR8VKjhZMxYAkpC0BDCaImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uEcSRCzF; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uEcSRCzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766940945; bh=7jcyrwhqg13yyHh08xZj37qBGybV8PDUoEvy1fJYSK8=;
	h=From:To:Cc:Subject:Date;
	b=uEcSRCzFmedKW20bneOPX/DwRkoQnIdNYiy/IxrVmirWDzuHLZ5TbvSMbI5wQ0Ny/
	 bBKTbD8yUGDdb7HRJr6QkMaa4aDiFprQsMnfZXk5eqrFKNDb1RxUGz6hW1P7LZC1ZE
	 xnku753kXakSDJq6HVCvqUoehgGAMvwyHa2+c+sQ=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id D9D12872; Mon, 29 Dec 2025 00:54:29 +0800
X-QQ-mid: xmsmtpt1766940869t1f5c4wpk
Message-ID: <tencent_C18DD5047749311142ED455779C7CCCF3A08@qq.com>
X-QQ-XMAILINFO: M+6QKz8nsrJQmZSdB9s93IcllevVyfdmj1th4FmxhKAX8lEGrY9VUjjB+Qq5Tw
	 xAGx8Y3zgdMlPfyo/UcQPFIaXHHqm+TkO2iDkyBSDzszzEAlbi6NVYkLHelyp6IeibXRD2DryOSW
	 7+wnt25VjrcobIiBuEq5ecwldvrAbmQBByunc9yCgynp7R6BtfTmueXVFFcMdnw86jjmYwYoCNg9
	 eKaGr2zZmyJET17Ny38ZRz9yHiYhVa6khiBRFai4kU/q5dr9TrNYYcYSsgcvwtMkuMfioZ1Fd36Z
	 UePpJcW8u9m7eftMjrzUUcuw2896mYFBnlyB9ZD/G3TWcLEL/6XXithQ9mjDB6nLi8x0KzGeTLus
	 vHH9YuTOZYXiGB4SkyXLZ059z6JkBxc/YFg7JjK+heU+QjQG4m2N7sZ/HY8ne056YYq5w7TNzT2I
	 6U2lBeqIgz4BBq2XSJCp+Hs/pLESBXvVlCv1TLp7E6iURAPV4CnFddWXb6y65BOo/QfKMD/GP0uj
	 kNro+L0NkSa3FnBv164p6HKWUBAtxfYVplFRv3B/HiUfuUJWEat2oSmAdOEjnR4ORa+agRPQWG5l
	 E0tDlOMPyWe2jMWj06Isvp9tKy3cIagkUqC578M6dwbzKsGPlzETEoNDiHReksr2KxTSSimq5s29
	 t31xj8NPVrjiV4Frkl3C2YuOKMJZXRGTefV6v42VIWtCag2HlLuRKzVLUmHSpUZqusthSoXG2IMr
	 A/aX6i+Sdh0Ggh6ft+2h4wWIbkjP7ktyAbGyHYdBJBz3kXMC5f9iNdv7QUQawkyAnCTSGsqDz9S1
	 wcOqsFTf3avjxQvsWnEY6CuGgOV/eGoM4u4y4dKHMy8ikg1juN37gxrvdSZWtgleT4JMKynVXHEm
	 AYJMDN717r/pfgqPjD9ETFhKhINxCS8/OXv6SGBl1YQsfNbD2/kl0AyYdtwaWG9lnWkmv1Z7RiEF
	 zP0KOfutvMm4rLZohWYrrODlaFkaZMPE0vrL8ZZM3n8WLT2bwTiJMsdELKXcqauqSsSUKDNImY7I
	 IRxYklyvA5stluIj5iZEtPrUAxUZMEiNNR2ajFaUPfTKocLbyFHyx/wsbCkZduFurFqh287KUqmA
	 nE6af3LJZ8uIb7PvY=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Yilin Chen <1479826151@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: device_id: replace incorrect word in safety documentation
Date: Mon, 29 Dec 2025 00:53:44 +0800
X-OQ-MSGID: <20251228165344.1974889-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The safety documentation incorrectly refers to `RawDeviceId` when
transmuting to `RawType`. This fixes the documentation to correctly
indicate that implementers must ensure layout compatibility with
`RawType`, not `RawDeviceId`.

Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v2:
- Changed subject (Kari Argillander)
- Use real name in signed-off-by line (Kari Argillander)
- Link to v1: https://lore.kernel.org/rust-for-linux/tencent_9F74630DC16B92484463BBC055DEB1F17306@qq.com/
---
 rust/kernel/device_id.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 62c42da12e9d..8e9721446014 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -15,7 +15,7 @@
 /// # Safety
 ///
 /// Implementers must ensure that `Self` is layout-compatible with [`RawDeviceId::RawType`];
-/// i.e. it's safe to transmute to `RawDeviceId`.
+/// i.e. it's safe to transmute to `RawType`.
 ///
 /// This requirement is needed so `IdArray::new` can convert `Self` to `RawType` when building
 /// the ID table.
-- 
2.34.1

