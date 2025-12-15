Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9EB32693A;
	Mon, 15 Dec 2025 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765777764; cv=fail; b=UZd+ZhgCvSu5rSvVYYx+jOP/2RxlF1yZxuBvswMqvULp3fg/3Rx6MA5+nFTjg3mGOrm4J633YlPHmSfz4jqRRfue3e0F1ZAg0imi/OYks7ceUxdsnOpP1o8lc1qdkPFWOunWA6wa6+3tcX/ZImXxAJAlhiKtV3ywsRCQXxfHglM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765777764; c=relaxed/simple;
	bh=uGJtZTSIiEWENP7dUGCXpYAS3btjNXmh8BLvRJzOlyA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hz7kdDmDUgTZnTH/HIKu8uAKqef9e0Qq1oM6GIPcXKvq/nl0AjJURw7hbNeecSlbsD0/IdsedQDpZrL345JJzZ6PHIqjgndMS+gMLzybvlMt6U2EwFb8O9WU+w6qzZlafHVSh8/drChBpS2h5VV160iLLgk8zsH5YW6ALwpdS/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VlQBaOrL; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VlQBaOrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kywCYTrhQ8Lb+HTRiUAYPkgBuijZGaMkhfO2Y1yv4IqgS2voKr3Gw/6TW9C4RLup/smRviTpDdmhmvXKg2dBeruyiVfaG61KGAY/Alsv1SfEQLbK7oVUvksqkajxoBSiFY1eR5Y9t1/zYa+vblVnKYVdcAaipS/IAIW/PbgmmqTVZW8w4fvuxtqWaKpB/0+0f0O2RqFJI02XEbT+YUg9CcVna5gy1bgWHSVIGN7fr9hZF3NjqMnE+AnpugobUsZxHcmKgeKSXMixU5WYjKFDVl5/3BMeNDfgFCOpvzUOOUCzcekCrAz8uf6TWL65fWSijCt0WSXm1SPwYvQSdf+Hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbi32SR0/gTjm/0u9jWVBU+/ssWQq75TUAZqvkyT+Ns=;
 b=JXTJJW5J2+6r4t/dqbCTazDp+mji7H/TYisjDz2ju9r++CV48yAkAR7nDLU4994HMK9MoNXtqb9EW+QDH5bd9NzQr4ZE0R0TOv2s8XFTwJz8Z3I5QNnbbFfyRp9PY+hO94VuCPv+vWxl+0ZxnavZim97sKaKxdzUBmQtFTWel5WrWO6lcJvUO0FIvLsyKTrA+Uwa0T/T7nxSNVrw55rGULq9xq1A2W4PHnFoB0nnmKbQ7I0BCxoS8d0PKHvtAlTzoSvtnxQNiShzUZGlDCtF+WV6yV9F2hLfAbLvgasMBQzhI5XJzIl3rGXCejCfpVHKQwpyXVf3vTVHDGbMSZGqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbi32SR0/gTjm/0u9jWVBU+/ssWQq75TUAZqvkyT+Ns=;
 b=VlQBaOrLGhWWucZwnsdGnzgJAPPtiVUXCvt9BB9w4Ak4EMdgMSn9vssJpRmaGjuk+NocehV43dWPqVJUzaIsJaEB+XJv36l6T+EHtH0TvbgW4isJopPOoeN+611nLHFbXcK83dyr7C5C7O26QZPwA8gYUGqMLseMGU97Re86pPIAbi4eyYSenN+3pL8MJLHhrqWD41jHzwMEG2L2a/2vhA1561uBLdVq3I0k8L5whkWZkwrfY7zTGEYSeoqwzcTN1v+18UCZS5YFllgz59RYTQIPWiX6Hpr/xgYuUKGK1RP0KTolDySZLhCXNzDkXvm+UdW5r1mRz2Zb13TU91kzCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 05:49:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 05:49:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 15 Dec 2025 14:49:09 +0900
Subject: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
In-Reply-To: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0186.jpnprd01.prod.outlook.com (2603:1096:403::16)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 700eefa7-516c-4031-46b4-08de3b9db10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0ZwQ0VPYmZVbkNuL0hsY3J2VEo1UXFtaVlZYlRPeHVUeUdLLzZMQU1JczVt?=
 =?utf-8?B?ejBVajF2S2dLelFtVktOdHBPUmh1dTdWMEVyWUFuRHVWeUVJdEdsaGxnTGQ1?=
 =?utf-8?B?VDEvS016TDlLSGYrUzhYRFdRS2I4MEtoZ2dBZ2tjYTlaOFpmTklubjdyd2Vq?=
 =?utf-8?B?VVliN082Ulh5bS9mdW5qci9JNFUwNW1DUGt0RlpvVGt1TFlYT0NvblAra2Zp?=
 =?utf-8?B?SkFNNU5MTGlBUmNFZE1DallWRFdTT3Vld2krR0c2SlM1MGN5U25KWDB5V3o4?=
 =?utf-8?B?TTh1L3J1dnRmM0ZlaHJqM3E5MDVzZ2N3ME9aK2w1MXg5UEphYi9DdWZvT0Vs?=
 =?utf-8?B?Mlp6ajhXemZGNzFNZFRJN0VGZHFJVUxaV2lvZzR2RHdCOHlLaHpPMzdDdUcx?=
 =?utf-8?B?V3ZhSnRGRWsxVUlCVUtJeC96bUE1VWtOZUJpdGRrRjZHSW9xdXp6elI2ejI4?=
 =?utf-8?B?V3dDVFB5a2JKUTJqb1ZvZkdnMVFqbUU0dVkyNWVsZXJScDM5RHNLV3k0U3ZR?=
 =?utf-8?B?TjMrQ3FheG5NWndpNXJWcG9WWDZSYVR1RmUyYVAzb3lhbCtoMHZmcnFweklh?=
 =?utf-8?B?RVUvWUY1MXJ1TnBDV2QrZUR2Z1gyNFd3anlCeG9ZZDdsTldFajNIK3k3em1L?=
 =?utf-8?B?NmovZVJxRUVXUVlPSGg0T3lxektQV1duNnNrWDNoVi94azAvUGdHM1JmdTZv?=
 =?utf-8?B?STNmaFllMW4yYm1OMHpFckV6Q05PV1crQXlLVUZEQUM4SGFjQW1od0xRU3BQ?=
 =?utf-8?B?Y3BSNWFEYk9NYW9qeUNuR1ZjQ3RLMEw3SWZpbjlqV25STlJLaS9JUGRwTFVq?=
 =?utf-8?B?SFM5M3kzZFZDN3VWZTRZRmpVWHRvaUdKMkM2OFVndTBGY0h3WkhDcmtiM3pW?=
 =?utf-8?B?YUdQY2cxaHg5VHFjRFA3SW1heXlKN0toQnhNT1JXY3RLd0N4WHRtbzNYczdt?=
 =?utf-8?B?NXdoTVpZUmNsZStOV0NoNWFkUEtzcStQZFZocEJzaGRQOTNwd0gxNFBMV3dx?=
 =?utf-8?B?YTBWTWpHWFR6Z3hSODdhd1FTQzRnNFB6YllQRFhkNjFzTGRZSXR4cVZFOXFv?=
 =?utf-8?B?SHZPRDVIRHBQZnFsSmwxRDhUOHQreHFpSkRib0xFaXNJTE8zOTk2QnBEeHBl?=
 =?utf-8?B?cXNNVTllUkxOMHZnTGFaTGR4aDVUNjNiYzVVNjNtUjlSRnF0KzBsNmFXOUph?=
 =?utf-8?B?bW04L0JvdTBNdGFiNkU2Z3ZpZXFRckgwSVNFa3dLL1ZPSTVBY0p6b2JYOFRP?=
 =?utf-8?B?djBSM3Q3SmNRazZiTFQ3RlNFMzVxT2M2LzVyellmSVlSOVgwcHpjbUVPMTN1?=
 =?utf-8?B?b2hGcTMvWGk1Y0hCalp1S05ENTcvVlM1MnNPQS9ONEoxOTlYL0RheTJHWHFT?=
 =?utf-8?B?ajVacUdzRVFZM2Zzd2h4OTE5MG52aVd4c3VFdTZvS2tTUjlHeTNHK0ZjeEJ0?=
 =?utf-8?B?NTNkY3lvZlN5NTFmUHFyd0lac0owRjZrU2oranNYK0tTZEszM1ZLN2FWMmdG?=
 =?utf-8?B?R1lvRE9WZVFaR0JFNEF2bGlDbVVEdUJ2YkxMNDg0RzI0OWRGNG1OUjlTcHFu?=
 =?utf-8?B?NDRlOFJncU1UUGxkMUErbXhDNjdpWE5tdXpsZzNMd21mTUh0Y2ZvVjdhanhT?=
 =?utf-8?B?M0d2TFV5Q296Vy9CTGdjVHZ0OVlJdkMra1piNUliVVZkclFnT2M2YS9DL0dV?=
 =?utf-8?B?NXdzb1NCTExmUko3bWtJcHBDQWxDemVXV3FVb2dEQTFsT2tjaW9VL201NEhp?=
 =?utf-8?B?OVk0Szl3KzVJaTZEN3lZUE5IZEoycjRiNGpFYkVNUjlyTU9hbUVCMWZBMHVm?=
 =?utf-8?B?N1JQZzhHYWNMUVlwRW1VanJKK2dhVzQ1T29OTnlTV0JGQTlvNmtxUVJDcFlH?=
 =?utf-8?B?U3lURktja1JSZ2Z5cWl1NmRUek5udVoxZE5XYzU2M3BnNm5wNGZWWmtTSHQ5?=
 =?utf-8?Q?r26OXIGsFCtJDdjFr1hnQw7DINOmd1tw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUVJYnZRd0owWDVPdmdmZnZRWkk5eG1XUzY4ZVVOVlgwYmt4MjA2THVTZ2JP?=
 =?utf-8?B?c1BRNGtMRFdOWXExL0h5Z3FWbzVQQU5HWkNoSVk1OUY2c0JmUlFxbENVZVRS?=
 =?utf-8?B?anMza0JYclB1dmVJa3ZFNjFpbnlkT1RseFVoM1NiYnByZWQrd01XVmhEQ1Ew?=
 =?utf-8?B?dGV0aE1IUEF3YWZSeTc4WVNtdmJ0azdRYnNVTGdpdDJMcEY4ZXYxL0FzZ3kr?=
 =?utf-8?B?VFp0TERsUDcvN21WWjJTVnlNS3JRTDdhbjAzejZqOEtaV0UwTGthVXFIdXZQ?=
 =?utf-8?B?b2FZYys4aVdqc1h5VVZVVlh1dEEyc29QVjIzSFFJTXg4eEh0UmIwckJVcnZs?=
 =?utf-8?B?U1d5Nm5DTVcyS1A4YXN5VjRBUFdGUXo5MVdBK2ZjS2dHVVUzUEM5SE1NbE9p?=
 =?utf-8?B?ZjJGS09JZ251MXMyZVM2MjF1aVJuY1ZyMWJpeVAyUTZCdjRzdzZGenJRMk96?=
 =?utf-8?B?a2YvTXNkUjE1WFpmK2tla0ZpUzNrQVJwL3JxK2xWUlZDUWpxUnBwMFVhVmJy?=
 =?utf-8?B?aTYzRUZMNWZUV3FFTmlCelBBRjh4UXltZDhSdHBjUE9WSm5pekFIRWJ2OGhD?=
 =?utf-8?B?OVhKYmVYeUNlTFBxMkoxSFJSb1VvdDEvNmVUaGs4S3R0dDYyeG1BNkc0U1Mz?=
 =?utf-8?B?amZ0ZGsrNXVrOVlkcjR5cVg4U1dDV2lkQWtyc1F0TnBjWFphdnNzS0NyOTlj?=
 =?utf-8?B?SzlxZGJqd1cwRGIwUlBFcWJYaDRQV3dEY0Vhdk5xRklqTCtZRmM1VVNTdFlj?=
 =?utf-8?B?UVZXUElWVHBrYVovRVNhV3hUZ0NWWWlkNUNVM0ptdGJqeHJsbEVyb3d0RElZ?=
 =?utf-8?B?U2tWM2JRVGZRdkdlTjk5QThPWDlvWDZNUVZ5NnhjWFZxYStVVGFpWGhudUJs?=
 =?utf-8?B?Q3RNVG9SdlpkWDRkNUNiQWtnZFVMNFBJZi9pN0Jsakc1WlBjRXhMOTJjbGpJ?=
 =?utf-8?B?eEVEa2lJUFliSGZQdlZ0YlhrQTN5LzJlVytVbStha3loMlBrMjRmeE1XQnBG?=
 =?utf-8?B?dUU1ZEtKVC9oTjZLdEhIdC9Tdm5WTFVSaDlXbmFhZnEzMmNkSG5qaFpSV05a?=
 =?utf-8?B?aDVxdVZhMU9KUkhPMUl2OTZXUHEzYUZCN01KdWpLWEpNaWdvWTJBSUlFY240?=
 =?utf-8?B?UVVMcnJDcHVsYnIveEVKZ0JSNG53NWFIeHk2VVRJOXI2ZmtjZ1RvV3lhcFRy?=
 =?utf-8?B?L3lrWEJyaU1jUThmdzYzanE2cUdaUmQ3L3ZhZHM3SXArSTRqQlVkcU9FUHpx?=
 =?utf-8?B?aUFBbHk5emF3SitrcC9IQmNIbTcwdk96aHRjS0lldzYwczgvdzNzaGZGTVhW?=
 =?utf-8?B?aUhEK2NDOHQraTZIRHFyT1NkY3RpbjVtajZUWHhEMHgyMDFidHFONHZjU0VD?=
 =?utf-8?B?ajJOTEk1cWdkRWh5WVhHMnBkVG1QZkNFNDFCWWZkcjBLalAzaHc1bGVuVVBn?=
 =?utf-8?B?V2YxN0N2ZE5BL2gvQ0NFNE9GcUJ3N1h6b1ZDenhOU3FxanVnK0VMcTIzS2dU?=
 =?utf-8?B?SGFSOEN1b2RTcitvOVJCZDFibjJJd29aazJmYVRhQkt5QlBPSjRMTi9qU1RL?=
 =?utf-8?B?ajA4VlZDcFFvMEVrd0pNdHpDK2NmekcrVTU2QzRIeFpkdnRPZ21rcjR3N1BM?=
 =?utf-8?B?K2FJTkVqN1o3bkdSOUplQkdpRnphYjIxVThuQWJmQ2pGUHhvTi9LRWdzeGFo?=
 =?utf-8?B?QlJMV0lmaVltZUNULzNUNUUrcy9kd3ZBVk4xbkwvN1R4NFR3Q2lBMlVadjFx?=
 =?utf-8?B?SkJpV0d0TXRDNVl4bCt2ckdrMHZZbStzUG4zODBiOWFxV2VLMXM3SzhmVTR2?=
 =?utf-8?B?NUZQREdpMjlENEI2blVMZ0duYVpDV0RhZFkrV3dDcXRVemMyNHBHNmtyMkZH?=
 =?utf-8?B?ck5DQkI3a0pORnZ5blJSMGdHeVgxbkRqSUpYaCtCUVhsTkVPNHVzQ3NSSUlU?=
 =?utf-8?B?bVJsVG01cjVaWml4bGZuWXk1UTFUMG52bEp0SjBWMEpEdUM1YWVoVnZ2Qlgx?=
 =?utf-8?B?STQwZDdPaktDVkNTUHYvTkpYZFFYSjFIMURBVm1LSkdqejJ6QVFMYkU2R1ps?=
 =?utf-8?B?V1gyRjlDZ3RvamFiVTRoZFE5SnlTN3pYMGUrVGIzZlJUdkoyZmpVTzhqVXdy?=
 =?utf-8?B?eUtSZ2Q2Rk9OeW16Mzh1SzNTUk1aSms1YnI0NnE5RDY5VEtNcUhVazFPcHVI?=
 =?utf-8?Q?Cel542kGVX9JMPeTnEfs/OskQX97ILQh6ZPK5OlYLCXb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700eefa7-516c-4031-46b4-08de3b9db10e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 05:49:20.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ayzhzztCX2xIDuLCvdGIfKWoFldiX5tvFLTU1Yjn3dJ2QKmhg9KkDQc92wwssaHboPWilRiWmwyk9IJOYtM+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935

This is useful when using types that may or may not be empty in generic
code relying on these traits. It is also safe because technically a
no-op.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/transmute.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index be5dbf3829e2..5711580c9f9b 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -170,6 +170,10 @@ macro_rules! impl_frombytes {
 }
 
 impl_frombytes! {
+    // SAFETY: Inhabited ZSTs only have one possible bit pattern, and these two have no invariant.
+    (),
+    {<T>} core::marker::PhantomData<T>,
+
     // SAFETY: All bit patterns are acceptable values of the types below.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,
@@ -230,6 +234,10 @@ macro_rules! impl_asbytes {
 }
 
 impl_asbytes! {
+    // SAFETY: Inhabited ZSTs only have one possible bit pattern, and these two have no invariant.
+    (),
+    {<T>} core::marker::PhantomData<T>,
+
     // SAFETY: Instances of the following types have no uninitialized portions.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,

-- 
2.52.0

