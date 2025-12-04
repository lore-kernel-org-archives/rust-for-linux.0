Received: from mail-edgeMUC218.fraunhofer.de (mail-edgemuc218.fraunhofer.de [192.102.154.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3F5B5AB
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.154.218
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859092; cv=fail; b=kg/UkjSw6f/YChaV65CHwDGluLN6k7Sl65Nga7QJhUxyWECahz+Wa7D7OPPk2JZPczDql2EgNh6CDSV3gbXHxMSs7yxIw4COfPktQDcXnF8rQaLBAiG44/Jf9V00pOhVxmQgZAUY2KGDOivIhzZaqkG9KnFtDMSfQrvoCPaZsMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859092; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eBrnBfVuAs6kD1lFksBxrNxHNz4sd4lxQpaVu0uP7Q8zq43oPJ4T/IFf8sST+aAdbiQXrHwHdZJAGRc9sC/eOvKOsWYEFt43pmoe1sO1cRBHdgkZgspyd5gHyyru6lgDtmPfDLMx6acMjsQl+jMsGR9ByfSV3wOQxBkCod3ELko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=o6znXTYi; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=EbsuJx9d; arc=fail smtp.client-ip=192.102.154.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="o6znXTYi";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="EbsuJx9d"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859089; x=1796395089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=o6znXTYiB/fQm5Zfvbp0l1dyNIC75ZYvvApmLAkT50BSe/w+OAfvUAi0
   2WsHNJ3/8LHcCV0UeiR0+THvLgN+OCt7qWUkVRWaUk9jFETKl78zqEOsN
   3mOWBpZd+LYBhZc9MxeKLSWare5iVWYWXawyfax6bHDGHzqE0/G57TU3V
   qJgqVPXTcKoH99+IotPtjUs6wQMkJrdyQs0Ta5EzDkqnI/St98JY75wSj
   O0lF4envuknHMHFr3iY7QL6kq5UBANXlkbMmWfZ9cJ7yQNk8RcCVEqTR0
   17KD4OPhAImkQAca568bJ0mBgyKvy0SVJyVhn86l5ZrUTI23qlezibJ7r
   g==;
X-CSE-ConnectionGUID: nhNwwRriRgWknZkBtteQwg==
X-CSE-MsgGUID: zS3ClO54SdCF5ns9X4C1qA==
Authentication-Results: mail-edgeMUC218.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F8BABMVK1o/yYF4gpaglyCQEABgiWzOIJQA1cPAQEBA?=
 =?us-ascii?q?QEBAQEBCAFRBAEBAwSFAAKMJyc3Bg4BAQEBAwEBAQEBAgUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBD?=
 =?us-ascii?q?QEBNwEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwg?=
 =?us-ascii?q?mQBhHxwhHc2gVVEgUqCdT6EWDiFd4M8ml1ICngcA1ksAVUTDQoLBwWBIEMDN?=
 =?us-ascii?q?QwLLhUjSwUtHYEneYQVhB8rT4IbcoF1QRk/g1MeBmsPBoEVGUkCAgIFAkM+g?=
 =?us-ascii?q?XEGHgYfEgIDAQICgRAQAm5AAwsYDUgRLDcUG0RuB5N3nXYBr2s0B4I4gWeBX?=
 =?us-ascii?q?gYMn2caM4NxAZNukwuZBqkWAgQCBAUCEAiBfoIAMxokgzZSGQ+SIboxdwI6A?=
 =?us-ascii?q?gcLAQEDCZIegUsBAQ?=
IronPort-PHdr: A9a23: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
 QGVFzMg7HycHNLi
X-Talos-CUID: =?us-ascii?q?9a23=3A+fEromo/Zj7aF0hKYrQzFHXmUcYlVGLC9m3RGUC?=
 =?us-ascii?q?HCmBbS5eJVVKp56wxxg=3D=3D?=
X-Talos-MUID: 9a23:JJUn2QnazPldaQdA/C1KdnpwD5xD54PzVHsBurtbvdLVBXBbYi602WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="14661707"
Received: from mail-mtamuc121-intra.mx.fraunhofer.de (HELO mail-mtaMUC121.fraunhofer.de) ([10.226.5.38])
  by mail-edgeMUC218.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:36:57 +0100
X-CSE-ConnectionGUID: VzG4TIM2QDaDgyXHcEaECg==
X-CSE-MsgGUID: OLU7odZBQNijEZ05K4WgUQ==
IronPort-SDR: 69319c89_K/pyPfZ+JdK3TovZtTi674b1zAW5RdjXXJ5me5kjvqbQpbJ
 mNzdOR4exCKRFwpVHLk8598ePPG6m6KvkwoYdVw==
X-IPAS-Result: =?us-ascii?q?A0BABQDL7aZo/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCUnNwYOAQIBAQIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBAxIgAQ0BATcBD?=
 =?us-ascii?q?wtGMSUGDgUigmCCJQQSAzUCAgKnJQGBQAKMV4EBggwBAQYEBNshGGOBZAkJA?=
 =?us-ascii?q?YE/g3yBcIJkAYR8cIR3NoFVRIFKgnU+hRCFd4M8mlBICngcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBIEMDNQwLLhUjSwUtHYEnfYQZhCYrT4IidYF3QRk/g1MeBmsPBoEVGR0uA?=
 =?us-ascii?q?gICBQJDPoFcFwYeBh8SAgMBAgKBHBpAAwsYDUgRLDcUG0RuB5NVnXMBr2s0B?=
 =?us-ascii?q?4I4gWeBXgYMn2caM4NxAZNukwuZBqkWAgQCBAUCEAEBBoF+JoFZMxokgzZPA?=
 =?us-ascii?q?xkPjiGEALc6RDMCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:OlLUyhfypR7wJ5m4TYPJkPoulGM+4t/LVj580XJao6wbK/fr9sH4J
 0Wa/vVk1gKXDs3QvuhJj+PGvqynQ2EE6IaMvCNnEtRAAhEfgNgQnwsuDdTDDkv+LfXwaDc9E
 tgEX1hgrDmgZFNYHMv1e1rI+Di89zcPHBX4OwdvY+PzH4/ZlcOs0O6uvpbUZlYt5nK9NJ1oK
 xDkgQzNu5stnIFgJ60tmD7EuWBBdOkT5E86DlWVgxv6+oKM7YZuoQFxnt9kycNaSqT9efYIC
 JljSRk2OGA84sLm8CLOSweC/FIweWUbmRkbZmqN5hGvZLPUqCrnneNxwy+4IeLPfJ1veSafv
 rlxeCT2lgEsbxUi8FzOi8JSiqlXv0fywn43ydv5apqIFuovcpGFRs08HEFAA+UJahIcKNjtV
 6YhBrIbGcpEvrGi/xgQgECTNVaFAdrqlABagl322a8cjdh7Ny7N/VE5No8FsUnS9delPpc/b
 9mww5bS7ivNSs53gDjT9onEbhEr/tSBWIxrccfYk08pMiXDsWqCtIb/ZgyL0twx7Ve+79N+X
 KHsgGI6hSEuoGCB4M49r6LOpr8ekg/C1Ap/6bhuDoW/Endxbf/xQ9NA8iCAMI1uRdk+Bntlo
 zs+1ugesIWgL0Diqbwizh/bLvmbeq21yUu5DaCfOz5lgnJidr+lwRq/ogCsyez5A9G9y00C7
 jFEnd/Fqm0X2lTN59KGRPpw8gbp2TuG2w3JrOARCU4unLfdK5kvz6R2kZwWsE/ZGTTxllmwh
 6iTHng=
IronPort-Data: A9a23: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
 t0WgLcKUk0RhQh5TCg=
IronPort-HdrOrdr: A9a23:99kxbamdV4bGD3qegsuzAwqY5P3pDfOkimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdK9qXO1z+8R3WBjB8bZYOCGghrhEGgG1+XfKlLbalTDH4JmpM
 RdmstFeZbN5DpB/L7HCWCDer5KqrjmzEnBv5aa854Hd3APV0gU1XYeNu/tKDwQeOApP+taKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/HmVwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5Z+7Y23+4QowwfX+0iVjbdaKvy/VfcO0aGSAWMR4Z
 bxStEbTodOAj3qDyOISFDWqnTdOX4VmgPfIBmj8D/eSIXCNU0HItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3Glq/1vjxR5z+JSEAZ4Joupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyBS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHNRALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDZRHXJ9upApH
 3saiIpiYdpQTORNSSn5uw7zizw
X-Talos-CUID: 9a23:jgdDz29DlelaWBr4HamVv3AGNZwZU1iH9VvZD0CpOUZiZbS4YlDFrQ==
X-Talos-MUID: 9a23:00dkbgYhGaQRkOBTkBvR2zZuBu1RxaWsJXJVzLZahMa5DHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,306,1747692000"; 
   d="scan'208";a="32647516"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaMUC121.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:36:56 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:36:54 +0100
Received: from FR5P281CU006.outbound.protection.outlook.com (40.93.78.49) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:36:54 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qajY9d8T7g7czIzW3Ei57rZgfJFBEaxhMTBL9fhyTMFnXm+TePy6V3R1OUUMW4H2peIoQVnP4apXvMrer+0RGg4PpujyPlM7M0IYwtCaWZzmljDf3FuZJYIOaHdDLaztlzOKoa+LtQu4dSUqsL9XGk2OA6MPBiovK6ryieSe8Csuz7iPocWw7jbBrQjw6n82XFKJjJieEv3y9rQrtyyaSzONgSnobqH77Ah+G+pgVOykz8HE9hsC/jm6Nv02WnKgTuvvRsfkioCUpXyEAH5t1ofRdJPlJrvzCF8+VmJPMkl0gOGVobPCe6XS9FbnnHibEv82kld1uLFy3eLUOk7zBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=C5d95bze4mw0jUh9l6GpmbzBsZXzqkVqmevYiFpzv5pzPLS5jCOwtdHhW9TcEotjLSriI3fXQWv3hRA206l3fnxin2/EVsLkAV/O5C9ijOTPRv6kocpAJ7/2u29en2UdpKcm0TYFlcK3+ZefWMMO/pNt0QY0Cc9E7KBJGk+/o6xzG6gyRXPDa99XcB2cYts1B9aTw65c1849TttHb6ORRcvXdtXAP49Tdyde5zUzvPwWrGm7fryYEQ7rEcJJR7cOJwymQRgKLdEyIKblo5wR/yNrIRRfg9nHq/CALnSpr1mHFMFW/u2f2vtulvabjYZFHbpeWkABAHQByDFsIyjSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=EbsuJx9dZ0SvN1Ci5K0UV5B39PEFa0rLDtyP70+vE3EX7AmQm6WzlJhljN6T2NGcI5qA5ciUn1j8bXEVQmgWrKvfMUI1gFvidtib7MemVshea2nnMNnWWzubr1WvlPT6WMhQva++cduFH7j0FNayMCoHUc07nIGnAV3C0o2QbdI=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:62::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 14:36:53 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:36:52 +0000
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
Subject: Re: [PATCH v23 03/28] riscv: zicfiss / zicfilp enumeration
Date: Thu,  4 Dec 2025 15:36:43 +0100
Message-ID: <20251204143643.8456-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-3-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-3-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR2P281MB2669:EE_
X-MS-Office365-Filtering-Correlation-Id: 039242f8-c98b-42e4-394c-08de334290eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eDA2/BsruTVIOKcYT+/AxC8ejqQUookud4A8TnRfJyiofHgfz2x2eOsAXaBZ?=
 =?us-ascii?Q?sldXSznngZXJbyR4h7wX3nUUHzAMMgsRK7Ud9nUB/AsbXJeN1kWdU+n0Orf6?=
 =?us-ascii?Q?G17BY1RzZazPd44ZKVHNrqv8OruyztvNSheuKCGGdxIGlyV4DgUtDflug5vf?=
 =?us-ascii?Q?kssZC8R8LtnHP5zbW22E6PPd1qnYvRbaSuc1W0azRDKpDrzqsFp6JynfkVLt?=
 =?us-ascii?Q?oknOupw2aBmu8gyQBFEJ6q/kxT70j4PUQv/jOesyLs76kfw5Dj0gG5lhc6NC?=
 =?us-ascii?Q?DhlytnLdk+cSaEaP16JOHv9o3hlv0GKmEgI+npAOA2+jTxXtu9MsDktrttVZ?=
 =?us-ascii?Q?g823hdocL0lq0UpoTeCe3RWPwzd8aqR8CWGwz9VbapsoDqCb9RHfTASAmF6m?=
 =?us-ascii?Q?bbQUMq0WcnXvZ9mNCAkI7G0hrVhdrj1SqvgMsJ2AbQnhxwd8iUausHEJ+5Rc?=
 =?us-ascii?Q?CeWkRFA7sjBq85zcXnmvwrlX9luAtv2nsAO1cprWlTwpOt5jSGokcjb9c/uc?=
 =?us-ascii?Q?2SirxpW94odh2LYByUE/1iAqyzEsydZAt43Bdwvxy7QrF2ugfCNal8t99LB1?=
 =?us-ascii?Q?Xk/cv2RF8IpC0AQHiHWlLNsCapmTgVFaQzFpUf7NcsNbODAKlHI6xp2oLErD?=
 =?us-ascii?Q?0LGrv4Xof/UpdDcjt20zjs5S5tEarGwygCTw9aI2k3KLFnynFbsMg6mS3dXg?=
 =?us-ascii?Q?E+x9GwjStRZHp+ZPe1mJ4cOFA5pHI4gTr8vDfQdrZI8+GsD5NhD1s6VTCIl7?=
 =?us-ascii?Q?4jCe0VW04rXlftdjFmY208JpE7boxcqY2NGRJxh5kkjvHA2nv/tQqVKiy6VJ?=
 =?us-ascii?Q?45eKQMnolKa2wHXlkqq0jBdVIT4O4DWufwT161I+2i+ZcP9mOPTA+gJid/K4?=
 =?us-ascii?Q?9gCEnlZBDwL2mldAiTTX82ahsj8mDW8rjgDX++UPBZQwjRZN5F6avGQsAwZT?=
 =?us-ascii?Q?DCIZal3x8wKgBso56xni9lhw1BcC/PlqeilkpQqS5StLaCTNdvcqXe/nPKrY?=
 =?us-ascii?Q?4KCIBg/tU4xZN7f2fqn8d2YBLo0T1hoNfFAKoFqtTQtEUKzwl9ZA1Gs6IZqP?=
 =?us-ascii?Q?Ir2t26XoHLcFuQcR/Xqbky5H5lgkgTuvm9yOpICInGuw+4iytugMOmlkE8g3?=
 =?us-ascii?Q?w9xmsrl2k+IPjuF+YAL7lp9KGXzGgQ4TTcwBU88+OKLI5FZmI9QN6N2Gh4f5?=
 =?us-ascii?Q?VdUmjhAYQ8NiN0Jiy8z/ZKIVvcBliIUn5/nAhTV06HrNt0MCEwMWzOrugbhj?=
 =?us-ascii?Q?f2edt2vgYlFs+ERcGHxYVY/McrzfvXC6t6CA+9JRTJrJbe187FaLukF1vkaY?=
 =?us-ascii?Q?RhQxM6JpD1uakzhzAWJ3IyzYx78pB2Pnh0kue7PUiaXx4p/XGfU4UZtO3RUo?=
 =?us-ascii?Q?fL6gNfILG94M3O6CR6aZ5C0JIKRbHJ6Kttj/V38F1/wsHiCp7aHa2JKkcvg5?=
 =?us-ascii?Q?xY1KaBL8hj+WAF2YR02fVR2oIkZSbQG3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Awh+qM7FFjYfPoy+++AoLsIj02gGY/DuwEe4Z6Pa7wprqEu0ex6H49Jg6IZL?=
 =?us-ascii?Q?FXKL2iNo7UlZfO9yoL/EVYso0tDj0wsYOJK4z+5D3dCz/VqWzLsshjwjNpQQ?=
 =?us-ascii?Q?9D2kPY6TOFTcDunJiC325irwSir9mAIu4HOFQGOJQlZPYogyC8i7M6rBUwX6?=
 =?us-ascii?Q?S1lWhjJzPK4hQPsG6YRIJuohv+HekcTqIOGBsTMwUg+ew1+QRmv6fn9WWWLs?=
 =?us-ascii?Q?wMVG1q84eMvLgkA/vCBDbq6nAhVKoR1ie11m3ARnzAS2p/uTY1D7f6jsnQHl?=
 =?us-ascii?Q?FqhbV/hzNgA7RMZqRW99HU2ggqJpkqKspT2i+IDYhlOXFNKmxs6qzHvABiuD?=
 =?us-ascii?Q?9o9lYws2fGo/K7XRxe5EgW6JArGA6pT9HCY6hS0oLpPbgsxl3bELEGnqmqLt?=
 =?us-ascii?Q?fnItwRF5xcCAd5PmpHognBbUsIpXyevPo9DOzTfKrEiiWlORyOtDB9WqYEgG?=
 =?us-ascii?Q?ajUjsrPzq6yDA+Np/1aVgWP+7JWz9+G93Yb90vQv1wqNHtkfjKaE1wKAoOpi?=
 =?us-ascii?Q?LUxwQa8o4IIomJEiNY8CjThoXW5RHS+ZmGeUcLAcDpGjwrlRShWoeXIJCr3Y?=
 =?us-ascii?Q?yzjCuwbU03pcEgVbt4mcOA77P91p+wpfn3BUoWOn/po3QoVLf+IwpiS7o9c6?=
 =?us-ascii?Q?h5B/5dsUfOXz+GtUbPT8xrucFpOugXMx5AIfGOHE91cnxPZINDHkTSlU7CRz?=
 =?us-ascii?Q?hr1HBtLJOHodnQba4EhXGCPAeD77rM2boreOikxACn9X9cxrq0+Ked/rEuRU?=
 =?us-ascii?Q?c2VuLQ5uWrNsmfE8V1N7QoFPZf5n08aCW5094oNoFX742yMPFmjeFefkfCm2?=
 =?us-ascii?Q?kPms45ulbNfGbBOu4fh/8lWllFwhGCDUvoiPyrDR+93wQ/dOyEhtxhi2QdCc?=
 =?us-ascii?Q?Dw3BLMzYhPq9UHrOj9NK6saIqKWF6dQvPFxSSmRjqhPiEOkzkdcvbjbvF49X?=
 =?us-ascii?Q?YKkVmOyvDKCG/0pvLyr2AXIqzqFKZc2Pd5MOK7bPSWVHg7qE0pBWk+yT/bZA?=
 =?us-ascii?Q?hPMf3f9obuhSN93u+sned57868xIpjJAEp611MoTsO4h9PGIjXpvrpEL0ze6?=
 =?us-ascii?Q?S4j6G5x1sMiEfurO7oh+P2I3NoO1gHYCBIWIaPX73u2vn+UIsHEfln7zJdNS?=
 =?us-ascii?Q?uWBHxVU1CtHsbM7RVWjoHFPCY13RTz6Ebznu1VQsGA6PyXONxPxnKFXjGTZO?=
 =?us-ascii?Q?dhe+C+JcWwzMTLJ3wq6cJt8+K5/GUJQkLSw/+O2WVlYrzyXdEb3ugawB7PCJ?=
 =?us-ascii?Q?WSf2yyeWxvp/Cs5GPGrIhLvck0VLJGhrP0TAZk0masagnbORNDDpi/zFaOIl?=
 =?us-ascii?Q?6GoMS5sowMCyk8nRoWJxR2vHkoX3Qu9PrXXs/QBjx2PNMPw2zVI0dpBZtChz?=
 =?us-ascii?Q?64yshY0Ph3SmZR/Lkwzk66BgPGXz6uRAiOw8QaLr1f7dPrXiGkCOHdxe71AR?=
 =?us-ascii?Q?lRtHe9MLLfxvig8xx6PuD5AjZw6D9uY29xo55O4pQ0Fd52LT3b5bRdYkg9k/?=
 =?us-ascii?Q?4jLJMrqNZwnX/Op8za9qruN/j33vk1VmB1rpnEg9w+6LBv/QjpvZRtSn5QUZ?=
 =?us-ascii?Q?GwVGcNgefH+b8dEDTMCNXBfnoZJ8EF8G+ot614jBZcG2y87guZe2O89hUwid?=
 =?us-ascii?Q?702l75ItstfoP+OS4A3AH1g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 039242f8-c98b-42e4-394c-08de334290eb
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:36:52.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC+gT5+W+wKjFiGeSS45wiMqcr2okK/+i0GtHl0/qm6GFqp2AUVKYhe4HXACfhfcWraeNgtJNew85AYUtFIsH1ij7dS8vDMhz/m/vgE7p/b893onlbrSnj+NsUCWRssb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2669
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
