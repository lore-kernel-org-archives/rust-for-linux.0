Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BECA84039;
	Sun, 15 Mar 2026 05:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773551475; cv=fail; b=ZTfDyuaK+4R8MCZ2daPFpU1VDDJ2EX7pcpnbxqqxh2X2NZ9Vr3+N9srfF0Wl0cSraMuz311acHD3Wqc3D7MuCbFtyldzpdRZhkedMdoQ9mTNTuQ1WDQ8b994ksM2pIAd8whoNxP78HS5EKWawZugcfLyfLwTk/+obqys/+5yPbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773551475; c=relaxed/simple;
	bh=DaIKMiV5PQN0DFlgLk3q7PGaGko3Iy7hFI97OaKAWOE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=n5rIevrs3MG91Pkq6kw8WhlNo1d2V3TC+aluKSrlM7sJzpyKOuH1EIg7gBuY28/eB9BI7xcYOGxHIWrpmx5cdsMHW1irfwY6705bVVHAeX1mjFW/fHCu22RfmuE1aXX+c1OwREzuqyiDWvm3ah4EMh65iVdsvDmHzhXNIDqtH8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nAxr0uNz; arc=fail smtp.client-ip=52.101.52.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nAxr0uNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8nva1/ypDF9e7Op+AXRTBlnp+8wcypzn6VmaMoTutIhV/ghqtGe0c2tXK9oxV/m40izot2cvBlT5HLqKf8zQGfc9pxV1rGOcjulM1JxioHM5fnu5EytQsil1qRlLDET9vmibaasFS9gCRHHJuq6CYToyHfsXgGw7+GrwSPF2oTxBtVmKXwxp9vu5i+AoxC7Rh2/sy5CRkSRBHRJzW8rhwcCC+qm5v1kdueBvqzUYnPgQpw+6fNmBMq+pXOqWVQWWGM70/j7SR/FvIbXGwzVURf1DXJsz+7muazawa2+3/1/eVnik6TW4isiUBXdgSIbzgRgjTVqp/d+D0YaYayclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwpCNlLc/dPSdgH9FNH8SEzMGnpSZFBt3FZn4SqMetE=;
 b=cDRoqzpJrDsJ6nLO+Z2Lo6FwJqnW8Ey6vLcpgio2EPgoleIjO/ihFtLEWGy49eVNTHoHETSEMgdBfgm7vYIo2cuGHLbgVkNaBlDz1eHYFN/clK5zcablU5Ni3M58GVvuaEUEpSEgAgtxZmoHs2EMBDlDD5EIKdEuVF12KHh/w6zRtFHmW07R1SwyhEvscLGyYvmsu3kN8MXcnxb8MJ+lubX3sSuMKynaxa2IUeJvlPR5j2blhdrBifPjFsxi5idDTFZECYIpuDgHHimh7Ib8Fsh7+eN2q2IPtSKo0WiEKPd+bneeRSODewh51qinWG5caogivDCsAaEb5D7sfbitrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwpCNlLc/dPSdgH9FNH8SEzMGnpSZFBt3FZn4SqMetE=;
 b=nAxr0uNz8XejL5cQtdr7M4LUYLLNFk1d31ftbExXlSNdQzgU0c19S65ffbmrCFww89/4VBs5qRE5puOkXxVSrpVoJ7y6oMbjxNUffxuUccH3k3feRp0H++sTtxfCYEclfWN2CTPUTIm7Lg19kWmGzdsGnEpm3eSC9IUO5Xwkix6m9vKJwD85OiVE9zFh5PTwI6cgTaXKmeGwVhShLueGHlSmelFN82C1YzB4CLSZpXjmuZNEIJOpgfNqPh8iJw82AxTB/FqYrwR+SwIEKC+E0ObudqQveELm9xvweoxnWlYst5s46Vk2X6T5Np60HMRIxHMlrrAy1hO3c+a6FHOLrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPF6CDAEAF48.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sun, 15 Mar
 2026 05:11:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sun, 15 Mar 2026
 05:11:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 14:10:59 +0900
Message-Id: <DH33ISJP9GZF.29RJURXJDUY9C@nvidia.com>
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
Subject: Re: [PATCH v9 08/10] rust: io: introduce `write_reg` and
 `LocatedRegister`
Content-Transfer-Encoding: quoted-printable
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
 <20260314-register-v9-8-86805b2f7e9d@nvidia.com>
 <DH2K2VEN94JH.3K1WTNSTYEUSU@garyguo.net>
In-Reply-To: <DH2K2VEN94JH.3K1WTNSTYEUSU@garyguo.net>
X-ClientProxiedBy: TY4P301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPF6CDAEAF48:EE_
X-MS-Office365-Filtering-Correlation-Id: 40506bc4-7315-4f8e-2f64-08de825143b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a9+nCBXqUbDXvFz8saQyEfity6W48rYgW3wsGQm0pjI8d7FcaBqYm3MhQpVRfy/wtexNAMmkyqpVYx1CGt5LPwFBmLc2hDL8gyNHs6I6kGHt9HhtczWx7LTOFmwQRBrplR1jB+2mzRpByudEzkJIs6lGEBP9GI79ghI30B2jcFmhm3zpCIo4WByEyCrLZqVQveDsc8zUcFrwTCJ7qHT6OVxcxYnulo63HqzPeXz0rBhnaICA5fr/GZ2/nk3nDIq7mXQxULfVDjfj9I9rc8QRkGzaaGuiZmsNU/4+ev+MLnVbpHbzsSi14eQaN/Ie3bbye5fA3LHe6n4UhZ+VHtxgkxDa4FTkRv0W9omlWVMZIy4lb+oIkTbMqzWN7LOwwuYjfKJG2fEB0qTGSMEHFqPsn+ECjoG2S6QdJs2+ygS7ODDZCd4mnAmWdKn4tM7PyAUK3WMfMrWMj2yMSbncE40eVXsYZWTCNxSv0xWXuatAbPb8JGL42OKJPpVt2Xg4CcZf7FntDG7YufWnzTQLNvJHUAgtFl0P5nifOHCInUQ5vpI0mg9NtySVGNbyu7ceExGzlbfUVoOJvQJeFN6FxmuUzWkC0rZNPzKoN+bSgAY8VA1yhGC5cC4dSvkgpDUryoBPdPAkj0CIrT5OGXFLx2aQrdjOhT+elEFvjcnwOKbmihYO0h55IAQiXxeOOgy0GWXCXYsB9bEpI+9SICCECN5bWJjyX6Y82twH1etbT92+X8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDdIdjJaVnZ0S21sRmNUQVVOK2dZb0NyQ1lNaUMyQ2NZN1lqZlVQNlVKV1RT?=
 =?utf-8?B?dUdscFZjN3ZLcUJRUHJHU0pUcEQ2LzlxeSt0T1VhM2NueTY3NWJ6U2ptUkVY?=
 =?utf-8?B?aElFOGVJNUZERytxRnZjVzRIQVNyRm5JV1l4ZVd6SlRnZlQ0aXIzd2xpbGxJ?=
 =?utf-8?B?VEhlOGpQQVZQeFcyZjZ4dW1BL1RFNlZBWEQvbnpHRFY3cHB1dFhZMFNsR3My?=
 =?utf-8?B?YkVVTDQ0TzRZNkk4MEpUdkJxQTU3YWQ3RW1sVVRYK0loNGcxcHlQNG1zdlA4?=
 =?utf-8?B?MXJocnJleW9UdXlQcGgxWG1qcDRIM3pMK1RjUUkwRFQ5bFkvQWhOUS85Y3hl?=
 =?utf-8?B?L1Q0by9qR1Zaa05vbzAzSXUydkJLd2JVbzI5Z3JTVHZ0WXBSQWNmQ252dmFH?=
 =?utf-8?B?QWU3RnFNS0I3QUZuZEphcS8yMGp0bGs0bC94M3VYdTZCalhHcVI0QVBOUlQ4?=
 =?utf-8?B?bkJKYlZ4cTBzYk96SGZUcEtWckxnWTRJR0FDZFR5NnlhUW5XQ3RRWkhrcXNF?=
 =?utf-8?B?KzA3RmphSkhDWDZZMkxnbzJhZVVLeGhoU1lNTEVtdlN1QmxJUzg0eGJhL1c0?=
 =?utf-8?B?ZnIrZU01OHJtcGduMnZtUTIxTHNMbS9BQTIvVGx3eEYrN0huNU4zNTNTQi91?=
 =?utf-8?B?YmRsRWRZT3ozQkFCK1RKOXVZOGZLN0JrMlBaYmhvMm80RVFxM1JsN0pFZmUx?=
 =?utf-8?B?d2dNYVVIbkdBNHhqL3BkekhzTVl4U2s1T1BqQTJ5YXlvMkV5cGIrRWhRd2hi?=
 =?utf-8?B?R0NYczNyYWc0OXJ3TTFSS0Y2TmZJME1DbHRCbEJoQXFNV2pONnp6T0txSCsz?=
 =?utf-8?B?cTFlYXFEaGdqT1VDM2FKMjB3cEZMd2JkWFNhU3hyRHplN2dpcGFLQzRUUVph?=
 =?utf-8?B?bmxLTEZLdkVJaVNNNHh2YXppbnFFVFZYR1I1ejRnUndIWFdYbWhLRWEybVo2?=
 =?utf-8?B?eFR5UHZHRllQRHZwSUlRdFRucmppVnVrODZrclRtWHdua0xGVDUza3k4VVRj?=
 =?utf-8?B?T1dOL0dHcmlzMDZ6MmpuamZ4OVptWDdrOTBmWXhyVUdyZnFwYU9kYURzeGgv?=
 =?utf-8?B?RGxlbkU2V0hVR2hhd0lOZzF5WXVaOURKdG94L3FYbUJnM2s0STh5WFUyUTBJ?=
 =?utf-8?B?VVJ4SzRTd3R6bFRXT2ppT0hMZXpWRUlONzBwdW0xTFowY1lHaHR2b2N6ayts?=
 =?utf-8?B?NXJURzlBSTJvY1I0NHBWRGJQWVV0RlBCcmRVZ1lNTGIrdE1SenR1SHBHaGRZ?=
 =?utf-8?B?M01Lbm90QlRvTmRpYnRqTllBcEV2SUZkMStUYlhHcUo2NnNLa2V0eVVrZDlj?=
 =?utf-8?B?QzR0YTdiZWNtZ2RGWnpUMHp0REErK1VCSUhaT3l1L04zWHdvUWZnTHI4T3Fw?=
 =?utf-8?B?Mk8ydjU3b1hKdzJLRUpXMXlKVklxNnZGWGw1VXZvTlkyVEdHRlJkQzlWKy9q?=
 =?utf-8?B?anNyUjhJeXBaQXR2bk05ZGc2SnJKaEFtenhDTWdRa0Ewb3R0NUxVQ29sNmVD?=
 =?utf-8?B?Y05ncUVyWlJabnZpcGhXT2F5MDBZTWRRdDFIOEx1cFR0MFpzNVNldjBobkRM?=
 =?utf-8?B?ckxqclovL0JucmlDL2I0YnRySklkYmxvV25vaWFHYWhDSlhIdWltYXlHUGtX?=
 =?utf-8?B?T0NMZXlTN1h0NEwyYnpLR2VDeDVWb2p6NE9qbjJvTUgwbCtVeDJTaFc4cCtl?=
 =?utf-8?B?TG04YmFITG82bTljTFk3L3N2dHhkMG9iNVdzcDIrM0I1SmoxWmtRc0tVc0pm?=
 =?utf-8?B?dEZxQWd0UUxxNThnY29jNFh4TXlMN0UrUWx4U3dLOElCTnFxTEU5bTljY1E1?=
 =?utf-8?B?UjZaczRBUW5GR1ZhTTRaKzZtRlAzZmg3VGFTMnUrOUdBY2t6WFB6WmFtVy9l?=
 =?utf-8?B?cjVzVWVCWk01ZGtORmZLcnlEdEViSSt5NmFRYXErNnNGQmxtMTc1cHgyS25X?=
 =?utf-8?B?bGJ1VE1JajVjMzJQN0x3STQ0dEhtUDBVV1pseVNTUDRPSjZ6YmlVSG5XUTFJ?=
 =?utf-8?B?aElPb21PazdscGZ3WFdNYXI2T25DTktRUDQwTXlySi9QUzEwNytMRzhIQ0Rr?=
 =?utf-8?B?NUxub0ZaOEp0Q2NEeGNZS0E2VEk0UFE1WW9Ia2ZraE5KMXZvMmU4ck1sV1Rk?=
 =?utf-8?B?bk9ZYi9OUGkzS3ZKU2Vpa1NaYjNHcDgvaFVmaUp1T2Z3WUlhSG5kaElmU3B5?=
 =?utf-8?B?ZUtUQ0V6RytOSUtnQlVIQTd0MW00bHR3N2hFbDl5dWFIQlZ2NjY1MGtJNmVk?=
 =?utf-8?B?OXVBK3NZcmNmZkFKeVNxZVBkeWY3a2NYU2tWeElmaVkzdEtEc0tUMzdMWVBN?=
 =?utf-8?B?MDJqb1ZjWTNScVYwR0xtc2o1K3czMmxUM0Z1M2NVVXpFbDdOWFhVd3ZqanNz?=
 =?utf-8?Q?hhfoLd2W2z7sYraSqqONujvsCRYcQTck7tODBVc95MNOs?=
X-MS-Exchange-AntiSpam-MessageData-1: HvuVB9HkOoDz5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40506bc4-7315-4f8e-2f64-08de825143b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 05:11:07.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhj2MEP1tv0aFGgb3YDWe/asRZLuuxGfofoMsBKn7tj1P8ZE9P0RuUX8x+/gDYoi4LltytObkLhWlqG1MvYmCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6CDAEAF48

On Sat Mar 14, 2026 at 10:56 PM JST, Gary Guo wrote:
> On Sat Mar 14, 2026 at 1:06 AM GMT, Alexandre Courbot wrote:
>> Some I/O types, like fixed address registers, carry their location
>> alongside their values. For these types, the regular `Io::write` method
>> can lead into repeating the location information twice: once to provide
>> the location itself, another time to build the value.
>>
>> We are also considering supporting making all register values carry
>> their full location information for convenience and safety.
>>
>> Add a new `Io::write_reg` method that takes a single argument
>> implementing `LocatedRegister`, a trait that decomposes implementors
>> into a `(location, value)` tuple. This allows write operations on fixed
>> offset registers to be done while specifying their name only once.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs          | 70 +++++++++++++++++++++++++++++++++++++++=
+++++++
>>  rust/kernel/io/register.rs | 35 +++++++++++++++++++++--
>>  2 files changed, 103 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index bfea30a9acdf..24e6b48b6582 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -17,6 +17,8 @@
>>  pub use crate::register;
>>  pub use resource::Resource;
>> =20
>> +use register::LocatedRegister;
>> +
>>  /// Physical address type.
>>  ///
>>  /// This is a type alias to either `u32` or `u64` depending on the conf=
ig option
>> @@ -473,6 +475,40 @@ fn try_write<T, L>(&self, location: L, value: T) ->=
 Result
>>          Ok(())
>>      }
>> =20
>> +    /// Generic fallible write of a fully-located register value.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// Tuples carrying a location and a value can be used with this me=
thod:
>> +    ///
>> +    /// ```no_run
>> +    /// use kernel::io::{
>> +    ///     register,
>> +    ///     Io,
>> +    ///     Mmio,
>> +    /// };
>> +    ///
>> +    /// register! {
>> +    ///     FIFO_OUT(u32) @ 0x100 {}
>> +    /// }
>> +    ///
>> +    /// fn do_write_reg(io: &Mmio) -> Result {
>> +    ///     // `FIFO_OUT` provides us the location of the write operati=
on.
>> +    ///     io.try_write_reg(FIFO_OUT::from(10))
>
> This is not a good example, as I want to make FIFO not generate bitfields=
 in the
> future and so people write
>
>     io.write(FIFO_OUT, 10)
>
> Perhaps replace with any other register example that has bitfields..

What is wrong with the example? It demonstrates how we can do a FIFO
register with the current macro.

I was thinking that we can update this example once we have the right
support, but in the meantime this looks useful to me.
