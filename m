Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46713FEE;
	Mon,  1 Dec 2025 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764560262; cv=fail; b=l51ZfXPSWjKkdTqNJ9anorWVYEWuU52NcZEqlbGt+uXQuiGyXVRpwGgl4mZr3vKhOTHJ6Wo6FC8yrOpdqioeB9hpCJlpGQKeASH6m+TSEVaJVqa5DvYGpDwKm6Vn3LSIFUL3c4RMEMARd0Irjgnys2SLksRnRlsPAHfsYvlCG1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764560262; c=relaxed/simple;
	bh=nd0UwOJOnyDoKZxt7raxlifhOHECIRwOo8nIWPlygP8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fRs3WAEV9w458q0fv4yAWZUeBj306i0iNFX1DG4EOzLI5w7PyRv1S+cVTZexf6Yj6Fh1EOt+0Ntwl5Y+TGK6DvdMEcxMSp7ZgwFvJD7S5PR/uGkRkt93ZO4ZbtIlhrcoUet7e3kTHSawzId/XmKBaur3BGQFM9LS3rSTYFOmLF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SWn2zXXW; arc=fail smtp.client-ip=40.107.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SWn2zXXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuXYlmTVgnWd9H/Ibz28f2u7Y75Uk4DzWxZ9vAhKFpwZx0MNhtCusd00dECE26r0zztuOfDbQFtSY3HwH3qhrUpZaZaLz6IHRgTymPgE4+1QEpc3HEAiPipwwOmThPNY8832qXWT5KXYZ/mMa9r9BAQeiUNtvprtuWwN6p18VZL+WXhEIpTTwvU6Z41Hn+SpF2O+VgGBWLY5E/lU2SPLqUzkemCpGrGKUXo3tqBlb7u2mxCd6FaQlahKrIRH1Q/H4nfCI8JLre0SxaS5ky7cNUY4sFGfTtdHIu5L3n0GSTK4/58cn6pHrJjvMcQPHwO6VfaJ4R1ON3Y64WlfkMRRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd0UwOJOnyDoKZxt7raxlifhOHECIRwOo8nIWPlygP8=;
 b=JT/ZEQenujGZYMQiwDpHOtrtjR9OeU9RGmlz5ZHh75UAPGDza3dNEHJ7Blf4kFznUrkhyQHKclFH7WagneIhexE1KHZYJnL7rd6HOf65t61SQFY6nbyfVQcS5ebodFbHH31c+PbuL1r1h895WmFAX+rwbOltJMSMLyPQjUkZjy11NcXxsyqYrqlr5L/D0Hv/6gveBQeaGfcG8BcNg9AyzeJzJa3Z3Haq8xODNFJp0y4DE6JJquoVVP0+dxjSp2H7LriBOrzH77SPEwUGuIt5EguxN5X7pt1vkTvMP0Y1oRgybHOj8+12ccZqUDaqbt76wcZySuZmaKJ6eG43YYmh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd0UwOJOnyDoKZxt7raxlifhOHECIRwOo8nIWPlygP8=;
 b=SWn2zXXWSl42867yJDVNQkP/MOwQfyMAp/LxxuBpjeHF1GZ0r1MSZcoO4iMG6Yc+APdc/R3Y2eHI+zYTzdQ/NIDCmWnWwf62unjN+SBT0iTzFyXFpqpCmarNrglRhYcmVrK/AQGo55sMxU2+9ocKO0N0+8fljngPs2fjIMOF8r44jKp1GzCMJJqV+A3NWrQ8Pxcf1IVBeygY+egKDuG9kRtROODFX83xvd9miyg5DBN/HK3ynfxROPM0hz0+b8LR2aze32tTp8cMqFGsUUW1OXw2ogYso4/kPB7xUhTvZNWH9q909EYUqwJZmTwL/YM9POYkTClWEAwIz1A9yetnVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:37:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:37:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 12:37:27 +0900
Message-Id: <DEMKEIY16GSM.39EIVLU1ZW5WO@nvidia.com>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: miscdevice: use `pin_init::zeroed()` for C
 type initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Atharv Dubey" <atharvd440@gmail.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251129121513.20738-1-atharvd440@gmail.com>
In-Reply-To: <20251129121513.20738-1-atharvd440@gmail.com>
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: a75d9bde-30a6-4856-dee2-08de308af556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGduVjhTVk50TEs1QXB6bWsxRFhtRWpMK3JBNmpqN1QrVVhlQ2RaUS9hdXB1?=
 =?utf-8?B?V2NPNy82aXdjUER6QnBsY2pjWUlYYWlGUFNxRTlYWGMyTWkvd25FaGxPT1NW?=
 =?utf-8?B?U2p2YzRxSk0yMzMzTzA5a2pGdTBZU0xQOWZ3UkZpdW4reUgya2JheTZ6Z3B4?=
 =?utf-8?B?dUFkNytrZTRCMVh5SmI4QWViWndGQ2Uza3E3RE5sUURyNUFXcWhPWU9zRWFG?=
 =?utf-8?B?T3ppVG93R3hNZXV2RkhWZGdtZlJ0MzM1UytJaDhTZDIwVWlobEYvaElzb0sx?=
 =?utf-8?B?M3RuakNpNHBucGxmQjZScnQ4bVJDSmVQVzMvcUNsL2JxdTB2dHhJMitQdnN5?=
 =?utf-8?B?ekxDbUhwcms3U2cyaDR6VkEzSHBQZitJU0Ntc1BUT011ME0reVBjOUdKRzZy?=
 =?utf-8?B?QmNBYnpTbHFqeC9hSUE5YlY3Uyt6UW9jT3dBSnZqaUtkL1VJbHZsUzBzZy90?=
 =?utf-8?B?YkNlWkk4aGMybFduNGlIdVc1bFRrMDR1SG5DNzRTQ3oyQ0xZRmJUREdGS3NU?=
 =?utf-8?B?YlRUYWVaeFI1UXJTNm9ZckZTSERqMkJmMkVzTTB5bjhHcXpjTUxuR0MrOTVV?=
 =?utf-8?B?T1RtckNXUnJqVHJ4OWgwQXlkV2xIdkdwU2ZDTng5T3ZJWmZTYWxTMEhVTTlz?=
 =?utf-8?B?dFJDa1dDTHVERG5vRXZWZ0Z1N3hMNlYwcHJ0NWc4Z29mUVZDVXdqMXMwaUlx?=
 =?utf-8?B?RVpWcXE3a0FNT3FkRWVZWUZneU5tR0x0VUFvRVFLTFd1a3YzMzNrT1dPSWtL?=
 =?utf-8?B?OGJ6UXE5a2YzV2tNYWFFTE5RSWtLOFVFK1BPVjh3SytkbUZMN0syMXJaQXcx?=
 =?utf-8?B?M1I2TFlFRTFiVDVRNUI5QUhmelNPcExDVU4xNTB1SW5WNStpTGluV014d3ls?=
 =?utf-8?B?UjRhUVZ1YVBPY1BFTTZqRS96ZS8xbUF5VjRyVkFRV0xEcEtzbmpqcXNpV0g5?=
 =?utf-8?B?dkszb2xlNWUyQ3h5YUthK0ZhR2JDYjBscjk5WUFrOEl6am1VcnhHeW9FL3A0?=
 =?utf-8?B?NU5zSWxwc2xvSXlVNTFCWjJrL3F6U3B2eVd2eEhzRWR4cmxvWkpyVFByaG1p?=
 =?utf-8?B?WHFYbnhnOXJqempkRUFxb2tZazBXQjhuUmdZZkF0T1VDalFIQW1KcE9LMFla?=
 =?utf-8?B?ZE1SQ1VXMGNRMHZoQkp4MmZ4cmhqaWJkZW8wZDNIcXdFM1dhQXVGVHlSMjNN?=
 =?utf-8?B?eUQvY3A5TmVEU1Q5U0I4WVZ5RG1mOXFIZjZmMzVEaEVvQk5YVEtnVjRNalpK?=
 =?utf-8?B?UkpjUjV2ZkY4elIwWWxIZTdmT3BnVi94dm53UWtZNGJNREtyZFZFRFEyQkRS?=
 =?utf-8?B?UkRKYzlmOW9zc1hsYjBzZlVTMWtBeTRxYXY5V3FkcURkMFQwQ1pyNElCNUVD?=
 =?utf-8?B?c2VBS1ltMWRUaFNiVUxVVlMwNlRjTVRzdkpwcG9mZVhsRVA1U1dreHpkYUlk?=
 =?utf-8?B?NnY4akIrbkZ4a0xCS242aVFYR2VCVVdQWjNxYlFMOFhmR1JBaGtTNktJdHJa?=
 =?utf-8?B?SWpmZDV0SGxhUFc3akc1dTNjekxqQ0REQmhNZEtwcC9OWUYybWZFRW5IeUNp?=
 =?utf-8?B?ZjVwVEhHcXZ6NlN1Z1l6aC85WW0wTzJNaSt2a3dsSU9jdGdwVGo0eXR2VGU1?=
 =?utf-8?B?ZUlnaVY5T0thN21xS2xHZGduSm91Z2k3Qkc5ZG92SEtzTWQvaDJFdHpLSkJn?=
 =?utf-8?B?L1h0Zk9GY2Iwb1hHZ0kyN1JhampYRkp5NTh5dDBNZ05IZDJxRzd6WllaOU96?=
 =?utf-8?B?WG16ZHhBdk9PUEREZnllR2luVitvWUE1RHEzQWcxdTRPU1ExOHk3L1VGK2gx?=
 =?utf-8?B?VXhZK0RoOW9mME9rS2lzTmFXd0xWc0xBeEhhaldZczFmcEhFbmtTMllZdU9J?=
 =?utf-8?B?SDhQN1pYQXM3VnFFaE9IV3lsbVJTWW1kbDcwZDd6cTBoaFZmdzRnd2pEaytN?=
 =?utf-8?B?YXhIOUdCd3hraEtXNmtpYWtINVlzL1BWaU1tNWEvZDY4NzM0V3lnODNXd2x5?=
 =?utf-8?B?UTVINW9rb3RnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ujl1S3ZHUDI1WjZydEZyMjVvUmJkRWM5SzB5S01jdXFIYTNuY0dkcHVZTk9Z?=
 =?utf-8?B?TUZZczBWTE9BZzRHd3ZiTnkvRjIwT25SK1UvU1c3YW8yUGNvZENxN0ZyL0Jx?=
 =?utf-8?B?TTBHNmMrTTB6c1pRdEhpK2dpTS9JMTZ4OU83Yi9uTUdYWTcvTmlRdk5nUEpU?=
 =?utf-8?B?UVZUUFIwSllzdytCOWRiWDlkczNNNmdyRTBkRHBDeWdLbWtwa3NBM1JWTGc5?=
 =?utf-8?B?bTJEYVlIN0t4TWpCQjlZeG1vZ2Rsa2JzZGF1eitCb3lNb3hIVTRjK3lTY2ht?=
 =?utf-8?B?NFB4WkRQbG41SHc4bDdUYW03NTJ2allhaGluT1NFSUZoeU55bFIrUGxjM1Na?=
 =?utf-8?B?SjM1aitVUHowOXdBbjhYaUVIL2RJVlZDSTR2dGRjVXhxUzgrYm94K0FWYUlv?=
 =?utf-8?B?czZkOEdVNzVQZjFWN3B6MWNRZGZOdlZBeGFrR1lVZmlNM0FJY1oxeVlIaFlE?=
 =?utf-8?B?NEFRYk5rcW4zSDZVZHI1bFV2VmEvUjBWY0FNUHFaL0VHenpCYVJZdlUvNXMx?=
 =?utf-8?B?ZURoU3NUNWdZbEtxRkpMRUt0WVpIaWpKdW5MZDNsb004a1pRdHlWZ1Jyai9m?=
 =?utf-8?B?cmxLZzJoYkVNaGd4YTVtT0drNWNZcjBYaDA4c0gzbGQzWjg1dkxETTRjeFBT?=
 =?utf-8?B?VlErUWkxRjJ6Ykd1d0dLTi9mdVBZUU81SjBLUWtFelh4WS9SYWp1Y29EUWpv?=
 =?utf-8?B?TTI5emJMYW9xbTk1c3FpTStEUmZ3emNaeFBUU1VxWFk3UmYwT25JU0REWnZh?=
 =?utf-8?B?WUZUSE9YTEZhNEZBOWRLcHF3MGRNWXBwRjN0RGJOaHhtUEl0SncrOHBHQ3RL?=
 =?utf-8?B?NTg5R2hPQ0F0NzBWVy9OaXZQc1NkaitGbmEyNWdib0Z0TXR6a2tWcHpvY1g3?=
 =?utf-8?B?RWtxR01taDBmc253K0FKYmpHcWdEUC9Zc1Aza203OW8vamR0YmcrNVdLLzVu?=
 =?utf-8?B?cUduWllXRkZkUDQxbDNjcFQxVlZsM2RBSTVvNmtoanc3VlJrN3k1M29XeW9D?=
 =?utf-8?B?S1FoeW1LTGNvenorREFHVytyRDhsTE5IaGFIcVhWMjZCVysxaVJPcG5FY09a?=
 =?utf-8?B?OStBRHRPSzdJY3dycUpHSHR2V29oMUZGdDlRQUJ6MlhVSk1SOXEwZU51QVRu?=
 =?utf-8?B?cXNlRVRadWZPa011MkVpaUlERkRCdEFETlk3d25wcytxRWJmdDNxSnYxRXVz?=
 =?utf-8?B?bWttNlc2NXVJa1NPeDNvaFNJQ1VkK1pLQ1R6KzZpU2RZMWkyVDhtNTlXY3lz?=
 =?utf-8?B?V3pDV1dzTVh2cjZrdVdFRWR0K3VQbFRldGxVRmxlU0FLL2dqUHhQUStTbmVv?=
 =?utf-8?B?VTRtb3I4OURGbERURGhwejZYUXM3OEs3ZDV6SFV0OFhQOHp5V1JGZDFKZDY4?=
 =?utf-8?B?ajlyRkYwRHBoajRpVGxLN21LOExvUm8rWlMxdUF5RXZEOGtQNmF0R3FMaVll?=
 =?utf-8?B?VUYzUWtqQkNVQjdEMG5qaDVNOEtWdHBQWHQrQ0hRdGZZKzhyaHRCSlBiYnEv?=
 =?utf-8?B?YTYvdGJpNWQyZHVtaWVLQ2ZtVkdlZFJnOEdNVXdnaVdSWG1ZTEN3c2prS0Ir?=
 =?utf-8?B?VGdsRWlNYTFIUGJkUU9JaUxtb0JCMlRZWmJoOEViMEYxSVV5ZDYyOWNOdDhz?=
 =?utf-8?B?dHVqN2Nvenl1NVp0N1AxWThNWHVxWXVuT0xBd0p4M2k4N3Jld0RiTnB1MXZ0?=
 =?utf-8?B?bGYxblNsbll0WURaNy8vL0JjalBzSUFsNGlsaTB2VmNKcytoV3dUdUxac3FZ?=
 =?utf-8?B?U1QzeGRHVDNFQjQ0bkZrK2NPcTJvdWpXLzgzOXdSKzRSV2hhMGlwK3BEcVVR?=
 =?utf-8?B?d0R2ZnpEOU1UMG50cGZHS0NseThhMjg4NExOVDlhV2xBNmM2RnRVSGVDdTdH?=
 =?utf-8?B?Q2ZmVE1hQTJlS0R3S285S094VGlKRzRGS2VzQlBZTnJtb1B6SU1hUU1jK3VC?=
 =?utf-8?B?YzVNMk5LMHNxTU5YMG9Xc3pnTzgyVVQ4YmpRTDY3VGc5bHE4RnlpK3l3Slpz?=
 =?utf-8?B?WWtxZG1kVmgzV1RacVc1WkdnMWd0emo4T1JGb1FUdFROT0NVVmN4bEVidkx5?=
 =?utf-8?B?aVlXTVFXaW94TkhaN3lNc0dzRlZvdTRnNUJRMzA5akpkRTlvd2dzWlI0Z0lN?=
 =?utf-8?B?d1pabFNmR0JiMS9BS0R4bkhtVkF2QWtlSFJIWkxlQjNIek53cEUwUThldlZi?=
 =?utf-8?Q?5ImoIuq0VlW/tO8v/V6C1bggRf04YtFOjA+M2NfpKM1I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75d9bde-30a6-4856-dee2-08de308af556
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 03:37:31.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ui4+KRYPqfC9EqsL6IfNu/gb+lhE9mylyicDh5rkSNLKMviUt04+O/QxQ2xey4sKYRTTP4xcyW8JwQ1+5tA4VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

On Sat Nov 29, 2025 at 9:15 PM JST, Atharv Dubey wrote:
> Replace manual zero-initialization using
> `MaybeUninit::zeroed().assume_init()` with `pin_init::zeroed()`.
> The `pin_init` helper provides a safer and clearer API for
> zero-initializing C structs without requiring an `unsafe` block.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

