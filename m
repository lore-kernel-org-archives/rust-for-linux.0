Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831338E126;
	Sat, 25 Apr 2026 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777101639; cv=fail; b=dcPCH3HepzNp7KGxLxIzQCqfxt4OyuXGR++QkIYKjAa22mN7qaoFi5nC3HbxkykzKm3Cf0I/ipXBaPjgvLKzTr3xt8md0BllcuekpQfW5q2xcQgV6PHgBoIMZWlhRVBU9/OtUNgQiSC1O66PcZ69JY3LzfW9JmPJYrZYAGi3FT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777101639; c=relaxed/simple;
	bh=cPQpbC3+K5SOw4YOETmZgkgmEeXVQNk+Hr40gktZWm0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=S8N1ZOuMxEyV8NNvkFTx1e0544Vj7C/Vh6hww5JrL5Hp7kMOobRys1syRDsldGd2qDW/iKH0UhO2jzxXmEAEoMyz7sKGMP5DdREb9ngDaZlvTNuVIX3TKO1av0+AJsQ6XlgW/zU1tmohYFcXfMyjSmJdi/X6b5aBzHDBk5PYP0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kmzUmzrH; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kmzUmzrH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/K343mMCT2MwMS9Xw3FaKxe7/4c9hgA154w3FYpyP6O84oNfEBd3ImF5TPQZyIN6dxKYCYsJJ6d/fZ0rM7Or7TcmOiuAV6/QfY9nNCDiLIndC+n+xn8iEF/KV6+2gwrb7YA+W8jm3k6uQqwzrn7QMnXwJ+gibJZHKvpsV0DICLwvcLtkdHZuWPv9bTyq9vuf3D5+1rdjhB4fHzNKhlBOBkfaPZlWrwDoUvMkZMyv565sx1uzkPT0WojoH1mgfGSRPEHRQr0qZDscNVBltr1xxEkLjUTnotZdCYQgkao8PGA9I6rr2yhI2fZidxfCbcMgZH/CBNzY3WfV7R7J98APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPQpbC3+K5SOw4YOETmZgkgmEeXVQNk+Hr40gktZWm0=;
 b=oeHSjbtwHoQ7S/lVZfi+JLc0VOwZWOMt7cV0NooKMYaUqapke5De66nNlsJNUXKw/wZUnvJFrSEb+JMQlX1t9eq+Duukpq3RApeP16ZcbcMsrBV+3Ckb0DLsaffIsr7aLI7pSUhfKbnjvko7YU8/jRuMyFbiLC8nD+/P3O7MAN/+1PjxRqZUTU35JtFlogJ2LTyCLYUnSxL1x6L5lie5Wf1HI+ViNSuyd2Xiipt30r0CvSbTpZ8vax7X4fv9QJoRAsN0ChWd7E7RhK0P/6iNoT+EzTByfuRrUx3CqMjZfxJFI+uEhnkbDDB8z8Bejmv8brxfI79W6KY7iFHIF5/8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPQpbC3+K5SOw4YOETmZgkgmEeXVQNk+Hr40gktZWm0=;
 b=kmzUmzrHQW297negys8gQ2RaIhtejfVv8MHEzYEIJXBEEgGC285P5Spt8A5pGNb1euwpVunpNRqIpMMeoxL13vgxk5sIICUd61j4nI6WuCFBdtwlXszQB2aNSuPClwhgHj/832upe6IBVUDmDV2GYbjQrtXwUs5bYcQ9QbJVxH7ZphEC6YpfSOVDJn3Qws2pWHos3Mn+WpW6oRenSDOdIC1YQGowOVepnGYgQT4EaY8+bWfdQboCny5WZCpEuG/STWnHCL89py18eRjfKDOUlCxPPWOprpgy3A9BGHML1eXaf8kauW2ReEFhfd+cpCGZtGfReHRnDIwchPKAYCeSKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6525.namprd12.prod.outlook.com (2603:10b6:930:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Sat, 25 Apr
 2026 07:20:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 07:20:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Apr 2026 16:20:22 +0900
Message-Id: <DI21Y6U4OZWW.1VLZV52OCSW3R@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::extend_with` and
 fix comment
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <DI20XVTPLERK.CQ95NC4Y3QXN@nvidia.com>
 <69ec6506.170a0220.b79b6.7d25@mx.google.com>
In-Reply-To: <69ec6506.170a0220.b79b6.7d25@mx.google.com>
X-ClientProxiedBy: OSAPR01CA0268.jpnprd01.prod.outlook.com
 (2603:1096:604:2b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af3756e-37b9-4dbe-927b-08dea29b1f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	62tC0XqJWgQjmJrU++fI/JYUqKK9cfoUPK156jxZJJSzAHNXzUpPVWTUJ69cV9PoXDaWu+8Se547K32BTIXyWChHx20sj2Ewo9IyWg/2hMAIEto2yvqmygcpDhqJqHY0Jb27EnV3qPV2BeceCWE/3OmIngbWLkQOXuEQbtZr9px5PfVhkZ66UJJfF4CmJ0pGvE/iYsm7XUU2NnKBozkqoJLrXwzD+g9E9rQxN4EQ/9GVgaRZ0imPM6kkjSexmjFTAAYzkrZHewTY9o2NSoccsP8On+YK2jq9mzx0AK51+ALYmJp330QLuSj3OC12yQbowLb7+ckW0DWYoG8GAOJWlIQOdpru94G065TmTyHXyKoB5FzvqNfyguyXhIXjvlzI8/GInKKTkDZBoC/kKg6HciDrPyPCkpNgEH7zFPMtkA/iQUhPjCKJDVLeeq5GsO0sa0AXAxzMh7EeTxv6BwR40Ay26RUwjXMgA6A/94V1eX/CNJQ9ju22AGhySZx3JoPo2EPcZ8E95MKyeIt1R5XJ1ImK5f1P8uLf57ijd3uw92BEkn/HhYlFgBJtUGO9weZB+hQgH2RWIBUmJnPkONEZeHJHrxG16FWx8PiYBLr7kZKU3q/IIlLUSBQJy/Dkp5siN5SmmQiEKBg4iqW4busalV4cknuC+HD0uQ9MSQw97bpxu9cnk5dJFlzQ9+/u01T5SkM11vlWE+9xZJqaufeLK1ZhLLx+VbBhQEWH8KdldLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1hNYXowYktKRnFucFdIWDBYeDJwUWtKQ1ErbEcvUHU3eXpyaHZvcE1RYnND?=
 =?utf-8?B?ZEpjczJEeG9aWmNVcVVaWGRCSHBDUTh1WkJZZU1ZNmZETDNjWmtKVkVVblor?=
 =?utf-8?B?OFdCR0J3RTdqS0d1WUNCcU9ZWWZ1Rndmb2R4RFhqTDlBSEl5aGhOWlFmN2Za?=
 =?utf-8?B?OFlMcGQreTBSUzNJZkxhRm9xR0FYSm43cUk3UHJKWVRGN0xqV3RkWU9iaUw5?=
 =?utf-8?B?NlFzNlJHSkFOWC84V3lDakpuRlNaaEE4c1VJRHVCQmZrd3laOVI1ZThDRXVX?=
 =?utf-8?B?WitIa3BQTkEwbHV3MGtkd1hRaGsyTWo3bDJnVERNUDFlWHFPL1RXRkdCdkZG?=
 =?utf-8?B?MEk2VDZxUko5bmhhNTVMbVNHTGcxbHV4L3diTHpsY0pJZldNd0lEWExZekFP?=
 =?utf-8?B?aVJ2Rlgxb2ViN2xnNVJMNzJwVHE0TEpia1hDTkoxbTdJR2dkU2tORmd5NFdt?=
 =?utf-8?B?QWU1a25JTVlhajZIL2Rsc3JCUnN5ckdhMVB1UWZ4bHUzWDZMVUhoOHgwK0lo?=
 =?utf-8?B?M1lrUlNwcU1WS3FXdWFVWm10UzN2SjEzNFJ0dTRxOGhqOGdMa2tFWFpubG1n?=
 =?utf-8?B?YVRLTTQwckNmQVhtbDVUN3VpQzlKUWdFclpGb1JrY0xmUTIrNFlCSGE0OHFr?=
 =?utf-8?B?UlhxejVqMGNKclMyYmRDU0UwSGZZYmdNWW9yczZKZ3FtTGdJK09QUE5qZ3hG?=
 =?utf-8?B?L0ZGZXRTSUUzelFxRWNxdjQzalowVCtHUzBnTEVkTnZEbVFqeGFQZEkzaTZz?=
 =?utf-8?B?N2Nyc0JCcDZnQlJwQjJpV3pjOThucDdPdkxTeHR3aUhDNTZCb2paR3VjcHVl?=
 =?utf-8?B?eHZ5RmNWRkJYRWJ1RzlLRTZueWZtNWpHYk00NkJTYmsrc0VxR0t0eDFRREJZ?=
 =?utf-8?B?M0hFMEx2YVJCb2x1ejJVK1pCeW50b3VCTG55THZJVHoxYTd5dHJVWEpuRnB4?=
 =?utf-8?B?Yk5zamI0ZVk2SEFLbWJKL2V0UjZVMUhQeVlsWi96clBTeWVHRi9WVUtvVzUr?=
 =?utf-8?B?emltdmhzZm9IN2FGTS9TQ0NIRnJIUWhrMkhMTEtiSllqcS82QUdxZEtlY09S?=
 =?utf-8?B?b08xTEhnKzRwdVUzZnRvdUhhVWRqelh6M0ZVYUtHRmY0VUk5UWd6dlB4QjYy?=
 =?utf-8?B?emI0TjJpUFFibWI1dy83S1dnc2tTdk1DUGFvSExMUVBoRVQxWjdjYkg3Umd3?=
 =?utf-8?B?MlpwcTJxNHBTdVNqNENTZW1kZUJHUjJXbTBidTJLWkswbjJJZklUZ2ExQWdR?=
 =?utf-8?B?bTRTaTJhelIyZzZ2VjdCNDdYS3lYdWtXb2UzdHROdDlJZlVFMXA3V09TWW5W?=
 =?utf-8?B?QkR2MytibndvNVVVd0haZzliQXpPZ0lSci8xajJpZi9FRWlNSm5TRHZpSTRQ?=
 =?utf-8?B?bWt4dWVIWU5UQ2k3a2lmdi9wVWdUcGRvL0pOVGRhKzdZcUtqdzd3cVJ4SzRV?=
 =?utf-8?B?S3JhMTA5aFlieGo4RHZ0WjZKc0VIeE1ybS9hcUxia2x2dWxqdExaZWJMN0V4?=
 =?utf-8?B?UEMwcmdWS2IyN0tLZTlWR09Vank2elBEWERycjRNK0tzTC85R2RaV2VQQkZo?=
 =?utf-8?B?WWdzU0dvRFo5ZVNMNDNmcVF0aFAwNlBaT0tDZnlOZi9IWURJK1krVVMxMjBS?=
 =?utf-8?B?RVRRYWh5eXc1RUZPbW4vcEY3V2F6K0YyVGFFUzNEYWRxdzNoekxNb1BhYjBF?=
 =?utf-8?B?ZzU2QmtFNEVDNlVpWmwvemRTQUpaWW5Wa1VOcU4yem1sbUpYY2VhcGFRSENu?=
 =?utf-8?B?SThiTSs0L2F4dXZuMVpKQnUzRHlQazVpekJhTWRlSXFGTVhDYUI0UktiMWlN?=
 =?utf-8?B?Mmw0eVRuVWVxZnI2Y2dvbTdocC9DUFk0WHJ6cXN1RnkxNVBYaFk1TUxiR0NS?=
 =?utf-8?B?SjNURUJ5Y25SOTVCeU9QMlNyUFlDWm84VE9RelV6WVBLd0VFREtxc0F1aXhs?=
 =?utf-8?B?V0Z1VHVoT28vZGFsczRaN2Y0cWcydjVWdVY5TGdhcyt6NUtkQmdHZTZqNnpR?=
 =?utf-8?B?TXhoSzFCZUN5MmxiQkE3ckQvUmEzMGJPY0NrMmU0UzE5cmNiNGNDSDVKZFJX?=
 =?utf-8?B?OW83MGFMbGNhZkdDSGFPZ05lRGVPd2JEVTByWTFkb0FXOTMwT2dJc0RkK3Jr?=
 =?utf-8?B?NTNTSU5HZU9xMkQ2aklDRnJJbm5aYTUyWU1qMmk4c09rVGFMZEpxVW1OVzVW?=
 =?utf-8?B?WlNpU3p6Z2piWFdDb3pjTFpJTzV2cVpvY21rVjNTTkF1bXBMZjIvZ1Q1S1VQ?=
 =?utf-8?B?UVEwUlhXS3RsclJKc0tOMjVJa1N4cU9DZUVBNVdhS3JHaTUyOWMzUGxKSzAz?=
 =?utf-8?B?RStIdGpUY2QvTTYyWEZqTzZqdzVqcUNKSUxyMFVNaDI0TW1ubzNZVHAwdHRj?=
 =?utf-8?Q?ykcEpnPvnRpaMR+2iaSHu06s82QCoHwyUw+q982lJxveP?=
X-MS-Exchange-AntiSpam-MessageData-1: 1T+sc5GCBRN5Vw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af3756e-37b9-4dbe-927b-08dea29b1f2d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 07:20:26.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGcRI/ZRpm7q2g+e9wIigSx8yvSEwuWXBvWIxScfAKccoXqATaCeZ1tkSlCp3eH9TVeFNfdG8KiB3hIPIBODSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6525

On Sat Apr 25, 2026 at 3:53 PM JST, Hsiu Che Yu wrote:
> Hi Alexandre,
>
> On Sat, Apr 25, 2026 at 03:32:57PM +0900, Alexandre Courbot wrote:
>>As per the guidelines [1], "A patch should do one thing and one thing
>>only".
>>
>>These should be two separate patches.
>
> You're right, my apologies for bundling two unrelated changes together.
>
> Should I send these as two separate v2 patches, or start fresh with two n=
ew patch series?

A v2 sounds appropriate since this it is the same work, only rearranged a b=
it.

