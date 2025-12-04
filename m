Received: from mail-edgeka30.fraunhofer.de (mail-edgeka30.fraunhofer.de [153.96.1.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647F2D739C
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860697; cv=fail; b=Uy25u5TRXLAoi8yPVx92IiA/Dt3D1Pe3QZdeRMKl1792mYjT8mLwT9m6b2w/19mmh1yMQZoNGiZ6lCkd3ywqzpKsg5hs7BRqVPy7Vo13mtlM6Y3PGBLOKCfp6MYO0iHoloeLLITBJnG1u1QIHcycvQuY/M4FygBfKNiko99gaYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860697; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uRF6EZvn7AwZDrol/6EEmbuq7vt1+kCaDdcOfD6PUgQCZJsDL/FUILw1RuOtkpBayeWjo4GBSpHiFOztld/Uar1Jse+RTJ7/669BpC6hWwX3dFybnle6nqDPLbS70PnePQFDFDm5AcBJ58uB1jAx/65TaHpgb3Hn7fZ20o7GHRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=J4acL9eA; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=ETl+zjso; arc=fail smtp.client-ip=153.96.1.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="J4acL9eA";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="ETl+zjso"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860694; x=1796396694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=J4acL9eAGmf1NawEhGWYREmkre1sSzM6lr5NQDiY1HzMF1LXPdpOSTGz
   lHZOgPNtFP9c/Ue1ZjeABrzNEaJUx4TFkQvuUsTPnk5ck1tdeMrHRWRkY
   2r25U5/W0h0x9mT6nzMZLbpUoO2CtRCLoKgxgxZZEsru92Qkl6s+TK8+C
   1bViz0Uj5hz8CJWrQ8eZnXKPIP3Qi4Bz8CWg4EtTeMFFku8HGyWUekIBP
   djpIh0ABVcIf2qD0WHdnLsxcAfuBKdoC/Hpum7rn4FMAcXu2yZem7+Abq
   YuYt+VWZ9OXzk1w/YHyheO2OoZyWQgR7BQZNWHO4MZ6hSqHNCF+AaIwmp
   w==;
X-CSE-ConnectionGUID: 1vG944O1TeKVNLvcrFeNrQ==
X-CSE-MsgGUID: 0tFEqSNUQfideybVvIJXnw==
Authentication-Results: mail-edgeka30.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BAA4Va1o/22jZsBaglyCQEABgiWzOIJQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMJyc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwg?=
 =?us-ascii?q?mQBhHxwhHc2gVVEgUqCdT6EWDiFd4M8ml1ICngcA1ksAVUTDQoLBwWBIEMDN?=
 =?us-ascii?q?QwLLhUjDzwFLR2BJ3mEFYQfK0+CG3KBdUEZP4NTHgZrDwaBFRlJAgICBQJDP?=
 =?us-ascii?q?oFxBh4GHxICAwECAoEQEAJuQAMLGA1IESw3FBtEbgeTd4clllEBr2s0B4I4g?=
 =?us-ascii?q?WeBXgYMn2caM4NxAZNukwuZBqkWAgQCBAUCEAiBfoIAMxokgzZSGQ+OX4NCu?=
 =?us-ascii?q?iV3AjoCBwsBAQMJkh6BSwEB?=
IronPort-PHdr: A9a23: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
 hzIFzs5q3yBHqHYExPZ40Bjx08=
X-Talos-CUID: 9a23:Rlx3gGNe1Is0Ue5DATdIpRJIPZkZf17j6lPOKFWWBEBzcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AMWwjDA9sJgvrdZR5dRsgvweQf590zYm3M2YwqJs?=
 =?us-ascii?q?Ht8SVPxJuGhWtiiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="26280292"
Received: from mail-mtabi109.fraunhofer.de ([192.102.163.109])
  by mail-edgeka30.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 16:04:48 +0100
X-CSE-ConnectionGUID: y0gL+fKdSdeSTZWFD5W0LQ==
X-CSE-MsgGUID: H+FN9FMQQgqZUNky1IE04A==
IronPort-SDR: 6931a30f_DXQ0OPZYuF8arSZOFMCFHI8ULrM2prXdFvH17eDoAFAV/yF
 gDvp4slSDbu1vRT29YbdOmGioAVc/7pTyGLiYAA==
X-IPAS-Result: =?us-ascii?q?A0BABQBMVK1o/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCYnNwYOAQIBAQIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBAxIgAQ0BATcBD?=
 =?us-ascii?q?wtGMSUGDgUigmCCJQQSAzUCAgKtNgGBQAKMV4EBggwBAQYEBNshGGOBZAkJA?=
 =?us-ascii?q?YE/g3yBcIJkAYR8cIR3NoFVRIFKgnU+hRCFd4M8ml1ICngcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBIEMDNQwLLhUjDzwFLR2BJ3mEFYQfK0+CG3KBdUEZP4NTHgZrDwaBFRlJA?=
 =?us-ascii?q?gICBQJDPoFxBh4GHxICAwECAoEQEAJuQAMLGA1IESw3FBtEbgeTd4clllEBr?=
 =?us-ascii?q?2s0B4I4gWeBXgYMn2caM4NxAZNukwuZBqkWAgQCBAUCEAEBBoF+JoFZMxokg?=
 =?us-ascii?q?zZPAxkPjiE+g0K6MUQzAjoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:09FirBIPSH8M29z4TNmcuDdnWUAX0o4cQyYLv8N0w7sbaL+quo/iN
 RaCu6YlhwrTUIHS+/9IzPDbt6nwVGBThPTJvCUMapVRUR8Ch8gM2QsmBc+OE0rgK/D2KSc9G
 ZcKTwp+8nW2OlRSApy7aUfbv3uy6jAfAFD4Mw90Lf7yAYnck4G80OXhnv+bY1Bmnj24M597M
 BjklhjbtMQdndlHJ70qwxTE51pkKc9Rw39lI07Wowfk65WV3btOthpdoekg8MgSYeDfROEVX
 bdYBTIpPiUO6cvnuAPqYSCP63AfAQB02hBIVjLhyQv7Q7z4vjD8lPZS4Ri3Zu3kcOEqQwSZ8
 blNY0fDkyc6Lj830mfchtMl38c56Bj0iiB7gJzWe4bSJqdbcpPBIu0GQGFKfMtteHNYAYDmc
 MgWBLsaet9HsY++5FQDrTCcBleMXL/1xDFFm2/7wL86z+sYLT3d3lMBHusPvnDfj4zOMftPY
 +PsnanHwTKbbNd9gTT22rPsbwIeptGre5FUMuX30hkzGTH/jg+Oj6fpbiLI3+dTvlCd8OUjc
 9qWm1c5sw0vgTeX5twtl8rOgt0Ylkrd+Qd/xaMUOMO7HR0zcZulCpxWryaAK85sT9g/R309o
 C8h0e5uUf+TeSELzNEi2xf1SqXfIs6G+Bv+UuaWLzpiwn5oK/qzhBe3pFCp0fa0FtK131BDs
 jdfn5HSu2oM2R3e5onPSvZ08kq7nzfa/w7J4/xCIUc6mLCdLJgkw7UqkYEUv1iFFSjz8Hg=
IronPort-Data: A9a23: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
 BmWBIf6NRjAYA==
IronPort-HdrOrdr: A9a23:EHh6i6mSesqUuSYHWo3AycWBvk/pDfIk3DAbv31ZSRFFG/Fw9v
 rCoB1/73SftN9/YgBCpTn+AtjkfZqxz/FICOoqTNWftWvd2FdARbsKhbcKqAeAJ8SRzIBgPT
 0JScRD4dTLfDxHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3A+gtZ5WrZ/FwEv8AWAtUfk1fmUdF9fVmewlTcGEO?=
 =?us-ascii?q?1Mlpbd5O5FGDI3Joxxg=3D=3D?=
X-Talos-MUID: 9a23:LWfToAZlKyab8+BTl3zComBMEf5R7L2cNWYOgMwnlpHYHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="41528299"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaBI109.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:04:47 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:04:46 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.2) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:04:46 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4XCWSg7yeM5Hy+taQTZ8UK7GonH0PgCa33BNNfX+mcCoPF5wcfaEyxIGuYdyTTeoGJon7I2lPg1dDqL5VT6nuT0NhFEi/8mS3g8l5GKA/SyNFYXI0boEVmR6vaKqiqblQqoo9r2xJio2tRAP+IqqbvOyP9XFAbpdnVwcMcaxyInd5EVPY8ta25GvJ5HYHRCADOnbiWupsttVvwA120z0ZreWcxsNd2doXKZg4GhwNPT4wQO90DojO7EKr45w65hxSYgWbVN9umFgQdR2tLa+0b7kFp7JfvQzdNoUkO0fPyy6549w7VNCCwdS0uTQje9rrfMkJ21lrQfpQvRDRo+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=abgWzd17IEK6/wHJLhFhx/h61fwOFyLTrQB0fLNk40J93XAkCppzPTdBx+4hdldFhhKiF49z36mlY1abLps8O6bxnMRTux3/yggojbRvfto6akolZWD3mRixidV3PDySe59u2/HBkz7YpKOoea5HdA3a5YTE383sGpuQ8O1kNqOfdAKEwH1Xd3fEPaJy4XCda7UauGNhLfoey212Bm7jAQt1wHhXTXki1ojunsS3Sj5vXnQs1ChVwuKDcWshzuYGBLENybiFd5qTnCVhueXfSZaTxfaCXn9r81MEqVCcaQJ7IXd3dAEZ3tlkFRH4qWOjtdv5tW8Iwm4Tn6LwDDLL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=ETl+zjso/z5MdXt7VtmccJeTG7qkk2w+qc9s/Qwvn++gehCJk6H04rffeuxeuzhtgQTTsj7IiQiflcK1Sm45Zk19hgdo0kLC0kcZSLuzWoHONKL+GNs8tfZRh2vNCd9y5ak6ePnwg+NPQxQvpd6KgPHsiu+ol7e4rqdJnmMIuvk=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BE3P281MB5007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:cc::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 15:04:45 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:04:45 +0000
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
Subject: Re: [PATCH v23 25/28] riscv: create a config for shadow stack and landing pad instr support
Date: Thu,  4 Dec 2025 16:04:36 +0100
Message-ID: <20251204150436.15230-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-25-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-25-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BE3P281MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be69b55-022e-404e-0b48-08de3346753c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eO5+3d7AQGUKmuof4ROn+zjA5B9Mu6G5Gfj4ZGBRrDdU7XP6DfZ1gNQyJOdM?=
 =?us-ascii?Q?rFNk1jtneA+zsYjtcRL2L8uDkk56XiHH/YhX9kwkkTgdfmlFP2B9IN8Sw22g?=
 =?us-ascii?Q?hyzgYXR9pyvYGyTz/CtkYY7V4uuACd/2nGwjugxG71Uwh3huKXP3RgNQDKrr?=
 =?us-ascii?Q?Q8n25CY7l1VXh0KZz+HPNvrPGa0zXDsCBvu4C+97yoovFQO9PjqwPWwLaxbD?=
 =?us-ascii?Q?UucHKBmxIrAGu7RiDTFiwqdb2SltFFDJRqfqalxsQ6rJLS3ha+ylaehhH7bx?=
 =?us-ascii?Q?zGzzDI553KTLqTL+XYnv3/ctpPiEhV/lKloZrVFjyvWTuzhUy37cb0aZhjYz?=
 =?us-ascii?Q?eofkW6JWEg/hnPCRfbsyUr0QgPROxfs2nnsDSnUi+Gh/+X/2wjWMawhGBrT+?=
 =?us-ascii?Q?HBrvxCBwm8MnUQ7TWilUkbYKzb4s4sJVWhWOGYfo76s2SAp9F8oWtXDr/vny?=
 =?us-ascii?Q?DTb+ILGP0Ev6XiLsHx8nKnzJmzFOIMe/XM6vmN8eWbTI8GGaxfT9fGD/kcYR?=
 =?us-ascii?Q?rJ254sG7kx2auA0tip+2CXOAeKs6nd9hoflD8XPo5PqMddCnjnY6DhLLskTU?=
 =?us-ascii?Q?BnHQLgiwSHcF7bu3aTL8L58M9AHnjK3+z8JMFWk/0Nb+X3TPDnyP/evsg3FD?=
 =?us-ascii?Q?aRNJ9IyFSNexcPGj/YslS0O3d+eHW4Z1hDzj/aGRXBe7aH3YkpTrotPjsFRk?=
 =?us-ascii?Q?WUKGtgfIyOTfVUA9FmGsYuEsDX7i6UQvirWlRnzSciBlGaQwrGxFDg4skMIh?=
 =?us-ascii?Q?uB7ICw7aUc3pkXleG8DPP5MxdGCp8NOUUgOQfX17XAMxSoxoRM5lZADvB1AR?=
 =?us-ascii?Q?54XEhf8SrpNiSrp0fRbRCFN0/eaXEM2zobMyUi4+TA5hJXhO1jle/5fVr0eH?=
 =?us-ascii?Q?FbVBHWX5THiApQ8W7xAyqVH03H2cVJg9p9uykTjN+wVtNKd2yAI/kyecL2wy?=
 =?us-ascii?Q?UpR4tjqj24v6ncAtx+Wv1OQxtlJWaQjIOmrgiRAyPg1TPNTDF/fTT02x44e1?=
 =?us-ascii?Q?FD+BeNTPyymKljUR5XXOi2iQu9ZBp1edWwJlqV2r1esX0z1CbOH+ogm+uudP?=
 =?us-ascii?Q?V/F1HXds4s2gbcO1ARKAvGFuOqd53wWfpCZFw/Axd5kfkUVfFwQoeaDZsEdt?=
 =?us-ascii?Q?AGcuOPZJMBs0/2W1zztxwyY7ipQRdxCrEbdEdMr+A74HqD03I+AW9aQMzYL7?=
 =?us-ascii?Q?iEnAIkE/d1Uj+9QKnXzvqOgaNJNtxngGD1oreFGEhBhEKxrtcjlsgbHEnXBu?=
 =?us-ascii?Q?Na5L9BhGOmAw8ee3U5yDAXBgg3mRYZtagx7Co1kn2LkmN3hwmQmbNEbtPYZ6?=
 =?us-ascii?Q?DUCGfCnLV73BsyeWdJ7SPEuRYg2+OLI2BP5s8zIr197JDUXm7hsMxh/tcnm9?=
 =?us-ascii?Q?GEJPpWP/5DmLHLBzVXdcn8608ltq6hL5i7fz+TP2w6DZoUAwpw9wA6U1L7sp?=
 =?us-ascii?Q?H+fcYpBIOflZuwwfLOxjWjOOdFk51ev/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hz7fuc/u4mxsQw/rJ0O5a0vAA6lYWb7Xm6T5UVp30uKWV5t2pKztik9PQikP?=
 =?us-ascii?Q?jOB9aKhUlqhqhwPHiNW0juXMQ/C0AjwDEWLgxRoWWCRmOK5Ar6GMAzxjUwfZ?=
 =?us-ascii?Q?hEyR0+TyBbhJVBBrnb+CSNc3qaoB9zme95/JXDEmJgU92D+8HMRVn16i/Teu?=
 =?us-ascii?Q?ALJS5+IljbCQFBEnqUlwV+i+lfb9XPRii9uM0IM20bMs5ImfwkwXU74bIYKG?=
 =?us-ascii?Q?hA+NYfD9M3jw4maboPNTEmEpuDCLzDnlULI2Pf1Rc4Ot1nQhVvNDLmuJZ9e1?=
 =?us-ascii?Q?sbrdSpSkxjw48uQBuOJ8zij8dnUapm34P1SdH0z7+u8RaEPJHDW4J3FR0fV0?=
 =?us-ascii?Q?YQmuGlmTXkUhPjQFVAWZ/8iPL0h2OdB+Ro0My+iDpX+XNdLxMLzrpCOwSgzz?=
 =?us-ascii?Q?1h/wVey3pBgY78fT04rxZIw/dDG8+aH03l0SfSgvaf7uVvFaC5TaIX2vYNJ+?=
 =?us-ascii?Q?rqTmhFOIVM+1TqxuMvG/4eg/sRZDSvfWKvN0yP/yk8nanz/1Hijrj2QDSg+K?=
 =?us-ascii?Q?y3r2JYeP76rRsIjs/xYLnwAQyMoUng+TRxtu0NxKFz05J7HDBot6b3Vqcg8E?=
 =?us-ascii?Q?1fuIqCem+sOQjYckvxXGxiMQyOaX9mkkpci3T8/L1eSnMrvBQBPmXNbkWTkH?=
 =?us-ascii?Q?rdITHLqxuvXJYCUJ+DrR/f0tORc135+ijYCNVJBbxYplGegyB1/Zw2b+f7E0?=
 =?us-ascii?Q?LWnR+Vk+ydzCoVAql2QCJpN9l44doXm+cpS/c+TLIlbSQmQ2z1Qgqe+ZDtsl?=
 =?us-ascii?Q?XYTFaFHK6NNQ62vk8cBxlcHO65lXHakkx/wl7Iw0V880DSJYqpMxe/v6y9oq?=
 =?us-ascii?Q?9lA0RonyCaoaZMC3xb/585mH7H8iThhlV5J2BhGYy5p9xTFnEFPArtdb0PI3?=
 =?us-ascii?Q?G1yST6esBBSvYt8OiltlDLSACNJKwVQuFIO4GA2x3Ld2NwZ5rDxlRascUj1I?=
 =?us-ascii?Q?tW6i+YBJAXtAZtYf3PW28qvlfwqdhNr9ATZu9177pekz07C62b9Duoz0myOE?=
 =?us-ascii?Q?DGS47UHXk0slXXKeSKNkO2/IYNJtB1ENroSq9VkrtIw+zVpt+e5GM/LvcUkp?=
 =?us-ascii?Q?L/3sX4je77zAALACgLFROXuCobY8SmE0Vl1hsz5jZ4AY5HXOX1mIBQYtzfLj?=
 =?us-ascii?Q?w59THgIj22S8CQxZPdpI7wCtOiVpgJBqunSvTLCUrpHVWbw/Ww+2CbKvTwUT?=
 =?us-ascii?Q?ynVR4P+RVxpqJN4w+VPFvlEel67a2xh600DD4b78aZq7ehSUxzT8Xx0Q6PVV?=
 =?us-ascii?Q?65MObcrZwW9mpfAkCbBuCpHFGsSy8gUT7MOEZR1pZqndw0aglCGR6DNjZV/6?=
 =?us-ascii?Q?TID2rUzLFrRvXWJW/PB/ryPY/zA/LzBvQC9m1qhbw9MCPA8OpT2qqd/nh3KL?=
 =?us-ascii?Q?UmxqJdXg/2TB2bXmiLW5+/hgEljN6fZ5X0c89Drwmvo3TG8Jag/LZKOfzJsF?=
 =?us-ascii?Q?soN/8U3ileEps3/SSv6h51c9G9U0TmHKyEDiDh3xqb8oyp4xQBa0/MQ1hx1w?=
 =?us-ascii?Q?++N4FGphstu4X7PFnz/O886aps/C8uu2T/XhQjEHS26fR9YB81uYVDvud+qR?=
 =?us-ascii?Q?uVMQuzoyUFXNWY+wj/d/HcL/JKK0OUXLl0FylAInut62d+baG/1iLzT6rrns?=
 =?us-ascii?Q?UkKk8zykkVI4Y1g4ZbrorSU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be69b55-022e-404e-0b48-08de3346753c
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:04:44.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIU8siOArgGSLbuIxceYEMokY/QMlfODoqBn6oNbGUhGzP+NFAhP3VYl/97WQOLGofhAD9QHEE53KcAAFMoEto2B3QMa0dh7q3Sqpq/V/Xa8Fx1/zPkFLNkO+ZSv16T4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE3P281MB5007
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
