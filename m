Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586E8635D;
	Thu, 12 Feb 2026 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770862177; cv=fail; b=VJMGPxC+XL1KKyloW6vRa+S+bz/Fb3aClOXRAsXaXvaF1v1dTsFVt8nYtXXrfm0V6VL38Wbr+zcUGIEvXEvnwg2k0q9SiRhpXl45THChlWYaiCfSjDtIZoXfOhojlePI3GwIFOHr1/TFupTyAF0p4V/fpvseQqghGJjpiD/KCdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770862177; c=relaxed/simple;
	bh=psMbYi2nH9w0mZJ2LDqPCTHDxKkMCqihq0H+UWR7a78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g1VPK1granP3Q/ssEe1n1pdVWRAcr2binZa8owbvpLBRMfMs1AqCJNRnPI/GJ2B3KSnBlmzRY6GyqgreYMgPXetHQ0Dv+Bo8HUt1437DkvnP4kNRPWaLAQhJJZN7s7ZZZ1y31FsddaUqc3Ydx4EBubSczWFi6IXUbo9yHHdpjRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HYcFOfze; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HYcFOfze"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwThT+Clz4YYYyEsp+qnUQt6ESYVLwyv2CHWxJUWvr+h0SgUNvfRZAGAp9kwhqXK6kPhTgYLUgShTipMltQYks0NRRfbcWBWbQnEMHJrEr4zbIngVmXo4bmJOq+1Enlt/GfA5XX73dQCsyLf2a8hbu+Scg530UDzXnJqDuN+iynK/Gq4RRuRDtSjJKerALbxQSaMexgMzGQ2zOaQj28dUdFBoOJ3D+jFr7xZGn0oREeKIkkgWlOyQn5WxMRHimwlc+PifRbMCJ+iv4omWXjqkrujg5EvgJnaoRkyUGYzFv/7mFuUbSvusG2wVhdRwZFOz301T3Y5WbjQDIvnEJ6lXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zkhORNPsK9MuzSO4nQ5zYp5V75F95K2JoeMmJNejQI=;
 b=oJGVgpjGLfj6z8ySeNxdn2tUG3Q/dcRwQtSB7rLOImCXfbA6OgOeF/5+2DnxnhL2V0MWSmDXL3FRSu0wgS115uXu/eVRa+DGO8643jPYJ0sM+HCJIGDjWDq51/mv/TvayZsyKGQ6n9jb0gO7X17+ByZdfhkYQW08RgC08b3eriJdI9O65O86M4/T27IwxOIhgru7CN2BlS3Qh5G6Hily6oID9/Rb4IS5ueqMgydTxj9n6dDDc3gMKt3vd2hECCVbN7j31KULC6fD9p+86R35MR9SnFkYjSNQuKRxrLjVZD0thcVAQ0XJzPxFmGs46KjwNOCx9QZ85a8RzWB5u8dktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zkhORNPsK9MuzSO4nQ5zYp5V75F95K2JoeMmJNejQI=;
 b=HYcFOfzeZzkIYUk8VgEddvpcJhQhPekwn/VCW+QBtRC/DQHHBb73FAx0TcIZmbonfBA8tdwm5+4qWunJcUheN95Ou9BJYxBbxspH57w36GItEIbyfvimxxryE4W/3ef6MPqXxGJSPyH5zQmnE+V3BnloFtBNxOgnTp7KMskzPbFjVU+1IeW/OQnC0B62HUr6fSApiGZD+dDHGwzZNMNhCXXyXw2stHS9DvfUfwUx8/uBGLj6PkNAwA3vAbmEmoNFkXyxBolZhbZ8qwnJZ8gpr5ADCw0DHeVRUMOO78Q9JYKA6nCImUdt7TJ99Q250yYdga+HKuW6x/quI1em45AOCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 02:09:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 02:09:32 +0000
Message-ID: <b38a9707-a640-4104-a8a9-238cab23187a@nvidia.com>
Date: Wed, 11 Feb 2026 18:09:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-18-jhubbard@nvidia.com>
 <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 830916d1-9868-4323-2692-08de69dbc326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzlzZnk4SWU4Ym5HTVUvVkhhSkVDZkU5ejNaWUsrNmZmL1pPV08yMU5QYWxp?=
 =?utf-8?B?QVNUSk1tOG5GTWx6RnFQeEQwRFpIM2RxcnhjK1lhb0l6ZS8zbVFJd2tPUXpQ?=
 =?utf-8?B?UWx2cmFUQmVKNVhIenhYUm93WXJIUjNYRVNuZy93aVBZZlA3NUxkWHJ4VWpC?=
 =?utf-8?B?YkRsMTI0Mk9TRkFUR2N4bWtKUkkwYTYvRFpmM2lIM2s5U3czdkFWaStZc0RF?=
 =?utf-8?B?MEN0NGlvdGxUdlJicDN0R1hPR1FmYTM0WHJFNUhiai95Zy9wbGovOVg0cXpn?=
 =?utf-8?B?dlgyRDRITUduQzBPZGdsMlJQZVBBVG1wNGo0MFpodmVnYnV6cUxmVzQ0dGg3?=
 =?utf-8?B?TXVpZ0tvSitkbTA2Q001cHN4SGE1YlpMMTAxUTR4bTZPaFZtdHZpUlpiYVhU?=
 =?utf-8?B?WG9CdDB4U3c2c3ZhempFUGZzSW5Yd0JBTlhEdDgveGZQT2QxNDQ5SFFacTcz?=
 =?utf-8?B?NTUrMS9EcGRZSE9iNE9Rb1dNaGc3WlhMeng5Z3RLcGVKMk5SSTdtUUxkK1pi?=
 =?utf-8?B?SGozSFh3dVJ6QUdWNnh0VlU4OXZLMzJ0MERkTFdVeTNOZXpMeXRheFh0ZHFF?=
 =?utf-8?B?emxpVlh1NFBQR1BFdFBWN3I1MmZHWTRLR1MzNXQzL1UreHU0Y3FNczVhWUlP?=
 =?utf-8?B?OE8xamRJejZYcFhlYzN5RHNKN0F6SG5Tb1M1azA5Vy9pNWNjMnNIOVVReTF0?=
 =?utf-8?B?WGl6QmtOdDVGcE5yRDJhL1hCZW5iL21VVTN0YnRSQU9NN2tEdkl1WlE1dTF6?=
 =?utf-8?B?b1FacG51RW5ObzZVVE4xSkZXbzN0d1BoY1F3YWpjTXQxclNOVTRoK1ZlRDZs?=
 =?utf-8?B?NmZ6QmdaNnI3YUlUc1p6QUZPT0tTYXB0MHorMXZSOXBialJwYjZLbFo0SHJL?=
 =?utf-8?B?SkRaN1cvenNoNVdLZTRFbnNiWWgzdWhWUEpJZHgyc2ZCVlhJS29rUWNzRzFL?=
 =?utf-8?B?UjJIbDBZTXl1OFpUWkVVTWZLeFZFaEdEdmNuZHBubVBVcFJhR3N5cFJrQnJY?=
 =?utf-8?B?bTVCWGtUbDFOSHZhOWQ1NFVQY2pvY3RWNHlBUFpzMnFycnVuZHZqYTNNaEM5?=
 =?utf-8?B?RzhRaTJGVnVVaVRXdGp5TUp5TGJ3NkIyY3Y3MkxnWUw4akF4UWljRUFCb0g1?=
 =?utf-8?B?TnloazhaSXNFWmc1dTdGcXlVY2MwTVBTVEhkemtLbzBxd3lieWRla25oRWJr?=
 =?utf-8?B?aVo4aDdoY09LS1dJbVZONkRMSDZPZjExMURKRlFzQXJsL1diZ05LR1p5YVlM?=
 =?utf-8?B?OTUyOTA1QVZPZlE2bk5lazBMUXVDU0x2ZmdZL01hUlB6VDQ0czRkV1JKQUhM?=
 =?utf-8?B?QnZuOHUrR1dOYkM0UEJ2MDV1SlJpMDVyVlIwZ3ExNUMvalZQN2ErRUpGU1Vz?=
 =?utf-8?B?Q0JYU1psVFFVSjNJZHgwdHF2aDZQTkRwREFLRUpVUENSM2hsUit1SXgwVVZ1?=
 =?utf-8?B?dHZ3allBc1hPMlhSa0dxc2pFOFBvRzZBb04xalF3NHR0ZEc3S05acWhkeGtz?=
 =?utf-8?B?MVVMNWZkOEtOUGkrV25CSGluSmdXcGNWNHlQdkRhb2x3R0N0S21wRGMwUksy?=
 =?utf-8?B?eEVXMUtaRndlc2dHbnNDeXBmdjNXazJPeUFkcCsvbFRnTEZYdmlDRHlBQm5p?=
 =?utf-8?B?T3crZDhoYzQrVFplR0hVR0FzWXM2Z2Ird3JwTHMwamdWeDNxR1ZJOWtzaFlr?=
 =?utf-8?B?VXFZSm5CQ2VVVDI4dDdpdWEwMjdxc1lISXdqZ0pGZEZZOVNMNEx2VzN5QW13?=
 =?utf-8?B?UGgxSmc3OXRjQ21Kc29WbCtURVRnVXJmanNMZUtDMGNaUTV4c3RRaVd4cVdH?=
 =?utf-8?B?LzRyYVBnV2NqZ1ZIZW9yaHRrN1dLeDNqUVd0dkJ3aXFHbWZ1NVFlR0ZrMDhS?=
 =?utf-8?B?MXVDU0hta25ZcUlPSkZtR1J3czhURnFUaUxKbDFVUUgxZWY2NlRJTENPRzlO?=
 =?utf-8?B?RG5VVXMwdk1xNUVFN0loZ2NSblg3SUd1T3hVZGowZ1g2Zk9EbVhiSlM4Ylh3?=
 =?utf-8?B?eHl1Y3ZQeW5WV3dUTTZLV1ROUlJ0VHpvcFNGWTZYR2hXSUtPWDlhUmxwbERx?=
 =?utf-8?B?QzlXMHA2Zkc3V2JsTGw3eGJBeXdvUUJodmhFQ0xoYjhoRlZzbzJpU2V1M3lD?=
 =?utf-8?Q?DeqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXpNdXFGd3JSOHJNblJ1QkhRODA5VFNybHFOekhlcmxXRm9UZ0tvVEJQVTBJ?=
 =?utf-8?B?Y1V0QmFJNk9pY2tmN3JkQ1N4QUVrNTk2aFVLZS9JaFJtQjc3R2lQU1VVODhv?=
 =?utf-8?B?SWVBSW0zKzE5SnF0L1prNE45M1E1Yi82M1JEQWlpUTNOUjB4SUZPWTlyTC80?=
 =?utf-8?B?WlpXMnJBSm5iR1IrSVZFSlV2THdOZ2YyV0ZXdGVzZUZIdWJaN0ZBb0o1WHhr?=
 =?utf-8?B?R2gyV2NkVDNSeVgvWmh5R0laZzZQMlFQTll1V2xqQXRHbzFOVmprTzQ5Uys2?=
 =?utf-8?B?S1N6N0l3cERXZmZKOWYrNHp5ZFZsVU9wbTN4Q0JmTVFlZkMxZVhnZE5NL2Fk?=
 =?utf-8?B?MjUvb2lKMzNEOFovQzNEWHAvTVJzVE1FVVhOUWRtUEUvVkpHWUZYU2o0SDJ1?=
 =?utf-8?B?VGhwWVVyK1NsVFZxYzFEcnpldWhWV0JZRlY3Yk9XSEltZW1RK2VFS0w1Y2to?=
 =?utf-8?B?Wmg5OFZsN2tCci9OZ0pMclFPOTYrN0JlRFpKSGpWZjltRldsaHBCUkVrL0xB?=
 =?utf-8?B?Q1BtUG1CV2owWHo1bXYvM1dJcTJXb3ZHNGlQM2ZjNnBzSGtwd2FGQWQ4WGxr?=
 =?utf-8?B?ZCsybUI2dFcxWldvc1krUFVjUm9MUFlyRmxIYWZQd0k1M0hPU3ZBWXB1VFpp?=
 =?utf-8?B?QUs1c1ZvbEhyRGk1Z0JpOHR0aDdxTjErd09WM2JIcE9EZThEUjJyMVZWelNO?=
 =?utf-8?B?M1lMT1VuaTUyODJtL0Rlay9OMWpoUWJOdEFjRTNtTXdHVzk2ZzVVdy9udTlW?=
 =?utf-8?B?ZzFvV1RLdjlvZWhHMlN5WEVhbDBrcjVtU0NUWlBrWm9HRDBabGEwaU5oR2pt?=
 =?utf-8?B?ZXJ2Zk1ZcG9DOEtEOGZxenpUSmNVNDQ4cEJPdU8rOTNLemRyMGhteUM1d1pE?=
 =?utf-8?B?VzZKUnRpTGRHTmErSVRZZTcvaGwxSUdlOTMrZmlXTngvV2ZuME12aStjT3ha?=
 =?utf-8?B?a05jUkNoandMdWFRNC9RM05PeFFnelR2Nlc2UlJqTnNwNFUzcHA0SEFWNU9I?=
 =?utf-8?B?MDB3c01HOWlBSFhGWHU1MXp4ZUdFdjdGaVc5RzhOUEI5ZUdiQ25LWXhUTjFt?=
 =?utf-8?B?ZVd1eVdVdHgyODd3OGtaVXpJRlhSOWZkQTFndS9Cd0VQLzU5S2prMXVFSXZN?=
 =?utf-8?B?L1QzN3Z6L1Nobmhjc1JJeG0zU0FqWGFkT3JPWVVvWnNSWlRyWFVBZlVqcGdP?=
 =?utf-8?B?M1NKZGc1c3daOUhUb1IrYkpiN2Y0VVN5OFRHV0lQY2pNS09VeHZib2dCT3FR?=
 =?utf-8?B?RmFMM1d3Z1NaY05Wc1Y1RGxTTnQ3M2NTNXBlSHVtbmlPMkJWN0Vqb3RTU3cy?=
 =?utf-8?B?TDZNekZwSkxMYUkzdHVDWXN1NTFDaWhYZGZZbjZzRHRPTnRWVVB2NWRjUytx?=
 =?utf-8?B?eXVHVmdjZHNoSVRHTWkyb2xTanF1VUs2UWF0VHhIMk5id2xMS08zRjJCVjcr?=
 =?utf-8?B?azB6MVB1Y3Iwenc3SEM4aDViVXUzNWFVakFnWFdBTWVNdUpWM0dWaWFmZFpC?=
 =?utf-8?B?ai9ucjRrTDlQNzJFMi9MOFZNU1lFSTA5WVFBMTQ3Mnk3czUzKzhiNktBc0Ft?=
 =?utf-8?B?bVkrTTd0MFR4Rk1xMzBGMlJzMW1BQ3E3N0V4b2ZkVjhvWTRtTk41L3UyZWsz?=
 =?utf-8?B?MG9EYXk0R1QzR096dHBJUjFiSjltTUlFN2hXRWpuckc0eU50YU43V0V1bE9r?=
 =?utf-8?B?ajFWSFNYcHk0dXZaeEczT3NUYzFybU9MSW94ejJrR3JTQzBRbEJ6Qmc5NHRF?=
 =?utf-8?B?RVFjV2Z1WVFmclhZSHR4RmVQcjRvZjE1VWxUUExhMUVyZXV1Rzg2V0hCUUxF?=
 =?utf-8?B?YlZ1dXlNZW9iSTBlZTFaU0djcVVoWEVIakRIQnc0d0tYd1lBbnNGWlBxWUxp?=
 =?utf-8?B?Nk1xaFBzY2UyT1pzU3cySis5ZTRzOEFhUDlONXdPaDhTalpuUFVvSmFrWEF1?=
 =?utf-8?B?dE95WFFaRitwdDd5R3dURzZtU3FPbWZoU1drMVd2cGswaXdZNTZzN1FuRkda?=
 =?utf-8?B?TUs0bEk5SzFsTGFtTzY5Wi9PcUNQL2tkdVY2bEJGS3VJak1VdjVMTjVDYS9n?=
 =?utf-8?B?MjFDbVBjeVh5bWxFTkM2SzFOUnAxUXBRei80cDE3a0NFR0l4QVZmRTZMTFJC?=
 =?utf-8?B?dE0xRVRxNS9FcFRDK2k3c0lHRWZHRm4rY0NNVXlqV2xrQUY0Unkyb0cvTEtt?=
 =?utf-8?B?d3VVbWEvTTlCTFcwQ2d1RStDR2NrQVpvQ3ZwbE5NRWJuTnRtQU05N0JVS3Ix?=
 =?utf-8?B?dmZUbHk3ZjlvSGM1NFVZSWtFazlwSXZFYTJXNGRHSllEV0grNlNudmt4ZXdu?=
 =?utf-8?B?MDJQTTBlRGpGS1M4Rm5tWmpZblEvMlFRTVNsQUtKTXlSdTJ4NzRKQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830916d1-9868-4323-2692-08de69dbc326
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:09:32.7991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0VqCxDOL2H1ECQ8hnOHGR5mV34EPIv/3TWh6eR3LHGX7HGRifRvnRgo2fGco3lodMskLnUQHymyjTa/H6yfpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798

On 2/11/26 2:57 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
...
>> +    #[expect(unused)]
>> +    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
>> +        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
>> +        if offset % 4 != 0 || data.len() % 4 != 0 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
>> +            .set_rd_mode(true)
>> +            .set_offset(offset)
>> +            .write(bar, &Fsp::ID);
>> +
>> +        for chunk in data.chunks_exact_mut(4) {
>> +            let word = regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &Fsp::ID).data();
>> +            chunk.copy_from_slice(&word.to_le_bytes());
>> +        }
>> +
>> +        Ok(())
>> +    }
>> +}
> 
> Technically, we could represent this as a separate I/O backend and use IoView /
> IoSlice (once we have it).
> 
> So, you could have Falcon<Fsp>::emem(), which returns an &Emem that implements
> Io [1].
> 
> This way we would get IoView and register!() for free on top of it. IoView will
> allow you to modify fields of the FSP structures similar to what we have for DMA
> with dma_read!() and dma_write!().
> 
> I just briefly glanced at the subsequent patches, but it looks like this could
> save quite some code.
> 
> We may not get the full potential right away, as IoView is still WIP, but I
> think it makes sense to consider it for a follow-up.
> 

Yes, let's keep this in mind.

thanks,
-- 
John Hubbard

