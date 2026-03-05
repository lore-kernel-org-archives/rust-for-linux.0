Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCF382372;
	Thu,  5 Mar 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708559; cv=fail; b=oIOEWuixfmdycoHYwB6D02XklBTGQetiTMNqwii2tHOlRd1dJR1EpXKC/+FpvWl04ER5ILCbjoMhB8RS4fGwa/KdsTd7MuJ3pmH/etbRUvszFUl4tpFhI9aLeDrz7pRece0EoFRYMbkhpvp8twa/tqwx6rQIaL3C0SyklCM3aPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708559; c=relaxed/simple;
	bh=f1gtbeHRyVZ2yzcA/rc9bm4mgtOrTHPQ9chw7XCQvGI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=OjMS8NAGTalgvRvz6UeZA3+WWuJsbKBnDsF5RZzLRDgfCDX4zVgSu4MDE6AmZHeCANYGEPp0mahZwZRl3zwAcOFwjg+kQVMwbVTvrl9Z5eqw0rKGKS1HDkyGwaBLPseJwz56sU7+8/kJPHEBzoGJUWt9xyhFDqykLW6UhKTCZR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cC5BS2Xj; arc=fail smtp.client-ip=52.101.52.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cC5BS2Xj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edbc2G7Cw6CCLCxfXHF21Me4oJlZq3+b5a1uiSDTI84RTRHzWrn9AgvCZCtWE757RuU4vfIdo7emyHdrolHz9Q/WmCuKSk22JN02JDMbiRLhrt/1gN13FFEKfhNxgzDxmpkaSb7TaHpMEd4sSMBJJscQYi8aqnK0Kz4/UjYrF7RtLhW6ZGCGyoItnvtEEnh3fU2E+JtGnSIkwvYcGBGsfb9EdHEnjT24F1RQzpCfPgreXULod8sG2VZY+NyVaS3qCXd8oBS2KBcDs2Q0Z++OA6MA98VfQOKio9jmp/I4bC5bPxtwa1Td0R8+ibTNyRbE20+RQ8bpuoR9t2qfq6L+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbIThMoDCTZdid70n7lD0brQG5BzKhjXm/lxjkfFhpQ=;
 b=yQZhIG7poOxVJqMgxn6kqyI0MMqhTqn/wjpPouEBnzGKDNt3SI1Ai58UynF8cfEqP0C8n+QEbI1xTNP6lXrPbCwLfR+Qa7udNi5dQNou+WooVxbW8NvJkAe+tk7YbPOx9mxhs2a1oIc5KM4+Rmp5hMlUWgmrzMOzTK4JT0nF64gC+qE5AGwYvdBsC6TwfHLFLPdUMlaasQvI6WJ08Nq3gOeNFk8AbAVRHOBj1+di1MloAM+93G+d6+LcqKpYxqW4UoXLj7mb3/gBhsnO0e6jwIYVKSwpMJesF+Iro10JiAg0nchHDHagDlPh621lCJb6g3qXqYUV4YjDelmV/qCb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbIThMoDCTZdid70n7lD0brQG5BzKhjXm/lxjkfFhpQ=;
 b=cC5BS2XjuAJV0RH8OnhEPHzagGFB8HUeIvxQjfJzmfqtQHTUolDIV9GnLgkn0L70PRmyaO+ZpAmiqe5Vjpsabb0xoyHA5QQm0XRn9fUjzltO0JqrX73ggZUHint3qdZiIrxmu4mxqawtghvtFIvguibtHLN5R3Uu6Tc84rESstNiXtdns82J/BDnxKVhneRPp6JZ7XVcRf06gOyLImkcHJ8qccUCZEDAh7pTh/c8JENB6QhlneZpioFt8m9N0cbVTrITpPSqZvLt+3cDXMgF38BI1FWjscYGUkiq/ucs5WSmBTKeiNdLV3v4hGi64pAufwvX5hKJyIi63PzlVddtqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 11:02:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:02:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 20:02:30 +0900
Message-Id: <DGUSQHH1S8JP.1SEB6U5Y4HGDN@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGUCIJBOF218.1Y1GXJOZRZ7J0@garyguo.net>
In-Reply-To: <DGUCIJBOF218.1Y1GXJOZRZ7J0@garyguo.net>
X-ClientProxiedBy: TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bccd96-57e1-4425-00d1-08de7aa6b3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	AmpxP2Z1LvM9K9L3Kp3+wpBaxvLFgnS8B4SdyC5I23MLUE/HzeYtI5oINYUtYuVY93oajQvz/jgOAnvuALyyKukjwjdIm+uuG5FbRFl42GtCL9scD6cfGKXR+L+WeFymL0r0pyqux6W8sabF2/abc16GL97vO5IR48w2HwTYLgJjEirVBgZLktx59B0gmd7j03jHfkUEj84ABKgZ7qodAeH81XooJ2k19ZX/6/AlXugXBGfEB5R2LvCzzQYOuUtgpmYpMNirqPoZxsQ2KkRozYB0x8cBxc6LEfmNv/ZsBCWFDwVIXlfe62quoD+k0ep+9jLc2Brs806uo7/rc9V9iYvTrY9S1puMeH2+Bf/05krYkmXH4C0oC4FfZynUWc122Tq/V4GqAHH8yj5eUwhbyYXNBlNXWfhHckmQKAWNdq1cS4Fhi3zOfWBetey/IQvLNNI63Ms02/Onb5bkbAsrv0cxV2ZD49iO3+f6LdCQ2eYFn6fTQZ48T6gyafifSIL4smSbDP45sdE/vwQ9b/hN+yz3+nzwXvKgJZfef1+J0YhCY2SncVEjdQTXoOCreuqujs6HNlTioSXGmfI26cGjwjvcqF0ZNdZ8PhADoShLS8p78jua6odFpkgRMdo9Nuupyu3jLtz4F5K0PWZKdz+IfOZbOej/5P4lirLXbeNLKqAe6hGNXT/RrPzp5Xt9XFJ/qMRvYAmF8VNNbgNfFPHbwFDYz9WrJVrwoDa7h5ys3EQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUR6dnM1STFQcXB5SUkyYUNqRlBCWk9JNnhiOHZNTldNNG9TQzVka09rNnNj?=
 =?utf-8?B?VXFra0h5NXljMmxJZVE1emltZHJEUlc0SkdjdjZoMWh4dEIwYzh2bzZ3dER0?=
 =?utf-8?B?K082NWtrTlFDUUNMVFRTeXJTa0JyTjhyQkZ1K1VoZHZhWFozbUdmVEhmT3Jp?=
 =?utf-8?B?M0pZM1krTnZubTRtMnlyZzFQaldXNEMzdXMzcExIZkdVZFNEYlVDSWp6Tkl5?=
 =?utf-8?B?Y1IvN3RIdzIxM1VkMkJ2N2hGMXQzR09LMml3ZSt0dlgrdklETlJEeW8zT2ZL?=
 =?utf-8?B?QTU3aktYQ0JqNHp2UkJaWFpBWnIwdElJajVRUlpxc0Y3MU8vdUpzc3BnQmlS?=
 =?utf-8?B?K0ZNSWVYWWtPeVQ0cmdzc211NzNMaFlnMEoycFllNTNkU0VNUENNTkVWNmtN?=
 =?utf-8?B?V0RURVRVWnRKZ0FQUENIcUtvc3ZUOE42U0dGTkRtNFR2ZTFLZ3JSWm9BN0hU?=
 =?utf-8?B?Qi9VQ210VDZPODd3T2tBTjRXMHg4UmNEc1RWUmxCS1FZRWxIZlF5RTZjK1hm?=
 =?utf-8?B?SFJDenNvNENOb09jRnRtZ2ZhMmk4MGpZdVBHNmRDYmQxNzllbDJnd09PaVQy?=
 =?utf-8?B?a2g3byt1S05zak5PSkgvL3haVmcrVU9vdjVNbFBncEpMM2dEeVpiS3o5bzJl?=
 =?utf-8?B?dG95M1U0SmpWQS9memlpV2FhS1hjU3ZleURjWlZXUlIrVzhmWEd1Mnkzb2xY?=
 =?utf-8?B?T3cvajA1cHMrSnkzODgrbmtKRHBHaFd3R2liVnZkWk5MTFlQUUZvWllWWUY2?=
 =?utf-8?B?c1JLQlVxejJOL0xXNDBKdVlGY2tOdGEwNVpHdnpMTURtUXl2WU1lQUZwMTNL?=
 =?utf-8?B?MGE2NURNU2JUNEN1bG9CbFExdFQvQXp3Q2hIOE9IUjR4NnB2OE81OVpMRVpQ?=
 =?utf-8?B?eTcwbnVHUDZ0SThBTE93VmFQejRXQjJtSmc2amo5T3JrcHdMZWl0TWxYYVpX?=
 =?utf-8?B?RERFV0dXSUZDdW9xK01oR1RIc0I1a1NicEhvTUx2T2NNUCtTR3crUEJhMHc5?=
 =?utf-8?B?N3BFZHRETXh3c01QRFVNUFdiKy9OU1RSU053WGp2TGF5RjhxUW5hckFpUHBF?=
 =?utf-8?B?R3VKMFVheE9iMUxOVW1RS3FCbmpLWC9wQ2o2M052NzhDc2VHbSt4ckJGWkxG?=
 =?utf-8?B?YlhIb2tPcDFVRlkxL2ViTnNqMkl2Tnh4Tk84ZDh1TmtEOWZadWtwOTRrU0hV?=
 =?utf-8?B?c3FmZU9LQitwNHh5MW93QlNlZG4xVTFuVzVFSmtYYnNpc214TjIvTTd6akVm?=
 =?utf-8?B?RHF3Sm5ja05XMFhGOEFKY2NZN3NaK0t6ckNRd1U3ejBSb2IySTl6YmxFOHow?=
 =?utf-8?B?cmE1SjNRREluS1R0a3lLVFRJQlVleElQb2dDRFNBMW0ybmRheXExK0ljb0NL?=
 =?utf-8?B?eDE4R1pGeU9VKzJHbXl2V2RhQTg1MFRNNGppQlFCVlkyTFBlYU1vb1VpOG1n?=
 =?utf-8?B?Wk5yMXV1YjRrQzNLaTNUNjNJa01zQUtNa1F5c1FwUFdLRlVUWnFwSVI1Ykpn?=
 =?utf-8?B?QTNDRmRja3lIazVncC9Obks4QzR6dkdMNFRCdWQvOXlwZGk5dHdkSkVROWNH?=
 =?utf-8?B?bDVqOFRZamt6eGMybnNobVFhMzMvWnNuMXorQ3pNbEVhbHRaZHlTQkxEQ0tB?=
 =?utf-8?B?STJ6c2crQklDWUE3Qm5venllSWEwMnhXZ2dxZTBNSzVEdFEyQWViSkc0clNL?=
 =?utf-8?B?bmFyUHBBang3TXFmRDBlaXJvVnltOW9nTDNtdm5UMDJod05HT09MOUQ2VXdn?=
 =?utf-8?B?RkprejFRVWoyejBJcEk4NlVHNW5qQ2RONUNpdXJoM0x6bjhEWTFnZzNNeWxw?=
 =?utf-8?B?ZGdtN283WUx2RmcvdXp1QkRzUmdTTmtvZHRnTnNnS3F0OE9KRlVwRVJpZFZL?=
 =?utf-8?B?bFQ3MlZHdVVIb0NFdHF6UG4wVlEwaERHMXlJN3ljYzQvN2t3RklXbnZCajl5?=
 =?utf-8?B?OXFEVTk0UU1BYUFoTkdjL0JrQW40N0pxdjhnRlVCeDlGclB4WTNHT0Evc0xO?=
 =?utf-8?B?Nk5zS056K0F3Zms3VFcxVTR5VzQ3VnlJKzlYOWhwb1NKWUYzdENYcmc5VjM0?=
 =?utf-8?B?TjliUCtnNzZaQTlrZTh2dkJva2JFM3dNbHRqN1FxSVh3aXN1aWFkSmFvSi9V?=
 =?utf-8?B?N0ptR09uTzlyc3l0dWNFRHJLQ0tFcDByU2wyY2ptRnY4OGdWM203aDJCR09G?=
 =?utf-8?B?MVdYaHM2OHJUUVptQWZXRHJEeTlSU3VnMGkwNHk0MkZUZU5zZUNRWjZ0U2Yy?=
 =?utf-8?B?bGtBYXpPMXhScFZEQWZidTdaNnlQWnVOc2l6SlY4UEtXcGhxN1BiU0U0Ny9O?=
 =?utf-8?B?a0hzMUlBZHJMQVdFU2xGS0gyMzU1bE5yUkt3bko3T3NTMEtwT2dUN0RCTkl3?=
 =?utf-8?Q?hAZg+Ah3BWJ/Py9oa7xHrJCHyseRlm6nSzD12HYeWr44v?=
X-MS-Exchange-AntiSpam-MessageData-1: HiunJR3bC7DcYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bccd96-57e1-4425-00d1-08de7aa6b3e0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:02:33.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA0b1NIgr9Uw7+6TOFFYkN6IqKF1SuIxuoR+09HyvSFzkqIKxawDnNLsATD/koSqmNtvT4CsG6Hu+AjVK5lTkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117

On Thu Mar 5, 2026 at 7:19 AM JST, Gary Guo wrote:
> On Tue Feb 24, 2026 at 2:21 PM GMT, Alexandre Courbot wrote:
>> I/O accesses are defined by the following properties:
>>
>> - For reads, a start address, a width, and a type to interpret the read
>>   value as,
>> - For writes, the same as above, and a value to write.
>>
>> Introduce the `IoLoc` trait, which allows implementing types to specify
>> the address a type expects to be accessed at, as well as the width of
>> the access, and the user-facing type used to perform the access.
>>
>> This allows read operations to be made generic with the `read` method
>> over an `IoLoc` argument.
>>
>> Write operations need a value to write on top of the `IoLoc`: fulfill
>> that purpose with the `IoWrite` type, which is the combination of an
>> `IoLoc` and a value of the type it expects. This allows write operations
>> to be made generic with the `write` method over a single `IoWrite`
>> argument.
>>
>> The main purpose of these new entities is to allow register types to be
>> written using these generic `read` and `write` methods of `Io`.
>>
>> Co-developed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs | 241 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 241 insertions(+)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index b150743ffa4f..fdd2549d8e13 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -173,6 +173,158 @@ pub trait IoCapable<T> {
>>      unsafe fn io_write(&self, value: T, address: usize);
>>  }
>> =20
>> +/// Describes a given I/O location: its offset, width, and return type.
>> +///
>> +/// This trait is the key abstraction allowing [`Io::read`], [`Io::writ=
e`], and [`Io::update`]
>> +/// to work uniformly with both raw `usize` offsets (for primitive type=
s like `u32`) and typed
>> +/// ones.
>> +///
>> +/// An `IoLoc<T>` carries three pieces of information:
>> +///
>> +/// - The offset to access (returned by [`IoLoc::offset`]),
>> +/// - The width of the access (determined by [`IoLoc::IoType`]),
>> +/// - The type `T` in which data is returned or provided.
>> +///
>> +/// `T` and `IoType` may differ: for instance, a typed register has `T`=
 =3D the register type with
>> +/// its bitfields, and `IoType` =3D its backing primitive (e.g. `u32`),=
 with `Into` conversions
>> +/// between them.
>> +///
>> +/// An `IoLoc` can be passed directly to [`Io::read`] or [`Io::try_read=
`] to obtain a value, or
>> +/// turned into an [`IoWrite`] via [`IoLoc::set`] to be passed to [`Io:=
:write`] or
>> +/// [`Io::try_write`].
>> +pub trait IoLoc<T>: Copy
>> +where
>> +    T: Into<Self::IoType>,
>> +    Self::IoType: Into<T>,
>> +{
>> +    /// Size (`u8`, `u16`, etc) of the I/O performed on the returned [`=
offset`](IoLoc::offset).
>> +    type IoType;
>
> You should move the where bound on the trait type to here.
>
> A where bound on the trait is something that needs to be proved when refe=
rencing
> the trait, rather than something that can be assumed (which is the case f=
or
> bounds in assoc types), which is why you need the extra `Into` bounds on =
`Io`
> functions.

Thanks, this indeed looks better. I remember Alice mentioned that we
should prefer `Into` for trait bounds [1] so I don't think we can port
her comment here, but I agree these constraints are things that we should
be able to assume.

[1] https://lore.kernel.org/all/aZlwG3wK5w-IV18x@google.com/
