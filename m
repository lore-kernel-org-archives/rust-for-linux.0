Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC191C5D59;
	Sat, 22 Nov 2025 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773771; cv=fail; b=Ry+6fUccF4X9FcT7JD3Chtg68RboiBrK8JEOgiLb+qhTgvnlT+jwY3Jkc0SD9hZ5faTtu0s+wm1UCa7OPLB2gmYui3li4G65cmmyROO2r5pnV8AzyEPvkhBmKPt3h8Q7hlhofljyxQSHRI1Npw9BHPZ6CPAMs2lNCUKVb62734Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773771; c=relaxed/simple;
	bh=ln83UrQP0o/MLMizkPUtou2W33HB77VEy8EIb2KIdLo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iqV7WGK81tr4iWtZRcAC/FfS+9m6apVr7rn4KrvmkxfiDPwdHXSxtgEFOMUiF1ud0ZTVHYTgBkTpR131vMSUYNlPCcOGG0SAYQWiuxfTgkoFbHrmD/FUK/nOqr1eo5Xs3TLK9EW61FdkmHHioQiaCIBwse9rnwYmcg2e6K1DUps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NM3jnxV+; arc=fail smtp.client-ip=52.101.85.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NM3jnxV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSZPN/3r57aIqEFyNddeQ3AmJvWXuleMLk5XPHV6oxcd7fG7GS1hCHEi5wRRpdvvrO/9qPd2TbGnpPfW+PoWuWwZ98SzY4uMTVvlI5lvZWtnO3mDaLJf7CZJ7XrJvan6XLJwWb29De6i4LMfysRiDT/ljzopktBRsvu4dxCwh+Iyc3McfixQwPU9g4BpSO8jqKqdp5OreBYy7pav7v8Zko+AjOg9Jba5qa1srLb9xY4IvuIRm6Ny6o0EFPAbOax/ZJVXiXZVWV9kT9txbhD8u+qsc8P0HEMuLbH3/YmgWkQc92MO+DOwgNOK7qA1o8NCqREoSfRhPsonXB4xp8HmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dLTrnSJJNojEmo8lAlS6/DkRBOT4zSnneybgfoOiGA=;
 b=hoAHNeo41JM0MfJmBtzyE0B9RxTd7J5diBc2AACXYfkqu+0KOpBDmWe3CrY4Nbrqu+FtO8hMW9mvznNgdC7tXw+6mCMk2A7joGAu+HGcdpluT80AUZfpOwXKuYA4xDhPhCdT2KE/ccbTmBHW/zFVg+jh2lN4fZ+I8G4nKGvrUfCTZGkifZLNpHYeDlfJgCI2TUUOQxj0HjGsuAlSamrt0MxJxAnQEIPAbXvXA5hQlKjEAs0ewRlyIzo2yjITsHzYj7iuirYS3IAe4tkLikcEykmeWrVLNZAYxkNsBsIz816c2mtZPkvG5pWkvNShc5ZQk1HMZ1Qz1+QeyDVTyS1Oig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dLTrnSJJNojEmo8lAlS6/DkRBOT4zSnneybgfoOiGA=;
 b=NM3jnxV+iPfZgosT8SHHJYPfjZ8Igj8sOnywYhWn6IHv8YyMJwKNMjRoEcmA6/gDN7oREyQw1cvCpByFRnO9BMRUTnjSWCc93sAz2c09XExwRmGe4d20GaP9it9fgnxh04zOVSjjapWD2HqVwkSsJpB/EXabc7ZxwKr2JvNhTFmEq/hoseXhxATa5yYf7Osa0GfetXBWzdaG2moYeqhcibGVYhQuxd5I/mDDSJrU87fiJpUoexjUKnhIlzjscZwFG/k0FXVw8Qmv7FImvzLofjgDyD2zhBuOxASAVQyYeB8hdunbvWD3wp82fdiwS60CpIPSuTulN4FAQWlGCIz5GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 01:09:27 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%4]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 01:09:27 +0000
Message-ID: <49d7b2c0-9794-4997-8bba-78891f27abf0@nvidia.com>
Date: Fri, 21 Nov 2025 17:09:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/16] Refcounted interrupts, SpinLockIrq for rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20251120214616.14386-1-lyude@redhat.com>
 <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
 <aSClxW6jnspFRHMH@tardis.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aSClxW6jnspFRHMH@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf0af06-6610-4f2c-a0e5-08de2963c818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SThNcGJtQzFLTnYxWnRzcklEd2NZRlJ4WjhKbmtnNTgxYkExWXBQUm1hUEcw?=
 =?utf-8?B?WWdlNlB6bDZUWC9KSktMRVdJMi9EZ1lTQTVoZ2VIN1E2Z0JFUHNKd29ucWpM?=
 =?utf-8?B?bHlYQ2RkUUYrbWtXd2JjZHJmKzcvZFJmdFZXMmNaVm9uTWtMY3RFZlF3bTQr?=
 =?utf-8?B?MVZxTHI3aG5vUjZEN2JMNlhkdVYzZFNvRlVtMzJrM3VGK0lONnljYW92UWZB?=
 =?utf-8?B?dS9UeXE1VkM5Qy91dmFyU1ZvY05Za3hVaG56OXVSblJBVXYrUEhPMnY3OTA4?=
 =?utf-8?B?cEt5RHZWM2Q0YUVRSnFRd1BQL1hCMlMrcmNVM01GUmZoU1lxWUhkTjVSUXpj?=
 =?utf-8?B?RG9zTEo3b1M5aU01dTdWdHFuR0YzQ1NtZkkrbTZpSUgrell6OWhRNndNZkV0?=
 =?utf-8?B?UTBwSlJ3M3F6Mkg4NEZJMUlUZmNXeXVrVCt0L095RGZYcnNlUVhHUEJtMkFS?=
 =?utf-8?B?TGtnaXd1RGlHTnN6ZXRGS1dnRmU2ckFRdW1jT051RTdKWDVRTGRtMEh6TWJk?=
 =?utf-8?B?NEVnZVNKS0dJb0M5a0E1OUFFNlFwY2wwS3hmbExheWdhWWFGM3RMR1luUGFl?=
 =?utf-8?B?OHU4bGtVK1duajJSVDRmWWdmM2NTeVljc0krMnZtZjZobmNhTktiZ0V2RXpQ?=
 =?utf-8?B?NVJEUlFpdjJpczRoQ0x1Vys5aTBOTWhwRUFSQ1ZZSUo1WXBnWlVLc25IVzIy?=
 =?utf-8?B?WDkvT1NqZXVqdVh4WTkrdFEzNG8vRFE1b1NKZDFOcGx5N21pK3Jvam1DVFI2?=
 =?utf-8?B?dzJuU01ybHFuUHNub2J4ejlKTFZBZHdnTWxjekh2cnFQRUttL0tkaWtPNVdH?=
 =?utf-8?B?M0RwMFphemZZbWtjMlB0UURtMEZ2NlpUSXpPTTdhTXMrNmljdzV3QWthTDRv?=
 =?utf-8?B?NnJtZmJSSENSVDY0ZG1tNlV4WndhMlhUeU14RVVTL1ZpQUdRTisvQk9wd2lS?=
 =?utf-8?B?YlVHZmRRcW10NXlyWXFOd2d3eU1kbk5tTGpkTFFHTTJxUTlYdVJnMUFhU1N2?=
 =?utf-8?B?anpYV2M3Z3ZjdVMyRGNMcFIxQUY1TWlpRWhuR2poOXhJZlBWcmtjejNENm01?=
 =?utf-8?B?TEVCRHFvNUgwNm5ONEwyazdDN09rSE43aXFUT2lKM2QzYnYrejFPRXA0ckk0?=
 =?utf-8?B?eUF1bHRUc2JvMzQ2ZFZxTmpBVDFrb0xGNVBIMzFOY3hxYWM1dGt3eXNsTzRX?=
 =?utf-8?B?Q2l2NDV6eXZxR1dKZkRaZnVXbHNDaEZyV3M4SXFLM1F6L2lsVnpOZUE5Z2dJ?=
 =?utf-8?B?c1l1OG5OZ1RqajRrZlNFM1NOMTdQNldXcUthT1NLS0lkV1EzUUtNUlordC85?=
 =?utf-8?B?LzV4MEZjb0tuSjhDUG1tZzdCZi9xaHhsQWRsbGE5Zm9uMnR5aEhId0oxVGdR?=
 =?utf-8?B?ZDg0ZGI5RWlXWVJIOFRxb0VOSkZyNTh5TGM2OGhVb3FKWk5abWlPbXJ3cEJV?=
 =?utf-8?B?TkVwZlR0Uk84eGZnTVA3OStuakF2S21EY0JkeTlxSitRMFJLUGJRcDRPQnBm?=
 =?utf-8?B?d1B3eVNnSVlkbVE3WjFETDVjSy91L1MyWDdDWmx6c2xnK2lUKzh1UWtGNzhX?=
 =?utf-8?B?d3hPMVlVbXBzdDM0UnlhVjlPYytWa2tvQzVBdy9pdkNNYUh1MDhZMU9YNWpt?=
 =?utf-8?B?VVQ4UE9mVnpzMmgwT0lOOEhPUXRFbms3MWovSmRweFU3VUYrYW9wN0o1T3JY?=
 =?utf-8?B?Qy9jL0xwbEoxTXg3dFVxT2NYaUFNcWQyRk1MRmtuNElVcXZRaW9WcitIQmFw?=
 =?utf-8?B?enRVdXJaaEJ5NDI1SWtNRHUrZEYzWkpSSWRQN2Mzb3IvV3BuYjAxeXhUak1Y?=
 =?utf-8?B?a09lYWc2TEU1R0h4eUllay9LVlQ2OGhyTW5ZeWpRaWlHM0ZQTTNwVEJyZXRS?=
 =?utf-8?B?cDFxbG5PRVZKTlVIcTc4TWxwbzg2OS9HTTNySVJlUTY0dGg0anBSMDI5NUxX?=
 =?utf-8?Q?l/szr4zh5wmQN1PI3WBB3NxyCm6nBZyC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnhkVEoyNi9pREM3SDVLcDZ5RWpLb3lJY05BUi85YkFJYjNzL1FPNUpkaVAv?=
 =?utf-8?B?V0tqcW01QXJUUnpRMStlbkpkc1VLYmNndW9QRG1YaVBiWStOY1BTajRnWWNB?=
 =?utf-8?B?b01oeVpkVWtRa1Y4dVdKT1FsVmZObXJGZGlxbjVnaHhIK0srUFhFVDdDcHRa?=
 =?utf-8?B?NGo4SDFmdVBWT0l2NU03Z2hsdStpVXBPOXF3NkZUa3N0L3BwQnVWNnZ5VVdr?=
 =?utf-8?B?NGFiQjlXbFVBL051WmNLOXpLN2kwYkZXbmhZbHhCdW80akZWWDNOc2duUVJj?=
 =?utf-8?B?ZWZod0kxS1BDMHcrYnExdVk3OWZwdkM0aHlOTGo4bDVSMjN0c29sMUNQRUh6?=
 =?utf-8?B?cTd5K1luTm9BTWRleEdWTlh3ZzlPeWFWUmh0ZEJvSWsxOElENG1yQ1dON2pU?=
 =?utf-8?B?L3BYM1ZnQzAzcElwM3I5QVJQdUMxcGZsQTFISVE4MldCQklZaENpMVp0OGUv?=
 =?utf-8?B?L2VEdVhYQ2VlbUwranVMeklFaHlBeS9VS2E3S1g1bk83Z2xkMUFleGpybjdJ?=
 =?utf-8?B?YXlodWJSRVRBemtSYjd4T214WlNKR09xelhrVTZGMi9zV1V0aEx0SkpFU1Nu?=
 =?utf-8?B?ZSsyeFAwLzI4WXZYc1ppMUJVS2tGMlgvVitYVThra2N0TUZ4Y0pXcFNtTnNO?=
 =?utf-8?B?eDJqV0pwTTNUcFNrT2c3Sml2dUlvdEg4ZmI4bmZVSHhkWXZGWDZ0cGR2dGFy?=
 =?utf-8?B?cXZZTGRLM0JFWm1hRmlGdmdhMEt6TVdoOGU4aHQ4Z2ZTcmZ5VDNUaFdWRVFk?=
 =?utf-8?B?cUFiUGI2M1N5WXpEQXdOa1dreWtWRkZOT1JLa3dWWVNMOFlTaFB3eWFSbXZM?=
 =?utf-8?B?dnZPR3RsdGl6c1NiaXlSaURYRUJjUDE2am1GS0VyeVBHRk9NenUyNDIzck00?=
 =?utf-8?B?N2JSVzFjOXJ4WDBLQVowMzNxUU9wR3I5WS9JZ1NkSUQyZklvVHZ4Z2U0c0hx?=
 =?utf-8?B?RkJ2RVJ2Qk5KOTNISldnY2VYT3BIRFBKQXVLRlJVS29BYWMwclA5dVFDeGdL?=
 =?utf-8?B?eUdwVllKWXNCcmhHMkd3ajI5TFh5am95cklXbE5abW5tUlgzdVd4WGU2Mm82?=
 =?utf-8?B?M2lzSGRyTE9zWUUxNHAvV0xBVVZRVFB5MUNEd1JwWGZSaHdPR0tySG5hR2JT?=
 =?utf-8?B?bm5xdDRHcXczeC96L1hHU2E0eHVCdzR2dWhobkM5RUYzY2hvVlR6ZmlLV0g5?=
 =?utf-8?B?NUZlN0l1RW52VGJVTnpsdURIblRnU0NUVmlrT1pNM3JGUUdyd28weDhmZUlq?=
 =?utf-8?B?ZklUYUNRTUFIQkVmblRaZWVGTXVqZStpTkJiVzZmUTQzUTFsYmV4N0xWalJ6?=
 =?utf-8?B?WHVzY2pZMkdiZVdYK0UvZit4Yldac3VZcHRFcnRETldGZks0T1NYNHZBdWlh?=
 =?utf-8?B?MXBva2ZVRUhWVWxXaWJRbXNWdHlMZnJIS2Z3U3VCcDE2Q2llN3R2bFR4Z0FX?=
 =?utf-8?B?RVAzOVZXSHJnSnBLNytXMHRiU0NzZjkybndXbHNjb0wrM1kxNFRDem1Nencz?=
 =?utf-8?B?UDFlL294dE1zTzczVHR4UjZ4UzUxcDlaaldQdUZaUjJFOWYyQkdVQXp2OWU0?=
 =?utf-8?B?d3o1QUZsQU9idEY0bUVxSlQzaitWMThRNStadHgzNVl3Y0JpRDdXY3pCOHJG?=
 =?utf-8?B?UjFxeU0zRzZSNEszc1ZJY3ZGM2pzbktxMG84Wmt4d3FXOWdDRkhCeU5JK3Iz?=
 =?utf-8?B?K0VsMGtQRmxrNUNrd01LbTZ4RE9idHptTUR0dkpzK01ubytxdVIvTC9uMS9t?=
 =?utf-8?B?U2hhaEVpajF2bzVLVktBNUtDS213dml2ZTJ3Y29USEpzZGtPY2k2eXdiK09s?=
 =?utf-8?B?RlVjSnBXYngvSE1rWjdYM0dYSWRyWlFJWnJHcStFNExqNm10cWJnamxXb3Ew?=
 =?utf-8?B?QmNGUi9PRHVLRzFWbHhXVXFMeUR0bGx2RWFITlZXQmljUUVVNDh6RjB6akxH?=
 =?utf-8?B?QVdXMGthWUl6YmhUSnhMV2VzQUpNVDJmWVVFUlluUER2T1llNlF5TEY4M1RV?=
 =?utf-8?B?b0pONkZMVTE2YlF5d0FkZ3lrcVZ6SmtGck9iOVBuOHduNFRDNEwvLzcwQkFW?=
 =?utf-8?B?RGpaMlExNFJnTk1zZmtkU3JtQkNMVWtlZWFpUmhGZWlCNEFmSVoxOGdTcmgw?=
 =?utf-8?Q?emJTeSFTvBpBoJCSdUGASTeGW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf0af06-6610-4f2c-a0e5-08de2963c818
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 01:09:27.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33ed/irq4JCTIM4arAFwHKYC4zuj77u2EV/wlgwycgwj4kuogNQggeo3NtMOicTKh2QnP786Y+svsSzENzMnPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

On 11/21/25 9:47 AM, Boqun Feng wrote:
> On Thu, Nov 20, 2025 at 03:16:04PM -0800, John Hubbard wrote:
>> On 11/20/25 1:45 PM, Lyude Paul wrote:
>> ...
>> This is alarming, but is it the final word? In other words, is the Rust
>> side of this doomed to slower performance forever, or is there some
>> hope of reaching performance parity with the C part of the kernel?
>>
> 
> Note that local_interrupt API is for safe Rust code, you can always
> use unsafe local_irq if the interrupt disabling is the performance
> bottleneck for you. So language-wise there is no difference between Rust
> and C.
>

OK, but there *is* a performance difference between Safe Rust (which is
the whole point of this project, after all) and C.

Is 3.6x longer really something we are stuck with? Or is there some other
way forward that could potentially provide higher performance, for Safe
Rust?

 
>> Do we have to start telling the Rust for Linux story this way: "our
>> new Rust-based drivers are slower, but memory-safer"?
>>
> 
> I would not jump into that conclusion at the moment, because 1) as I
> mentioned you can always go into unsafe if something begins the
> bottleneck, and 2) there is always a gap between micro benchmark results
> and the whole system performance, being slow on one operation doesn't
> means the whole system will perform observably worse.
> 
> Think about a similar thing in C, we recommend people to use existing
> locks instead of customized synchronization vi atomics in most cases,
> and technically, locks can be slower compared to a special
> synchronization based on atomics, but it's more difficult to mess up.
> 

Yes yes, I fully understand that micro benchmarks don't always translate
to a real-world observable effects. But interrupt operations...those can
be on a hot path. So it's prudent to worry about these.


thanks,
-- 
John Hubbard

