Received: from mail-edgeka24.fraunhofer.de (mail-edgeka24.fraunhofer.de [153.96.1.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A1D27F017
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860047; cv=fail; b=b+RT5FUIDDlte5lIMImME1RrYzIvoyA6xEyTHcO60gKQipbru0jf82yDHZrTc/g1dIhE2MLynFA0fot7V5vgjaroCzq1TcvV5XwrYMwywYxRhqVvXOAgbddKQeNCOImlUGv45uNNJK8RKOYIO+IYXl8ZPdfp8vObJOEAk4OgAKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860047; c=relaxed/simple;
	bh=83FxPjY7TM5974i12o/zor3UwAGgZO3U/CfcuxnWW8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PasmbPOIlaKYyQXdIJt8J2TSVkC+Rp7H3hnEFilCLgTed2tx65IHN2VfpjOs/ads55/GEVyJ6jv13+9oojYdIue5X8JlmGSNvSIM7G7A5FZdDmhJbBep3m5G7yD1pQZ/knLIa0DyLa/XeZ+UIbKYTE3zAdN+XKZ5MX/iBqeZ/Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=xF7TgTxX; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=n6fzT4dF; arc=fail smtp.client-ip=153.96.1.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="xF7TgTxX";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="n6fzT4dF"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860045; x=1796396045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=83FxPjY7TM5974i12o/zor3UwAGgZO3U/CfcuxnWW8g=;
  b=xF7TgTxXeOAKKgJqxEyrTAfy7bmLZNQz6w5lo4Ke2MAgq6AoZYW3FvVZ
   qVXBR5XnjXPuKK+yQwD3kcKrgg8AbBmgN4G/ZIz1YQYU3sDAX+Bi61O96
   C9wpP/h3ywr3QjSpE589+/FCfUCvVW+zeBPUFyOJwIn3QslBvkeqPBcZb
   aRh9I+MtccQTIO9eV4FpSbR4Wv+2mHtgLdYWsJdD3oU5Moq+5VWaZie5j
   W6iuHThKa1BHQVRa2AMv1GrA2F4QNAyzdXOcLXO3lh3vISNSJrkYmzEhJ
   qIKfDtc+KrbPNHPLJkdeevRMj5QMfmpqnUVoWi4bYWvjLaRpbJ5JHbXYC
   A==;
X-CSE-ConnectionGUID: fM5rPQ9NSOOG6puB7c2DtQ==
X-CSE-MsgGUID: OgynAD+fTSu4q4BICM826Q==
Authentication-Results: mail-edgeka24.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BAD8nzFp/3maZsBaHgEBCxIMggULgkBAAYIvszuCU?=
 =?us-ascii?q?ANXDwEBAQEBAQEBAQgBUQQBAQMEggyCdAKMaCc3Bg4BAQEBAwEBAQEBAgUBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEdAjVWBjIBDQEBNwEPC0YxJQYOBYMCgiUEEgM2tDeBAYIMAQEG2ywYY4FkC?=
 =?us-ascii?q?QkBgUGDfIFygmUBhH1XGoR4NoFVRIFKgkQxPoRYOIV3gzSZWUgKeBwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYEgQwM1DAsqFSMPPAUtHYEjIR0XE2A9F0CDSRgGZw8GgREZSQICA?=
 =?us-ascii?q?gUCQDqBZgYcBhwSAgMBAgI6VQyBdwICBIIVfYIKD4gCgQgFLnsnAwsYDUgRL?=
 =?us-ascii?q?DcUG0RuB5QdT4IzmkcBr2s0B4I4gWeBXgYMn2caM4NxAZNukwuZBqkVAgQCB?=
 =?us-ascii?q?AUCEAiBfoIAMxokgzZSGQ+OIT6DQrxWdwI6AgcLAQEDCZIegUsBAQ?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: 9a23:BKa4UmFdCzZcarvvqmJp0RMOIvl0VEb661iOO1KSVm0zZKGsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AhAZnuQxWEdVEeW0K9t24m+tRsXKaqIOhGUYkvdY?=
 =?us-ascii?q?Ih/KZaTUsERa2qWTtHLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="35872150"
Received: from mail-mtamuc121.fraunhofer.de ([192.102.154.121])
  by mail-edgeka24.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:53:57 +0100
X-CSE-ConnectionGUID: RhPvS1sKQsWoATRy3P7y0g==
X-CSE-MsgGUID: h6PKOq53SxaftUB+rFG8mQ==
IronPort-SDR: 6931a083_//E0x9siTs+ZW43lWs9yc7t2DeVAnajgeu5RHf65SQ8uaxi
 xdKp9EQIqAnTHsSz39lSgO13bqWbgSRakf9Ul0A==
X-IPAS-Result: =?us-ascii?q?A0BBBQDL7aZo/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBghOCdAKMJSc3Bg4BAgEBAgEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBN?=
 =?us-ascii?q?wEPC0YxJQYOBSKCYIIlBBIDNQICAqclAYFAAoxXgQGCDAEBBgQE2yEYY4FkC?=
 =?us-ascii?q?QkBgT+DfIFwgmQBhHxXGYR3NoFVRIFKgkQxPoUQhXeDPJpQSAp4HANZLAFVE?=
 =?us-ascii?q?w0KCwcFgSBDAzUMCy4VIw88BS0dgSd9hBmEJitPgiJ1gXdBGT+DUx4Gaw8Gg?=
 =?us-ascii?q?RUZHS4CAgIFAkM+gVwXBh4GHxICAwECAoEcGkADCxgNSBEsNxQbRG4Hk1WDL?=
 =?us-ascii?q?JpHAa9rNAeCOIFngV4GDJ9nGjODcQGTbpMLmQapFgIEAgQFAhABAQaBfiaBW?=
 =?us-ascii?q?TMaJIM2TwMZD44hPoNCtzpEMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:uc0kXBG3CRNEyHqiFjEvVZ1Gf3FNhN3EVzX9l7I53usdOq325Y/re
 Vff7K8w0gyBVtDB5vZNm+fa9LrtXWUQ7JrS1RJKfMlCTRYYj8URkQE6RsmDDEzwNvnxaCImW
 s9FUQwt5CSgPExYE9r5fQeXrGe78DgSHRvyL09yIOH0EZTVlMO5y6W5/JiABmcAhG+Te7R3f
 jm/sQiDjdQcg4ZpNvQUxwDSq3RFPsV6l0hvI06emQq52tao8cxG0gF9/sws7dVBVqOoT+Edd
 vl1HD8mOmY66YjQuB/PQBGmylAcX24VwX8qSwLFuUGhcIfJsBqlis8giXbGPJSsSvcmXi750
 rhCZxDar3w6cBU3+3zHjPNP3K0O83fD7xYqxdDacr3JONREIqPvesMBZHtdc+Z+TAFfOqrhU
 KokAdgaGshzjo3to3AVoD2FWCSqXb3XyRpt2U7c2PAg1P0ONw3s11c7BegMq0X4sOXYKoINY
 O6P4+7m0xb7b6991RPRxI3ObzNws9qLZuh1SNH460oISzH6l3/ArKD1Ej7W8ctS7UqBwfVqe
 rnolnAAjTooqDOQ++4ti6jUhbkF0Aji9SNag7g4IN25eGxwNI3sAN5RrSacL4xsXoY4Tnp1v
 Dpv0rQdos3TlEkizZ0mw1vad/WiTqPRuEulWvyYPDF4g3xoYvSzikX6/Uuhz7jkX9KvmBZRr
 yVDm8XRrH1FyRHJ68aGR/c8tkes0DqCzUbSv8lKO0kpk6rcJZM7hLk2k5sYq0PYGSHq3k7xi
 cer
IronPort-Data: A9a23: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
 90RRDBK5f3BYAl5
IronPort-HdrOrdr: A9a23:PJl89a9dv0JC98j2yPhuk+Eidb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVcqKQwdcLW7VJVoLkmslqKdjbNhRotKPzOWwldAUrsSiLcKqgeIc0KRltK1vZ
 0QC5SWJ+eAamSS5vyKgjVQfexQpOWvweSDnufSpk0dKz2CJpsQmjtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTAyYt6gDncIcuDfr5mT/aiWFiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7WQywPa1UXU85NK8eGRvudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30mcd15AY0RLsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGppnYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuJIO5lbZvs3+9La1wVx4SqbpXWN
 WGNfusrcq+pGnqJUwwvQFUsa2RtzoIb1m7q3M5y7KoOght7Q9EJnQjtbAid1c7heEAosp/lp
 b52+JT5cdzZ/5TUKV8CY46MLKKNlA=
X-Talos-CUID: 9a23:VIgkGmGJm9QGQ1qIqmJd9HYKIZk+UUTG83D5H3WpUl42WeWaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AAw772Q5w153FmuTa81s79YFCxoxovZyNL1lQyq4?=
 =?us-ascii?q?WsseYCAYzIRmy3DGOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,306,1747692000"; 
   d="scan'208";a="32648699"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC121.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:53:55 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:53:53 +0100
Received: from FR5P281CU006.outbound.protection.outlook.com (40.93.78.50) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:53:53 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkNYzpV9hNoLa3MRYH2OoiuaAuJsXnQAK8zkdB1y77E76JDXmxKqjD+Zp1UDREeAGdQAwTYv0G3VqwZn9iwu9BkQRYY4rQVp0ESoOpJFU9+VrYN4b+11XmJNU4FNHv0Q4EiG3v0R7cy5FMg4gvs61FrMBWfQx2YWhRLEPMXzbxpIRetzqrlqigLLBLXWIsVNX/0tjz8zGQ3d2mWWkIDnG4tbBt1JBSQ5A/hyTGOPoh4WqZgUZAIr0SulpUrvooRJNgZD/pEoX0iBzvi1PCw4MgxGa4CPg9nYIY9ZJ+zsCSDZtA1NKP4xEscyp5zE8EC1AFHeJDp+z/nasj1qTB6J4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83FxPjY7TM5974i12o/zor3UwAGgZO3U/CfcuxnWW8g=;
 b=XGsc1q5+rqfY7ToY4MPBGBysfaAkvmoZfYXzeYIOZWVFKKl22tzlInkrrxonhjv7nHlJBErYCrO4t/sfT9Ku4DKymIRgRTfaPY7u7gvx3pczghUOjmNF4dJLBZpEBSS76/vgcls20PlxMvM0fT7wFjgL2VuXDi9apXKTH0sAhvIbVLnk3LMnk9uPXXoK+nwRCkze4S9GglxGR/uqXHunf9k+Y9ZJVhbJMSLlNrufoN4fcM+BiyQ33Vd5O4A6wcVxZfmuDGBmbzuaEsf3eW1N4HuiWVSKGCh/+nPGk0SGRFpMa09Zb9P3TzwS15fmYJgUUL7kiOA6gbTWFfvqDmK5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83FxPjY7TM5974i12o/zor3UwAGgZO3U/CfcuxnWW8g=;
 b=n6fzT4dFR4hZoxsIytEHGsEvPA5WICfZsOFCIlxlCseNS5En16PkMM7YBm5roqGNdBc3srRjsYDtXEvMwYfRG/FvKPh4CdLDDmnuK9zCoS2mQsAJkO4ZWqB8mDxEe+OG76JrFwbG3/uvONS1bcWUAiiIukSxr0NhnK+VemhiXJc=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR5P281MB5029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:181::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 14:53:52 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:53:52 +0000
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
Subject: Re: [PATCH v23 15/28] riscv/traps: Introduce software check exception and uprobe handling
Date: Thu,  4 Dec 2025 15:53:44 +0100
Message-ID: <20251204145344.12844-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-15-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-15-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR5P281MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: bc326ad1-61c3-4e1c-2b96-08de3344f065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mk0Xw0yyOe8wLhrCvn5S4uIcG3hCzcV5xc9G9w6ZvwZty8EY1HMLBWFSgDtC?=
 =?us-ascii?Q?ZSThfie09tPIrcPI5JmvgqJNkDkSRaIgeIdDBh74Hzw5Xn8X7bZJCx1v2JcU?=
 =?us-ascii?Q?mb0Rzr00cxlcZ0Jz6lVIp8Vvs1mLgWBgx6QBxv1f00lR7lsXoro+ZHZGQDhR?=
 =?us-ascii?Q?h7kttzO364Orf+HfcNRWkTSBkqtQYidf+Ym6VyNeewbTHQeaMmC4x/MJIwlb?=
 =?us-ascii?Q?2QbSYGFoYp2L9N1vqmOUaj+FcIO6cyhsKHfCbvjqFU1Rcrgsd7u0mlpqHV7K?=
 =?us-ascii?Q?wiFS1BunbnoPDoaNruOBL2Iz6n68e9BeIQvWTnEqwi85UkvWPIA7IcIOrMaj?=
 =?us-ascii?Q?6+kxuwKdYYO0AgZM/W3Ap2sCqPgIDpjTmLPfMv1nmgPZSI0o6v+tZznaUqhD?=
 =?us-ascii?Q?Q0DGepBNG9bsbziorRv+z35FXe8EvNCUNEcYJbyqlAlGCDCGuONdF6n7W8+A?=
 =?us-ascii?Q?one7uBjIfwr1TVXgcibb75DjBz/r49G/HkpRcZE1TQa5pbHCV0cEfEyT4nBk?=
 =?us-ascii?Q?R6hZpRNBhk0/8p4ypGJtCjz9WJZKJiO3eHUXrz4Wi9i3BAKqoSm5KiBzlhan?=
 =?us-ascii?Q?2/kwNUtldagR9Ga2vtGVlaA7ziCiFHW/aMdXXUseVDjNvLdfOOA6bgF4LC1h?=
 =?us-ascii?Q?+bQ3DX+egkqfKUG701OR36hBy5mU3NkZudKADGhudAuEdMm12c4efyoOIghY?=
 =?us-ascii?Q?o3qZZyRgiAR2IvBTfizYwT3AlmDrnAy3WsStULDnQxjaWu+dmZqL922FeFv8?=
 =?us-ascii?Q?txLoVExB2/H2dJoMNN5L1ZYGaAxKf7Huf9sTHSb1zklTKWYRQhIW5GoRoul5?=
 =?us-ascii?Q?8eqBNgqCwZ7GDecU/wa+Fl3vEtNg1dDlKWPiCCCpWXuemqw3uInibWmzzHbi?=
 =?us-ascii?Q?FNOXsbpV0GRdp0CsZaOShrA/el7OFFF6nywQR/BmCjW15OsG9wi/gVe2P+hi?=
 =?us-ascii?Q?ygmKslME++8N//IhQw9v97wjeYPC51/nJR0Z7Dcp03pfZLjgrCN2UJD62zc1?=
 =?us-ascii?Q?GNvEIh3OjsOpYHrXu230csw7RB5I1baTl6fU+FNednbdFb1omFBPsSO8xjLp?=
 =?us-ascii?Q?gsyjdJ8JI8SajnhQ134bahFcumSPBJi8nQu2d4a2MneQZf/qU1yvxjdUP1eM?=
 =?us-ascii?Q?oCOkFUzuiWGUVbAvdd+Z7Ze38ZVNGfsDYomy73kq7bbBoWRN6vWMGYutvWvN?=
 =?us-ascii?Q?41xfdrIJPQ9U3oVpzexn+tKh/eKImaZyjN7ZZ+o9leHf7MNf+3PxsaoTl4MD?=
 =?us-ascii?Q?LN6V0dLeEQGZjTTwltomRfArBwgTNI9AULIF+mKt3wMjA4DYKp04akg4w1tT?=
 =?us-ascii?Q?44SOPyg6nJKKeC8Rk1DE3U3Hj3Lk9EFYvqkifEaAh9EioepBA01LzR0IwlM4?=
 =?us-ascii?Q?lLgCZEpNTMYT7QGVrcFzqUqt6Mv0WcdsMTeyYDcUmACCFe/0wHuWiBox15yA?=
 =?us-ascii?Q?SR4yvPEHaIqb+E7UIAdwQCe2NUVNhb5y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R9VP14KecUUtxpPeb3ipMH2/hE27cIPUwehRTxUJWJI8MA3okybyvYHykOsS?=
 =?us-ascii?Q?2kUMKyrFIsV1J6TEcvU8Mc4epSkFoicm8wQyC8oCMXtKrRSX4USBjiy1WWTd?=
 =?us-ascii?Q?Pzx7/TsBH3hC2Kw5tZqVic5YWV6uTnhDjdeIyZuW0cGYVk29LUoluBu8jmP2?=
 =?us-ascii?Q?KOQdiRQlXtUmWVhagrFDt9YKqKFJ3Ii+0qU+Vm9nRZC0RibdTCujHbNuhiuN?=
 =?us-ascii?Q?CoIUVFMEmwG9rXqQ6Y4DHggbv0FkJD3v+9VOdts+AJusqnoXm+JPC83BhaHf?=
 =?us-ascii?Q?BKbTdm3lh18zkzzgh1TwrFlVjPgbt3UDPOtO87B+rt3QBanXnMkmW39rvYRY?=
 =?us-ascii?Q?EKg5uv+NDGQKfU5gyLpMq2uExFEIYWMLN2tjmx+UrevHT3iQ1C+TbJ6cSCSa?=
 =?us-ascii?Q?nRZndfu8bGPoA/Lm0amAHc5epJ/VJ6oUDfUA+giSCNeZXKHA7DqhBzHfxiVC?=
 =?us-ascii?Q?R35ZQ4mp3hEFZhY+FgDSoBSQKwFJ+MdRkWKvBvOlYHDbxblCgdPOIoEcdvZR?=
 =?us-ascii?Q?RLP+tSb+SXJvH4vtAVn02NS68WjpIU56Am3BzhcqzA/VhsEberkE3DM+fmiN?=
 =?us-ascii?Q?Jj8m4wH+8kTyQeJyTCqt7M9gCyBw2hjRbdvFs6jiOXCO3y0nTpDd0ItVKi48?=
 =?us-ascii?Q?dksGlURBn+2G6bzHyjFcDpVhYQBuaW2yFbuGRvg3JsjubJZWU0PrWsCMs/fW?=
 =?us-ascii?Q?pK3/iIq3Pl66/U2nz8FT0bKg8w0q0eH3JVVcx/02y6k8FBy/YHV4+oDp4FIq?=
 =?us-ascii?Q?xh1Zl9klHHIbQkRH2FgP2BA7jbB09HNUnYlvBPD7F2UD5zNIqTJB7lJXOJgU?=
 =?us-ascii?Q?LxHqNgdEzVt1pHoIFEfneeEIsVFC0udBx3aMoLN9quO4L26svWpR50ZVOQcn?=
 =?us-ascii?Q?tiriDFcdLFpew88g3qfvPW5MYEjSoYc4glFHd8VPTA5pzXmkLQjvy4uDD9a/?=
 =?us-ascii?Q?o7CrobMwdWpN9ROqgMV60ZOXzjf/sHq+3uXFqI02equ0538NuOZR3it4LEN2?=
 =?us-ascii?Q?IG8dsA4Kuq5U+FrKgPNfsG22cKvhJK2m1UMPcu2J6DZjeQrAN20jQnw5zn8u?=
 =?us-ascii?Q?Z8NlLMgNDazFRsylOHznsgjtCmJZUpeCm0xx2aBUzz1NBPwCAR7jTZGjZsht?=
 =?us-ascii?Q?mdpG2+iTfpGO3G7MnU0oADA4Lqtu0Xvn9JWaBk3qDbx3ec/aKSTxfKqwNB8K?=
 =?us-ascii?Q?NCCWaV6qm6JdNJuN6+QlpPIVuv/XkTcECy05o+av4yrLifNJ/1U1pHUXbIx/?=
 =?us-ascii?Q?0oAY/CNG2iRqQ3QvjvD7O2F+6V6AJD65Iv2Gk5KzSyDXBRStLPLj3W6Kno5g?=
 =?us-ascii?Q?Zv9IH8yhbdsJnLALYfAKrPO9TimWiqOsNp+HL7h7nbOouKvvdePyoFnf4/pF?=
 =?us-ascii?Q?7zsKnPahkWZLmZ8cYokhyExcTIijF4jyVUxpTxK8fSzYVxrgAqJiAyqO1yiP?=
 =?us-ascii?Q?AhaO/c25BZigXH8efj3R1OpITPO2mcWQSvfPNdKxCB9XgCDJeSW9DiEBE7Dc?=
 =?us-ascii?Q?5fV6EDpx2rN4aE+USiY0r13jFDIAIaWAFXD7/vvgTE7Ws1roIwP45I936E2v?=
 =?us-ascii?Q?peYts+PTi6BoPeiXnOCB9X9Ps4+H7ih/uINUOaoLe4RBB16CWYulFwV6GqKl?=
 =?us-ascii?Q?rjkRFIK6cb9k39BCCg5Mun4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc326ad1-61c3-4e1c-2b96-08de3344f065
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:53:51.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +W1S3btTuexPn0chv3uVyO0osYofYgyVbQymroDT4Msg/91nkJGrK1rDSFLfUmZgAijmPvgnO7jV1zKInkrLSKKVNsbzvoMLMyb5FFVs88wVlP93P6eq04aOxvSjpkwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB5029
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core
Only software check exception tested, not uprobes.

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
