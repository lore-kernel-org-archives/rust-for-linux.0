Received: from mail-edgeMUC220.fraunhofer.de (mail-edgemuc220.fraunhofer.de [192.102.154.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF0261B9D
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.154.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859719; cv=fail; b=tWYuKkFgDAUkeIVbpybth2wWkt3Fy6fX6tmRkPtrkCupOG45jAAU8moXGEV4shnZA7B+e060dgdfZf/tqXojyTb9dl0r+fInXcv85yqqijOQZ3tutjqbTah+dMrUULjqnHoVgR8rIuSe1ralta6KGkoAZyFmeJWNNCMSEg/CUzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859719; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxxgpXFCEUQ9Z7aCz9vKiHsUETV5PwX8/PbCAd6hIpXVFiQ8bM8iYxSXTo/ywkT2P3jSfdGp0nsPecqLpYTqMDTbK1BSTcfj0q4b3FdWeNctKbPUPDygRm7jRC8Rs0mmCdQEvrv+bgA04hhZXH5CJf3WmLrhUwUqaW6GxtMC7P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=bGMxOIqz; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=I3OojC/E; arc=fail smtp.client-ip=192.102.154.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="bGMxOIqz";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="I3OojC/E"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859716; x=1796395716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=bGMxOIqz1im1ny1Ii/wGeht4pBiWRPgbHBMn28RCJ0mZZFIWIri/MKtW
   5baWIgUaI87U8ioZ/S4QltDY18Q8aw+dW7lYB5cYwStEIppycYI+TlC0t
   FEyClAd53cbVfdVMJZl83hzc03Vye4GLHzjS2M3VFURJSnN4cN/wvOhjf
   yHA/k7e3hK2x2Nejk5TuCHSxs+g8LV8W5ECFBDsYObouYUukp2g5tG770
   HqlCnGxaO6WhOmpdl2T5VnmpgJ4gbFhvAm60A3NP5YT7uD7l6OlJUA9Si
   jLDL/ZPt67suhROmF65srm7jqm4QT22XyTeClHzG8l9kxM3kV1xGOqiJP
   w==;
X-CSE-ConnectionGUID: 45leyGrrRi2Md12c2GYJgA==
X-CSE-MsgGUID: rTGfZzkKSH6fqlGkZFlxGw==
Authentication-Results: mail-edgeMUC220.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EqBACbnTFp/xwBYJlaHgEBCxIMggULgkBAAYIvszuBK?=
 =?us-ascii?q?4ElA1cPAQEBAQEBAQEBCAFRBAEBAwSFAAKMaCc2Bw4BAQEBAwEBAQEBAgUBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEdAjVWBjIBDQEBNwEPC0YxJQYOBYMCgiUEEgM2tESBAYIMAQEG2ywYY4FkC?=
 =?us-ascii?q?QkBgUGDfIFygmUBhH1xhHg2gVVEgUqCdT6EWDiFd4M0mVlICngcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBIEMDNQwLKhUjSwUtHYEjIR0XE2A9F0CDSRgGZw8GgREZSQICAgUCQ?=
 =?us-ascii?q?DqBZgYcBhwSAgMBAgI6VQyBdwICBIIVfYIKD4gCgQgFLnsnAwsYDUgRLDcUG?=
 =?us-ascii?q?0RuB5QdT5x6Aa9rNAeCOIFngV4GDJ9nGjODcQGTbpMLmQapFQIEAgQFAhAIg?=
 =?us-ascii?q?W8LggQzGiSDNlIZD44hhAC8XncCOgIHCwEBAwmSHoFLAQE?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: 9a23:RU3ENmy4B7QnxHKm5Qj1BgVIR8QoY1LH1k3ReWq0UDxiEpKka1C5rfY=
X-Talos-MUID: 9a23:unodCAoS2H+3Ax5iuagezyteG8la8aeNM2BTn4wClMq2GyhgFCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="14644253"
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28])
  by mail-edgeMUC220.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:48:33 +0100
X-CSE-ConnectionGUID: awa5HncLSYi5NenPUsVCOg==
X-CSE-MsgGUID: fez0JZK+Shi42RCm/II/Lw==
IronPort-SDR: 69319f40_RkQvwOWwKgJuAKT+o3JhY89JJKx6Y5ZqabphpOXquinfh+d
 /HRMZcTvCyQRTdqRR7bHId0h43k4CtQumZI53Wg==
X-IPAS-Result: =?us-ascii?q?A0CDBQCbnTFp/3+zYZlagS6BK4FuUkABgSYuW4ghAQGFL?=
 =?us-ascii?q?KVrgSuBJQNXDwEDAQEBAQEIAVEEAQGFBwKMZyc2Bw4BAgEBAgEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBNwEPC0YxJ?=
 =?us-ascii?q?QYOBSKCYIIlBBIDNgICAqYkAYFAAoxXgQGCDAEBBgQE2yQYY4FkCQkBgUGDf?=
 =?us-ascii?q?IFygmUBhH1xhHg2gVVEgUqCdT6FEIV3gzSZWUgKeBwDWSwBVRMNCgsHBYEgQ?=
 =?us-ascii?q?wM1DAsqFSNLBS0dgSMhHRcTYD0XQINJGAZnDwaBERlJAgICBQJAOoFmBhwGH?=
 =?us-ascii?q?BICAwECAjpVDIF3AgIEghV9ggoPiAKBCAUueycDCxgNSBEsNxQbRG4HlB1Pn?=
 =?us-ascii?q?HoBr2s0B4I4gWeBXgYMn2caM4NxAZNukwuZBqkVAgQCBAUCEAEBBoFvCyqBW?=
 =?us-ascii?q?TMaJIM2TwMZD5IhvF5EMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:HVdNVBRDLUuRz9N5wuEArkJLrdpsovKeAWYlg6HP9ppQJ/3wt523J
 lfWoO5thQWUA9aT4Kdehu7fo63sHnYN5Z+RvXxRFf4EW0oLk8wLmQwnDsOfT0r9Kf/hdSshG
 8peElRi+iLzKh1OFcLzbEHVuCf34yQbBxP/MgR4PKHyHIvThN6wzOe859jYZAAb4Vj1YeZcN
 hKz/ynYqsREupZoKKs61knsr2BTcutbgEJEd3mUmQrx4Nv1wI97/nZ1mtcMsvBNS777eKJqf
 fl9N3ELI2s17cvkuFz4QA2D62E1fk4WnxFLUG2npBv6C63VlzH7q8F01DKcH9HZdIEZAhSw0
 vZ1Ui/TljkhHGYS62Hqk81+rqRQrA309Hkdi4SBQdqyM/hVOY7kT89DS2hzB+BxcxVeAYSjQ
 NMpJvgqA/RG/43PolQitACnWwmXLuDuxQFkm2b70PEX17R7PB3Jx1ZjE9wVtlLo/YjZCr4NC
 cOP9bTS6C3kTfZW92rj9pfuTQwvr9O8Q+lzY+/31BFxBxLH1QzAs9PsBS7Sicgx7021v+xhB
 KGWsGInrzgshSKL7dkGmNXWt9Me6nHb3CFJ8IIwCvGHemJCUYCdRcgYp2SbLYxwWsQ4XyRyt
 T0nzqFToZegZ3tiIPUPwhfeb7mCb4Gry0izEuiLKCp+hHVrdaj5ixvhuUSjy+ipTsCvyx4Kt
 StKlNDQq2oAnwLe8MmJS/Zxvw+h1D+D2hqV67RsL1o9iKzbLJAs2Pg3kJ8Sul7EBSj4hAP9i
 6r+Sw==
IronPort-Data: A9a23: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
 GqlgLMeNBjA
IronPort-HdrOrdr: A9a23:hgEqP6HKtxn5yJQ9pLqFEpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faUskdtZJhEo7y90ca7MBDhHPJOkPIs1NSZLXPbURWTXeRfBOLZqlWOdU3DH4ZmpN
 9dmodFebrN5DNB/KTHCWeDYrId6ejC2rupiI7lvhFQpExRGtRdxjY8LjzePlx9RQFAC5Z8PJ
 2A5vBfrz7lXXgMdMy0ClQMQuCG/rTw5eXbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63mmfCmzR330XPV8v1t6a/c4+oGIPbJptkeKz3qhArtTIN9W4eatDRwm+2r4EZCqq
 i9n/91Vf4T11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1bkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMcjgYdq3MMiFX5uYdw99WPBmcga+d
 BVfYjhDSNtABmnh3OwhBgf/DXjZAV8Iv68eDl9hiWk6UkooJlH9Tpl+CU+pAZyyHtvceg32w
 2DCNUfqJh+CvIQba8VPpZ5ffeK
X-Talos-CUID: =?us-ascii?q?9a23=3Aj/KPTmqaE3sOoDg9gSsQM9XmUck6eyD9ynz0GH6?=
 =?us-ascii?q?5VEBkToWoUmG736wxxg=3D=3D?=
X-Talos-MUID: 9a23:QK419An/4/wCrvgCEZyudnpsOdUwwZaNS3sNkMlcgeKBcg1RfBOC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="46838191"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:48:31 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:48:28 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.4) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:48:28 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQ8ICuF+cYAdmLUWFQr0tPDmO9NSpRSuJPvDTkDIACNguOJ+AP/vVcB1BwM7p6srMNXHywdoVyNlHVBvZ574/Xn9VaVFAm2d5dBHk1n76LLop7JQKwGmd9eEGxDvhN5vf0vgcsu0nsZb7LT+ul4Zb593KEV0kOGfS6D5LFZi62nF1TSkE/0aRIi5qGio5YJvwhKagZE3dEl+GU66NApAXOTCbpaZ8rmw+VBcvofuawBcKCW8qYyK+NuIbq8JhHrtWKLhNPBABuTc2OMW0IFk3ua3hoAfRTCkZnorfXq9agVBf+Pnw/72xqsH8/33NUBpXcjmnpdLBh4bm3IFQJcgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=t6uaxTsZJwmN2UnjU4tHgT87RVDkaZOP/EVK80V3gJJu3VDKNzjpu4ML8AQ86GSdnpOzmm+B1bfFQ0f+pD6yj5oLssKyVPLvMBP1A4pe573ce+GG5YMg0ynIurutnugwT9HpSh3tj79SZIqyyrTgVsmIZ3nXaA5rRiEPnBPK6/FhYhGZpp62EfMBtQIJFFb2Xu/bw97QgKIJxdNCh8r2Sk7XRWjB+FD+fuchZhxyBs8WkO5R6RE/Iag8Fh78grKeKv3g5lWhwCiL6PyP0Cvcfo7LmnjlUix7PsrK8xeQNSOG/je+sPDua+HtwlklKitP0Q9VpJvSq1Zqk8cIY+DsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=I3OojC/EQZt1fjZ1NHLQwkowG0NAzCVzv8lZmgDqsq6hSBkigVDuqee4El82Etgs2+dfsnNT95DVqw0KRQurMpOJmhF5vvwNWtffJXv3kzMNu06xyj318r7aRu/7DT4MF8ni9+QSdhlQ5OrLCvBz4wY9cHIwAlXXlmGDWZDQX6Q=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BE0P281MB0177.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 14:48:27 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:48:27 +0000
From: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
To: <devnull+debug.rivosinc.com@kernel.org>
CC: <Liam.Howlett@oracle.com>, <a.hindborg@kernel.org>,
	<akpm@linux-foundation.org>, <alex.gaynor@gmail.com>,
	<alexghiti@rivosinc.com>, <aliceryhl@google.com>, <alistair.francis@wdc.com>,
	<andybnac@gmail.com>, <aou@eecs.berkeley.edu>, <arnd@arndb.de>,
	<atishp@rivosinc.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
	<bp@alien8.de>, <brauner@kernel.org>, <broonie@kernel.org>,
	<charlie@rivosinc.com>, <cleger@rivosinc.com>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <corbet@lwn.net>, <dave.hansen@linux.intel.com>,
	<debug@rivosinc.com>, <devicetree@vger.kernel.org>, <ebiederm@xmission.com>,
	<evan@rivosinc.com>, <gary@garyguo.net>, <hpa@zytor.com>, <jannh@google.com>,
	<jim.shu@sifive.com>, <kees@kernel.org>, <kito.cheng@sifive.com>,
	<krzk+dt@kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<lorenzo.stoakes@oracle.com>, <lossin@kernel.org>, <mingo@redhat.com>,
	<ojeda@kernel.org>, <oleg@redhat.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <peterz@infradead.org>,
	<richard.henderson@linaro.org>, <rick.p.edgecombe@intel.com>,
	<robh@kernel.org>, <rust-for-linux@vger.kernel.org>,
	<samitolvanen@google.com>, <shuah@kernel.org>, <tglx@linutronix.de>,
	<tmgross@umich.edu>, <vbabka@suse.cz>, <x86@kernel.org>,
	<zong.li@sifive.com>, Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Subject: Re: [PATCH v23 13/28] prctl: arch-agnostic prctl for indirect branch tracking
Date: Thu,  4 Dec 2025 15:48:20 +0100
Message-ID: <20251204144820.11718-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-13-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-13-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BE0P281MB0177:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebd5421-68cf-48d5-daf8-08de33442edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eWnJdh4J1NNxnpOHminKlSZvZL8smMVDkc4FGi4d3thofF7JY2RB0iov2xrO?=
 =?us-ascii?Q?fyr82qU7yDbGpqwFasSxeDEd4YEMjPUAycjxzUQccdoeHAORAywaF8ojIdyo?=
 =?us-ascii?Q?shSqw9e1mE7TswIr7oJGVkUU9CWX2hEJwYXHiO9J+gGjhiF0DLIiHLbj0I4W?=
 =?us-ascii?Q?7JNYKNJ9lKFxwA1chjzrx80uAWd6NANq8j/6uJPbQfaf9Qy48ovfcR+gVGhE?=
 =?us-ascii?Q?tckcUr1ghNI1WvSch9qNFWFJm6UkN3t9NEvNtsQ5/HTB7ckGLMLpePZSairm?=
 =?us-ascii?Q?bgk2sIVTZAFq+EhxcXd1FbFD+5MO9NFv3VcNrkVc3ob1hVqirw/ZZ6yDRNVn?=
 =?us-ascii?Q?WbJmwK/581hgtKFDW8sAWI/FoMaek+ccYR4ecYwNl323jodQINqGStWKFGUi?=
 =?us-ascii?Q?2BVpjV015Pe3Ao3xhyKxMmd8H2tsPdyF+OHX0Y4x8jOfD6nmEbSVV1wee9XF?=
 =?us-ascii?Q?y5lHorKWfIAL8kaD4pT1PB8D15Nj6TLXtutM14MkWxGtnsEVCl2DXf3/zvOP?=
 =?us-ascii?Q?e5/zOuSCJmJP4SjLapbggYMQXAKpGozs2vyZTxwIOgu/MVtPEQZnTCBSIsI5?=
 =?us-ascii?Q?YdS/0FOiM37kfSOpVT5DCNiC30VXhe6uosyAo5p0KMfyHKT45Keyohpb4N9T?=
 =?us-ascii?Q?CyLxO+EraEfUaRyFlcSVBFeMddWegph8pm3F92p9lnKwvtXzw6MnKrZzJZKu?=
 =?us-ascii?Q?oN8x9zFbVtqsuMKcIMU92P08Mt3q4hYuDS6ZJh2mUr/00u5/IznJizcwdMUa?=
 =?us-ascii?Q?8xDXxda8QuYskWNEaENBc2lzo52LY3INiiIEVGKgCaTr8lOFo5//Bm/wuv2g?=
 =?us-ascii?Q?qAmOey/S6yKGAqEzcwkYllpU/vCUNFCb8lUQRt0axpt2Yz5nuqeuOz09sffD?=
 =?us-ascii?Q?OVCvO7QX5mDRdqUPb38YHGx4+jiu5HNLK3zYCYm3Mu6qWqf0VZOa1nYEDw4M?=
 =?us-ascii?Q?IgkbsKYqMKeofsEFop8LMuqnl45U5FUy5LajOLB9cbuzB9INImlHxYFZU7+T?=
 =?us-ascii?Q?B5N4CFaQuIUyHZrZA8XiCYBoJD/MS3PdY7cNpf05Uk6y/pL7qgl/StPhPptc?=
 =?us-ascii?Q?86xtf6GyLNQ+zW+5GY3QX9yfPYLTvE82DzkbkHwEVpGBl2FO2FPkYpIAS48a?=
 =?us-ascii?Q?TV2d1WuTPdBF0rUMWckyBuTpyO12LaozcH7SIZLlIkrlM9IsN7Bn7Ns+satb?=
 =?us-ascii?Q?5m8a/5CzxmLQMIL+lEDGBy9ofAXtQvPoa0i9iu3WSOXmxXdWVvHS1JAgHiaD?=
 =?us-ascii?Q?rzGxrfxNk4FRKcUZHM4rxhF2nGOqjqa7fM+U5X64iet43BVJjIFaolmC2fNc?=
 =?us-ascii?Q?+oCst7fkfXzG5wCSBqlbMy0iGSdjM2gVGM0X8IoX5yP+UlErPBki7O95JPuL?=
 =?us-ascii?Q?TnloHfKxs1urxElQ6OngKYN2mLPVYiwkxeds4VcbenAbMmQ4BxXZhM7vKRDf?=
 =?us-ascii?Q?TAPoYwj4mUHJJXTDDPwqK3U1cGhyxZYe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mtJvrUXXyMH77MwIZqRUCizZRF2U/6/r+eJq9/hkRlwDPTRHrAaIL6vIt8lJ?=
 =?us-ascii?Q?enKtt6BWMKp64AONTF5TuQ9wZWG56BxKkyd7ti8EoXt/5cIfbXwBLS0EVigj?=
 =?us-ascii?Q?nCbEMxkQhbpyLeHtCmTH6l/om79u6px1q0yOa8WbDoLwp2J+U4Kx/rj9iX0n?=
 =?us-ascii?Q?xA7u30IHw3VJHJxnklCPp+WRFSxmuhBO5py1Y6qIkTQMWm7xj1nRNBv4iaWI?=
 =?us-ascii?Q?N73HkT4Qg1H9M1xam9SP5V1vUOVtVR79LkZrzaWOr4qcayTapMIdxsPxaePd?=
 =?us-ascii?Q?53WCdlD9mId9vXOLpFyrWhhvO1fY9ai1ofBgtenGE6kWTIHs65kNW9DprVH6?=
 =?us-ascii?Q?G7CDMe1hnrNgLUlxafzCwLtYS0ydQC5QjXtWDhRLsocEFjYsWietB46A/g4k?=
 =?us-ascii?Q?S5qDsD0VMCjg+WcpgM31x2E1FY8d/1O2qpmwnF7n5ng/KKJgmAh8MMvbdeaO?=
 =?us-ascii?Q?EYpZt3cZF7xkxbh5dsN2R3OX9lostSngd2LgEH2wFRtvvfrFLAalRH4c+jXn?=
 =?us-ascii?Q?8WYfayg5QZl8WVNQIADkKRe3ezviK6ll9DfOox3DgQVxeUVx/LH9RL5XLlWP?=
 =?us-ascii?Q?N8P/IcC+jBwbO2w3u8IS+wtVoOO9TLCKnioF7yh8vvndoJkt4Qltwb+PBPfa?=
 =?us-ascii?Q?uPhnbH7DaH64hS/VXceFCZssszMmxDFNH6kG8LM4epb7xVkrmL2kNHh/GmYE?=
 =?us-ascii?Q?bO9uj1s8Ge3Z1wh1R0j1/Zzsg2Fzg38IlTQ55peoJtZE1WfAGILhqFxbjsaa?=
 =?us-ascii?Q?6qY1qsogRZUgBPaaRDOZOyZ9szYFCcAd0jcgE23uoSmJsHRxnMk/YoUzoBJD?=
 =?us-ascii?Q?AZSxVxH0D3YJLQEcwcMqTsSfj37cqHW+2SE+D5UXDCqSLwQ2dd9LOgTPuZrq?=
 =?us-ascii?Q?UTnd9ZIO3bzgDqJftrtxnTCgVAJKZYaK53FIE4C47lC+bKLYxfP5+zb2bI1R?=
 =?us-ascii?Q?2LhCH+PKEBBKpeP1q3s6GKqnJrOJ8dtKDFD7LOOGPY8OBtd2Cg1nh6p/gPnC?=
 =?us-ascii?Q?OI7g9Wdu3PBL+1QSx05iE75TrTiuAXVp6gNWR/eZN2FCgwWjpqPWh56aAAIZ?=
 =?us-ascii?Q?yDIepD4vSd/6zJlknmYqLeokKHLs+0YhGRYp6MI+8Fme5txZdp2RBGdAK2C/?=
 =?us-ascii?Q?qJDUuDo5Un8V/mtlN1JLRQp1PJbzQaXZ14nbt7gGEWUVjGgWjT5fq1RP9koX?=
 =?us-ascii?Q?CMXDsBZ3wmVZY0ycRqZvZNo/8KzUbylbYAxGdXqLdm/I5xQDVWd4N7Jvi3eC?=
 =?us-ascii?Q?by96t52B3tBp7GYCviPa+7CsL+i88le1e80Y2t9jo6ZgPNq4LL8+k4PIIH7t?=
 =?us-ascii?Q?/SQtzUBptQEbipOlZI4PlDyR4Ov7//NzD88mcrZQ9NxiUTp9x39v60sTVsrZ?=
 =?us-ascii?Q?HQhtzQR0QEwm3R2jLG8pWXRybH4emCCuCRBg8I44kfaZaJzQGUMHfIWE9vZt?=
 =?us-ascii?Q?I6BK2TB97Va8XTMLWcCEyW5B8EYzmmS9/HbFEafOX6Li+jQ5kkZd+lKiimcr?=
 =?us-ascii?Q?n7m3uHocR9DMnN16B0V6qYXwx1e+P4bujSdjgDO6giavFgwJe8nCVwOAjTX9?=
 =?us-ascii?Q?3tEhqoWY0767JZW+UpdaLCx/cfs048cs2DPL0cTAnydcXjVO0jA59MyD78Z2?=
 =?us-ascii?Q?MMGkiSZEIm3U6bYF5HZS+Og=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebd5421-68cf-48d5-daf8-08de33442edc
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:48:27.1407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVUvFQwCXaLZMXP+ErYLtAogA7sffZOpqAh28YqIvTY5L+Qeom6LZxlygtjitk7cRwDtAPr+EB9fapmgesAs5dJTalhgGBgV3UaRk9SgZTX2DYQtl8UBpmWP5VW8eODZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE0P281MB0177
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
