Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F30388E41;
	Tue,  3 Mar 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525703; cv=fail; b=un9a8FcWJKrI32w7dmADQIKYyMnzXnBkioc8YYzYYJRW8t7odp4irDFBkfyEeMtPTErJJGhDrZR2ScFQ9nN2VT8YPHkwJJxD0DFk8hV5/nZ4Kdl50qWGYjfcmJfS/6CV1udl1rjdvG9KrIGeDFMOHY3uSFOPrj9gLFtS363cDQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525703; c=relaxed/simple;
	bh=mu7p5uh0ltajQvOXOnz8OmzQFHnA3Mdl40pXWNn6BFw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=NpXZOPIwiJOFJK137T95RHwvVXYDy3s9HZyZQ8DN9UwO210E1d1sT8Fy7WxpfGcADxZ+jcKOlV6Jcu1/6i7iW90GZ/XZD/zw5MQldPv4/IhhORQEMEKtM+m6UAzT/ZpDxCawZcJQT1i/rR5Pu9WeWyk8nE0SG+H+F4kEZH3mGoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RpCnzqWs; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RpCnzqWs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjNPrBTbUThON3HFsH5hDGph/dJ4Ba2RmUV2CBl7ExsFKYEBsU6whzdH+OJ7QdOqYaKhIE0Pue/ZEQPt7uIaFRhh38QWUpxBGP+e7rmICyixE59l9D/zqXEZXMUhht/UkwhfQcZugaEZwoHYw0YPibiUzd2u3Mmemlk3jcbuTc8dkOqwRZD5EG/vID3VKdWMnT9wmtnWW5/eij2UG3I7dlON1Eo4jUEJl3HyjT83osn4Nou8RWxsCdAFO9L6MeH2XX8gCbpCsgO/ltzlWKsuoo3PNXHJ8Shm/D8Goq2qKVKx2FhlhT8Qke4hKGo19FZlcVeOkRa7rbV0MAjYj7aX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFcIdRZNGQS+XRpea6W9FjqHZiTmT52KjvLVM0H8wVY=;
 b=Gb/cheFQIsM1lONWqGvce0LPpWbSWtyuUnTFqeNhRQeFAnajZO5nzrP77JS72FrBazhiNJA6aEe3Mx7RuqwZIJCrvpdhd6jpbSigsH6rR0cbwrvkkOTeNXBtFT06XPL0w/npC5cLiy3FvXukUiVp3Cs2hBiEPIoriVxkCHvUJsJiwWMw4gvaA/VqXmWHfApDCrGy7mABaZx3mpMwINNEb2AeehZ7qGqy1n4C9xzP5+dAO074eRIveMY81TA17kNfS5aAf2m1yjjMhxY46sjSUchm4vJVXKMWWpOOIqj/4BneO2RKYABWly/dQOysgx9v7mOWD3h+Nd7HbVh90bD/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFcIdRZNGQS+XRpea6W9FjqHZiTmT52KjvLVM0H8wVY=;
 b=RpCnzqWscVvSq9dfwSAQTFs4XJ5YkIMOlUhCJiFpxyuHghrIxC01lFOOSMqJTTgi5D0A2kh/HuwMNcsG6hZSAOqT0YnXg2OgxltRn4NgNI43TdHNibQXnljcN4MEdsFLeIi+buD5DKckICr4tlP1VsWN9j6mAJoz8R6gLUO1KKQs5k09YvrAmJ4TC9OljihEdSy1xpXW4ZOY7X002ImuSBIWgezO5DiOZnwt75Hij7RdaKRxKxadalCk56X7Dy/WlL/XqcCjeKdaBWJwulNLEdx7NE1giD512oNMSEm9qnNQrnr/U5hZcECmwBMLTLS8BEStZK337r6/zImv5dk6fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL4PR12MB9505.namprd12.prod.outlook.com (2603:10b6:208:591::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 08:14:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 08:14:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:14:47 +0900
Message-Id: <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
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
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
In-Reply-To: <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL4PR12MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c01944-644d-45d6-124f-08de78fcf135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	IBu7xoRfEH8sVSax0jdf+4l5FJiZ3ibhzPuPB6AOhqzPA3DlopsMUBfaa3vMymxHpblvPcy0aM43HPzAfXEZBMipWKNTrNolROV/jKYPjqMcbVUXK7/kkIBTntbD6P/FbeCKQ2ydAEc4TXfXxY2Cl8sT+4/r/Nt1u/D1W6Kfk/GDbSS2uIYnxuPjOxWOOZk7/JCXDbjge7W9AKFyvqn8TvNl7XyjX0d6pNhkNMxl2PG/HrH2o7PoXlO3NEQZiYZ8wtjVXOX+GnVu5h5D1XuhuwwCyMoVGajsSSxRVn3ahO4b+T28M118O+fEjnMZMKd8Nk5nvfieUpauipfv6eIVCxnYd3shFmmtOljO9GK2QKvrRXxv8wRDazsueUE7+vmcFD9uvfyRk2lBTHsZfXLj+3pSEm9XXnqx2hRNcPeW6qIXDZ//oxRXIR8paCF/hOmE04khNTDtSc56Sa92gvlwZPfFtGVonpLjAuZLKfbLwIvyMocWu3EGrZlI+nxYHPoGQEDAY+ZGS9j1e7s68mfmT0i/lNUGPEIdgviMSyTEMBz7NCkGHFO/zmWIfwwKE/96jeiYAPuyWj7opDbq2TXhaNzEIYAXd5oNWbc5HV8SOSMPqHE+afOAUtMV1un/Df4cQDtrqD8/1OtkUUDHRAakv9kYd40KgYVYqYmCDLi5gItZlcXG8n8RT9va5G0pB/A5nEvJXHBg4PPFBoeMHIz+oNQ7E6QDJEi28DOaI9dvVn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW9sV3VlRlBkNkxVdWpuSm44SzFVc3ZIYmQ4by93V29jSGsrVVlXbTdpVHJI?=
 =?utf-8?B?OWd2S3EwemF6M0dRT3RGRzA2OUhxc1UvZ1RoUjcvYmZLOUVQSGlFYTlJTm9l?=
 =?utf-8?B?b0FRalJiMXpBZk1MYVJCNWJ0Slh6UnYvS290T0NxaXpCSFN3cStPY0M0c3lT?=
 =?utf-8?B?VE9kZ040M1M5Mmh5ZU9jbjZMMktKTmNkQU9VRFhsaFhUZWZ4V3psZHIrM01C?=
 =?utf-8?B?dTRGMWptWTlEN3J0NnNUelN1YlJvMUthdVdObVhiWmFXVXN6VGI2UEV4bGdU?=
 =?utf-8?B?ajhDeXFBZVNWa2lwSkxmSHlsQkxnd3BMZjY3aVo2N3EzeFNJYWFqOXcyNkx4?=
 =?utf-8?B?NWRaUlU2ZWpxcmdPVExPR1hJMzJvZjVJVkkxYlRDYWxWVkcyTjFXRVJjMFVz?=
 =?utf-8?B?aUFiSFlIcTBtMDZkR0xYcWhBMzNuZHY3OFg2UWF1MkJZTkhtemZBVG1zMzFW?=
 =?utf-8?B?bVFrQnRhK2xGOFZWMkF5NHcreGxOWkRhMjlweUNTY2R1ZUxNK2FEMlo1Mjlk?=
 =?utf-8?B?WW83V3dqL1dkcG9uOEg2Uk5BSFRuSUhrMlFYRlVndkV6MWp6QnRVa3BGcjFm?=
 =?utf-8?B?YmxwTXN4eXVBeEhMeWkzd3E2ZkRxVEl6THVNb0ZsZmhVMXp1RHJUSlBZMW4w?=
 =?utf-8?B?ejFDSXBIZFRDb0hnV081dlhpMW5RK294cFBEMlR0NTZ4aVU3RW9OZVBkejgx?=
 =?utf-8?B?ZThMaGMvM3dsNjJtNlZWNnNqOVVHUnl5dWlqTkFoTWh5aTVLRkFGOHprYk8z?=
 =?utf-8?B?bFBTLzVFcDFGbGF5dkIyT25EUFBwSEJOSGw5MldzTVBFcE83RyszbFdGWGRE?=
 =?utf-8?B?bldPaTZQZ3JZVXNYMXJGWXZsTlAwWDF3b0tYSnAvTmhqWFp2czJCbVhGQk01?=
 =?utf-8?B?VXJubDUwOXhFQ0hBTUM3dFI3NDhvaituWms0SjZGVmVISVhmTW15aUlXVE9l?=
 =?utf-8?B?S2ZFUGhYbkhIMWNIRDdtSzlLRy9DZDJncmoxMnRvbHZpeFB0ekNVZU8rOWJK?=
 =?utf-8?B?RDNmTmE4aGVZYmNaRVpxb0R3ZXk5Q0x3cVVZOG5DT245RXRHYnlHNXhyL0ox?=
 =?utf-8?B?bmhLMDNoVkIwRHlNWnQzR2tiYTNmLzVKS2JheFBRemNFWHY0MEJnN0VyeGMx?=
 =?utf-8?B?U3NKNlpUWTVoZEZRT0RhMEdsNnhjMEJqL1dyRmdVQXpQN1lPYkJrUXpZeG5n?=
 =?utf-8?B?aFZJZGZiQi9uYzN0MndGcURqS1Q0R2JoVUE1OFhudGg3Qm5vTnptWWJGTzY1?=
 =?utf-8?B?aTBGamVlZWNiT0trWEFLajhNK2FQanYyeW9SaWpHeGJLUmZWbThqRktXWGM3?=
 =?utf-8?B?OU9LUi9Idkd3UVNYZVdha25RMkY4a3ZnMWJTZ3JBL0g1dU5abHpqUU1CeEU4?=
 =?utf-8?B?aUp6eVM1S1RabHhsbDR2dTNkdHpFZ1kvc01JNW8zTGI0WjhqamJKZ0UvYWJC?=
 =?utf-8?B?RXBwK3BTbXpQSWo2NmxNVVRDZWtnb05vUUZUMGR2MkUwOHQrSTZENFVxNGlO?=
 =?utf-8?B?V2dQdVlQVDRWTFVMVTlqR3NtdGxkckp4dHhpMmppK1VCSWpabm1sdjBzRlpz?=
 =?utf-8?B?UmZXZVlRTUY1YncwR3I5VUZCTHVKR05VckpZRUlEajVVTXV2a3VxaUhsYmhv?=
 =?utf-8?B?dzJleDYrNUg3cDJqeXhjcUpzOEtWTHRwVkRJVHIvaFVpYU1TM0lxa0JXWGpn?=
 =?utf-8?B?cEJuOGxpNVRZY1BDQ0tyS2FaMTBHcmFuM2IxejNKQTF3dEJTUk9uajdkMHB0?=
 =?utf-8?B?K09zVFBrQm5MbWVpenhLVUJFTWF0Mmk0bmZSRHVJaTdQbjNIMDBRZy9JUjRK?=
 =?utf-8?B?cGRhZzI0aS9oN2t2Y2dHUUlQcnpLWVVsaW43Rk9EdUprQU5qNWJhRTlqSmtR?=
 =?utf-8?B?b0VHOFczakZWajFXUUE3VWh0azdsVVJub21nSlZrUU1NVlpUeWkzTlJXQStC?=
 =?utf-8?B?czgvWVhnek1SVm1ZTUxFY2xFd0FUWVdXK09td25uRitabFdRT3QrNEEwaVZ1?=
 =?utf-8?B?bUJMeExFQVhQK2NDbkFNSjRUMVMxcjBEVFRHbml3Njdxb2dHdVM3SXBEbExu?=
 =?utf-8?B?L3JIdVZnbDRiWTlvMTVqQmcwai9TeGFvdUFCUUQ5em00cUlNUDEvL3g5N2Mv?=
 =?utf-8?B?YmNuY0xQcHgrWUhkOWFxblZYM1l1SVlWamFBNkF2dzNjd29Xbm12TTlsUllZ?=
 =?utf-8?B?UWFrNlU0UGUrZTVDTzhLSFVjdXUrV2UzdjhpRE0ydDhJbWkrWlo5WUZEa2dR?=
 =?utf-8?B?TWFnOVFBWkFNOW5nYXl0ZGxzb0JpUTNvOXNOTTRBVXNsVTV5WkJxTnJFOFZI?=
 =?utf-8?B?NmZkbG9rV2hqMVlpb1hOWUxDNllRUzVoejF6aU1vK3R5cjNUQ1ZJRng0SnVw?=
 =?utf-8?Q?KhFNDk/LvNsuRx6ldKHrO00Rrcp95uRXULv5qIZ4cD4nc?=
X-MS-Exchange-AntiSpam-MessageData-1: 7dvpBtBEmzpSnw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c01944-644d-45d6-124f-08de78fcf135
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:14:51.4491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPic1CWn6tbPTO1zjcIt9r6LD7NwgAFW2Siquh/QZt3YSV09EmE2vKV38IDypbhC8CUB6Zoewd8SkBgVisyMgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9505

On Mon Mar 2, 2026 at 10:39 PM JST, Gary Guo wrote:
> On Mon Mar 2, 2026 at 1:12 PM GMT, Danilo Krummrich wrote:
>> On Mon Mar 2, 2026 at 1:53 PM CET, Gary Guo wrote:
>>> On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
>>>> That should be doable. Note that we currently support `zeroed` and
>>>> `default` as initializers, so having the same level of coverage would
>>>> require two `write` variants. I'd like to hear what Danilo thinks.
>>>
>>> I wonder if just providing a single version that starts with
>>> `Default::default()` should be sufficient? For most users, zeroed versi=
on is the
>>> default version anyway. For those where default is not zero, it perhaps=
 makes
>>> more sense to start with default anyway; if explicitly zeroing is neede=
d they
>>> can always do an explicit `::zeroed()`.
>>
>> I was thinking about this for a while and also thought that we probably =
only
>> ever need a version that starts with Default::default().
>>
>> What I still dislike is that the common case becomes write_with() instea=
d of
>> just write(). (Just to clarify, the name write_with() is perfectly fine =
for what
>> the function does, it's more that we need it in the first place.)
>>
>> Also, IIUC, if the value is not created within the closure, we'd still h=
ave the
>> following redundancy, right?
>>
>> 	let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>> 		.try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?;
>>
>> 	bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>
>> It's just that this case nicely converts to write_with().
>
> You would have
>
>     let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
>         .try_with_offs(load_offsets.dst_start + pos))?;
>
>     bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>
> Note that the `default()` invocation doesn't mention relative base, as it=
's just
> plain bitfields without offset at that point. [ I like the fact that this
> doesn't need to use closure, as I generally prefer code without them, per=
haps I
> am not "rusty" enough :) ]
>
> In my view, if the code is complex enough that you have
>
>     let reg =3D ...;
>     <some code>
>     bar.write(reg)
>
> then it probably makes sense to have register name mentioned again (this =
is
> typed checked anyway so you don't need to worry about misnaming it). Othe=
rwise,
> one might read the code and be confused about what register is being writ=
ten to
> at all.
>
> I think for explicit location parameter makes much more sense for relativ=
e
> addressed registers and register arrays.

I am not too worried either about having to repeat the location in a
write if we needed to store the register value somewhere first. That
case should be covered by `update`/`try_update` anyway. What is less
acceptable imo is having to type the location twice in the same `write`
statement.

I spent the day testing different strategies to support the
two-arguments write with both explicit values and closures to create a
value from scratch. That included adding a trait to produce the value
and making `write` generic against it: if both immediate values and
closures implement the trait, that should work I thought. Except that in
the call site the compiler is unable to infer the closure's argument and
requires us to explicitly specify it - sending us back to square 1.
again.

Another strategy is to make `write` accept only closures, and implement
`FnOnce` on immediate values... but that requires the `fn_traits`
unstable feature.

So that really leaves us with two options:

- The current one-argument design based on `IoWrite`, which carries a
  location and its value,
- Or a pair of `write`/`write_with` methods for immediate values and
  closures, respectively.

I'm ok with either, but the first one looks more composable to me. I can
send a version implementing the second one if people want to see what it
would look like.
