Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FF363C58;
	Wed, 25 Feb 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027458; cv=fail; b=NAAVOrhS08iCyoHVVEvArLJEF7M7z+JsXqvkO6zq4ZM3mLhKtVmypiTXNrFOeAHNcgiZ+8UKoqXmA6V685eqOPXsWwyvo5QZ91uRr/y5rqQlHkhh07NOGPX36WS9k0uYzeMSVzD+NIw6QuDOEeMwR+u6uzxpbXvl4hElsxDUidk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027458; c=relaxed/simple;
	bh=zC6Z7OYQRZcT7zDrF0ifCfjxuqdDyrW0o7WKHPm1UBU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lXKWiCrzxScxwozq4ONr3q1iF/fSFQ3RZq6jmBgX82N07c49LzOOIMyxFVw+/w+i4JDXMKZSG0NHMaKZrsMqr1Hrw0Bef9fxx44fGtODqazY2iMnOGXE/9lrIofByy/e3iq8C4D6EaM2hDT59KCwfFPP5sjNzX9NlHiYSJPL60w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T2O1uUoB; arc=fail smtp.client-ip=40.107.208.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T2O1uUoB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO8JE/tlTWXTAbPo0UZhUyvY8JIQ2EL89Dj+JDkRhAjBk/mT1NLhdX/lQbPIGbkEBjFU69nb0mZ4EPjSyz6FrmCrC5uHCqBELrioI+beYcG+YFkCqLhoB1Qlpu+rM7SbesZ1GEhWB5jaEkVA77LGru2uaSlBC0WPqwlu6bgsZwVB5gB1o+Qy40OTZ2dSYPo/jvmJKB6HrFzCjSKkPLuDf70OLj9ebtKmhaxKKx6sCwo+a/Cr4KZVWnPpltE4mTeQywpodY0s8Imqd6mwxzuB/wIN0vIdP5u8hqQvY1+e1NeZt4a97orkw6LSCjPKmSr54eBi4WT8tRqQ39KS+reBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdCF6Yodfe4TI4g2nj3ZAJGsI2Do4FktghhcHhbXNHQ=;
 b=ZpSwFd1NnpRddw2/axxKkhYE5TlO+xSB/dhYKixriIBGEOYxlFigJIhy32bpoTnSH7JNK5uRCmDEIpXtIPnNUYTqO7jJ4z96yNQaJkJWYwBbvfcnbbBCB81tIufUopBpog2UTigA1iRBgnjlODgaHUCE2Vo4amiL+1js1mav3bOFqyCl80rq0LSqWuQMR8MlCUAH6qd5Ef/nqJCTpUx7+zQQKFiqstZjAw+8+x8XqMqAXp2ER1gI6se0IBAcGzLNHMxXtRvRVw6ipVltMmMQYE+hLSz6TBAepI+EMwDQ6HjHJ4/ajZLfTpFJxjpwPYRzxbDvX9gK9VAI4VHX41wC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdCF6Yodfe4TI4g2nj3ZAJGsI2Do4FktghhcHhbXNHQ=;
 b=T2O1uUoBJwKuJrfminYtzD7psFfFmk2DNJsT1HpsCoysaC9KEZ5WrcrC4659DvvqtnOaFDQF+fUupVl/yxWmHbnEi33YvYvnwAkL+JmXu9u9AZVlpq/FqFTaL92Z/KrffPig/oFklSrzXoYqfxwg+eo7J7zsdcWN9LHzLcK4fiHENfFIghF3crBsjcOgMkKF163csT3KnKQ6DKzx4Z2g/EDyPDw7AhcFhxI81PDRqWx/xqB2M1B2WjLryn/8lktLfjQi787FWh3mHPpLEifbXkCby7zhij2gI2TuedYtzc037CR3ar+M3veaARXnjy7U3KkcGcoDOqlbIHwaTpYl8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 13:50:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:50:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 22:50:43 +0900
Message-Id: <DGO3AXDQKCKO.19VWO463SM0WP@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/10] rust: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <a278ad60-5912-4b9e-8930-6fc9ecedbd16@de.bosch.com>
In-Reply-To: <a278ad60-5912-4b9e-8930-6fc9ecedbd16@de.bosch.com>
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b8d38f-3b82-4d75-293e-08de7474e2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	09mRoMfhHthNg6ASdqBJnkk/HCRGYuk4b+qtlhkZ5ZiDrFo/UuiJljxdwAl8ESaBzPU7t9fhkuT9forTnBMadUWQDyyecPUoayrPmdvuaqljh2LiiODfJy99/uMQ9MmuEtPti3ROAwjHqqP6eOEGX9QDY3PttwuKgmJ1v9lY5ragtp+EJTO/YsmQbOFCDCNEcWwNG6A7O7WybDiyZSzQlq+pNmDlVodYxY6+3ahPj7pAm5ADpHGr76usyXg3/lYGjlP2LXph06T7XWV+wxQqNbEOKZk6fy4J7+pVoRUoYfNaIbHbA4uDrifsp4ZTLjI4FQL6CTu9kqfJwyRDk5ivpHsiRas36hEXx4sQs8dk6k1qjboPGt6qjwQWSkhAU1fcy+kqQy4ZMV7prFWnOnbAOu0aojJRGsfXBNPXSkJ5mDbOQafc0prTl3erj7f3wmJzeEBD1Vnp16rZsA9qyTq30w4lznIe5Ooe9WOTu19ciYv3rVqh2rmalB4VImxn9e7aeiGI4JbLKfadfsEU49SZnI+Lmi6CZFV2uNjLJ3yIoCZ7hYtX/OL7Ema4WfGdSqGxtK12sSHW7Xk2ZD92BC4+MpDao0bFILofv0TzXqXAerSBPaQ1Jp4Bn2Tua7sQycd+5tPmwJ75lYb8yvd9grpPqNhzt2AvHM7rnmx6snojNWWmbxJGijr0ql+0WdMKw1Uydyx5NbVFgHj9e5WVOiUnYx7/RCWLLzJ7Kj2n41O2vAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1wenBSSHoyR3J6UjRqYlBXemtjSklwaThsRmVSdXRKVmpQNDVwSjErRmdO?=
 =?utf-8?B?WWxXcGxxSFE5NEFkRWllUitQQVZQVTd6dTdnZ2dINlVDVUZqZ0l5em1KbnZ6?=
 =?utf-8?B?L2RaMU1sdE9rSVl0YlRGSUFmYkhGeHEwd25TdktrSEJPaXc1T0hwNDZMZDZu?=
 =?utf-8?B?K0s2Z3dqQjFsRFNmKzBmS1BRVmplemVvNWNvaHZaaW9iUnFLVnJ6QmlvbUVs?=
 =?utf-8?B?bWF6RERUQitpa2JFdnQxTXV2OXY3TDNnSmZxY1pLeWUvbEk1aENHRWY2NUx4?=
 =?utf-8?B?WHh1K29vaHdTZmpkcTJCTENCMldrallNcVhmN21sdHV2eVZaKzc3N1RMRjBi?=
 =?utf-8?B?YmZST3lFdkwvbzlsdlJrU0IzZU1SRnltT1QxcHYyNmg2dmtENm0yVEFEQWwv?=
 =?utf-8?B?aWNNMFkzTi9pcUdPVTlpMUV0UjE3VGdWbW85eXVyT0hBLzJsRUdHemNCL3Mr?=
 =?utf-8?B?UGNXSENBd3Z6MC96RVJUa2V2d24vcTVFbWhKUE1IZmdFY2YxOGxhRnVxK0di?=
 =?utf-8?B?Tnk3SXpiOUNJSnV0VXhmajFwQnorT3BZS05qT0JDNkV4L0hkYjZwWjdkaTJ3?=
 =?utf-8?B?akUvaXdrOFVUWGdYWGxxWHpxVHptTFdlamozOXZvWWV4K0lJeFdYZkdrVzk0?=
 =?utf-8?B?QVJNaXhKdFVqb0htSm1sdGcrTlB4M3FPUzE2eWE0cVRYaEsyRFRxeXBZU1c3?=
 =?utf-8?B?Z2JiRlFpNkJFdUh6Si9zejQxMmlISkhSc3ZXa0F4L0RMMEJLbjdOZXZtY2t4?=
 =?utf-8?B?YVNGQ3c3VWRva1VyT2RBSkRPdzhtbnAxSXN2OW9VakdiRTYrV2J4TFBvS3Vq?=
 =?utf-8?B?MzY4YmkrU2tNVUIxTmtOZDJxQVhZd1lCOW9kZ2hrVFRmaU9hVkpRdktDbU1G?=
 =?utf-8?B?WFBJWUFKQnpXNEhzTUVIY3FSQzhhZjBQaTFFaW83azA3RkVuQ2Qzd0taaFFa?=
 =?utf-8?B?UVJDa3RUdTNCWEcvdmRTd1Q4dVBiTTNKaUU5Ry9ORDVpVzBid3BYQnFnYzdo?=
 =?utf-8?B?L0dXaXJqTElQZElMRk1jcTNCLzRxTFdkelBKT3BKR1B6bWUrZ1Y3TExYWSth?=
 =?utf-8?B?bzdXYjg1dmZZYlo3UjgzYUQyMm1IaWx4UTFyUFMvcDBoWVFrR0RHU29Ba2hU?=
 =?utf-8?B?a2N6aWc3T0NyVU1zVGRJM3FoZlJJcWZMUVJESVBWTHc2S24vdE1XMy8rb2wz?=
 =?utf-8?B?QmFGcDBYTmh4U2lTQUlMMzIxUGNvcmVWanczdHBlRnRqWVJvZDdRVWlqZzBv?=
 =?utf-8?B?S3hkdlIxMHZzT1QvOFZGcUR6SXlqN1R6QW1Cd3VXNEtFVjlScHRlQ3NGWW5Q?=
 =?utf-8?B?eFdFWnRLdWZFaUUxK09JSzMxOHdPRTMzR2tXa09uV2VPYkFkc2p4N3RHT0xz?=
 =?utf-8?B?amU4dzhoTEdIZElXc2ZrTzVONXBOb1ZXUEpOVXZTT2svNkpQQll6NEVvUzht?=
 =?utf-8?B?b1huK01hMldkSExVOHRNRWRTVTlGSGYrTHpQRWx4Y1lqSCtvTVJDbmJUNVow?=
 =?utf-8?B?K0U0KzhDcVBPQXhLUWFDUk00RUgxZHQ2bEwzU0ZyQ3V3Q0pyaWZ0Q1pVNkh5?=
 =?utf-8?B?eWEwU2Fhc1Z5cGJVQ1pJQzF3VE9kaFE5cjNaTGlTY3F5OFk2RkMvMTQ4TFlt?=
 =?utf-8?B?a0xSWjRVSktBMDRBT3BKMnkyYUk5aUp5YmhndElZbm5TdUYxNVN1YW1vV0tC?=
 =?utf-8?B?SldDaHRYalo1WEJJRjU1azFiaURqQytsSCtXZFRUMXN5TFhDcWxNQml6MGhG?=
 =?utf-8?B?dVBuSHhSWUtwM3dYb1VJalZwWXdyRW0ybnZTYlRrS0k4VmYrZ25RUzBTUkVz?=
 =?utf-8?B?QTFGYkE3Y1dzWjRpdVdOZ0RsL0xRWUFwdmVZbkdBbjkwRi8yS0JTd2wvWEh0?=
 =?utf-8?B?MXJuYmhJbHR6V1FSeHU2UjAyTHJ4TEE4cTJXK3IrT1NBOW5NOGhyWkJURVYw?=
 =?utf-8?B?bHljU0dWTjJzS3dWdXhIRU9BSm11WndEOVVRYklkQUVWWDNIK3AvZXEranR3?=
 =?utf-8?B?bk5ERjhCVmxTVm5rUUcvT29YNVZMRFlLZm42R2dzY3dYdnBqeXg0REZXOUhH?=
 =?utf-8?B?Y1BUL1M3Zys0cm5jZFpoTHdxL0YvZ1lXUm85S2ZRVmJjQ25LNDhSY0VaYlFu?=
 =?utf-8?B?NGxkQUQzeDhaZHFqa294dGpPWmh4Z1E4eEgvSVdMSjF2NUpjaDdQaFQraFk4?=
 =?utf-8?B?Sko1Z1UzRlZKK1pycWpFeWl0d3Q0S3pZRnN1VnhJQXJPSEc3LzNITEVEMngr?=
 =?utf-8?B?cjVjWTZrQVROU3pDd2xjQmVHVnJDdW5seXh0QkEwVXE3OFZ0TjhIUlhrMEhB?=
 =?utf-8?B?R2c0RU03Y1B0N090M3ZVREx4cGNMZnpEbmxHTklnaktDU1VjaGpzMlNVUWJF?=
 =?utf-8?Q?kMGkfQfPTzMpmFHH3sumXA2BRpfTUf4LCTDvFWG0fMnJh?=
X-MS-Exchange-AntiSpam-MessageData-1: 2nFmWlVh240aeg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b8d38f-3b82-4d75-293e-08de7474e2a2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:50:50.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug/zN05MOleBf4CjxKDyiE5TxEGZyVt/rE2680mSZuK7CMC+UPFnSFKTH5cqfXqwegVokdsVAqNgHjnz2ZoOTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

On Wed Feb 25, 2026 at 8:58 PM JST, Dirk Behme wrote:
> On 24.02.2026 15:21, Alexandre Courbot wrote:
>> New revision addressing the v6 feedback - the use of "location" instead
>> of "reference" in particular reads well both in the code and the
>> comments.
>>=20
>> As a reminder, since the previous revision we use the I/O type to
>> perform the actual I/O instead of the register type, which moves us from
>> this access pattern:
>>=20
>>      let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
>>=20
>> to this arguably more natural one:
>>=20
>>      let boot0 =3D bar.read(regs::NV_PMC_BOOT_0);
>>=20
>> This revision is based on `driver-core-testing` as of 2026-02-24 with
>> [1] applied. A tree with this series and its dependencies is available
>> at [2].
>>=20
>> [1] https://lore.kernel.org/all/20260206-io-v2-0-71dea20a06e6@nvidia.com=
/
>> [2] https://github.com/Gnurou/linux/tree/b4/register
>>=20
>> The first patch enables the `generic_arg_infer` feature, which is
>> required for generic type inference and used in subsequent patches. This
>> feature is stable since rustc 1.89.
>>=20
>> The second patch adds `shr` and `shl` methods to `Bounded`. These were
>> suggested by Alice during LPC as a way to avoid the use of the
>> controversial `Bounded::from_expr` in both the bitfield macro and the
>> Nova code. The third patch adds another convenience method to obtain a
>> `bool` from single-bit `Bounded`s, while the fourth patch turns
>> `Bounded::get` into a const method in order to make register setter
>> methods const.
>>=20
>> Patches 5 and 6 introduce the `IoLoc` and `IoWrite` types around which
>> I/O accesses are centered. This allows registers to be accessed using
>> the same `read` and `write` methods as primitive types.
>>=20
>> Patch 7 adds the `register!` macro and the types it requires.
>>=20
>> Patch 8 updates the Rust PCI sample driver to use `register!`, as per
>> its TODO item.
>>=20
>> Patch 9 illustrates more extensively how this macro is used by
>> converting nova-core to use it, and removing the local implementation.
>> This patch is to be merged one cycle after the other patches.
>>=20
>> Patch 10 is an RFC allowing a shorter write syntax to be used in the
>> case of fixed or relative registers. It doesn't need to be merged
>> immediately, but I think it is a good time to discuss it.
>>=20
>> I have also removed Gary's signoff on patches 5 and 7 to make sure it
>> doesn't get merged before he gives it explicitly.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>=20
>> ---
>> Changes in v7:
>> - Use `RES + SHIFT >=3D N` instead of `RES >=3D N - SHIFT` in
>>    `Bounded::shr`.
>> - Rename `IoRef` to `IoLoc` and all related types
>>    accordingly.
>> - Use `Into` trait bounds in both directions on `IoLoc`.
>> - Add RFC patch allowing fixed register values to be used directly with
>>    `write`.
>> - Link to v6: https://patch.msgid.link/20260216-register-v6-0-eec9a4de9e=
9e@nvidia.com
>>=20
>> Changes in v6:
>> - Remove Tested-by tags as the code has considerably changed.
>> - Make `Bounded::get` const so it can be used with registers.
>> - Use the `pin_init::zeroed()` const function instead of defining our
>>    own method.
>> - Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
>>    make registers use these as well.
>> - Use the more natural pattern of having the `Io` type perform the I/O
>>    access instead of the register type.
>> - Convert the whole PCI driver example, and not only the PCI
>>    configuration space.
>> - Rename `Bounded::as_bool` to `Bounded::into_bool`.
>> - Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
>> - Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c9025=
14@nvidia.com
>>=20
>> Changes in v5:
>> - Rename all setters to `with_*` and `with_const_*`.
>> - Use `, stride =3D ` to specify the stride of register arrays.
>> - Remove `Deref` requirement on the `RegisterIo` trait and make it
>>    `#[doc(hidden)`.
>> - Simplify the top dispatch rule a bit.
>> - Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d96=
49@nvidia.com
>>=20
>> Changes in v4:
>> - Add `with_` const field setter methods (removing the need to call
>>    `Bounded::new` for constant field values).
>> - Add `into_inner` const method for `Bounded`.
>> - Add `from_raw` and const `zeroed` method to create initial register
>>    values.
>> - More documentation improvements.
>> - Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d73=
12@nvidia.com
>>=20
>> Changes in v3:
>> - Sort the Rust features list alphabetically.
>> - Rebase on top of latest `driver-core-next` including the new Io trait.
>> - Allow several registers to be defined from the same macro invocation.
>> - Remove references to `bitfield!` macro.
>> - Fix doccomment of `shr` and `shl`.
>> - Use `+` syntax for relative register offsets.
>> - Move register arrays size and stride to after the backing type declara=
tion.
>> - Use regular doccomments to document registers and fields (thanks Gary!=
).
>> - Remove `Default` implementation and implement the more predictable
>>    `Zeroable` instead.
>> - Improve doccomments a bit.
>> - Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e3=
6a@nvidia.com
>>=20
>> Changes in v2:
>> - Remove `bitfield!` and put its rules into `register!` to give it more
>>    time to get reviewed.
>> - Allow output type larger than strictly required for `shr` and `shl` on
>>    `Bounded`.
>> - Enable the `generic_arg_infer` feature, required for rustc < 1.89.
>> - Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b5=
57@nvidia.com
>>=20
>> ---
>> Alexandre Courbot (10):
>>        rust: enable the `generic_arg_infer` feature
>>        rust: num: add `shr` and `shl` methods to `Bounded`
>>        rust: num: add `into_bool` method to `Bounded`
>>        rust: num: make Bounded::get const
>>        rust: io: add IoLoc and IoWrite types
>>        rust: io: use generic read/write accessors for primitive accesses
>>        rust: io: add `register!` macro
>>        sample: rust: pci: use `register!` macro
>>        [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
>>        RFC: rust: io: allow fixed register values directly in `write`
>>=20
>>   drivers/gpu/nova-core/falcon.rs           |  249 +++----
>>   drivers/gpu/nova-core/falcon/gsp.rs       |   23 +-
>>   drivers/gpu/nova-core/falcon/hal/ga102.rs |   65 +-
>>   drivers/gpu/nova-core/falcon/hal/tu102.rs |   11 +-
>>   drivers/gpu/nova-core/falcon/sec2.rs      |   17 +-
>>   drivers/gpu/nova-core/fb.rs               |    6 +-
>>   drivers/gpu/nova-core/fb/hal/ga100.rs     |   40 +-
>>   drivers/gpu/nova-core/fb/hal/ga102.rs     |    7 +-
>>   drivers/gpu/nova-core/fb/hal/tu102.rs     |   22 +-
>>   drivers/gpu/nova-core/gfw.rs              |   11 +-
>>   drivers/gpu/nova-core/gpu.rs              |   36 +-
>>   drivers/gpu/nova-core/gsp/boot.rs         |   11 +-
>>   drivers/gpu/nova-core/gsp/cmdq.rs         |   10 +-
>>   drivers/gpu/nova-core/regs.rs             |  544 ++++++++------
>>   drivers/gpu/nova-core/regs/macros.rs      |  739 -------------------
>>   rust/kernel/io.rs                         |  347 +++++++--
>>   rust/kernel/io/register.rs                | 1135 +++++++++++++++++++++=
++++++++
>>   rust/kernel/lib.rs                        |    3 +
>>   rust/kernel/num/bounded.rs                |   70 +-
>>   samples/rust/rust_driver_pci.rs           |   84 ++-
>>   scripts/Makefile.build                    |    3 +-
>>   21 files changed, 2118 insertions(+), 1315 deletions(-)
>> ---
>> base-commit: 545225ee0b0b6998c7b6ff888f8497681b8b35c4
>> change-id: 20260117-register-ccaba1d21713
>
>
> I converted my simple aarch64 TMU timer example [1] over to v7 (many=20
> thanks helping with that!) and gave it a try: It works like with v2.=20
> With that:
>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Really appreciated! And I think we are finally converging, so hopefully
no more big refactoring ahead. :) Still, please let me know if you saw
anything that looked off during the conversion.
