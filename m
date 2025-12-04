Received: from mail-edgeka30.fraunhofer.de (mail-edgeka30.fraunhofer.de [153.96.1.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F22D2388
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=153.96.1.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860600; cv=fail; b=Zv2AjdC7tuiA8v04fNLsTKEOxAds1ye2BIGX2HRyuc7qPRrwZxzSlDzh+Hub3ivyySC6d1aroR8jOg5Ni6Udp5Kv7cxiJt0T5PNfm8q1hTpBtVItW8JjxEalQveextSi+cHMb0NZCCHIJWTrRtCei0CbC+UQ3rLtoNLZu2ItKwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860600; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dwxQLObfTo7M8cToPSUmYCYaZLXP4SBzL1QfXUbPyMIkIo2IJH3uIOchy/wiNxn/mmI1TNfRlWlkAwJ1wg7t7aeaO60yMyq0l8O6zIth/o6heat4MjPGOQEP2HHyJiIzIh3FAEjIO4XkexaecbEEs6+aWeeweVz7/Iy2a9hoBHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=KPDqwVGi; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=S6DoG3St; arc=fail smtp.client-ip=153.96.1.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="KPDqwVGi";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="S6DoG3St"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860597; x=1796396597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=KPDqwVGiSG5TyyB2MWgaHlg9WGRXJA4mi0ImfUToQUl8W42AtTaDjPoX
   jR/i3KS5oEUHl61e6VxmAZ3kOSndrvWIEYWy3GvCFFBW+RAMzaaOPurIN
   FUjtndEMgA84koboOUaMDO7KsW0fplRQmWBZGVuHlMZK7jMBBrHQysY2O
   mPUsnE8e2j7ZicZWwpuHLjWuciCAknKxhzTyHFv3JDg/0d973UCDTKXZ3
   6Cdjir1iwu99/36OLy8tU04KzgR074SHblCqCLeHTh7Tpuc+d+GR6Ds+q
   kzUfPmuDNIjrPUUUqaG4S6TQbfw/uYiapJF92+AyUQfLEFOQP0GC00sT1
   A==;
X-CSE-ConnectionGUID: W47zLokoTtOarnNh2qpiFg==
X-CSE-MsgGUID: yRreYLOCT4yrLGVTGuYpzQ==
Authentication-Results: mail-edgeka30.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BAA4Va1o/x0BYJlaglyCQEABgiWzOIJQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMJyc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwg?=
 =?us-ascii?q?mQBhHxwhHc2gVVEgUqCdT6EWDiFd4M8ml1ICngcA1ksAVUTDQoLBwWBIEMDN?=
 =?us-ascii?q?QwLLhUjDzwFLR2BJ3mEFYQfK0+CG3KBdUEZP4NTHgZrDwaBFRlJAgICBQJDP?=
 =?us-ascii?q?oFxBh4GHxICAwECAoEQEAJuQAMLGA1IESw3FBtEbgeTd512Aa9rNAeCOIFng?=
 =?us-ascii?q?V4GDJ9nGjODcQGTbpMLmQapFgIEAgQFAhAIgX6CADMaJIM2UhkPjl+DQrold?=
 =?us-ascii?q?wI6AgcLAQEDCZIegUsBAQ?=
IronPort-PHdr: A9a23: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
X-Talos-CUID: 9a23:oySUdG86dMdgWYfY372Vv3FIRdIBdX7a8Gv3KlW+L2YzUaWUZ1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ANeVXcw2Mb7x6y9XiSP/dN3OulTUj8p60BXEptr4?=
 =?us-ascii?q?659ieEQNOBxiAvSyle9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="26280173"
Received: from mail-mtaka29.fraunhofer.de ([153.96.1.29])
  by mail-edgeka30.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 16:03:10 +0100
X-CSE-ConnectionGUID: cf/sM64hR6OYB3bMphw/4w==
X-CSE-MsgGUID: CvEFLDMtRZaG5aMnKlq20w==
IronPort-SDR: 6931a2ae_3XWR8Cc1MXLxyJZIQpSRk8a5Eld/70ZhD98R5YJByZht5Gu
 NZhm+B7UTGy0h0A26U/C9XVDFtT3LJf6znWt7qQ==
X-IPAS-Result: =?us-ascii?q?A0BFBQChRJ5o/3+zYZlaHgE8DAILOoEugW5SQAGBG4EJi?=
 =?us-ascii?q?CEBAYUspWiCUANXDwEDAQEBAQEIAVEEAQGFBwKMJCc3Bg4BAgEBAgEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBNwEPC?=
 =?us-ascii?q?0YxJQYOBSKCYIIkBBIDMgICAqUEAYFAAoxXgQGCDAEBBgQE2yEYY4FkCQkBg?=
 =?us-ascii?q?T+DfYFwgmQBhHxwhHc2gVVEgUqCdT6FEIV3gzyaO0gKeBwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YEgQwM1DAsuFSMPPAUtHYEnfYQbhCgrT4IidYF3QRk/g1MeBmsPBoEVGR4tA?=
 =?us-ascii?q?gICBQJDPoFdFwYeBiASAgICAgKBA0ADCxgNSBEsNxQbRG4HkzadcgGvazQHg?=
 =?us-ascii?q?jiBZ4FeBgyfZxozg3EBk26TC5kGqRYCBAIEBQIQAQEGgX4mgVkzGiSDNk8DG?=
 =?us-ascii?q?Q+OX4NCsyBEMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:qZzIRBwLxbaFqr7XCzKQy1BlVkEcU8jcIFtMudIu3qhVe+G4/524Y
 RKMrf44llLNVJXW57Vehu7fo63sCgliqZrUvmoLbZpMUBEIk4MRmQkhC9SCEkr1MLjhaClpV
 N8XT1Jh8nqnNlIPXcjkbkDUonq84CRXHRP6NAFvIf/yFJKXhMOyhIXQs52GTR9PgWiRaK9/f
 i6rpwfcvdVEpIZ5Ma8+x17ojiljfOJKyGV0YG6Chxuuw+aV0dtd/j5LuvUnpf4FdJ6/UrQzT
 bVeAzljCG0z6MDxnDXoTQaE5Sh5MC0ckk9yJy3f7QzRV5vqtAnmmdNM9XK6L/CnU6oEYiq8y
 YwzYwTotT4GORw/+23I358V7upR9Sn/ixtQmLXIeZDWJt1dZ5rlc9oWazZeDtZIVSpPHZ+HR
 awpEOA+MMpcgaygqFoWrwWCO1WoK+TekxZCnl3E3fI64dUrUifMjTEPG4MNn0XWic7VLfxCW
 /2Vw/bM3zXfMPRv1hjd45jZdCI+rePLGrVKfdHJ0EMEKgWVrHuxiq/CNDqFicMik3bF4fI7V
 Ny3gSk/7AZzqySEwMk+kqTyoYA5kwGH6S5by4wUIojrAF4+YMSjFoNXrT3fLYZtX8c+Fnlho
 z1polVnkZuyfSxPzYgu5DeFOrqJaYGV5BLkWuuLZzt11zppe7O60g676lPoivb9Wc+9zEtQo
 2Jbn8PNuHEA212b6sWORvZnuEb08TiV3h3V6uZKLFpykqzeKpU7xaU3mIZVukPGdhI=
IronPort-Data: A9a23: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
 90RRDBK5f3BYAl5
IronPort-HdrOrdr: A9a23:hw4BrqgrlavYwNCphfeqPJYn9HBQXqoji2hC6mlwRA09TyX2ra
 yTdZggvyMc4Qx5MBodcLu7V5VoL0mwyaJI
X-Talos-CUID: 9a23:OOPmNW9xR94GJZbkiN6Vv0UaXdsALCHd9in3EmXjA0NxSKLSFUDFrQ==
X-Talos-MUID: 9a23:On3mkQg8C5z0wH8zoytLQsMpH9lFzYCCLVw3o5wp5sChMw90Im3Fk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,290,1747692000"; 
   d="scan'208";a="46761838"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA29.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:03:10 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:03:08 +0100
Received: from FR4P281CU032.outbound.protection.outlook.com (40.93.78.54) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:03:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR1Vh66jtw8EUGJ3wXSdKxbc+0y6iq0qENlAx9nhBs+Fmq3Djp0FmiAiusVt2PcrmHg4AyF694BfYHQNP404ojZGMsvs2Z71ly5B8EveVYo0M0kqROvZsbG/OC+j4G3jKmx+IcAoK2sB0/HZtTSQEdcuxV9NdgN70CRZ3lGID96BTXN6rTlgEDHeOnZaaM3bIzfh20LLWfVIm5V1CdfdxdifAyngQjXV1flARTbP74VZYvmaEL0Qd7Pzgiq1jjRoq/BVZsvcU5jcwsBHv4LqTTOtBHPVylAN8o6uUN97uNAvX6FZqdnjksEFowdwuK4nO945TbQNaC1yDUvQGPfLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=cAICBf3B14jhXW8J4GFaeaH2zaEW4YultmGIDHe1CLyfHuF2WI827wWg9tdVwInOVdWlOXQFfGxkwevAqZrN74CldU88N6OGY7KLi4ENrGP2V5nI6geFxpYnu+CmQYHKzxpX1dJmfH1YXK4wOjnkiF+EaVHqqjmBV7OanAZVhCsGsTpF31PEwKHKSGdK1zhUYmh49+44VXM2x6GJNDVRxlvwt86LMu5qyxw/nknsHGzspv0TbNTA8iReHtRBiiNm5zmbIqdvXheu08+25N38Eeium1Ie4rhSrhNVaya0wvO5xw1HcbOx1vmiMY1meJ/phjWY6YyLYSMdBpeznv+7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=S6DoG3Stqy+zOKqQPfadF4w8xqjnfwtSBONwbWeDlFM5gipjvTV4lGoY1AbpJZh7hZYb+Nb9UGl9kGYjMsHq38buHg7lzht7oQgGHcxynZwdz//oRdspqbCUn8JFIKKOcax7OGHv6fp3iVpb/p/ojatCnfzpESOjD19+tcJcbIo=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BEZP281MB1831.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:5f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 15:03:02 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:03:02 +0000
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
Subject: Re: [PATCH v23 23/28] arch/riscv: compile vdso with landing pad and shadow stack note
Date: Thu,  4 Dec 2025 16:02:56 +0100
Message-ID: <20251204150256.14782-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-23-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-23-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BEZP281MB1831:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a78010-de74-4bbd-37f2-08de334638be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ndVcKj+vU/PwJNqxl0ED76cUbL6naaj0HrLYOK9LbAVjkTVSeBjhuVyO+4lT?=
 =?us-ascii?Q?5OPd5hDtarbaeKIz3KeIu7feYbPkDifJrcIU/KWv9VTVKPbmjqdot6tcr6c+?=
 =?us-ascii?Q?CZZYATU22NYAG7V/ITJOZ/alqmbQewbI82Ky9SW6fJkLbwuPmPlp7tmXDeFM?=
 =?us-ascii?Q?yT/Uyh2tnfC/bKoazxzFaavzY/NrwvLcB+RR1BpJNoQXHoV9KT0HicWrJtSx?=
 =?us-ascii?Q?/aur5K4C/EQevu5/6YMOevewXgjuWJWz7dg2jLKp8Hv0MPYBXaXsk2AYOOiz?=
 =?us-ascii?Q?nM+sC8l787fKWr+kdBv/urzbhSZrVJpF1TpcKMZ/lAO4mvu7fDrCNKUUF2Ow?=
 =?us-ascii?Q?dFlrHf2JUCVtVN+PUY6qxkVaFLEj1cWNtpeJsyZfUpkKpNpnJt+gI6RP5nMj?=
 =?us-ascii?Q?XOqGw2+uI55xceR4Ul63/yQiXDRfLL4t1KEQnhv//60sbIZCoUikjxty3vvU?=
 =?us-ascii?Q?2NfWP36NvQqqLoF1Eo2ND8Gx0QLry6QODGQW0sJt+hQUWGfl10P4cKrzTcX2?=
 =?us-ascii?Q?6vS1vRsSk0/VyMIzRaDX2yy59uZRuHBXCFOH6JjpnHouWRX5mIc4r+tguWR9?=
 =?us-ascii?Q?88L4R7on7BT3dvDJTW5muLHDB02KLtKIyoO6mcKL7bUjytYl1qm4Y9JzPFqQ?=
 =?us-ascii?Q?2WHUUJf43wmZoHjfL4aa9Ulxv8irJGG9Zpwj5/r/I/yo1A2J9soRQ6fXBK+g?=
 =?us-ascii?Q?k+7rNZHWj/ktCCbSH1IDkvmOzcU4TQ18m4WlId66p2a/854/RSXknBM5RvFj?=
 =?us-ascii?Q?TtvS+qK3U23wY0aW4O/DGO47r2jM7OZ/s+ZfoBLTq0QNm97Jx1J+MJPXaiAd?=
 =?us-ascii?Q?Ly0lcRgcHMOfRlbhjAWQjvWtZ1MNOOtlkgvnM+VqxkEd1VNYAjMXSZ3modyz?=
 =?us-ascii?Q?fzyD0ILHFXL7OzyaQPWOzE6ePW6BEANQikcqbfYQB0F//0Tn/K8cx/bpxEaQ?=
 =?us-ascii?Q?kaNdTaUy5S6Mm2oAb6xNa69t94VMzbSEtnUBrNTVCklP/5t5TUslwbquB+v4?=
 =?us-ascii?Q?VF1l0sEsmuPXan9ZcPPxkO0aRAywk1s7kkGWwj0cJ+1MrqP0F7KjsxyDdU2f?=
 =?us-ascii?Q?HvcBllAkTge5IY+3QCYHTCvzrYvKSnkGspURw9oVnd4tkfNHk6tucJue4Ihg?=
 =?us-ascii?Q?mztq4zrj/5iMvPDIZjVB4ZPJDoI1w5FQ6HaeV1BAmTQIOaeRMo3wcbksr0Ce?=
 =?us-ascii?Q?PXwbaVe8bu/RbmvgLiwqHALZ6zgDwyPcCQ9gqZWUrO1Jy0TEsisRC0u0zlga?=
 =?us-ascii?Q?egvaRWYO3FUewIY8K6yeHJbhCZ2L8Vbdo2Tfwer9r4uUkinuiL42uiAmUInx?=
 =?us-ascii?Q?J12dXeYSV3jLo9gd73PI3mN/q6U4A4tPbbDnW4fI8xxqQbMNm6M32Sytyxu0?=
 =?us-ascii?Q?1jNu8hUjENJJU0R3SvtQBSWyWUnn0x+LRCkZAsEzOBeulCvUOZOPbCb8hOco?=
 =?us-ascii?Q?Z1fhbb76my5YXAtbFLCEruU33nU5oVii?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4w6EocYiEeIDlC6U5ckT10DCEKOEpas3ibTIQ9o0pJDI0R4s45zxz+LSo99?=
 =?us-ascii?Q?zV6lf5bOj60x9PoHsUsA6YsKCzDPV+T/y2lvprru+FgtIaegPPEZpW2mwunE?=
 =?us-ascii?Q?3ruwvMncFVm6xaOkN4obIYXHoRGd2XTl46Kslw/trNj31bQNR7QqOCeLR9AW?=
 =?us-ascii?Q?SZYRopLj5PqxmhO5TfuYK454Wdgju4BF6BtrpwwF1IAN8diiWNCKxt0dqahe?=
 =?us-ascii?Q?MMePBgSZUoUC1GCk9skK3EhO627dgMFUrGIaQnggBaByEm28VgyDz5RIp/O/?=
 =?us-ascii?Q?F1QwLILIHmlKCo0d7t+YZUUj25O5sBiFfyp+TxnC5Usnjwq/TtrkicKLm/lo?=
 =?us-ascii?Q?muKrq472fU1ZAbLJ1rNGCRlH8M6EQwiQ98g9WZYEFMREqXN9GdBw4eDUzykO?=
 =?us-ascii?Q?jimKVWMQQs/hpfkejO0v76GIQfQmAEhhdrtDQDs75nr/8vW/vkuwYAuuAkWL?=
 =?us-ascii?Q?GaERzxU0t/ILxOYQibb0dyVu7EYtQtVkoeH2pIixGrLpjPNKnoSBrPyVwEyF?=
 =?us-ascii?Q?gjla2KrP8NMigWF3buF9vLioREmKVAkKgTcZBYx82TRByYJTAvlkEebp5NGq?=
 =?us-ascii?Q?6OffoSli/cU5hw+QpVs8Eq5pkUVlKt6gF22m1T/RikPDUobT2DrLMR346eqy?=
 =?us-ascii?Q?7npd7BcLstLyl+G3kr0lSZMIrKrTwlGlBsXYRJyr2n0Tr5k6mDogOPg+TWGv?=
 =?us-ascii?Q?jo/mPP0pIgGGPfYa+D7WUIdbOnKls+zN3qxdRUPcns4jC7SIjwU1qW0FZhU8?=
 =?us-ascii?Q?FUHfga/LH8iJRAGOiRPyelxGHrkFFAGcSEQFA0nmHz5FKNRz+Oj8n+ASdYK7?=
 =?us-ascii?Q?jS8BfiuvhDAY+CqbQD7N14ZpsEsFwip2fmbx2BfW+Iew8LqSz+qGJW0Qx1sQ?=
 =?us-ascii?Q?2OklEPTil8YOru7JIS3+4LEXyoY35P3+lcFu8m9lffw+M2Q5wGSL9fsMb1GY?=
 =?us-ascii?Q?LFKI42TzMDC8qlrpZIUUvv+nma8hr/mDifX8a23uC5Xw9LNyM+su2A/tM39D?=
 =?us-ascii?Q?Fv8s7q6hNPu/gQxz0GbDNjhLj987yCPExwjeIhm8ImIAuoA3enE6KXAfOk5g?=
 =?us-ascii?Q?5HxDQ7LpbJpz5GMD4sDOvQi40nkPGTzHNbvg1aIPs8sBpAQpEaTxuhguH5a3?=
 =?us-ascii?Q?U7SaL4w0hCfS5FpIl/NInvNYlF94DIjQHB5DHRUKVXUltbIJ1PrW5o6iD79k?=
 =?us-ascii?Q?S4vRxFw3M7xE51tT1zvGuWHj5BieHVVMqvM2rV7polYM650a0tBs2/1rrnsN?=
 =?us-ascii?Q?IL5J3wZguZdh+dJLBqimVlIa6yHQQVgWWrMRKUudAy0ekCMFG7j5FMAxOukc?=
 =?us-ascii?Q?41Wnz4R5ygsAAz8axmMLJejJ5vjUUYVolhc+svzTSsxTZ0pkML3hoEqYfb59?=
 =?us-ascii?Q?Y5MYlMh2UyXaArhEi4Cj7lX22cAMSAU5cHe+SR68UWMxgMiDsnmub4W8/k7U?=
 =?us-ascii?Q?YA1so//PSeh1xnyYTL/g9+2hjmsunpfBaKQbAeg6KcQz/ls19Jrx6f8perPu?=
 =?us-ascii?Q?KUGD/4bqxnu+4gVnQVsp7UHEgp45A1g42ftIMmYkUxSBliyVrjlo/Md0Jwyf?=
 =?us-ascii?Q?/N6PnT5Pv/nsVGStWpm8nJpp6uDjy7eXOhpJV15FJvOf1tlHfZYUSfAg3caH?=
 =?us-ascii?Q?KxnK7H8wykZrjCslK5ZTs8A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a78010-de74-4bbd-37f2-08de334638be
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:03:02.7071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPuiNWn6Zo3mJcVeRyYyXZjbOmOg9yVg1z2BpVV0PYvuZh2FPbpiHu80eSpJ1ZuDraj1uAVR1NSiTTrhxpdNWbQ6ZSim0zaw0VlZVtfpxoF363lxmC7qnj9j1RWmEbAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1831
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
