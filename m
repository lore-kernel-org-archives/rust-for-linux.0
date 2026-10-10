Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45060285061;
	Sat, 10 Oct 2026 02:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600041; cv=fail; b=jXUkPjr8EqxgKEwdTG0CBCynczIQIx4J1IlvEv2dkcDa50pQoka5FZGtmxfNnaVOMJVtfLkutZ30LL5e+4bcjmYL3j8wkVL345fzIve0We8pptwN5ue8fjM0983rDe6v6xVaQhZsA0gZtLmVVseFn2PVpjK72JsmaQCVVgSm6n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600041; c=relaxed/simple;
	bh=ofUMyENCcRr1dpEBAWXw89C0tOa5Yr+Jy+hfUp/2zSM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=U9SLu3AOemCydrbYKmBpvjsr3/ZTmftOEHeAEbZkwEVPkFrkxkgXUaJK+fxP9Jbxbwg01SlfCWAjLU/CmULNhNyMiMjQwWwg7D3JcIr5I8oWBjfNfT8TdDiywLzrfPg62m38BZL0JWrZhyYjGGchhM9fpFYCmd92azvh1WwdeOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ctUqT6cr; arc=fail smtp.client-ip=52.101.52.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ctUqT6cr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otToe7kCqCjKZ0NsK7nstRyXCEQgK8n2WCnmIAiI0JJqQ8VlKuAxvfKuBWCX+XJGyoF92kLHfZeJJIhlEkTA/kVQiS5UAUYAtljheKQwLaaAAxF5DHhYSgoEzonEJyqjmuAXSI6/jJiw8HkeT0Cc3rlJEj808G4qhq/n7tZG011gmS7ky63KlAh/7UIdmNmoM4Z0fnHCtDf2n5Q8o7IWE6RN/dV/jmXQ9TDDKmKEu2y2Ra5V0fNA3Iacuyf1HpEiFiVmoDoVY5L7Wntl1JTz93oPrqX/fUfcaFmC7PozOmQDWI2lln8IGJdTKJ0gjRpRu9qw2T8v56aNBWhKyFLgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2bargDDIKPKExO8l6qZW3tyFqlpuCW29J7GnfHysUA=;
 b=lz6zHQf2wUqWblb+RE1oi2beg80M4qZ8TdpN/0sJAwxE8vH5WcWSZXGrWABDjEUjA4CH9dA850h8NY/xjFvOUQGwgxn+6gttgXOC++rbB2QoxVTr76IYB3nsOyfzAV8tl5gdaFAPu7OBWD2LsnfkYSb3nqESXAu1KlHBhrAmcn7kbrcwqPw4m5pAMI0UAhTlY8PcBjX5lgrgTffNqNPTQo6VclNuw7urBPQfVdcy5M86NX+/0WrxR8tC+fgebb8s68CuDfXTnAVjAU8QmTwUUdkQbht8BmEaNdukutVCgJGyaoTadaK1dgaL/jmnZ61vAydOcAdC5m+McsdDfL2UwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2bargDDIKPKExO8l6qZW3tyFqlpuCW29J7GnfHysUA=;
 b=ctUqT6crlJkYlUj6TmbkKPOydCgHJDThHFXOttQUIGamm+pgXvM98Cga5HLhyZQLAbKRv+rGnBo2ZqHguHZ0cHDe0ccPL899Hf15CrNyAzDeinz+acoXyeqP+wlnVXVP5qR3mYPGzl5ntkeI5FyI/b1QqLBYh3l0oIEhOnb8r2k3ynxsMZlUU7s6t+8cd4JwdSHKhx1K0r8Te7rpx6662BAi7GfWOhr77Jy69kdq7J0r6XuCR9WVsYYVaX2HhP4ANPDS2503qtMAPdHCG3q0UqojX9ih3lC2M7sLmtmUisw6ERAWN9PyyCn6nOMgxvnycl9fJQkfCBg4qmfqOJYTQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 02:40:33 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 02:40:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 11:40:30 +0900
Message-Id: <DM0T7FHCSQUD.2SEUSVP1QJUXQ@nvidia.com>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in
 strcpy_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Thorsten Blum" <blum@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261008061326.177841-2-blum@kernel.org>
 <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com> <asflx_blsGkQ7Obn@kernel.org>
 <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
 <DM0C9ZEJA9EF.12IOGM4R4QG3E@nvidia.com>
 <DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo.net>
In-Reply-To: <DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo.net>
X-ClientProxiedBy: OS7PR01CA0239.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::17) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: b3333357-e05b-4094-3fa1-08df2677db1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|23010399003|11063799006|56012099006|5023799004|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CRSw0hSZlRzm+VcTy8lx/T+Xaa+078320essgB4DhW/aIDTAAfH/P8RbjMZtBU2RlpR0c+xIJTMxXQ5PbwIhuuRGFPZITGClXxAvmPeUXAU2OuRStwsm0l9E4q6EDypURdrc4DFcWlUH3XtGQcGX1GFs8geVWRfNo5oAoPdadbQ81oR4kyprQ9ldj8u6wajs2V3Go7AWTkotZZ7YrjoZnpAideHsJvFVe8GYabToWhPCHUYETkiFmsCthEcxT+tQx28KDqa3aeLkgSAM9YP53EBErv5RA9Cmlw9aspaqioeVA5AdLnqzE2WxtHlADJmOFUxP+dtpdXffb24EQgfknZwqrHvkuuNTEufxkfp3P5fwK7bLuDQb79XKm5sXcK3goL61CjjOMG96Z8BW3dY3KR+PvKTP97ug6X5gL5l2FrAawWPppWIy4ckMHX9rzPT8Rq+6sn0lKiZiqF3cQRpXwo2Lqgc8rg5lBA31hWT0v8ziRbura+FFbijDR5dXrOngGwdkc03ps2QEi1rNQRLc7EM12LKcyhLXEV4cpVNuhJ+tSC0Q+nOpmlaLysrk2x8aazuvyhppL6Ad2BJygQFU/JvbLKaAQDOSko6S6uJpdlUUvtlNi/EVOCFNldsdXuFlVpn34grGjrOkibmRCOR+/ZJGEMy+Sj0FGaztjra1PTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(23010399003)(11063799006)(56012099006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhOUGJDQndDanVud1JGVmxKYmsySnRHbGpVeENPblJTdnFNK242U3J2L3Ba?=
 =?utf-8?B?T0pyZ3hjTlR6bWJGMkFBQWxNWUQramJIeG1GbEQydmE4aHFFeC94bEVkMk9L?=
 =?utf-8?B?blNoQ0NUeEZBWE9zT1I2ZmhaKzdHeVA4QzdDaS9vaXpERjU3VHJoYlpraVI0?=
 =?utf-8?B?cG5NVkRXcytqaWV3bFNOVWRvaTBpc2ViQmJ5OHEwd2Zjc1NmYStVWFJHeDU1?=
 =?utf-8?B?VUlqMit0QXB5NVVjVFArMGhIN0xZeWxSbjhWbXJoTkdmS0JXM2xGWGlXcGc3?=
 =?utf-8?B?UmZ0RmtyVFZQUW1mZFp4OVBlMHRoaTRNYmMvRStZVmxYMVdJRTZmSVcvQVc5?=
 =?utf-8?B?MkxrL3Q4R202V3FtL0lYQy9keTZiQ2xaQVlVQkxNZEV5NkNxQlFHVjNnSksz?=
 =?utf-8?B?blFTN21qSUgxTk9XbHdRbE12ZXVRMUdhWEIyeHhLYmNieGcrVDNNMFZtNE0z?=
 =?utf-8?B?VlVYM2c4dE9qcklTaEJIdHVEUUxiMDZrNmszTWNYa3VWazJERU5WVGRZc21U?=
 =?utf-8?B?Z0lLclRjNTFVdjd5Z2hHM29qbXA0QmZqbGFmODFPQ0dOcDFXLzdRQzlNa1R1?=
 =?utf-8?B?WnFCQm4xc2VsVTh1V1JNQUxsUmRjU1FNcGxJZ1hsU0lRY296MDVQdTIrNTlj?=
 =?utf-8?B?SzNMamQ1eFFyY2FLb1FyalQ0RkVQdVhNL1pzajBzRFhRZDVzVWFGT3AwbG9K?=
 =?utf-8?B?eHpIWW1qMVp6QkhpeWRybGdCemthUFFlTWZRQmNZZVdrelRZNnNpTFRDSDFi?=
 =?utf-8?B?elNiN3hTOGpwd3hZVzJSYURZaTU5ait5VThSV2V0ZklzYjlyMFNJUGhYSmVq?=
 =?utf-8?B?WnNiQjBab0x6RHAwdlF0ZTQxYzhaMFFJRFVHMHg2Tm5PdXpXZUd6MFYrRFRF?=
 =?utf-8?B?SzAzNHVrcUErLzU3NGNYVDBhZXQzQThtRVcrcFFua094dXhUUmVPalNMeUdm?=
 =?utf-8?B?NU9oRlBlay9nRmRlUUFFWXdGUmVqd010bmgxSGNETVlRWUZsRHl5akpKQ1BD?=
 =?utf-8?B?NndOUTlhdDRIVnJMUlhBNmhoZ0hnQkh0RHQ3VVFKc01rWnFIRzc3N3NxQXlt?=
 =?utf-8?B?dVdDM1JIUmVra1ZGbEJDYU1iTW03OGFlWlFadVdNNUNVS1NSUWRHVElVSHln?=
 =?utf-8?B?UDVsdi9sSnhoeFo2MDJnYndSRHZaQkZhdGQzYXR5SHlzZm56UEErV0EyRzN4?=
 =?utf-8?B?SFhFNjNjY2RMdnZaSCtzK2VuSmgzT25jQThhTmFyUTRHUE4rMU1qak4rMG9O?=
 =?utf-8?B?aHRreUo1T1NDUFNtL1Z6SEJ6S3QrNnM3ZElYbTExeFh5eE9PT2RRckQ3YWNR?=
 =?utf-8?B?NGcrQk8zdS91Y3A4SVoveTFCVThObDhZZkJUdWw1TkFEK1RpT3YrQzlUSUlQ?=
 =?utf-8?B?Ti9pWXBUS0o3TmU2c2ZEcDhVQlJCeFFnWVhraFE0VXJYWWRib0Q1c2RiaWhp?=
 =?utf-8?B?QkVxODBWNndVQlZCWkcvK0trLzZaQnZReUNWR3htWkFBLzFYT2J0TlVKMXJG?=
 =?utf-8?B?RjNBYWMxdDhqR0xOaDVPcW1WSmdWRWdFMnpPbmF6aDZkUGNZQWIzUEFJeGh4?=
 =?utf-8?B?YjdkYkJVbURocXgyV2pMdko0dmpRQ1ZFV0NhMEN2R2oyQWYwQURPS1ErRUkw?=
 =?utf-8?B?ZTlSTmR3bDJEZURFVk15ZE00bkxIZkNINXpHS3V0dDduQnNiMHQ3c3E4QjlZ?=
 =?utf-8?B?NTc1cFlvMDQvNUYwUWJpT0Vnb2VKckxYRTJQeXZObVJ4cEk5QURBeTBhU0tO?=
 =?utf-8?B?OTJSdlRFZXhJaDN6eERmeUQ0dnlSd09jaGlyVWNEVk9FdTdML0xRZTRtSGtt?=
 =?utf-8?B?VUQ4SU5CcHBwNTVNZ3lNeENKNStrVlJwaW1lbmhvUXY1NWw5ZU1UMDgwZWts?=
 =?utf-8?B?ZkpkdWlXTVBZT0xTL2dualk0a3plMzh5Tm5VUnVSRW54aEpRVUppUVk4S0Nx?=
 =?utf-8?B?OStqRitrVUJoZmhwcktIUnR6ZVZiMGxScVZxUDFUZDM4cC83WElIanpZb2J2?=
 =?utf-8?B?UTlaelBaZno3YTBWTmgremI1Z3ZVYjllZVgwSzdKbHgyZWFYMXIvNWJxc21N?=
 =?utf-8?B?Um1DM0djWGxXOVBaVU54cWIydWMxd2t4ampicVdwcnNZaHRaWC9yWTJqaXVU?=
 =?utf-8?B?SElxSGpoZFVYVnRsZFpNSDI2NzBRYldkTjQ1bnF5bmxvTENsb3NtQUo4dk1n?=
 =?utf-8?B?c1B2WXVCdmRrbUQyVWIycmo2OXJwb1Y0a3RuYWp4S1FGc2U1cjUxVTRzRTFU?=
 =?utf-8?B?dnBRZ2UwcVlZOVJMV1ZWdVNMSEkzc2xDOFlqWXBNbVBsRlVKZkp0V2JiS0lZ?=
 =?utf-8?B?ZjZ0ZFIvRk1OeGh6c0h3S0tPcnI4Y0gwTVhnN0NQeTJoNGFwRUozenVhaEYy?=
 =?utf-8?Q?Go0fors/BJ/eJYlDNVVEF31TfiLoA84n66QqyiKg8EWQq?=
X-MS-Exchange-AntiSpam-MessageData-1: 8ijuIDYmq6o2aw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3333357-e05b-4094-3fa1-08df2677db1b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 02:40:33.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJjZeeTko9fX5kwxXGsRoyKOFiH3XwuZYcVbmZdzAwatjSGz9/Tvy4C0zA6AnzH5GZmQwT+UwLvU3DuVWyqf/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114

On Fri Oct 9, 2026 at 11:11 PM JST, Gary Guo wrote:
> On Fri Oct 9, 2026 at 2:24 PM BST, Alexandre Courbot wrote:
>> On Fri Oct 9, 2026 at 4:23 AM JST, Gary Guo wrote:
>>> On Thu Oct 8, 2026 at 7:49 PM BST, Thorsten Blum wrote:
>>>> On Thu, Oct 08, 2026 at 10:15:49PM +0900, Alexandre Courbot wrote:
>>>>> On Thu Oct 8, 2026 at 3:13 PM JST, Thorsten Blum wrote:
>>>>> > Since strcpy_into_buf() already rejects empty buffers, use ok_or()
>>>>> > instead of unwrap_unchecked() when NUL-terminating the buffer.
>>>>> >
>>>>> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>>>>> > ---
>>>>> >  rust/kernel/uaccess.rs | 4 +---
>>>>> >  1 file changed, 1 insertion(+), 3 deletions(-)
>>>>> >
>>>>> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>>>>> > index 5f6c4d7a1a51..2a0af795e75d 100644
>>>>> > --- a/rust/kernel/uaccess.rs
>>>>> > +++ b/rust/kernel/uaccess.rs
>>>>> > @@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf m=
ut [u8]) -> Result<&'buf CStr> {
>>>>> >              // This means that we filled the buffer exactly. In th=
is case, we add a NUL-terminator
>>>>> >              // and return it. Unlike the `len < dst.len()` branch,=
 don't modify `len` because it
>>>>> >              // already represents the length including the NUL-ter=
minator.
>>>>> > -            //
>>>>> > -            // SAFETY: Due to the check at the beginning, the buff=
er is not empty.
>>>>> > -            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>>>>> > +            *buf.last_mut().ok_or(EINVAL)? =3D 0;
>>>>>=20
>>>>> I am not sure this gives us much - we are trading an unsafe statement
>>>>> that is well-controlled (enforced by the first two lines of the metho=
d)
>>>>> for a runtime check. I'd say this is working as intended here.
>>>>
>>>> I checked the generated code before and after the patch and it is
>>>> identical since the compiler is able to remove the additional check.
>>>> Therefore, this removes an unsafe block without adding runtime cost.
>>>>
>>>> It also avoids relying on the buf.is_empty() check to prevent undefine=
d
>>>> behavior.
>>>
>>> Adding an error returning path is worse for something that cannot happe=
n is
>>> worse than invoking unsafe in my opinion.
>>>
>>> Why not just unwrap?
>>>
>>>     *buf.last_mut().unwrap() =3D 0;
>>
>> I guess the author of the code decided to avoid `unwrap` for the same
>> reason they avoided a runtime error: the first two lines of the method
>> guarantee that the access is valid. Now I wish we could keep the
>> enforcing statement closer to the unsafe block relying it, but I cannot
>> find a better way to write that method. `unwrap` would just switch the
>> `SAFETY` statement for a `PANIC` one.
>>
>> Honestly I think this code is fine as it is.
>
> A `NonEmptySlice<T>` which is `[T]` but `first`/`last` can just not retur=
n
> `Option`?

I looked it up hoping it already existed. :)

That would definitely be an elegant way to solve this issue (and IMHO
should eventually become part of the standard library). This example is
actually a great illustration of the panic/unsafe/result dilemma we
discussed during Kangrejos (and yes, I'll follow-up with a proposal for
guidelines soon, sorry about the delay).

Until we have `NonEmptySlice`, I'd say the current unsafe or having a
panic are morally equivalent, so I don't see a strong justification for
this patch.
