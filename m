Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022111.outbound.protection.outlook.com [52.101.101.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F755C32F;
	Tue, 22 Sep 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091463; cv=fail; b=i6uUYZqpu3JwzSj1KcdoWsdRQtXAJeLIzrdDD1sUYEoA1B7oLQ/EOMUC4dAGblSs6qKTp1GkCLw8uwA9VYVosswhzzyIEeYKjvhMTdzqPd4tTdyc/0RpWWkG3R2dayPOGCYSy4/cMHQ1wiLU9m7ECzFMm1RICW4yDrpxt0vdVrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091463; c=relaxed/simple;
	bh=mau5cDpQLaEQN5rMvbDRh/8YtYHYmbPwBtPQ9u7/TIc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=I7ndHQ8R1wknBHOu/V4z4PSFGMoiHDSme6w/O+j6n09RvRDCa2LVqk/k9QlmLPRXJc9KrykofUv3ZRGPqo+nw2+LbhADELKSU6p28ZZhntYu27EKCDXO20tvhcJ8fiuYtw4zrwikR6cCPQjGDK/FhSZlQWhsZLWr62I+SPjvWPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Y1MtQqvW; arc=fail smtp.client-ip=52.101.101.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Y1MtQqvW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNrNXk/VOps9VRKkZR+zf2/d0zwMqBAiLkFjrUIDoEzqCx5SWBo1nAdDMikgc4JFNBZ4hJI//3OAN+0IlrWZPozqoqPnoUf645sTTJk6vVw7zQTYvEoXfLooEG6/GJWCOi4M3c6+rDKCU8SkiEz8FK675bdEmG5psD4EJeG0ixkqNAX75UvlYPqap3D4SD6pzHXe8T8DxwC3uIqHWX8V9gVqYNEIAV6R2BNmFMEDVYrnZlN/FxLxBEwbMdqOWJ8k0ARUGS6T+PnlghlTcDXM4jATKTb/V030fXeV/YHYh/nK2b4ouOvAmXpqD2bS/GiUSFvlqHrmwo6+6oH9DLJ7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evWQJTWNRQLy0hou3DXU+YNFrRYdwMyP6KOF2yugy6Y=;
 b=sQkoGxCyU7NOpj0fpE7NUjJW3IKEnnLe5XmKolfQ1OIPg7BON/PE6AK3AlifYOiW09wmmX4DI/VsoA9t0IUTbshUF56e1AT8ARJ4Ic4BE6doTueIDXrgVSVPYm+6HGyC2fYhTsoAXBnS0iJ9HvJfuDSq4GwUNmx0ZKVMPdtNvU4lUhsQ3RRAUN4Mz1DIhg/k/IsueknoYicRe/iMapf/55xKvOfQivo8bjYrJkr/K6j2bfnJxi0L/CgQK6niIrmeJo8IeQZUS/9Ub6hXN24Z4f10NU04odC9DLbfcdYISFuKZnP7hLb/orMyFndy4podpOcLOxmdbfRRL7Lknf2N6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evWQJTWNRQLy0hou3DXU+YNFrRYdwMyP6KOF2yugy6Y=;
 b=Y1MtQqvWfzsaFdaAUtUSedb+i0uGE2oHYvcoE8NvASov3QpznXtP65sSoUFKupcacMInwPiYaZcqoNdp2Ju86r3BUjPFdbNf/StEFbgNb0cdFmF0ypKkChmKCl0TfyCSayu+UMoGIoiGiYnqtgBCtse2lOErjOqzI3oMVkDEYgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOBP265MB9435.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 15:37:36 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 15:37:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 16:37:35 +0100
Message-Id: <DLLYGLVEA0R3.3D1733XFFTFPV@garyguo.net>
Subject: Re: [PATCH RFC 0/3] rust: kunit: #[should_panic] and same test name
 with different #[cfg(...)] support
From: "Gary Guo" <gary@garyguo.net>
To: "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Jori Koolstra" <jkoolstra@xs4all.nl>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Rae Moar"
 <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
 <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>
 <DLLVV64UIC5E.10C9AB66BOEXV@garyguo.net>
 <d00d6512-ec95-4337-ad62-a515b507862b@davidgow.net>
In-Reply-To: <d00d6512-ec95-4337-ad62-a515b507862b@davidgow.net>
X-ClientProxiedBy: LO4P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOBP265MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: 476519fa-9311-490d-ddb7-08df18bf6d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|23010399003|1800799024|376014|366016|5023799004|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7XukNjGLLhRQ3fB4odz5CDQoBuxChuyim4rRDp1l4d7r2LxAUCf/a6PsoSR5XE/Zk5pXWX1zl0TePlW8Gezs/4HL2QO6wVvckhtavclNNv2Rs8ILWx+X4eVNeBZgtD4Q70yNdU6QID/BwoAMdmSJmuPJ898dCVQRfjUr+nH3DR8CfcGmm+189NsMjl1Uj7JNc/3Qt7n/XvHKWWkntL1JDNVIowGR6YRjsZ8tar4nWKSXK3C5zmUJNzoUwPbw0GtM/WHinofgF4jlkaH5YR304AtTOCXSG9mRbL7ifjfUV2TbTubVger44ulpbz6b0nvPrQew0dKR3s9rZhCsRe/saFha0bxico2AyGeaFII26wCBpjwdfwtbKE8572PSw9AzTFnSHNcNWQVYDr+874h+i8KuMZ5PjjAvsZCNIiJ/T+QyQwLbTwLweCVtas4L3bIZqJ4Fpatp5DDPLlPUfW9+FxTa/2oYLUCbC/Q5TpBmta7MFYPECh00x6sYgNa9bV21NbZdN4MHv/E6CyxsELJ6btmiJ2rOnRUrevfDjQpc0U3Kf3X5EwLN+4Q7KnuIrqFIvZgDqgz9vFQP6WVaFXSe8bSzvotvh3Vrb9wPbMaDYwazS/OEiWL5nyhhI3+jqCnnlXsv3wrfcI7v3lsbAyGc8ukoI+h5lEdkteV0zrx4Cl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(23010399003)(1800799024)(376014)(366016)(5023799004)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2FoclBsamw4dDc2bGxuOStqWkI5WGJlMDZpRk0zVk8xY1FaOEZXUzdGZTky?=
 =?utf-8?B?UXpERVM0Y1JRcmRkZzRLd0M1VTBPdFlBMVBLWEhkM2psVjJiRGhlVjVqLytZ?=
 =?utf-8?B?T2lMeGo0c1pNVm4rSk1KMG01b3pqbHgzN0s3b2psUGVQWXZPVkNHaDVZbGkx?=
 =?utf-8?B?R3FoSHRDZy9ZY25ISjIwcS8xNWwzVUlCUlVZM3NRTFFlL2s4V0J0TnZoQmhP?=
 =?utf-8?B?d0FXRm1JY2NuR1gwSWwwY3p5TVFiQXRtdHRvZTlaVndLaUZCSVdKaUVDSENY?=
 =?utf-8?B?V3krZ1dUOVlZQ2c4RjZyU3kzeDR5N3hxbTZsNllPU0JYT0ErTmlPMERzTkFQ?=
 =?utf-8?B?NjVVQm1hODgzVkJXRjV1K1A2U3lOelBWYUZXOGZsODMyM1VWRlZOaUE0M2hy?=
 =?utf-8?B?U1VGeU00bGozUXIvanpIdEFFYmxBQVExbnhjOHRLeXN2TzhOaHEwcVh3QzFi?=
 =?utf-8?B?V1pldHRHYWhDVHlDSzVVV3ZDNW1LOE1vV3R4Q1k5V0xyQ01OWWxLM1BPODRI?=
 =?utf-8?B?cERXbzl0WmFyZW8rcGtYWmU0c3VaaytEeEROenFjSEN5emJ6ckFOT3N3YUJC?=
 =?utf-8?B?d0ZkdkZ1d2JlcmNUMTJ3T2lhdmJmVy9aRW5RMDlwdjlJRkxsR3oxbURraDEr?=
 =?utf-8?B?MCs0a2tEaUpQbzgxaDM4L0MwWTBiZnV2N3FqYXo3dFRzbkZVQzdTelVNWmZ6?=
 =?utf-8?B?VmUyTUJiUzFheXNrQUs4cHdyNlVDR2t0TkxCSkRpN3htd2t3ek9qeStESnI2?=
 =?utf-8?B?T3ZRWHlBbmFPajdVdVJJZk9rNVN1SUVjbWt5bTJ3YVozNm9lR3lNaElpcWN2?=
 =?utf-8?B?eU04TnUwOEJlMnVaK3BSbmtMVUdtQmNLdHRadWZjcDlMRlk5RlVmQVd6NlVP?=
 =?utf-8?B?ejFOWGlUQ2hJc1RQL0s4K216UnVSNlE2V3R3MlZSUlV4RGxhOUFVS2tLbTR1?=
 =?utf-8?B?VmJ0dGtCM2djWlJKNkJkTnhHTVJzT0J4TFhLZTQ1UC9kdlR4YjVnalBPK1Ft?=
 =?utf-8?B?Z2VJNHllVzdHMjh1emxiVTFjNTZsc2svRjBDVDZrQ3FKajVWajEzZWQwVUV0?=
 =?utf-8?B?VUJwTjUxWVhBZURsMXZ1MHZKdGxuZEpMenZWaldJYXZ0YTR4VUhxM0dBd2NM?=
 =?utf-8?B?SUJudXV3Z1NDMVM5czhnMFk0NTZ5MExpRlUrT0pGSFNqUEZWQ1V2RnJXVHFS?=
 =?utf-8?B?RG1pUlBWdlpxL0FGNzUxYmZ5c2ZwM3k4THRMYjhGQTVHQmRqeFBUQUpkTzRN?=
 =?utf-8?B?VDY5V3MrVXRiUm45a2RzVUZ0aDhCWDZHZXhWaTZUU3BOR0NSd05IZ3NEZnpF?=
 =?utf-8?B?NEFuNVpNNm85Yi9Fc2E1MGpDbVB4N09jQjVNVXV4eFlKTlQzcHJzQlFjN0Fo?=
 =?utf-8?B?dnlCblg1S3FmQkwwZmFCWkVHcUR3UmxQQktkdFhkc2xDM0FOMldqVFpnUGFW?=
 =?utf-8?B?cS91YWdMcEJDTUFyZVd4dXVMUlpadGVvcW5CcFlqR01xanR3M3U3UjB4b3dU?=
 =?utf-8?B?anZwbXh6OVRoV0gwanA0dHUzd3I5aW5NNXpQSGU1aUVsd2MzSlJiVnQ4OFJE?=
 =?utf-8?B?Vi9DMTJWMTYxR2tZaFdZY2RYNlRCb2hOdDIwVU8wbzZLTU8yc3ZybHk3U1dZ?=
 =?utf-8?B?UzAra0FRbUJTTTBrR1RxWkdJT1MvMXJDNHdNcVJvbzdra0RwbjVMSExERXFP?=
 =?utf-8?B?bVh6MXI4cnFiL0N0T29oZi9CUHhyZlJ2U1lHdk1Bellab0RJcVUwSnkyS3Bj?=
 =?utf-8?B?cUN5OXhNWXEybHJmaGMwV1JyL21hVFZabzczNWdDTFJtVVZZUFUvc2FVL0VW?=
 =?utf-8?B?Y0dPL2NBSkVyS0MvWkF4anBybnpPWWRmVWJsd1AxMGdHWlAxb3VYelE4ZlAv?=
 =?utf-8?B?T05Dd0ZkVElVdkFOcXVoNG1FdExXT2lNdEZmRWViQXZLVzl3L0JDMHAydkFv?=
 =?utf-8?B?MURQSThWMnRBcWZteXBUVU8xeTNIZ2Q2K2w5ekl5c1dtQW8zcWQ2MFp5Yk8v?=
 =?utf-8?B?aUZFT09idEJZSVVaMjdDSEdsaGRkdVdGR3pQMVd1UlNoWFF6cUtpbXFoNll3?=
 =?utf-8?B?dkZaOUd5SG9pZGxyalpTbHp3M1lyVXpkNG1iTFd1S0JoRmN0VGVZSVNCWmZm?=
 =?utf-8?B?cjBSUUlTMWcxS3owaG5ReE9BdGZPaTRhNU1KMTVjblZ0TGhGbGtFWmV5KzJk?=
 =?utf-8?B?WXVQaWQvZ21jNjNzU2dzUzV1VmlYRWllVmNXYklGbDY1b1pYR1lvVGdtdTM5?=
 =?utf-8?B?VWViN2djS1ByQ1BzRU5pQWFkcng5Z29ud0dLTlFybWFWV3F2S29yVFNscG5M?=
 =?utf-8?B?NFVZNTBWb2JmRVpodnIxODZjdEZJVDRhOVlNY0NmM1dJNU84N0Rxdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 476519fa-9311-490d-ddb7-08df18bf6d31
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:37:36.0531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25K/2hd4JMTa/cvrmbsweq8mreHG8J6fuPj2KUIa7LXZEAJFq7+VdHpmLBOydx1jTAK//BKLkspsIU8U2sVw2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9435

On Tue Sep 22, 2026 at 4:27 PM BST, David Gow wrote:
> Le 22/09/2026 =C3=A0 21:35, Gary Guo a =C3=A9crit=C2=A0:
>> On Tue Sep 22, 2026 at 8:56 AM BST, David Gow wrote:
>>> Le 16/09/2026 =C3=A0 03:33, Nicol=C3=A1s Antinori a =C3=A9crit=C2=A0:
>>>> - Is it ok to 'stringify' the configuration so it can be distinguished
>>>>     in the report? Would you prefer something like `_case_1` `_case_2`=
 ..
>>>>     instead?
>>=20
>> I also don't like the stringifcation of cfgs.
>>=20
>>>
>>> I don't _like_ this: my preference would be for us to keep the same
>>> name, and just not emit a test_case for anything which should be
>>> compiled out with cfg. Unfortunately, implementing that is a bit harder
>>> than would be ideal: we need a way of evaluating the cfg() arguments in
>>> a proc macro, I think. (Ultimately, because otherwise there's no way of
>>> statically determining the length of the TEST_CASES array?)
>>=20
>> This is possible with a trick. In pin-init we have a similar need, so wh=
at I do
>> is for
>>=20
>>      #[macro]
>>      struct Foo {
>>          #[cfg(a)]
>>          bar: u32,
>>      }
>>=20
>> to be expanded to
>>=20
>>      #[cfg(a)]
>>      #[macro]
>>      struct Foo {
>>          bar: u32
>>      }
>>=20
>>      #[cfg(not(a))]
>>      #[macro]
>>      struct Foo {
>>      }
>>=20
>> However, for kunit I don't think that's needed. Deduplicating the names
>> should be sufficient?
>>=20
> The problem with (at least my naive implementation of) duplication is=20
> that -- while it works great for switching between implementations -- it=
=20
> doesn't handle the case where _no_ implementation is active.
>
> (The current implementation just compiles to a skipped test if the=20
> #[cfg(...)] isn't active, which sidesteps the problem until we have=20
> multiple implementations...)
>
> Even the expansion above could be problematic, as we really are trying=20
> to add entries to a static array, so I don't know what we could put in=20
> the not(a) case (particularly since there'd be potentially lots of them).
>
> Maybe the trick is to generate the array size by using a big series of=20
> something like:
> static mut TEST_CASES: [...,
> 	#[cfg(a)] 1
> 	#[cfg(not(a))]0
> 	+
> 	#[cfg(b)] 1
> 	#[cfg(not(b))]0
> 	+
> 	=E2=80=A6] =3D {
> 	#[cfg(a)] case1,
> 	#[cfg(b)] case1,
> 	=E2=80=A6
> 	}
> }
>

For array sizes, you have the option of building a slice first.

Some thing like:

    const TEST_CASES_UNIT: &[()] =3D [
        #[cfg(a)] (),
        #[cfg(b)] (),
    ];

    static mut TEST_CASES: [...; TEST_CASES_SLICE.len()] =3D [...];

You could also just build everything as a const slice of `&'static
[kunit_cases]`, if there is no need to make it `mut`. But I suppose it need=
s to
be `static mut` for some reason?

Best,
Gary


> Then, as long as there's only one or zero active configurations, the=20
> array size should match, and any duplicates will be caught by having=20
> multiple definitions of case1.
>
> I assume the compiler would be able to reduce that down to a=20
> compile-time integer, even if it is extremely ugly...
>
> -- David


