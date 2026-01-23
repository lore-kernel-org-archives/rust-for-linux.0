Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021112.outbound.protection.outlook.com [52.101.100.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37602EF64F
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187413; cv=fail; b=Iv1l0mtpg8W8/FUZ9Wcl+Jf/w470spL9F0wwJ36sx8tLeO4tDxBGIkfygcNGWdhWEs7KUw73f/XB9m4mNWZb6JyuqGx6wfcnCY7FYKyky9lehCeRLDup50IfdRfEFpI29S4wFvnpBm7vJvzKRJDscRqPVERcRW+9LS+1K1u/kac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187413; c=relaxed/simple;
	bh=+Q0JnHn1M8WR5unNTiHwr+FJylcqR2S1COf/zDuUPT4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WxzXj8mNKCjNY08rsKnrLiXnxGVgJThv2uLl49KGnyE+6TNwM26NHb9Swhk4IfcGyjKzI7D2GH6xpkumOYpt7xFSFsrLMv2LjkIgt1FbuYMu9isHym6IiUwYEbTCm/JMckft0mIwHMlUvcUqiPTl486/LC1q2Yqk2PS8cbiOtCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NwMtet04; arc=fail smtp.client-ip=52.101.100.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NwMtet04"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L71D3C3CoFL93VndoSzsTHZ//Wd2iQ6M74srWNCKeJ7VczEO4vTIYHy+LWPmVrVkFWZqluJNL9hX74L7WtW7h5VZ4LTR86llQrJtkSdFETVm6iq+hED9EYqWxJIAJYKqa7j+HJ4Q4SnZJFXx6qwAOrGSJV8j3l5HooBThUY4W+sRkhB7WN+XQIlWkk0Zh84euqtGfHLiIb/Le7wcKMPiPpM1Yi3ypumH5wgRLEj5U4n/BegTk7IjidLJ/klNjABlNyItwqCfnURmuVGT2wA7UxOY3eZaDLIQDAo8hm3XjaYAxPpLx1DUafI2v77vYNwStuNinhBgx0VjrGQyYk9u5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q0JnHn1M8WR5unNTiHwr+FJylcqR2S1COf/zDuUPT4=;
 b=sfm2ZXfcpZrI5G2zL1GGoXMLWCFixZZz7TxrYlmKDIb6QCbDBqoewUpEgxuSv/adYivE0m0M9PGfO1km9hWKIqbfvG9ADvu0AhGGsjDlOT8ecEKMotbi3NeO2hLBDRfZiSfs4CajdXxibhblY+rlJbDKIlx+yBdCnGUwKMjRngV9vMkrFkaexJ+mM7qMXnPDFjRK0wUNwrK/lidXH/bFwY7yxXntGbfu+mfoZKmUJJDAdpPk9OAIpVpTQ3TqfyelugxCJE4tJa9+vqFvhitQoVavdzy5hZizCGxOKBUxG5w4oOLOgs7RuqMxf97AjCXemdcteDg+2qrTOq8cc0S9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q0JnHn1M8WR5unNTiHwr+FJylcqR2S1COf/zDuUPT4=;
 b=NwMtet04PjqgYWklANrldcwAiBZTqzFQdM0ab7SaZ0G0ZtI4eVKIqqxOxhTv5/aaHtfr9qYiVHEicLsG2cPl1uCe+7nbHjRH78+JeyX4UrDhLXPnZaTxisvbcQHiBWS4eMD0ASSu2M3CeQsnG3LL+npzue+GgNJ4ut7JgctMdQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8686.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 16:56:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 16:56:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 16:56:47 +0000
Message-Id: <DFW4LENSQUNN.8EKW6NIQRQU7@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Mark Brown" <broonie@kernel.org>, "Deborah
 Brouwer" <deborah.brouwer@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <daniel.almeida@collabora.com>, <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
 <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
 <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
 <aXOPVkAQGr0lEfml@google.com>
 <CANiq72nTrdhaz9-9xojcJzLBB=ntFjtdH4xZbQk+A662G6Tt8g@mail.gmail.com>
In-Reply-To: <CANiq72nTrdhaz9-9xojcJzLBB=ntFjtdH4xZbQk+A662G6Tt8g@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: fe718b14-4ac1-43fa-acf8-08de5aa0657e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUVPNlVPTVUrZkNWNFpVcllybEJGem1peHJzOG92WXBGdHprRVIzUElIU2R3?=
 =?utf-8?B?QjlMbGZKcnRLejgzL0hYU2tNdXpEUjVUWlZWcm95Tnhyckp3SEtNcDlYVHc0?=
 =?utf-8?B?cnJCQm5CUXhHUHRmUWxYZ1BHcGplSGZJcUdTQ1d4aDFBbHZlYTl2VVc3dlNJ?=
 =?utf-8?B?RWhIZ0lMZWwyZndEbDkzeGswcTRGam83Q2l2TWtpR0trdVVRVmxGbUFEckI4?=
 =?utf-8?B?dUc4RndwMm4ycWNydHJPWGJWaWFOMWxDdWNaUmdCNjY3Yk1nQk1PMHJYam83?=
 =?utf-8?B?VGpKcktabjQyQmNDbjhYRXFJVFJyRm53SG1FdnZ3UVhCQzhudFZLSlJsOEpQ?=
 =?utf-8?B?dmxCcnh5Vmp6dDFsU21vajM3QVRRMnI0cE9VUkdVcDNDTVJDK0laNlY3bXNU?=
 =?utf-8?B?ZDhXODkwVWZGVUZ4LzdHc3l5UW1yUU5sSjVQYWFQT29QTHBBeFdrc1Q5aElk?=
 =?utf-8?B?T2FQdUVHc3FJeXJVN3EwSUlialQxNURpNnpwOVhhdGFxUlZuTEdtdVcxdHcr?=
 =?utf-8?B?b3BDUDFmSlROQy9SUlJUa1JQeDNXd3N0bEFVOXpiRzJIWmFUTUY5cmJINkFw?=
 =?utf-8?B?WGtFZnFuYVVVcDVGbVlZSlBRdUdwQTl2bEJJZzZqR1ZqMzFiQi90NDZvazVo?=
 =?utf-8?B?QVpSYjg0TVE5WXBlSElRNVQ5Zlc3T0JDQXNOaWZJRlE4RXJxd3ZwaHFNSXlr?=
 =?utf-8?B?dEJZMm9vK1Z0aWE3NGgyRklIMFplazB0cUkrbzF6alh0azFnbFBkUWdLak9i?=
 =?utf-8?B?QUZLR2p2QUZiUTM0UEV6TFZPRkJFTGsxU3F4R1FBd2x6UjdRSUVqYjZqdVdE?=
 =?utf-8?B?K3BSckRSRUhnR1BQdklGTlloR2dLbmJUZmtSMlhkdzQzQkNOQjVKQ1h1bTgv?=
 =?utf-8?B?RWlVaWhrdVlpM2Rwbjd1WE5YY3hia0tMSzllZGZWS1J3WVJjUENUQUxPdWtF?=
 =?utf-8?B?UitqbU95TFR1ZUxZVGRyeHAzVVNMUlNUYmNmQzN5RnZ4Y1oxL055eVhFZTdT?=
 =?utf-8?B?TnhNbEt6VS8xTDNGZDhwTjJKb0Q2NHRFTjFKc2FrSXpaemhvL05LckFDcFNo?=
 =?utf-8?B?T280VW9hcHZYUkxncXczZkZ2VmlOc3BMbmdCV1JwZ3FPcUJMUExibDJCWUdD?=
 =?utf-8?B?RUJUWDJucEVIQm83c3p6WHN3R2F0d2p1eVZvK2lwOG1NUmxzeXkyZHNCd0pJ?=
 =?utf-8?B?NTF1eVNBQkI5NGhZTy9IZ04vSTZGazVPMG9JTXQ3VTgzc1czMzI5VkNpYnVk?=
 =?utf-8?B?cFhRaDJsSkNJajR6a0Rzc2c5L0Jpb3RsNWYxRGpPc1F1MC9PTFIzKzNZMlRL?=
 =?utf-8?B?MnlkYm95eFV5Q3JpNks3WGJLTlk3L0JZQ2NBQWp4U3p2QWRxTkhBbGo4YUVQ?=
 =?utf-8?B?OHF5MkhzMUgzVmZLOUdsM3JIajl4TzFVQVZzR1NoR1JCazZsdUcrc0JYQ2ly?=
 =?utf-8?B?R1lCd0pka1JYVVdSc2xaN2RMMzVMUjBYbisvSXAxQ3FFZm5lV0tCbDUzRFpj?=
 =?utf-8?B?Y21GVzJ1Y1U2ZW9zOFRObUJQUVJuM1BMS2R5VUxYYisxbTlYUDFIRmRybTJs?=
 =?utf-8?B?WmIyZHE0ZTlpRlY4RHNNYjJBRGhmMldIWlZoV3J5K1BERW4wS1pURHVtV3ow?=
 =?utf-8?B?OXRFc2FTTjY1VlFjdmdpN3JUNVJFTTJONnhsQzgvZ25FcFBPVnJ3MVdYeXdl?=
 =?utf-8?B?aFcwenIzMTJhbUh4dGxMYVJWMFAzazFOR2ZsT0ZzLzdIc2lnYytQSDFiVXRt?=
 =?utf-8?B?VVdQNkJ0dHNtdnA3dlpPa3BxR214M3c2RkIxbmhJU05XdTEwUTAydHlhck5Y?=
 =?utf-8?B?TU1XcWhSZnQ0NXNMdjgxK1UyVjhYeS82WVh1dm9SdXFPako1ZitaWDVIUnZi?=
 =?utf-8?B?SnR2akN6a2dWUy96MitwRmQwZHdOSVJlRm1ka1JNODBKZjRVUGhPS3I2SytF?=
 =?utf-8?B?NysvTWFjVk90Zk40YVRhM3BvOFRtN0pZUnoyUmMxMnpTL3VheVVFNmI2US91?=
 =?utf-8?B?UzBMMFFoRTVUUkQ1dktIUVBYZzE0dlRVTzRUQWpmWG5TWTFLR2NDY0tBc3RN?=
 =?utf-8?B?TGtrSHlGTlhXK24rTTkxNm5HNWQ2NFNZaHNnc3ZSV2luSGRsTTNBOUlmaXNs?=
 =?utf-8?Q?SMaM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFdacndBN3pCZ1FIR3F5YnNKMG5mZWhySVR3RzFEbGczaXJINGhpQW85aGlr?=
 =?utf-8?B?NHhHeml3d3hBd0VaSTdES0xud0RLSG8zTmdUTnJKN1RmNUJ6c3VRc1h6K1Zl?=
 =?utf-8?B?dExkYVNMcVRNbnZQWHBSVk12VGVCUDBjUy9qQlJWVlhURUJZRldvNnpQNE5k?=
 =?utf-8?B?aW9jZTdNZW0yS1BPQ2oxNGxMY0RRTmdBRXQ1bVY5dFQzS0pmYWU2czdSYzgr?=
 =?utf-8?B?Sk5nMXd4RjRsWTJLWFNHbjBGb3QyZS9yeHZTTzJ6MU9idlk0dzhic3RZbXBM?=
 =?utf-8?B?MmkxQXd2TE9xUE1IeFlRMHUwMGdKbWtENkJ2N2dNUEhuaWdLa0habU5wY3hq?=
 =?utf-8?B?TVI3cXo4QzU0cFdUdXBvZElyTzZJU3NLOVE5Mk9veTlveEd2RTBjRnc1aE1l?=
 =?utf-8?B?Q1o5LzR1cWlLdXV2ZXRCMmVRbytqY1NEUi92SVl0amF4L1pIY0Nsd1U2ZHBy?=
 =?utf-8?B?MXJOVHdqQ3BLdmtQcHl6V0JzQWpqSXFjUnllYnZWRWI3NGExRU8vVURsZjJa?=
 =?utf-8?B?SEhDdFp0TUNtQjRUNjArclkxMEp5SW9wTkJ6dE0zeXplZ1BWQ0VKUU5OTzJQ?=
 =?utf-8?B?dk9IQVdWSk9kQjRZZStmaEovWm9QMDExMlNueVYxWWQzTTY4RXdKcmhGWExT?=
 =?utf-8?B?L2htM2dmem5aczZOZ1BUUEVUZlpCMVFYU1AyWFpKeWVUT1FiOWZDN0VQSm5T?=
 =?utf-8?B?WXExd0d4RXkxNUMvM1lEN1JDbmdSQ2s3SE4wNWhobTJsRzR6VHo0K0Nma3Q5?=
 =?utf-8?B?RjA4K050blo1d012aHJLSjZzZ0dFWTl6UFVjQTdzZ3dyUHBUV2hndXZKSzJh?=
 =?utf-8?B?d3JDRzVhVm9URkdYcjVpWTJ5UnBRaU5hTWRSRTljcGxPQm13TlFENlFIWnpQ?=
 =?utf-8?B?dmJtaXcvaWVMclozY3hkcGxuNEN6ZGtZT1RMUWZuUElkYXBWcSswK0o3c0Zr?=
 =?utf-8?B?R2hKZkViNEhZYWdCb0tXNE1ZN21yWlZaQVhyMVg2QWx2cTBoY0YvMkFXN0R0?=
 =?utf-8?B?TGdBclcyVk96Qy8vNmlLMXlYT3lpMVhkNXlTS243b3J1RitlSlB5UWhyVjlS?=
 =?utf-8?B?S3VBT1hpTUJieEJmQ2dVSnhaN1I3Z0c3K2JBdStWQzdsbzJ0RHpING9CdHNu?=
 =?utf-8?B?QXBGNlFSbGxWOXlkb05SMWVPTGMxckxEY3ZUUTB0c01HVnFGS0hKdStUZDA3?=
 =?utf-8?B?RVBlRVNoV0E2WlBoem9Qd1dHcjZUd1Y5ZTMrZnI4T3VmK0JJRTUwelVsYmpu?=
 =?utf-8?B?MXJiTllPd2ZQRHRsOUl2alNBd2dGWVVCTTk4SVFxMGU2Um1WQXZabnNhaTR2?=
 =?utf-8?B?NHBiandRVlpYVWN4QU5qYjhnSjI1ZVhBZkZ1STlYVUpxQnk3dGU2N1RmMEpO?=
 =?utf-8?B?M2dLUFB1SVRXdTQzNU04QVNqQWJMY0lCWk5IajRDckNBWDNzRTVreUhHOVBz?=
 =?utf-8?B?R3VZVllpcE9FSDZOUlBmb0hKS2R0MnVLTnlPU24rdHk2T2hVS2h1UGlVNGlY?=
 =?utf-8?B?YlExQVJnek4xeGFsSE1UUnB1a2NROFQ2S1dwUjFVMmswUWlOaUI1NlFXbFZl?=
 =?utf-8?B?blF4K3JZMUUzTzY3blB4dXVLZ3NFVmpMVE85bmJUUTJkWDZzQjNaZnpUSWU3?=
 =?utf-8?B?L0NKUnB1VFEvK0NpV1k2SE12WDQ4VlRRdHNjV09ORnN5OTFYeWFxQlEyajZK?=
 =?utf-8?B?eWVnVmhxMUhBM3Z2QnkrV3JQR1ZhN3A0N0w1WVJXNFF3djZYbHZ5RE45NXU0?=
 =?utf-8?B?dDV4VG1wZlRNL1NYbVozVmJKaVl1S3RHZ3dHZitvMzN2bW1QKzBBMjNEUmti?=
 =?utf-8?B?NnkrRWVrU1V3Z0lXay9TZU9nSm1oem5aWE9HNjZXNVAyR2JHUTlhdSs1TytG?=
 =?utf-8?B?TTVKcVdTOXhFUGJFR0FGVnBFTVFTL09GVFVsSTJSRmJ0Rmw2ekEybEk0NXFs?=
 =?utf-8?B?UDZuWWcyWHJLMU1XQTVFcEc5aXgxUlMyUTlRTVhqc3ZKTCtjdVhacXJXbmZ5?=
 =?utf-8?B?YitkbDhFZ3duYUJ0d2tQS1lHTk9aWkFoRnJpSloxRWIxMmNhaFpkKzBEWFlu?=
 =?utf-8?B?Yi9VclRIQlRVWitINFNxQ2lEcitjb3Mwb0c0QS84VFhEczhMOGNGQVBHK0xv?=
 =?utf-8?B?VXJZaVhtRzFwZ09odHBDanBiMHNMN2o5YlZpK1hFOENkeGJQcEVxd2liODlt?=
 =?utf-8?B?TytqdHZMSW1PczRPVDNQTUwyV0NKdDc5alhUWGpSQXkxQ1IwdkozZ3ErZFdq?=
 =?utf-8?B?Z2pTSlRVTkhSYzVXRWhmRXp5QXZFdnpFU0owL1ZwL3NLc1M0d2pOM2I0V0ox?=
 =?utf-8?B?TzQ1OHRMWExnY01RcjlyOExsU08raW5HT3JadkZodnVIMDErQlhYdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe718b14-4ac1-43fa-acf8-08de5aa0657e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:56:47.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoHI4noaruhupyJ+Ihc3iAQ5iQ0VgAULVNGw5HLrOnEgNOxytM75aZrczPGwxaAS5JkddHWHihVzxyakOUo9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8686

On Fri Jan 23, 2026 at 3:24 PM GMT, Miguel Ojeda wrote:
> On Fri, Jan 23, 2026 at 4:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
>>
>> Having a lint that happens on just one random version is inconvenient,
>> so I think we should take at least one of these two actions:
>>
>> 1. Disable clippy::precedence on 1.85.0 only.
>> 2. Enable the clippy::precedence_bits lint.
>
> Yeah, in case it wasn't clear, those are the two options I mentioned.
>
>> But I am ok with enabling clippy::precedence_bits.
>
> Great, let's see how others feel about the parenthesis...

I'd like not to have the parenthesis. I think the fact that Clippy needs to=
 rollback
the change tells that it's not popular change.

I think we should just disable the lint for Clippy 1.85.

Best,
Gary
