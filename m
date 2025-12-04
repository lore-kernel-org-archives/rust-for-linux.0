Received: from mail-edgeka30.fraunhofer.de (mail-edgeka30.fraunhofer.de [153.96.1.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECFB345CDE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859519; cv=fail; b=UxYSMREKHoD6CvT2ee8qzYvXkMOcbrBh3Ogdnht2huErgA7YkrEh6YYiDQ4NJB6rZus51E705YvqRE/d4RCZHDTlPEwVJaDkmwRkkOjL22Uer4hL3C9mkZDiz9BFQNtG3sIrnBRJ0xUwauaikEcx6/K4O5Xlpw/ROXuCO/Oro9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859519; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t4fjTVMOq/P9ycx4P+IEe6DEcsk8cRTt95qk1DxaJ1TOhGD1JRKRsH1J8GkiFKu9vCpIioCtL2xD7WJDkZ4faNo2L1Nyq7BSkn6sYlEIGUCOJswAFqXaZFoH0D0vHj+jgfu8mtVCpfNTlsYLlryp5mWH2lns0MXroRIkL97/gK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=stPJYlpz; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=nT11QuA6; arc=fail smtp.client-ip=153.96.1.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="stPJYlpz";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="nT11QuA6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859516; x=1796395516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=stPJYlpzW/jzJC+8DakB0RDSVoTwe+v2XXJVw6W+5gJRQjCXxPRFVyNA
   47SXtZhqeFL4Ax/zYzmpUCV0/7gcKOo3TO8k9fC7oxs0/97A979W39otZ
   30JBhJFFRrfWM1zkCue7Mrs7GUvlvaiGRsWhwe2dkqCzTO41r/zH45OJg
   3mVgdNhgZRsywN2IAWEW0KjUN+lH7Hfldk0ws5cdzmczuWPuVX/PpfDD3
   Th05CLgrXQa29YcJDQVwaYHuFT/f3PbgBMd61ykiucQpmG7F2Kws7AYbh
   UGuIC0xewy79f571FhDmmdQUX8uuzX/opZWUuh6Gc7kqf3y4FR+aXa7+D
   Q==;
X-CSE-ConnectionGUID: vPRheD2YTt6Sr/3KjXsrbg==
X-CSE-MsgGUID: oBhi9GGoSlKbgZATYOTsaA==
Authentication-Results: mail-edgeka30.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BAA4Va1o/3KjZsBaglyCQEABgiWzOIJQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMJyc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwg?=
 =?us-ascii?q?mQBhHxwhHc2gVVEgUqCdT6EWDiFd4M8ml1ICngcA1ksAVUTDQoLBwWBIEMDN?=
 =?us-ascii?q?QwLLhUjSwUtHYEneYQVhB8rT4IbcoF1QRk/g1MeBmsPBoEVGUkCAgIFAkM+g?=
 =?us-ascii?q?XEGHgYfEgIDAQICgRAQAm5AAwsYDUgRLDcUG0RuB5N3hjyBJpYUAa9rNAeCO?=
 =?us-ascii?q?IFngV4GDJ9nGjODcQGTbpMLjyuJW6kWAgQCBAUCEAiBfoIAMxokgzZSGQ+SI?=
 =?us-ascii?q?boldwI6AgcLAQEDCZIegUsBAQ?=
IronPort-PHdr: A9a23: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
 QOPGyc7sXCVBfzUGgr31Q==
X-Talos-CUID: 9a23:Qr5rUGxF4ObTdzbRVwrfBgUKIvolf1GH/UvMfXSiTj1KSo2OU1WfrfY=
X-Talos-MUID: 9a23:qxXkgAhxMplpgdx2FjytMcMpM+1o4vWBJ0c2lbYMtPutCR1XByyUpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="26279171"
Received: from mail-mtabi114.fraunhofer.de ([192.102.163.114])
  by mail-edgeka30.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:45:12 +0100
X-CSE-ConnectionGUID: 8cmU/tv7TBCVBI+IS78B2g==
X-CSE-MsgGUID: oSfpzZw/Tz2I3NtHps1wkg==
IronPort-SDR: 69319e78_bmJ17QXN21O4HbI+fIqieR20uzaZNfhM/7CeiNxDLxHNxj5
 QpHX4pDbYEgOprffPjq2PPJSDDDdf0j2M9IaQUQ==
X-IPAS-Result: =?us-ascii?q?A0BABQBMVK1o/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCYnNwYOAQIBAQIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBAxIgAQ0BATcBD?=
 =?us-ascii?q?wtGMSUGDgUigmCCJQQSAzUCAgKtNgGBQAKMV4EBggwBAQYEBNshGGOBZAkJA?=
 =?us-ascii?q?YE/g3yBcIJkAYR8cIR3NoFVRIFKgnU+hRCFd4M8ml1ICngcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBIEMDNQwLLhUjSwUtHYEneYQVhB8rT4IbcoF1QRk/g1MeBmsPBoEVGUkCA?=
 =?us-ascii?q?gIFAkM+gXEGHgYfEgIDAQICgRAQAm5AAwsYDUgRLDcUG0RuB5N3hjyBJpYUA?=
 =?us-ascii?q?a9rNAeCOIFngV4GDJ9nGjODcQGTbpMLjyuJW6kWAgQCBAUCEAEBBoF+JoFZM?=
 =?us-ascii?q?xokgzZPAxkPjiGEALoxRDMCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:6vWIYxTsUWfnobHuJDlUkQRzLdpsou2eAWYlg6HP9ppQJ/3wt523J
 lfWoO5thQWUA9aT4Kdehu7fo63sHnYN5Z+RvXxRFf4EW0oLk8wLmQwnDsOfT0r9Kf/hdSshG
 8peElRi+iLzKh1OFcLzbEHVuCf34yQbBxP/MgR4PKHyHIvThN6wzOe859jYZAAb4Vj1YeZcN
 hKz/ynYqsREupZoKKs61knsr2BTcutbgEJEd3mUmQrx4Nv1wI97/nZ1mtcMsvBNS777eKJqf
 fl9N3ELI2s17cvkuFz4QA2D62E1fk4WnxFLUG2npBv6C63VlzH7q8F01DKcH9HZdIEZAhSw0
 vZ1Ui/TljkhHGYS62Hqk81+rqRQrA309Hkdi4SBZr3MbcNjV/3eUd8nfmVhd/lRRQ1hOrKdV
 bYKBeQuMvpShJDEnFoJhDq7KCSwHf/+yiZ5g2bkgok1+b4NMSjc+R47MYJJrG2NtvTcCak9d
 NyY0/LB7TiTN/R93TC6+taZLAw6+MiJXI1qeM+L+XU0N1z9jlXPgoz0Iz2Sz+hWtSuB3dJfW
 enz2ml/riF0nzSzgeociKrgvcU153bkyiVd/N5vffycekFdPu+nRcgYp2SbLYxwWsQ4XyRyt
 T0nzqFToZegZ3tiIPUPwhfeb7mCb4Giw0u6CKCfOz5lgnJidr+lwRq/ogCsyez5A9G9y00C7
 jFEnd/Fqm0X2lTN59KGRPpw8gbp2TuG2w3JrOARCU4unLfdK5kvz6R2kZwWsE/ZGTTxllmwh
 6iTHng=
IronPort-Data: A9a23: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
 90RRDBK5f3BYAl5
IronPort-HdrOrdr: A9a23:wLZrZa6RAPTNO1VCqAPXwTSBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhI03J0ru7Sc+9qADnhORICOgqTP6ftWzd1ldAQ7sSlLcKrweQeBEWldQtnZ
 uIEZIOcOEYZGIS5a2RgWmF+r4bsZy6GcuT9ILjJgJWPGZXgtZbnmNE42igYy9LrGovP+t/KH
 LCjfA3/gZJHBwsH4CGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/iosKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYLriJGofy8Qzdktvfp2rCo+
 O87SvI+P4Dqk85S1vF7ScFHTOQkArGpUWSimNwykGT3PARDAhKd/apL7gpMGqA16NnhqA77E
 sD5RPpi3JaYCmw4xjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklZqvosxiKnbzPPd
 MeeP003swmBm+yfjTcpC1i0dasVnM8ElONSk0PvcGcyHxNkGt4w1FdxMsEg38G/p54S5Qs3Z
 W1Dk1FrsA9ciZNV9MCOA4oe7rFNlDw
X-Talos-CUID: 9a23:OLlPFGMmGy+nce5DCCJiyQkIBJ8ZWFbj5laTAnTnWUwzR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AaUEPzg7XTlGax5yqffjzgc9fxoxv2Kq2GnIS1qk?=
 =?us-ascii?q?U4ejfEzBQIyzEkze4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="29868110"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaBI114.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:45:11 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:45:11 +0100
Received: from FR5P281CU006.outbound.protection.outlook.com (40.93.78.52) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:45:11 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmtGY+x2DkbiJmxu+K2qV3EC1qYWxkX/Dmvh7LbThEUTh4UGKpBXbht2X6XprxYWplshdAl4fhUYFD4tX9Oqs75waBbwmZEB+Ef0l/floMXgiTbtTyyXckH9c97AlHTqHD6IuuOtYZFwXNB1wzK0a0p/8hndak0iaZFB9DTCnyWgvJDyB4u3GMCizs46zQW70tgswQDQnuPjQ3rrRIXUFl6bgI7uB57Ea88zva4G6dStVQHVcI5wj6uJv4Lh2HwS372RDJAeXj3o2UhwfXc01aKjTaamindgHfBT8T2OeB+fqlTWK1Kl9upP8eGNylAEU6TQIwMpMCic1byYod3t/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=xxeDcjweF0YPQQRo91b9pGqwNl2AXqOoJ6IAQvcAWPdmptDrr97v6xVxk10xv8byeP1IElc0b8bLR0YTMDika73KZOEpyxbarOPdjBSkLzqI6/3GuZg8wvgWnywtYBBl5q3JzPAIPtcDPjf7l/g8Im9Ad0NH5EZta7BgSwnWA+P9+noxlr0IHqbcyBWkNlwPkxGR/iBkVko/kzjpHSBKzgWZJIJo1/hy+8ho0qgP/U6HZ7/0YpUTx0KQD3dbr14UbAdNTNjECn/Pm0pQ4MnK7xd6TSP/DcSjmqnaYI07UT9ZhwKEjqaCr60kHiLlW26isCzi1R7yKi2lh/dzpGhrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=nT11QuA6kDdUSgHAWhzIHPYIRUmbfGgtbCqQSioAImEEtqtyhqYmqz7LgB2DHArMzsF8/tq1rIAUfGMTEw3aHe80oClo/z696ts1QmiWram2XTsH7Phh7Chytfoqd3n+rZPWdc49o0mHmUdt/EXjKAS/HENHWhLT020ILZgN7Yk=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR2P281MB0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 14:45:10 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:45:10 +0000
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
Subject: Re: [PATCH v23 09/28] riscv/mm: write protect and shadow stack
Date: Thu,  4 Dec 2025 15:45:03 +0100
Message-ID: <20251204144503.10895-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-9-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-9-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR2P281MB0026:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb15d01-5e64-42c6-80ba-08de3343b972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aywd9/qrMxuemTYk96aDP2jN/llvysQW3C4DEXHE8EU+/eCm7u0JwBsWnQMx?=
 =?us-ascii?Q?cW/kHx4XPf/L7qrHUbSTwnmv6+uVk5cVM/lCrrNwe6bYaGzWQiWvRhpd9Laz?=
 =?us-ascii?Q?qjZZP4i1v0f4wDRlK23C59Z5NAAuM1eNCxaDflCOYx/JPnXdP+eJS1D94LUE?=
 =?us-ascii?Q?rw22TRToQclIcmDAS5F/Ayo4p6pE0D6Tdzb9j2+BqhvrZ6A4/cBI0dql0u6U?=
 =?us-ascii?Q?Os8HrQp/arlRELcio+h5IAYA0/VsTtF54JWzRgP/OxTZRLYmyrz4gUjuvCW0?=
 =?us-ascii?Q?SuzkMKlpasCbQfcNQAvvANEsn7ljoQ4/aAS3cMgBdjaCtP+YRGntsP/hw+QK?=
 =?us-ascii?Q?QJhzWLQAWSq9TkGwxYh7QMjsDCwbZW/bRnrtsQA2ggYRFCvW8Tsk7ElQhABx?=
 =?us-ascii?Q?GAEnvYyunHwEimz6Yv58dIoq55cjwXdgskxZVbFRr3dVWT7tidRKNPSe7AtA?=
 =?us-ascii?Q?AV/MV6npf2qO0UbKDeVrArOAYDNRXIG6nCOZxO7fgmwQTIIQYftvvgXnQQWi?=
 =?us-ascii?Q?6YNb5X72kqrnA6hf0+fAhbzDOtKI6lY0zb3GiiX9uZknCFEJAnthpTu76fc9?=
 =?us-ascii?Q?OByWxeK1Av/HPBG0cWg5XcV/5JODKONYID3Huzb/B8wcAvyx9SxtQQ6EFK6n?=
 =?us-ascii?Q?gHXLhSdtIM5BoYlR2Ea/FnUkjasiqZCEU2gA/YE/xKFnWe+77T8tlSJi+qTX?=
 =?us-ascii?Q?8QxisXoV+13t9TaX+MijYCvg8sF9lLRUQZ+ktwRV8INAfrvKlNurCq9/R36k?=
 =?us-ascii?Q?66RKNBRdbP6IHsJH1yAW5+3zqHu35/aJO5C9U44kHEFTHEydbQQEbb4DPcrQ?=
 =?us-ascii?Q?uDSSE6F90515X0kgCntnxawanuX8E+enBzty/Dv26HXqS6a14MvbVFKJJ1ok?=
 =?us-ascii?Q?wkFKPEmJvrSeottM2yjkFdakWs/857Gt0N/oSbpBxpAoMRrD/wv5fNMFjH4v?=
 =?us-ascii?Q?87/B9YBPu0mOOk3SRTha8lJ5VoAydM+Hxrf9EzGvTILLjQU44+q+Bu2puOqF?=
 =?us-ascii?Q?mhKjvcgX1OMifvNZbiEj23XCBPsNfKA6u7IuXvq2zmCWmYaAJGkTy+72kwa2?=
 =?us-ascii?Q?PIk65rGbEsM8B9VCtxx2S5netFaYZ87kEcVN3LEdQ2OPCbsCzOVCptzS986h?=
 =?us-ascii?Q?+WDG81GL6ldojwx/ptF+4taWfNK7ELbmQnR1R5u+x6E6IdkPxyUnaZLIg1+T?=
 =?us-ascii?Q?a2Xz2hSaVL9XkwCbnxulQQTAsSm/i6wJ3CSrgawTdeOupVLlRpmrAPltQqZP?=
 =?us-ascii?Q?Ag7QTOFrC2rDTotUQZ4Ddq5CyNsmRiJR40gX1VTDdaYKt0FIJj3I0XCF5cQ1?=
 =?us-ascii?Q?rkEC1WnsSCOilkGSsYEMAjzPH41c861Y9RH1kUs4rq5LgBiIo4fyWk6DrsWt?=
 =?us-ascii?Q?bKjaWnx+4bwDiczgHRlAMm1nyh0++XKL4FyVmyLGtJhI6cOfatbnHdeipDQD?=
 =?us-ascii?Q?VsaCCyi4qQbwP2YmRtrWWkFaQrOKz18s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+cMugT0T0jCk416145/pqW1lu/Y0owT0ggNRbw8e1+Qs+m5wmob3riY2RDG?=
 =?us-ascii?Q?axpuTeKfUOIvaZsdOGAqXs2VTudbqnRSjB9XL8KgasCKdwZFo3BS51EYPPlQ?=
 =?us-ascii?Q?ZYpo0J5MIBWUdOiw4p5+kuJ3bSXwmGU2tu5tHtUr3tLb5TABw4ZymuVBhPHq?=
 =?us-ascii?Q?EiIWibou3GVos6iUehqOngaCVskOMFx2RNachLY0RVzNXAMw2jfftRXwjj7d?=
 =?us-ascii?Q?Ow9udtucH2rZQ2Rkm8i225rGGqIepqReimNeCWK1bxv1e3YVSToRRHwNJiL9?=
 =?us-ascii?Q?MiSZZur7JmXNABMBdsV3lkulF9EJX6+cu8KWsh7b7RDPTfhVDyGF3szwOnlB?=
 =?us-ascii?Q?GCFF6zQE7/JdBHhCdPmEPUv8tCOMvQxjNX5RXw8/51e8jqQFJzEJRJOUdT1+?=
 =?us-ascii?Q?5BsC4MK5vU9eAm2d4ZZI7eEoDpR+KYBYIh+1QbYAU5qtBJLhjcXeqTaeO/l5?=
 =?us-ascii?Q?M5tE2hfloWP1q2UZaQOm20CwNdfXEfudts86AlNZWYljm95WQJBrrAxlRxK7?=
 =?us-ascii?Q?k6oKFEpfee5NQSm6A3iIv9F5ptKF4h5FCEzEpznziJkl0I1ICAZXGsjjhOpR?=
 =?us-ascii?Q?cA7KdozV2esXDkCllFCW9EH+PLMJVf/HtmQwCkUiyD6wCdLt6hQ915PfASOc?=
 =?us-ascii?Q?K40dAxFnJrJlohQ7yTFsBING2A8uUWfXRbtBGh44CkZTXXlOUn5W9UcO+7vr?=
 =?us-ascii?Q?f0EftC/8M0KrBuiVUiQJB8qaRVSsbYPl7ot6rgOFS66zBrZR6E+YEZIi089Z?=
 =?us-ascii?Q?qOiSwAdKSZHCUyCilgCU68CYifWNob9Ymnsa4lCuxMhzaZMhVakTqO7n0GX/?=
 =?us-ascii?Q?P4weSchPq/nTDYsrPAZBgTx0VP/fQeTPDMyTcHxHFtmmng4j0uA2k6NftIh7?=
 =?us-ascii?Q?UlEF09zhVFY1BWsKvZFWgwrHc6//fioTJeuX44XR4KNyJLIWqS4hG54EYIp5?=
 =?us-ascii?Q?+12LO/HiH8N061MdMLaWXa7W5Uh2uH22cTZkH+nWVYHV4nzi13L28h9rC9On?=
 =?us-ascii?Q?sUYuL2TMtDQaAQeBeTbdvb8W6FmKqEoYbA6LW6mDf2SRKrN6wYCTDxT+BFr5?=
 =?us-ascii?Q?zGy1ZVXRsUx10pymP9HNn0QXwRrDq0rhPvl2JfzrNQaAazBEcVCGgXNxqCM1?=
 =?us-ascii?Q?VrBKhJxNBc61/8wrAMo4UqBwubQ7XTiy4s+CWOM4mTU+KNOzZM15ekyP7fYJ?=
 =?us-ascii?Q?aBYipnMHNopLNlJBbZjae5DsNs6Z4h0xbeJhXW9lHVyQCTZs0bO12uNlkGcM?=
 =?us-ascii?Q?HA9d/pw9i6thDgrt2su1Cu+a72Lnl5sMZSGFvD95+YgDlHdHKIVwncVIpKLa?=
 =?us-ascii?Q?4t+w3rlFojD1x6RQ10gNr9MDj4ZW9MlxAdPkhHhzEl4x0XnQmvQPdpNBdV7r?=
 =?us-ascii?Q?vM5RBAeR82gOrRQVpXC0slFxuAeQjUb8O3mrYqqcAD8Zr78j/IU0eheYFnYb?=
 =?us-ascii?Q?39sLpUTg9C33+L1/ALZlbXuNUEewVONk1cDRUNZDdrO4FCCjj5kvNWZE280e?=
 =?us-ascii?Q?95jIhFqrHhy0R1eHUfCQYo+EfR6w64AYVNJLX4zB1N9XGGqK+trrYwJ+aj6y?=
 =?us-ascii?Q?31rNogoHIWLys2iMGe6XM/sLFuPsaoHTiLfDWwugyggvHp1Bbv0LvQNxhkZ4?=
 =?us-ascii?Q?FiXs/ig0iYgsnUIlRxmxDv0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb15d01-5e64-42c6-80ba-08de3343b972
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:45:10.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZAEesWayYACcuJM6kTzR2G2q7nZ1yytwSQaHwhPkmoRWYgRlIcQwNyN0Jr2leUmzSP7UmzUiwMixPFkKuNy04k8L/8b2g2BcLzK6ANtcF/zBYP1qW3TpWcR27rltT33
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0026
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
