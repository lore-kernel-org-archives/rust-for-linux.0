Received: from mail-edgeka24.fraunhofer.de (mail-edgeka24.fraunhofer.de [153.96.1.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389E4261388
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859741; cv=fail; b=iDS9QbTJPLosVrkVOrPvQKsTkZmrB1qzbKkR+i7J8w1nCMXFqlKXauhpug89Xyl0CPALyDeBzQ6DLySkSj+v8ggjW0M5HAd0s9u9l4f2dDh1vHiVLL2jvZrh0vQER6qKO8YA92JxTik52L1ij0ZMPxJlXAhOprZk9NLQ2HkBFDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859741; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=miC4K1lH/e2DSnwgoqVcxIX1LjvFfCDIGKYBjVPWOzYP4xdk6Ij6mNjx3cvQa0a52DlynwC+eCJg33Xp0QqrZhB4t5ib9qFn2CEJbImRnv7Km3jDljcM+YSaw7fGzlXCOBuayBYYGDsGWNnAvfut6BGljAtQqL6sAdeedw3nXXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=eGpteDX+; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=hB1dSTFO; arc=fail smtp.client-ip=153.96.1.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="eGpteDX+";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="hB1dSTFO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859739; x=1796395739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=eGpteDX+c/60ezK4Tv3rTAXZNR+JSch3T2Z6+Tp0eR9ekmcdsMOmcY/8
   24WpvCQwCoQwomg5ENE42kTQDAIgO0G2GfcXRzOAoEV/Apn8zbEqGjbS1
   0o9/locWWMAMKGTpAiaSc9sovZm2PAF6gMDqAUIfUmxUOMpPQi3knkMHD
   TRxc9/StL0WgiwQdxyXALWUh7XnW+MGdhPgOdJLJhyDaCMhkIR+K2QjTm
   jx9WOfrAJ2trL9yWiHYTGYR4XW7XAaGoroA2oZgnlBUqFHFxhDw/ETH8s
   kdUBlT6w9Rd9RLnElcAvF344cJ4qmoW1FXDYNjJ5be9zt4eTrsaLkiCOp
   g==;
X-CSE-ConnectionGUID: aykxtxuARraC2s2Ja68Y9Q==
X-CSE-MsgGUID: +YVNvYZaRRuoZsvVyQ74Gg==
Authentication-Results: mail-edgeka24.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BACQnjFp/26aZsBaglmCQEABgi+zO4JQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMaCc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM2tEGBAYIMAQEG2ywYY4FkCQkBgUGDfIFyg?=
 =?us-ascii?q?mUBhH1xhHg2gVVEgUqCRDE+hFg4hXeDNJlZSAp4HANZLAFVEw0KCwcFgSBDA?=
 =?us-ascii?q?zUMCyoVIw88BS0dgSMhHRcTYD0XQINJGAZnDwaBERlJAgICBQJAOoFmBhwGH?=
 =?us-ascii?q?BICAwECAjpVDIF3AgIEghV9ggoPiAKBCAUueycDCxgNSBEsNxQbRG4HlB1Pn?=
 =?us-ascii?q?HoBr2s0B4I4gWeBXgYMn2caM4NxAZNukwuZBqkVAgQCBAUCEAiBfoIAMxokg?=
 =?us-ascii?q?zZSGQ+OX4NCvFZ3AjoCBwsBAQMJkh6BSwEB?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: =?us-ascii?q?9a23=3Ak7k26mnZy5Adz+E1z7lfkCsdAT/XOXTMz2fMM1K?=
 =?us-ascii?q?RM3xgY+eOE32ZpvNVwvM7zg=3D=3D?=
X-Talos-MUID: 9a23:uW2vfwVwjJOSzIbq/Hzduhd8BfVh2Z6zD3IWj6sXgpbYGiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="35871883"
Received: from mail-mtamuc110.fraunhofer.de ([192.102.154.110])
  by mail-edgeka24.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:48:56 +0100
X-CSE-ConnectionGUID: Fn4S4EhRQkOY2aWWpdTfWQ==
X-CSE-MsgGUID: MnuIdjWjSLOcy6iA7uYVyA==
IronPort-SDR: 69319f58_a08JX52Cz8zB26IWPfP9W7BnX/+5VFzPsgKkq8A1mtWJ5oi
 qIXSyEWDRxNoZJRNHpGFmjY4jdTVblv5nlmmizQ==
X-IPAS-Result: =?us-ascii?q?A0DYBQBT7aZo/3+zYZlaHgEBCxIMZYMcUkABgRyBCYghA?=
 =?us-ascii?q?QGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCUnOBMBAgEBAgEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBNwEPC0YxJ?=
 =?us-ascii?q?QYOBSKCYIIlBBIDNQICAqcoAYFAAoxXgQGCDAEBBgQE2yEYY4FkCQkBgT+Df?=
 =?us-ascii?q?IFwgmQBhHxwhHc2gVVEgUqCRDE+hRCFd4M8mlBICngcA1ksAVUTDQoLBwWBI?=
 =?us-ascii?q?EMDNQwLLhUjDzwFLR2BJ32EGYQmK0+CInWBd0EZP4NTHgZrDwaBFRkdLgICA?=
 =?us-ascii?q?gUCQz6BXBcGHgYfEgIDAQICgRwaQAMLGA1IESw3FBtEbgeTVZ1zAa9rNAeCO?=
 =?us-ascii?q?IFngV4GDJ9nGjODcQGTbpMLmQapFgIEAgQFAhABAQaBfyWBWTMaJIM2TwMZD?=
 =?us-ascii?q?44hPoNCtztEMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:TC8ShhIqk4AZo8+gu9mcuDZnWUAX0o4cQyYLv8N0w7sbaL+quo/iN
 RaCu6YlhwrTUIHS+/9IzPDbt6nwVGBThPTJvCUMapVRUR8Ch8gM2QsmBc+OE0rgK/D2KSc9G
 ZcKTwp+8nW2OlRSApy7aUfbv3uy6jAfAFD4Mw90Lf7yAYnck4G80OXhnv+bY1Bmnj24M597M
 BjklhjbtMQdndlHJ70qwxTE51pkKc9Rw39lI07Wowfk65WV3btOthpdoekg8MgSYeDfROEVX
 bdYBTIpPiUO6cvnuAPqYSCP63AfAQB02hBIVjLhyQv7Q7z4vjD8lPZS4Ri3Zu3kcOEqQwSZ8
 blNY0fDkyc6Lj830mfchtMl38c56Bj0pzYmz7XoTqafLNUjcajjIN01FWBgTsFXZgt6Gb2WU
 5Q1M+4BZ9R9j7bviwQBjhGaQg2sVb/T6jpmg0er/bAr0M0OMTyF4CgABuoygljo8f+yKuBJf
 cC57af39Q2Afdx71S7/85WWeTl+nK+Oe7hLLuzUyEgvDSrkl2rJm73CZ3TP97sfiXSq5dFRV
 tyGun8E8iJ6gWCGycI+h7ToitwsmmrC+ighmN8WBfaZHR0zcZulCpxWryaAK85sT9g/R309o
 C8h0e5uUf+TeSELzNEi2xf6VtfeKtDO7AjqSeCRJjl1njRpdeH3ixWz9B24w/bnHomv0VlMp
 zZYiNSEqH0X1hLS58TGAvtw90usw3COgijd8OhZJ0Azm6fBbZknx787jJ0ItkrfWCTxnS3L
IronPort-Data: A9a23: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
 Osht4f+IX6Vsex4TCjB
IronPort-HdrOrdr: A9a23:Zb9ALKlcqe7epVqqId6TSeYDMo7pDfOhimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdO9qADnhONICOgqTPyftWzd1ldAQ7sSi7cKrweQeBEWs9Qtrp
 uIEJIOQuEYb2IK9PoSiTPQe71Lobm6GeKT9J/jJh9WPEVXgspbnmJE43OgYypLrX59dP4E/f
 Snl6h6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKXiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8xvT9aw+cxTpAVr4RGoFqjwpF4N1HL2xa0+
 Ukli1QcfibLUmhPF1d7yGdnjUImwxel0MKgWXo/kcL5/aJAw7SQvAx+75xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4HZcjEBS5dL7tUYvJrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFkgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve4PcV
 T6ISFlXEIJCjHT4Je1rex2Gzj2MRWAYQg=
X-Talos-CUID: =?us-ascii?q?9a23=3AAi9qRGrX06eECpK1DUkqLUzmUe4jLkaB4XfqGky?=
 =?us-ascii?q?fODxgd4KNRWOex5oxxg=3D=3D?=
X-Talos-MUID: 9a23:fr7U7AYi4AFzCuBTkjnxpT1gC8VTx4OlGR4MuMobiveVHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,306,1747692000"; 
   d="scan'208";a="35797770"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC110.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:48:55 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:48:54 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.1) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:48:54 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKSRFKwoE9t4KrStB2qoaiWu3oFbJmfZ2m6R5JwH8fARGKXoL+rYj2LF24mEMxpw3Ph8fHzQCOeqjN94xzL4OqgGqGKRmdAL4sOFKH2ugez8lQpUbmMgj6PtmTpdyMQf2waNS2x3OmYUPgR1vqsM3SlqLZSrehp4p2MFvzhgTc/jTW2Q9dPubJcABLxqZW3kHu0HawsK+gunsOVkr4IWUQ0p8RV0L9hijzyS8TVC58lZR8sRe7JdG0oauUBiI1C5y+0gzoPuxk7YvpWXdUw13iZ05ybpExUbYO6M5CV6G72qcPXSJAy9/JkMGmIOokmR9dlZofnvSyPnlutWhQBRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=oLZoV3K+AVXHwbGAnaldKGA0LbJWZ1IDIZkUaXd0lKF/RxnSJVCubVv3LmanTWqfIqOwmuMhHm58ZqAdMfrFPzmnT/ny1VwwYigHexYrpd0rg1+71evqY8g1awrN5KBUK32xhRAisoYFuaN8Rtmkkf47bPgnQ667Zlc9jJqLaI5QmStUzx3U0zNfziaQcuaRO3xywX/yZwkDAyuzQ1Jv4RBcBsp/16/1MUNI8rFn2fm7Pb+TS+bTK7Ihgacg+Y3k0m8dhKe7ErmCD0DPnIIKOHz0G56JofwbJ3DOthgNVi0yeQQ549qb+l3iG1TN4ZH033UatLFe65UG/epy2jjefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=hB1dSTFObpG5gcV5fG8bIxonYOSsVBTwRTlh2ZMHWzD7gKbL/lh94THmFmP5HuykAGHU+TLHqPTZDT5B/v/3DHdIfWPP+zGEdqjsu6cA7U6jNbS7NmiihrAIqW1ZYO0/2I7zRtYbSYkVAYyK1KcK0AgmzeUId6Q8Rnge001KHCI=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR2P281MB0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 14:48:53 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:48:53 +0000
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
Subject: Re: [PATCH v23 14/28] riscv: Implements arch agnostic indirect branch tracking prctls
Date: Thu,  4 Dec 2025 15:48:45 +0100
Message-ID: <20251204144845.11873-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-14-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-14-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR2P281MB0026:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5e79e3-dd44-4b3d-d303-08de33443e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RAGfmZ84w7S4dImqEA+xQEqYkjteOGmWqWH+OdpAKCEnJUBz+fEivQTHqPRB?=
 =?us-ascii?Q?c1qF1JLzn8zkWF4eMHksh1gPgk/pz4NFRQ60/CaR2lFnGA3jPlHpKklVVfqY?=
 =?us-ascii?Q?9yUKQlGsjVZ4Nr70t3dQcTwU6CFuAoXnmyvMdw2rrmjnuPi6mq8l6u5fcpTj?=
 =?us-ascii?Q?eUp8AiH3i0nSVq6CcBMPX/IQOsASZ6klt93D6sALl3EaGU/hyv62UCkzueBg?=
 =?us-ascii?Q?YaE9jyawQ17VZdtDIMdniAFLkOlt4o345sgPCJrtcs0jA+pGjFRUTEPYTCoC?=
 =?us-ascii?Q?4VMCIU94leWlqzYaYFamYF6wNfDOOXJmsnpiFTM1z/UAH/oKmSae8SoNus+D?=
 =?us-ascii?Q?nZU7OQcgesjjZmIWG3D5T/Ek+3HjtVrGwoT5ar/CnIQ/nwiiIBGpG153yVZl?=
 =?us-ascii?Q?hwSB3ms000k61trLfh9/he9uEnGZBQkAQe0OZpk3fe6CkEMbURK7DotILvh3?=
 =?us-ascii?Q?RyY7aqTge3ZSk1Dnn1FA8WydZ2alyAiRXXpUyw+5OzZWHqPiwDVeYqD0ko5d?=
 =?us-ascii?Q?Yvv7E4tjKWaj6rO9s4yW63/m/lXmTgRDpHhbpfytb4BUgSf8d8lDOoYBNgxj?=
 =?us-ascii?Q?+NccjAWADr/tBD3IGbcjatkkpoCDAu4zrs9X0qbiG98JS2zpbQfrSTz4PfyT?=
 =?us-ascii?Q?Aytc+BVnqxIP0AYHi94s5GW2Y67OEG+2OQuLHwAx2qJYH8L/+A84dm7IPope?=
 =?us-ascii?Q?gVpUiAdZNnkjQu7eBEVjYqdXHu0Mu7cns47nWq13D+Snvr5BZpewCmB2QZfR?=
 =?us-ascii?Q?EigofS3n6y+b35Zp2pF68/CSShPHgJbnebWVqWLuHBiKjRsJyxKrDM5308en?=
 =?us-ascii?Q?0lg/d7E0ju/t2fLryWCTl/t76a8wVAryoKbqEjldATtI9enxAM5l/gIZ5FqM?=
 =?us-ascii?Q?CvkSV67yB9AiCyvCuoBm2rZVw3a99V4fc4D0M4jH18W5K8iJevJF1wb0bYZP?=
 =?us-ascii?Q?rPQaOdtrqnKaLpj8rw1SD8DsXsTOY2EktP2fdiF/xLGCZOgSwbKm9azGf/Cz?=
 =?us-ascii?Q?r7gahCbaXyRi3CupTlw6s6bUgZloeNMswhFejMAz+GXZ6gsTGxnFqqDvxWnu?=
 =?us-ascii?Q?/f3rfCrlmGXTL2Slf4ujWIk/V3VZgjGS586xSx7tV0u5SgJroX9upS5kCK+s?=
 =?us-ascii?Q?DQO/V7ZmZvgESrQUpTk8ZUw2hIewoc0FgapEGhpAo+Z+sZmGyfozAVVJoecy?=
 =?us-ascii?Q?0rKHGmxThaBZL2lqG5eLbI3hnCnONtPg+qUIU0Dunw7MpvJxsO13oqtXH8+y?=
 =?us-ascii?Q?CdsY6cy1OqyYZxhFaYdMO+c+8BJnyhBS2Vv8JfR7Z/XvUyPqzigZh8CQQGEB?=
 =?us-ascii?Q?SWp6Qr0CNK0mMvC20iE1ys2wXOf13Z7fDE5LBa+w41z/tVBnTF4uvkSNKDep?=
 =?us-ascii?Q?a4HNXswhzkBxmgAxUfPJuAryVivCUdMSOQzF3WTFFl/IVpZZAtF5Ef1zwKvC?=
 =?us-ascii?Q?PtQ3RmI58kKkFFGuKaM55xYXp39WXgON?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DvGbRR5wwrG/SNsuJAZJEQuzPDB0SEeKaoPZ3iycNuOe3Z740O7bqyx2CWbO?=
 =?us-ascii?Q?t8rf9hE8k6PPq6jX/myFgyXghyeJ+Q7kmz91nNBqQzE+zICGSD4ZzL5oJRay?=
 =?us-ascii?Q?yt5juAVwTGXDgCvg4LQN3KuEyIRT9tuozl1ve1Rjs/6gXr1T1DxGNk4+gQQG?=
 =?us-ascii?Q?1eCSPEZz9USc3WCBXFBrc1wQWHs4gEUeCn8sZYMwcg5pyk5K/IFTdnpf+xGQ?=
 =?us-ascii?Q?gdTmTpu8gWML4+bJ67eNWqnJ78tOoX7+1hWnlvdb3aGMC2L1BkadmPb++/HN?=
 =?us-ascii?Q?0YXYV+JmopyaZMnKaYs8X+b7eZ21ILrggaCS3TfRY4ws2GOlo+CckFTa/WbC?=
 =?us-ascii?Q?psdBbSAYsvtoiKS8FOnDasNGna2AmODgvpSDISshtM5soLYd94cpjC1LbHR6?=
 =?us-ascii?Q?6Aq4V5qukncJfx9FHeYzs5Qo6zjDAvBJPZA6+6Z2AqMJfSc7NVhmHmb/y7Rd?=
 =?us-ascii?Q?Vr7PyTkWWlZyBGvfP7eTsp0sk05uAscABHCBkk5hJ1kriZZUlu5N1+oQpYho?=
 =?us-ascii?Q?HJ87iuiuRi45bfngPCxACG6n253qNvRABEHNV7muaMYAYoWs6Ms/P40clMnu?=
 =?us-ascii?Q?X6LC19DeXdLiRayPQPrKGAmjDx+t2j925+NqO95q8+56/owHOzQlVOX/8hKU?=
 =?us-ascii?Q?AbMmKoL2HcV5tcyQf7kr5QhunlxEqUESowWNQAhXbFgrAJssyUk5LN9FU22Q?=
 =?us-ascii?Q?wpfHbvh6djTzHWpA15lUCrEu6Js1aOWPmHmXvx0qDyVN2KD0+MHBfmLeyF3t?=
 =?us-ascii?Q?Xl5bVP8ux5RyQipAk+BIvWu8GSuOPIELAyUW13UOOU8mv0nxBFotihJf8WGl?=
 =?us-ascii?Q?Pawsg2wDiIWcj9fT23UJj8nOu8at156jgkqquxGoTNn8nu4rqdV6/6mCkBPU?=
 =?us-ascii?Q?37pqIVMHXFcL2XZd4yPiaBBQ39VilCIvW/686Q6Bpz0PT10xsxxUf/ew4pX2?=
 =?us-ascii?Q?3s72k1L8o05WG3kZ1iFA5hK22twn3t+/yDZqP3Bh5KAKu/WJwNuod5ctUyLy?=
 =?us-ascii?Q?+poJv3cXbnCBnj8KxysR3kcs9YaJg1iIJueFsbKo4SoRjTms5zb+rd6Iv8RZ?=
 =?us-ascii?Q?RCgjKmpYI8NWNCtkUeJi6xhh0WMi2UVxJSxUPkBBaSv9Cd6AxIF8ZbqxZ1X9?=
 =?us-ascii?Q?WTxfKIg5q0sA+KPSyzlCJj16MXN3RwTImAde1bjrpNE+6dNvpm7I/LeiZJJy?=
 =?us-ascii?Q?69drso/tYy5THiulTdUbhfgQSHkLgY31BWJBas7d7stcSlpw8mOSapQviilz?=
 =?us-ascii?Q?i0a7HIZElKvirYzTneAM5FcwVjh6ZvzdMTnVpA88ktSwKup3QlVoe/Xsd3Wl?=
 =?us-ascii?Q?x9Fhn9QgXdI2i1mwrhLqUAGNyz8CCQ2FWWD0UuZ912cR9rbc7Er74oV/uPEX?=
 =?us-ascii?Q?+JIrczc4qb/nLDotAVK0eh2B5MmP1soz7MIpIYxV7boyuwtLUXJzmC4cILBG?=
 =?us-ascii?Q?cWGhTDhl/kMaH/CQBxU26XXno0dabnelyPFgW5bpYtOyrgJ56XINe0OVCyYN?=
 =?us-ascii?Q?Wic4z1x9fGo6ujtaAp0I1nHIVZbVkT8tCv1nJrfdpjstLO031FyDc43tC09K?=
 =?us-ascii?Q?1mYPD1O7dtfWp5L04tn6VOfL+zlpPe0aP/UIZf4AjsoDw3VJkAUIs6ZLd4cl?=
 =?us-ascii?Q?AYnSCZQMb+0+Poh2+uqlJQs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e79e3-dd44-4b3d-d303-08de33443e42
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:48:52.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNBQUOmNyryDAJYAhU7xIoupGti77M9bBUXtHoBO8x5v0j83hOQ4WZDwyzoh/S8VoSvGcEqIr6C6Xv5b9DhENZB+Buzmy3q+dSO/4gT4jjNh705wgvKEWucBkcE4Ehzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0026
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
