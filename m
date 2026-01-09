Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020103.outbound.protection.outlook.com [52.101.196.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F12336ED1;
	Fri,  9 Jan 2026 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966960; cv=fail; b=qzAn7aAVHJTF+PdZ8PT4MyPPtvJDatTJVBazS6Xcyh3VR2OrMZfR2QU9Ld8iul+EbgPyLLmXmIMYXxl6Los69ET43U1VEV2MiOVDfJdpvWNg6FgzucKIU1K1zaK8Hl6Eu8HGFRwhUkGhxXsbPGCy4HzTWb6/G8uwTnMchudpKHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966960; c=relaxed/simple;
	bh=s24f/pqxsKjCWyGqfGi7ytmJuS3mSwgwNxVD3wmvdBY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eiEw7NXdZpVnKQWJmQ2szDyvSQ5gdIhETJNN+z80qcD2Wqc0ltUlcdCGWYldr/WQ291H2bxdDLyeKnulpWRXwf6QTr3XiqTEeNcx0mqcPymDg25dtb6Vb12VP4PkK3qEG4aFvSxgv1cs6AqG2mbQGuOPYtE62o04FqcUiFeVkl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QssrQFJi; arc=fail smtp.client-ip=52.101.196.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QssrQFJi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nquGnnmhk29j9NHJx5vyKUn8Mz9wK1518xJm7ypQXoin+fwkpbQbnarH5qHHln5/yVlz9cNTAhqsMj99rsz3J5bi7/u6LEtupo9hPFPHmKeWmXga3t7T2C0qIPygy2fiCOC8pbHEY/VRs2IKUokHC5QvCU4A5p861Cgp2PakLZmUJei7lowAp8T26U2gJONUhOItTy5VjMynPhBHdBhlT3FLPbsRoI/MztBPRLlmnQf6p8GMaJ4bgVBg6+CfqbbE8Dn8xHhKk9NCq8ftvxtcsvxuuieZex7RjSXBY4CeIpCWG76Lof2rB/PkL5n5DewsOexUwJNZrPonkLarRSNpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5BxtF2BzkhTmTfsbI++W6Q4frqLWQXE+ucdZyV4D50=;
 b=gAuSyiwTnb+57LwXepSoLClGLeP7VMzmJcYZ0pbh4Iw8Ypc4Oo2OcNhwQholjs3Vn5SITCslO+kCCgBsz6c+rrS2Ow3JeIV2IYf3mPE9WnlPRBmR/KXnXqaFcBrVdWTkPUpwUXs1gouDoVQaBOitVqOmhkHPoqadCLgXLsx2dM/0H04cocRnEOt4j708O6Y1NIDXheGS6gdf5iVRqRMBPmm11uuMqN411+xHo2R/L3aAesa0fKjSPDpSe65GIvjuJbxChQ8GdfjX5w3MJHYpCUCOZD5Z9KPKF9n9RooDgu9zacQoUYJs0C2IfrX+YVRbM2eGnVjkhUuZQv+F53jZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5BxtF2BzkhTmTfsbI++W6Q4frqLWQXE+ucdZyV4D50=;
 b=QssrQFJi2ohsNhh2dW/Xrgg3C2TrFrGxTNQhBAhZpAYe6E/T6PsrgE1Td71iwxB3MEjwttR3m6yoaIv0906c+tJncveqNF04/WiQbjahEqZPjKTZ59JZzBWVoQckhhlNXDGLbVV8q8yGqJuzTKVvr2TwVzNXxNIWCaq5B4pi0Do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2673.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 13:55:53 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 13:55:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 13:55:52 +0000
Message-Id: <DFK3Z9K6SMVA.1XCWR3Y3WK7OI@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/12] rust: pin-init: internal: init: add support for
 attributes on initializer fields
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-12-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-12-lossin@kernel.org>
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2673:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f5511ba-e864-47ae-c7c2-08de4f86cde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2pWY1E0VUp6Ukx0VUdmakNvQldvSmk2dVVRRlpoRWFjQkptR2VQRHhHRm93?=
 =?utf-8?B?VXR2MzRaVk8xZnU1L29PWlpmNm52TUg5WmpxcUVrdmpZWXRMcUNZNFNDZHJ1?=
 =?utf-8?B?aTRORzJhZndMaENhWFZONlY3OVhlNFBDOWpoSGZNYWFZcnI0VXY0cDFpU1Bo?=
 =?utf-8?B?dTZOMUEzTWc1WVp3S3hhT3dsaWdoOUp6NUdGbVdKRjZQLzJkZ0V5S2N6MHc2?=
 =?utf-8?B?cUowd0l0NmZwSUs0ZW5zaWEwZUc5QkIvaW03Vm9oWW9rMVhPQ0FNbng2NTN5?=
 =?utf-8?B?QjBnLzZmQ2c2cG96czc3Z3o4cU5tVDFTNEprRk9GQ2c0cGxTQlVlejA2b2tF?=
 =?utf-8?B?TFZ6anpYSmNmUDFsK1FOR3ZMUWZsTGRkakhQZHpMbXRVRWNSMVBGekNYU0pv?=
 =?utf-8?B?eWVSVlA5QzZpTmNRd0FHVXQ2S1JScWdVNnMxbndTTjlCcTNROVpSZERZdEEr?=
 =?utf-8?B?OHJFeXc1c2dVTnBEWEd0b0kzdmZaWlhjMEdpOWU5bEdWeko2UE5Nd3NGUjh6?=
 =?utf-8?B?bmphSHduN2trVlRjMXFsWmY3WFk4MWRVbGg5dERSaVQxZWwyckZSbFZ1c21Z?=
 =?utf-8?B?WnNPVzJ3ZEcyVHR2UExaRWk0ZHZ0U0UwZnBuTit5SlJYUHJaOW5qdWhRc0F5?=
 =?utf-8?B?QnVIcTNtNFFwd09FN21WaSs3NGgwRDBJUUpXUHJWR1ZPdFJzREZQZDY1QlZN?=
 =?utf-8?B?bkY0clZrTXZPWGpHbTF2ZnR3cVdMbG55anRiMU0vR0dvQnZBbE1CWU5NZHRq?=
 =?utf-8?B?ZkNzN3dmRnFjWUFsWTZLWXNsZVpBMFlYRlo5d3B1NHVoYXNjWXpQQXp3Q3Jr?=
 =?utf-8?B?K0dXZW53TGZNZmVkSzFyb3dGekc1ZDdnVTRvQW4ybEZLQjN0N0pkcU9JNHhR?=
 =?utf-8?B?T000OXVSM1BYeDJXcVdNN1dPSHdZN25GdnhhWUNOeDBWdklFeld0L0YrMHl1?=
 =?utf-8?B?Z2JucVFxTUR1MlM5aVFXNVdYaDdRUUxPSHdldlFOajVEbnRXQm5oTUdnRFpu?=
 =?utf-8?B?eUJqQVo2SmdRRzB5d3pVbVRqa0ROU3pMM3JNYW9RU2pva2FoTDk4UjhGS2ZZ?=
 =?utf-8?B?OXZnU3NEOVdCUFpHMk5JRTRnUzhiT2g0TTRtakxVNFdkbmkwZG4vWTloSUtM?=
 =?utf-8?B?YU5zM256MDhxWFlFdTFLNEhpZzd6d2hHS3VsRDEvMEdUQlpMR2NXQ1c4TTAy?=
 =?utf-8?B?b1VmMkRtU3p0alppOXlvK2piZUpGSE1FTzFOellZeWFHRXU0UFhsaUc4QUls?=
 =?utf-8?B?VHdnQkFzbHRDT0FZdDlPRXc5Mng4dGtNNTlMM1k4a213dTRKTy84WXkwOXhN?=
 =?utf-8?B?N3dORjRoeC9vN3VyR2dvWUgra0xWODQvd0hKMUMvTTZqVW9pdXdObU12amdO?=
 =?utf-8?B?L3QyTndncDhxY2VTZkUvTFkvV1JUQUhWRzdjcWt1blFWbURnK2V4RkwvYVBE?=
 =?utf-8?B?QTBYQi9Oa1B0N1RWSldoczB2amFVMUpTSmdjMFF1WUNrSXBid1l6TnYrN1Yx?=
 =?utf-8?B?RjNTVDUrZDFMUGFVeUYyVE9iVzJJeWtPWHpwVzV3NEZTaHJvbnM4TWFrd1c1?=
 =?utf-8?B?SXZBZGlXWVBnS0lqZ3BGUWNCRXR4ejlxelV6R3pYTHBOdGlTejhESkFwUGdQ?=
 =?utf-8?B?YVFBbEx3eU4vdWo3WWN5M3Nkc0NMZklHZ003blYwMk1IL3MxRjBTUFgyRzFh?=
 =?utf-8?B?cTBNY28ybEIvcU95YWJiYUVJRXdEWEVCVTlGR3d1RXNEbDg1VG5vcTVva0sx?=
 =?utf-8?B?K2lQTUVkQkc2alpXcEFjbkRCdy9KZUhNVlJCWmdkcGhFUTFjL1BXVC9NQ2N0?=
 =?utf-8?B?VFZBdlhJb1VUQ1VrdEdnZHlNNmZaczF2NjhseEFmeHNnanZRV1k2c2x6Zm1i?=
 =?utf-8?B?WVYrQmxmemd4N1lnQm81VXlnOFhTSGNHVU1MSmJ2V0FPT1BGaVc5UnQrS0VX?=
 =?utf-8?Q?RZgN/CVhKO9dX7sRxEpwQifpIWMT12Ye?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmdtT1E0bFptaTRKVFQwMXE4dFk1SmhrcHIzZkNpWXo5N3VQQ3dtQk52VktT?=
 =?utf-8?B?eTM3eS9CUHNZdW9QNXV5YXo0K0R4c2t1WXpQUTBjcjU2R213V2E1UHNGSjVu?=
 =?utf-8?B?L0pPRHFSOU1UMngzQVUwNE05SG5oaDN6YUhlczhkOFBPZ0dNaE1oV1kyMXZ5?=
 =?utf-8?B?dGROOUQ3em9ET1lOOVRwZlNzU3ZoSnB6eE1NVXN2TTNRV2pya3pyY1EvSnFR?=
 =?utf-8?B?dnBjNUtRbTF6N2R5aWF1dzFXYmVCWWI1cExnQUVuMXlRQU9YTDVGRVJkazFJ?=
 =?utf-8?B?R0s2MmlTcldnSUpmUnh3bzlqMndaUDRFQzVrb3JFM1dpWXltZ2haOHA2NTBO?=
 =?utf-8?B?UUZyMWNkRkFHamh3M3c4a3lEK01hNFpZT3VRYUpTZzJXNHl1VHpkcVcrMC9O?=
 =?utf-8?B?WnRGM3B1dnNwMFFQMVFZbHB5Tkc5SmwxSmFYTDVVN3VlZjZ4OW93STc1SmNs?=
 =?utf-8?B?SjZyMFZNcFV2Ynl1MkNvOURXczJzeForWXR5MFZFUFhtZmtFTC9GMzJuS01w?=
 =?utf-8?B?NUtwZDdPQ2s3ZDJmZlEvTjJldHp6OVZtWnl4ZXFOTVhOY2xtdWd2WEg4Q2dq?=
 =?utf-8?B?NFVsdEhDbnhEeXBvekpMUm9zekdnU05Vazd5amhTeDlPMStVZ0p2WUhOVDN4?=
 =?utf-8?B?cHB5VVRIQXhlcTVEaW5GRjFZd0JVVEFGQ0ZJbURIRkluZGJ2Y0JXSTAvN21D?=
 =?utf-8?B?b01rTG5MQXpxeHlJdTNFTkhxbTgzTGRMbGhQb0Q1b016WUV2TEVGVW85RzVJ?=
 =?utf-8?B?U2pvSlB4M2hyemNPTHRCR251Um5WbUlSZmVWNFJDeUtYaUtuYXVueWlUL05z?=
 =?utf-8?B?VDdyR2gvS3crL3Bsb2pzZ3AwaFdaQjN0aXdFOWlOMmZJN1U2ZHFURE1xMjkx?=
 =?utf-8?B?T0tKTlpLNi9EOFU5THNFejdFbE5ocXpiMmEvNUZRa2lWVTI1ajJyMmVYQm1m?=
 =?utf-8?B?dC9TeWU4SnZaVzUvcXJMamxUTzN0ZnZwaXZ3YnlqZG5PSS9lZDBER3hFenRP?=
 =?utf-8?B?dHFRY3FNaHVHRDdtUlNSMGNJZ0VTMnRGMnhlSGE2d3dPdHp3Z3Q1U3I4TVZT?=
 =?utf-8?B?cmtKR0k4Sk9KaW91OWhGejBmV3VIemhBWDZJbEJUQXcweHQ2bS9pUk1TYlZV?=
 =?utf-8?B?YWZqeXRNQ3ZTMkY2WWphUlZzSnFKaU9kYkhVQmpOM1E2aUJHd0hKTTNIOUNN?=
 =?utf-8?B?SmsyT0ZSQ3FwMDlVeXBPMnFZc0JyMk9KMWc4aldWR3lOU3FBeDRrK2xaTlNY?=
 =?utf-8?B?Mk1xK0F1REVKSk0zMHZMeklUTFlVSzdrVmcwVkFUY2JlZGVLL3NKWGpjRDhz?=
 =?utf-8?B?ZldCdmNyRXNhMWZqNlZuT1ZwdmNnZkI3dVFFbEViakRwK3JMWDNEZG96QVVM?=
 =?utf-8?B?eE1ZVHEwTnRaR3ozcHFkbyt3TGUyNEZ4RWluZ3ZXQ3BDU1JseG5UTmV4WGRI?=
 =?utf-8?B?WlVsYWorVmN2TDlWZFloVTRQSjdlMnpybmhiM1ppMFo2WnNuWWpMblZxWWFO?=
 =?utf-8?B?OSt1TkVMSTJjTjBqajdGSEQzOUdPQXZueU9UcVdYQVVQc0ZmZkpuVmM0bnUz?=
 =?utf-8?B?bXdWa3gvOGYwSGR1UWN4QXoxVjFSU2RIN2pWaUZZV0o4WVA5V2xqeE8veEVm?=
 =?utf-8?B?aGRvdFNUeWJibFhzQ0FnbHVnS1VZUUp2SEEyMkwvTE4xaU9tZkszSml5a1hC?=
 =?utf-8?B?L2JSRVU4cjdWaXVsTitxZEpPN1NEUjRER2w0dkx6K1VyV3QyVmljOHJSdkpr?=
 =?utf-8?B?dTlld2dLWFcvT3ZMTW55Zmd4bzVnbWtweUwrajV2OFpnVnEydVFvVXZ1T3BS?=
 =?utf-8?B?WXhZS3JlN1FtNUZtelRab1RRT0dtdzgwajZvUTZnZ3Y0b052WmNXMlZBRU5T?=
 =?utf-8?B?eFozM2czZFl2MHZrbkxSRUxPMnljaERBcFVzcmE5STlqc3l4MUh0SU9lcExt?=
 =?utf-8?B?NlRNWDR5VW5zRmtwRC93ZzZJbUE2em5wd3R0UHViS3VRY2UwM2JoWi9lRm1N?=
 =?utf-8?B?TzRrTlhzSWRVU202WkROMkxiNmxPbis1WU83UHpPV1lCMkYvaDRtMFlGaUda?=
 =?utf-8?B?cTkyQXhlNFIrOTJkU0JJSHNndi9kaEFZNU9Gd1RYQzBuS1JxYUE4V2hGZ2M4?=
 =?utf-8?B?RG9PR1hvR1RBNjJQQzFTWkRDK3VpV0J0MVRWTHBRZTU4N1Q2SUxLRWNzcUpp?=
 =?utf-8?B?d3VsaTFaZlV0ejZUbk5yZWlxQW9kUjhpN25WRjBzOEd6NXFIZC9JOVIvSjhy?=
 =?utf-8?B?UVg1bHVyZGJQUnMyUG52WHdhZmxDSnNsSzVrNUpTTDUyQm0rVlY0d0JwWUFv?=
 =?utf-8?B?RndXalJvOGVYVGp5S1M4QkxaeHZ6Z0RhSVVBc2wyWUpDMVlBWkoyemhRdmh6?=
 =?utf-8?Q?19P34G8t3SO2NC7I=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5511ba-e864-47ae-c7c2-08de4f86cde5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:55:53.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAIFUM1xhoKnt92XyVakld0PgwWrGzYmn2spzfzj7+3X09+4HJhakzXp+3TnMe7yf60lyrtSmFMiirZxOxL5ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2673

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> Initializer fields ought to support the same attributes that are allowed
> in struct initializers on fields. For example, `cfg` or lint levels such
> as `expect`, `allow` etc. Add parsing support for these attributes using
> syn to initializer fields and adjust the macro expansion accordingly.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/internal/src/init.rs | 64 +++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 14 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index e14bacc88f41..c20be37e7fef 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -25,7 +25,12 @@ struct This {
>      _in_token: Token![in],
>  }
> =20
> -enum InitializerField {
> +struct InitializerField {
> +    attrs: Vec<Attribute>,
> +    kind: InitializerKind,
> +}
> +
> +enum InitializerKind {
>      Value {
>          ident: Ident,
>          value: Option<(Token![:], Expr)>,
> @@ -42,7 +47,7 @@ enum InitializerField {
>      },
>  }
> =20
> -impl InitializerField {
> +impl InitializerKind {
>      fn ident(&self) -> Option<&Ident> {
>          match self {
>              Self::Value { ident, .. } | Self::Init { ident, .. } =3D> So=
me(ident),
> @@ -224,10 +229,11 @@ fn init_fields(
>      slot: &Ident,
>  ) -> TokenStream {
>      let mut guards =3D vec![];
> +    let mut guard_attrs =3D vec![];
>      let mut res =3D TokenStream::new();
> -    for field in fields {
> -        let init =3D match field {
> -            InitializerField::Value { ident, value } =3D> {
> +    for InitializerField { attrs, kind } in fields {
> +        let init =3D match kind {
> +            InitializerKind::Value { ident, value } =3D> {
>                  let mut value_ident =3D ident.clone();
>                  let value_prep =3D value.as_ref().map(|value| &value.1).=
map(|value| {
>                      // Setting the span of `value_ident` to `value`'s sp=
an improves error messages
> @@ -250,21 +256,24 @@ fn init_fields(
>                      }
>                  };
>                  quote! {
> +                    #(#attrs)*
>                      {
>                          #value_prep
>                          // SAFETY: TODO
>                          unsafe { #write(::core::ptr::addr_of_mut!((*#slo=
t).#ident), #value_ident) };
>                      }
> +                    #(#attrs)*
>                      #[allow(unused_variables)]
>                      let #ident =3D #accessor;
>                  }
>              }
> -            InitializerField::Init { ident, value, .. } =3D> {
> +            InitializerKind::Init { ident, value, .. } =3D> {
>                  // Again span for better diagnostics
>                  let init =3D format_ident!("init", span =3D value.span()=
);
>                  if pinned {
>                      let project_ident =3D format_ident!("__project_{iden=
t}");
>                      quote! {
> +                        #(#attrs)*
>                          {
>                              let #init =3D #value;
>                              // SAFETY:
> @@ -274,12 +283,14 @@ fn init_fields(
>                              //   for `#ident`.
>                              unsafe { #data.#ident(::core::ptr::addr_of_m=
ut!((*#slot).#ident), #init)? };
>                          }
> +                        #(#attrs)*
>                          // SAFETY: TODO
>                          #[allow(unused_variables)]
>                          let #ident =3D unsafe { #data.#project_ident(&mu=
t (*#slot).#ident) };
>                      }
>                  } else {
>                      quote! {
> +                        #(#attrs)*
>                          {
>                              let #init =3D #value;
>                              // SAFETY: `slot` is valid, because we are i=
nside of an initializer
> @@ -291,20 +302,25 @@ fn init_fields(
>                                  )?
>                              };
>                          }
> +                        #(#attrs)*
>                          // SAFETY: TODO
>                          #[allow(unused_variables)]
>                          let #ident =3D unsafe { &mut (*#slot).#ident };
>                      }
>                  }
>              }
> -            InitializerField::Code { block: value, .. } =3D> quote!(#[al=
low(unused_braces)] #value),
> +            InitializerKind::Code { block: value, .. } =3D> quote! {
> +                #(#attrs)*
> +                #[allow(unused_braces)]
> +                #value
> +            },
>          };
>          res.extend(init);
> -        if let Some(ident) =3D field.ident() {
> +        if let Some(ident) =3D kind.ident() {
>              // `mixed_site` ensures that the guard is not accessible to =
the user-controlled code.
>              let guard =3D format_ident!("__{ident}_guard", span =3D Span=
::mixed_site());
> -            guards.push(guard.clone());
>              res.extend(quote! {
> +                #(#attrs)*
>                  // Create the drop guard:
>                  //
>                  // We rely on macro hygiene to make it impossible for us=
ers to access this local
> @@ -316,13 +332,18 @@ fn init_fields(
>                      )
>                  };
>              });
> +            guards.push(guard);
> +            guard_attrs.push(attrs);

I think guard_attrs should just get the cfg ones, not including lint levels=
.
Otherwise, `#[expect]` would be broken?

Best,
Gary

>          }
>      }
>      quote! {
>          #res
>          // If execution reaches this point, all fields have been initial=
ized. Therefore we can now
>          // dismiss the guards by forgetting them.
> -        #(::core::mem::forget(#guards);)*
> +        #(
> +            #(#guard_attrs)*
> +            ::core::mem::forget(#guards);
> +        )*
>      }
>  }
> =20
> @@ -332,7 +353,10 @@ fn make_field_check(
>      init_kind: InitKind,
>      path: &Path,
>  ) -> TokenStream {
> -    let fields =3D fields.iter().filter_map(|f| f.ident());
> +    let field_attrs =3D fields
> +        .iter()
> +        .filter_map(|f| f.kind.ident().map(|_| &f.attrs));
> +    let field_name =3D fields.iter().filter_map(|f| f.kind.ident());
>      match init_kind {
>          InitKind::Normal =3D> quote! {
>              // We use unreachable code to ensure that all fields have be=
en mentioned exactly once,
> @@ -343,7 +367,8 @@ fn make_field_check(
>              let _ =3D || unsafe {
>                  ::core::ptr::write(slot, #path {
>                      #(
> -                        #fields: ::core::panic!(),
> +                        #(#field_attrs)*
> +                        #field_name: ::core::panic!(),
>                      )*
>                  })
>              };
> @@ -361,7 +386,8 @@ fn make_field_check(
>                  zeroed =3D ::core::mem::zeroed();
>                  ::core::ptr::write(slot, #path {
>                      #(
> -                        #fields: ::core::panic!(),
> +                        #(#field_attrs)*
> +                        #field_name: ::core::panic!(),
>                      )*
>                      ..zeroed
>                  })
> @@ -382,7 +408,7 @@ fn parse(input: syn::parse::ParseStream) -> syn::Resu=
lt<Self> {
>              let lh =3D content.lookahead1();
>              if lh.peek(End) || lh.peek(Token![..]) {
>                  break;
> -            } else if lh.peek(Ident) || lh.peek(Token![_]) {
> +            } else if lh.peek(Ident) || lh.peek(Token![_]) || lh.peek(To=
ken![#]) {
>                  fields.push_value(content.parse()?);
>                  let lh =3D content.lookahead1();
>                  if lh.peek(End) {
> @@ -448,6 +474,16 @@ fn parse(input: syn::parse::ParseStream) -> syn::Res=
ult<Self> {
>  }
> =20
>  impl Parse for InitializerField {
> +    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
> +        let attrs =3D input.call(Attribute::parse_outer)?;
> +        Ok(Self {
> +            attrs,
> +            kind: input.parse()?,
> +        })
> +    }
> +}
> +
> +impl Parse for InitializerKind {
>      fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
>          let lh =3D input.lookahead1();
>          if lh.peek(Token![_]) {

