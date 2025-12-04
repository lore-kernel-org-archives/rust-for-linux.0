Received: from mail-edgeka24.fraunhofer.de (mail-edgeka24.fraunhofer.de [153.96.1.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87DC2C2368
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859524; cv=fail; b=Fl5Y2kmvzymI/uP3alnG0VZhqFvN0Qf42vS484lr9osKH4cL4rfty+2PTp1PCo5LB3L+uKbGahyUrGjeeHJAAIQIR8uq0f4iLHgMmJiMlFKd3lrT2fV2Z8tPJFnSHAibj5mCXuK6xd3rCF1/SVvJS42GAWCHzADpHaWqITNW1Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859524; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dt0T9g8RMoRXyQoKGSWSenqetxDi18LnJdPY1iL8LBzRgE6JuyRgdDT2AYDsXo4qdvV5eEumEjWWmOVKSj5bj/JfZUedHlPRoo2UfUOs+EciE7SQi8ekoG0bbqWTJBq0JRLPmNg9/VDTE0KnWY4yuAWzAD7ct03o3i4xubuuUk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=qIdunhCp; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=K+TVBXWp; arc=fail smtp.client-ip=153.96.1.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="qIdunhCp";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="K+TVBXWp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859521; x=1796395521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=qIdunhCpJ5tS/DvoMt3OdcNA8EdI6BEVRCYOCEmefjB4S/oHItfxfi64
   GhIUPohsfoHdZD+O31euILZx9JbIwaBU4Tk+0546XXNMtljthNF0c33m0
   +wNfS5JcYs/ZyS4Iq5X+A7hco4UaRtWbRKv+d+YKeZJLjoJNSQb2wM3O0
   6Kgaj5S/RNhieZiPxGZqv4w2a2v67skWAx25/v4+hDRX1g0daWwNlDXyL
   NWrHtLBJM3tgKEK/jeR93BI4LJW7sDIGK9zKeIcx0PBjRX2mQf/NajP/h
   J8XcVseMka73Er42LXJee7dQXSDZyeywqC24eE7p1nFTh+qE/BVX0fs9v
   g==;
X-CSE-ConnectionGUID: 1hVwTHbZS5eRJWgzWrx5ZQ==
X-CSE-MsgGUID: JlBwBKHKSN24i8GXK5E3zA==
Authentication-Results: mail-edgeka24.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EqBACbnTFp/xoBYJlaHgEBCxIMggULgkBAAYIvszuBK?=
 =?us-ascii?q?4ElA1cPAQEBAQEBAQEBCAFRBAEBAwSFAAKMaCc2Bw4BAQEBAwEBAQEBAgUBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEdAjVWBjIBDQEBNwEPC0YxJQYOBYMCgiUEEgM2tESBAYIMAQEG2ywYY4FkC?=
 =?us-ascii?q?QkBgUGDfIFygmUBhH1xhHg2gVVEgUqCdT6EWDiFd4M0mVlICngcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBIEMDNQwLKhUjDzwFLR2BIyEdFxNgPRdAg0kYBmcPBoERGUkCAgIFA?=
 =?us-ascii?q?kA6gWYGHAYcEgIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57JwMLGA1IESw3F?=
 =?us-ascii?q?BtEbgeUHU+cegGvazQHgjiBZ4FeBgyfZxozg3EBk26TCy6YWKkVAgQCBAUCE?=
 =?us-ascii?q?AiBbwuCBDMaJIM2UhkPjiE+g0K8XncCOgIHCwEBAwmSHoFLAQE?=
IronPort-PHdr: A9a23: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
 RyHDTs8rXmWA/zYGwqe411htHXBD9agMHT/GQ==
X-Talos-CUID: 9a23:9DDD0GDxdsQ9ybr6E3BnylEoOsoXSSDQ9lXvLF2HE3Y0eoTAHA==
X-Talos-MUID: 9a23:82sVegnvHQ24dQkBxc/2dnpAMO13yYeOK3sry8kH6+a0FnFdYCW02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="35871571"
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26])
  by mail-edgeka24.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:44:09 +0100
X-CSE-ConnectionGUID: 9oyuyydwTCeEaKQaEDTw3g==
X-CSE-MsgGUID: Yhb6eCGMSziHmklMwJ1A3g==
IronPort-SDR: 69319e38_fvtgz/pGJONo0i77z6EoyLUcYErqOKqWcePw8CAG912X9u2
 kARU/1kUd2CfMDXOjpVDbHOHA7H6yp35gr7JUwQ==
X-IPAS-Result: =?us-ascii?q?A0CCBQConDFp/3+zYZlaHgEBCxIMZYEgC4FuUkABgSYuW?=
 =?us-ascii?q?4ghAQGFLKVrgSuBJQNXDwEDAQEBAQEIAVEEAQGFBwKMZyc2Bw4BAgEBAgEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBN?=
 =?us-ascii?q?wEPC0YxJQYOBSKCYIIlBBIDNgICAqYkAYFAAoxXgQGCDAEBBgQE2yQYY4FkC?=
 =?us-ascii?q?QkBgUGDfIFygmUBhH1xhHg2gVVEgUqCdT6FEIV3gzSZWUgKeBwDWSwBVRMNC?=
 =?us-ascii?q?gsHBYEgQwM1DAsqFSMPPAUtHYEjIR0XE2A9F0CDSRgGZw8GgREZSQICAgUCQ?=
 =?us-ascii?q?DqBZgYcBhwSAgMBAgI6VQyBdwICBIIVfYIKD4gCgQgFLnsnAwsYDUgRLDcUG?=
 =?us-ascii?q?0RuB5QdT5x6Aa9rNAeCOIFngV4GDJ9nGjODcQGTbpMLLphYqRUCBAIEBQIQA?=
 =?us-ascii?q?QEGgW8LKoFZMxokgzZPAxkPjiE+g0K8XkQzAjoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:nwxaIRLji99XIIeZndmcuChnWUAX0o4cQyYLv8N0w7sbaL+quo/iN
 RaCu6YlhwrTUIHS+/9IzPDbt6nwVGBThPTJvCUMapVRUR8Ch8gM2QsmBc+OE0rgK/D2KSc9G
 ZcKTwp+8nW2OlRSApy7aUfbv3uy6jAfAFD4Mw90Lf7yAYnck4G80OXhnv+bY1Bmnj24M597M
 BjklhjbtMQdndlHJ70qwxTE51pkKc9Rw39lI07Wowfk65WV3btOthpdoekg8MgSYeDfROEVX
 bdYBTIpPiUO6cvnuAPqYSCP63AfAQB02hBIVjLhyQv7Q7z4vjD8lPZS4Ri3Zu3kcOEqQwSZ8
 blNY0fDkyc6Lj830mfchtMl38c56Bj0hF9D/aTkX5meL8tXfbrxWMgEVSlFXchYTBZHPKqQQ
 pIQP8QeMNZFlLPdgkMn8jufLCalNvrV5xtlpFLd/L1h+fY/MzrcgzcaJpEJ6G/NnuvTDIs+X
 sOsnPbLkTnSTM9Hyy2n5pLYK0EeiviPV4p0bvbOlEl1TVjKt1iMpaPVEC++9e4csE+Gz85BZ
 bjzmkQ4ki42iWGX2Pc+mLHOopkO1Fzj8X5cwdgrKvizHR0zcZulCpxWryaAK85sT9g/R309o
 C8h0e5uUf+TeSELzNEi2xf8QqbZNYaS6w/lVOGfLC0+iH82ML68hhPn6UG70aW8Tci71l9Ws
 zBI2sfBrHED1hHfq4CHR/Jx813n2GOn2Rra9+dEJk45j+zcLZsgyaQ3jZ0drQLIGSqepQ==
IronPort-Data: A9a23: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
 Osht4f+IX6Vsex4TCjB
IronPort-HdrOrdr: A9a23:QiOJW6+vPgqm1uYEoy9uk+Ekdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQodcdDpAtjkfZquz+8O3WBxB8bqYOCCggWVxe5ZnPLfKlHbak7DH41mpO
 9dmspFeaXN5DFB5K6QimjZLz9J+qjDzEnCv5a7854Zd3ANV0gW1XYfNu/0KDwVeOEkbaBJU6
 Z1uaF81mOdkRF+VLX+OlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPwf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFc5csvy5zX0ISdOUmRkXee
 r30lkd1gNImjLsl1SO0FfQMs/boXYTAjHZuBylaDDY0LHErXoBerZ8bChiA1mps3bI+usMlp
 6jlljpyaZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh27D3U3klZavoMRiKnLzPKt
 Mee/309bJTaxeXfnrZtm5gzJinVnE+GRqPWQwZtteU3yITnHdi0kMezsBannpozuNMd3Fuj9
 60Q5iAuIs+PPP+N5gNe9vpafHHeVDwfQ==
X-Talos-CUID: 9a23:2DtK8GANnAojaiH6E3hg5VMFC8w6TlbQ4X7zGkaVJVp2E7LAHA==
X-Talos-MUID: 9a23:r1EGdAvy9SgZWRtlG82ntTFoaspDzIGVGkEtlJYCntambAUrNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="34567119"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:44:08 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:44:05 +0100
Received: from FR5P281CU006.outbound.protection.outlook.com (40.93.78.54) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:44:05 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVgl84sc9YCONy30MD3X2ixRS8YmPNllwrQoLaieSj445hOumLaz5PSJDJkNfzGsFfxrE773Yg898/guv84JVt3p8rIQOdSlzRNa0iqqFM1ZXnJ9TqTVQ6wL++c8hFcgKkOjZY2DmbpmAZ0Wi6PXvD4o1aNnFo8/arsF6Mda2lZFzDfA5rCKEnBJzVQq+VOiqISaf9JUH0zh3tv3T/UUz1pebkSrOLdpMkK5KipDaavN96tH6/ibe+8GRkKM0wK8Xai535bsFUt0k2KpHEdjCTyAkI0yl172QWnaaL0c4yxlQUvdpjORAZVkFF2OmS/ZFkdVE0Kln6K4Pxk2UyEGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=ZiWklyIx4Hi495EsPWUnIrh4ajWP3vnk4/+MLvOuu5v0QQKYlWoKOh/cY6lS8SqqEPumWegQ/q7+la+518RgC4J8RaOi8+szmrOlfj4ipdP0lVY/7dZleR8zDXWbwLYHxnWpdZTiriWbGB4X2vQIX1oXVISItMnEiWJ7ydDq0e9dr5afu1ZLoxIx2SNcWui3f833QO7Yt7myrCIxV+ED5yh+7+5TDMPoyMEqmsWKHOTLCb0JafssZJFD4RbiCHHZ1I16eD7hKpiUJrLNgZEDCTd4I2YTIiAL3LWqlOY92lpBAHmj08GuWCLCwJsh7bjPOVGwF4jjBcrU3Pg6Bp706Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=K+TVBXWpcsYAkqDMsvx+lkfasRnVADEqwXFweXuSRHMpA7HIAGaZqRELEJECIx3BzvJSr7SRQ+o0sqZVNPDDgKq87k4dyKTyzr2frx19WCakbPlwTw5h223gQetdGXGtCKbykOuHLIX24yBwQG/C1PvXzzPoLssvdOl3Mi6vgMc=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR2P281MB0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 14:44:04 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:44:04 +0000
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
Subject: Re: [PATCH v23 08/28] riscv/mm: teach pte_mkwrite to manufacture shadow stack PTEs
Date: Thu,  4 Dec 2025 15:43:29 +0100
Message-ID: <20251204144329.10409-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-8-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-8-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR2P281MB0026:EE_
X-MS-Office365-Filtering-Correlation-Id: e369e008-28dc-4eba-ce78-08de33439254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N7dVDwzyjuBVhR2jNDXolvyxdgkbbGNYYCP6rG757E6FpfZoYozGxEI+zBgP?=
 =?us-ascii?Q?XxDeWnTT8oC9oHB6cHWEBmMxC9gw6e6mU9mGPTvWuSWiQVLw5wManlI2SP/q?=
 =?us-ascii?Q?IoQ1SkXESPTeYRobanJ7jGxbEjwaZ16XrbFryUZDXXiZXL6s9kSyclmXBDA3?=
 =?us-ascii?Q?8gVyLVpMrFcziTKvENAZN9jpfuQdNmH7a54/4jhzvvZmFAoflwqHSFAdlMQq?=
 =?us-ascii?Q?2uOmctU9+Mxff2UKZwMy3FETlIl6S3Z4iDWzvWDqGrJLB8Fqre/ufnxXC/QO?=
 =?us-ascii?Q?eVeWsWIysR0ToS8qT2c738ImZna/+egxK+tFq2Udmd2LklUj9ut7HP+mCObB?=
 =?us-ascii?Q?lhFHcvDvPYUyw5lUpE+Nn7xw2MvMDrC4uNdfqBFvfmkz4w9zho+CtlHyAhmG?=
 =?us-ascii?Q?MTVwrryrsgq8qwxRbFgyb7+bWeYFCoVkJWKxjXjrqQQgpqdOvGyufBZ/1VC9?=
 =?us-ascii?Q?Sl3fMJV5Bhqb9pNHJQXfIN0YiWEfuwygRQv6hu/A8HJlLu0LbzOhiRL8Wtnf?=
 =?us-ascii?Q?rMeD3B2xK8EEaVhLVL+3BjvpG72YQInifnKPlMuFbrmvbZnZrkRup9ydNoXc?=
 =?us-ascii?Q?UbUF12lv34nxk44SgRI4nyf5DbuqFzK6XwsSB/yiLbYR1tgX8rLmBG+1tOxL?=
 =?us-ascii?Q?4HhwgcVkNnTpUpVNbbnnjjMr5jnvT6cGOOtTg+i49JvaYQIssRxAoC5LKeiA?=
 =?us-ascii?Q?azi1MyQUMyo2N7D54qGwOx2Xyj2NRRMzKhehwsQbv46DRoiw+aAn0oLVpEVc?=
 =?us-ascii?Q?xKeEqusI1e1DUbEvnAtzIf3ik+rqn/o9evKY2TXrmgwa27RX7TuDE6KdOsXc?=
 =?us-ascii?Q?LT0t1trT9FpRoeRv4Jxvy/G8FNIvyvLUjhfE/fslHzU3lWlvKp+4ZOWlVfrk?=
 =?us-ascii?Q?YAXdmEDn/DVQRdsWbRjh3LitcaqS59qOI+u7aBnQieRpvnNChkHei2WUcGag?=
 =?us-ascii?Q?FoAOsIq+4tb7KxJYQelJtH+dNPtLUtyxQ40Q1K8pbFI5haeVc+JTn5ZXEiX0?=
 =?us-ascii?Q?UA2LkW12Y1ewD4YYDvbDZj1Qok1w6ezQJMTWnejFF00A/7Wc8OWiTOap2lFz?=
 =?us-ascii?Q?3cOsBuyZse6tSpwIpP/+IXOtgMd/1UZxP7jCHRKDrXjsUEmDD7s8o/AWyZNj?=
 =?us-ascii?Q?/e48y6z4ZbWF2tIPXGLO7UQf+4+6dDLP1tELbLV2bxEO1uwkIo28GwbpztrR?=
 =?us-ascii?Q?o74+YTo+Dz7LhbKS08mmTopD8sksgT+CJfEmggiigt84td3Yr/hwK8HdOMWf?=
 =?us-ascii?Q?6LatStEPajSQou0nQpTB72Oi133gEEWuzpVT/alkrTCo+hm+8uPa8XKgL3uf?=
 =?us-ascii?Q?ec25yBFGXD4bYkm51pOzgm97gGXCA+M670FwHfT61FzTOdCtUdt2fYiFlbjB?=
 =?us-ascii?Q?Pk1TlBiFGMBBwTId9mw1/clWaLFN0dsR3qTiqWFUcpt5RgCJPFYtN/3NeC1g?=
 =?us-ascii?Q?lVEkqakObuZH6LXqlnHggolsVFA5pow2xGevai2hAwxs/jEgXS+PSnz6u5Bb?=
 =?us-ascii?Q?odceIoLZsxBq5A1gBtYI5oo8VvKPaQM8Z190?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YkrlzUkfNEdmtETDPPNPUPvNVuDzrP/sh2piJP47IsHstMFQnJ+RW+me5yOM?=
 =?us-ascii?Q?FIUFKZe0lYa1d7xKfTK9rPLTyYJXmaTikMcsVxdScw611y+qR9WtfckbBIoh?=
 =?us-ascii?Q?sDHI00NppEp70clGTp8T4Zhf6bIRo+5Zpq7Nn3MW4H72KzpWmzpl820qcyvZ?=
 =?us-ascii?Q?mhXUhA32O2/Jbv5ER+91qxi4G5FVQqqSJ3kdpOjq/X6/pHIEtqxEIrlf60PF?=
 =?us-ascii?Q?gYAjdyXgKyBWfXqKSKR89SqmrQrIL5XMVE9NyNkE6kMGjacymquv+hSkNk7A?=
 =?us-ascii?Q?5SnYk/491PnHRGVcL/qG7+IOxw3S+pMguE/kH7mNanPWTU0V3kpD/iQWSp+I?=
 =?us-ascii?Q?FjPfyB2YevE5myhJ8JxrfU3L0W62NxxqvwG59ftz8fVkFt++/ATIIlGaLbXP?=
 =?us-ascii?Q?KsM4Te0nYdEWZ2r3c5oYG6gN3GnBNCjJA014hHXKSeyM9bmROStdqJUONoEo?=
 =?us-ascii?Q?GE3LS9XQh3KPbV1er9mmphfDyj0o3cDiZMGN6s9dudb1F8SETgODvDNlINza?=
 =?us-ascii?Q?PYt6Kv+QclSIl+L/+Kti4Od5VEg9Sb0JMw4qFaMobIXw5LQu/TVKGz9vpYD2?=
 =?us-ascii?Q?27gwgDLwVIifZT9xL6TMNCfvIHsGNjSp4V1f6FPG38cSiGRnlvrOZQ5QKr6D?=
 =?us-ascii?Q?PkaxGkuVtblmKF0vENrt2ZVJAm8hl1PqCYb2NGSOoSLuGltvdORBb+tsSrlK?=
 =?us-ascii?Q?kohepcZlJLAylHMpp1xnFAeMY++7hUl3RgUmuzua97A8W5zctvnDF0+A5SJS?=
 =?us-ascii?Q?4Rvjg1zG4a992UGCGxC6k9QFWdbvDO+GZIbiVfw4qvVF0X1JXgoB+l5PKzRn?=
 =?us-ascii?Q?de7PGbghDiYKMhKNGtRB7PoQPX0DZJZwlyftkU5ItvM2xpW12Nd4E2PiqIHG?=
 =?us-ascii?Q?nhCPTsBCHGfiG6euIpt6Afqw+pNOmzEqfYIRt0KvxK9iM/Xv8XjuyzRI9UjZ?=
 =?us-ascii?Q?htNnpnYhz4zayG2ma6AFxoXK9SthMvARnA6yeYahCy+ebLeB0eCWCMF6A3Uw?=
 =?us-ascii?Q?J5YcStesj78Bn3GCquiPS/4qrfRrDdZZrN3gZ7v87SNVQ3aJN0PfpiJfiL0P?=
 =?us-ascii?Q?dV1i2TYbeULExgoLdtq593VzpczZJ03y7p8OrPfChDbQ8/y2012954gx2Xw7?=
 =?us-ascii?Q?f9gBxmv9dgI21kbEKnUJIi3C69dch6tg5EJc6NPU7aGB36IigRcg10BasjrO?=
 =?us-ascii?Q?1G9JBJly69XoM+t6z7Jkms+aoLuz6q72pntlo7VpztxqlfyUJGDvfERSgF06?=
 =?us-ascii?Q?xC8FZaTIk22nQasBHEgtFrR41EvtwAPzA8DU+1GOGk9SVZnsqQGrJSlxrpfx?=
 =?us-ascii?Q?eyfsv31GZURFPnIk6/+r+R8Dpw6rE4Eb012swmC0zof+bBxTKCFd9WZ8eIS1?=
 =?us-ascii?Q?n7nXYrYjf4iELnN+pQ3tBEuoDSt6fDiasueaX7AZ6x60XTL4qMzuz/AJoU1U?=
 =?us-ascii?Q?EVODuX9bp2fbcgESYYgDvbWpXc3CaF+snT1wEzS50kMwJNP11XXAW8C0ZLta?=
 =?us-ascii?Q?QhUDBxvrvm84E6l8Ks/qrAVCDNQ+fa0kbz4zrcwtxSlTC5hitW6mqN17LeJt?=
 =?us-ascii?Q?+W0g+QX+LCd3nui5BkrBRnwm7LaJJAzpf2PHhg9OgwTa1nCOI00ejRomRLNY?=
 =?us-ascii?Q?YN2nIbFZyEFYwmA+qWB5tPc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e369e008-28dc-4eba-ce78-08de33439254
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:44:04.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyKmcvooFEabj3ZKT/rPZ0WQoV+YL5IRiyK+TvBNRkh7YOuE6oRDGoMxEvTko3FyKGglwm38O1xdUu2hbsaEc4RL2RyaYTZ7giok3/on3kI6RrctjTC0W2eBRpxRNN9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0026
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
