Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022086.outbound.protection.outlook.com [52.101.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33512364E83;
	Wed, 21 Jan 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011809; cv=fail; b=akXOoKIFxuW0q2/dXnaH6zghxAvbvNhk3gKGvyEh2CBB8K2S8M60aAd3xtdlpve7lnGTqcUmzp9/VOLH2rcCE2O+BGGmekCCFLILhDIh7AWsQ8rlgf3wD8bhdtpRcILeSDNP6bWKUxBDJlGTJpLqD3dgYf2GYFE9DpRRyZIEzqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011809; c=relaxed/simple;
	bh=D03Jh5sO1vR59jpxcYvrEpMDvfSAPXWeOYCYf4/1trY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hHBzDRHIewzZzDPIMc4/odEAD48J6LOjeDQE5NJ5PPWqFzgllUq3tAl3w7SYKLlkVocyL+/s7itNsVflk3dKXWnsKXhfhKhSOhY85VoUUjE8frnfrg9bBmg27LfpspBKljK+PqRvNnYlW6PV0nZRJcPDR46C1Ui/8ascP33aq50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=svmnzmKu; arc=fail smtp.client-ip=52.101.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="svmnzmKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAsr/gTeRWP477tkL1rP/k8yJ9CPSnG4fVD3Jvq2vrKtoPA0F89nQsyo+SwDgzNpZuduNJRtufNCFpCocWihsDoZHB6nFBJj7d837SsgmYkua4yfr+Wizdqx6N5K/PImyO5Qdk4ElRYbnrAmdcehmEP8UrnniSHj01wxUpYcfcTzRreude1QF6+zuInp8WevZyv9LbYG15zJmTzdmmOwn9sCF66R3Kk+tY1FpBsS5bv9ZjbLuuiO0uLdLnglK4nXHCzW2pptzWQIHWnw2P8exE3Xje7GxUqn5PWJIpsij3eFDTm6SeEDOFaz9zJA5a8EWY/51zegYqTmzXWRR/HQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4yF10/ok7VTp95lUadYfeg3a04TexRBeaOPAVMDh4o=;
 b=xFsuJmufASrEBNGeuClDqfwmqYa+vG5hgQN3rMZBN5EgaNKi1/CR6KVD6NQG/36W4pVprIZ2liuubocvmJ9w4QI/0plF7pobWkTwR160q3X20lSeRm+WwPO4nljwmhMkRCOeBxeXrYrfAw5Y6iQoCcQfd5yyToJALAVfI34S4NKdE9w+O39eXPL91pq6ljWuXfSaW//Z6AbRvYKm2OSbviEpOieSZYEUcPECynrAsrNi31GRAzT6n6q/pyCpqOfDt6rfuZ/ax3YIt9lmCbOZrh8sV/eGxPiifB1GuzGD3w2hHd7t4P7vRtEYQidgm6fpjF5bpfKb5NlSWx2nGPMoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4yF10/ok7VTp95lUadYfeg3a04TexRBeaOPAVMDh4o=;
 b=svmnzmKuf1M/QZhWRS3mov4YgG4ialIFHKb0TjWemUc0Mb1y4GgwWhbSsTxe4T+/3UGviUorATWGDY8WctZtkpgbQU3ONBVNTs9TXFJhyPWNjB/Zn2hnKE5SEm4z8hL/a3G3ku8RtBPpAd/SulSAMjsjC1Qfv/yNiLHrAGOt5yQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5652.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 16:10:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:10:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:10:00 +0000
Message-Id: <DFUECI1MI0DK.35F3O013QHAE2@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Zhi Wang" <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Edwin Peer" <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>
Subject: Re: [PATCH 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-18-jhubbard@nvidia.com>
 <4e36e160bfa53240987f65ba36cae8e6fe4d6e6c.camel@nvidia.com>
 <ac0338f2-6b7d-4b34-90a4-7be041682d2b@nvidia.com>
In-Reply-To: <ac0338f2-6b7d-4b34-90a4-7be041682d2b@nvidia.com>
X-ClientProxiedBy: LO4P265CA0198.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd751a5-8d6e-4be1-1734-08de590787bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0t4K1BXWTJyMzRvaHZMRlhjbzU2ekhvYytEQzVLdnRrNGJpNU5RSlVCS082?=
 =?utf-8?B?cnVDMGFWcEhNakZ4cnVsUzdNTThTbUpWRklQbXFMVEVmZDRyYldiTWlWNkZx?=
 =?utf-8?B?OEZMcjVmdWxvY0d2b0VnME9iSHpyTGxQNzFBb1dUMzVGNkJTZmJKbW5BZVJ0?=
 =?utf-8?B?UjdOdjJRdVZxVUFkOHlvQi9HWkpYS1hRU2JnczZkcTFtK1p6YVVuRHE4T01j?=
 =?utf-8?B?TmlpbjZYV0diYnZKbjNhZnNzYjVJeVJKMWFXYWhjaUh1WlV0ZlBGQS9XS1dH?=
 =?utf-8?B?ZXVyTU93OUEweENhK3V4SW1lV2JnT1MyVHBJSVpSZ0JyRUdMQjhJQlIvcGRp?=
 =?utf-8?B?cHhmUkhLY3hxWEMxOEdSMjV6Z2ZIWGttT29IcGtaK056M3hwd3o1WnU4RUtY?=
 =?utf-8?B?MVVCMTh4L3hlOTJDN1dlMUtpNFBzaVBWVWkrZXhGMUV4aDlRT2M3SDF2Z0ZN?=
 =?utf-8?B?U0RVL1hGT0Jhd3poMkZ4eG1lajRoT0NzR0xBTXR4R01ndFJSZVkvUGNIcHRi?=
 =?utf-8?B?SEhtVm9sclNxNldUUVgwdHdjMzlTZWlHN05PbEwza0NVdW9ERllFN2hUZW1a?=
 =?utf-8?B?dmlGOHVUZWRpR01TcEFvZVlUakVKTk9kU09aWFQrUkJQVDFOb1FiSXdSZnFO?=
 =?utf-8?B?MjlLbHB3MEh3cUZERW52dEFlOWJLUnBWREhzaUpmZEJHek5FREdobW9CY01r?=
 =?utf-8?B?VnBzR2JkSEdDWXBmMnpVK2NNZE9KM2dwV1JyNTA3ZkdrMHFYQklOYUFLZEFD?=
 =?utf-8?B?U1RvUVZFVnZhR28xLytZbU9xUk1ITEVLV29DUGErSmhBVGdyNWtZSjVoUUhu?=
 =?utf-8?B?Um91NDJsUGQ2YjZ1aEVBLzlSMHVDZjVmdWIvazYzRnlLK1VLa2FjTkpJZlgw?=
 =?utf-8?B?TEpSN2tISUdSbmhSRVFWMSs0NXJ4cVVhSG03dVhobXl0KzdRZnZwa1JNN0dF?=
 =?utf-8?B?SXY4dGFMdXIySndYekNpUTgwWktYNTJwQk5mR2JIM29HaSthNzhXbnRVUWxX?=
 =?utf-8?B?bHFzZ3IvMDFmcDBJRk52Vm5reTlJd3JhQlRJTVNIbDU0Z0pMbmF3bWdHbDli?=
 =?utf-8?B?SGcxM25lLzZkVGJRbFJHTHdQaU9tKzlKUEJaYlVvRzBrUWNad0orb20rSUJC?=
 =?utf-8?B?MUdNYTlHMWZrVGc0aDZkdmU4d0VVRWVkOXZHYWRjRGREWE4zZGhSZys5NnBt?=
 =?utf-8?B?c1RMWlNlSldmZndVTXlBK2lzejFzbnN2bloycjV4N0dKR1hxajZvZ1grOGJD?=
 =?utf-8?B?TVBvUHFnT3lZZ1ZTYTFxWXRiQTc3TlR5a1ViMVh6ei83M0R3bysxRjJpL3dI?=
 =?utf-8?B?bDVMUndSWXFkaC9VTWJSOTFtY0tzTzZsUFlyOHZlbUlZUnZqSXM3bGE4YjVx?=
 =?utf-8?B?MWthT09EaHlsZE9QWThBSmpiS29Oa2VXclR2d1Y3RyswK0hMVXJmWFBGNUNC?=
 =?utf-8?B?OWdnTVhRSFo2d3d3R1J0akVzd0hiV3lNdlBmeWVnc000bHBNRnB0Tk45M2J6?=
 =?utf-8?B?cDVKTWxQcHlnL3hpbDlrKzA3RG9CU01SbUFVZ0l6aDJIdU42ekc4MTYwMGR4?=
 =?utf-8?B?cmJTc1NBOHVXcWhkOHhWVFljOFpUMWtGcHpIb0x3bktlekZFUmpMR2FhVldv?=
 =?utf-8?B?RFJJQUdoUWpYTWJXdkQxb2NPOFF6Z1RicDZBVmE2Y29TTzgzNnFUZnZ1MDlH?=
 =?utf-8?B?K0ZvRUh0emYweFpraDdUbzl2ZWlMZUtlaE9hY0tGQ2lBMUU5MTA1Sk9wV0d1?=
 =?utf-8?B?ZkNSc1VjcU9wdWl0K2hpb1UzVU93UGFsa2ZEcG1ML1FrZG45b28vODl2aGl4?=
 =?utf-8?B?QU96bGhoelVwWVlPOEFRRUtGSm8wbXFydmVmeGlzdk9XR0x1OGZkbEw2WURP?=
 =?utf-8?B?TDAxSWZaejJNbThjK29NWnFBc1J3RjZkZW1OR3hOWTU2Wlg5aDRWVytNRy9U?=
 =?utf-8?B?eTFuVzhRRU5JbmcvNzhVZDlOQnRyWUtPRzBOZ2xDbjNXRE1xcDQyTFZPUWRi?=
 =?utf-8?B?MkxjTkFYZjJHQ3c2VWk5ZlRvK1ZBak9BSnlxckduWG5XTWl4blFmWmtGcHpZ?=
 =?utf-8?B?UmhKK0xwQUQ3S0FHVzJFK0czT0xUMW44TVNHeTdoc0NqM285MklkbE81R08w?=
 =?utf-8?Q?Ckpk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZNbXdWTENHbUE4SWZET1RNQ0tibFRnSlpHWlJpblIvL29YZ0hzUlYxMGti?=
 =?utf-8?B?TGRRQk93U2NBNkVJWmM3SjJZS1Q3bjZ1TXUrMk5WMXdSRUc1N2lLUFI0Tmk1?=
 =?utf-8?B?TTJBSi9WU1lPOGxvVnlVc25BamFLbnI4S3RuMDVLTlpxakNPckt1WndwaDZO?=
 =?utf-8?B?M3c4NEJXanYyaUYwM1NuTDliYnV2UkVncFhuL09uNE1VTEdrcWhad3RNZDFa?=
 =?utf-8?B?REFUSE84d2swMStVMVZ6YWhZSElobnNPVEtIRW45QjR3YVFTQjVJNncxWmR6?=
 =?utf-8?B?OFZ3Mit4RW5Jb0xFUTNESWRwUE5wcHRCeWhuUThGQnl5NUtCdzBWNnpaZ3Vz?=
 =?utf-8?B?eFFIYjFyTEhJNW9ic2dmQ3hNRTRzblRjaFdqWGRQZ0VPUXdJUk44eEk1L2NH?=
 =?utf-8?B?b2NWM0lZVDVxNmw1UHZManJsNFlFWUdDdG5UdWdZdmQxaWVQN2E4RktNaC9v?=
 =?utf-8?B?Z2p1RzVVVDg0VEJHMStTMW5yOWJrUkZrQ21IUVEzSThMSDUyTjFaY2ZJLzI1?=
 =?utf-8?B?STRLWFZnTTZQcVZrdUhVSUljNFprZXdQaFQ4NFJ1ckxJckUrd2ZHUnRxK21R?=
 =?utf-8?B?K3NiT0wwbDl1bFp0V1puUmlsYjgwek5pSVg0bTQvN3RRRDJseE44djh3Yldi?=
 =?utf-8?B?Z3NvYytRVGhCMEV6NkFIWWIyQnJPemRCZU5JQy9lZ04vTFprRFRuVExMRC9o?=
 =?utf-8?B?Q29MT1J5NXZQdGxjblY2V01BTkJEKytCbDZic3BmbkwyeFhjVGhmLzgxY2Z3?=
 =?utf-8?B?TFVxSGxMUXIxYmdCNFlJTnFEUXo0RXdLSVIreURBbDZRaXlOUVBrNDF4Q3FG?=
 =?utf-8?B?ZXZVV0JKNXUyRWlZM0Z4dUNPQW5lb3lQRzUrVjc0dlRqT0QybThqUW42dUIr?=
 =?utf-8?B?WlZRcnRkeS9DbWY0Nm9reTQ5NDdDSStkT3VKNzVkdmQycjA4bFhJMCtIajlw?=
 =?utf-8?B?Y2RLWElRTWdpTmx5NmVUdU9sYVczYWF0TFpvdzlpMnRlaEQ1dmZNRjdVNUtw?=
 =?utf-8?B?MGFOUzlhN010Ly9aNSs3c2tjdGVUSzJLSGI2bU9Vcy96VXhOR1EvY0grdXlI?=
 =?utf-8?B?clVIMWxvMjNlWG5oZzYvTFc0MFFhaFhRRFhHcThkdkMySnVKQzR4bXhUTE5w?=
 =?utf-8?B?S29ZUU5IS0wzQm5IVGZDTGN0KzNQTzlIcERUdlZPSEV0OVBncGlDY2kvRzNN?=
 =?utf-8?B?eTZhNEpjaFQxdDBVZmxoS0NRcTVGMVF2SlBrVFl3NVdCMlA3cCtUSUhjclZo?=
 =?utf-8?B?MFZqVHVzVldSS2hNdFNuOTZyUUV3Vks2SjB5UUhLZkxhNk9HamZoY2k1MVcv?=
 =?utf-8?B?aUtRS0RFeGhGOXBCd0Vva3h2ekxETXZpek1SQ2JLY0ZxRHpIQllmRzJmUUhv?=
 =?utf-8?B?N2tWMlRmb0JrenJOY3VpK2Y0Y1BZczhQZUZjRXhCNCt3RkwyTDlyOFZsYnl3?=
 =?utf-8?B?Z3RmRktWcFNicmk0NStUS1FBR1YyMDNGWlVRbDcyeW9LbWVNWW9Rei9Fd2xX?=
 =?utf-8?B?RVRPbDY4WFVtWWNDMFJlcjdjVE5hUG9RK3RKdFpGY21lSUdGOFdXUEE3RzZj?=
 =?utf-8?B?YVRWa1hWcWFxdHBOc04rR1d1VGpQUStFY1ZXQXhBM1RWbkkzRnpab0V6OVU1?=
 =?utf-8?B?K2JObU1FcEg2V0RsRlRJZE5ueTkwQ01nMTlISDY4V3E4REdXNGNheXFBNzRl?=
 =?utf-8?B?UkJ0QzBkWXpRdjBrTjl6bkptblBscG5kK2lMS2tLWVdpZUlabC9zMG9QdUN3?=
 =?utf-8?B?MjErRzgxTnYrQzRSRjZSMmhIaFFEWWhyRjQ3VmNUN0tDS3RNS2pZZUVRMGE5?=
 =?utf-8?B?bnEzbEFILy9tV2YyamgzZFMxVHF3dTl4L3QzR2ZHYWJwUmRTUld4alhKa2pM?=
 =?utf-8?B?WmlweGVFcGN0d201T2JjNUFGcE43LzM3TGxicDVzR0g3N0tDakYrUXdDMnFy?=
 =?utf-8?B?NFVocTMrWHdKVFFUTXNCODlTN09VaHprKzhIZVF6T0Z2ZkhDOUhhclZ5OWpm?=
 =?utf-8?B?LzlmdE1Pd2NiOWtPNDdVaS9DS21sQm1VcHJHVWdWRzdZc0tIMmEwTDgwWW8z?=
 =?utf-8?B?V3VPUmFYTDc0ck9OS3RBTVdYbGZwMys1ZkhTeWhUTUNnSWU1eDFVREJhNHpE?=
 =?utf-8?B?Q1pmODA4ekM1V1RmYkkxZEZpUU93bUlFRXBMb2JNM21lRmRiVU01QWllTTdz?=
 =?utf-8?B?QkR4bWV4ZDR3WWszUHlpbE5JY2JmWmlmcC9YckNWSDFsa3N4RjgrNXFPdHlT?=
 =?utf-8?B?blEvRXFzeEkrS2lackpGOHBEN0hMVTI0K3JyYVdab1R6RWdHMnA4d1o5MitY?=
 =?utf-8?B?VFZPVkZHeSt4cWptanlENnoyWDU1S0xXMW11bHEwNy9LZUlVN201Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd751a5-8d6e-4be1-1734-08de590787bc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:10:01.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj71eYjct3UWzhwJE7935AwtTD1Zp55q9a/5Ra/9jQguUnLNErvnOa5bBwdFv/dIEn1T+w1Q+mqzNpEJqPrqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5652

On Thu Dec 4, 2025 at 7:34 AM GMT, John Hubbard wrote:
> On 12/3/25 12:48 PM, Timur Tabi wrote:
>> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>>> +#[inline(always)]
>>> +pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -=
> usize {
>>> +=C2=A0=C2=A0=C2=A0 build_assert!(ALIGN.is_power_of_two());
>>> +=C2=A0=C2=A0=C2=A0 (value + (ALIGN - 1)) & !(ALIGN - 1)
>>> +}
>>=20
>> So this is just like the issue I'm having with .next_multiple_of() in my=
 patch #10.
>>=20
>> Shouldn't you have a check to make sure that value + (ALIGN - 1) doesn't=
 overflow?  Since I need to
>> align up to the nearest const power of two, I could use this function in=
stead of align_up() and
>> avoid testing for an error condition.
>>=20
>
> Const items are special: they are evaluated at compile time, rather
> than at runtime. And so this will fail to compile, for values that
> would overflow.
>
> For example:
>
> error[E0080]: evaluation of constant value failed
>     --> drivers/gpu/nova-core/num.rs:226:5
>      |
> 226 |     (value + (ALIGN - 1)) & !(ALIGN - 1)
>      |     ^^^^^^^^^^^^^^^^^^^^^ attempt to compute `usize::MAX + 15_usiz=
e`, which would overflow
>      |
> note: inside `const_align_up::<16>`
>     --> drivers/gpu/nova-core/num.rs:226:5
>      |
> 226 |     (value + (ALIGN - 1)) & !(ALIGN - 1)
>      |     ^^^^^^^^^^^^^^^^^^^^^
> note: inside `_OVERFLOW_TEST`
>     --> drivers/gpu/nova-core/num.rs:231:31
>      |
> 231 | const _OVERFLOW_TEST: usize =3D const_align_up::<16>(usize::MAX);
>      |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Note that this is only true if the function is only ever called from compil=
e
time. If the const function is indeeed used during runtime, you'll lose the=
se
checks (or, depending on Kconfig, get turned into BUG).

Best,
Gary

>
>
> thanks,

