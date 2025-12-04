Received: from mail-edgeka27.fraunhofer.de (mail-edgeka27.fraunhofer.de [153.96.1.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9502034104D
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859157; cv=fail; b=IsKPMpx9NDWdZ2RqlP/jkVGzFGYjPQXBh0dwhembumbYcuUMTW3z48VixNlG45ZuAUB1I5uScB+YX+jUAu6MlXekwj4Ev5skwOgfqPS9EYt8W4xpDc+YbDu6/OjghtLfuw4gZXBwFcGSVihzjt1EpzQxJQD8X4/aPdu1z7CRszs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859157; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=meT/bHz3st7Zk5v1bFeqBpjkc4UpsgddYTcXXC7GicbniFj/bvMZBPZgrqibDJuacmOcGC4bnMAI2lNOgTy3vdsg60LWzsXE/Djx6olLZDwtN6lzmTreVkzLjLyHpO5oDWHPfXILjgYi5/+ORf64m19UWpC6czTdRW1STS2ZJpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=nq7Lf3ik; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=WR3kkl6R; arc=fail smtp.client-ip=153.96.1.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="nq7Lf3ik";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="WR3kkl6R"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859154; x=1796395154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=nq7Lf3ik9ox4ckLHVuWRDuz+nFDBM/xEXFXYfwgC6TEX6gnUA74jeGsQ
   31bDHmKQshY0zK9z7gjtW749N1HXLuvBKuUEOBOt1H0tsmULrXit9cxQj
   6KExWy7xJyvyVZU78zHlGwjue6GjtLDbLzV68Ra0xDl5Lc3+hGj+nPJut
   uSt1Gj816byIKlmPYIaL+a2wbagoKvmFaR92HA0z6h1UV3ng7CnrefrCD
   tQHbBrXy5+eDE9t2ATiGzcUiMCYCoM5RBbRLrr3Tx0D0SQyFqDAW9fygL
   Us9Odb7JVO5Y5c06UptLth9Klyzaw1T7ByCs3JDRyUza7hrRun4ODK+Em
   w==;
X-CSE-ConnectionGUID: oBHk3SZVQK2+1lYs5HUojQ==
X-CSE-MsgGUID: u5kHFpWyQJW7NQ7ZdLMTww==
Authentication-Results: mail-edgeka27.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BABMVK1o/9maZsBaglyCQEABgiWzOIJQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMJyc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwg?=
 =?us-ascii?q?mQBhHxwhHc2gVVEgUqCdT6EWDiFd4M8kmqHc0gKeBwDWSwBVRMNCgsHBYEgQ?=
 =?us-ascii?q?wM1DAsuFSNLBS0dgSd5hBWEHytPghtygXVBGT+DUx4Gaw8GgRUZSQICAgUCQ?=
 =?us-ascii?q?z6BcQYeBh8SAgMBAgKBEBACbkADCxgNSBEsNxQbRG4Hk3eddgGvazQHgjiBZ?=
 =?us-ascii?q?4FeBgyfZxozg3EBk26TC5kGqRYCBAIEBQIQCIF+ggAzGiSDNlIZD5IhujF3A?=
 =?us-ascii?q?joCBwsBAQMJkh6BSwEB?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: 9a23:LmAOXmFFzfqekJ7qqmJg3m4XQfsXTET+ljSJJ36jVEZUT7+sHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ayul7dg7iNqE1UulJpAQISrWCxox1vqeOJlgygKw?=
 =?us-ascii?q?khJaiDHNCNxO4sCuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="24467017"
Received: from mail-mtamuc217.fraunhofer.de ([192.102.154.217])
  by mail-edgeka27.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:38:02 +0100
X-CSE-ConnectionGUID: ZQbtXh30QzSwUxQogbvqFg==
X-CSE-MsgGUID: dyh4D9k5Siu/caZY+jv8Tg==
IronPort-SDR: 69319cc9_600igU1tVZ7HGX8TAACEv2BQudjITFp7m7VP7HEkLdkkVhy
 3saeadnOJmnt9atUzVdO24/0GJd5j2AMAOm4Wmg==
X-IPAS-Result: =?us-ascii?q?A0CDBQC1mzFp/3+zYZlagS6BK4FuUkABgSYuW4ghAQGFL?=
 =?us-ascii?q?KVrgSuBJQNXDwEDAQEBAQEIAVEEAQGFBwKMZyc2Bw4BAgEBAgEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBNwEPC0YxJ?=
 =?us-ascii?q?QYOBSKCYIIlBBIDNgICAqYfAYFAAoxXgQGCDAEBBgQE2yQYY4FkCQkBgUGDf?=
 =?us-ascii?q?IFygmUBhH1xhHg2gVVEgUqCdT6FEIV3gzSIRZEUSAp4HANZLAFVEw0KCwcFg?=
 =?us-ascii?q?SBDAzUMCyoVI0sFLR2BIyEdFxNgPRdAg0kYBmcPBoERGUkCAgIFAkA6gWYGH?=
 =?us-ascii?q?AYcEgIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57JwMLGA1IESw3FBtEbgeUH?=
 =?us-ascii?q?U+cegGvazQHgjiBZ4FeBgyfZxozg3EBk26TC5kGqRUCBAIEBQIQAQEGgW8LK?=
 =?us-ascii?q?oFZMxokgzZPAxkPkiG8ZUQzAjoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:iDvBQxfZnmAaYqQr/vbhS+NXlGM+4t/LVj580XJao6wbK/fr9sH4J
 0Wa/vVk1gKXDs3QvuhJj+PGvqynQ2EE6IaMvCNnEtRAAhEfgNgQnwsuDdTDDkv+LfXwaDc9E
 tgEX1hgrDmgZFNYHMv1e1rI+Di89zcPHBX4OwdvY+PzH4/ZlcOs0O6uvpbUZlYt5nK9NJ1oK
 xDkgQzNu5stnIFgJ60tmD7EuWBBdOkT5E86DlWVgxv6+oKM7YZuoQFxnt9kycNaSqT9efYIC
 JljSRk2OGA84sLm8CLOSweC/FIweWUbmRkbZmqN5hGvZLPUqCrnneNxwy+4IeLPfJ1veSafv
 rlxeCT2lgEsbxUi8FzOi8JSiqlXv0fywn43ydvrWtqWN/4gRLzyZvIEQTVZVZ1gEGt/PcCjM
 otTCdUiNt5mk8rwrEZfpBCcGwaWAcnK+w8RiHXR1q828+Q5Ox342BAMAfwUmkXVrMusH64ga
 cDp1rn1jg7Nc+ta8AmgxZH0IjQYkNCqcrJKUeXyxnkvFwDCllaWmda1OCyp/P5SokapzvpJS
 OOjkkh8kCxYmTjzysh9qorEn4NN11fm2ztH5ZYcOv+HFGF7XtHxQ9NA8iCAMI1uRdk+Bntlo
 zs+1ugesIWgL0Diqbwizh/bLvmbeq21yUi6C6CfOz5lgnJidr+lwRq/ogCsyez5A9G9y00C7
 jFEnd/Fqm0X2lTN59KGRPpw8gbp2TuG2w3JrOARCU4unLfdK5kvz6R2kZwWsE/ZGTTxllmwh
 6iTHng=
IronPort-Data: A9a23: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
 Q==
IronPort-HdrOrdr: A9a23:sLi1966Op6ge1WiLSwPXwDbXdLJyesId70hD6qkRc203TiT7//
 rFoB1/73LJYVkqNE3I9eruBEDjexLhHPdOiOF7AV7IZmnbUQWTQr1K3M/L2D3qE2nS6vVU3q
 JtX6x3CNi1MENzh8T3+ym0euxQpOWvweSBnufUxzNKVgFla6Zp8gd/BEKyC1RyRANPGJo+E/
 Onl696jgvlUW8WZcz+IGIEUejFr8DKk5yjWhIPAhpP0njtsQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3A+o0qv2gzor+NOvneE3OV/rjuajJuQETX0EfQeBe?=
 =?us-ascii?q?BG112da2sTlCa5rpKnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1AxzHg6ma3y4UoQlAvx5vO6Txoxk8qTyJBEOzK4?=
 =?us-ascii?q?Hpo6PPB5BeDWD3Ai4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="32625303"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC217.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:38:00 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:37:59 +0100
Received: from FR6P281CU001.outbound.protection.outlook.com (40.93.78.5) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:37:59 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDCKFzlcX5x8DtNZ4MOF2LP5QLTnrGXDI/RvkUH2Wme9CN+ELJI/GHyEqcNseNdxiWJ0/IECmY50Tr7G/0XPU5RKCkB+OEa0ZmsmN/jJHxElId9itfyLyNO4Me66zh+F+FMYx21s34NA3MXqo9ze5TjzR9MtBdkE7geJWZYun2OEuqBmTAEipsJoUZQqUe82a9tq8nAeZk6T84jLI/+zukM4OMW7OoeURuIimkorPj88hXU66v4LBBcmcHZ8GErWEBvjhRA6rCqzOejoLJQdCQ4FHIz7zjhsnQKgSMxCD0jevlmROcAW7jRK28LZ/XRgVNG2ERvaUsBO2u66oVOqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=xO2uw+ras5LYcqkSiIQ3wVdV4BHfwDknE0lwy4omWJ9OUvsUSn9rHoTk/xFkXqodOq/68dP09rL3q9+LyUGWDZrNNaaKU8e0UYuLMfczxgJOPz3pd1EiTVrq+rkgT6nDOpsJ9Q1U/vvWXg8XUFdQXHwyo6tKh1U24fC14nCKktE+ok+HmTBupZ3ijawzRtXyv4ATOmnpCMXT3ndw+oghyhAYKA6VLFK8wlhR1ca1AjZyAYfTkofmYX50Kv3ftKxfhWom9JRvml5KPwkP97u2qoynQr93aW/sPRVqcAoeLeddk3sBs1kBDd2Srcw1wXNbcZVwJWdOTijGad8Eygl2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=WR3kkl6RwGsIvl7pc3Y//VW+w5h4nWKcPVT+ecu9acJvgRmBMYX1fbOcjdHhpBtVltDvFrBYihv1CaZPH4rxU+SftpdAV5EqT8LQYINGhRHGKgXhhkopknX28owTBr7yFZIxAuidqN3SEASh4dg9Hkeqi0uoJFvVMxAwJW4GhWg=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR6P281MB5042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:176::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 14:37:58 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:37:58 +0000
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
	<tmgross@umich.edu>, <vbabka@suse.cz>, <x86@kernel.org>, Andreas Korb
	<andreas.korb@aisec.fraunhofer.de>
Subject: Re: [PATCH v23 04/28] riscv: zicfiss / zicfilp extension csr and bit definitions
Date: Thu,  4 Dec 2025 15:37:48 +0100
Message-ID: <20251204143748.8748-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-4-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-4-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::19) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR6P281MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8d267a-89ed-4385-31ac-08de3342b808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jw2yDzJQt14luTo4tYG4pkLeyWiIJwWZoBgP84sxp8f1eB9GSFSFxzs/tQCA?=
 =?us-ascii?Q?oA85AnTR/DOd2LD9S/sBqTSKFLKNr7CZAE0JJQGEqIj17RUSe8hk6fj7ExbX?=
 =?us-ascii?Q?+H/KcBDPguCMDwEa0EldVBCuU7o4nFN6mX0sHx8pN+DaeB892jr5d7p0QOKy?=
 =?us-ascii?Q?W1mtN7XYpd+l8TG9OgMlYF/vhr9lpKYRhJunrtC+umyWaNVoMJg0/7bU6V/J?=
 =?us-ascii?Q?q32yfglhjE4nev1Tyti4BcVx92SjE9cbN3jSaBFCTJ5FSysx2NQBPnc5uhSe?=
 =?us-ascii?Q?ZsobnsI4y5ypqKZ8fHeGwv+OJwWEcb0cQP2hbjyso1Bpx+CFo5gXhN75wfhF?=
 =?us-ascii?Q?ixbfOw6zq++gy++rF93M4ZaPixv25TBhTvYaGusOgtWuRJnyuLgoKDPUka3r?=
 =?us-ascii?Q?NjRRTsaf3y6H+zL/zDffI1apDhZR0o+CU3l+O04Xtu9SJGLk/NG0e8v3yVV1?=
 =?us-ascii?Q?sI8CDRFU649L4nKsa45FmaZZW5PV6bce8i33+hMszq6d8J1KohTJ3in/y/ao?=
 =?us-ascii?Q?vLhcVx6k/SQvYWbFJ7CxMHWx1rumkqvh3D6lCrdyQ/TY/Ruosz0Bb7DqJFSu?=
 =?us-ascii?Q?fVk1/Mr9/+qfNWH4nMsHSlgc3NXHDcx7mjLohay733Al+GjhKaD15c8nx6uM?=
 =?us-ascii?Q?n3R+HsnP4mki73MxgekzFklnSVYnDTrYW4OuIotgKwgnv1ndxG5XyHBh1SAv?=
 =?us-ascii?Q?wyfHYOC//jaR6/tuKX7z7+qifODVZgYErKs1lSAvshuEBZqYvkJV8pw1xAfp?=
 =?us-ascii?Q?Xov/hH8neQh3UWhva+eL+TgV1o9lZswko0cBxv4tOcBci0muKJDTWXBOUdw1?=
 =?us-ascii?Q?gctbP1HLMw34jtr32vT7+FSOnbL18fUfqKXoVXRAueQd3aQyZlJiwL9MM5ie?=
 =?us-ascii?Q?QEpySapCniRIvIIYz6EVRiNL5D+dH5DVdQ3a15vJhSHLVfbUZVGZUt1BmyWA?=
 =?us-ascii?Q?ycF7eIPXXVIHQEs7NArvoPY9nTaAC2dQUWDBD/j55Vilvl4gkjCGFSCu6bPn?=
 =?us-ascii?Q?QxX/RovWMkkv/0XnLhT9yerme4FLATk4GEcGWPZ9x6J3gpF5mf0t+RXoSxrw?=
 =?us-ascii?Q?BWct/5ju86z/M4sg1Oh/SyUso9kOw2b5SkTs2rewgMLskp51RbzEq0hbFB3E?=
 =?us-ascii?Q?AkSiKcqFG+lsU/uKkjkTcrBV7VmnIgmRoELX893GPs9NVbMirNlPzcEE175h?=
 =?us-ascii?Q?ESVva81p5ImrgxmjbeWOaZ0KhEJC/H6TpqmQH+/nMQaNGDZLL4aRxGvXPby6?=
 =?us-ascii?Q?8F2fAMsdkytY2gHkgz6YFz5UWNrL+LbaD0dYfgPHFDj/YDFmaukzZMB5Sopg?=
 =?us-ascii?Q?ujHIRRwy3/miYmdLFrMlcJC/uQiE6wgmjvyY6Ci2oEvS5mrqdtAKWClTlCJ/?=
 =?us-ascii?Q?vFQKE7psVwCpVe8gmO9eZL9mV24tJYddddkdFn1JcOvOAEieS4MimCEoq8Mx?=
 =?us-ascii?Q?49I0I6KGBWjQMAemg133XPyi2bJqt1fD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WdZ0iAn/QZNShqng+ZnoMOXdQaj3RLXk6bx1fD47lpfyNyz7Gs8GD4xrK1tN?=
 =?us-ascii?Q?ZOoJbI7eCZq29dZ2KDv1CeZIWWxSkJFlLr4Bw9jYpI/2WMyv1JMMX6Ijel0y?=
 =?us-ascii?Q?xAFTj94BRFSyLEyS411WfFh+CAvSZNk6viCjf2H5dAI5xluvVYJoy3uhwCFI?=
 =?us-ascii?Q?oNWBb3VBFwireE/apdrZ30/IpbsKKRMkkh7GZKIDQ1KuHdVr2Bzm1/Z7RBeI?=
 =?us-ascii?Q?WrRIs0ptcO5fhPx3sgcujXsbMzoqXtVwm3iOFdl+OavocZzDXYSHP3mbaQIN?=
 =?us-ascii?Q?NMKLYIYgmq781IO8akmnhf2cRjG/pzOdLm+P/kGVJ4kx/o2neWnAyGSflFt+?=
 =?us-ascii?Q?7rw2tgjHUYD6lc94UL84C3WyZLK/jvKKJbrNX4qzO/HZJg2qHTNHim0QOcWV?=
 =?us-ascii?Q?JPi3OFrw2Xra1KORvbK54fGUI7Ok2/d7nmIsQK1pX3uYl5JarKQy9h7gDlpF?=
 =?us-ascii?Q?vrX44n09y0biiACeEH5qs2DPGwD0QopYzdxKymRs02Vu1UMkBX43CbdX9fEV?=
 =?us-ascii?Q?jHXASmqwZ3GKpl11UTEuWawkHKCxZkJw2oBGDjBWfXChTzfBGtd2Z83ldi+e?=
 =?us-ascii?Q?glflomg68B4PXc+oUHS/upVdma+PL76deGTCfgeDOviQEZUhpau2ZgTPKxN9?=
 =?us-ascii?Q?Xxl5F4/u3wSuFJGpz8wvVjaRRGsUWhwrhBPFApCj7Z8HcTKLgAnwSZeUOM4X?=
 =?us-ascii?Q?mkEPm7DPlpqMY9grTRs0Z5z1YqmNZGG+hUJCglQUXtCvOzYyQDfVCEbDOLFX?=
 =?us-ascii?Q?AtClkraMeKM3zv4wYKXOyFd/M0HLKqlkp+8+Avd+7/bNyghpHQAEXrDY54Uq?=
 =?us-ascii?Q?Fugatf9lyjSjptU1btnGR03ovmM6MNE0blt6K8J3MXCxVAnICRqgU4rdBLWp?=
 =?us-ascii?Q?4I3BfgdZStgKd5IspHcUj+/KqdrJvk9zqfi7QO98f5XGXp9epwbS82z2TQyR?=
 =?us-ascii?Q?DnTnLDv6rKwXN7HKyQmbZQbA6NGtFOwkfyqetHgTgCivbb0v/tVzY8ZnvN1V?=
 =?us-ascii?Q?zm0nmPuqYQtN0xzF60So55s9VgFcWKLDklDalAYJsfpRVIBcduTxcrCReMLZ?=
 =?us-ascii?Q?q1vxeLP88OhRsIH3nIlgRG/vJ+jAiR4aAcLOFw95eKAxreAfejqhofbyBpKz?=
 =?us-ascii?Q?AIgdWvAa253fGL37vLgukLGS1LY7Pv7zHfL8rNbsU4YVo8XqK2AiEDViXSc6?=
 =?us-ascii?Q?QiwZ0oS+6ebS0+43rX7HJLlWO7Gqq4Y8c54qT55SkAV79zzuKyB7LLjGnk/C?=
 =?us-ascii?Q?U7GoU6R52ZA6tWmHUEtyH0lJed+otZ4/VIdNsz93nbsCMQYMyo+jGNInvZW2?=
 =?us-ascii?Q?oPSAfpgnAKDM74590bnRZFgldE2vztZ4+EKE6LW/p9ECWnwC58uLBxhZEfgr?=
 =?us-ascii?Q?mX72hHYaQtd0k15IHAVg2UIQTQR0Ez6/kEuo8XTbJQRI7+GZAXN0s5T5vsDS?=
 =?us-ascii?Q?0MgMpq43cRfpob6hgDFYwM0zFB56mc0wq6KIBqZjvktAvJikyq7uEWZxQB1u?=
 =?us-ascii?Q?T3UusOTfkqLWYrg+F9ajga1JJQ8ynm+BMgl5ed+KVZgi9zJ4oDMFQq/yASKa?=
 =?us-ascii?Q?zVLbJcXNkASC36YanfTQXrqcaLytVGVQXuhMfGGZGhkeeqoNRqcPoQAXmuTW?=
 =?us-ascii?Q?ZMrwvl1PVZ0Q7ZTMytQvfck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8d267a-89ed-4385-31ac-08de3342b808
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:37:58.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgZ2/0z50igoOvwbs1MYGmnZyL8vsCsCf6KEUWdJWGNsXkhCzgQGeXZz21LxnDybiPtawkoezwgwmD2qbZv1ur7Cu+/z2wjkRrKrZS9rQ5nz/UmE2BWqLDVdoiyeU2U7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB5042
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
