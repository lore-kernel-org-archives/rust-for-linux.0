Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0F282EB;
	Sat, 22 Nov 2025 04:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763784105; cv=fail; b=JJCC07SD3o0UBMeLUvzUnLsE6by14EHKgbDSZr+xUX3tNtOl+Vo97uVqvaGNaGaxIM6afVAYJPFJvrAFVc/nxlNUnu6J5ViGmKbqvk9iSE0JsbCADavI2tv9aVyVwWbI41gPEBmxipc1KzYepgYeFAOIveadIv4rEGYsNnj6yII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763784105; c=relaxed/simple;
	bh=wwppFNo0MLCL+JUxyhfEzhBqf3/fJcvaX8bfHjuNNwU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=pnn45jd1fHJz9aNoj8J8FVyWTNhXTnJS/i9CUxl+0Zo+hqToy1h8GMYWNtbpoBH1ENAQF3yzbMrsXPHtmO6heiku4d7nqm1L4HtAv7aR/IGmTij8u4OnxpeR32ghpioLcwTRvAUXaP57Aa7pFZiDBqPnasaQfCv9zFcMYn+gpdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=goAk6wut; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="goAk6wut"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGUU6ZE1HHiKVzVK1fC/i7ectt5ILPfD1ufWow9Dvyhnh20oR6Co3fIKXD+vVCRRXoqMzVW/+uKX6kXaNmgPKIsFewE2th1BzjRtCOa/303A4uFCcleeFqC6Ucx6HiN3D59Ba5IX4OCVmQDGss9bjkSQLTSsbWlKwVBD0i+Lu5VffZPRoPobKo2XARgghxam7EkJrhtGHE4nxHp701ts9MUchdS8HtAPXXD1jbeAzfBhE21Ne1DeBXM5G8hVuwAli9eDvnK0o+CluNfQhxsohnWNFU3HC4fHLX30hDCJ5X991MrpPFPd/kAwWOWBDO+EQU7peijcDDISA0I1x/jzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5WfGw4gl+WSNkxmpj3lc36rKVnqVbIhkiq7GrgVMBY=;
 b=At1cPORMzsKcYG+vysm2UVuMW30OgsSLq4wuoVQrezGSvxvdrXQg8eW/9ETkfMYC2QxlBJ+6lSXSlj7wQDHZrjPVjHGijuxE45RPKCODC2xMzqQ+x5cqPdtPF+Sa5dgwCeZaxbSc1jreO8RsvqVq8wylTxXIURLLUE/eSBJNWvosdh8/4Vnm3eKBNkZz/EyCOJjKQdCfVEdDyC+b8HNH0KueS9x+4XFx4XYUkBOuzvkCxy1/PTr0Q9fErErRGbyFrI6pcLD7p0JoRoSIMblr+ChcCiTDOnEYK+JigZGX1djpYroSuTo8G5lOJ8MSLAs4BlyhsPNBdSvyshls/mY83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5WfGw4gl+WSNkxmpj3lc36rKVnqVbIhkiq7GrgVMBY=;
 b=goAk6wut9T2g2SPx8M05lehLXPOHB//N08cwtoCrEMebdBvemL5ogdKMbR+no4Iqpvgq6ahksDTqIoQAeFxHY84EFQXPHkWDoX1aRchYIgL4cK+QCR+Spcf/WSkUWFGjVEt1pOqcHm4NFvCJD1d88tUMjLdR/+OR+Amam1az+N/VnqfilNhjfaqisZUyo6Y402Ex5vOIOCym7tTu9LeJ4od64xDeEcE/FAMd4uPno+GGo/M/h3smkEztva21XSDQr5Wh1lEtE82T7gN09f3dJc2wuzR6PlVRKYAie/Mo/KZ3uyZggmaXktxc8Tr3/49/XjY+hrwQU9AovYuXzwJeHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB9004.namprd12.prod.outlook.com (2603:10b6:806:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 04:01:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 04:01:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 22 Nov 2025 13:00:49 +0900
Subject: [PATCH] rust: num: bounded: Always inline fits_within and
 from_expr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-bounded_ints_fix-v1-1-1e07589d4955@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAHE1IWkC/x2M0QpAQBQFf0X32Za9tav8iiTswX1Z2kVK/t3N4
 0zNPJSRBJma4qGES7JsUcGWBU3rEBcYCcrEFTtrmc24nTEg9BKP3M9yGwbXfsYEPzrSbE9Q/S/
 b7n0/VS8UU2IAAAA=
X-Change-ID: 20251122-bounded_ints_fix-2e276fece6b5
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB9004:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e21330-f380-41be-bb78-08de297bd703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlJHcU1UaWI2dGV0M055M2RydjdOSng4SGh2VWpzcEFvUEo5RTVNZnJGRmlO?=
 =?utf-8?B?S0pHZXVIMTg3V3VubklhU1lOSm9qK2RmYXN1VU1meEVpY0V1YXFBSitzdVZ0?=
 =?utf-8?B?ODhieVh4TnhGYjlpL3Y0c2lCdEpEVzBGS1QrZ0NhemdjZXJFcml0ODhEdWk4?=
 =?utf-8?B?TXFOSXFWZmFUVEs5SlpIcTZwd01kZnRsZjM0SGVKbUhFQWJtSURGOHdmc2tu?=
 =?utf-8?B?ekpOSlkwQXJiUGVjOU52a0ZpVU5GTmkzV1BYTy8wbHlzWjVJYXlKSUE2TWta?=
 =?utf-8?B?dDFhNDNCSlNEVEZUbDY1dllibkd1cWI4NzRWMWtVd2U2M3o5K3VlaTEyOUwr?=
 =?utf-8?B?UTVQVmhpdWgycXRkY0FjNldzYmM3VlczN0JiY3RmcHZOeEQ1TjVGVVZOWFlB?=
 =?utf-8?B?dCtGemF6WmRubW5WUkpjblFBdEFwVDBzZmlDd2V3RTBVakw3dStQNU5vZzlC?=
 =?utf-8?B?cm9oWG4yMWMvV05HanlyTU5xQjFYSTBlZVlsalFCNG5XK3Rra0U1YzBwWDFt?=
 =?utf-8?B?VE5ibVErdVhheDg3c0w3WldXUE5hNWtjOWlSMTZVTG1DNGdTa0xhTVhSREFS?=
 =?utf-8?B?ZDMzSHd2eDdKa1JOQUU0SDU2Yk5WN2RxQXdxRkNWb2N0eVE1SDBraDBVS3hx?=
 =?utf-8?B?SGRreHlEdVRKVTVSdHpqd25McVZOTC83YUFUc0hOUnB2NTYxWEZhWm8zZ0c3?=
 =?utf-8?B?WCtUVzlkdUhHYm1IL0QvdW9LMzV3TjM5Z1RvWXpneVdiMzZHL0IwSWhmRTNT?=
 =?utf-8?B?UytaN242bmJCYXQvWjZwalc4RUlvQUxmakc0ZTNnVHgrMUtPYll6ZkRzRk5p?=
 =?utf-8?B?N1FHeWRHTWkyNmcyMy9YOHp1N21LMHZnVVFUbVNKU2ZrSUE2MlNiaVFERThM?=
 =?utf-8?B?dk8zNWthcksvUVJEYWZmU1ppUUwzMmdVeDRmQVk1WE9TVWVzSWtBc2pUSHZF?=
 =?utf-8?B?TS9Ta05XWHplMjYzYlVib0ErY3V0MEZYSVFITlNpYlVYZDE3TzQzYTJsNXBC?=
 =?utf-8?B?WGIzbXFkNVJ5RVFmM0pOZ1doZDNRQlgzdWd4WjhPWTBMT3lheE04V3QySUdC?=
 =?utf-8?B?aXlmYWJoa2gwTldZckRTajZsODFiTlVuMEt1SFVYSVVCSWJ3TlIxWWVGNWhK?=
 =?utf-8?B?T1M5TUJvd2RGRzBpWXNUd2h1UVZDRkxBaEdhOXl4Z1JhZ1pzdzdRYXNEVU1L?=
 =?utf-8?B?Sk9LUmRHdjV3UFEvS0FxTHloNlVZV2NadXVBb0tEZmpRTm9uMG4vZkVTTUNT?=
 =?utf-8?B?NGl1V3lYY2RDN04yVjYrejdWRDR3RUhWQlF4disyejNZZ1ZBb1I5bGg5NkRD?=
 =?utf-8?B?Q1lheWcxaWZlZzNWQ2lIc09USDZYM2NQRkx2cHZUQkdOSXNsOWxNbC9EOG5W?=
 =?utf-8?B?UWQ2QWdRZGE0WDdVa0hJazBKd1BoT0o1OW50c3FvekxuZVU4aGdrQWxOSDVy?=
 =?utf-8?B?MnhzM0VQcXR0c0Z2L1FvUUJmYkd2WVlwemM0Q0FUeTNFcHYwaWZ1SE1xcjZx?=
 =?utf-8?B?RXI3VzJoYy9pUEtuWXZEenhmTVBTeEN0NEY0VGdyUXEvZGdHRDZCWVZRTEl2?=
 =?utf-8?B?c0RGK1lxb2dTTFlCeDFkblhRU0ZIRkdrS3U3dWtYalViMVZSQ3hGOVh2aEZh?=
 =?utf-8?B?WXlWQ2oyNHJtREI2SVNrZWZkdEJIS1VBYkpoSWY5WlZRNExzd3NzdncxVDFT?=
 =?utf-8?B?dlpVTkkybDJyTDQ3dnRxcDM5bWNVcXlvdDlXRmQ4RlJSSEoyVG5tTGhDcEha?=
 =?utf-8?B?cU52V3BFZ1NVczJMdGhnbE1haWN3anc5YzBrMDQrSG16TnhKZ3Ixa1AwRWVN?=
 =?utf-8?B?aHpPd3NYNlA0K2N2VngvNjQyQmYzeDdzZnplWmtEQkgrNTZrOSt6UXkvNXUr?=
 =?utf-8?B?TlI3Z0JRMDZHellNOHN5MWdCRklNNGZpdm9QcE43bWE4RzRIVWg3S0hUNHdQ?=
 =?utf-8?B?a0RuU1J1L2t0ZmlydGF5WUd4dlhuWnA0MVlIWjhMR0pIMEhseGU3WXFmN0R6?=
 =?utf-8?B?UWxZOWNNU0NNQU03Tm1PMDdGL2hTV2dia1o5UmhVU3F0WTI3RGpTRC9nM3dP?=
 =?utf-8?Q?H1A6Qk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0lmZ0gwYzBGVVZ0TGdpcW9Pbmt5eWFUUmE0cWNZYmxmVThYTkZjQ25OWmd5?=
 =?utf-8?B?OHFyc1R3b2FOanN1dVgxaW1uZFNqNDlPeE5XS2tkUk9jNWpybS9tckhPNXhI?=
 =?utf-8?B?RVBSTGk3TjB4UEphZzNDMXRGNGRUdlRocUNDbDIxUjZhYkpDai94b2lUMUF4?=
 =?utf-8?B?eDJxUDU1K3JBZ09yTHNLVHRZZURzTDRUdTJkYjVnaElBSk9uYVcrczRFRGNG?=
 =?utf-8?B?cSsyNllIVHAybzVwaGJZZlhzanNZL01lUEZ2b3BtQ01UN3RIVGpPbzFlYWxX?=
 =?utf-8?B?T3Z5QzhFb1A4a0w0b1dqMUJkaEx0U0FMTEJVTzJic2ZVUU1WYWFJSm00cnBE?=
 =?utf-8?B?dzBSSW9LUUV2YjZOV25aeURwSzFnOUdQUzlIbVBCMzBMZ2VyV2krbklycVNa?=
 =?utf-8?B?aDcyQUF1dENDb3BYalVoaGFoNDZ3QUVQaDlNNVJaOWhYOFlBRGg1YWttL3FI?=
 =?utf-8?B?dEtiS0dQcmw0ZXp6SHZLMmxPeHpYeDFTQnNtTEhIbS9BUDNYYmM5UHg2WklJ?=
 =?utf-8?B?MVpRUlJNLzFicnd3WEtxbVFNUDBxU0hEYW1uKy82dEZ6Z3pNTlNDcjhBMkNS?=
 =?utf-8?B?ektsUmZobGswSjdMdW1MRnpQQ29xMm8xU1AycTlUZldRRlZXaThiR2g2bE9K?=
 =?utf-8?B?SzErSXQ1SGUxd0RMNXNkV3FtOGd5bm5qMTNJek16U2RvN0h1dWcvVlN4MzJk?=
 =?utf-8?B?UEJoZzFsbjNiWlVrb3JPY1k4eERNRnhJZ05qU1UrTmk4OHBmSk1qWDduVW5F?=
 =?utf-8?B?Mnk2eWErYndEeHJGMFp6aHhML2puSVloY3pVRHFyOXg5WTN2a1lidmFCOGRE?=
 =?utf-8?B?WExqQk50V2VSdjhoS3VhWElNSTFONXNzb0pVTjdHRmFOK2tDeVUwa09ncExU?=
 =?utf-8?B?bVFub3RYZjZlajdrVVJhd0d6dVVvUks1YnR4Sks1Ymxrb1BVcVZZdDVldXpK?=
 =?utf-8?B?SU5MOG5kQ3NQV09BQmxOeEVxTEUwczlwVlk3UzlGeGpNbjhwbG1rYSt2WG1n?=
 =?utf-8?B?Y203RXBUVCs5VkhJaEkrL0pkazBYZ0Z2VGtjR3FOdTJFclpFbWsxajRldENB?=
 =?utf-8?B?RkREZU8wdEhDc2dja1N3alE5NWRQNzJiUzlkd2JTWjJkNm5PVisvUjlOOUt4?=
 =?utf-8?B?eEY4T1FWUTlLZEllMGt3WitqblhnT2ZOTFU1bXE4NVYwMWM4anEwcDJDaWJu?=
 =?utf-8?B?SG5DazFya1ZSbFVaT0JDYmpnVmJyN3JISXFqWEJhQlZLNUNFbUFoeUlwTmdJ?=
 =?utf-8?B?UVFVaUxGaDRlRW44NW8vaVM2OEY2YUNuYUVtRGxNNldBdXJ1WDhjM08rR1ht?=
 =?utf-8?B?QUJPcjUrN0N1VEFhV1NaUC95MTZYT0R2TEVBdmRld1RQYUxVWVZsYTRpK015?=
 =?utf-8?B?SmptVEN5TnZTYktmZ2lrTVIrRUQ2TkE3VWx2dzBSODFPWFFGaXVtSXIxRGxH?=
 =?utf-8?B?cFFLYWJkbGpaRFRCRTAzSGRpZlNpYnFXSkhNT0RYcVNxSVJWTUxyOG9qbGJo?=
 =?utf-8?B?blBwY2hOYjYwUGRzSE9HVkswOXM2NTUralRncWJ1bkIvSnJhY1RpczNYZGc5?=
 =?utf-8?B?Z0piOGFpWWdwVHB6Mkcva3ZUTDlEM1kxb2g4dUNyMkFzQm5DVzJNQTNKYUVt?=
 =?utf-8?B?QVc5dHdPNmZ6VFRic0llUDBQajd0QTZrak5EcmV5UmZBamFkSnl5cFZxYXdY?=
 =?utf-8?B?KzRWdlJJRUNRaWEwM0hZclpaaDd5bDhDeE5CRnlRS2dwWVNQRE4wRCttMDJu?=
 =?utf-8?B?V0hSQ0txUzZRVmVlTjRocHlseWN3REJGcFZBQjhDaUpyb0U5amlsNktGTHVQ?=
 =?utf-8?B?RUdNa3ZOb0tFU20wTDloZDZRQk1QOTc1NnJHUUFsZTlwSktoYUoyQk1PUDJl?=
 =?utf-8?B?dSt3S2RIV0l2WGdibVRLN3ViWDFGejBCMVpRNkkxSU9HT0VVQ2tnMGk0Q1Vu?=
 =?utf-8?B?Nmk5bWJJTXNXbCtpYTMvc0ZoWEhhbUgzSmhSUDNtbyt2UGNpSnFNQ0JlUXZp?=
 =?utf-8?B?bWh1a1BxdjlvcGwzMGFwaFV5YUI1NXUwMkx4Y3FVSkJmVGFwYndGaXFpSzNu?=
 =?utf-8?B?dGh4T3B0S3ljd20va09sTllJdHBFZVMwTGVWVWFPcWN3aEJDOXFPd0F0Um4x?=
 =?utf-8?B?Nis4b2prOXhQZkY4U2Z2L1RUS0kyL1Z1T3BMWU9ZNThtOXN6SGhuandnbjhW?=
 =?utf-8?Q?k5kubwHU4S0WvLgVhjATNKAOTw8YQywo96KmXt5ZeYxR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e21330-f380-41be-bb78-08de297bd703
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 04:01:40.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhJFGBzhRWwIvNbI6AqT2qvSCBH7vnee098vSw4w40rMU0aKAEFLoCYODHXt+dElss2rfjU1VDKLsIzrM5Hgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9004

`from_expr` relies on `build_assert` to infer that the passed expression
fits the type's boundaries at build time. That inference can only be
successful its code (and that of `fits_within`, which performs the
check) is inlined, as a dedicated function would need to work with a
variable and cannot verify that property.

While inlining happens as expected in most cases, it is not guaranteed.
In particular, kernel options that optimize for size like
`CONFIG_CC_OPTIMIZE_FOR_SIZE` can result in `from_expr` not being
inlined.

Add `#[inline(always)]` attributes to both `fits_within` and `from_expr`
to make the compiler inline these functions more aggressively, as it
does not make sense to use them non-inlined anyway.

Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-lkp@intel.com/
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 18e45bf6f84b..92c41b2eb760 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -35,6 +35,7 @@ macro_rules! fits_within {
 }
 
 /// Returns `true` if `value` can be represented with at most `N` bits in a `T`.
+#[inline(always)]
 fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
     fits_within!(value, T, num_bits)
 }
@@ -362,6 +363,7 @@ pub fn try_new(value: T) -> Option<Self> {
     /// assert_eq!(Bounded::<u8, 1>::from_expr(1).get(), 1);
     /// assert_eq!(Bounded::<u16, 8>::from_expr(0xff).get(), 0xff);
     /// ```
+    #[inline(always)]
     pub fn from_expr(expr: T) -> Self {
         crate::build_assert!(
             fits_within(expr, N),

---
base-commit: 494de8f67b1e586b0190eb7f835e97c97f6b81b1
change-id: 20251122-bounded_ints_fix-2e276fece6b5

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

