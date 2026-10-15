Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CD3C2BB4;
	Thu, 15 Oct 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074820; cv=fail; b=ZN7rOCOw1srWuaL2eXwOsi0ZwfLVuEn0FDti9xkUkzZi19T+p4/r5kKD/GiT1BD0di8x5JCYnYJlKt6i/8QjYl07zOQvDtco7bCnXamTApsTMwspxh1kmKQ6nD9b0RRnPauXF/bBsdG8QTIHHL/xWL1h8z1i47NnbEzKOjGkQPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074820; c=relaxed/simple;
	bh=iM6F1I9AItUGGl6+epiy3L2ARYqiFdPRYLreWAp6JSA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tzo+N41Uv55UUeKX8LqklaFXQ1rZys8u1MfX0J1z5AwAA26ccXetfg5iAz6M42fL/IVHNebliOhUV1pqlhD4Vwuq8fCMpoJP5CFvbaXwQKnFfhpfpc3ifSXMOdJhy+EZ6Yqz//06yX3JbtutW3FdbLXPVKdaETKKfXttMOkZ+oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=doW3AL/P; arc=fail smtp.client-ip=40.107.208.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="doW3AL/P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4HZ7UNiPPl7leWPXMkEZAEA7fTxXopaM4HSQCwpL19hgGK7IUHVhNvyDTYtK9rosTgZeyhWp5UxtwhHyco2Gn6wqleNCxTuSSJ45iNRepqJUliWGNEitKekPM90l6FeIp0nuQdFigYZh8Bg9CI3yrBaRacVA8mqAaUWox/c981OjL3iVAXp2/QW6QqBf8E/jT6dFsPK/lY/Ebw+6kXHa9dFqoWpddXXH22lgTs3vCYmN1TpTaLdFH0EY1NRMz1+kPaFo1HQpu82AlQjihcr1fDi4Jas4imDvx3VEK5REhSZ4J9bTS4Yy2HFSgdDoN17r1HjRlZJRGkZSEaF55sY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvAzO8E9jhvFFnldjddoBwXWIdTdj1BqZhdttO64U8M=;
 b=G5gVGtw7zlPuXSkHl9d8khiW8Hvta7Uvk/ALuvekRSK0o/14Pjsfr4F3v4XoYX8bIblLnMlI+KUNsx5nmRmxzsLReMxQuRaL9Q5Ov7N7WeII85KMgqFLi8Xr96aCAxxsXHQHRHMBPoq5zlr2T0hAfSF8b2nM77MViD2kGjlNKVbztlQ+r9LBpFGCIXCkDJaAHPbIZ6qZabv1EC1lQVPnkKrzC5vw33u3vkogAr1Q65RDck9a8c96HbvLOw/JB4q2CLAHdmcvZ2ksg8/C951ioR8sFM/AA3XHAi2jAU8EIULS2hFoIhhSObDnhcGBhoCLHwVmgnBElOXhHn1ndheZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvAzO8E9jhvFFnldjddoBwXWIdTdj1BqZhdttO64U8M=;
 b=doW3AL/Pp1mxHeJ4HMFSR4an+HZypxBMpQdk72a5hIwi7StoU88NqhpqMMf76HER/aHj7X8RUhSGlwMWXqm5ei+eisYhJFpkCcTW6YR/Xduj7g6Qwak/0hzxzBMFgJGwkiRw+FgojWj4FmRGtCdvbQDSRdjz9/X++sUOqTD96EYKxXnoVq/zdAuMnBvAi6NWjvayES25gPl5BJDnGuButJ9vRgeG8h/LKaLSiYZzttWxdaqD+aHoJEHFOgcq1rf3AKsD4aXCTu4dMUHbfVFoc8myZ5DMDpQvKBnuaOsTb5U5zAEGb6jAL5MFzAkL/NAf+6YLIPvpsBVVDiONV/gWCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 15 Oct
 2026 14:33:19 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 14:33:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 23:33:15 +0900
Message-Id: <DM5HHVNK7NVY.3EGYSQI1J5J4O@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Lorenzo Delgado"
 <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
 <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
 <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
 <DM5F615QE0QH.MV46NZSC3TR0@nvidia.com>
 <DM5GU8594ZLL.2VNTOLDKDU2MD@garyguo.net>
In-Reply-To: <DM5GU8594ZLL.2VNTOLDKDU2MD@garyguo.net>
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0588d8b0-6a98-4bc9-898b-08df2ac94120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uRHqCqkkz2gRLsTV4GJUje2Q4hLZwGn6J6zi9SkoFq2sxfeEwvVoBEqMx0dET6+jb0ky1hzFj+9V1Ruts3fRGNr2QGCeD7/u5E6SJ5vJMyZeyYndOQsK6r8WMWeW7ii56QDLzFZorRuuELiVWQ2w/Y3RM//NvDNbHxfzUezn83H+EqEstxw1I2UN03P/8F+94xPrU150429DwtSlfs8dnfXZX4dW6G8lpdCWiJLNDHqRdqxt+erFc75ed+rL+eoJqymUVV+Yg3TCsxJSCbYdrAKwFatrcPLju9dApDq9siTYK2J8JkqMPMlfbuVFgTY45X3ZMjFSnbu6JgyTpeK5oN1VFzXKVXlAbUG/KVRx9goEP+X9pGEMkYv5XqYvXpNAikfTik2zNNCZFlyV74pIG1wXIEjVe8hWm/x77ZNSV9wblQbMdIpM+LV5Brwt1/vwqDAx2IILqsolP/yey8QsgiIKayMsM2oZVOs3MH1a2F+UwVicohcTRlg8FTxP+hnLIfwp4mnDTdhBRuNUIiAStQtPGr0ODm8Fa1wy5W9fWEPQhQOLrnC/qqhSUlcfUeR04lGJhWX+rDjtUddieS2rAVwI9paKiq/X5MNEi0Dm1iT7AbeBcvgftAOqDScMHb84+2pTDhWGqicFCArzSb6+Pk7Geyhzx4s7MjVb2U8a30g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkM2SXg1SkVUSjZqQUlNV0JHSnhHUVBYV2gyYVJYTDlzS2tzcXd6TGJTLzlS?=
 =?utf-8?B?MDk3MjBJV0ljVjA5di8xWFVWdkpTT3NlZUZnL21KamF4YkRrWjM5NGlWeHB6?=
 =?utf-8?B?M1Y5bTBmQ2JUcVFSVjd2MUNyWStKeWkyNlBuUGt1ZzJqUkNQYnBvQytoRW9q?=
 =?utf-8?B?Rnh6ZFBsaFhQSW1hWkI2bVdoRmNHSHBTRTdac3BGUVVVdnBNSUtpOCsrT3E2?=
 =?utf-8?B?aWw2elZmUGJmQU9NQ1ZLckQ4Vk54VWw0cTd4amhRNVB6c3l1SGJoMHV6M2Js?=
 =?utf-8?B?dHlUUndjTTZDMTZUUjFGRjQyQ3lyTW42ZU1qZFRyS3ZkdFJjKy9WMStIT3Aw?=
 =?utf-8?B?OW1FYktnWG83Mm5VaEdrNzJSNDh2RXdSWGJpQVBuZytYa0xPSFpiUHhhdVpo?=
 =?utf-8?B?dFpHYlphNm9Oa3hQZ2hmWDdsWUFXSFFZb1I2SWU1Mzh6RXY5Tnh2TzVGdUl2?=
 =?utf-8?B?VGFVR29OWm5hclhscFdvWllSYmd2UXhvYlZXVW8rQVJ4Sll3STM4S2ZBUlIr?=
 =?utf-8?B?Q290V1ErZGczTERyTERUeHRSUE5BTjVKMGNhdmtoMzhXK2tWS1ZDRUg5VWtx?=
 =?utf-8?B?Um0wemN6Z25UeUtseDRYWVNJc2ZzWGlPUHB2VTV0MTltWnZPS0RnVHc2SHBT?=
 =?utf-8?B?cE9SR2xuMm81NHUwbUZ2bCtxWlZ6Zm9CWmpFM2FUNDNmK3NFRFd4NUJFeitw?=
 =?utf-8?B?eC9CNzFPam4rY3dBZnZMVWxsb2VvU0czcWliU1hrNFFwOFBQUnhVY0NMUVpw?=
 =?utf-8?B?NG84OUM2OWNkbjh3SlpPUC9oMDFBaUk1a29jVTFBcU4wZHN6UVVuaENqcS9j?=
 =?utf-8?B?L2ZSM2lKOGZhaHVRbWtYM3EyaGJ6V1JUOFNXekFzUzAwSjBxejRNbmNGUnJY?=
 =?utf-8?B?RHNkU1I3aHIwZXpIZUl1Ky9KQmljTjBVOUlIME9Qb3NrL2plRFZlcVpaaHVF?=
 =?utf-8?B?NHRyb1UwTHNoV3BKYlBkcTNZd1QrN1NZdTcxclB5clNZcEpZQmxUVldIaGRM?=
 =?utf-8?B?dFFKSHY1WlY3Vnk2SHpqeStUVHVDY2ZjL0I1SkpVcEhCZGxnOHNzMmczOE9T?=
 =?utf-8?B?cmg5RUhnWWJrT09zY2YxUVRFaGZFcWFtd3dYMkV1Sk9UZGg5TzJqTStUMlJJ?=
 =?utf-8?B?NXA2eDAzMVZ2ckFlVTNDRlFZVHRqdzlqMnZCTkRIYnhjd05zSmxRZkpUd1NG?=
 =?utf-8?B?aEhRcWo4bHU1d1pRRVhiYzVsRElaWSt4b1liTDdlcnJFMG1ORUdocUV3cHoz?=
 =?utf-8?B?aDZwNGxxVmxFNGlJOUFRQldCYm9zRFFTeHg3YmlyUXRUYVNWL0tkQktYN3dn?=
 =?utf-8?B?Q1hINnNoVEpabWRUdGphb0FiWHNhTFhDcU9KVXZzRWthbTQrSXB3V1BKSjc5?=
 =?utf-8?B?UEh5ZFgwZnlqVWg5UzNwN2FnaWI3RU9GY1F6amR5Q1lyakhlbEVndVJ2WWt3?=
 =?utf-8?B?WmhRV0J3a1NHazRHbzRPblZyTk0rZWlacm1Yd2ZWbFRkbExCVGlOcEpML0Ey?=
 =?utf-8?B?Z1lTZXAvcW5sK3RpQWJYZmdBa3pwb1JMZi9VRytsL3hpaFRROW5WZVdxeGVw?=
 =?utf-8?B?YjdYVC9oSFdQcEFvczNKZXkrSjNEenROUytEaldsdUxjUnE0NjJ2UDZJd0tK?=
 =?utf-8?B?RGZPYVFyYmRtdlg2UEY4YWh4QmozRHN2U3FsKzA4aXpmSHVERzd4Y0xnWkpi?=
 =?utf-8?B?NVZxWHRqTWlpbGg3eFZMZWY0aTlIRnZrcnZkSGgvOHdXYUpRUlp4VWNLY2tw?=
 =?utf-8?B?d1d6ampuN3VwYmlmRDUycmFlMjRjZk1yVks5SFNBdnVyV1QvSXNMSW1xQmhP?=
 =?utf-8?B?SDF0QjBWZ1N2UGhxc1JRcXFWV0F2bjNlUGtKSWt0OCswanVZbHVFei9vdHNv?=
 =?utf-8?B?dXFUOEF2U1hQWE43Y0V1aXJnenduUGZIZERMUTB4eU9vM0Vtd0ROQ2YxUkl4?=
 =?utf-8?B?a1d4aVVmTyt0R0VVc2RtVXFybHF5UzV1ZkYzNm50MnNZOXhqZGNaaGxFYjVl?=
 =?utf-8?B?dGxuWUhlTkVJOFlJdU04ZWlzd3o0ZW50bHVyNC9qeHc1S3IwK01KbENDQ3N3?=
 =?utf-8?B?b0hMQktGcTNRSzAzd0krRVN0T0U2S21DaVgyaUpHYjVzMU5DdW55NjBja0lo?=
 =?utf-8?B?VWEwbklzbDEzZHNCZm5PTVlmZmdPLy8zZXh3R1RHK0ZnSUFGUWlOTTRqU3dR?=
 =?utf-8?B?Z3NpazBOd0VhdFFuUEhTa0dhcThWeFduYlFVTEQzUkZFaCt1WFdxWHJ0eGhq?=
 =?utf-8?B?cWtmZGs4TFA5WlB3UjZUWVJ1bE1yekhhRGVyOGRJWSthaWdKWjB0cjUyaWpM?=
 =?utf-8?B?bjNOcVdGK1FYemI5TzUzY2FUN2ZoUllyL2laZGY3V3paR3dBS3J0cG0wSFR2?=
 =?utf-8?Q?s+irGsAJNwxujbCmmMS5/kQqt87q42XeZJw0D+IPkPpOC?=
X-MS-Exchange-AntiSpam-MessageData-1: L77C/8b3QC1nag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0588d8b0-6a98-4bc9-898b-08df2ac94120
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:33:18.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxz9ScHg6ka97+mQvuYVlPNYes+UdnrU80asGkqHpb2XM98QROGeXrYFVTByNBbTuVGP5XNFB/KQYqmZckAYyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425

On Thu Oct 15, 2026 at 11:02 PM JST, Gary Guo wrote:
> On Thu Oct 15, 2026 at 1:43 PM BST, Alexandre Courbot wrote:
>> On Wed Oct 14, 2026 at 11:25 PM JST, Gary Guo wrote:
>>> On Wed Oct 14, 2026 at 12:55 PM BST, Miguel Ojeda wrote:
>>>> On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Lorenzo Delgado <lnsdev@proto=
n.me> wrote:
>>>>>
>>>>> +/// A container that can report whether it holds any element.
>>>>> +///
>>>>> +/// The result must not change while the container is only reachable=
 through a shared reference.
>>>>> +///
>>>>> +/// Unsafe code may only rely on the result for a container type who=
se implementation it trusts,
>>>>> +/// such as the ones in this module, since a safe implementation can=
 return anything.
>>>>> +pub trait IsEmpty {
>>>>> +    /// Returns `true` if the container holds no element.
>>>>> +    fn is_empty(&self) -> bool;
>>>>> +}
>>>>
>>>> Do we need this to be a safe trait? If it is unsafe, then we can
>>>> simplify the invariant and more easily think about the type, like
>>>> other `Non*`s, no?
>>>
>>> I think in this case the meaning of "empty" depends on the container it=
self.
>>> Unsafe code that relies on "is_empty" would be the `NonEmpty<Container>=
` itself,
>>> so it just needs to trust itself (as boundary of unsafe is module level=
).
>>>
>>> I think of almost all of the text above can be removed. The invariant o=
f
>>> `NonEmpty` can just be "`IsEmpty::is_empty` has returned true" and how =
it is
>>> interpreted is up to the container type.
>>
>> Is `IsEmpty` actually useful? It needs to be implemented for every
>> container we want to wrap with essentially the same boilerplate code,
>> which looks a bit overkill to me. Couldn't we just do:
>>
>>   impl<T, C: Deref<Target =3D [T]>> NonEmpty<C>
>
> Slice does not dereference to a slice, and arrays doesn't dereference to =
slices
> either.

How about `C: AsRef<[T]>` (would require an implementation for `KVec`)
or `C: Borrow<[T]>`?
