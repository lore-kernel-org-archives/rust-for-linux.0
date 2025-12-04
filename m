Received: from mail-edgeMUC221.fraunhofer.de (mail-edgemuc221.fraunhofer.de [192.102.154.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86992218596
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.154.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860447; cv=fail; b=rMznDEYRw+A73czrKYf6LFMOd4Ni0WLUT9BmU+HR/xxHIcMC/qkGFKLGQMxJO3aHRAeXnuFom16ywsN1gbWXx3eCyQl0qz19v+gvjMXCix83L+6CgqFeiS6e/mfXgU/XHtpc+Bafkod4gWA+mRK923cZzKv6ALhKrEseENI7Gmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860447; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ruFsnzVhCgF9sqZlm7SVxrZNzXpIYiHfABrEyYI5NWbSWZmWc2Wj6cYnrM64kPqJdlEYeOkJr+O3ufeIHhJeoAqdgX76/ZiBa8luPt5THg8gF7g44baqnQFxqGvpW9Eaz5en6hx29XspH4vb/0lphExKNWbfc5OCuNRaRT/vfR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=hjTQwycQ; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=ehhB+x8T; arc=fail smtp.client-ip=192.102.154.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="hjTQwycQ";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="ehhB+x8T"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860444; x=1796396444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=hjTQwycQxyuVsmrCpxhcI5Jf/G7VAhidFHaGXvenP+yyySo1vRzG0DP6
   RVGUxf+6fUNpk9c7cGt9ZxBu0pSDwO8faHRk8VUbymoy6ttZAu6kX3LRG
   UF/W0xETYE3UHxmJ1Cr5g6gnmPteyZK06yzL7t4Gb4Tcm1l3SAgDU9DiW
   SHO89eRItLyaXPTrY7jystTR810o4aFO5ju0w4y7n5MWMEUITDlPhY2dO
   blwIDyTcIfmXfsy+izPTMsa+yKBw+i1i5icMYBpoX8D/lm+53nDS9X1wI
   8cSWPWNXnThOPKgYRMdMxzTq6vpP3LXF6r8cIcbwiHb/z9wGNKxqlDlqt
   g==;
X-CSE-ConnectionGUID: H5FHNelMSPG/qV7JzkuMUQ==
X-CSE-MsgGUID: p16CryXsQ0e+NwtVj+HDBw==
Authentication-Results: mail-edgeMUC221.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2FCEACWRZ5o/yYF4gpaHAEBATwBAQQEAQECAQEHAQGBa?=
 =?us-ascii?q?AKCPkABgiSvBYQzglADVw8BAQEBAQEBAQEIARQTKgQBAQMEhQACjCUnNwYOA?=
 =?us-ascii?q?QEBAQMBAQEBAQIFAQEBAQEBAQEBAQELAQEGAQIBAQEECAECgR2GCUYNgluBL?=
 =?us-ascii?q?IEmAQEBAQEBAQEBAQEBHQI1VgYyAQ0BATcBDws7CzElBg4FgwKCJAQSAzKzJ?=
 =?us-ascii?q?YEBggwBAQbbKRhjgWQJCQGBPwGDfIFwgmQBhHxnCYR3NoFVRIFKgnU+hFg4h?=
 =?us-ascii?q?XeDPIg5kgJICngcA1ksAVUTDQoLBwWBIEMDNQwLLhUjDzwFLR2BDxh9hBuEK?=
 =?us-ascii?q?CtPgiJ1gXdBGT+DUx4Gaw8GgRUZHi0CAgIFAkM+gV0XBh4GIBICAgICAoEDQ?=
 =?us-ascii?q?AMLGA1IESw3FBtEbgeTNp1yAa9rNAeCOIFngV4GDJ9nGjODcQESk1yTCy6YW?=
 =?us-ascii?q?IJYpj4CBAIEBQIQCIF+ggAzGiSDNlIZD45fg0KzIXcCOgIHCwEBAwmSHoFLA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23: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
 AiDCns7rHKaEqDYBgiR9AFtqHenLg==
X-Talos-CUID: 9a23:zf/hK2AOuwW5k1D6Ewk62m4yF8QASUXyi27ufG2qCntMdYTAHA==
X-Talos-MUID: 9a23:6oWRvAV8NRRdE9nq/Ce12hp4Jfdz2vyjS2YSjasE+OmoHzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,290,1747692000"; 
   d="scan'208";a="14697348"
Received: from mail-mtamuc121-intra.mx.fraunhofer.de (HELO mail-mtaMUC121.fraunhofer.de) ([10.226.5.38])
  by mail-edgeMUC221.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 16:00:41 +0100
X-CSE-ConnectionGUID: lVOHoA7hQtWrcuR5mElFBw==
X-CSE-MsgGUID: cUcvuis4T7mEWI0H5691Cg==
IronPort-SDR: 6931a21a_AmDkZSia2QUA5UvXvtehcdozaA6NJX+hHF/Dioz7Awq9t21
 CxHabtzN2sEPHk4phqy4hRsFhhT0+YxOtClYrpw==
X-IPAS-Result: =?us-ascii?q?A0BCBQDL7aZo/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKE1hDOCUANXDwEDAQEBAQEIAVEEAQGFBwKMJSc3Bg4BAgEBAgEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBN?=
 =?us-ascii?q?wEPCzsLMSUGDgUigmCCJQQSAzUCAgKnJQGBQAKMV4EBggwBAQYEBNshGGOBZ?=
 =?us-ascii?q?AkJAYE/g3yBcIJkAYR8ZwmEdzaBVUSBSoJ1PoUQhXeDPIg1khtICngcA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBIEMDNQwLLhUjDzwFLR2BDxh9hBmEJitPgiJ1gXdBGT+DUx4Ga?=
 =?us-ascii?q?w8GgRUZHS4CAgIFAkM+gVwXBh4GHxICAwECAoEcGkADCxgNSBEsNxQbRG4Hk?=
 =?us-ascii?q?1WdcwGvazQHgjiBZ4FeBgyfZxozg3EBEpNckwsumFiCWKY+AgQCBAUCEAEBB?=
 =?us-ascii?q?oF+JoFZMxokgzZPAxkPjiE+g0K3OkQzAjoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:aUjm6R/RUUBcu/9uWXK9ngc9DxPPxp3qa1dGopNykalHN7+j9s6/Y
 h+X7qB3gVvATYjXrOhJj+PGvqyzPA5I7cOPqnkfdpxLWRIfz8IQmg0rGsmeDkPnavXtan9yB
 5FZWVto9G28KxIQFtz3elvSpXO/93sVHBD+PhByPeP7BsvZiMHksoL6+8j9eQJN1ha0fb4gF
 wi8rwjaqpszjJB5I6k8jzrl8FBPffhbw38tGUOLkkTZx+KduaBu6T9RvPRzx4tlauDXb684R
 LpXAXEdPmY56dfCmTLDQACMtR5+Gm8WxyBsJhLE8TrzUoz3kDfVj9tQgwmIAJzoV4APRyqEx
 P9AUx/VkSYJFTgy/H6C2akSxKgOrRKhjV9vk7LMX4aka9VnQr2HIvYgR1NHfOtwXnUdJ5uMZ
 ItXIbQPM7gf9Ib0glA0rBysGhChFtGz7mF631z/zKZk4qcBSzn+gRd7Dc5WsC31nNHEOKovS
 c2M6o3k0ifdNe9ZyAvy1NHTe1MjvO3XdoxwLsGIyxIDSQH5q0S+uY/JHQ2IiKMH62iD3tBxd
 OCUkUwgqFhgmAWj4fcFl4fYhKU+x3Te1n165ZptcI7wWAt6e9miCJxKq2SAOpBrRt93W2hzo
 3VSItwuvJe6eG0P1J0C+jWGMaXBfZKB/xTjU+icO3F0iSEtdLG+gkOq+FO7gq3nV8ay2UpXt
 CcNjNTWt34M2hCSosiKQ/dw5AGgjB6BzQnO7OFDL00u063dLp8q2LkrkZQP90/EG0fL
IronPort-Data: A9a23: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
 1khtFcfNBg=
IronPort-HdrOrdr: A9a23:YSY9Z6180AVOMPfMZYak+AqjBLMkLtp133Aq2lEZdPVwSL3/qy
 nIpoV96faUskd0ZJhOo7+90cO7K080maQa3WBzB9eftXfdyRKVxehZhOOIrlHd8kbFl9K1u5
 0QFpSWcOeAbmSS4PyKgjWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3AMXAWEmtr9FyUqHQlM2oyKOtz6IshTFr9y16PI3a?=
 =?us-ascii?q?kNnxiVYfITHKU1ol7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ALrSm4A3VnYc+zArWGXAdtz87cjUj6JmlFl0Misk?=
 =?us-ascii?q?65MypCg0oG2rD3W2cTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,306,1747692000"; 
   d="scan'208";a="32649237"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC121.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:00:41 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:00:39 +0100
Received: from FR4P281CU032.outbound.protection.outlook.com (40.93.78.50) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:00:39 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3spyIkWlLeqU3stFuO4QSYqFP1XS/4INr4PgSVdbPOlq9UrXXjtY8J5TEOim/oFKpetPXpxMSpGpJVWddx/2vHsnKrN014CFnuPbXIgbgFaEF8VBcJnHkG9DoBnmbyUuzumr11MuMe4vDEZPDargnGhyjs4V8VLlb/fUT7H7hJzJuYO36bGpAVf/rmzGYYHkoy0OZHqErzHiumMvkhZbxUYEDZGgYrVWOXjIHhpkMQZcFqatOX5UN1yzSrAcvn3v990NEe2I/i1gnQZ5ExzNQqpJSCW4bqRVitKC61qm1GDDPXzollv6kvH+Kpa4n54d7O4wp47kXNsqRrUQEdlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=PaQJ6g+jE0NqY0EC0wOOmpPWQbuT/toFsxYusNJrSxr7rPzINDBM+4EYLn8pzXPzaXA8VegTZZBYDPzHJbDp1GjCT1VdOePHG+GWgW7+4Tkm2IujLwnrFWOK+GNgdsWkx89iuI+tgIY7n51EO7tC52tkjcDq/s6st0QwuKkpD3procXNAHH/0ZNEnGnpOfeewYvMJGrBFlplHwGQf2Dmcu03Q2DG4Sy9gX6WVNH3P8dZvWm0ke8Xrgh4v58TbhnU8SljGuQDLNDuE4wm4a4F85snZavq3/0t+rgHuXT7DE5LPYkNoF83B9gK3UFvnMQwnPdgSsnN2FGbK3b1gUoiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=ehhB+x8TpWoY7GqTv27MRjQnJEIa14MpXch0F6ff6/3gaMcRiozwqezZ4L6Z1Kayc6Y+H2PP5s3zt0h1IXlYdeUpEQNLDwzv2tgyTgT1sa+jut3CVh7c1j3D6jTMyFxkDJVu6/b0hpYRyIjSrJok1yRUdOXAufyjOCeLrK0kMt0=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BEZP281MB1831.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:5f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 15:00:38 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:00:38 +0000
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
Subject: Re: [PATCH v23 16/28] riscv: signal: abstract header saving for setup_sigcontext[PATCH v23 18/28] riscv/kernel: update __show_regs to print shadow stack register
Date: Thu,  4 Dec 2025 16:00:31 +0100
Message-ID: <20251204150031.14202-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-18-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-18-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BEZP281MB1831:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8ad25f-dbb9-4bbe-6851-08de3345e2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cHn9dYj9pvpUyjEcMH5R0YHHUaw0jK5ctLI3laGXSt48sOH65VzrVy6IsQB+?=
 =?us-ascii?Q?JPnbNKIDPjQ8mdL45tOt6dAD7uVKgUugFsWe+6jpdKeIAGzhKmzEtHy2q1my?=
 =?us-ascii?Q?pyilh+LUJcBKeNtAPKZrlnd/KHO0EECfs893b2JQArv8jKcB1n18qDvfvOh9?=
 =?us-ascii?Q?GF4yobe2Sg6OXIlEnWhvTRsr6mZ9M1Fbklv2NRVFh1kZ9ZaE03L46V8V9b1x?=
 =?us-ascii?Q?hgufCdL0hPfUa5i6oebLHet9OMgckQ+KjzzG8JKthm28ba1k2D/o4uO/oc4w?=
 =?us-ascii?Q?XT4iDpw0t4l376ekGKsjlPPRDr1fjXdw3JskLzaG1fb5qUvegrQZn7CPG1tw?=
 =?us-ascii?Q?qPue7bv9UpbhELfbh7cfiKo4jBYbtyNEY6mDb7WlVrnD8h+1Ty1KRB1ihSuX?=
 =?us-ascii?Q?22/UOtLVLdw9SSuMnacs129XvhOdhElQZAZnWv6RpevLkS315Tbiey39fKEZ?=
 =?us-ascii?Q?Y+HS/up8NC8Dtdv1452ghKLhS8u2aA6hG/GhfdVp9VPyz5V6vIRJsyBdeDzJ?=
 =?us-ascii?Q?d4b3A/v13qx2CHNtSnshD44DUHoucUrQSRWOPwvDt5eEv1TTf8Itv+VSzEP9?=
 =?us-ascii?Q?SDma3J5BAWFDMMQVmN5byd7B0ZdIbZoEVcYuFQv8LIvXvF1dtEz9gX2QzaOJ?=
 =?us-ascii?Q?mubgLb4DTqmyfRuqA9UcltnfSG7t2eHdWSly3nundUA+YNQt1m8u/3gGLNch?=
 =?us-ascii?Q?Rvnsr+BJteqYE0JpwMQoLUl5Z9W69X/wCa0Z9EyGE8Mz1mvH8jA6GyMvd4zC?=
 =?us-ascii?Q?GRwoGtL/vOcsqiIwSj9FMn/V1Yx4Yvol+bBUy1ietB/EarcMRIMT0OTPCOq2?=
 =?us-ascii?Q?rJ4W7kBpUcT4oEKgpXoLSCIwJ53JtdbwSpfaTQ6Tuy9wGYEV5Yb/4xtguyiQ?=
 =?us-ascii?Q?1h1Hu8D2mOQQ2PQdt+ylWnuZ1O78t3qw1o7gKXmRRvsFaI1JUvady1iwX2tT?=
 =?us-ascii?Q?gI6QdDyQwlSGYCVStvEKTrfm7jQJzBuFC3Cd/FJnBG9W39kppjcL9rZvXuVM?=
 =?us-ascii?Q?zJrYfi5oEdhd/nDYs+cIoVRp/ndc1BejzDPtTr1eRxdNVeACV7H8kFQ5K52S?=
 =?us-ascii?Q?dCwLWn5qWWAgLYC7adOLCjhwMrtHr2B0jTnqRCzxCdVUoXJ74McfNCz7bpKm?=
 =?us-ascii?Q?jFI3HynkXpvgyDT5Taq8gyb+m69PF0PyoCEgbR4Teb3Y47ryM+wBVea8otue?=
 =?us-ascii?Q?ZeARhP8z8sSUBgac6MM30k6IZyADz8BFIl2fQ5EMq0TWTMhV1akK8LaHEIYM?=
 =?us-ascii?Q?0r2o/BS2Rt0SS6PfhzTnMkduezWE/vF8saAQ+wiKFR+WT2l5Tg/39XGObmV9?=
 =?us-ascii?Q?gc3Uh3PxSe2yz7jLG/GA7SRHo3iaGIBRFSuGiW08Hbkf5ZcYaz7ml9FOLEEi?=
 =?us-ascii?Q?EyNcDd8XvOBUjy8ERdIcHcJQqQ8WKK9LdD5Vku9JX/67A7RO0oCOOXM+Gtut?=
 =?us-ascii?Q?J2UILhX4shRtQrXM8FrlU2VfcTWNRzfZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QhYXXrKPrfy6OMw6uRc5mAXltTwA3ipSKEce0sbPuobKFkNkXA83zjBZ/3Gk?=
 =?us-ascii?Q?17WNafhFpbeOyG3J3yUE7t9/8EhOiENQTbSS1ZKyBLtS7i1y+z+J89Ao+GA1?=
 =?us-ascii?Q?Q69ehvsgPeKl/4VyD/WWerskJFZ1efAzZwdLioIw5PGB1mOXf4CrI1mQqDxP?=
 =?us-ascii?Q?XzLyIweeI0XFpKK8Fx7vDkimDS9r9wDun7+9RJ8ROMg3EzpuV2VTQ16dGZ3b?=
 =?us-ascii?Q?h4KTp2z8zRrcnZn1A4zJ1xkcLUSVKF65xWulaMtChCjDG8NLAXEOvP//ZNkd?=
 =?us-ascii?Q?PRG4xHh1/DYQdsdFdK70Q/4erbQ2SLx4NDZ/ICIcNLoaHKkfvY+ZgXsd8K88?=
 =?us-ascii?Q?xrJ78+FLzwgeh3Iw3gDAsS343h4hqyFTLVBjLQVQdnU+bxmp+1QjNW5tQI20?=
 =?us-ascii?Q?8UJRegvmN5NMAPHvIn3F2lQdWYxV7UewlbKRokW/v3b3S2yuqwGYXHil6NdJ?=
 =?us-ascii?Q?PlNPJi3ESJbTpgJtMkuxEZZcapnYWYDP4RvzKJxvDFDJLb8xkNKYhwmq6jIE?=
 =?us-ascii?Q?7jR0zDkjJSSevybTuxfP1rxAdlDRVCkLQloLVXdugdmd9Y17XcUiSYYVIvqb?=
 =?us-ascii?Q?WKBBkb/Fk6daEgJOPdcvz34lwJ1yC7H+1NaIWJBBYM7PHy7i+N3r8xtiiIBi?=
 =?us-ascii?Q?VN9HQO/ow44Pg4vXXMtfvrocqre8Lf2Et+JIKLnCY6/HlJHsPwTi9ChjRdEl?=
 =?us-ascii?Q?aR7YEkYsdyv/mjg3enq2TDygeEaR5dYUqCYSZkIYIyoJgfdn71it5LDd/ir8?=
 =?us-ascii?Q?P7NO0NsRNWnkZ9Dq7rR1w2ZgD6F2BbsgdbmGEialp52gHfctZnycd6G8HkAH?=
 =?us-ascii?Q?9OQ/Pzfl3o/pvqNFx67F+ZOo9Y/lkEBSsbtOIgYcRYe/oSH/fbXKo6rZsdvj?=
 =?us-ascii?Q?Vh2jYpdayBbeGZKCRW1CUjemH8inBc4JhUmobx7bPDmbQ0Ql1OmvV3a6+oht?=
 =?us-ascii?Q?RfBKIY6ra6oQkXmCQ4sq3gh8Bv+r8hiw34oJYVnrsPde62jPYFewC0nQ12XM?=
 =?us-ascii?Q?yfVsKPOVDOKVcqG8E/Guc9mu+eyo+cP+k645tPprgwcNsbG+Rv52d2J4H73V?=
 =?us-ascii?Q?IWrY28zwZRcZ6X5AunAl+ber9quUjzIWT5zS2gkaJ4WXhKmhM841G3JdlAAK?=
 =?us-ascii?Q?UzSJ/vmsBGyGJ3L9tuJGCvo5dUIcQ4WjajvswhOnNqOz9gE1AWc5fx8WeE/A?=
 =?us-ascii?Q?IcwUdQDb0vhz9NuyYAMsoVXha0hJFZRzOQVfNeOBF0laemKWmG+mCw/Jr52a?=
 =?us-ascii?Q?jNiLvHTtgoxUYEY9uLh4HFY8ZhUy/FJw0GmhhmVrCxT+sE+EFM3NpI9k/yCG?=
 =?us-ascii?Q?6LDsQJXiYu7v1ux+BBuga47hQX7/59QKcICOysAbAXyXebYJrMu0iivSgxuy?=
 =?us-ascii?Q?QdhdstdUSb1QKgp/2U240sQI9IB0MJyohXNvCwNQ5oObUjkugfYJNyZPXPO4?=
 =?us-ascii?Q?elAG/NX2ro6V6mfuvkb7ZiIL2+Q+szjfEtuzxenI/Gr/Cd2fXxfzkWta99DR?=
 =?us-ascii?Q?XLTnP1Yf7Xp+0rCC3TzvMcHiNMJea0fxou/Of1a5Qg5kjb2YFOI1g2yqtgmJ?=
 =?us-ascii?Q?8lT2MbD06TlkV6S7ECEt6DjzXW4VuY3PPy/1+Ul2n3v0TJzbUQViZ2lBkTpL?=
 =?us-ascii?Q?n9bk69ISl6v1kLqpWkgg4Q8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8ad25f-dbb9-4bbe-6851-08de3345e2a6
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:00:38.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV1cAGza+9R+QtFsqeMDwlTthL2ECvQpWX8DSpwW1FOIuofGz2pSKVLqXEcU2w+L+gMGuc945sNqsnN3ZsbqeBJguumjJfcvSdzdfV9q1VxYXwBXH39r556lt8XpytsN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1831
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
