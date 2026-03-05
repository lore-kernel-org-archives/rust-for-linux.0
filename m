Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE424468C;
	Thu,  5 Mar 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719211; cv=fail; b=WGK0M1P5AarBqpkpiRx/rNEPDaJLLkD2JK6NsIz38huqILzGAok2iIgHQxHBWed6+NjLNigXSYv3D6jj2dc620IejeiTNAuxkrzQ/0e4smiJhHcJf8aZ96os058Iq+bIAxg1v20I9D2EStNhLTBqejRejZ5613H0ymWyIYR3QYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719211; c=relaxed/simple;
	bh=cOJkaR8MuELAViq7AWtp52ElBFzJsxQHGgMW+GYx0PI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VZl5/TC/6jfbUnDF0O9851wEGv9jmDE61uMH7PaFbDkPjIMyVNmbJDh/1lJuIExGZcfQ+JX6UUWbOTfBY+cbIMc/n2gD6iWwL5/BTR87isBbvk86VVGm/lQewIlyWvTT/lfzS+6zvISfJIXd5J0TZ1F8z6MSgaEfQ8zU1eBYUy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LJ3XsLKy; arc=fail smtp.client-ip=40.107.209.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJ3XsLKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQw/cIizm/KXWfwjT9UfrJiyMuXK56Ahl0pGNHayWPlxKaAFdJh0FN+3GclyobRAH5lGtm2NHPQyufzN/yUnMOecCeRztewqLUTxIonBlIZcB2ISEZR4HCkpP3QwkHpI10cpC/eg4jAgDfhB04/IUS7tklx4CSBLdq6j7/P9MA4SdWnPs8/SV5QRH26W4G49VfYw+5dnAT9fJDgbJDyle5qzLiwhEtauQ3IHTUxSd58qRChw0reMbHXud7HOgXlPQd7zWxNQPoXpnSGmyqdvOc7b1J9Uu7Jc/tDnb57/9at1lZtvUOQ2JgQwpJsGVi5JgBYUYARAd/3iUzzjlkf3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cddTlUmNQ/460gUPHR3IhNWEM/lQTJcwTL0WKDWazPU=;
 b=cSuVomwelclD0l0GILV4Ms+fbxEwFSDgIF+ZnirnCgdBgkLlZm4eSOpiAXJ1in1ahGwzf6ADxXZz1CKGq69qDMZ7gSkU62lgVn/FYc/wUctx4I/O03Qhf4VijzGxE0SS9tHzMj2DRvjeZO6Oy2JGARaexi8tfXWaUPMMj2YI7mY/hWp/Mkw5ItO5bIE+Bz10NJjCifNdYOStbcVbhwDzpVM6PE9cGiKfclHiMgDk4rs7QvE/pvm3PQbhZbKZDgVLdAycWn3k6eNxMzN3ldTzGOZOE4ztYVwu1aMTJ4fa4DR100XeWzI5jPBeHt2L6pdhihXr+Eiq5UZALezd6zFBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cddTlUmNQ/460gUPHR3IhNWEM/lQTJcwTL0WKDWazPU=;
 b=LJ3XsLKyOeKU+8JZ5jcBYH/0Mwe0WzTViHxHiBJ2zzP610Kh8r5O4PGqR/Ftu0TqJWG9rJP7fipy7PUCY3J1FrYGLQZY2LXPIYcNOg6IhqBS6PRffwtBddjRVr7Hq3A8fSBVeLqt/Ecz5ZnfkEvZ8LWxyobFoKqt1reLW8ytuUVD73sNzMxhs71rorDWvnmhhAIpFgIcAiCzIZti1y7z6HC8l/Nq7niqhHdyPzRHYk/1137v/zjqyK5ePjZKh49bem3lZ1zMxBw7EuNfgjR5iLj1TSh+0rBTwcMRrzhBAMTe7o0ZPHKl3SZNbcgnHgAi4aj41+V4kAa8jFQDP/+ptw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 14:00:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 14:00:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 22:59:58 +0900
Message-Id: <DGUWID9C75CR.5V8H58RTA0FJ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
 <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
 <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
 <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
 <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
In-Reply-To: <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
X-ClientProxiedBy: TY4P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ddd0b2-e329-42b3-cd27-08de7abf7ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	7AhW+ui6NhdRViLGAW0t/xsuOf/KkijqdZJ0yddP/hUymYa8XWMbYr0FkUtEbI093os3QB/DTIabWMz7zb10+ugdmNiwTF13OwAqYAibaV1KNXvbMSOFAzxr4Ilzisj0GdTtfbOXC4A9tWYrce8Hb7h8ZnHOH38RKkeV2cvyJYI52waLtBcKuysTreJNdnFl8+PaVAXL6SjJsgoM563zbtnCwqHbDe8WXHAmzaXv0+eHdug2nxurZ6NqTzTbZm32BEqHIt06aaZhCrC/qD7xf2Xww3l//q34YirbPIamWMV0opI3AlznJwTU7o/g5Bih4A8IQV7trKyCQs84ayIJoi07X77VvSEcIcUz0om2Cq3BcTkwUWG8N0HCJqu6iiL2p1S9DEw2tpaVb9GXZm8j2nldzMcN1pk5Vd+LJJrzrAw4Wk28/tcsw3ZdSzttaoBh8Hp5p5s0E+TVqEujn8ZB2Tp7ve/8Z3lu9sry8sEuUf58uX7l4OCjLyGiTuTge0zwy2J3OsPWWsM/2euB+MiVrchdSpyQkKkYzFZ43G5DVudj4/T5nnvCU++2m4OUqrVosvlmEvCRP/sDm9XOSt7pxlMf+4soyUCzBPvix4gkpHGf85Vvpx64QxoMlOe5eXc3KHdsZZ+z/URpLIQZDyacCx7HWotcg8jC/swL2c6kPYczXtq/JotQPNAJjp8Ncd+fwbThIpONCFKDmP0198AmFSnbuj/jN6iZEnyw2pZVZJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFDUldiSi9yMHhndStyTDFDa2hQNmd3Wm5DZERzTWoxL0FBamFMU3JzQUpj?=
 =?utf-8?B?aFc0YUI4UFluck50YnN0bnI2dHhPMnZvNWh4NEhUVHMvTTRidnIrWExONjdK?=
 =?utf-8?B?MVg2cFIzaC9kY0lBTkhRM2ppQ21TTFVIMVBUd3l0TU1BQ09lSm5rcmtvamlu?=
 =?utf-8?B?VXJYTWovd1V2aDlYQzc0ejV6K25CTlBwOXFPTmtTU2RmMFd3UFhqRS9Pc1dz?=
 =?utf-8?B?M01pYUs0Vzl0SUVZdWIxeVVycHpmcGcxVzB0UVlBOVR1Y2w5NTdqQnYycnhn?=
 =?utf-8?B?OXY4aTErZTVlbmxpTEsrNnB6T2dDUDlRcUdieTg4NDg0Nno3ZHFVZzdsL3VB?=
 =?utf-8?B?TTRRbDcvYjNIb1c0RllIRjh1RklGM3hNOXA1WW9MTjVwNnpmSmx4WmdhVWN1?=
 =?utf-8?B?elpyaDg2Q2VUTUtzV2NqQ2hxckk4MmFMZHp1TTgwUGhZQ29yckp5UE1JbENV?=
 =?utf-8?B?VGZRYVVOdUlNUm1IblBDNTNUSUlxOEpBZnBMQWdMOUw5QTZKUjQ4alJ6dHZy?=
 =?utf-8?B?N3c4c2pzMVovSHBia2c2SFZsYXJ4VzY4SGV3UUlQSWxjR1ZneldCM0FTbDNV?=
 =?utf-8?B?eDM1WlhVbXRvd1R5dXp5WXMreGZoc0tVaGFEbEdyWnhiSFZTTmJ4TE1zcGVI?=
 =?utf-8?B?NXUveVlTMDVHSlNDb21nT1dzelQzQjhISEtlTFJheS9tUkF6NVJSRmZaUFlX?=
 =?utf-8?B?NnFlMytjNXppdjEyS0grN1ZNbFJ3am5KeGNob3ZUQkgvazlxM1RITGtUMkFP?=
 =?utf-8?B?bzVuaFF2UUZ3WExQQUhmazhsZGJNWFdzNkZmemQ3cXlvYVMrb0E2SENMa0ky?=
 =?utf-8?B?bXpEU2pqak9qMDNhVE5RU0xmUkNqbUZQRFBzTUFUYkZYZVIzcWhCZHRqL2Rq?=
 =?utf-8?B?ZysyQXdhZjVMWVlkN3NBUVEvanc3QkVVRzZQZHRFVEVBeTg0NnlPSlZSYTB2?=
 =?utf-8?B?Zm9ad28ybnZUNzgzeTJ6ZzYyVVBIam5rcGkrVUdZUDR5NHcyMXRmQi9VaE9P?=
 =?utf-8?B?RWxHTGkzSThhYVRuaFhPTnRzTXI5Y2NpVC9PUmJlTkd2ZnQ4b2FtVFlDL2hN?=
 =?utf-8?B?NTlXYU1RN2tDaVZGRTI0aE9BeWhMa1pvQW0vbG9OSEFFQ2FvQ0JPa0w1eGJz?=
 =?utf-8?B?cm5reE1HZ3M5ZEVMOCtjeWZ5bWpDK0NaaVJ6SFZXS3JNTTdZeUs5aXpLeFR1?=
 =?utf-8?B?R2dlUjNFUFdSdUpqU0oyeHNjeC83aXZMQlRwa3JuMk1XVHV0dHNmN21qVFF2?=
 =?utf-8?B?U0M5c2JrRm1NRWRYR0RTVVN4QnVvU1Zrc0RtU0F5UGo2elRsMWRHcUxPdHNx?=
 =?utf-8?B?cThwSW1VT2lYQzdteGtId0w0R3FFVDdSRDRaSGNKRk1lT3A5b3lEc05FVDVU?=
 =?utf-8?B?ZFlGbkdkUTk4TS92K3VEeUV5aFRSNUNqNUYzRlBYdFd0MEZsRDZuMGdoQUt3?=
 =?utf-8?B?S2MwODNraHJ6ditsdklsSXRCOW1rYUhRczJvTm9vUVpMeFc0QVA5aldOaG5Y?=
 =?utf-8?B?VjFZaStpUHFJYzIwVk9sdUdockxLWkIrV0Ftdit1eStPWWhHZy8zRno0NEZM?=
 =?utf-8?B?NThaZE9XTmdJU2tTZW1kNjhMSUxzQmFmRWpMU1A4ckQ5eGVuQ0FFL1gyd3Fu?=
 =?utf-8?B?M2E1cHgxeGFKNk1WcXZUbENqWTAvenJMcFVSNWhFQTk5SHN2Ni9OS1JCQyt5?=
 =?utf-8?B?dUN6SEV2TUgyNkFZK2w0dU1vL2dsTkEwSTMyektwTmVXS3BlSHRUNzJhQmZm?=
 =?utf-8?B?Z2FVeFJLL2VMUHhOVDlaMlJEME9zd2l3ckRUUUxmWkVoM0UzSFV6NjZXTEtM?=
 =?utf-8?B?NVB6blVSdy90MVZmMkpWR3U3WU1mY0F5YUQ5WDZEVURkM1JDVHVCOGpWSUtY?=
 =?utf-8?B?S01KeFFocjMydjR5VTRNQjhvZVVWTlFqSHpGY3lRd2tGTzV6Q3NvQThIWkdr?=
 =?utf-8?B?Z05yUHRSVkRMckhReFZQNE4xb2J5Rll6Q1o5QWV0REhzMXErWFEzcWoyZDd2?=
 =?utf-8?B?eUxyMkpHWkJhTXk2OVZyWnJEMnpGSldkS1RaNjRsZXdMbkt0MkFBWkJ2UVBn?=
 =?utf-8?B?MGlIRGxIVTBZeXk5WUpleGhjdm5STUhsYkhYcmxidkxIV291em42VUtxWjRt?=
 =?utf-8?B?UytobzROU0RnK1ZzV1NqWHlTK0ZSRFJ6S3YzdkhFN1E2TThjZVU5OXhuRGRx?=
 =?utf-8?B?YzJiNWdxdndyUFNtN09SL0k1S01aRXdpQ3NhYlkyVVgxazUxZkR6Y0dydU5u?=
 =?utf-8?B?WWNoMkxxbEpqNThjZUd0aW5xSmY5dHZMSjZuTTJQTTMyRENyb1hiSGZOdlp1?=
 =?utf-8?B?dHBUcjR4UDNnNEk3WGMwalVBMjV0cVpXOXV5by9rVU9McEVXT3lJem1oaTRw?=
 =?utf-8?Q?CYbfnvjVHZzcmyK3rQdj9DGwML5rZ0DBbrsdb2kzKRC8d?=
X-MS-Exchange-AntiSpam-MessageData-1: UXA0jcZnL0iX8w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ddd0b2-e329-42b3-cd27-08de7abf7ee1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:00:02.3428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdbxZT3s6ksA0Q6qm2yBsWMRp1S0gW3JOhUET60ur9tG4Q7ryBZ7Pp4LjUXxufpgCmeAdwU1tCC4wsWIyq4FnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191

On Thu Mar 5, 2026 at 9:28 PM JST, Gary Guo wrote:
>>
>>   const TEST_ALIGN: usize =3D const_align_up::<256, 10>();
>>
>> This uses purely const asserts, but you have to work with two `usize`
>> arguments. The version below looks a bit nicer as it leverages the
>> power-of-two invariant of `Alignment`:
>>
>>   impl Alignment {
>>       const fn const_align_up(self, value: usize) -> usize {
>>           build_assert!(value <=3D usize::MAX - !self.mask());
>>
>>           (value + !self.mask()) & self.mask()
>>       }
>
> This is fine, too, although I think just returning an `Option` and ask us=
er to
> unwrap it in const eval is better.

Why? Aren't unwraps something we want to avoid?

We already have fallible methods for non-const contexts, so why give
another method that essentially behaves the same when we want to use it
in scenarios where we know the result will be successful anyway?
