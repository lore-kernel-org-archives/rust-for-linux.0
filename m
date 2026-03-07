Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E37C13B;
	Sat,  7 Mar 2026 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772841956; cv=fail; b=i7NnrCrbVtMT7VqSjq0EkXonimL4a6R6sTkpv48zDvvLmQDqX/QcljbUrnCUEHi7kroJeRV1sGjysfmm7ksSItyLHJXDZAuTMoCbLeZmZ20C9TZ5kxzhg6h0lmpEJ/IcPmUSO5ym6k490202Qg9enMtTr4ogbQCTRGky0+BVhJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772841956; c=relaxed/simple;
	bh=6KgU6mGA+Awi4W+A3IyVudSpnUYmb8pNfC/DDOdASj4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Qrl4NpN+SdMoeSuH6pU1qOTR2QmN9a+Gw965PwyS7HDDI+3mGyxlkzWJykccJuojWB20eOf6qtihwTH3Lqk/uKF/V0DSYZ++OdP53Vkx7Z6sh59g2Fsd3lXxvvk4oUoAqsDPMjYpJxgVOm654MR0XG/q42W91dCrPampLTmVOyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Eh8k4O38; arc=fail smtp.client-ip=40.107.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Eh8k4O38"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imhnSX0bfKurRo72Tk6oL4sRZ0d9WXimCJZV3A3S3qUrZs5AAQxcjpN2LPIB737QSHpXUmed8m56jOXlb0sC9tqlOM/onclLJHpoqCCt0AzvPbxKu3lSDYsxIJwqro5VVsMi7odthfzcKC4xJyyqtjRZAB7tz/oMss26vv9PEeFhW0MhYQnZLGp2KOcZaFmnoix3eo2nqLXBG6DMXGTHVXzRoPRlDVQKtUJqnatuqR8oKQExT9c7BwXJqyz6sdHXnEoli/IOTTYEm8HaBomFNRw/pY1AYZT+1esOlJ+9urQZ3zcuXBRDgs56z+L0/lTCRAr0OvbsuvrPHeJkmQo36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWm0agkpdnfnzHEmLlLSlozelPQOkv9y6lec8VWaZYs=;
 b=AQuqx6wdQbTT/aFLw4XN/hG7qI8WqQKUuFncfPsiiUJb8G92aecZzdqUY/X5JMxFxYpOQFJ0xnGdYoXHdBty8M2gTQ4ugWF35jql2WRv+avZTt7owP2SNU7+e/JNIhuuPtcLOIqlMapBkzvKR3fE+Q7SouZdoubLUadvMliGEBMfOLCjrsof8MjOBCtcN69geeEGpJIRl51oHgXKEBEDM/L4l+MBhQZgi+4G/RTNqFOqJXQmsgYYVzCT5SOELXu3hX/xndqh3vWcRT44xeBC/tmO1OdG0/vesjuFQPp4ixU/iZE7FP6PqPkV9ccTngQDGgEimrb6YYs9RpXKPktpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWm0agkpdnfnzHEmLlLSlozelPQOkv9y6lec8VWaZYs=;
 b=Eh8k4O38SutHeHnbVuURqyPdt5vFBspfV0UY8i4Wi7QJH4qhhpCojNeSfGVsqtlg0iIvO2yMGMo1LTlfuUyp3fan83C+m4m9ZNU0JBv94ss6xYmKbQmNnN79IyXAh4i2nuRUmJh7nuCUzfwGkVAhGPITk9L9UrDVs9lkpVZFDtd5cVsKv3AQei0M1qtmplQZWTWsTCJCZlt3iFIS1j4ppyMYybvIlOuGDUmhIu1ujjKhY8J0EZmhZu6L2wfxrxigi+zJEsp4WrOL1oXrtTyemHWHYnyfhLZWpN4/mW/APqILyypnG0TS1dKK1iFJN3m+lYuylYdOqEJp+1viP1hPBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6443.namprd12.prod.outlook.com (2603:10b6:510:1f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Sat, 7 Mar
 2026 00:05:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Sat, 7 Mar 2026
 00:05:44 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 09:05:37 +0900
Message-Id: <DGW40MO7G2B1.27TW3629TLBOD@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
 <DGVT62XLP0MZ.YVAQQ5APE9S6@garyguo.net>
In-Reply-To: <DGVT62XLP0MZ.YVAQQ5APE9S6@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: b6673659-ac2c-4b61-f638-08de7bdd4589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	bqR6YoXpG1zxj7MA2whxn2j6Z4rwx8DKYO1+9LXbiUpPXQTF4oVobJvDMwYaYWi3tm5ERE4rKZKEP4Nb8+fdSKC3ge7JJQqxPq3YwLBp0g075O4Rw/n/kkooMM30hUVNYKmLXGv1ItjM79ghNiyvteDX10Zku73VMnKgzXf6sJ++3kQvMm3Ca3RPrkac9W3yssyxM2HMW4gz5Z6dZhh/JeKPmabVoD9LrqWfZbIuoU7uC81S9u6SiG2YxR8A+kRpnM9mZ0oCvLXxqlKbXe2K3a4QTAP1Hf1hIbU8eJFs0LjPQGv/04Qj0th6+wo8VSajQEmh6t50Ajd5WPzNYOm0h9knsQNxlxmFYmUDO1fuVWLu+0AupHf7O4FGoTD49OqfSv7f2YFyTJ5yQQFQjs/6EaMHNafDCNgFsl1yH3V6+00v8QDXRHuZdVz6knOwCRcwbpEvGqRiW13fdaodPQRZJaTtTohxuVCmlzuSJp99YHOU4ziKDB7OCKZXNMeJZQ6NKtEZlZZnRXVWAbCI3wzUEcnK0/9jvSHgb9EpbcfIXyyKHkaaLY3xmYuz5Rx5qpxvzcnwnCKEv/+2H3SB175iNrSdy6tRtAy8zwQvy4EBjGgDGS5ylPYu9mOSgxeQ/P8gL+IGM8vFB3xp6FVGv1ez4/11uHQyD3spQIIt/AlZj6VqH7rcC56WNcx5+pyy0migYIG4/kdRt9kk8eVMEhhZoaqsiPPxoECePPgIP9lF8gc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3dHeWRpbVBFU1NLb3VDRXB2RXRpUVl5dGRYazY1STVMamxZREJNR2xXU29j?=
 =?utf-8?B?WnVzdkVERVhVb0xoU3NsVjNZZzlaeEFNRXJiMCtmekw0ekZIU3hBeG56dGhK?=
 =?utf-8?B?SzQwNVlVOG50NGtNZkUvUXNjNlNjanlobDlkakpabSs5S05pNm42V1FnY2I0?=
 =?utf-8?B?YklyOFNMdzNpd21sSXRCTXdTSnZxWDdBWFUzOXV3NG0rRnluSVJ1WVN0VmFl?=
 =?utf-8?B?MWpSeHJ1TFlPWGNLM09IU0IwOHFrNEtac0Ywc3AxcjJDZGcvaXNpb2J1aWFj?=
 =?utf-8?B?WjhVUlQrSmRVTm5rMjd3Y1BaTkRoQVdONDUxZUk0T0xYaEcrRTdEN2FsRWFK?=
 =?utf-8?B?SjNpTTBUTTA5RXVxN3pCcmVpT3lmZ2Y2Tjl1eTRISCs2V3BraktPYml6VjBT?=
 =?utf-8?B?aVIvSlFuUGJtSzR4eUdZVC9rVEgzakl0M2p6VEI5S0YydVNxdmd2ZWlLeUpk?=
 =?utf-8?B?MHovei9kcGZQSFc3UjhyYWs0dS9oTHgvQ0VWOG1NVlg2ZzFDVnJVRXNyUDBT?=
 =?utf-8?B?OHZLeWR0eFJmZGo1VGZ5OTFSQVcvbWJwVndjbUJtSXRGN3NkeU51OXd6QmRP?=
 =?utf-8?B?Z2tWTEw1M0syZnhObHhwK1VlMGFHZFQ5N3lUdmUvQ3BxdE83UVh3d09oYUdE?=
 =?utf-8?B?QnpRdk1EQSt0VnVnNDZwS0VxbW1KekxNNGcvL09sSG8vT2lNZVNKM0ppQVZF?=
 =?utf-8?B?bFd2bXZNQTE0YTlERlhWVmk3bWxHSFVNa1VzeGExQUZNcHRkUjV0eExYa0k0?=
 =?utf-8?B?QXpxd1IxNjVzMDN0d2g4YUhaZEJ3NzVxUU5kUWRYTzZTemNqVW9iL2Rrak4w?=
 =?utf-8?B?dWhrV05oL2RYUkFqU2xTSnlMRmpkVGh6TXBqQXRRMUN2NjRGSU1jOUZCWE13?=
 =?utf-8?B?aHJGN3UvUVZySE1pWDhWYmNiNkJoZ0ticXY3WEJsdkVKQXRRRXNtelAvVzBj?=
 =?utf-8?B?OHdEdVJKQTFGdGJZSk9xWXZ2OUFyS1E1MGQ3d2pOdUF5bGFjOXhweXh5bzRl?=
 =?utf-8?B?Tk1iS1UzZExiTm1WdGJieTl4ODU5OUtoTEJmOXZCUVVxUjF3Y2tTY2V5d0tq?=
 =?utf-8?B?SjZKQzVjMjVHVjhtcnNoSFJEQmJDeWZiK00yV0FNcjlzczVJWE9QbjdIVDdR?=
 =?utf-8?B?S3BwOXZhK2FCbm16U1dWRGYzTUk0Z3g3R25JQXZaNWQ0VmdWcGRET0dscG5s?=
 =?utf-8?B?dXBJNEwrZlhLajRreitvcGYrZlJrbitoeU4yYXE4OHg3VEVsRm5WYmtRNGFx?=
 =?utf-8?B?YmZHS09YdnlyKytqNlZNcURTbmJkb1oxcld2ZXVoRGRhRUttN0Y0MUxzTkt3?=
 =?utf-8?B?Z2NXN2k4dnk2YjVoanEwK3RrUTg3MUpsQkxJNDZrQnFjcUQrNzFyY0dsUnpR?=
 =?utf-8?B?YjFocndRMUVKQVkvQXJlUnZuT1RyMnBzWTMrR3RyNnh4Y3hKZ1FlQVk5a0lE?=
 =?utf-8?B?QlFOTjllZ0gwSTNTdnU5M004ZDlDZGlUVzRhcVEyTmZ4d3lwelBUa1UxazA1?=
 =?utf-8?B?VUtGeVZpNUhnRlF3a1dvRDN5eGV0SjBXNER2MjhaWFJyNEhwOG1ZUGRWamVl?=
 =?utf-8?B?eXNBeEZTaWRBWXUzTi9TV0xTZ2h6OG5aUkl3SUpROXJRODVBOEhQcVZVUjgy?=
 =?utf-8?B?bW9ObU1Rb0dQRDdXVTZ1SUJGdFBIU1NXY1FhRzA3Q0ZFQlU1QWxhanQ1bU1n?=
 =?utf-8?B?OFZwdUxrRTJIUVFycjVUdG1nMlRYc2pqNGVvMlVZWjRxVHBRRFRXZWhWUWJy?=
 =?utf-8?B?NVpnVVpJS0Y2ek04YVJYTjBUTHFiMHVER2t6MHJkdnlKY3l6c1JNWjloeXE2?=
 =?utf-8?B?U2cwREVpWHhRaTB0QitaR1MzSUpVZ2tsQ25KUEhhWW9YWlhLUERXb1F1OHZ3?=
 =?utf-8?B?K2Jvem9YVG0zaXVBSGVlV0tOUlhjSmVhakI4OVE5VzV3S1JmZS96UmdjMTZn?=
 =?utf-8?B?UnlWN1ppOXB3Um9pN1lBOGtlVUxiYWVjSUl2OEVHanZQdG80eFJmZTg2U1E4?=
 =?utf-8?B?UTVqQmJQL3ZqQlEzMmpRWXpWaEY0ejdsSkk2YjR1M1EvMUwyeVZieWU3bVNJ?=
 =?utf-8?B?MHJUZ1poZ2cyRjE4Z0NTRG9XdHBUS1JFaWxIbFhLR0luRmRkRVpHWWlNczJi?=
 =?utf-8?B?YnBvU1h1ZjIzNENDd1ZnN2p5WUFzVW1qTk1FV3hrUzNBSkJoRzhhT3lwQnR6?=
 =?utf-8?B?eHdka2dNeTZ2RUp3YkdoU0ZWWDNqVjJMdEJaclR1MksrTEZYQ0dPcFEraHFa?=
 =?utf-8?B?R1B1SVV0U1FtbTZ5N2lzb29NVWlZK2hTeW1KSkliWlV3RVVDQ0RGRWZVV2to?=
 =?utf-8?B?Y3VlcWtVcHRmcjNKekRxVW8yYnk2SVVaUlBoNHlMWmFoMG56b01RcDdLLzBp?=
 =?utf-8?Q?Pa1ib6OXxUe4tVyJQEYCnPiJW39d7eGK10X09y/Kho6F4?=
X-MS-Exchange-AntiSpam-MessageData-1: PEL6NcUpX0P/Ug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6673659-ac2c-4b61-f638-08de7bdd4589
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 00:05:44.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hby6Y9Pvzlg052hAdJdeydXkp0AFu01JVSgynZk8vq96TZ/jT/pIBIQfsX7QR82bmK8S5fz+sS/37lX4YdRUdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6443

On Sat Mar 7, 2026 at 12:35 AM JST, Gary Guo wrote:
> On Fri Mar 6, 2026 at 2:32 PM GMT, Alexandre Courbot wrote:
>> On Fri Mar 6, 2026 at 10:20 PM JST, Gary Guo wrote:
>>> I  mean not sure `at` gives me that impression at all. It would just le=
t me know
>>> that I am accessing it at a different location. If you omit the `MyRegA=
rray`
>>> part then there's no real indication that this is an array to me.
>>
>> `at` is a function name, we can change it - I picked it because it is
>> short and reasonably descriptive. The point being: we have a unique
>> function that indicates unambigously that we are using a location for
>> an array of registers.
>
> Okay, maybe `at` is not the biggest issue. I just instinctively feel the =
usage
> example being awkward.
>
> Perhaps the fact that `Reg` exist itself is awkward to me. It looks like =
a type
> that exists only for things to typecheck, and not itself represent a mean=
ingful
> concept.

After partially implementing your two-args proposal it really turns out
the two alternatives are very similar in essence, with most of the
differences being details like naming and scope.

The one fundamental difference is that it didn't occur to me that we
could resolve a generic argument for a function in first position of
write using another argument, hence I went for:

    bar.write(location_builder(location_info, value));

but it is also possible to do

    bar.write(location_builder(location_info), value);

And that's really the main difference. All the rest is mostly details
about whether `location_builder` is an associated function of a type, a
method of a ZST, or just a module-level function. From the point of view
of `Io`, none of this matters as long as it gets an `IoLoc` that is
compatible with the value. IOW, each Io submodule can provide the
location builders that make sense for it.

The `Reg` thing in my previous email was just a way to provide a scope
for these location builders, but in retrospect a module-level function
seems better to me if we want to keep things concise. So if we turn the
location builders into module-level methods we could have:

    use kernel::io::register as reg;

    bar.write(reg::at(10), SOME_ARRAY_SCRATCH::foo());

Or does

    bar.write(SOME_ARRAY_SCRATCH::foo(), reg::at(10));

Flow better now?

>
>>
>> You seem to reject this design because the syntax isn't obvious and
>> natural to you at first read. We are trying to build something new, so
>> of course if will look a bit alien at the first encounter. That's why we
>> have documentation, and I think it is not very difficult to wrap your
>> head around it after seeing a few examples.
>>
>>>
>>> If `at` is only for array, how would you represent the case where the s=
ame type
>>> is being used in multiple registers?
>>
>> That's not something that is supported by the register macro currently
>> (probably not a big change, but not something I will do in this series).
>>
>> But to try and answer your question, such register types would not have
>> an `IoLoc` implementation of their own and would need to have their
>> location constructed explicitly. In accordance, the construction of
>> their value would not bear any location information; thus there would be
>> no redundancy.
>>
>> We do have a case that is pretty close to this with relative registers.
>> These are accessed like this (real examples):
>>
>>     bar.write(Reg::of::<Gsp>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()));
>>
>> and
>>
>>     bar.write(Reg::of::<Sec2>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()))=
;
>
> Relative registers are something that on my list to eliminate and replace=
 with
> projections, so I don't particular care about how it looks like.

That's interesting, I thought register arrays would be easier to replace
than relative registers, I really need to take a closer look.

>
>>
>> But for register types that can be used at several arbitrary locations,
>> I think this would be even simpler. The different locations would just
>> need to implement `IoLoc<T>`, where `T` is the shared register type.
>> Then, considering that the two-arguments version is called `write_at`,
>> you can simply do:
>>
>>    bar.write_at(REG_LOCATION, reg_value);
>
> Having `write_at` as the name of the two-argument version is okay to me.

I picked that for illustrative purposes, but `write` should be the
version that is going to be the most used. And if we remove the value
from the location builder, then the most used version is clearly going
to be the two arguments one.

The one argument variant would then become a shortcut - `put` sounds
adequate to me, but `write_val` also works.

>
>>
>> ... but this design also makes this possible:
>>
>>    bar.write((REG_LOCATION, reg_value));
>
> I considered about this, but IMO this looks awkward.

Funny how you spell "elegant". :)

>
>>
>> Tuples of (location, value) do implement `IoLoc` themselves, so we can
>> use this little trick to support a 2-arguments syntax with a single
>> method.
>>
>>>
>>>>
>>>>>
>>>>> If you want to make things more explicit you could also have
>>>>> `bar.write(at_array(10), ...)` or something similar.
>>>>
>>>> Is it possible to generate an `IoLoc<T>` without having `T` mentioned
>>>> anywhere in the call to `at_array`?
>>>
>>> Exactly same as the `impl IoLoc<REG> for usize`:
>>>
>>>     struct AtArray(usize);
>>>
>>>     impl IoLoc<REG> for AtArray {
>>>         ...
>>>     }
>>
>> Right, but can the correct `REG` be inferred when the call to `at_array`
>> doesn't bear that information? The type inferred by the second argument
>> would have to be propagated to the first. Guess I'll try and see.
>
> RE: inference and bounds checking issue that you mentioned in another ema=
il, I
> think you can have
>
>     fn at_array(i: usize) -> Result<AtArray<T>> { .. }
>
> and=20
>
>     impl IoReg<REG> for AtArray<REG> {}
>
> The type inference here is no different to `Reg::at`.

Yes, this clearly works and then it actually becomes `RegisterArrayLoc`,
which already exists and also implements `IoLoc`. This convergence looks
like positive sign to me.

>
>>
>>>
>>>>
>>>>>
>>>>> For the array case I really think trying to shove everything into a s=
ingle
>>>>> argument is a footgun. The type of value in this case *doesn't* tell =
us the
>>>>> location, and the location needs to be explicit.
>>>>
>>>>     bar.write(Reg::at(10, regs::MyRegArray::foo()))
>>>>
>>>> "write the constructed value at the 10th position of the `MyRegArray`
>>>> register array"
>>>>
>>>> What is missing here?
>>>
>>> This is completely un-natural if I try to read it with fresh mind (try =
to forget
>>> about implementation details for a second).
>>
>> That's what documentation is for. Please give it a fair chance and ask
>> yourself: would it still look unnatural after working with it for
>> 20 minutes?
>>
>>>
>>> `MyRegArray` here is a type name that is a bitfield and not an array. `=
foo` returns a
>>> single value and not an array. "at" here is saying that the register is=
 at a
>>> specific location and doesn't really indicate the array nature.
>>>
>>> This is why I insist that I would prefer an explicit location
>>>
>>>     bar.write(REG_ARRAY.at(10), Reg::foo())
>>>
>>> would have no ambiguity whatsoever about user's intent.
>>
>> IIUC `REG_ARRAY` would be a const ZST and `at` a method returning an
>> `AtArray(usize)`? I still have doubts that its generic type could be
>> inferred automatically but it's worth giving it a go.
>>
>> If that works, then I assume fixed register writes would look like
>>
>>     bar.write(FIXED, Reg::foo());
>>
>> Unless we have a specialized `write` variant for them.
>
> That, or `()` as I mentioned.

Wouldn't it look... awkward? :)

But if we can agree on

    bar.put(Reg::foo());

or even

    bar.write_val(Reg::foo());

Then I believe we are getting close to something that can make everyone
happy (pending Danilo's blessing). The `()` syntax can also be supported
for generic code.

I'll try to speedrun the remainder of the implementation and send a new
revision for review, but AFAICT this ticks all the boxes.
