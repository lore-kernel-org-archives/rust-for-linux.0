Received: from mail-edgeka24.fraunhofer.de (mail-edgeka24.fraunhofer.de [153.96.1.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8FB274B3A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860201; cv=fail; b=s4141joIf0YUdMNFVYfpJXEgDSdGqCplq3ZZBdmxNXc7JMgTkrTMc1b3MALPByUPoDnAWiTcKHSwn0gIb1g5ktdy71i+FU7Ro+8P8zgbgSZPY2ac/lgrp4Xmo2qjKdztQ/FxAdwVwzxPJRpCe6u168+sRwsD3Iyl+lObjaCJx38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860201; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mC285CzNo7bAU6Z+NYH/erK36VlWZnrL0Y+uK9Ll4EAkau8dRhw2gpjPBTscBaBQPWGW0EPc03KSBCvtcVzyhpIDzVRn+6zixOS+GUAwjrf9dJ6x1Gq8ySZOvlpsipDU8AtjqY0t8tLApJcQeM8pH5ujU9H+fkDfXD1M9wYz7d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=zGIREmKL; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=G/Vvui3w; arc=fail smtp.client-ip=153.96.1.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="zGIREmKL";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="G/Vvui3w"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860197; x=1796396197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=zGIREmKLOiVcxlBc7rW1xVmXKEJJ6K/J2d3DYTWcNPb592YKH9yeFOJ5
   3i7l6CD7sLY92F5L7ktY8dH1cNdaSVf3MlKYF68hQqg9G+sB1wHtW4GLI
   A7iAs16xGbiXBXGK7jl8VxGY+1gsoIgvoXV0zPPhC9HbY7OGYgEm+PVVQ
   M5+/2eDqvOVpm4uanTAgG2/mKau+YV89YfMZhldhKF4ogr/rLYzcJSXII
   Z8Fio5wg/j5EIau2RtsMYV66bJoedJApg8H4v3sg8drZDLXaYNtc0q8C0
   Z5YJQUBb3tvygO53xCQbk8/PL57AYkYTvPrXoLAKTExx8kPR6jeZ6w6Gj
   Q==;
X-CSE-ConnectionGUID: IZVGuH30TUK5CKnfVT5Jtw==
X-CSE-MsgGUID: gI39vFLYTruJcIK1KhSSmg==
Authentication-Results: mail-edgeka24.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EsBAD8nzFp/9maZsBaglmCQEABgi+vCIQzgSuBJQNXD?=
 =?us-ascii?q?wEBAQEBAQEBAQgBUQQBAQMEhQACjGgnNgcOAQEBAQMBAQEBAQIFAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEGAQIBAQEECAECgR2GCUYNgluBLIEmAQEBAQEBAQEBAQEBHQI1V?=
 =?us-ascii?q?gYyAQ0BATcBDwtGMSUGDgWDAoIlBBIDNrQ3gQGCDAEBBtssGGOBZAkJAYFBg?=
 =?us-ascii?q?3yBcoJlAYR9cYR4NoFVRIFKgnU+hFg4hXeDNJlZSAp4HANZLAFVEw0KCwcFg?=
 =?us-ascii?q?SBDAzUMCyoVI0sFLR2BIyEdFxNgPRdAg0kYBmcPBoERGUkCAgIFAkA6gWYGH?=
 =?us-ascii?q?AYcEgIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57JwMLGA1IESw3FBtEbgeUH?=
 =?us-ascii?q?U+cegGvazQHgjiBZ4FeBgyfZxozg3EBk26TCy6YWKkVAgQCBAUCEAiBbwuCB?=
 =?us-ascii?q?DMaJIM2UhkPkiG8VncCOgIHCwEBAwmSHoFLAQE?=
IronPort-PHdr: A9a23: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
 V0/4TYU51XirQBLxP4uPB76Olo=
X-Talos-CUID: 9a23:GnD8K26Vl9PRPYGScNss1XwqNd0FKSXh8VSNCGy+B1hVFZ+JVgrF
X-Talos-MUID: 9a23:xkNDAwTSc6urc0seRXTjpWozKulM0pi0FWIGsLZfmMm/Dil/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="35872304"
Received: from mail-mtamuc217.fraunhofer.de ([192.102.154.217])
  by mail-edgeka24.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:56:32 +0100
X-CSE-ConnectionGUID: rvYMRTpjTnaAuiD2Nav9DA==
X-CSE-MsgGUID: JfoTTL5TTVG+c8/TiVV/Uw==
IronPort-SDR: 6931a11e_qr5GGKg5klTTAb4eirj0aGm4xAYgsfRxNjoofjY2Fs0UujJ
 oPnf2dUp6a9g6pl5N3c/hj6AsNnRbPQpRHs1TMw==
X-IPAS-Result: =?us-ascii?q?A0CEBQB0oDFp/3+zYZlagS6BK4FuUkABgSYuW4ghAQGFL?=
 =?us-ascii?q?KE4hDOBK4ElA1cPAQMBAQEBAQgBUQQBAYUHAoxnJzYHDgECAQECAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBAQYFgQ4Thk8NhlsCAQMSIAENAQE3AQ8LR?=
 =?us-ascii?q?jElBg4FIoJggiUEEgM2AgICphkBgUACjFeBAYIMAQEGBATbJBhjgWQJCQGBQ?=
 =?us-ascii?q?YN8gXKCZQGEfXGEeDaBVUSBSoJ1PoUQhXeDNJlZSAp4HANZLAFVEw0KCwcFg?=
 =?us-ascii?q?SBDAzUMCyoVI0sFLR2BIyEdFxNgPRdAg0kYBmcPBoERGUkCAgIFAkA6gWYGH?=
 =?us-ascii?q?AYcEgIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57JwMLGA1IESw3FBtEbgeUH?=
 =?us-ascii?q?U+cegGvazQHgjiBZ4FeBgyfZxozg3EBk26TCy6YWKkVAgQCBAUCEAEBBoFvC?=
 =?us-ascii?q?yqBWTMaJIM2TwMZD5IhvEtEMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:IdSlyRDDNXVjFo8ZoT4iUyQUP0IY04WdBeZowoRy0uEGe/G55J2nJ
 0zWv6gz3xfCCJ/W7/tUhuaRqa3kUHwN7cXk0jgOJZJWXgIDicIYkhZmB8iACEbhK+XtYTB8F
 8NHBxd+qmq2NUVeBMHkPRjcuHSv6z4VFBjlcA1zI+X+AInJiMqrkuu1/s62AU1I0RSnZrYgA
 ByqoFfqq8MUjIB+eIM80QDArXYNWsgE7mRuOV+Vg1PA99+9rrtC1gkVhf877M9HV/fKOoEDC
 JFIBzQvNW84ofbmsxXOVyKjzXsRWWZF93gACQiQ1jXfRJbsmSL2rexfxAajDOCtbaIJCCq43
 5x1VjnD0AwcNwMg8W/1jMd8k/cIxXDprUlQhLDKfYDOK+UjZuDTXOEgaylFVNZhVD5RM96uR
 pEQC/soYvkCqNPW5EQfrEuMPxeFCMTl8T5spyb0gP0D2rghPj32hVQvRYscnmvviorcEKNDS
 u2a7K3V9Tblf/hJiXDwytfuckwDpOqFe79sMsSWxEg0O1n7tAuIpaq/YQmrysk3sDCqxuVKW
 vDzgTQ/9yt9ozj1x58ei4nEmIQ7+xfq5H9kmadsAoSkZkEuMpa0VZpKsCeCMJFqB9kvWHxsp
 HMiw6Yd6vZTHQAPwZUjghvDYtm6WNLRvVTtTu+MJzd/in9/Pr6y1F6+8kmln/X1TdL8kE1Lo
 SxMjsTWuzgT2gbS5MmKRro1/kqo1TuVkQGGwu9eKF0yla3VJoRnxbg1l5EJtl/EEDOwk0Lz5
 JI=
IronPort-Data: A9a23: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
 A3wUVY=
IronPort-HdrOrdr: A9a23:icCEpanfV2fZIQpw2WHY/USStnjpDfMLimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdW9qADnhOFICOgqTP+ftWzd1ldAQ7sSlbcKrweQeBEW19Qts5
 uINpIOdeEYbmIKxvoSgjPIaOrIqePvmMvD5IfjJjVWPHtXgslbnkNE422gYyhLrXx9dP0E/e
 2nl656TlSbCBYqhqfSPAhCYwCdzOe7zK4PBHY9dlkawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/stmgoyWsnVP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01muey81wn+e
 O87ivIfv4Dp085TFvF7ycF6DOQkQrGLEWSiWNwtEGT7vARgghKSPapy7gpMCcxoHBQwu2UmJ
 g7rl5xHaAnSGKaoM263amQa/gQrDvMnZNqq59is1VPFYQZc7NftooZ4QdcF4oBBjvz7MQ9HP
 BpF9y03oceTbo0VQGsgoBD+q3aYp0IJGbxfqEvgL3h79ENpgEL86Ix/r1soks9
X-Talos-CUID: 9a23:L+VN8G9HBUxohtouxf2Vv1QKK+UfTmXf8HHZClK5JTxPQaPEZXbFrQ==
X-Talos-MUID: 9a23:dCWJPwsUBZ7V9QaByM2npj9lCPtMvpiSNm9OmsVBh8i6C2tNJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="32626779"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC217.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:56:30 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:56:28 +0100
Received: from FR6P281CU001.outbound.protection.outlook.com (40.93.78.7) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:56:28 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsT4+JEtgS1KA4g9uYBKh+fDAGtDUJ3lrwVEpu2Lbs7f8KsxNjEC+gucH2LPtsOnWB/SkkJELGu74DpJZrTGFb6ncS2kAyWu606vxE6zwm+GzjqGNOOto7/M6uBMcVGZ3ws6lHgHDnaU48Oh+uPr9AXKMfgIDoJWQN9FM9R3oG9Gq7ea0pfzJVW//TdCfvGHi8Grn9AIlzoR/9WeJ0xgnMQkqG+Z70B/R1b/RkCEpuSWfKyv7ZnZIdsYaQy3UA6qOuaBTDUwl6SF4/hlrU7Wtsv5jCQm3QVPzi2NK0T8TW6IGfjuS5m844ILtJwX6olYrAPLJ4lgDk3gteQ94z6rdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=GHrFMHd375Kq/bHb4WPqdfUCGQre8BM5zCdYE6e6XfYi3DPNfKRnLNJsP3uvhECFkzQzxLf2sZgKhV8Z+3jdbwB4cLwvCdF0CfskmQQUsaqkWL0OFC2/Qvu2noJ0YEJ4++J8QG5c0/VdqMh0Xz1+VuC+wNKkIvqrd1ii3PsqalEwosoNQdwJtMy9z1D6ASEAzWRfVQ0JgrJktrgHsYC9zNIecDc6tUTKEQV8podDkI7cRC2APb+kQElkZhITSXFGKvMY9Qeo07cL7ibD5Y7tUdBhUACf7bcasvK6hkj4c8EtnzyrDyezhmzPpRTn1roHRjG/udFhoApcCUqb92DJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=G/Vvui3ww5p+fIZRF+lbxXkzxY5zArwlyA7w2o2C+wyi8ZRvAdObSiLI1j58Qa4hGTX10g21zFwSN7ALl9seGHluPkNxcw8/eJ7Nh4JmsaNet+f/eisD2VR6pdN26RVtERk0YAgBgz4b2p4Bdih2i0ZihevnFY/Fy2u1I1O1tFg=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR4P281MB3740.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:d9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 14:56:26 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:56:26 +0000
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
Subject: Re: [PATCH v23 16/28] riscv: signal: abstract header saving for setup_sigcontext
Date: Thu,  4 Dec 2025 15:56:19 +0100
Message-ID: <20251204145619.13381-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-16-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-16-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR4P281MB3740:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e3ece-3f6c-489c-767c-08de33454ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YShw9MiIVrQvKFsCeF38yymXsDCheN8zWLInI9nM09q0LBU8D/eNViVyP0bM?=
 =?us-ascii?Q?lVCViKmVJcVJAO8w1lnNQU5VZ9R2tuVCoSJ2XhZTIcxfWVxHrW9LSnSa+Jr5?=
 =?us-ascii?Q?EoDTI5+adZcXAe1LNYOdOhxe8qmmy1ggcGk5BuQxTGgJeTH6zYzG7vS0djWV?=
 =?us-ascii?Q?tJWcdP+v278BJpoGW4ssEy+e2pbjuPtNxC9YX2XH22Sk35KfYEi6767J8zzn?=
 =?us-ascii?Q?r3W3eqsfyQzgliQ9dBIBMISyZs2bMOQVHjI7gs8UivApEbWf53+UGmLVy18i?=
 =?us-ascii?Q?0xwjUH75yXdgjWrD1LebEUs36Cn7VYJ53jXbTUHiV+t5yg0mpC1OXhPFsI+Y?=
 =?us-ascii?Q?540R7wYYDOCTqteXN3AuqmwbaDYSKstVt8F6Z0bPlamdtXDyAw6ZEZgyOaQL?=
 =?us-ascii?Q?MtFw+yPmAHFAXPg1yN55jtF/QgnvFNOKHidf8nhGh4yiVtmJcpp99pZu2RkA?=
 =?us-ascii?Q?I8/gK/vpYpMT8lkSdv3M4Ve/61Q5cSzfzcHCq+PWu6Rj7MwUNeYYryQJaTgN?=
 =?us-ascii?Q?rc8rEEq8mJpJs9qjualU9D5NEOGJKk6HVfL53g2t26O7HbyUR6/vTB+Fv9pH?=
 =?us-ascii?Q?LGdhQbnu55nq43Axj730VfCUWOY8kEh9ZcynZGUh0MqjYeL2Vr+cG6dSbLtI?=
 =?us-ascii?Q?gJUw1zePCcEDuTRI8rD0IkMeXGxKxnx5eYWLW0SvDOdbBfOK77NwYndIbZ7y?=
 =?us-ascii?Q?822TvTyNySI82EXoSx3m0VSY4DsczGuKM+Ntdg/j9saLMGnb7NjuTa3QL0Kf?=
 =?us-ascii?Q?xYkOMJZKnGYqXDTFR2ORnDl9wifHE7DQejCEV67QD7wpSpZPWErq7jhW5Ffx?=
 =?us-ascii?Q?y+/5Dll3csdgHCV4qBS9IvtAENI95c9u3QeL/FlOWnbJxA6KZZf0obmZuP0x?=
 =?us-ascii?Q?vPKqMdCHSxY7xP7VJ+RN800+x3skoGot54gDRTeJ9qznPrXpb0Ab3IWNnwm0?=
 =?us-ascii?Q?0Zb3xbtg99bqURU48elGmJaD/SYfRQNSbkE12tGN+aSDctfhpc6tbOAO3+lH?=
 =?us-ascii?Q?eFQ4HvAWNHqACrTR6YrXVEImX0Kr3wg1ehE110PnD8LLA5Ucmp0XUyEHeG4C?=
 =?us-ascii?Q?mydbQT7nkomoS5MZWJ2cYNqUmWEPPPwbD/1fvXlJPULmDO9v4ifo3sFBEzza?=
 =?us-ascii?Q?LjeIPGlKybAX0EDebLB+JRSCONXP0ICQjYJ2ToojfHRc1MFFcdsmrGXUnGvj?=
 =?us-ascii?Q?cyOawpXEc5wvYNZcQiXEL/Vg3KW54EL6DNBB9O5Q1l4+gvXu5vudyPpqxOI6?=
 =?us-ascii?Q?/VughXQckuemQdP1AMMgSlToMutpZLxYmeCX8tzRuBIKY0rq7r0FPEQk8ehe?=
 =?us-ascii?Q?vyJWf4la7tbOQ5UNHmv2sPpF29Znj90juQExfI2433U2SkmSptUKzJNIvOS8?=
 =?us-ascii?Q?SyJePal1gT8/LmjCgg1Uu3bEQmXRu341NeXtM8SHorfmJnynfCpK2rdl8vs/?=
 =?us-ascii?Q?uIJGlO74IBSBJALsRbxXFc6Q48WIlQW+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Thtej4IBKo/x53J/LHsmllvngvoUfiqLVIi0nDGbZXsgnVKbEXe69WmtzYoC?=
 =?us-ascii?Q?hvVMRAeI3d1uBZWhpply3CH60vy3WG2Po+jazIZssndehj2HC61EEMH5wUq2?=
 =?us-ascii?Q?D5MT/DDJCIdabKXR6YfALO09KS1VhubNjRajC9a+p5cR4Qz1pyDYM1DqGudX?=
 =?us-ascii?Q?YiF7ci6/XRyKvji5EjZdQ3NYzS686yjQlzYMWihIeA64gXHW6W5gjcGG3uSo?=
 =?us-ascii?Q?aD7cpMmOBYMK/MeFlRpu12MlxbVizSd8UU8I557xuohlT2VJTqejz0nwLrDA?=
 =?us-ascii?Q?hT4HqlrQ4onvyx1jKJPfSudfdXXjtcW9Yp6xHnwVMc/KfekRNUyfFRrdb6oO?=
 =?us-ascii?Q?ieYl2bU9Wv0zkit9XuclMURM2uKd/L4L4nxMd0sOPzYR5/uKAvTwm4L1x+C8?=
 =?us-ascii?Q?xf7Q3tSimrs0MVYP0X+BbdBEHP9diU8dzJhQrHW0UPFrhoAqyfj6x7F6gaEW?=
 =?us-ascii?Q?8bcWdEDfzUXQT01vFDoPH/teimna11N6TrNwmUAuGAJ0yqXIslVQOjBh+7Fs?=
 =?us-ascii?Q?6MsL4j9JGtHQRfW6fBf1N1ELM73aVYEd5eJsaXYTcneSjmDTh8GOSnvAcbcM?=
 =?us-ascii?Q?5jYEoz7t9vZDghkYmMrWldwMUpJqHssp7ECvPMpjnWv7HP0gTeLKSUkY7Ezs?=
 =?us-ascii?Q?eC4g7tfNkUK+9CQf83ILVo+Zh8GUgBvqRb+aQcBp9Hq0VT85TlxWP9hw756f?=
 =?us-ascii?Q?XmuIucgXlmhW8kk+LnOhumYvP1XEayK1fjU59n2kWwdlbDeSKUjBfZztFSGt?=
 =?us-ascii?Q?urip5TVYRCzQXcL3becPtUjrqKtHI5BTSoD9Bra11+I2EKaBVm8/I/mgbeuj?=
 =?us-ascii?Q?IK1yhSMJnALURChJe45Y3DquYEOc6SswyO/I5z8/X+nN43gUih7OsCyTG5sE?=
 =?us-ascii?Q?4fZwtivGMd+pn1m5rxHgKsFoGbL1Zm3Nnq3n1zAIGHqBYftyoFk850ldmJgX?=
 =?us-ascii?Q?+uHRf82UEGZCujPC8HGAw9xsfIXM/ltfcKqrnngl40HVgD8N6BErMBxINZGL?=
 =?us-ascii?Q?eUWaiOoFDaHToeYXxQFtEKv99R9+XRwyqdqUQ3BxgMtdLzLG4uO98DbYPY60?=
 =?us-ascii?Q?lZV1eLmmBIRIXbtsj1BOnK44o4qXaR1LSJMJtKttqs+sRaT2z+Omi1sP/LPO?=
 =?us-ascii?Q?VNW2feWen1s+u3fVrXpoVl8Cyv3Y9enA1TBm3tSe9sOEYWi9LC/6/o5HpeqS?=
 =?us-ascii?Q?vvtrcFXfxtSqI+EKup1lx0UcCRlQ9MFrdd/5Oh2yvT3tzesDAZc1J56Yp1L7?=
 =?us-ascii?Q?r/cjcKw+M6nugAhWo36P/zzbD8xsnkdWLmFVJCmJ7JawpyUhLz4yrMpWAxL5?=
 =?us-ascii?Q?ZoPHKLFRK7zA7dCFJG0mSn5861rToQBququLengEkG5o4W2axsoYkewVk+hC?=
 =?us-ascii?Q?PJPHTD+FICdONtGFYIswb6UbgxgUc0pIyolndN+HwkUuGdSb+MZCSdHejYRn?=
 =?us-ascii?Q?nrm+TJtTJDCn7YQ+WqplQBM2xy/2gkNVsM23I2iP5xbzNcS2PIUTlDnRWYRU?=
 =?us-ascii?Q?C0SlVrlUTjBHx6ImMqD/Wpgk1jFNbp4/cUcxZt8Ny02ilNN06m0BbnJxAHIE?=
 =?us-ascii?Q?kqRbn/DYre6aJ+gQQ17nb6CvrtkKpuWrcMm11r02UK5qkFaVCvKWjL6skckI?=
 =?us-ascii?Q?0Q30fTeMVrhrdWg4kv05Y+g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e3ece-3f6c-489c-767c-08de33454ca6
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:56:26.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fieCUXaYFAUgfI8Iv1oyJpaMVBdcoBc1Nuq/2AerQuWhTfqMDxEgGjP6+HquWApAbeYWkg+FMi6oGAFA/d93HdfAGDboUd38Nci5ZQ9rzMyZtxxPlv4L1uGbC9GO5+/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB3740
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
