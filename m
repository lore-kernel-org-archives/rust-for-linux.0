Received: from mail-edgeMUC220.fraunhofer.de (mail-edgemuc220.fraunhofer.de [192.102.154.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B64209F43
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.154.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859582; cv=fail; b=BtLTNZsDxaQfw6oWre//9JV1LX7QJna4o2RKTBxlkwOSbUXYPhBP5dNnWKJb4XtHAATf7DbvyehpzYr7xnTvDPKIv75biQn52sJeGVTX+Dh+aInnlV1pfq++ocO5P7kKdsQKT8Dxp7ttQ8y7rNkD2ykOM0FFMMPbUBKyuv1OqAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859582; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YW/er1Frhaw/QocLBRN/doUBC6dfi734bPeOXWmABWzQUDE66OJe1BxhaJbC98EajezGIBVyQd7nK8PnOv8b2v0QXObABnRrZqPZlcj25hl+jKDRnsbykIqoFSAzmfdIoAkIiXbVjailYgFLxXWH0wLIMNI2TXNpKfQPBVmsFic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=dCZ5sSWJ; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=qv/9bpfB; arc=fail smtp.client-ip=192.102.154.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="dCZ5sSWJ";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="qv/9bpfB"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859580; x=1796395580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=dCZ5sSWJrI+8N9G9sf6BXbYEtq25y/Iqjf4uinkOoyvMhvi/D0Hxk10v
   4p4GmJ2MP4XdFYs4OMSwEMiJF0XokoqrNQheGaZnirqv9oD2X2Kjoc4OL
   T0oPoUpy+jsZxO4YHxet7BQpFjUrzL2TTHgErFnluWsVUjLdHKsxnpRJt
   oUpg78ReVB0vY3KXTrVcyWgqlKA++dzccFbFFiSePR7x8Cdv709xy6wse
   mcw6ryawdEdJxpJ92Ukbby9O/QdQIDpn7UwlqQg7Raq0paIDxQTc159Kr
   vH6TPwir3k0cHOz2qyTLOJbMDS1Hx233c3Z83ZuzgBbD0qJEwbnFaSLy6
   w==;
X-CSE-ConnectionGUID: b0i6eLm7T7qxMMYY0tYJCQ==
X-CSE-MsgGUID: qzEeOdibQzmqA6OWYv35nQ==
Authentication-Results: mail-edgeMUC220.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F7AACbnTFp/xoBYJlaHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?j9AAYIvrwiEM4ErgSUDVw8BAQEBAQEBAQEIAVEEAQEDBIUAAoxoJzYHDgEBA?=
 =?us-ascii?q?QEDAQEBAQECBQEBAQEBAQEBAQEBCwEBBgECAQEBBAgBAoEdhglGDYJbgSyBJ?=
 =?us-ascii?q?gEBAQEBAQEBAQEBAR0CNVYGMgENAQE3AQ8LRjElBg4FgwKCJQQSAza0RIEBg?=
 =?us-ascii?q?gwBAQbbLBhjgWQJCQGBQQGDe4FygmUBhH1xhHg2gVVEgUqCdT6EWDiFd4M0m?=
 =?us-ascii?q?VlICngcA1ksAVUTDQoLBwWBIEMDNQwLKhUjSwUtHYEjIR0XE2A9F0CDSRgGZ?=
 =?us-ascii?q?w8GgREZSQICAgUCQDqBZgYcBhwSAgMBAgI6VQyBdwICBIIVfYIKD4gCgQgFL?=
 =?us-ascii?q?nsnAwsYDUgRLDcUG0RuB5QdT5x6Aa9rNAeCOIFngV4GDJ9nGjODcQGTbpMLL?=
 =?us-ascii?q?odlkHOpFQIEAgQFAhAIgW8LggQzGiSDNlIZD44hhAC8XncCOgIHCwEBAwmSH?=
 =?us-ascii?q?oFLAQE?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: 9a23:yFA+i2M+4oMz/u5DUnFmqkMwH58ZLWTN6VLhEhekOERCcejA
X-Talos-MUID: 9a23:ruu2KwYobZBq6eBTri3BiRZuNc1R8aG3IR4qrqQY4JSCDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="14644124"
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26])
  by mail-edgeMUC220.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:46:17 +0100
X-CSE-ConnectionGUID: fCWCLlQhST2g4FGP9JMfMg==
X-CSE-MsgGUID: ieGK7DbaTNijZEq8I9syhA==
IronPort-SDR: 69319eb6_TiL0g7guVBblTS9VsDyXeTeSox6NQHGfdJpR726jOUgTt2M
 TH2TXe140cILg0P3zDdtVJdfb3E+QZ+/EBiNHxQ==
X-IPAS-Result: =?us-ascii?q?A0CDBQAWnjFp/3+zYZlaHgEBCxIMZYEgC4FuUkABgSYuW?=
 =?us-ascii?q?4ghAQGFLKE4hDOBK4ElA1cPAQMBAQEBAQgBUQQBAYUHAoxnJzYHDgECAQECA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBAQYFgQ4Thk8NhlsCAQMSIAENA?=
 =?us-ascii?q?QE3AQ8LRjElBg4FIoJggiUEEgM2AgICpicBgUACjFeBAYIMAQEGBATbJBhjg?=
 =?us-ascii?q?WQJCQGBQYN8gXKCZQGEfXGEeDaBVUSBSoJ1PoUQhXeDNJlZSAp4HANZLAFVE?=
 =?us-ascii?q?w0KCwcFgSBDAzUMCyoVI0sFLR2BIyEdFxNgPRdAg0kYBmcPBoERGUkCAgIFA?=
 =?us-ascii?q?kA6gWYGHAYcEgIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57JwMLGA1IESw3F?=
 =?us-ascii?q?BtEbgeUHU+cegGvazQHgjiBZ4FeBgyfZxozg3EBk26TCy6HZZBzqRUCBAIEB?=
 =?us-ascii?q?QIQAQEGgW8LKoFZMxokgzZPAxkPjiGEALxeRDMCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:s1RYPB9dNvzkMP9uWWy9ngc9DxPPxp3qa1dGopNykalHN7+j9s6/Y
 h+X7qB3gVvATYjXrOhJj+PGvqyzPA5I7cOPqnkfdpxLWRIfz8IQmg0rGsmeDkPnavXtan9yB
 5FZWVto9G28KxIQFtz3elvSpXO/93sVHBD+PhByPeP7BsvZiMHksoL6+8j9eQJN1ha0fb4gF
 wi8rwjaqpszjJB5I6k8jzrl8FBPffhbw38tGUOLkkTZx+KduaBu6T9RvPRzx4tlauDXb684R
 LpXAXEdPmY56dfCmTLDQACMtR5+Gm8WxyBsJhLE8TrzUoz3kDfVj9tQgwmIAJzoV4APRyqEx
 P9AUx/VkSYJFTgy/H6C2akSxKgOuQzm9hZnzaTWPrqnGsR0cr30fvlKXWteUtldRgxIBoSVM
 64DDfc+FMRdnojyi0swiT6VBgSzVfPVzhRU2Ubw+pYf3fo5Cz6bjB57AcwVqWmPjMTPJbxCb
 Nmp1qyL3XbeV7Bkhy/Ftq/tXTsFovuBTIBCfs/winU+GR3oh16ck4PdYAGtzNoL42S41LFmc
 8KlgXANtxh1mTizxs4Gi6TRwb8R+F/q0z5gw4EycI7wWAt6e9miCJxKq2SAOpBrRt93W2hzo
 3VSItwuvJe6eG0P1J0E7kSBLfKdepWO4hXtWfzXLTorzH5mebfqnx+p6gDg0ezzUMCozUxH5
 jRIiNjCt30BllTT58GLR+E7/xKJ1yyGygbT7e9JOwYzk6/aIIQm2bk+itwYtkGrIw==
IronPort-Data: A9a23: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
 90RRDBK5f3BYAl5
IronPort-HdrOrdr: A9a23:iVq3jqER+18w+a72pLqEF8eALOsnbusQ8zAXPhhKOHhom7+j5r
 6TdZUgpGDJYVkqOE3I9ersBEDEewK4yXcX2/hoAV7BZniEhILAFugLhuHfKn/bak/DH4Vmup
 uIBpIeNDSGNzZHZKjBjDWQIpIOxsKCmZrY+Nv2/jNDVgdvRqdl5wd/YzzrbnFedU1pLqB8La
 G7zOlgjFObCA8qh4+Adx44tqD41rv2fMSMW299O/cI0nj2sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3A+jnXK2rYMtbkdi66qRLG3IzmUc4OTVb5yE7QGHP?=
 =?us-ascii?q?iBjpHZ4XEa3qe3awxxg=3D=3D?=
X-Talos-MUID: 9a23:AO9w0AUUTpvYb4fq/D7hqxI9GM1h34KvCnIgiMUn6tKVNQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="34567316"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:46:14 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:46:10 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.0) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:46:10 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2erQv6Kp1P/SeRnXoKKNu+fSbOC5ZmXyhKkltW+UYjSI73IPkF81O70YCr3KTlWuhYH/DLk5VE2IbyY0FzApCUO0m7Avt171PvLXGU5Ka7c14COPB8f3SYdpmf+j5aoHPBjD26xV8IRbEMVUqxZD4nmNSogAsR6l5qZJoVuwXd1whRpQEzGzLp+0gXGOzIru6QykuTwk+smRDkUjTc5Ep8RepNQHSG4KK186t1R4OhJ+yXY43a2HxbdDxDEHGNj1fhgRb7aqntL7LNK3QG0wKXl0zko8KLz8MgWoSVQuAFK1KVVWJzYkVvokMxGHVhjYsRUIJPipl80GlcLRoMnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=O72U39DkeKSdszJn48ciKfuf6msosspVInZb1BZZoPqMcKAw+QgQyvl+uFpM2PUV8CTE8u4isPzzAbHfQGFxfz4d3hGUF7SnDzTGDU3fCOkxg3dTfF0rtnG0pfOJRuVAtSFyY419O0ZbRPolElXo+tJUcCvfQ1wzngJDfdVLlRM68UajWhzEysBdtEuLCKMcUb+S9W7hplwIrWgYB7SYTmXdA2oozDy5209rxNBiPIgu9LUfgMDs6xU++XZ6YwKaVZkSHzbKtAxKzWTmmwjDPiXAQmrDwtSYqRUyrkYU50XWFyWfnmEnlXCLC8I/pFPRcz/0Nubz+6ERXUIcxILCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=qv/9bpfBj6SZFVbdvAkB8piwdwdyHaloA4MdjuWAJmYigDxVLMCkew9xRlCt7QnOSMfvprW58z3vvsqu3HyRys8UQtrm+x+uP+Z6pP6OMGCLkbeyZZgmI+TyfvEacdRgP7ZPrVn8dKS3nNHbbvBtqlShthaBiEp/UlZgFNsqkoo=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BE0P281MB0177.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 14:46:08 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:46:08 +0000
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
Subject: Re: [PATCH v23 10/28] riscv/mm: Implement map_shadow_stack() syscall
Date: Thu,  4 Dec 2025 15:46:01 +0100
Message-ID: <20251204144601.11154-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-10-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-10-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BE0P281MB0177:EE_
X-MS-Office365-Filtering-Correlation-Id: c0731c85-3bb0-4b48-c0de-08de3343dbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?80tjcPiQFl/5vY9bd1l/FbLStR2le/GwvLNDL8inZd03LUGu6tRTaEwrkt0f?=
 =?us-ascii?Q?+3aRj/T2pKB4rPKUVtbcm3CZzH2Mm+KbFGZx8M879IMqMWW7t/8WgJ+MmRWj?=
 =?us-ascii?Q?9S+EgVLEfzUCSFW1qa2wAfKJcLSkwTwN5B116Mc1047/x8aorM/77YGhp60v?=
 =?us-ascii?Q?VVg5oL3h35ptarvJ5bX0THoIQ/W2fMBuYlDUSHn6gud+wcaydwGMTBZ2QBGa?=
 =?us-ascii?Q?wGUUovJgIxMB4CMK9pUC/sxsn/lbQsTJ8k2EfinfQiMLv0E9wGsthkP6Vs35?=
 =?us-ascii?Q?nevkxbPNpYbuPOh743n7VjQDryKp/QKG1oUzjz/dttU/bnc3vJFqjXmHaBkx?=
 =?us-ascii?Q?P4DEhg6X0ueXCIBHWKoORM/j7dbabWrLxwTXIWHVy2aXzjfOKrVG/Hhphy19?=
 =?us-ascii?Q?HYJPPzHPxuNfWVLg8UizREs1qyM8kloMgiKmThxWF+o2G5+QBU1t2og7/jz8?=
 =?us-ascii?Q?GV29JefMH2jb8hQVz7j4wEH38VtS4s/u1icdrJXKQSZfvxB/h82yqak6M31e?=
 =?us-ascii?Q?3w/8Q+3nVK5j6HdVqQBZtRElnqLXXDhStDK49q5THbsmKtisAVpMk9Wl+bID?=
 =?us-ascii?Q?GuGTDc50DGCxRmjU0k7CqYvgpkeKIO+j67qd0MMqJxw2aydAEuPDcZBhJ8+2?=
 =?us-ascii?Q?DPGlDYbf/2uNanHbyc1fIg5Xd7f2gNGSfShlDp7qKP7fFeulaph3pTLm5KF9?=
 =?us-ascii?Q?d22rrFDZTR25lrnaAb81lvcDlMiljE5Wsj8X5/atX5cfMtSfUNvroZPxZ/EP?=
 =?us-ascii?Q?4NUeLKUgJKqvNTwKv5FEMwwhMNeA72tp2DfarNQuMpeCONU5LfV+ZkNNA5TW?=
 =?us-ascii?Q?5yXNabqcNWRDhVQtpSkk1kJ5eKgZCoaOVWzQRdD7zERQzv0rKDnWdgzgAJCH?=
 =?us-ascii?Q?j7sTRGiA3jSpf63o/Q2E4iUzIaPa4/dFVJWVs8qfu9dosBU1QE0n9KqdHyT5?=
 =?us-ascii?Q?oliABm+ygBGkN8CnOXwkP0f72jRqm+lBBFb3VppwcGYHAuPmkbiT0pomjdR7?=
 =?us-ascii?Q?jhT7rrMIHPfm0qMiROVzt1Pln1Ho85NPSBD5fN17EwDiVkJn0lrUJxRmyolS?=
 =?us-ascii?Q?7ueMFonaO6NWfC6uY9FHQwUq8y4bPwT4yO/8fIbD9y7vYXDaXgIvpHcIt/Y1?=
 =?us-ascii?Q?wwdBn3HZ8lHwMTICPVbDS69AX6YlLDlc/OFchGWvV5BrMpJQthOOlYY0iq4+?=
 =?us-ascii?Q?idGumjop8KDOMw5I6bAQ+iXsbU4EUw5bOtDuIk2NDeYHip/inDvmF47QCfaz?=
 =?us-ascii?Q?ZKKPWsZh/DBh6GEVfYshKMn51t43LC+hTtlfW4Q50jJ6TjjYmaTh7L9i0xmu?=
 =?us-ascii?Q?8GvdSL8Kj5dV1s+e4/spqKXeAi4V31FgqJxed7ZsugD22d0tXZjo3VDIjwoO?=
 =?us-ascii?Q?VFu1QKVu6VTltrdwtLuJFWcxNehmP0o9ae1KM2rflThYMIaA1tnpcnwzKf1Q?=
 =?us-ascii?Q?ZYQZEwDijpSs5xyPKmbIr0LNswyWYoOp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GaessyMVpzKfFhp/bbF+1AQCdvirr/XC/B8sGYbzHvL498J2wZO0wYKLn1UV?=
 =?us-ascii?Q?QRed80/7yHmkHLLnFBKFLGNaw1KffZLXnWZoQfOizI/+yUX56nikvbNqw44I?=
 =?us-ascii?Q?n6xq1GS/a33hKMMmnMSIEihBPtQV6EVPiftv1jpB+xAo3euzFCDiFubKCwXW?=
 =?us-ascii?Q?ABy6dOvJ3nAkSIJfAR1u29w/PzpmpZTBeNxEI3EmqE/qQsFwjruuJ4iSoJ8F?=
 =?us-ascii?Q?3nkWG9j0xKEP1pBNCRcSONY3ilK1nTR3KLarsTcgxvyhXxi7lD33ogkq/MAW?=
 =?us-ascii?Q?6XsmItNpXMOSXR2ZJ9o1Ldytp4m/qBxQxFG8Z4tUzadaQyAv5kSth5DYsfA+?=
 =?us-ascii?Q?RtzFHh9lkzpXPevCYPtY6mMUX+jTfzlVijdc0IveYd2vijUdjYYtIZegXD6O?=
 =?us-ascii?Q?U6R0jzIHmfTuo65NW1WpVlhApaHU6/q4VWov59jak3x2V1rmhY7Hx55DD2tB?=
 =?us-ascii?Q?q+pA9XX2fE5nn4wUKEdl57yYRyh0E5KrSPT3V/xvqEtkDs3mfm2mIFlGt+fd?=
 =?us-ascii?Q?e1GY+4LVrYDjwD1Qci00tmcXNUpga4pTjT5zmZbhHOcKvqbQpTQ4b4knA1k1?=
 =?us-ascii?Q?dMx/lAO0TG4XRMGdexs5HajJ75PqLLsQ3fNmduKmkXNNU1+CKgXHXxuNQmwo?=
 =?us-ascii?Q?FrTw7s2xewpRXDx2A96dFt8fJwnTLq01XtuF3UoaRBxeSpNqZGeiuM/Hs8np?=
 =?us-ascii?Q?MvdYe1m6KG4JBW9eWOTrID0x8DGIzZzqsapBjZHDUkyE3tKkSPlK7QSd8VgU?=
 =?us-ascii?Q?T6XYl7yLSi6ypKUWfXoVVII3wZTqgnA3Plo+NnjcikhicdENFmIOVhjj+2rG?=
 =?us-ascii?Q?NLoOvtIbGyjGYQBfGKK5/w86OlmGPFqoO1nrc50/esXFzxAC8EklmPncqaBv?=
 =?us-ascii?Q?2UrCgfCU/Ze6jtcHIHEnP77GHYD0QgWiPiR72UaL2iYbXNtRlMMk3CYuHEuc?=
 =?us-ascii?Q?ccbdq0IyKLHxKt1T8ruRdcW7c+Dji3R7gAceObJeJbvqb/YmJTnpR3/s8303?=
 =?us-ascii?Q?NBTpJCNaBn8VKo3US7fvxq5qwFXcXIj5Vpgzgp2+XZ3pcII60J/DmFKSRDDI?=
 =?us-ascii?Q?xIeNR1SH4pbBRfS3o22j8K0VRHGKfQgYG8NuDZALttJ9DmCVGNzoG4z65D98?=
 =?us-ascii?Q?u/cFJWhq+7ieOfXLZ/EsXznGnZj4xrxVEh3QykNSm2cBIm7UKqF291FO/QDS?=
 =?us-ascii?Q?HWK3yZQ2kgggSy4OTtP4sNt2cB7RVXSnnJ1ERDXvp4eKUaVrDEj047gMsXP+?=
 =?us-ascii?Q?RA+pwaA3UbsXzsRAvBGlKL38LPg7EmGqRrpErB1UPT0z7vUUw3BxqFgGhjVE?=
 =?us-ascii?Q?A8qf+di08+wE9b7cqIEXZCKWRN//r+AQ//3Lunod7T1PJQU4KaNTHfHxVUxW?=
 =?us-ascii?Q?fE4BYuYwgkGypJuQHfQwL4ID3eb1ad6Jn/6I9hucHEh3hUK+TKPlqwsNpeQ4?=
 =?us-ascii?Q?4JMkkFzo9NyE0sPJfbCIbiAQ7cVdyswA5/GcK1MhySP1azdgCIkycKJmke0W?=
 =?us-ascii?Q?LUMggysI1NEY7XpZyvUuEgNHO56JWUROy3iMHU/VSGMWz0b3Lso2tjWpoPC6?=
 =?us-ascii?Q?GzAXWXnZHStXsTV4oSXVIy7qbao+eHBGGgD/Nx3QKAgOD6enyCkiI5jjcpuN?=
 =?us-ascii?Q?6ju8ZAUhcfNLeZN6YQyAeYI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0731c85-3bb0-4b48-c0de-08de3343dbdd
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:46:07.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhyH2y4TmgCrbZcOucVC91+g8BVxZfWSLeOl9yV9Sk9j+iXXZ3FK0vsVmWyMUVnx5BwhTlnAdXeaH8yC/rjO1Q0p7TIDTz19W4pNMdslnUWXCWsfWmg+YKKVEPGs7wPB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE0P281MB0177
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
