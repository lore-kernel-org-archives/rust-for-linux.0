Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4829ACC5;
	Fri, 20 Feb 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598811; cv=fail; b=iLemlngRYSPxHsjbv6K3Ohsf77NZqknFLEdP27wyYCFXeQK6BfXvcXMUutkzrqMFS5FpzLnN+vpJDitwRW2R1Cpu3ndIxbaClMXzfUGEi2YLrPqnj5v8+YVdYhu/1f1vR3GtDi2cLzdjZAWGQBoWDDU9n2At+Q3AwiYcdW2dPmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598811; c=relaxed/simple;
	bh=Yr9IRW60vnzp/qB76NIjtBLSBy06RZcLjI0ALV16lkM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=sYpu2lk7uDdXhjBG7M6UKtV9WF1WAtRdnzBEmqztcmLFJ6IO9m95Mb7R4C9nj2dv7LjSbVOP+Yt7TGauaAvHBjJMOewXkWTal/LsgKdmJr9wEmwBTYQqJm1GEGliuCJq1jTdYfzsrI/jCK7abOs5BRBGxh1TwNjkJhvoYP1IL94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=huIA5jVf; arc=fail smtp.client-ip=40.93.196.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="huIA5jVf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1Ber5d7h0UbuC99/ZkOt1djrJTj8pR5ZojyzzHD8STvb7m1iPubKWZXpBoEko74RWDSFT5RJS+ZzD+7B8IRuQO1ihJzi0iNmiInRRBBpW+ZtGvAm47PRKye3CJTsgVdEzSsgrDuADwEIe5SFPoYUWOy2nKhrQ1kVJj/mwfSb00GTvwG+O8+2EptvwWOLVmgCXhd60ootNFmvb+LJmto2hAP/kPOLKP5pVTw6NfaI47JgawoHL3a9oFevj67Jh+EvQbuiDgpOZMqjtU7+8nxb7KxokZ/suG9RHc90KD4tnBrilqAMiQYYTNA+d6Xt3l03sHbdr4l/Paf0higYzAI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okIOALqBHDgcKEteuPdw+5j+7g1t+3N0KgAjwhZuxDI=;
 b=AGGvuWEVVphfmpjaiQ3dY5dSkUMxh30yv27KzpoTLE9COh6N5IXPCEcgZvX4NEy6SCKjlkALawqFtUH+Rj12seRwcSW/89/sw8ZJtaRkeXEop47ws6UKKUZ/ltagR81W5KbszSGkVIAM1biaIW7Te+x14itZTdGG1+S4bzc2miY44tEJn4tMDmAyFjasMRGsL7wxVuLz8/efJG9bY5XbsI6gPFW4uaTdwLQH9S/w/0QueJdtVLqHLftYFwBOkaxHBUrfylankr8fn0sDjVQEL4GMJDe0SXBY9B6B58D1A18DNFytjY2CcAg7WZ4GCaqjUDzS6o4gh2WqzQBh7Q8dug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okIOALqBHDgcKEteuPdw+5j+7g1t+3N0KgAjwhZuxDI=;
 b=huIA5jVffGnR4Sq1tc9gZE3/iyf0krLw7qILO/BtqlkKuhAGUhjbkMg5FAGdMTZO0xpd1M+WeSasSDq731O6UttTU4QvrfegzJXVyzEXeEiKYKFoeS5C/YTTBK+9wNOsK2KVy1KUecQ06oBaUIaewJiGuLCBnnJhJLG8fJA7aoNx8J8woMGbW0M36IlS/ZC1jmtGBspfyd6ZbI5lHSddIsVzynSThNvpt9BqIm0am0AqZmrZsVcCB+CW8CXJZu9+L9b0Q4Pxist7Si9FpxhCbHZz4ym2aiJBz24cw3kJn88XwFoV6Q5+jaR5RZYPIMSinlqqn4+sm6MIv7maCePXDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:45:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:45:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 23:45:25 +0900
Message-Id: <DGJVC2YUHIK7.37Q47DI7QQK32@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
 <aZLc0YMHd8C0bVD2@google.com> <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com>
 <aZLzBP_v6JlTR9WB@google.com> <DGGBVOL5XZ5B.NIXE0JCEBJC2@nvidia.com>
 <DGJKZHBSGKKF.2S8URAVPODWJP@nvidia.com> <aZgYzbsVr2uKZUOP@google.com>
In-Reply-To: <aZgYzbsVr2uKZUOP@google.com>
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 603fdd0c-798f-45ef-5c4e-08de708eb0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEQwbmw3UnlENUxZRkk1Rlhvelh2aUxPaWJkMjZzRldhVGJWT3g5QVVIUlYx?=
 =?utf-8?B?anhVQXl2ZUtJc2RhbUMwLzF3UCtORjlPdTBPc0E0SGxPN21xV3ZES1JaOURB?=
 =?utf-8?B?SnVPVXhvcHZzLzVzTmtIeUlzc29oSjRUY3BaVTRJbjVDVTh5MThGY3FDbHJG?=
 =?utf-8?B?SmMyUVZnTUNNSWoyVTNyNmJNZUpxeEM1UnRvRHdUais0ZFd6N1NKZWFBWGV0?=
 =?utf-8?B?bi9SR3hFaWFncUpteDJKWlRDZ0ZmZ2p0eVpwNmhFWjQrQW4wdmxtby8rcmNW?=
 =?utf-8?B?QUNqUUVXWEZ1WmhlKzlGWjRYbjYreVlvL1FMa3NxUVhUTExRbTRFeU9sYlpL?=
 =?utf-8?B?QTFDUEJIZjUwN1lnamtaNlJHRFg0N0NEb0dKakYxNUNpb1NQcHN5OGRrdUpS?=
 =?utf-8?B?MWd0MXdmcFFyYWdTemF3MHhTVi9kTkkrK1JwMDRzZHAwa1Bmb0V2VS9pOHM5?=
 =?utf-8?B?SUZ6bnBwOHpsQ3ZnWVhwVnBYMVliRXFDVVIyd084WHpNcUtCNEM5a25LcnN1?=
 =?utf-8?B?empCYTFBRk82MS9tYXRHbVRaTU85K0pjVWt5djZVNGs3cGg5M1RnSUlNdUU4?=
 =?utf-8?B?VFpUbEFROFhEOXVvNmk5SUFUM2laK2VUZGNqN0tNaFVkalJDZlUxbGpLWlF6?=
 =?utf-8?B?STI5VU9qZDBHZnEyUHhybTZFTmFsZ053UURWUmJMUDd3UGM4Y09FajlqQkhQ?=
 =?utf-8?B?R29TdENQYUV5NklPWDBXcDFVSDF2ZmVnWEF6YW9TZmNSeHRXbUlkZkZOb3R6?=
 =?utf-8?B?bWRTcVhSVEhjaTdKOHpwZ2xSQWFrS1pVZll6V1VFMjBOMEpnRzdsdWliQWdt?=
 =?utf-8?B?OXFXd05XeHhVeFhDa2V2bVh4cUowOE15SVJ3M3FzRjR5VjhNSXFycTdoRjlx?=
 =?utf-8?B?TEdGOExtR3hOMFdtQkJwY1pjN0xrUHljeUJSWHE0UVNUbmtkNkl4TzF0MkVt?=
 =?utf-8?B?b1l0YTdGVml0TTh4MmdnQzhZdW5BczZsb1prbDR5aFA3Snl2QmM5WkRPRkFY?=
 =?utf-8?B?NU43NTNaSERscTZUNHppbkhmWmpiR1JhTElSSVlIdU9vV2R3akcxZHNWcith?=
 =?utf-8?B?SFl1S3BEakhYN0Q3a29EWC9UWVh3TGZUUkcxcnNwTTNDNjd6Vis3bzRiSTZX?=
 =?utf-8?B?NnRncGRaOTZxc0JSeCtYTlB2TlowNngrbmVtYkMzWUpWeGdEbllOZmFvSW1E?=
 =?utf-8?B?U2lQNDRTSHJWWFNMU09HQVBzVnZsOXc1TTZoZU5GcWtENzUrdExxS2lERGlr?=
 =?utf-8?B?K2Y1N1dSdW02YTJtY2RJWHQvSHczSTloM0NGeGZSWFFPNmxDWW8yTW5HaGNo?=
 =?utf-8?B?bDU2alJoWFBJS0RnWGNpSDF0TFFneFFxL3k5RUNqQjVyOG12N0hkWTVCU1kr?=
 =?utf-8?B?RXZ0TFBGVzE3VHpQNWFnZnJPWUZSaWs3d0RwRU4wWHZhNVU1N1k5MWNjQW9w?=
 =?utf-8?B?NGMvTzhicmFmUXhTWVJweHRUNERVOU5lNndCdWlXZGhjRHdJRFB2V1dyU3ho?=
 =?utf-8?B?TGNXVllQbzdzaHMxYnc5KzlkQXJPK0x5SjF6dE53SHViRHpqcU9VOVhLOC9a?=
 =?utf-8?B?MUlLVW1kN2lOTzBUTmR5b0JYc05vNkU0Mit4NHUrdlB6RkV4MWk0QmsxeEt5?=
 =?utf-8?B?VG90OGNSbmo3bTVHN1BFYllvLzFpSndLSlVrNllUREYreENIVzg3QVZsRTh5?=
 =?utf-8?B?ZU5POUEveU9idHViVVZTSHBUb2NWUzBtMFJUZXRnNk5ReENKVStNU243OGxu?=
 =?utf-8?B?MEp4MlhBeTF2b3gzN05FczRIVWovL1NqaWlpWVRVOHd4YnUyNFFnUmxJMjFI?=
 =?utf-8?B?NkdQUFZERUZDTFQvOWdWYy9udXFIWnF6dFBIYlA3WWJ1M3BpUnlpa01SeEpJ?=
 =?utf-8?B?YW1xNG5FbXFUNlNERFBnVENMUjl0ZEhPNmp5eGxRSXFaR2FSb0MzNC84ZzdT?=
 =?utf-8?B?VUpkVnRka3E1eDM3cnhnKzlraGMrNHpLZ3J2Zy9YY1NMN0hheHFoMEtLOVMz?=
 =?utf-8?B?cXFLQTkvam8veWxad0p1aEdoWUlsZlRuVUJZVTRsYVlJeko5Sy9BMFhrTEJh?=
 =?utf-8?B?ZnBCcDlsOGtReHJqeG1pWjFGeDFKYmZlQUhjRHFRdnpjZmFSMThQTVFPejla?=
 =?utf-8?Q?3Icc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjRxZHpIcTlGWkpRUW5aT3BQOXMrNXFzaHBZMzd2Wk9oRlFCNlVNK1gxL3E5?=
 =?utf-8?B?OXFpc2tQMHdVOG9YWUw4VVdSdVNQb2lPRGFhR0FxYWtOMThiUDZkNnEzYUlp?=
 =?utf-8?B?VVNEenk4YThzaDJqSkFMN21IL250bjVuQXJqeVY0Sms0QncxZGdwS3NQTEJ4?=
 =?utf-8?B?STkwcWQ2NXVuRHJLdi9VQStRWThuSnlvRzRGeFF0OW9HMnhydW8xVG1XMXpH?=
 =?utf-8?B?ZFFSTUJpdnNXSDNnVXArSVpOeExjTWkwM21sRWU1ZHhwaXY0ZFBDaWFUN0d4?=
 =?utf-8?B?a1FhT2FQTG5yMldWUlRPV0VKbmxUd0FZTHRsU2w3OWR0amtwOGJwRkUrcmFH?=
 =?utf-8?B?eHNjYTZWODRKVy9NRDVNUEFtTExuZ1l2VG5tL0xlQmVnRENJT1hlYTdYckpJ?=
 =?utf-8?B?a1c1cHBISlJrbTZCVmowb0MreWZXRmlaajJkU3VlMjdiOEZYeUJPL0tYRVZV?=
 =?utf-8?B?UEN0R3lRTmNRUmdSOVJGTFpabjVURkZwTkJrT2VSUUlZbC8zM1Q4L0U3SVNm?=
 =?utf-8?B?WEFmYWM4TllMZE5pWlJsMjljSkV2VkJNeUNrbjNkZVk1TFhOMTNFYVpPdVBU?=
 =?utf-8?B?b3ovc0t0UzF5VlMycG5sSkQxVlNPRFl1c3I3czJLbDVKTld4RW16Ym5DSXVa?=
 =?utf-8?B?RC9KYlJaWjNrVWRsUmZ6a2NueExrNWRpUTNmWUF4cEtvR01YNklJaGhDMStv?=
 =?utf-8?B?Y1U0T0h0dHM0V3AxNXRzVkJacVpoRXNSOXhFam93NHVBQXJHZGtsY2RPdUsw?=
 =?utf-8?B?OWlNd3F4S3UrY3plTS95NjZyRmpoK04rc3d2RWdFeGd6ZE1lMGpyZEZ4S01w?=
 =?utf-8?B?NWkrZXBvSzJGRWFGS0tSMG5MbU1hWFFveGhCNFNxRHFrN005VEFNOTNvQ2VM?=
 =?utf-8?B?aG1qOHk4M0ErczBNU0M2M1dxZmFOUEo5V2ZGeUhlU25ZbXF4OEQ2Tjl3WGdO?=
 =?utf-8?B?K3dyVzYyVzFVUUE2cWh6WmZrZnhFNC9FV1VpODIwNEMwQ1F2UkZnUWlsQ3Bm?=
 =?utf-8?B?TERHdkZxOVZ2aDZ5dmY0OHdWRVBlS2hYeW1CMFhXd3AxRmRmQTNyNmVBektC?=
 =?utf-8?B?eE9hZ2dxK3lES1ZPWnZwd0R1d3VLT0l2ajNhZnlQeFM3S0xZT0dCY1hwc0JS?=
 =?utf-8?B?eEcxWWdCb0RuVWlOWG5aVkJGRG55eU8zWXRuS0pSZjZoa0NLRUg2dkU3S0E2?=
 =?utf-8?B?TmcvQXVjUXhybk1VaU53clMyTWdlV2ZBYzZmZXBPYW1LeWVnUGF6aE9UYXlQ?=
 =?utf-8?B?UE00c1MxTXdabTgvaWFORzlLQk5IMVZGVGtaMnhlaHQ4SnVEUHM3dld0UFJB?=
 =?utf-8?B?NjRxMWlodEFtWjVJYXdqWWNNQnlxbTZQNmljcDcxb0txOXdONW5DdHNBbUlR?=
 =?utf-8?B?cGkyV2xkL2FwNmwxV0RSNy9aMGNaUmc0Vm1lbkNpeDIycHRMZnI1bUsvd0Zt?=
 =?utf-8?B?azJCNmVRV0dEd0VlZHkvdm8rK3lQZEpES2ppOXpRWGVFZjEvY0RaTkRwVjcz?=
 =?utf-8?B?NXRhdUNQUStmbzk5VTd0Q0hQbUdQYkFxdlpiaXU1M1B4b3QrY0tweHFtYlRP?=
 =?utf-8?B?MjVIZExGWEg1Q09nQUN5QmNPbkNrSFNtYlV1M21FOERjRGgvSER5eHJxNlhj?=
 =?utf-8?B?VnZOMkMwZ0c1NzB2VHdYbW54NHJUYUNUSTJrUnVlVXBtVGZnb29hUm9tSncz?=
 =?utf-8?B?YzRKRG9kZTVJTFMybnZGZ3R5d24rbGpkcXk0S2M4UXVDSjJyVzRwbjFvaytj?=
 =?utf-8?B?RFlhNHl4a0YrNWxDVCtsUW9uQW11VFNHbzZDNUlMUmpKOEFRZ2ZiSExrUHV3?=
 =?utf-8?B?MjMxS3ZTd2lFODBhQmExWnY5OFNsNFo0Z29wV01UemFJbEpXeWQ4MkxzWVdw?=
 =?utf-8?B?Q0xSdnpzZ3dKK0c0dEVKNEtFcnNJM3hZSGkwSkdsK2ZlbWlMNGdNeUNMUnkw?=
 =?utf-8?B?WXJobVdiTzJzb1dwL0wrWGoxRUl5VjluV3VONlBNWlB5MlB3bXRzay9FTEhy?=
 =?utf-8?B?WXYyVlprOUlBdlduejFTZWQxTG9BYkg1TWc3UCtrTnB3Nm5qM3UwbmFCVmdM?=
 =?utf-8?B?R3kxZkFScmg5STM3eFR2eVo4NGwwMEtBWXlPZm43NEVPcWYrNlg4ZzZiT2Ix?=
 =?utf-8?B?ZVh2V2xySG1ONlhFU1J0SURQaXpCc0ZUalhRMFZ6Uk45cTltZWMwZTEzRVJI?=
 =?utf-8?B?UjNDdnVKMU9LM3dqZkxhNW01dTV6K3o4SjNPY1VIeE1haWViM1hMeTd6L0pM?=
 =?utf-8?B?VlFpNDlRcXI4bmZHSEd4SDhrcWo3NWloV0JoZG1nUWVUSVUxNW9tS2U2UjdO?=
 =?utf-8?B?bXA5TElsb1B0ZzhGL2x5NGhUaDZSYzZhM3NiTTUrVXZwR2I0OEJ1Q3U0UHll?=
 =?utf-8?Q?1MVuHJZR9Odt1nfBX5D+UkL9LGRvthAbftwzo/WMuWuye?=
X-MS-Exchange-AntiSpam-MessageData-1: WAyBrWlUzMnQrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603fdd0c-798f-45ef-5c4e-08de708eb0fc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:45:29.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95emtgM2Zyum7o/VFJ7/5G/B4w6Fv2DWV/cJWlpX/5ACfEu3+xyHFm3CWwoAITE6CfHO/6x2+xn+5IHJazmNfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921

On Fri Feb 20, 2026 at 5:18 PM JST, Alice Ryhl wrote:
> On Fri, Feb 20, 2026 at 03:38:46PM +0900, Alexandre Courbot wrote:
>> On Mon Feb 16, 2026 at 7:52 PM JST, Alexandre Courbot wrote:
>> > On Mon Feb 16, 2026 at 7:35 PM JST, Alice Ryhl wrote:
>> >> On Mon, Feb 16, 2026 at 06:36:29PM +0900, Alexandre Courbot wrote:
>> >>> On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
>> >>> > On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
>> >>> >> I/O accesses are defined by the following properties:
>> >>> >>=20
>> >>> >> - For reads, a start address, a width, and a type to interpret th=
e read
>> >>> >>   value as,
>> >>> >> - For writes, the same as above, and a value to write.
>> >>> >>=20
>> >>> >> Introduce the `IoRef` trait, which allows implementing types to s=
pecify
>> >>> >> the address a type expects to be accessed at, as well as the widt=
h of
>> >>> >> the access, and the user-facing type used to perform the access.
>> >>> >>=20
>> >>> >> This allows read operations to be made generic with the `read` me=
thod
>> >>> >> over an `IoRef` argument.
>> >>> >>=20
>> >>> >> Write operations need a value to write on top of the `IoRef`: ful=
fill
>> >>> >> that purpose with the `IoWrite`, which is the combination of an `=
IoRef`
>> >>> >> and a value of the type it expects. This allows write operations =
to be
>> >>> >> made generic with the `write` method over a single `IoWrite` argu=
ment.
>> >>> >>=20
>> >>> >> The main purpose of these new entities is to allow register types=
 to be
>> >>> >> written using these generic `read` and `write` methods of `Io`.
>> >>> >>=20
>> >>> >> Co-developed-by: Gary Guo <gary@garyguo.net>
>> >>> >> Signed-off-by: Gary Guo <gary@garyguo.net>
>> >>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >>> >> ---
>> >>> >>  rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
>> >>> >>  1 file changed, 243 insertions(+)
>> >>> >>=20
>> >>> >> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> >>> >> index b150743ffa4f..6da8593f7858 100644
>> >>> >> --- a/rust/kernel/io.rs
>> >>> >> +++ b/rust/kernel/io.rs
>> >>> >> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
>> >>> >>      unsafe fn io_write(&self, value: T, address: usize);
>> >>> >>  }
>> >>> >> =20
>> >>> >> +/// Reference to an I/O location, describing the offset, width, =
and return type of an access.
>> >>> >
>> >>> > In the next patch you implement this for usize, but here you say i=
t's a
>> >>> > reference to an I/O location. I'm pretty sure usize is not a refer=
ence
>> >>> > to an I/O location.
>> >>>=20
>> >>> Methods like `read_u8` use a `usize` to reference the location we wa=
nt
>> >>> to read, so aren't they in that context?
>> >>
>> >> Oh .. I wouldn't use the word "reference" like that. How about "index=
"
>> >> instead?
>> >
>> > "index" looks more accurate indeed for something that is not a pointer
>> > type.
>>=20
>> Actually this creates a bit of confusion in `register.rs`, where we have
>> arrays of registers, which `RegisterArrayRef` was built using the index
>> of a particular register within that array. If we rename `IoRef` to
>> `IoIndex` and transitively `RegisterArrayRef` to `RegisterArrayIndex`,
>> we now have an index that takes an index...
>>=20
>> Besides `IoRef` is more than just an index - it is also an access width,
>> and a type to convert that access from/to. Would `IoSpec` and
>> `specification` be acceptable?
>
> Not using "index" make sense to me, but I don't really understand how
> "spec" fits in either. How about "place" or "location"?

Well it's a specification of how to access an I/O area... kind of.

"Location" sounds good too, and abbreviates nicely to "Loc", let me see
how that looks in practice.
