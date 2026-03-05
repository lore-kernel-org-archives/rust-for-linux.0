Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E82970809;
	Thu,  5 Mar 2026 01:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674160; cv=fail; b=sxPr5QLYPbJFBeTewlhZWD+87M/o0fWsUE09gIpPKJDduBpk9PGPJb+PqyJCAEkDdCyyJiw1dRm8l9ZLlLS07ceru2yJxxTuIkcSu67/c2/6EgJw6wTKHH80bNuM9lFVMWWMouDdnUj7hPL0pCRL+tYMRXuJg5lpTuVV5D+W69I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674160; c=relaxed/simple;
	bh=bNOqOTwBZAEOMP4YqC9ApM5iatF0uiDWtPL4t93lRwU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ojXExNH9P6cCkBwaBKaLl/bN2peXPV8XREWpuhxbkB1ota/gVodUkveyQjTSSWGFagebs+DDJFYwbDw4r0Vxuz3Jd9aUhKh5gRx2XCo7jfOSLL7YlltkO8MnkzHdijhl0aC65Fy89QI/nnTq87cZIrofL2NCYfL54g6mKDRnWeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N5AWhO1w; arc=fail smtp.client-ip=40.93.196.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5AWhO1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWMgbmEQ5y+kTyR2zcPOof1pQRdVGg6Wlj7PyNjJ3QjCQAyuxKimwlFkrsXuaAoeIddzNF4JviNxSSB6k0dQUsVtah/zy/Li7dFE2CTq2aSaI5owWT6UszWk3L0H2koDHE9mzXEhrxNquqG/LQyN1QvHgSJLBA+7mH/BL/Mtz+hpYWAdTMX1c/KOH32T+j73+DVAzL/u3ZNCq/S5vtkRB9ufMInrg/NjuYzwHGYleOVCuO7fvF81BKVWpxLB+0H7PK20aQDyHvnU7oaje723pT4t78qBpsDizPclPLuPBV1zD5OS4R2FveKGqvND9MIWxymLvdP1Kn4SgHwWD/SFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1Q1vMQ2kWZb0Hx56bOAH4FuGaMGsRJFsCwA9O/1FOo=;
 b=BU8aITLkeiXgILHLkXRCtr8T2Rhx4Xw6WmUMlpH2IbkNDds53YYRWwZZ8DUTeHL/7t5Xt7yX+Ww9SW3FEnZNUvZj8lQw1MmGQM/LfdFZ3rjmo/hXDBJTnw/7T/gWkTWb9QkWqkFG+qCjrlcGykfOuNBfJtYUmHepVDSMMvPngXAk/ATPsYqcIqP5LAabkqFZ/D79Z4YGRJjqO9ACEfz1XeAxpJCM9e1RomDqg2pySb/dy278HMOn9Ue7jlgzO4AyfPGx/Fs7Ilh0Cu6FwHr1y0GS3V2GS0r1ZJXJw5NEkwuSEvXprI19iwkX+OAejacBK3v97v9yOyq5iZmtmdcSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1Q1vMQ2kWZb0Hx56bOAH4FuGaMGsRJFsCwA9O/1FOo=;
 b=N5AWhO1wGkX34QdO9V6HbpCuLU+iuTZdCR/fAA7a1T01VNNawLWm1vftGGOj/MmDSIqoQkihd9Gcp3zOLatV3JcSsNYnO/8wFFDHL0nAV9I/Ul7NsfYYTQ/xoQ3b325zFdg0qOycwJv2BQCE5czdqPSig3qnBMd/Urdtjp9Dxi5VlA2zS6JdS81DK/R9CJTwRpij17JI+Hpv34vUra2THYzshUoTnfjFlIUjGapkZ+rBgWnQKYgz/QojykVhdgq/9y9E8S7RYAyrD+oK+AyD9BaDPJl0l2QILTU3pA1LFCp8DxqeDk07sMVGx907Q1NJovY6mACthaPNBUlgCTL84w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL4PR12MB9479.namprd12.prod.outlook.com (2603:10b6:208:58e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 01:29:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:29:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:29:11 +0900
Message-Id: <DGUGJIQ3ZTTV.2YUMT2HODGY9R@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
 <DGU29CRUS8BB.3N1UAT96X34YZ@nvidia.com>
In-Reply-To: <DGU29CRUS8BB.3N1UAT96X34YZ@nvidia.com>
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL4PR12MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: e912287b-578d-4173-7b38-08de7a569ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	4OczASON6s60bnYkQoYDA+FEgbeCN45CF3oXS2bCdOF5mjGdKsCfjAWpFrwC2svoFCSNEEOgNOE3mHe7pQoyStWxqvY8DYScGbrb2oKaLMGMUEs5YGaIGZXxeSbfkUMI3hjmmlT5vo643aX8Ll49SyB/QPxrUpsPPAtoabxTmQ91CLLoUskSmMSillce3AP4bBD1lMQi2tbKA8UyuX2azh9H+I3zbetoU/naXtDO9esaMnpIU/EpF15XtgkT19Nd/d6IosefsxbkAgIrgZ1sOlqJZsANuz82uwY6lw+24FHZ/wA4fsEaiFhI28b7NbbOLRPt3Z3NsF2odIwOgRq8eQAzuYgLWkUMswvsItY8hbyIqvISo/3s/I/livEI/u+XVz628uCgvV7lI7jJlJtfFFXTZbBdvjAT/V+R7AFGYcWRffatAxaso5Q/cVA9GdCgjNAHGIM8OQQ4qncTnePl4BJ34uy9MaTurzniY8UfoAND5GX6DShO1TPu3SZhcKCP7rtUKKawsL+eyDzlQ/5mIddZ8irtWdpTrSWp5WlGW9g/BOErfHYZ+p1AkU8ZoR8U1C0AOrgdGNjeXdUeik9ECmsqp0tarKtU+78X223DgVvYyNN1dpfBCry6LcWCTYKX3H559SCyXfgIOhXf/l9bCdvh1sXaAgNrKZzEXfb521KEqP0rBOIL9DsE4BfKHmlPiGhSn1ffln3h9yVtKtX/rSFCqigCSGhZkvf5A1Sv3ZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEJkZTF1dHFBZlJnNjJsNjdNVlIvc1RVK0V5RHUvKzlWUVFkSWNFdlVDZDBn?=
 =?utf-8?B?cmxndWNwWU5JdTY5d01FTktnL1Zlejl3d1Vqd0xmRitMRTMwcjRaeUNmN1R5?=
 =?utf-8?B?eFdSTEc1TTlqM1R4VEF0Qks2R2lpTmozVmNsRmZxMklOSW03ajdud2kvMmVm?=
 =?utf-8?B?bDVLUE9xRWNleGhPQ0k5Q3JUSGlCL0JCQVlzZ2k1OHdnZ0VDNS9vc2pKcUdO?=
 =?utf-8?B?azI2cENYakNoOVJuS3pZT3duVHBRUXA4aUpQT0dGOGFYcG03clBQOFV2N3R1?=
 =?utf-8?B?dUo2RjNkWkVxTXFOYk9QakpHNTgvc0tuQzVJdHFtZ3A2MWJWWUR2ZjFZejJJ?=
 =?utf-8?B?UWVsS3A4d3h5Z0p0ZXdXMm9aUlFUc3pPVlN6VVNOVEQ5dEcvYzdtT1FWTVEr?=
 =?utf-8?B?UXZMZm1NeEp4NGo1UExVb29UVFMrSS9aczlnZVVCd2tmcnJpNUd5dUV6bE1K?=
 =?utf-8?B?SlJQVldXc25IL1UwSHJ2UVdyT3QzaFB2YzZUcFRjMmcxS01OUXNtajE0akpZ?=
 =?utf-8?B?RHZrN2Qwb1dqRVJWNWFHNDhwM3c0aDNKUUhYU0pUZEVDNTM0M0JjQ05qdEtz?=
 =?utf-8?B?WjBMMmYwak8rTU03RDF0ZWd4NklLYWVYai9KSzl4cnJ5Y2Ryc0MreEVoUzZP?=
 =?utf-8?B?RFNBZFNFTkpxdmx0amNWN1ZheFhhdmpqcFUzcVY4OStaZlliMkFTdWZRSkpX?=
 =?utf-8?B?WWJYdUs2SVZMNFpPTDZOM3dsWXRrNmd1a1VIOWcxRmY1NVplU3dlQXRSRkk5?=
 =?utf-8?B?aXhyTVZ0ZElPVzFBV0FOSXI1bXhhQTA1R1puSFM3c1djTStKUnlQQ1BHSVZo?=
 =?utf-8?B?SXhXQmVLRExST0padGw2M3FqNTcwU1Q4QXkvSTNIS2Z5K2crdXBTYlRZdlBv?=
 =?utf-8?B?MWlMWlpzUHlqSmw0WHVCbHpCcGtReGdycS90WXgvU0RlaDRPUHh3VjNPTm5k?=
 =?utf-8?B?MVdaYWxnS2gzdmZEMk51NEU0cmg2aUtBL3dJZXl6Nm4vamRiUlZWUThQTDB1?=
 =?utf-8?B?RG54VlBtOGZyWmRQZ21jZUNQT3BTM3VGd2lKRm9GVDlmc1YvS3NhZ28yd2tp?=
 =?utf-8?B?ckk5NHgxMkJENUlUdTNadmJ4RmY0TWc5UGlya3BMVk9zNnppVmMxcjhtV28x?=
 =?utf-8?B?ZTBYRTlIdjZGSjIzZ0drVUFWZkZ0MDhkSmNBbkY0RE4reTFUQzRxeS90dUpl?=
 =?utf-8?B?eTZWYnVTbVR0a1ZCeDdRMVBqZm9oeE4xMnNsWlh6bEhzQ1RTS3hOSm5WQkJ0?=
 =?utf-8?B?ZkhidFdQN0xHN0NPTGRvVlp3ZGtiVS8yK2o2Ry9JNkViaTdFNWh5cVdrRGk3?=
 =?utf-8?B?RHBSSEFMWFZaU2dDazF5ek56Nzd5SGNRZS82aitYclVrTUZ0Ymd2bmFwZGlX?=
 =?utf-8?B?c1JDMk1HMTB1L09PWVR1c2VwTkFSRXJDUTgyYkxsZEljVU5ua1NIZXIxanZy?=
 =?utf-8?B?MUtPcVoxY2JtckcwNlBpdzBPeUlsNTlqcFZaUEtGWFlGYm0rcXRGS2R3TlJM?=
 =?utf-8?B?QzlqN1l0K3QwMXZnYzdJaFFLektsU0VKVEF6d0V5THhwdEFGQTRrT3JaRVVt?=
 =?utf-8?B?cVlDNHJLZnBtakdwN3Q3TGdYY2pXY010SmpEK1FPUTZjYUVNdlpOZkJJaThU?=
 =?utf-8?B?Qmc3enlNVDltYXNYcDhmdnJyV283UVI2anhYNlJQcGNoTlllUTlVUUQxSS9u?=
 =?utf-8?B?QVRBZVNQYTZsSDRadVJENFR5M2JwaDVUcDBtRWVxTmVtc2R5dE5ldHV1R0xZ?=
 =?utf-8?B?WWw3T1lkcUpwSHNjVjlaZEJNSzA0YWpoVXRDQjJqRmlubnZMWHliY2lETUJY?=
 =?utf-8?B?WEpJVm8vU012MWsxak8rNzdSZnFDeklBa2l2YkNpVmhoMHc0ZzYwbi9WQmg0?=
 =?utf-8?B?cUUwVWJ3RUwwV3crKzdaS3A5Y0dqdnF1eUc3MnVITVRoRU5VbTBlWXpOdG95?=
 =?utf-8?B?T21KY3FhUTd4ZHpueXhRMW9JWCsxVkRuck56bXA3d1dLaFc0cmVjYXZPaHMw?=
 =?utf-8?B?a1V5THhCSTI2UVdDYkgwOENqVW9iMDZnWmVCOEVtL282eEd5VEt5Z0hrb0VN?=
 =?utf-8?B?Znp2SzltTUZLQjNTVnY0dUNYcXlreERtdlJCNFgydjczNElRajRzTEt0YnFG?=
 =?utf-8?B?Yk1GajE1VmVaaGd4clZWRU00UXZKMndiU1ZjK0orcFN6aWFGUWF3UEdBVjdB?=
 =?utf-8?B?Y01QK1hQNUVkNk9SRWQwT203T1g2amQwNHcwY0NoV2sxZlUydmhwRys5Umsw?=
 =?utf-8?B?NjBSeWYvZUlUZ1BydXdWZHVRTWVhbDNpSHR4cjhQN3ZzNzlnZXQ2VWZDSmdC?=
 =?utf-8?B?SUhBbFVCQnR6TDRuamVVcGpaQ0NHK0NDN0NDZkRhU25hTU5MYm13RTNDbUx2?=
 =?utf-8?Q?p/vDNxdc+pF3sU+ovzA+s2Q0nlHxSbN4179Ec3v+JgGEU?=
X-MS-Exchange-AntiSpam-MessageData-1: j99YjeJH9zhPPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e912287b-578d-4173-7b38-08de7a569ca0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:29:14.8880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m58gsfyKEAQLui6vK7RuOtl96z4j9d2bzPaD1f6R1v3tOYay+zt3lFvx+BDmpT3b6UnN7yCS1GsjZk9pbP6ypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9479

On Wed Mar 4, 2026 at 11:17 PM JST, Alexandre Courbot wrote:
> On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> <snip>
>>  /// Send the [`GetGspInfo`] command and awaits for its reply.
>>  pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGs=
pStaticInfoReply> {
>> -    cmdq.send_command(bar, GetGspStaticInfo)?;
>> -
>> -    loop {
>> -        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_T=
IMEOUT) {
>> -            Ok(info) =3D> return Ok(info),
>> -            Err(ERANGE) =3D> continue,
>> -            Err(e) =3D> return Err(e),
>> -        }
>> -    }
>> +    cmdq.send_command(bar, GetGspStaticInfo)
>
> Also noticed something cool while rebasing the unload series on top of
> this one: all these command helpers become one-liners and are not really
> needed anymore! Here we can just make `GetGspStaticInfo` public and call
> `cmdq.send_command` on it directly in `boot`. It removes a layer of
> black magic and makes it easier to understand what is going on.

I think this is ok, but we will still need some helpers (e.g. for RM
control RPCs) that mimic the structure we have here. But there are a
bunch of simple RPCs like this that can just be called without the
helper. Do you think it's better to do this and have mixed helper vs
direct call, or just go all helpers?
