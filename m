Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011034.outbound.protection.outlook.com [40.93.194.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056813FEE;
	Mon,  1 Dec 2025 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764560147; cv=fail; b=tfTnJ0GsJP3uwnUMglXAv//3DBMJLmbY8++BoQ7MJ50w/MtGlGJKJgjMYLqEt6RKFZ21tBSPC83LVfjxQX7BXSuXmCRhB8AsUCKW4ZA0Ketqzkl/ngkM3LasTBJ2Fw83lmoKtmqxKP1Nt8NteT7geY0dNcnxt2K/u0O7DKie5Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764560147; c=relaxed/simple;
	bh=H696R2n3wlDPYbH24zwdqQIFEiIHv1EFDP3Z5vMDIYQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FdlzGg4Do5kAnep6p16YfLIT+JI3T5FOsQx4ESagDcyQtv5Ac4xrYyuAs82eoUP6Ka7hjvjO3rPEA7f5zXG+io8GDcFsutL4pOVMtPrflV+eZs/kbJLrAKJ534lTjSgTiaaCaP/mXrf04NrAhqf12MkEB2vSh8r5IO/iVkg5m4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZtYJFwwn; arc=fail smtp.client-ip=40.93.194.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZtYJFwwn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xk5Y57rZzfnk5rDDj6bU8ozFxh0867FGNFGI8GhZ0BnSVrST/X5DzKdpGZ5hGxjKRHx3iFnTNHLXUnJVibzYgEk0VVVAn3vyWSS5B8gkX8V3EmEGYg1NmjGHF1ncCRNgR+eOKGxIUAZcDO2Tdz6acHU3QMLbJWr5/Nv4ncduBIqC1T7kTp7ZixmjjrRbbhsHAd3YvMqgix6y6MfBP4KqW8+o8S7stsUjE+6NFwsY04RXd9W0/ofEClgnOlxbNahmw37LWOw28J2Qj3lv+UIr7wOLokAlcYsPQPuyn59PeU1I2N/8a/SA5MjCVC3NpZrB66oWpkHr6eEgHycSl8xI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXtWlzhptyEWJYaNKp94kuq3+V4fpnCHd/ZJ4m4PAeI=;
 b=b83keZKRDqDDZ+FjQ/hMWHT+8oKZxOJPSRZQ85aq1/VxlCQWiaRpSVr2M+iDaqn6KrZALE62eXEz2CxC3pTBqLNFX98Acl8ny82Lf1/DV0jnmvOc7B5l05xEtE6fGrZHiVv4GSla6PmgcH0W4BTePwD/1erQ82+pqxgIqutzE29Y5TpAPWLDG4Q97BNX+iIpFo0ThAzdRYgFp7+d1rw7Aeg0MYiI6wAkZZS8KgAhXh0KPTgyofEMMca+ML7IcLeB8sty6aHVFshrsWj804yRE49aWhoSlrAIBSXm/Ue+IYSDdvadLMc1LeDkhwe8O0ekwxCe4gwaozEmoAo8FPlQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXtWlzhptyEWJYaNKp94kuq3+V4fpnCHd/ZJ4m4PAeI=;
 b=ZtYJFwwnM+2CgJEOqOJadqyRTT77zg4iUXqqqaASKKsLN0QFFL35t0xIGT60oFwhkZqo9s+MBZz1Q5EYTf0UtzMg706KX0tPF3eZBd3PwFTfdhE1wstHrYlsvOlUD/ipcC0BXWEwi7GAuBT65QEc41LVYR/En/CgbkfhI213hai69HD1OdG1xMF/f+ISV86263SMzXCTBvw025gv64qW/jJlpWImF8xLdQsi1MIngsIb/yTbQfftJqmYmvqdEP06fP7sfpbGX/38PmpuAPyqRH86NmzpnVvsSleNuo0ipq3t+hV38kz5gB7TqjepCC1KKwkxFJ7h4jITNq2mcP+2fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:35:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:35:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 12:35:38 +0900
Message-Id: <DEMKD4RZK265.16XHXAU4ORCD@nvidia.com>
Cc: <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for ACPI
 device ID
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Atharv Dubey" <atharvd440@gmail.com>, <gregkh@linuxfoundation.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251129124309.25572-1-atharvd440@gmail.com>
In-Reply-To: <20251129124309.25572-1-atharvd440@gmail.com>
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad871fa-a3ad-4444-f78f-08de308ab40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1FWOUQzWGtsS3VYamZwbTdMaGFRQVMxNThQK2dLV0hwMS96NkNEWmdQU3kx?=
 =?utf-8?B?QjVWR0N2ZHBvVXlJOXh3RmhMSnBiTXBqdm4rMlRabFd6ZjIyeURTRFFtR1Uy?=
 =?utf-8?B?S0ZPVXFwclBRVlU1OWM3ZW1QL0tFcnNINm1scEFKYml1cHh4TFBCdVlIVVl0?=
 =?utf-8?B?bmdzam5sODdqY1RkaitUWFFyVjR1Z0h1aXFULzl5VC82WklMQXZidDU4N2lW?=
 =?utf-8?B?RXdZcjZVbGFSMlFNVzdVeWluVElrY1Q5OVgxVWJyNjVKVk1RQ204cnplOTNG?=
 =?utf-8?B?QWlvdkxmZUduNUZmRVBYY21MM3Y1OWlDRFloVDBjeCtqaFYzN1NMaGg1OEIr?=
 =?utf-8?B?Q0pNYXZXSXM2TFd0MndEZ2haenE4LzlMVkc4ZHNyVnZEcnFSMURodk5FL01W?=
 =?utf-8?B?amRNd3QxMngvMzYzUXFMd2x4bVJtMDFCc3IvM3RWUFVZeG5sNWdCNldWd2J1?=
 =?utf-8?B?Mm5hWko5bEZ4ZGcxMzR1TEUwMUUyWFdOQW8wV1Mxc1F1d2srUk93OEQ5Ykdm?=
 =?utf-8?B?REcrQnZJMmNJc1ZPSmMrQ09PMVZJaGpPWjBYOUpYR0Y1dG5WbWZxODgya0t3?=
 =?utf-8?B?aVc2cEdoazlFTFRqRTdPeHc0aEw1NlpBQ2VHN2NxRW5yZDhSYy8vdkxvK2sw?=
 =?utf-8?B?UVdCUXBka25rcStxMmxTVkV2QjA5TmtxUzNBc0FJZzBIMDdnaHdvYnhHV0hw?=
 =?utf-8?B?OHBvTjQxT1ovekNaRjMyRGVyL01IdUJoem1Hc1ZPb0R0TWk0T1hwMFpJZDAw?=
 =?utf-8?B?cnQyLzZEd0VxcUFZQ01kOHluSndiN0FuV01rWWpJQlAwb2VkWjVaRVdHSUxS?=
 =?utf-8?B?cjhMV2lrRlUybWlqSTVxVkppQWZXbTI5c25Tby8rdkltUDBCNmQ1RHpRc0h6?=
 =?utf-8?B?dWNKdlBBS0tpY3RYVVZzdEM5Y29Ha2ppalA5czJJVk5oU21XUDNWbWRYazVm?=
 =?utf-8?B?bmxUY2lELzhrWGxrZnNxNll3K0krWlh4b0dENjg2eVBpZVlPbjB3TDRDRkkz?=
 =?utf-8?B?dmxnZVYvYVVhVHZMN3lCZEVETU9ZSGZ1OEpuWVJNcnNuc05wcENJYVUvTnJP?=
 =?utf-8?B?dTJvaVhXZ1hvTU4reXVmekJHL1ROV3FoYzduL1RsZXFZbVo3c043NEVuaGIv?=
 =?utf-8?B?T3l5eG02ZnpzMm9zYjhkMGNuQ1RSdVVLajcvQXBSZFB0Sm5nVkpjVXZ4R3lB?=
 =?utf-8?B?M2xjb3dhbCtlVjRmZHZrc0lyQVQ1eHFGcVE2L1psdXRqOGhwam9BUGRDRyto?=
 =?utf-8?B?VXliNnZKa2lIMFNyRUszeEp2VEV6V3ZOcks4OWhFaU1KWFdOdXVuSUtXZVR1?=
 =?utf-8?B?clRsaDI0TFlXUWh2WnAxVjFmQmpjbnpDSmhOTC9BSi9rS2lxbjBlalJnUXFr?=
 =?utf-8?B?aCtBSUJHaFN6QUJpVnpGazF3aG04WWlTYTBnL0sxbjNsaW5DWkJVbWVIRW5z?=
 =?utf-8?B?MWRQY3F5L1BHV2NuWGN1YkJROWUrMEtLa3FNR1pKUndCbEd1REZjMDRuRUpq?=
 =?utf-8?B?dCs0WW5QOGQ2ZStBcnB4NjlmTDZtOWhzVjdCaEJzakx3Q0s4WmU5cmNTNFlh?=
 =?utf-8?B?SHE5R2VSSjBHZm1kTVMzaWIvZWQzeUMrUzhRdDZlVWFIMEVxWDBmVFpINVkz?=
 =?utf-8?B?VFFFaWhKVmRkYVR0UGw4aUhRYUhwakdJWXlSVXJrSlRsa2pzRjliRVRMTVFT?=
 =?utf-8?B?SXkyQkdjRGhWUk5menpHeHpmUVFPd1JmMFNaMkEwVUIwd2czNG1WaHVJNzE2?=
 =?utf-8?B?aDRsbjhKd1k5MFpIMVNRc001Vm5GdElKMmdXMUlTc2dUNFAvTjhHeEFVZG5M?=
 =?utf-8?B?ZU9TNUNhdEx0TkUwZDZ6ai9jRGtUVk53UER5ZGNxTTR6M3BhQ2l5LzVQa2tO?=
 =?utf-8?B?aHNEMFhEZGdBYWx4TW1teTBTZS9HSU9Rbjc3aUhOVzhHNEVwMW1vU2ZaRWI1?=
 =?utf-8?Q?3FiTOnUqI2Hw8N+s+N+J/7fMMrf4j64Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3FvaFEzZ09sZE5wWlhId1gyMGVKWVM2all2Z3UwbTVtYmtETlArVTdaVldN?=
 =?utf-8?B?TENYSGl1amlLbWwxR2FuY3I4QU1wRHJYcnZmRXRyQzlzRGlnRi9oT3ArWi90?=
 =?utf-8?B?clUvbms0cS8vdDJYQWpGd3V0LzhRbW5xVlkyZVk2STNQemhkdlJ5ckplcHIx?=
 =?utf-8?B?S0JYbXBYUXNyYlFzOUswWWtmTnV2SGRVU2JGa1dsZ1ZpTUFjeXFOUEZiVGg3?=
 =?utf-8?B?TUNCTzVrNDNXUlMza28zWFNhbCtISGpPdmlqQis0THNLampVdWhWRHhEVUhh?=
 =?utf-8?B?aXlVZTQ5VHZyV0FKV3RieG9rUWh0QWszN2EyM1MrOGZGQVNUQ2RpSGpYVnJm?=
 =?utf-8?B?bDRZNDc2WFBjYXRldWkvdVB2ejJHczJYZzlHemJ5TEFzLytoT2ZWeEZjUmUy?=
 =?utf-8?B?ME5BQUFORU14ZHNMSDhlZW0yOFl1U2wzaWpMWmhxcHlpL2cyQ1BCYVBSaDAy?=
 =?utf-8?B?UFc1UElXbEhCZ1FETFNDdlpMbEJ4OHZRSjd3Y2NSV2JhV3N4RWZnQytUdUJF?=
 =?utf-8?B?VW1QUkUvY3RnMWEzTG9VMURtQTB4WFhpZGNoejlHZjUzQ0JsM0pZeldJKytK?=
 =?utf-8?B?YXNFL2RtM1JBa2U5blJMZTR5Y2hFMnhFRXcxRkdPVTlYeEVINjkxTTV1NXdh?=
 =?utf-8?B?aS9kdUE5eG9hU3N2bFdHSGdSc2NpNkxDU2ZMT2duWVJVZWV3TkNMYjBndGda?=
 =?utf-8?B?dzVkVjFTV21UMHlETGxrS3FjVW9PUzFIQVY3dHdTNUZlN0RKaG1wNHVtOTlX?=
 =?utf-8?B?M0c0Rkt0enlMUU5ubmtCMU5YSWpKb3psZzB5VDZFNFJ1d2Y4SDQ2RnNqNWhJ?=
 =?utf-8?B?R1dUbm5XakE1Q1p6Q3UrdHc1SVV0VlkzalhsR0lPMC9FdzhLNHNXWldFa1VQ?=
 =?utf-8?B?Tjd5V0IwYURPcWZlazUvcCtmVldIWGlJRmxmc2lZdFQ1Y2VwU0pJNWVYMWxK?=
 =?utf-8?B?dHVKVFN6L3MyODlqZGx2Tjh5SUJMalV5OFAxcWpicUtCR2JVbGthSWIyT2tt?=
 =?utf-8?B?dWxrY0dXc3FxWjAyV1A2U1E4MzdwTnFxNm1KRlJyaE5nV1c2MW9BQzAxNkJX?=
 =?utf-8?B?ZDROcGZqajAwT0MwWncyMW5IMnNvc2FHcTYrS2ozWnRURlBJK3VXWW5mQUw4?=
 =?utf-8?B?NFdQWTk1MW5qRGNSS1BUekp2SUdyRXRmaCtzVkprdDJnZlZhU1NNSGdQOUxo?=
 =?utf-8?B?eTRzZFE2Sng1eUphMm45VFRoRlRXbUlhditXM3NEOVk5N2xYSXVjQk1nUEJW?=
 =?utf-8?B?ck1qazhGamV2K0FsbVdQWCs2ejVwbzJCZklJTUhMaitPSTViOW5LTkhrS1Az?=
 =?utf-8?B?YWFMemIvbVExYTRvakU2OWVpYTVMZXdqVDcyRVRidnlUVTlpSW11SUlKUkpV?=
 =?utf-8?B?WlRlY0xnRjNKcGdaZWtuVzBqVnc1bngzSlFlbDJkbVcvZGlDZlJKYmk1WFQ0?=
 =?utf-8?B?dzhQZnViOEpzWXJNTDY5M3NSdVhiK0pvcGxybXd1Z1pkU0VLSHhXL3RBbFI0?=
 =?utf-8?B?UmhRVzd1bFhaRnI5cDQ3OVRSRy9GeTUrRG94SFhVS0tndVZrTU50YVQ2clp3?=
 =?utf-8?B?UVdpb0JlcFJ5Qkh6c2FodXV0ejE4UEtuVFAyM3ZYYVlwaFg2T2NHMENZamtH?=
 =?utf-8?B?TjNiOVFyazl3OU5mMzBsQWsxc1BRc3BrcmFjbUpFSTBWZEZJelNRanpOS2xp?=
 =?utf-8?B?RXQ1U3I1YVJ0ZTlHbXM3SGVwbGpZNSt1QWFSZ2pkcGNwb0JwclVoWGhCQU12?=
 =?utf-8?B?dDh4TFFiclg2S3BZRlc1MXRMMVFqRUViME8vTFRBM1VIQ25ZSUZqN200bFgx?=
 =?utf-8?B?N2kycndBTytHc3d1STc3Vy9UZGJHVE5vcWRlVHk3SWJBVGxSMnE4c3BmVkhs?=
 =?utf-8?B?VEpDNjBISHVYcWNxUlBpTjVGSWhFTCtCMlBDbnRvbWFSV3pOczc0ZnI2dHh5?=
 =?utf-8?B?dTFaRGMySE1BS29sc0x5RkNtWDZVNDhkTzdwckY2QkVoSm8zMGcvY0lhd1hQ?=
 =?utf-8?B?cG5iaStkWjdPSkUyK1hGYmZvYUpxYThYcXZSNHAwTnVSVkpscVZTTHI4UTBK?=
 =?utf-8?B?RHNsVCt4MksybjN3NFpLakNIbnRIRWJvTzJ0dDBqR3hIZjRMZDFreXZJanhW?=
 =?utf-8?B?ck5SZGM4UWhZY0pydXZMZTVIdUZidlB3S0w3QmlXS1ROeG54c3pMUDlLWCsz?=
 =?utf-8?Q?pbfOu/zWe7W8yVegomtnDfOmsGetV3Y9v5HQ/TS7ks16?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad871fa-a3ad-4444-f78f-08de308ab40e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 03:35:43.0894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fasx/sQpnriJO9j2Ux5BPdPSrH4A1MiDXLRE0l1JtSXjx1wci9zKwQce4CrZztjFv3DhgrpB+4QZ0mP29rQvtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

On Sat Nov 29, 2025 at 9:43 PM JST, Atharv Dubey wrote:
> Replace the previous `unsafe { core::mem::zeroed() }` initialization
> for `bindings::acpi_device_id` with `pin_init::zeroed()`. This removes
> the explicit unsafe block and uses the safer pinned zero-initialization
> helper.
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  rust/kernel/auxiliary.rs | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> index 7a3b0b9c418e..67c5d356d754 100644
> --- a/rust/kernel/auxiliary.rs
> +++ b/rust/kernel/auxiliary.rs
> @@ -108,11 +108,7 @@ pub const fn new(modname: &'static CStr, name: &'sta=
tic CStr) -> Self {
>          let name =3D name.to_bytes_with_nul();
>          let modname =3D modname.to_bytes_with_nul();
> =20
> -        // TODO: Replace with `bindings::auxiliary_device_id::default()`=
 once stabilized for
> -        // `const`.

Same as the other patch, I don't think this change obsoletes this TODO.

