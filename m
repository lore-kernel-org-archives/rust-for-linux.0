Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE83139449C
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483358; cv=fail; b=fa6ieyQ7MqSskggpAsomiiw5+rjwO1Z/lQn6y9UQCSLkstWZUxK9fujFBKwZiaRR4Vid6p8m64EJvSiezqBWpIykejl96JdkMglTouldizXy566L4FBrSIwjbT9w5kk1rvVRJ4ew6a1jC9JHrAhhq0mYd0lkhWXUDSuip36fgJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483358; c=relaxed/simple;
	bh=J9CyJOJqMWaEwoXrq3o6ga6w2RYwVD7+dhB93Z5HJNY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Zf10YVPvWXRgePon12QECsUSH/mAD3/bFyJK+nBPcVIVUxzJLIdeWFAvQ3CH0uUpZADQQIcM627klJZzttqu+rIwQNlP+lNyo8WjdO8f2B1+rwmIxr3pcf+8C/rCOyTyaLLl8FixZmOPwN4i62iVZ1iysVSLG38N+AQhiecoDag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VWO2NkmT; arc=fail smtp.client-ip=52.101.95.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VWO2NkmT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE9rIw2eUeOQjIL7o4ZbX5lDBqivXT6qrpMGs4v6KDgfe7ZifGz3sf87V99vuwoqrdCO1WQDj/mpLLtjq9vTXZ7LeJETTzP0Hwd8CQMforyRg2jacDROuI5g2Z3+Zy/yj6Up2ViL4xNgw1pnqxN9PJBFn42cBSfTjXUdYFJFvvk4T5PiBx05C2qHMYfyzi6Vir10Jt4BxSz2CNUCc6h8sPjt0+izkgV2GcTXnyu5RB6t8i2TtVDm1Ox1HsIJeDgbJ5zYkqxBh4KJnRvtGr9KH8FzTgtDWjlRWoDQPYlJ5E8HCDa6P+zvDTLOYdcCA2ySrgPYbiDxl5eA/xmQguBdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zonkAcxb8C2j4z00e4Fzl7HIyRUp78tI/2Alr8qV7E=;
 b=rKkXMlheTEwnabBP8WWG4dVRIGuNDb29AZL9UMSYVrnRFgqmLvsPF/4kJODv0fUY5+TLc/UpQP6ir3dW+Dt5c0UhFopBBYnZXKEVeQk9gPueTDnLe7+5wZjFJYTiXXNCitcTmhIJUa+/UoYwJlqegvxxhYLY3V506mwubF1Vkk9M1Coe5yaxhIZtyOMttoS16Io4IazzG/o1jDjMjv2rXajyHwKmJ2wlhHcRs+uPF/kbZvbhS4aWT0X2mvB7ILVxzcs0yJeFDr//v1ZZTfk2+Z3afNsk6qVzb4UbKgNJYLKh32d8UXsC72qYVL2Mo9P5/hRYd517tdwmSoBN1+2N8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zonkAcxb8C2j4z00e4Fzl7HIyRUp78tI/2Alr8qV7E=;
 b=VWO2NkmT9x+mReSVqj/K2AO0FBFQAejZLvdjep7ClikCmKKFWlDwVWiBL89H2UzI9OIwhjt+CHURd84+J5KYgu1297GCSrH4pY69z6TNJ19x3PEZny5ZIuqOntD8xsfeMOGxkC+IutnvAg0qqPsK9x+G4p2L6OkLvXjr5ZeVu8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2337.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 13:22:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:22:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 13:22:32 +0000
Message-Id: <DFP7107P61DR.47FY9883FCSZ@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: sync: atomic: Add
 performance-optimal-integer-backed Flag for atomic booleans
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
 <20260115021230.3297420-2-fujita.tomonori@gmail.com>
In-Reply-To: <20260115021230.3297420-2-fujita.tomonori@gmail.com>
X-ClientProxiedBy: LO2P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2337:EE_
X-MS-Office365-Filtering-Correlation-Id: 43be559b-4759-4690-6e79-08de543923fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXFiSHVzVjB3TEJ4ZEw1aUJ5ZU01TFBmNXRZVEFEN1lQWGJDcHJ2S2EzaDJx?=
 =?utf-8?B?bFdOYXQ3dWtybElJMm9xNlJ3a0MxVFBlbm1hS05jYUVPY2kwVDF1bWdzWVdF?=
 =?utf-8?B?NTVHdWhqWUNEOVovYlJ4aUhKSHVUUXczZnhjZWp2VXk0bWFKUXZwTWFWWW1x?=
 =?utf-8?B?YlFqYmlHT2p4cDRydjBaUXNoaGRVK1dEYmZLSjlQNURnRGpSbGhhckNGMExV?=
 =?utf-8?B?aXUwYVdGTE9Qd3ppQXMxNU1xclhDb01NbE1hdkt4N3k0cUxFTG1kK2RBRGti?=
 =?utf-8?B?dTVNMXdmSWoveG1jRnE3bGJxSDB1VzBBTlRSaklxSCt0VC9GSFgzblJSMUdT?=
 =?utf-8?B?SEJrR0pmR0YvWTQ2UTBuT2Q0eGgrMFJXdXJqRVY3N0VZaGFOK0dxUGxIallV?=
 =?utf-8?B?VGVhYXAyMFZlR2dONm04WUZDT2VkMXBXQUZVNkd1VjV6MkptQ21PcGI4Z1Z2?=
 =?utf-8?B?V1NyekZ1aDNuM1hPb0ZtbS9qQWk5NVB4WllSTisxTy96Tmo3VVRYVlVLWG0v?=
 =?utf-8?B?TW0vRHdITFVsMkN6elJwZDBPdWkwSnl4enZOczhYNk1LOHdmMEFMVFoydDdI?=
 =?utf-8?B?WmVaY3MzKzdyczdkWXlXcXRqeXB2ZG9hYWwrcjExRkVOTlNQYXkxUCtFNjF5?=
 =?utf-8?B?LzJPMHFQY2g5djJYbE1MZmxhTU5VRW5qWWFieUY0OFlLbi9Yd09wVmgwMzhW?=
 =?utf-8?B?NXluOWlWdFVBdkJSd1VkNWhER0hKMjdxWFkxc1BMQ2M2bjhjWFpYMzdxLzc5?=
 =?utf-8?B?QmMvdzhXQkVsOWZxZG1jczdQbXVLSTd3RFRZL2VkbUZEZEZaWm5GR3hUR2Js?=
 =?utf-8?B?SnI2QUtGRlduOFY4MjVDN1l0WUFpd2ZqOTluVGJJTWF2dE9LTmNJSE5nNitl?=
 =?utf-8?B?dytlcklQd1hjOXJMdlAvWGhReGRCWEVKTjNzaTljMUt1STY3OEdQSS9KaFpI?=
 =?utf-8?B?QXNxNkFVb3VLLy90M2dHUHFKRXpUWWd1VDJlbjBiQTAzOGZWWGYybWVRdWdz?=
 =?utf-8?B?Zm5NSDM2b0xiOTJiSXIxN3B5TjBXL2w5WTd3WWcweHQvZStNRmx2cWNFOU1P?=
 =?utf-8?B?b2FsR2ViTVZRa0cxdlVtazdPOWhZRzJaejhHLzJpT2R3dFc2N29jbCtqajRp?=
 =?utf-8?B?UWlRZG9WQms5NTJDSlA1S1QwOTBFV1NxdmJsTmpqd2h2THZWdGVxdzdxYjUx?=
 =?utf-8?B?ek5yUmtyVC9qUVlzWkJNc3NjamdERCtqKzNsb0IvTTMxYTBBTFhicUorMzc0?=
 =?utf-8?B?REFVa1NCV2NsOEFaaE9RRXZKQTJGYlpsVzdUU09ncVFTZkdBV2o0T2lza1pR?=
 =?utf-8?B?dDR0YnIvbFlBbkY5c2xhNWUrdDdOak1JTXBrSjRhcWdTZ3lBWjU2V2pnaEUw?=
 =?utf-8?B?OEQrTk9VMGdtb2hqK1J3NDlPWjJGZGpVQUpMU0NBbEdLVTdUakVsemtXRUdt?=
 =?utf-8?B?L3hkODhsc0ZkNUpFdEhXVFY5OXpIN1ZYMms5aEdHZVp4TTV3NXQ3Q0NOT3pB?=
 =?utf-8?B?aTlXdGVOVEhqVFpMUm8zcUNWalZ6WDAvRXV1Z2FaUnRrNlMrYUtWVTFCd2NE?=
 =?utf-8?B?SjRCODZmS3pMQlpWUnlOcDlBR2xMaW1IZUszUGVoRVJ1RldkNUVQK0RKekVC?=
 =?utf-8?B?b0l0b09UcXF0c3VVMHFIZlNYSVVneGxtVWRDa2FlaVVHWHBleWhCME94Zklu?=
 =?utf-8?B?R0ZhcG8xS0VYeWwwdG5jVkJuZE1Gd0l3NHBwcmtYcEdaaHQ0K0QyZXIveC9u?=
 =?utf-8?B?bXVNQktBaUNsaW9qbHlyc3c0ZFlKUmtGVy9IcW9tc1RvUzAwUlVQMjJHeEs0?=
 =?utf-8?B?QUhTSk5ESXpEYkJ3bHl5cEpaVExpalhML1owTXZObEY5c1owaEptOGd4SjVG?=
 =?utf-8?B?OVE2WFNsRlhOVWJ3WU5iNU80Zm5JREdETG1xY3NyQWtFUlVCSFBVODJaUENB?=
 =?utf-8?B?NitwK3pJZ3dPZEpHTlNNaTQ1SkkzL0ltWHF4N2RwcUpTTTcxNm91OExjYlRk?=
 =?utf-8?B?dDJMVFk4WmNMSFRMZEczbjhraml2RHpaY3BmUFhyYzF3dE9RbC9BMTIxL3g4?=
 =?utf-8?B?eHk4SzNaa0FNTkZuajZjblhiQUNnU1ozVzVSeExKWlFUYUljdGFDa3l1Q2VO?=
 =?utf-8?Q?IQTc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzNoMmlOaVBDQVptalRUVWZyQitqZWNvMDYyYUtpS0d1QnZycWhWZ294Zk5O?=
 =?utf-8?B?RFkyZDNic3VYZzlicUkxT3dERVRKV1d3V1AvTzhiQTBseDBkVDV3UEtobVBH?=
 =?utf-8?B?b0dDT0swc3JVZEg5S1pRam9BWVo2Z0h5UlZ4S2FuWEpXeVViTU1IYVFaK3JU?=
 =?utf-8?B?WG1yNVBodFl1ZUVPL3U2ak1FVWVIRFV6aG5rcXJRbFFKYk4yaHVXM29WTlY4?=
 =?utf-8?B?RGxCRUdKOGs4MU1LdU9iQU8yU0g1NWUzbTBwbGl3V2krZFZtOU5WaUh0NG9N?=
 =?utf-8?B?a042bFpTOTA4WVNIL2ZJOWlBcjFMeGZCUkNoa25nRFhmalRZb2dzMkN5UExy?=
 =?utf-8?B?dE05aUZBcHB3eWlwMnJsVFRjQWhoQ0JKa29lZkhKVUVLVzFtOTJCSHUwTjNQ?=
 =?utf-8?B?OWg4ZlZ4MEswV0Zxa3ZrdEIxZGM5VVRsbjFjQmVQOU5ma0pWdmFSRDRUa0lQ?=
 =?utf-8?B?ZkNXam9tdmh6eFkvWWlGeU9ZT0NZZ0dsc1NMOXRnamRZK3dGN2NCb1MvK2pO?=
 =?utf-8?B?TUx1SHVjMXJJYkkrRzlLMnlYTVZWVlRRSnpIQkZhcjFwcW9CREppc0x5a2s4?=
 =?utf-8?B?SVc2Z0UvTjJwNWJ3enU0YVlBZWJTWE5nUldFNWxlRlZURktjZXNadDlRUUow?=
 =?utf-8?B?dDMzR0ZYMU1WUllNejZQR0cveDhKZlJkUlV2VS93QnRmZTJyejY5dlFoeXd1?=
 =?utf-8?B?QnFvK3ZrM3pKNVlGWXpsR0VmRjlTdEdyYzhnemd3eERUWktVa1VZdk56cG5q?=
 =?utf-8?B?YzBCNTRJM1RQNy9qbWY0UnBlYk5jbXgvSUtZc2hHaGs1bTdGMTBUNm9QaFVT?=
 =?utf-8?B?TGZ3TFRwQllDV1UvRTdReFJ4dUZMK0xSMlNIYmwrcTB1WnhUbGFHYjVna0hO?=
 =?utf-8?B?aUJIT2xaZmR6U0NMOGEwclQyMHBYckFWdWZFMjRSUG1yd3NPODdlVXFKWndI?=
 =?utf-8?B?SUNRa1ljak5IdWVIMU5vQm8xUnBjR0JEcFJGVUNpTHVZQVViKzhJV2JNbE44?=
 =?utf-8?B?bm9rR3J3YWJha0JJUFZvQ1JIWERnR1l4aTY0bEJFNklzaC8vUWp5TmxBU01q?=
 =?utf-8?B?cU85d0kxNzVEODlQR1RkWFVFN01DL2xTUWVyMk1ETnQwc2hYUlFYNW0rVTBX?=
 =?utf-8?B?akNlN3I1d1BmTktvOGRybDRCTWFTYW1vdnVFR3JlWDhCV1RyS3VsYnZLbWFS?=
 =?utf-8?B?L0tpNE9aSVlNZFNiVXZYZlg3WmRGOHV4S3hmTU96bkVpeUMvd3d0SVAvY1Ir?=
 =?utf-8?B?YzNxNGdjSGg1K1diUlJkZUx2OTMvTVhOMFoxQzNUSWRzODNwS2k5ZDRrUVF5?=
 =?utf-8?B?OVdWdDNMVGhqRXJ0LzNoNFp1aTl6ZzQ2WTROUFBKKzl5RTZXUElxR1pkRHcw?=
 =?utf-8?B?eXcyK1BmSWVSM0tmNVVTRFNzSkd3SVZFSHNYMHZCZjc1T3diUUNkSjh6OTEz?=
 =?utf-8?B?cWtwN3FHRjVvN0tsV0RpYTFPQWx4Y1JTdXRvR042RDZhQmJVNWNxdFVnclNQ?=
 =?utf-8?B?bmJzcURPM0hQdzQ0bGxhZlVjTksxUkU1K254RGpIYjNlOCtmN3ZXOUxuV3ow?=
 =?utf-8?B?Z2pnbENrRmQraFRCYUY3dW5mN1pKa0JGaHk2akhYVy9rWnp5MUxDTHBkSFg4?=
 =?utf-8?B?R1VRWVZRY1BRQlV6endvY1dJbmRwOVFSVzkrdGJ4SHBiM2R5b2VablNiZG1Z?=
 =?utf-8?B?dkNLdW9pN2lRc2l5NjhrS3IzL2ZBUzlIZXZYSE5Hb3JXTWNVVHpqTEJNdW5T?=
 =?utf-8?B?Ty9WcWNTbm5EcVk1d3FHRE9Gckh1RGlkRndIOHhCQ2o0dXpTaFhrUzdCaHFh?=
 =?utf-8?B?RkZaZEhoZk9FN0g1c3ZqdFBuYU5QNVJqck1aR2ZnOEFjbXJ6RmVyY2pWQnJN?=
 =?utf-8?B?NDZVRUkydFRWcStqcm1rYWU2VjdaVk5yY3VYckVsUmFKWWhobnRsUTkzZy9E?=
 =?utf-8?B?OTJ3RFU2SUxCRkV3Z1dhVW94M2hVSmUycE1ZN1hsMnZiN2F2b3lpRzBlK1I1?=
 =?utf-8?B?SGNnOTl5eC9jTUxRZWRSV3NuMkcxK3hJSVFpaFBvWkl3TXBrazdQYVhJQnNa?=
 =?utf-8?B?Wjc2TzFIeFpTUXlBVWhubEtKcEhXWk5qdEJhcHh1cWI2cXA4TS9BSnZCRVIx?=
 =?utf-8?B?UXIzMHhvemtqSjVoNzNGSTZQOUR3NkVUZ2tqQml5dUkzcXJzOGRxVkc0MzF4?=
 =?utf-8?B?bFJUTUVRc2tEWENmbURIekRrT1o0YmtKYlJxekdNbUUxTjVSSGxMMUFBNVRT?=
 =?utf-8?B?WHdSRkpBWGxjZ0ZHSVR5TUlLTGNQSUY5clhFZmZCaktNUlVnWWVXQjc1S2ha?=
 =?utf-8?B?c2xYaE81bVh5MlJwUkN6UUdsTWRxaXd2Y2VZVGluNGl5MitVNExHUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 43be559b-4759-4690-6e79-08de543923fb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:22:32.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq0XJt8dVwC/WUEVyxk8ww79/QUe+fe19bVIPHS8TkuE64Ue1zNd0Ir6agdRVJlREjJVaVx8uu93upWdiCQ9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2337

On Thu Jan 15, 2026 at 2:12 AM GMT, FUJITA Tomonori wrote:
> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> users can use Atomic<Flag> for boolean flags.
>=20
> The backing integer type is an implementation detail; it may vary by
> architecture and change in the future.
>=20
> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
> particular, when RMW operations such as xchg()/cmpxchg() may be used
> and minimizing memory usage is not the top priority. On some
> architectures without byte-sized RMW instructions, Atomic<bool> can be
> slower for RMW operations.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)

