Received: from mail-edgeBI195.fraunhofer.de (mail-edgebi195.fraunhofer.de [192.102.163.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571BD2D1303
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.163.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860727; cv=fail; b=O3A1rO+H834biyq35UFa5EYteSmAKWQII3qCvJPw3u6NsYobY5+onlz1Cpl1ZEKHZpoiPJnnEpEqdQUf7ihV0YaB0fXmbIe053yZ4C5EVBOFguJ+ExRXdbO9sl235oTg5kDCKK4FNN5h1Ax5kd7NliI0WlgR6/WFJPp9krjEbJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860727; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LRiHsffDRnuUDZ9FiXu1GgxpJA4NyLllNNk8Rge/JGVN8xyf8rqCDt5R2bo7fuAyVuD8v+D42+JtDW+OZZS915/kxTuJ+lR9pdX1foOmvYp1kh5qdgSkUvLshAlhZp/oGKNMQBec1zKwrAIQsfVleduoyQK5RCvMjQNrnkBQb8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=mPKICSaW; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=c/WP7gz2; arc=fail smtp.client-ip=192.102.163.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="mPKICSaW";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="c/WP7gz2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860725; x=1796396725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=mPKICSaWFgGvtRktnZ7igh68BBTLTYp4LRTZgJe5+bxWf8efTXVFbw93
   fVdbxI7/Cuf14EmUffDz8r8Fpzu8vc0z434dzbTJai9OZDvaoIRqOw/Tb
   mHE6DnTxvrACiaE3Aa8Moh63SbpWUoHkGV6Eitq4vOL8TAq26VSt84PXR
   IhbyCzQdjQmh924ZR8KeSwoEHBq6/+0kSSMSTZXKsx2vatkkwRDmjqhwv
   meO+7XVj6LXj/4uzLeLDoh90Z4eiFcayM8UV6NaMCXSgDGF8y7whlH7ef
   MOuStTxqlw9O9HToDfvnRqAmzgSdqDxeVuJuBLa9SjIk+ffy4+LN5GyaV
   Q==;
X-CSE-ConnectionGUID: Eia93X+XQbus9ctaj9z6cw==
X-CSE-MsgGUID: b1jgQoUtTNGkZMtXRRYScA==
Authentication-Results: mail-edgeBI195.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BABMVK1o/yYE4gpaglyCQEABgiWzOIJQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMJyc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwg?=
 =?us-ascii?q?mQBhHxwhHc2gVVEgUqCdT6EWDiFd4M8ml1ICngcA1ksAVUTDQoLBwWBIEMDN?=
 =?us-ascii?q?QwLLhUjDzwFLR2BJ3mEFYQfK0+CG3KBdUEZP4NTHgZrDwaBFRlJAgICBQJDP?=
 =?us-ascii?q?oFxBh4GHxICAwECAoEQEAJuQAMLGA1IESw3FBtEbgeTd512Aa9rNAeCOIFng?=
 =?us-ascii?q?V4GDJ9nGjODcQGTbpMLmQapFgIEAgQFAhAIgX6CADMaJIM2UhkPjl+DQroxd?=
 =?us-ascii?q?wI6AgcLAQEDCZIegUsBAQ?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: 9a23:KsKjgW8YbWijZXunVHyVv2MVE5F+Qj7t9X3NOB6zFW9rGa/LQkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ATsYaaQzhK0Y/7zrNhRCOdHpJ/8eaqK73Ck80lqg?=
 =?us-ascii?q?ah++rNh5VJwentgWMSaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="15622135"
Received: from mail-mtabi114-intra.mx.fraunhofer.de (HELO mail-mtaBI114.fraunhofer.de) ([10.226.4.38])
  by mail-edgeBI195.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 16:04:09 +0100
X-CSE-ConnectionGUID: 39c0Z8SDTVeFTvMtyQfDxQ==
X-CSE-MsgGUID: +9zBB4A+TpeFbuNcb43N9w==
IronPort-SDR: 6931a2e9_blj5yS41TOFmXq7dKj++ifq/oyZqxxBfeOLjNP7eg/RWcf5
 ZPXYEtCfQPz3UMMntLGJwfEGzLskwQ0UKIukU9w==
X-IPAS-Result: =?us-ascii?q?A0BABQBMVK1o/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCYnNwYOAQIBAQIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBAxIgAQ0BATcBD?=
 =?us-ascii?q?wtGMSUGDgUigmCCJQQSAzUCAgKtNgGBQAKMV4EBggwBAQYEBNshGGOBZAkJA?=
 =?us-ascii?q?YE/g3yBcIJkAYR8cIR3NoFVRIFKgnU+hRCFd4M8ml1ICngcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBIEMDNQwLLhUjDzwFLR2BJ3mEFYQfK0+CG3KBdUEZP4NTHgZrDwaBFRlJA?=
 =?us-ascii?q?gICBQJDPoFxBh4GHxICAwECAoEQEAJuQAMLGA1IESw3FBtEbgeTd512Aa9rN?=
 =?us-ascii?q?AeCOIFngV4GDJ9nGjODcQGTbpMLmQapFgIEAgQFAhABAQaBfiaBWTMaJIM2T?=
 =?us-ascii?q?wMZD44hPoNCujFEMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:ubdxrBWry6llmbIwZtScPE/xyFrV8KysVDF92vMcY89mbPH6rNzra
 VbE7LB2jFaTANuIo/kRkefSurDtVSsa7JKIoH0OI/kuHxNQh98fggogB8CIEwv8KvvrZDY9B
 8NMSBlu+HToeVMAA8v6albOpWfoqDAIEwj5NQ17K/6wHYjXjs+t0Pu19YGWaAJN11/fKbMnA
 g+xqFf9v9Ub07B/IKQ8wQebh3ZTYO1ZyCZJCQC4mBDg68GsuaJy6ykCntME2ot+XL/hfqM+H
 4wdKQ9jHnA+5MTtuhSGdgaJ6nYGe0k9khdDAFugjlnwXsLLlg7gt/dW0SWBO+/qYokFdG+C/
 Zo6VgXYszkZERVh23rXt9VxgoBdqx6+8k8aocbeNYrSC8IhcbGHfPNKV2Zlb+R0SiltCby6T
 LoMAsNYYt1XsZPxv3wokyqSQhnvI87K+gBiq23c740kwfoaKz/hnyd8QsMOkG7e8eSsJbo/F
 s+ElriS3zqTbtYL/Rf+zJCQLDkKg//TBIJ+UOqAlw4+LwyV0nuKqtL5Mj/F870TrEeA9M5lT
 cLyoHQY8hMgmyX/yuowjbDXrYko6FaU8Co+kYQMIsSfQVBRPc6/Nc4D/zHfNpFxRNslWX0to
 ish17ka7IayZzNZoHxG7xvWavjCdpSByDO6DbrXLy1xmXRlf7yynVC+/Bvoxu79U5ys2U1R5
 mpek9bKv2wQzRGb9MWdS/V880vgkTaC3gze8KdFdGg6j6PGLZ4mzLMq0J0VtEXIBCjtn0vqy
 qSRcy0Z
IronPort-Data: A9a23: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
 yzJcHBoHBCVse6oqvkgyI+Lst+jO9Ez
IronPort-HdrOrdr: A9a23:3y+y2qhJNmJNM3/iasmKcgN6F3BQX1513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwQpVoMkmsiKKdgLNhd4tKOTOJhILGFvAF0WKP+UyCJ8S6zJ8n6U
 4CSdkyNDSTNykCsS+S2mDReLxAoOVvsprY/ds2p00dCj2CAJsQijuRfzzrdXGeMzM2YabReq
 DshPZvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+3LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3CtiFVEESjtu+bXvUgZ1SwhkF3nAhp0idprD
 D4mWZgAy200QKVQoj6m2qo5+Cq6kdT15ar8y7mvZKkm72+eNtyMbsxuWpUHyGplXYIrZVy1r
 lG0HmesIcSBRTcnD7l79yNTB1ykFGoyEBS2NL7okYvJrf2UoUh27A37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjBrdy32CXQqq4iQyXxbjXp5x0wXyIgWmWoB7os0T91B6/
 7fOqplmblSRosdbL57Bu0GXcyrY1a9CS7kISaXOxDqBasHM3XCp9r+56g0/vijfNgSwJ47iP
 36ISdlXK4JCjfT4OG1re92G0r2MRWAtBzWu7Jj26Q=
X-Talos-CUID: =?us-ascii?q?9a23=3AsL7sW2ttUovFKC7429pO3tb76It+I3aF/ifrD3O?=
 =?us-ascii?q?GBEhVVpiJWGae1LNdxp8=3D?=
X-Talos-MUID: 9a23:qmpTjQt9RLGsvlTt5c2nx2BwHu00yueSEE0jm4ggsMPYbgohJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="29869707"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaBI114.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:04:08 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:04:08 +0100
Received: from FR6P281CU001.outbound.protection.outlook.com (40.93.78.1) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:04:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVmj6Z51tPMVpbd0Gw1ID2btopkbhRAde8u4qWVV+tAPItXs2jDfUJJpAac0WMLBg5yaVbaW1zjsEw2TGQbHSWI9ACB1ZLd5HFwfD1YXAMaihxlMVfEbhReLbyx8FUmYwnIsdZ2tVYoIh5p4x8H/5BLTSp9/09KswwpT+dtk22I33RrjE11pn2FWGIUnzcFtnkpEaSXYViUHoIwMsoR3lemXCka4/H+q1IsROeb+gKlMh9PUsnJJ5xr4RSEt1by4mjIRI+JHcs0C0ifMD/xPk3EId2mcOLVfi2Xqe2H3wXOPIcTEB5H2uaLTJPhgcBge5YDf0o8epzJU887nYMJlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=VnH98zKhRLG+3ykSyHso53fwi2N4g3w9JuEQYwdMkh74rwRg67MPXxsvalyne/SYZQsTkSfGLPHMy58ZhAE9wPoAqz9ah1qub/o3FvwbZuZcKcJ1bmVf54YRKhrSlHWKKYmdbtYaM4Yi4a3MQM5ApkShryR4Yd7ZfRlasUImA41xCtIlUvnTa+XuRC9XA1hzDdl9+IHYUg3GbdB2u1aHeEd+LuXLQzMu36gA5PrgP3h0Kfux/ileslGt9xbMifeUBsOA4mdJka478fiRm1sIOFgtY5EvbU8uBSvkAUEWVIcwpKt2LKQ8t122gaD6Bk8GEgwhGFeuT9sdUU+7PSIirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=c/WP7gz2iH8zdLYJMumDcWnKYkeA17SgvrdpONVYD/x+OEMXWBEzBZHvzvSRVO+C45yhHrb5Y1yuE/GY2y2zg8iM5LHkLp06ACJf71XfIH96/yPg84Frk6ted8M1vwGssLmpH5CrW1z9Qu8dEtoQvCcUJn8mg/9jQoqOavB4xsM=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR4P281MB3697.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:d5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 15:04:07 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:04:07 +0000
From: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
To: <devnull+debug.rivosinc.com@kernel.org>
CC: <Liam.Howlett@oracle.com>, <a.hindborg@kernel.org>,
	<akpm@linux-foundation.org>, <alex.gaynor@gmail.com>,
	<alexghiti@rivosinc.com>, <aliceryhl@google.com>, <alistair.francis@wdc.com>,
	<andybnac@gmail.com>, <aou@eecs.berkeley.edu>, <arnd@arndb.de>,
	<atishp@rivosinc.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
	<bp@alien8.de>, <brauner@kernel.org>, <broonie@kernel.org>,
	<charlie@rivosinc.com>, <cleger@rivosinc.com>, <cmirabil@redhat.com>,
	<conor+dt@kernel.org>, <conor@kernel.org>, <corbet@lwn.net>,
	<dave.hansen@linux.intel.com>, <debug@rivosinc.com>,
	<devicetree@vger.kernel.org>, <ebiederm@xmission.com>, <evan@rivosinc.com>,
	<gary@garyguo.net>, <hpa@zytor.com>, <jannh@google.com>,
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
	<tmgross@umich.edu>, <vbabka@suse.cz>, <x86@kernel.org>, Andreas Korb
	<andreas.korb@aisec.fraunhofer.de>
Subject: Re: [PATCH v23 24/28] arch/riscv: dual vdso creation logic and select vdso based on hw
Date: Thu,  4 Dec 2025 16:04:00 +0100
Message-ID: <20251204150400.15051-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-24-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-24-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR4P281MB3697:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a9738f-9c2d-4c8d-17ce-08de33465f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2daHjK3sicP/R31dowtpvGTYluVh2DH2kmUEBsUM5nj1jnihwmsnzLQWDcqi?=
 =?us-ascii?Q?UohO5eaYnroGeERugvHPaJvFME/pcfeXgPBdiq3TlhsJDk8NR3CCqDuYRWQ6?=
 =?us-ascii?Q?JRrwVn1uxg9poLuVS+bHOm1vL4TfoES46ufWA3rsFhGyrL/8SMDjvJXpqOTs?=
 =?us-ascii?Q?NMsirVuhBucbK62dF3/dAgkQloHI44RRu6tskWzUx2Q+Zmak0Ei07COQYnsh?=
 =?us-ascii?Q?MdWyCAiwRnOSXQekglDpFPldlE8mzY5WytMuAPBrDYnniKxXrFvPuNyzcGua?=
 =?us-ascii?Q?Ju62m4Z+zCVEorWg2VqX32VUi+qFffJjlgxL3kOwboeNvPH5DYIJEOGQzRfm?=
 =?us-ascii?Q?p1NaATyj+UHjqnEhyWtjcHLAYlOJJmQuLrv2MOBh62pKZ1aL7BwVoSDkumEr?=
 =?us-ascii?Q?rERoA9uqj3nCxXqtiNiAdizhsqy5CN6NidnSB4jmBsQbOlOTojVrQ9fGUJwh?=
 =?us-ascii?Q?IUE42zxVYaBhOdHwjFhAJeC6Xj3MrNkCRXTl1u2B3z09F4M+FNqS6tgipdJE?=
 =?us-ascii?Q?2g3/0+Lef89K4JGtoswqC73jN9a8O1Rv7BugRR+bqGiFYRY4o8Ov80JHZN1Y?=
 =?us-ascii?Q?nPDXSSCBBuhcRkk1/qR7LjZKNi6VpZOw2MzTVO4uC8ZLGcP5hxj/6nw+9LIo?=
 =?us-ascii?Q?bY0mbsPELPbb3vh6q7QgabTVPnNGsSFSvzor1s09AdAv9MExlDsItswOLGS+?=
 =?us-ascii?Q?4xryR3Sjm41aZ3bpF4Rc632MVUZb6EXzvXif+mQR3v/ylAaHb1gKPJb0Vx0V?=
 =?us-ascii?Q?NJs2KZJwW/Cc1cox/PJQG8WjniAf+0ADZJKk/OY5zwldafm7fnZzesf9F5yc?=
 =?us-ascii?Q?67wawwaYlSmRd0O++U8og9Zoa5pG3scC2l3Xw2lkg9k5I35GG/Db8IMgEjFt?=
 =?us-ascii?Q?JVPZF7UpuE5U4O1pvkoBTzzIDp/NLa6YszlD3wJqKyYR8Q+spEtn85lqTy/b?=
 =?us-ascii?Q?eJGKE3rUJUjV+arxhtFYgzIBvGybAaFH1MXBIEfySwaL4VCe8Tivp91tBOdu?=
 =?us-ascii?Q?CVRapeHCpAP38p7sFHhQvDZHmpNEWe3GxINxmOquszHKSLQlYMtsKGvnOYFl?=
 =?us-ascii?Q?C7QMLe/TNoJwI3Qv+KzsAGdgG8zuuymym5jsjh2FTamyFgFeE3ttNcjzdVF0?=
 =?us-ascii?Q?wXvYbMUxQJn9c4hI/JXCR/C2UGztxnmDeK6HBpeqSDxU+OmctamNI6POHKGu?=
 =?us-ascii?Q?5DqNuheVkf+wn3DW7u/LlAD2cgrZoYCNgZoe3SjnKoeep5K8rj/xsshce/Fk?=
 =?us-ascii?Q?yiCVbsfDm3Ii2w7xcfOtomUdk6kl1F1VEi2n4UiHvQLhBEULnFjTppqMIQDu?=
 =?us-ascii?Q?ZA8uqnVtYhA9XsAft7/2XN5WFozuzRlC1gcnVy/P92bQNz4Jr2zZ4jLbH4LQ?=
 =?us-ascii?Q?ivUb0+GL2C8Xf3NQ7dTOAgwB7BNY8YeoId3TYlQIswutLQwXPP3D6/LEM2dZ?=
 =?us-ascii?Q?iyHuEZfEWAR3y63Fle1P4MVQjbQjMiTQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j6eOUwA1RvRL7/YugKvVW6/vaIkonT9i2HgkI3s3MF4S1a7Otju5X8imJsj4?=
 =?us-ascii?Q?hfuQrMCi+EzR270p9naMxfff1rjOgCmEkRIC6iqfT+mjldbfxyaecO7J6NeZ?=
 =?us-ascii?Q?Xv6xJaxmrw70ddcp1OkLseMiPr1AOOqYBIe+tqMWdluYE12Y+ljaEqWRt4SJ?=
 =?us-ascii?Q?7ZGClNFnl1Las9xxBFqnD/tdUr4cz5s4yDU090eNpIhLhM0MNWH+4giKtBTm?=
 =?us-ascii?Q?3M1Uke8UQ/f+Is59qGEN8YGigcGcexcmVcf7mJ06sHXArGzlNgq8a2iHfu8A?=
 =?us-ascii?Q?ydy6Qq5FBMfHMfm53lBSpXMHtF49GtL0AeHbrwfXtII5nQPuHLwPUdyZW2b1?=
 =?us-ascii?Q?w7JUqBYhCWl4QdO2+S3Soyy0R0PGh3zuyq6LeTjkQ2b5ihf1x1xYw3l2yT3m?=
 =?us-ascii?Q?+2pUTVXw0fl8zBiwnk2KkJiNE8i5wRS6WCQg9Uh+Mc7uT0DnO1zVdDkgCRMl?=
 =?us-ascii?Q?Z7XefKnfDMq2/uxx4TbK687eUBEpYAYQ/fIKrNkn7uyTTyEW5n4cjGJsE4vQ?=
 =?us-ascii?Q?AT3ZdZmF7PA04CUjexSKM0CdQBDIxPzwObjOQDMkuXNM1l+CTrAmUc6Tolyu?=
 =?us-ascii?Q?vV9duETb5PuijOW6dZJ773V9vOwJAh7EwYFPkwYPMdMDbgv/A6i9C7t88OJq?=
 =?us-ascii?Q?dxb/BM6tfc8HjnKJVdV/Dfp62+irQ5+7Y0ZKvAtKF+XEJhg7A/WwSUK7DHZa?=
 =?us-ascii?Q?74mx2CRnt4SeMbizPbR02D/6QS3/P+lm3IAdUJp+agYuY1AxSPGNX06aDB4S?=
 =?us-ascii?Q?g33F5Nb+v4tvkdGFIqHbBsphKbQubBUTr9F/hN/FgsImcmGYB+fHxjJxy3Y1?=
 =?us-ascii?Q?hL1+4rRmLMIYWLQONpeTxkAk57C5Lw5ZzromqugULx3cgwWz2Z30WufJb4VK?=
 =?us-ascii?Q?C7zmj4Bk84DiF2z1+bnByzCW1oT0nTH0Nc9PbxCfk6W4fLe8W0Y6t1cU838h?=
 =?us-ascii?Q?gFR7cdni4qYAkU7YNCGix9KAHQrh8Io+OehDBvDO9t72hqlizq2njd3UFbFk?=
 =?us-ascii?Q?e63hTkFKwteSM6757Cr2BIZww1+CjkY13Fo7SZ9/PNYzLquVp5VPGLohEpgr?=
 =?us-ascii?Q?oed7KYnwX/1fVE61lFXjWCbzY/OBQ+D3G1BCudKehA3nMUkCjAtfD8tpHtZt?=
 =?us-ascii?Q?+frk1iRT60UR8Tmntt6OJapCYu+3Axm6TLWdSrCbOQKJ7e+00vms5zGl2vcM?=
 =?us-ascii?Q?B1C+1czyZbTjhYxQRG5feknbi83O0e03FkN2g2BtdDS+GjHthHLkzxHnq2xR?=
 =?us-ascii?Q?DgGcIEE4aftQNgHBdx4tAS5CojU7Chm5jGc6rJeHiuDNXX7RamBYPdZFBXlz?=
 =?us-ascii?Q?+lcS9K5BwOIqIbI0BEoQynjHveBhvgnrE1/BNV74PAbYZ0tjeO4SOC0QN2/c?=
 =?us-ascii?Q?ua02JUCeV0yQbrIae7k8oyhYnA2s0LIRyQu32zmvuxPCD8mOv1wfA8TeKETg?=
 =?us-ascii?Q?s5un8SIl4RBLL4j7zb7UrT6X6Gao904ADeFJFAUEAVxbL9PE6sbQ5IjNRS8P?=
 =?us-ascii?Q?oH3aEPFprfQ1TyGiuZ1X+qMYM+moLeYD+exx4sGwKeNmlGq1wZUlvR7lFZYE?=
 =?us-ascii?Q?tXTIJRIEGtc/LfhR4KMSTwLuBhak463UPBjsZbOBmfILjvZ+5t4Y7jmgNdWG?=
 =?us-ascii?Q?d1FErhvl/yEXdZdcozypLpA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a9738f-9c2d-4c8d-17ce-08de33465f1d
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:04:07.2878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20HJhD6bKVndeg+Xd528M9sox571e1LOYdOySL0iT7uk/puwjJl/UmqBcM8iU2TRbYQXx5747dHm8DU77mFkE+18Sl7eLPfzQGLy/CjOtOa0DQ8jHroK/2HTmZ7xKRPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB3697
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
