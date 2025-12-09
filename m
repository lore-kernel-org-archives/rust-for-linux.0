Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF217D2;
	Tue,  9 Dec 2025 02:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765247999; cv=fail; b=HtzGTAimR1j8RRcvvcQkwzHWnB76s5kuv62jJX+xbj7dBpDu7ye+lHizPOIlTw1YJMBK/rz3eKHWVYwHB8PGM0Yt5aqLKhzmkmtayoiD2DU4I0QuAB+Ix5oXdoTMDo7U7+c142+/wDeJ+Q8A/rEHr4JjX+Akb3s5P847NQdkTkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765247999; c=relaxed/simple;
	bh=V++D3OPseHdVTE7rduIej1jt2JHvsnPkEyn6Jv1Xk5Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=K71jwCewj+EQlSjIhuJykf15cx3bbIjijrORqevsNJPjwbjf6As6A0bLvtUgskRGG/jJA7JhFq8gdYt96Fms//IcT/hmpYn9yrm6bWInxpiaHo7i8lwiRmCEfxwds7tEROpgQ7anDpRVvgSk529q9WowTKvP5qqr7IH/S4FPyGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R536eM4Z; arc=fail smtp.client-ip=40.107.208.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R536eM4Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmDDK6hilpnF0ajAnNWgEjITXEKV5yVkcycO2AX8mLgHqLQt3LxTLEbk+MTeZcAMGFoMbItJXYymCP0/lcb1CEnnawABuRnV+4psDTJ3I3pKIiyge3WbH6rzH5FcbD6F4/5cy66/E6jrTQOLKTW+yYfcuvalQ9zGneAhPubQ1IV+wxhu1ADI9zdlHu5DOzFGvYo/czBmzfEVT1Nkf71Qa/aCiTXNKW9chsrLCgnZVP3R3uIb+g3tflD8hFf774OaZnFAq0518Eo0s5YJS0JMvMdodCUaaLLKsHgLNnAPTWm2uR8sHi7J8k8OhlBemmlaeTRqVkmIRPNcnYVw/pXW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=443P0rkT7KA+XRUxUqW+7l1o+Zonbb+WXm9VMcHXeFA=;
 b=LBum/kZ5B9d/+mvIf8BYl6q/CX2U9l5XXJdulcOValDrEsILaRBSrJY7mUMPOf3o6xUKbRmrTkVVMHOLpc5zhokIJoRPv582ap7LJ8B4O4QZ1gTm46GIGcMCWeaduyJ+e/5gytaY+oOBI3nBULAKK8qk98ERFZZbH+0rveCNQbyD0rohRwWzs5v1dKi6SGmGdg48p4xfz6Wmij/1ph1dYTR+dt8q3aXskl6ROcFX6BoN1DR8X/bs8UlHdSX9dpI0LCJfqRSJ9MxVjuclD/5u9mmb7j/PxsEHqgIqBwHOaLt88v0aG4FTqqJPqFtPTFZOCFAVDqs6xfijz//4T/VCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=443P0rkT7KA+XRUxUqW+7l1o+Zonbb+WXm9VMcHXeFA=;
 b=R536eM4Z+q7mAbfC3LodvmK3q+W2bxWs6Ap7dvgJJH2Q9FEl8Sist4O9HLDxVroIGt7YvRtARiYzXPoM1nSTPFPi/Nn1pceUxX69GLaGLmgD56OXJy5oYoGEcrWpglIPMvf7mQdNC+HdQJpD87eg4LVY+ZaI6mUbPJlwi2M54A57azmw/S82Xj4juxDhxIHVbsAQb+hPpQc+rhsW4cHsTot/lrIneNrhBAPj3mBo4CjU0xHxVW8ZG05ltT25NqaB22qHzrDcV63+SL7PIQCLPyEoVtLoh6b6tkPtb5H1kw7SGbwARWvdeothTya4WTiPsGjIg291u9KqHYYISUqARA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:39:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:39:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 11:39:47 +0900
Message-Id: <DETC6QG6AT7A.2OPSK3M0G90SG@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: transmute: implement FromBytes and AsBytes
 for ()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
 <20251208-transmute_unit-v2-1-aa17a6848afb@nvidia.com>
 <20251208132708.4acbc440.gary@garyguo.net>
In-Reply-To: <20251208132708.4acbc440.gary@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: a136a8b3-dcee-4a1b-c21f-08de36cc3a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eElpVU9jcFpMRFQzK2VEOEVaNkZZY1N4eGdHc09BTzhjQ0dTTEJPVGt4akRZ?=
 =?utf-8?B?cEh0R3o3dVA5NHllOUljbHVXNW1nSEt5a2Z4ZTRWVWNBMVN4RHFGWXFBcEND?=
 =?utf-8?B?MFNReTFjUzVNZzIvNkhlQ05Cb1hxdVZwSGtkVHBtZ2xhdTJuYW9ic1MzNHFm?=
 =?utf-8?B?TitQYmsyYmNNVHZRWkhUcklPT2IyRkxCU2tJWExza1g0RHIvVE4rSkRtMmxu?=
 =?utf-8?B?ckU3NlNQcFRRay9lV0xiWFAxQzdLM25rMjRkT3hIbW8wbk1wWnp6NlNZQ3Yv?=
 =?utf-8?B?TzlIcHhmTGtGOHVmYUVKRXhWZXVZNVU0U1JiYmhsQ0hmYm5ZLzZVZ0k2KzNw?=
 =?utf-8?B?R2F3L1haN21zL2paa21EcEtjdWNkcGhmRXdJcU04TEJCNmVNSzNUekZhK004?=
 =?utf-8?B?ZEhhU0IvcDdBbFBtQkVibkFzcU04ZmZhWk1JRnNKd2tGMS9pZ0hPMEFVREdj?=
 =?utf-8?B?bUhBeHZkVm5reGxzb2htTGl6Z3ExbmFWRnY3aXEvL09SVll2Sm1ZL1Y4WWl1?=
 =?utf-8?B?SWZZUkhJakgrUThITUNqcEtnWUNqaHhlR0ZnNGZ0WUViMXAwNVVMeXYxS1Rl?=
 =?utf-8?B?bEpCWU40dU9FLy9KallvcUlCZndHOUovMm9QTVV6Mm9NSHNuazJmT2JvTFJR?=
 =?utf-8?B?a2cwZVRXZkIvNWEwRWtmaFRFZHhTSi90NzUzR3E2MWdmY2ovdlhOQzBzV2s4?=
 =?utf-8?B?NDVibHRVbFZQMDVNWDR4NXp0U2R5TDE3NXpUMnEzaUdQOWxwTmY5TGhBd3g4?=
 =?utf-8?B?U3U3dmtVc3dSMlNkRks0VlNLaFpKdkNmMWZ6ZjZuTDNUb29LZlhUUTBKOXNG?=
 =?utf-8?B?MFlSNTZlWXlUT0s3M2IyclNLMEw0Zy9mY05RWjRnWm9MQmpvSTlLYnhnVEVv?=
 =?utf-8?B?TTVuUzNwNXFUcTNZT3RhQjJlRlE2WG02NVQ3bitxQUM1cnp5TkZPQk1qVk5s?=
 =?utf-8?B?cVNzTFlxRHJQcjZhRDR5Z010U3VZV3BDbTJTOUFiNzlMMjVQbkU4TlNpSzdW?=
 =?utf-8?B?SzZCV0JJNklOUmFhdU9PM3U0YVB4NlZaaE9ZM2Jrbm5UVVphSXkrNmw1REI5?=
 =?utf-8?B?bWphTFlsWStNdE44eUY4N2FWdmw3UlNISjdWQXBkdk5USllteEpkUDdvOG9a?=
 =?utf-8?B?UjdMY2lMVVgxeGVWOW1nd0RtdS9jUmNRWVJIWXFMNzcxalNDK09pdEcwbmR5?=
 =?utf-8?B?MmpSZ2dVU2tpK0syQmNCRDFqWGFMaTAwcVZkY1IwczZFblNjd1hYbHpkZXpm?=
 =?utf-8?B?NUVVbWlxQmpqeXE5dXVZd2xqUEhra1FwY3luNEtRTlZsQXJNWlVKWmlad2I5?=
 =?utf-8?B?UmdKbkdPMTlYalljZDBWSUhHZHQvZjQ1L1NVK2szMlM3OEkvWTdPZ0lBeGxp?=
 =?utf-8?B?SG9GR25iRXlKTktBdG80bVluWG9KcVNCMnIxbTdEaGoxYng5cXIySDFMRTZN?=
 =?utf-8?B?SHFoUFp2dVh6cldROTB3dXUzRVJrdElrQU56ZFI1c2VLUWR6M2svOEJ4NGN2?=
 =?utf-8?B?dEhialV2S1IzSHpiSlhKZENWTDdwaGZJZTFudDdlUUEzK29HZ25lVUNRekFG?=
 =?utf-8?B?V2VkT1VDQkFieVpjVDUveW1mUEJTOE5tRVNWSy8ydVpKbnNDMldjcnZtVjNs?=
 =?utf-8?B?K0U4T3g5S25xMVRlT3MxSzJxNnlGQStHZ3Q0TkZNQ1JzQldOcWpERStZVlJS?=
 =?utf-8?B?TWo1NFlRZmxkZW9GY1BuaDFScUJJUXB5YkpuOUUyZzNocWJHR2VJQmZ6TGM2?=
 =?utf-8?B?cEdkR0F6Z0xidk55T3lLSW9hWEF0SWtpTXM0cnpmQTlYRGZaaDd0eThrWHBE?=
 =?utf-8?B?VkdRaTZiRU51eCtGMGp1Q3hiU2oxbzRGeERrOUM0WUl1VksvaGRoUEd5T0pl?=
 =?utf-8?B?UkRZTlhTaHVtSW1PMkM1YzU1MnNiaEZKUG5kSXoyNlV3c0dpVTNwaXkvVnFD?=
 =?utf-8?Q?Z9j93rsrwBZAcdAdegi6OUh5yg1syk1O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3hBRXF2NjRtYlRoVzcybDRDVDNFV2R4aGgwb1I4ZFlHVlBTam9lNllabStB?=
 =?utf-8?B?WnFwb3lrYVBQRzNHcW53ZG1GL0p5bGNaQmtoSjZsOWV3ZWErZFVZcVFXcWlp?=
 =?utf-8?B?ZlVWY0trS29hNFE3SmhlSFdJT3ZTR3NOVENpTjZBZW82TmtPaGo1M25nZWMv?=
 =?utf-8?B?UnUyZkFTa01uKzJWcCtyZkJtL2h0WVZDRDBIMlhRWHVrUU1uOTNKOEhReVNG?=
 =?utf-8?B?VU04UXM2WThEeTU3aW1La2tka3JhWEhKL2piWVRCTkF1RXhQR01KZ0twTysv?=
 =?utf-8?B?cVdUMmZiSVN3dVI2K0U4SXBSNHR3d0w3OCs5OEdpV3o3bDk2T2Vpb1VoUEFT?=
 =?utf-8?B?K2VKcGM0aGw5bEhVcWFMU0xHU0NldnlzTi9TM21XZUpPV0FnWkdDckYwMCtr?=
 =?utf-8?B?QW9pbUlmellFOEZIdVlUZ3I5bitaNlRicXpnMkRWcWg0KzdVMVZFanlXQ3hZ?=
 =?utf-8?B?dHZ0MHJURVpJNXdKOXJlZHZJTDk3aWhYby9WMW12TlViM1BTNUhWVUcvdGkz?=
 =?utf-8?B?aEdpdWJ6cXNPRkMzOWZuKzJSOTZwSUw3ZkhYSDA2bmJpMmN3WmFJeUVLZEpF?=
 =?utf-8?B?MWkyd25wRy9XTGpHUHRoUFdlS2JCdHVMQ3ZTdWgvMnBublRCbG1LYUpVaHJz?=
 =?utf-8?B?Z1FlN3BuUTRtbVpodG02OHZqU1p6VVNJckRQMGlHZi81d2E3TkdBemZSNTZv?=
 =?utf-8?B?VVVvcE9MeERCcWQ0bkVZQTB1RzFCTFp5S1ZSOUZKWFJIcFBiOGM5cEJPQUNE?=
 =?utf-8?B?Z1hVRXZEemhNVFB5dFpadnFjelZMbDdlMFB3WmlSSkwvWWJaQ3BBMzFZYVhj?=
 =?utf-8?B?VWtWalN1WW1iWHcvUUhSYzdMTE1ycnBRM0VIS2RvYUlPV0E0cFZDbXNlL0xE?=
 =?utf-8?B?TjFTMkNKeW84aDQwSDYrQzI2Z05kVll1ZWNTcnE4NmVGS3oyNFMwN3ZyQzBI?=
 =?utf-8?B?ejhSMHA1a09PVUxuczBoSlk5N0wvODRyejBEYXJWaXFjckRzbnZBRU9odDA5?=
 =?utf-8?B?U1gwUWMxdms4bnhRQzdId3ZOSFV5MTFHR3ozZDdURjdLdUNCSXpHeC9LOVMw?=
 =?utf-8?B?bDR1TGFaN3JHeG9vajA3YlkvUjRXODJsdndEb1YvTHUyQlpwTlZxR0syNUZ5?=
 =?utf-8?B?WFJ0ay9XL0NHTU8xQ2p5bjUwZU5USFFOcGxnN2R3M3lGaUVaV1laNEtlSERi?=
 =?utf-8?B?MlBRMXVNUjZJRkV4TVNRL2dkQUljcmd3bFFXSnZ0cHU1c0pFTHhaeXhveUYy?=
 =?utf-8?B?Z2pvS2FJNmhFN1FrRlExRDFvK0tVSFBGeWFzbFoyTEQwS2JJSDc0OEk2SXY1?=
 =?utf-8?B?YXVDNUdtbUhGYlllZ0Q2Z2xjNG9CQ1N2TVMxNTVvZ1lVam85VlgxN2d5SjF1?=
 =?utf-8?B?Szh5RDZLdTNmcE0wdVpFVTFQRFBTaFdKVElRaElwTjR2ak9zYTdHa0pXN3RJ?=
 =?utf-8?B?eVZnM0pKWVVXc002RVM1ZXBlNUQ3Q2ZLN0kyekNudTdNMlU4czE2K1NqVURq?=
 =?utf-8?B?ZlhCQkQ2Njl3QU5EQ2E1UW84VEdGMjZlSTNTN0h6cTZIc2thclNqRnR2dnU1?=
 =?utf-8?B?dXhhNHlTMHVNNVNyZmJYRDlwVk5yOUNBNWpVaVRzdzJMeTF1Z08ybk9MVmE0?=
 =?utf-8?B?aUZtcWtYTVd5R1VKQlNuUWdXbC9vWWxWRldOSVgwVkJON082RFVocExUYjYy?=
 =?utf-8?B?VzJPK0RMMVJweDBmeGF0bUJCbW41NnRVUDhxN3lJNGdrL1d4cjNiWGZ1YjJI?=
 =?utf-8?B?RkN6R2NBYytsWWFBeVdWY1c1bkxUYnBCNFdDVXlUdzJNbnlpV2N2NTlpN2Nw?=
 =?utf-8?B?MkFjQ3BwNVdPQ2VmSkJiejdXZHd3Zk4wOFZRem1VTjZ4N1lBdTREdGkwOURu?=
 =?utf-8?B?S0lqV29jT05OVS9QYWZkMGxsM3ZEU0QvQkpadVFSQ3Y2SkpROTFIQVJUaXhm?=
 =?utf-8?B?ZFRQU2lCaDF6cVBSeVV6Ky9BN21jaVlaRUYwV1hHcHhJM3paaTNTbjMrZ3NE?=
 =?utf-8?B?Z1JybktuOEhFN0NqbDVkT3NvL3AyZm1RR3VrSVkwNkh4K1FaNU1vM0YvUnVW?=
 =?utf-8?B?M3VjalB4Slc3RFFNanJ5OHdzZHcweDE5Ui83SGFIL0t6Sm1hNUswZ2VTUmZ0?=
 =?utf-8?B?MXF4MXVORWZTZFhCTnhMM1JwUjJRVE16Z0VETUlDcEYvL3k4aUxDNkZBbXFF?=
 =?utf-8?Q?8sP334p+sM/TToUmnhjwWiStp3n03JKa6vORaTLFvmTo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a136a8b3-dcee-4a1b-c21f-08de36cc3a1a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:39:51.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3aKrdesOm6nTKCXcoacOqC+YS7qLIxTjreJXOaYfQ25czSeCq2vEb8tBM7tPrpQnJ4BxIeiV+fbt5qPJBRcxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100

On Mon Dec 8, 2025 at 10:27 PM JST, Gary Guo wrote:
> On Mon, 08 Dec 2025 18:54:40 +0900
> Alexandre Courbot <acourbot@nvidia.com> wrote:
>
>> This is useful when using types that may or may not be empty in generic
>> code relying on these traits. It is also safe because technically a
>> no-op.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/transmute.rs | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
>> index be5dbf3829e2..8d78c81e3749 100644
>> --- a/rust/kernel/transmute.rs
>> +++ b/rust/kernel/transmute.rs
>> @@ -170,6 +170,9 @@ macro_rules! impl_frombytes {
>>  }
>> =20
>>  impl_frombytes! {
>> +    // SAFETY: This type is empty and thus does not consume any data.
>> +    (),
>
> I'd avoid use the word "empty" as it has the meaning of uninhabited
> types (never type) in type theory. ZSTs that are inhabited are unit
> types (or singletons).
>
>
> Perhaps better to have a justification that applies to all inhabited
> ZSTs that don't have special semantics. Something like this?
>
> 	// SAFETY: Inhabited ZSTs only have one possible bit pattern.
> 	(),
> 	{<T>} PhantomData<T>,

Sounds good - I'll use your SAFETY statement as-is. Adding `PhantomData`
is also a great idea.

Thanks for the review!
