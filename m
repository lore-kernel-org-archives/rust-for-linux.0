Received: from mail-edgeMUC220.fraunhofer.de (mail-edgemuc220.fraunhofer.de [192.102.154.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF8348884
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.154.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764857787; cv=fail; b=hk9L/4Q+dRBHQFNpiLFBm4eOMMPZgVvN/fIgURNd91X9dApbEGFB1GnNvinhWtI4iX66IkF1IgHuoVHvxCAH752Y4x4Djz+AMswFW5Vlk+uzs/qeth+sMlPi4qpDthUzIOiutZCFSCeozKrW71Pq019u39QVx7Ize32HrygPKm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764857787; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M9ywS/ngEB/7Eg0+OMZ+L81ZbOSRL4TFtMa8Y8WHJgjW74ywe6fi71Xwrd91sbbHJi7SX+iJ/kP0M3iGkSGJPtUl/XvO/iCD3gPu8U4N/x9L075L6/f3+7i9QzQUq++dRVGwu/s6fGyw4NMQARGgxDFceBJtfenHE1jEe91WWzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=oPSRX2UY; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=ZsCe5Xpk; arc=fail smtp.client-ip=192.102.154.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="oPSRX2UY";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="ZsCe5Xpk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764857782; x=1796393782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=oPSRX2UYdwLPaedMGkc642ydif367d7K9nMamGnMGLEF7CLm2Z3bYY8Y
   u3UYE4YpHeIlpgRSELhltlLUMKom5bNJGbqGNB73O0d+6p6cMdtXiZ0eQ
   45ye5sHI5GhKxrGfXSvAiIs9LM/8oNdLr/oVqC6lW+QRUoX9pOjDhvbQf
   JYx93ni96vjytLJXOUm7EKt7BLfl9tgigHKts3EYVNjXQDKbq2uK2T0oB
   BPyJl6Zl1rDp7jHFIxun9zDbaehcqdwNssfgMQFoOMDORCmSn0euBQV26
   3LjJ5zo/UcL6Bp8l/Fzv1OizDUupu8xKAguYBoS+lutLC/Y1VKJ4IJUPJ
   w==;
X-CSE-ConnectionGUID: 31Z51YBOTHKpdR50xFPBZw==
X-CSE-MsgGUID: GyKB47NqSj+0rEbGMOP54A==
Authentication-Results: mail-edgeMUC220.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F7AAB8ljFp/yUF4gpaHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?j9AAYIvszuBK4ElA1cPAQEBAQEBAQEBCAFRBAEBAwSFAAKMaCc2Bw4BAQEBA?=
 =?us-ascii?q?wEBAQEBAgUBAQEBAQEBAQEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEdAjVWBjIBDQEBNwEPC0YxJQYOBYMCgiUEEgM2tBGBAYIMA?=
 =?us-ascii?q?QEG2ywYY4FkCQkBgUEBg3uBcoJlAYR9cYR4NoFVRIFKgnU+hFg4hXeDNJlZS?=
 =?us-ascii?q?Ap4HANZLAFVEw0KCwcFgSBDAzUMCyoVI0sFLR2BIyEdFxNgPRdAg0kYBmcPB?=
 =?us-ascii?q?oERGUkCAgIFAkA6gWYGHAYcEgIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57J?=
 =?us-ascii?q?wMLGA1IESw3FBtEbgeUHU+cegGvazQHgjiBZ4FeBgyfZxozg3EBk26TCy6HZ?=
 =?us-ascii?q?ZBzqRUCBAIEBQIQCIFvC4IEMxokgzZSGQ+OIYQAvFp3AjoCBwsBAQMJkh6BS?=
 =?us-ascii?q?wEB?=
IronPort-PHdr: A9a23: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
 Q==
X-Talos-CUID: 9a23:yhzDZW8HsDxmZZMPR+aVvxVNKJ18Q1f68FfzO0OCVD55ZoW/e0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AFT2DRA5klzz7XxqMLqd7GR2pxoxH8oeEVB8riK4?=
 =?us-ascii?q?E+JGeGCZfHhCl0WieF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="14643067"
Received: from mail-mtamuc110-intra.mx.fraunhofer.de (HELO mail-mtaMUC110.fraunhofer.de) ([10.226.5.37])
  by mail-edgeMUC220.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:15:08 +0100
X-CSE-ConnectionGUID: HBJnVzElRNuIdav2Napeaw==
X-CSE-MsgGUID: 4fTQxgmcRx2hIb/gTXbKEg==
IronPort-SDR: 6931976b_FGvzYbCQgMfyvlJCOHwUSLpM2LPF6we3k4qrHkyT3ynpuhN
 FP3Jk4lx/fep7eLHn1fVV62F56TKmXm3luTBF0A==
X-IPAS-Result: =?us-ascii?q?A0AqAQBT7aZo/3+zYZlaHQEBAQEJARIBBQUBZYEdBQELA?=
 =?us-ascii?q?YFtUkABgRyBCYghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCUnNwYOA?=
 =?us-ascii?q?QIBAQIBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBA?=
 =?us-ascii?q?xIgAQ0BATcBDwtGMSUGDgUigmCCJQQSAzUCAgKnKAGBQAKMV4EBggwBAQYEB?=
 =?us-ascii?q?NshGGOBZAkJAYE/AYN7gXCCZAGEfHCEdzaBVUSBSoJ1PoUQhXeDPJpQSAp4H?=
 =?us-ascii?q?ANZLAFVEw0KCwcFgSBDAzUMCy4VI0sFLR2BJ32EGYQmK0+CInWBd0EZP4NTH?=
 =?us-ascii?q?gZrDwaBFRkdLgICAgUCQz6BXBcGHgYfEgIDAQICgRwaQAMLGA1IESw3FBtEb?=
 =?us-ascii?q?geTVZ1zAa9rNAeCOIFngV4GDJ9nGjODcQGTbpMLLodlkHOpFgIEAgQFAhABA?=
 =?us-ascii?q?QaBfiaBWTMaJIM2TwMZD44hhAC3O0QzAjoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:P37x/BbZt21Dt11sbrW7B5//LTF+0YqcDmcuAucPlecXIeyqqo75N
 QnE5fw30QGaFY6O8f9Agvrbv+f6VGgJ8ZuN4xVgOJAZWQUMlMMWmAItGoiCD0j6J+TtdCs0A
 IJJU1o2t2ruKkVRFc3iYEeI53Oo5CMUGhLxOBAwIeLwG4XIiN+w2fz38JrWMGAqzDroT6l1K
 UeapBnc5PILi4lvIbpj7xbSuXJHdqF36TFDIlSPkhDgo/uh5JMx1gV1lrcf+tRbUKL8LZR9a
 IcdISQtM2kz68CujhTFQQaVz1c3UmgdkUktYUDP7ETAerLrszbRv+Zm3guGEvTHYOsUSwnz8
 b1bcwH2rgxfHCU5zXjWhO52h65E9UHExVR1lrzPS4zIBOJ9epuMT801bHNfZMN+cDdbObyec
 NEWAdddHs9giJTA4F02gUqeIVepXP+s0wIXgnbK0a40jf1wViXgzSEvEP8vvlSPj9/FCfwKD
 7G1l7HJ9h/4cPcR4mzY99j1IwoC/sGcXaNcY5aK1WYuGVOUyU6yk7f0bxG1xsBTg0+/9Nphc
 9nwpjADlyRS/iTync4Ui8rLuIRK+AnG/Cdn5d0UC4KhFRBfPYv3WIsVtjudMZNxWN9nWWxzp
 SImn6UPooXoFMBr4JEuxhqabuCOVrWju0u7EuiLKCp+hHVrdaj5ixvhuUSjy+ipTsCvyx4Kt
 StKlNDQq2oAnwLe8MmJS/Zxvw+h1D+D2hqV67RsL1o9iKzbLJAs2Pg3kJ8Sul7EBSj4hAP9i
 6r+Sw==
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:Z7YCN6vmmyAnJK0gTQ1B3gpl7skCnYMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/htAV7CZnibhILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wI9HdwGOtt5Dt
 //Q9ZVfYF1P78rhJ1GdZQ8qLOMexTwqDL3QRWvyAfcZdc60jT22tvK3Ik=
X-Talos-CUID: =?us-ascii?q?9a23=3ALefpJGo31TNQGnMFykBeXmDmUeAPUHvj3lrUGWm?=
 =?us-ascii?q?lKGpgVuezQEed8bwxxg=3D=3D?=
X-Talos-MUID: 9a23:m4ckdwRObwvaasK3RXSwig1bJMht6J6+UkAsm9IJh/mOFgF/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,306,1747692000"; 
   d="scan'208";a="35795130"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC110.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:15:07 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:14:39 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.7) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:14:39 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a21J/gAJ9K4SzSh8K9ZSsXRxgQMTbE1xW8W9bs8VO3OJdSDk/rhzqqjkbnexO5yfkb7s6y+uoDH7tqcSD5hDVozoxXssPEgTVnZQXq8FmIH4GXyLvhjGgXDRCq50SEOXNFdIuygSYqIByDZ2+PVex+AkA9sSbclY+9g+zDJYTYtqDyYYr1QskUSnuBYKcfLSDKYITB7SoQM4nFpyejKVmQA5BbLgmHEYxsrYXgORO7ifekBcuA56mHRwoBBOotQ/Dgry25oO535ZC/OdAFwJcBdPqkgeBYvRuhDhizQ4TzJViDdtsxGKRPghroLdl/O/v9ECAaZF8q/oCMYi0inCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=tfKG2U1HJl+CfwEdSgzrkGeTx+6+ISr7PWnPltne5xL6EcsH4rCkJxBqCdLvQQuEBbwVMpmqMx2efJ/ICcpzOOF62r+uAMULB0u1PVeU11nZjM4mDqfC8r5/CiAk3yu3kCVumrrfBz4658aWANJpopw1vytV3zAGNaYSQVUI8ai4sUXHWaSmX5Fz6rl0dUoN03uEU+qtnWxfdzZtl+BHSnasIDxrDHBkyHpBgI+WQ+dYAWp3mp3lZY2awXiEFp45ebs+qZOk7gNa+3tGAkDhy2W4ecjnea2BvhhkE36TFUHZPpMz3iALlc/zwfPh5Tb0YB6WbtabraBN3wsoytKgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=ZsCe5XpklP9ZvGAqvRmGOsrSWJw2qfU4KAPOuU/nPD9HL6m0t+qU7laTdkf6q9/LNyEggEIfH3KbXU3p69h3piSBSwl/S3Mw8U9rK7XxhyDz43tGif89/sJRSy8JHxL6XOLsXiNS7E6LTMK4t53aPi+jVn7Z1jajvM3IF7q56L4=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BE1PPFAF969BE78.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b18::68f) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 14:14:37 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:14:37 +0000
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
	<david@redhat.com>, <debug@rivosinc.com>, <devicetree@vger.kernel.org>,
	<ebiederm@xmission.com>, <evan@rivosinc.com>, <gary@garyguo.net>,
	<hpa@zytor.com>, <jannh@google.com>, <jim.shu@sifive.com>, <kees@kernel.org>,
	<kito.cheng@sifive.com>, <krzk+dt@kernel.org>, <linux-arch@vger.kernel.org>,
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
Subject: Re: [PATCH v23 01/28] mm: VM_SHADOW_STACK definition for riscv
Date: Thu,  4 Dec 2025 15:14:12 +0100
Message-ID: <20251204141412.5895-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-1-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-1-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::19) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BE1PPFAF969BE78:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf358d9-8cd9-4ca9-b8e3-08de333f74d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wBqHGbAxiXdTinu1IvkzQgHEABqVNY4e5VhLYxPM7zFc3yvyrxvUY26ey+hl?=
 =?us-ascii?Q?IYXQTpcTqsUmPSo0xE5MriXj0sjYRxc2abzOdhUvOgOov46OErpZPjadTGzV?=
 =?us-ascii?Q?5CuitSeYgdsrTEgXQhx0T1m1QveeIE7jzL1LKOvPBy01R+T00yQmvkikMlKs?=
 =?us-ascii?Q?keZ+6uIXN/Tsv0kejbi5QB6cStcxca3obH8WsOZgxG1dP+JYGialrocHtbvG?=
 =?us-ascii?Q?5roQIK+1wJPXaorv962ivmli1MGIpUDljP8R1nEUD5gWJ2hkn3IcS3W6VogG?=
 =?us-ascii?Q?sixdgFKyN9Uu/assdHcyedZhxwBidGlGqfjT0GSmtd26Ryk4eJUmdZ7IpyKb?=
 =?us-ascii?Q?C4dR77Tf33/FXjZpv7Eyts5YyHGKW/XUtt4I/vma8mlSolQUYLKnL4CiDBWB?=
 =?us-ascii?Q?Xxucvx91wNSOUOmu4O8Pg1qHaiLmrdipx38Q3MihNNKAiKI/H+R4q2EfArp8?=
 =?us-ascii?Q?vnRpIyAStrH0lfPF24tMMc8IyL/hoFmyJ+Rlgb+XbKbsZLDGJjXaXFeeVyWl?=
 =?us-ascii?Q?hGfdJmPAfhtjF4GuTiCVxZdJxiBxb6sIvic8RWMkhD3+dN/B4HEvvrccsRkG?=
 =?us-ascii?Q?dAYKMCNWKdCgMvr6CPfOSVbtCOjiEkohfA5sykPxbZWmDOeMPjlIHJK0jcnp?=
 =?us-ascii?Q?zmixDjiKdzpma0fll3t+l4+BGVaxepJKK9Nl+bfBWAU+HmbacMJegRK1zYqI?=
 =?us-ascii?Q?sjoF+yanZUbc67DbeU/YFkod8xYDhy5EvlO8DVu3vZoYTNJucftaeXO4kXuJ?=
 =?us-ascii?Q?tTQrKZx1EX8ZBqT9dDQPWQ/U/wJy6u625TjwmEseQg7+dTMSid5gIg5SIdo4?=
 =?us-ascii?Q?qmlkOzIjGt9ObxYImVJhatlh3NEbYLevscmNKt0spP2X7zjO7r8z9iGslvOv?=
 =?us-ascii?Q?ahpELjvpNoAaLem2d5hXQuAipf65E/6el3+9QFgejigPnMLyfRFn9PJoj+Mu?=
 =?us-ascii?Q?E1vemq7L6H2jx3Wtxtmwp/aIDF7rVPTIEKHOmOhf3wXolpOZNgHoxQOk9Zlz?=
 =?us-ascii?Q?r1SiiX9k1F/D9mTlJ7H6Ta9cg+lD4BkdfHBTmtgH+KGkPji50d/g53Ry5M0z?=
 =?us-ascii?Q?xfoyjDVg+nD5fdNfCvZy+u1Ny7iD47iwyhcUACbRm8Tf9nYlbZhcUdIWhckC?=
 =?us-ascii?Q?bv2Lvve6h5xEezooHk+/zs9YnZugIX4atVFX61ssC/qqXDPmgmNfVfjIZ8+R?=
 =?us-ascii?Q?P1L7ak9QBGvn+xIoyRdp5Vz7maRP4r31vtu8CsvSQ5C+k7iYiIkR9448d9Za?=
 =?us-ascii?Q?j8Lw/B/5XcFc5t9aBa9Y8DKTPWW+fTR56pC1s0PFxmglS3VPhvqI6ikqIRTO?=
 =?us-ascii?Q?mCRy0S/EWxOQMEb+i1A9nbI7cX8spZyjyzHdj2X8xFfai7Ho7LuCtKmhFG7s?=
 =?us-ascii?Q?Cqh41qZJgGo94nYZIxn5nRaKnTaXsOPRfs+LqcDbE47MB372xKuA7Z3LiUdk?=
 =?us-ascii?Q?/AbyfeDpTQfoMmnBe2hIeqn7kfRpk0is?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wYCFmRLzy7QGz5PPKZYzAqnCBT+sPBbjZ1WRUNsMOoDs1eBuC9AnTFGVUVyJ?=
 =?us-ascii?Q?xINzDAWzrzIdwgQ371OisruIiMmtFwatTVO47nIU6/wSyIpe/ja/i0cZtjgU?=
 =?us-ascii?Q?KYr4cShYhaWPym8l9qCvpc3s3lrlz3fJXX2XgoDCHKB1PcacZuUZnO/+jyF1?=
 =?us-ascii?Q?ZaSHGFVBasrhqEjtUB3MR4kAc7YcD+pggjZUIhEKDutXps3qTgB0jXEUELi8?=
 =?us-ascii?Q?OKMuAMJ7EEJsn6qCoWaoLHykTiS92luksJSszxTVcs63uR5RhE3hxQvQ4cOa?=
 =?us-ascii?Q?rN9VEt+hDNoOtLRsLg66baeE9xrXYaEG/qw6ig4mHhELMQBbdhV7SAEjTui8?=
 =?us-ascii?Q?xm/c77A+qShbalZcf8S4iBldoFdWhL4SVK55b8BDz7LeTnWQBPwqFWADUul6?=
 =?us-ascii?Q?b/NYCfXALGC62edXgt0pnlIw0ha1YM3o+UA8d7rTrcQaJQRZmUFFTtVhBCDc?=
 =?us-ascii?Q?81xPH7t2f/Byg/eZwNcM7mKy2W6q9/Uzq/GPI60lxr1Q2LaVvhF+c7PpSpIW?=
 =?us-ascii?Q?OACg9NpkbUxvXj9gIKa4zW2ZGjfORPFBTIjZEH7ffeRM/4aBqeDXGechvcCw?=
 =?us-ascii?Q?Z8d7Gul8ApYxy/Z4xa8x6bbFkN6OQtkNBE+TqgaRAkeI0van1SilYJT9AL1V?=
 =?us-ascii?Q?M1eu32Yer0Wv7I6CJMb2gHJ1GT+GssK5cqo78RkKVbd85HDvpUstJz/jOeg1?=
 =?us-ascii?Q?BzTBk+QAniV5XI6+JDG5olo5zACLsOtzZQJP4dAxc3PnBoM8RlYxDbTh5lds?=
 =?us-ascii?Q?Zf6q26i82AKouunWM/OUq0T6BoRhmEYCDnrC2p0SM2H/bc9xBPSibkHvhVjj?=
 =?us-ascii?Q?SP52vl7wNy3RyrAQCMPWXjr4v4H19HNZbk6/bTkHTLA4oFWB0ah8967yl7oz?=
 =?us-ascii?Q?U2B1Ve/NZMGUhehkbAF6eJIVxlFZvMEx5zeWnq4zTw0Yihwj/h4E0gUjZ/+/?=
 =?us-ascii?Q?quC7y6nePiOdX73Id8jANvpFPojn6u/zxjMa5wpJ8Qs+i5GHPBSrpUVhr6fc?=
 =?us-ascii?Q?nceiN/uXFhsITwhx+36vVw7GrOAOeq1tmQuoIk/E8IjSynrXDTfFCX5XFojk?=
 =?us-ascii?Q?HnYgAoh7f3rrz1jgz6CET8fZcaQvSXEvcvFGhLrp3/WN9ElIVrk2ieqcdVlQ?=
 =?us-ascii?Q?9rqNBa7nAFMUz4dMbSrqABouNJD3jl7C49DNgPMDV/pSUFPkKZJNU7UX23Tk?=
 =?us-ascii?Q?wZpTU6afG0DmhqUdp2rFkYmioMlotT8qifPSOEbyf8PReGB5qmK09UVJbqSw?=
 =?us-ascii?Q?fbrw+oTVW4xFCMPW67hP0aP4PKNQULsRAXag3VPmOqsqhcCiT+7YMCcoZ4mh?=
 =?us-ascii?Q?AfftTCZgE90XQWmeX3s0QJNYOUJK/vK9PDk/xuditI6KPfBVq7WBI5SIRvwG?=
 =?us-ascii?Q?ceHI/c9HtEKn+6I3/1aO3K7Z+BC7LxfLJ7Y58CRdUxhiPtorTLI7l+opfhg6?=
 =?us-ascii?Q?AolRd9V/xVohAQOssZhH7g8XzfNxHa+symkfnEFA0aBMzsqoeeFmyo4yDstE?=
 =?us-ascii?Q?OXrgwwKTOv3tMTKmt4fa6u5GFnw0jrp88cU9JAvLKY9oFgWMJKRaRVXd6GFa?=
 =?us-ascii?Q?XiNNj+OQUukuoZNkMurHvONvPn4KxNPAQIE2ZrnOETT+MFD5xBTVjL1JL2l3?=
 =?us-ascii?Q?PgTIBY/gD11OVET6BnYoZbA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf358d9-8cd9-4ca9-b8e3-08de333f74d4
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:14:37.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy5q9gXQwP8FW3GRJuCXGW53vYwx1DPnMRaFwuUuX911FsLMbuNrnrrxsk7409/1aT0R6bJz+kACHL4mwOPpkZAwr+EZ+2cJzCCRkU2vVVqT/uC41/Z6E/uvcZyhm7lL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1PPFAF969BE78
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
