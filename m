Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7DE2C21DF;
	Thu, 12 Mar 2026 02:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282239; cv=fail; b=eIMSVHXKSqHLNB0ydJMfWCYQTfksULYHHhFJViB9uKQt463czONjXQL6kxvi9MR1uCgxdMUJqHO/OnfHX+rkf9iOVd9ELyy/YrQvPzbR+nC6hWyFzffRrLCyNOqWMQxPu2mfD3Du9fCAjbz1gwFUbUR8YcJZ4stjaebEetQEP/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282239; c=relaxed/simple;
	bh=cTjdN4l+Nj3IF4LDRLAgEkISb2AdkfJFQ7cyFYgV5u4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=upeQHQ+MABifMDSkHMnE65jW6383OleKNM4uEajP3zkBS1U0f4vm0PlMRLsXxNQjraziE/YlC9GpdiRA5oRAr6XUbYpxZ4r1zGEuw2/ff57Tshj0fd2OjaBF95DTOu9C4VClmio4rUIoMovFtoBS+/nVuOzDwBcZT/ulOdkryK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sZi3V1Sa; arc=fail smtp.client-ip=40.93.198.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sZi3V1Sa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAwZTDvgMLAjEWFvqU4aN4EulBoyBnZPnqa/JLUcpsoh8uG2kPW5jTpGLQAJtCcoljuJ6BpgQJvVdsvXK17GVc5+rrAuoDa8TWEFC3VONn5e7/gE69C0y2duLoLcQFPWQoygFvKuv4gXDhm4Rg5ATYAWv4gz0pLMqiSOuFLhqN236SKPQQkmPyeq4++UIRX3gV5gi1K1BptyxjFmoyrPqisH1RE78+1HgimneGayppPCGFPXeP5j3qiwI7tVMB1iGA+9jCrwcYaBNvvHiLxZCao+dkyDC3KZBKfbp6as6GbytZqgDx+d9jPpSPhQ0yiUG6ua8EYzj9DrfoJrj0ZfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBuQzD0JbYERUh96trhMZY61oTs2f3tafBz+S36bS4U=;
 b=CN9G6uo9Vs36A8v6PhQdhYO7oTmMzlPMcZMWvhnrb087N9jeJOcv2plpy7zVr9WrH0c7v8kRcMldRe/XFP111tYvF/4hYkAUlRMCUqfvDh8urC7W8PNx8xJHvfY9gVzjySGxPlFAPPdS0Wquj5rKjsc+3ooG6EwEUh/6LfnNpGWTB9vUUesAL2WUxcTbYrgJAt09r6AaV2/y/lHbo06sEQmqfP8fiiHvFVfXpzcftdMBGb6TO5+4Hxm/KBguwGv5Pbi0dfOPi+luCIsfq9AITMr8bADU1iShC/BadgurzvctNLYmBFkHQb828ZKuyv8EyDKeYFtt+lBtj5QBRT5YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBuQzD0JbYERUh96trhMZY61oTs2f3tafBz+S36bS4U=;
 b=sZi3V1SawXLHRdop/6XCGNzvtneSWMUsEimZQ/QKeAJ05tzfkEBGIMpbJwuUGlaX1EmsGcX/Nj1Svw9Y17GLrnd855fGM+kh/yGC9nx3ZJJNM/hdVE1xgVPDEdV/uGdlQBCO9W77xd/k/KUhInVpUwbw7oFBWE13mfPbSgzIg6QsbJXOrz3MpCOxnkPai/NfGRsWoKwiT0Vp9Tdllg+v6Hj9TY+mg6SeUIEN9lW8ogfn1azzVQA6GEgTYbTmtVR/WJyrEutJt7xFePX21f9ILlGPuV9rgxsg2iDiM1NbDLmNfZTHXoyN57iCIreGsSOzGocHPHKabJJKlm0CGLqzzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7916.namprd12.prod.outlook.com (2603:10b6:510:26a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 12 Mar
 2026 02:23:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 02:23:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 11:23:49 +0900
Message-Id: <DH0G35X70AQJ.1UGLAWA6PR7S9@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
 <DGZZ0W7ZQ6DO.3NBYFWFGPPUN8@nvidia.com>
 <DGZZ53BQ61AF.3HCJ598LHXAFG@kernel.org>
 <DGZZQM4G6FRS.187T94FLRZAR0@nvidia.com>
 <DGZZSZ3OJIVX.5MJFI8TZV4AD@kernel.org>
In-Reply-To: <DGZZSZ3OJIVX.5MJFI8TZV4AD@kernel.org>
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2b954f-83bf-459e-e247-08de7fde676d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E47inIEi/vBENXOtreUXtBsIHTzyHP+INgBlG/JSr6JNLXsWVLJ/+Xbb4MvozMShDGX9ayCP2EMoeSdathvx/Rb+GFEB62EQicwbnj+nX6+nqUlKmVHcsw8g8Q8TSFAiEah/u9CAFLG41lyGaJZFETx983owVOyhToNJORsH/ebSVQA3Zrb6LuOmMR2LYuuoUNio7qNtFrV6RF/YURbrLjBnaci5FQ5aEegjPMH7u5zLQtcF2fwyS2pL/2RBTXOmMNvISTOKgqeiRyn3JrxmFVuE2F4p89MxKHlYk5vZ+vBNHrK6s0dg1dPUfg5JfMBaUy1DTgnj4MtNc/16VUYBJCsZJ6tHii5GNK328lHAI5JpQ+vZQVSnEQDS+AuaVUHCTrgj/nCYfowxA7w1O7EMiKBrHpS240Sm+XQa/NgIDJ8pTm7A4cmO4jRaII7xZOyQLCrSljsgIAUr9M/mTZU1zE0MKoICK2dNgqq96nDTTvN6M0Q9ByBoigDiDkc17gxsDqLoOr6dWNyVu3DzAK/ys54yyjmV6JyG1DjJWPx7VNhLXIEZF4dw8skbLDVpa9moyJlodtGjWxeOBYI/+g1JgXr7v3cM3N0tZcLEcIXItXuCWbvwbGJtCC95Z027luhqGNEkcblGAPCzpiCOPk7BPyWRSbKKm1BLQi63rTaXO1J/X+O4arn/vxY8RDYhwf59MyWDUJN5Dg38NoUxZMajNjov28NGJzieXtlfT6ht69U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVdzRmNKMXRQQ24rMWtyeXR5MnNTeWtQaGFMd0hVRm9sU2MrOVU5WHU4Vzkx?=
 =?utf-8?B?QXRhWkhHcXloTFlxcHl1QkNZZ2tpYWM2V0lRalorazV2YlZuNVdJbjBKRnZh?=
 =?utf-8?B?Vm5Cc2wvdEFETjI0cm1hSmJXVWVHbXJESzFZd25ia3M0bjJ2ZldSVGtwanlE?=
 =?utf-8?B?NnU4TFYvQTAzc3BIeU0yUlJHRVFFQnVTY3NSSW54Um5sNTFEYmdqSGRDVUVo?=
 =?utf-8?B?SkNUM2RCTk1tNSttdlJPMkhmTnc0dWpKSm5udnVGMEtldzlqSmtnRTFiYXJo?=
 =?utf-8?B?dzNvSUVDcWI4c3J6TGtXVVNXd2xvWkxzUThqR1JOQVpsRldFYXJPdmk5RzRO?=
 =?utf-8?B?Mmt1allVa3BZR0hZMmVabW5PMldRS2hOWktxOTljYzlQZUpsQmtEL1kxbEdE?=
 =?utf-8?B?cTZqSjNCOGVwSk5wbUQ2VEtNNG1UNitzcDRjWm93TzVtaUhJeU92M1BkNXdx?=
 =?utf-8?B?RXhNQUZ2YThEdEVvMkVqYzNTVHdSY0pJSGVRWkhRTGdlWTAwZllGT3g1QjFt?=
 =?utf-8?B?UGRmd2V6ajJMRnNxQWRDVnI5ZVU2U3lqM3d5MW5PWVRoMWFwRjVWNVBDT29x?=
 =?utf-8?B?a3N0b1RLcW91bkZGeUNPSzJTanY3WjM3WCtETHFadEFVcjNHZFVvSTRXSFA0?=
 =?utf-8?B?bmRWVmpqYmhqL1pneHl0Q0lxdGZRWkM2YkkzTDE1MHUvc3VmVk84d0FBc1VT?=
 =?utf-8?B?U0pCUGFHaU1DekRmNE8wMFpSOURrVFRqL0x5UWI5dndPTlBsbzlmQTBxcVJU?=
 =?utf-8?B?bVJDdDZpZlNCdXVrQ1V4N25SRWpTeVc1S21tS1hZMTYzUXJERUZ4NlA4UHF5?=
 =?utf-8?B?RVFRK2ZZRU9XWUc3L0FOWEw2MXZUTnNDV1hqWE5lVWY0OTF0dDJjU2wvV2Jl?=
 =?utf-8?B?VlU2V0s0VVVzM1JiL2NWVGVERy9IOHpZN0hxUFgrbjkxaDFNalhsdDB4M0FD?=
 =?utf-8?B?QXlONkRuZWdWOHhIbmRLcU03NElRbTdIZGFZbm5acjdScWxLb2ltSE9uUVlR?=
 =?utf-8?B?ZU95N2IvQzJ4bnU3enV0WEQwTW4zWFVRbXUyY3k3MFMyMDR5Y2syNjBOcXAv?=
 =?utf-8?B?alRWR3FzOEgxc25YRXFXZDZvUjFFZmRhY292OHhXZk1mb0EyN1N1eW44QjFx?=
 =?utf-8?B?M0xrb1lsOThWdVNoOFFLc2dQdmgrT1hMQ2NTNUQwQlU4ZjJVOU1kSWJXYTI2?=
 =?utf-8?B?NHZsVXIwVVpNWEZ6cVpOc0d0bElGS1I3NGhKOVpvQ053OHV6bXduTGNXclpM?=
 =?utf-8?B?b1VmSExFRDc4SDhBSnJLb1NlSDR2bENnczNiUVNPSHhReFhEM0h5NFhGLzB1?=
 =?utf-8?B?QUtzU0QybXAvRmRIVFJQM1p0KzF6dzZnR2xHWUdJMHdMeTBPdGhwb0JuUytT?=
 =?utf-8?B?M2xrK2J2YUJlUUhqQVVyaUhHb24rYVR3SjQ4bVhleWFKUG1BaVVkRDZKSXJD?=
 =?utf-8?B?OGtJWkp2M1FpRzM2MlRCS0wvY0xjbTl0eVdEdXVVTHRzT0pIc3VDRGNWcHZW?=
 =?utf-8?B?NW0wb2h5ZldCUkY3RWxtUVhVdERabm1TT3BOeVUvcUlZYzVTa1VSWklsM0NK?=
 =?utf-8?B?RWx3d1lLYlUyclkyUS9SN2FZWXQ1RUhtRnBOaG9mOFRicDVrcWkyY0M1TjJ1?=
 =?utf-8?B?bU9HV3k1MXJFZ284YjdFTS9TQUJvYVhNRUxnMm5vVVZDRjl5aEFQUlpiR3Rn?=
 =?utf-8?B?KzY3citnSWVTb0R5VUFIRXdQaWpoN2pUOWRSZVNSZVlvMHdLRTI4U25INTIw?=
 =?utf-8?B?b1A4b1dkdjBLSnlyWnk4RXU3OW9WT3VmeGVaVWFLS3dCL0xIZzhIWmlFZDc4?=
 =?utf-8?B?TStlV0oxaGs1bXlCN1dGWG1MZUh2V1V6K3hrczVDWlZiQTViRzBkcTdNanRF?=
 =?utf-8?B?UjBJNzBiY2U1WFhWbGNlbzFZbTdzckxIM1FYR3U5dTQ2RmFjYVpIbG1Qak41?=
 =?utf-8?B?Uy82c2pibHpwRGoxa1BCbTQ5TVZ4YUh5c3VHemU3QS9FeFEzOWdNODEvR1Q0?=
 =?utf-8?B?eGIzeUJvYTNMRHBqSE5oOXlqYTJxanF0a2tzTjEwbFVjRHp5NnhzVy9yZGk0?=
 =?utf-8?B?YjhwRXZZaXk0azM0UzFFcVZSbTFQcVVTNHVnQksxNWV4clFsck9PMmx0QUM1?=
 =?utf-8?B?VUt4amNMTTdEUjNEOFdsSTJRNXI5R20rUjhYZWtoVFRhZWFJYmE2Y2RwR0tR?=
 =?utf-8?B?b2djbUw1c0srcVBzaXVmNmpJNEZhOGx6UldiUUc0SWZjaEM1UTM3RmQxRlhC?=
 =?utf-8?B?dFIwVlFRUkFEaUN3bVN5SXNkaHBUQTNkSW9CNmRUUjI5RFFXWmJDVHdYV3U0?=
 =?utf-8?B?Umc5Zy9weFcrbm5BZjYyK0FCcnp2cE9uZWsrbWM3b0JsVXNDM21hT0k2Tk9J?=
 =?utf-8?Q?rziMqm1q8ZRnqEcMLvni2OLlzDTda8z+zgXMKmosOlFNO?=
X-MS-Exchange-AntiSpam-MessageData-1: wX2kxxwIrInoaQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2b954f-83bf-459e-e247-08de7fde676d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 02:23:52.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLWZTltae+z/iAM94DLtTM++zFlKjnmISynLpQUwQ6juFYHO0+1ArGQOVdtMP3OoeY45M+zpAA0TUl4/Z5g4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7916

On Wed Mar 11, 2026 at 10:38 PM JST, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 2:35 PM CET, Alexandre Courbot wrote:
>> On Wed Mar 11, 2026 at 10:07 PM JST, Danilo Krummrich wrote:
>>> On Wed Mar 11, 2026 at 2:01 PM CET, Alexandre Courbot wrote:
>>>> On Wed Mar 11, 2026 at 2:20 AM JST, Danilo Krummrich wrote:
>>>>> On Mon Mar 9, 2026 at 4:13 PM CET, Alexandre Courbot wrote:
>>>>>> Alexandre Courbot (10):
>>>>>>       rust: enable the `generic_arg_infer` feature
>>>>>>       rust: num: add `shr` and `shl` methods to `Bounded`
>>>>>>       rust: num: add `into_bool` method to `Bounded`
>>>>>>       rust: num: make Bounded::get const
>>>>>>       rust: io: add IoLoc type and generic I/O accessors
>>>>>>       rust: io: use generic read/write accessors for primitive acces=
ses
>>>>>>       rust: io: introduce `IntoIoVal` trait and single-argument `wri=
te_val`
>>>>>>       rust: io: add `register!` macro
>>>>>>       sample: rust: pci: use `register!` macro
>>>>>>       [FOR REFERENCE] gpu: nova-core: use the kernel `register!` mac=
ro
>>>>>
>>>>> I did not look into the root cause, but fetching this patch series my=
 build
>>>>> fails due to a build_assert!(). Maybe you have CONFIG_RUST_BUILD_ASSE=
RT_ALLOW
>>>>> enabled?
>>>>
>>>> Nope, it is disabled and I build with Clippy so I am surprised you are
>>>> getting this. Do you know which module is failing?
>>>
>>> ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko]=
 undefined!
>>
>> Does it happen with the exact branch I posted?
>
> Yup, my HEAD is at commit 5c558172827e ("[FOR REFERENCE] gpu: nova-core: =
use the
> kernel `register!` macro").

I did a mistake when updating the nova-core code - changed a
dynamically-checked index into a static one, and since it could not be
proven at build-time it failed. Working as intended, apart from the too
cryptic error message.

For the record, here is the fix:

--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -291,14 +291,15 @@ pub(crate) fn run(
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware:=
 {:?}\n", e))?;

         // Configure DMA index for the bootloader to fetch the FWSEC firmw=
are from system memory.
-        bar.try_update(
+        bar.update(
             regs::NV_PFALCON_FBIF_TRANSCFG::of::<Gsp>()
-                .at(usize::from_safe_cast(self.dmem_desc.ctx_dma)),
+                .try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
+                .ok_or(EINVAL)?,
             |v| {
                 v.with_target(FalconFbifTarget::CoherentSysmem)
                     .with_mem_type(FalconFbifMemType::Physical)
             },
-        )?;
+        );

         let (mbox0, _) =3D falcon
             .boot(bar, Some(0), None)

