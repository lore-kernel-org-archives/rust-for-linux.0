Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010017.outbound.protection.outlook.com [40.93.198.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E4184540;
	Sat, 14 Mar 2026 01:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773451198; cv=fail; b=GdOxFNkKK9z43gQtN6nouHvQpQIUnvXw7FvMWP3wZxu7bxsADz2urN6xQjyiLlj/xoAbCXHaUHX8+8nhAvlWHGMqbiGe5Df/gUnf3q7n7wXr6PSNwkbMyqf6AnqFEBgdU2Xt0SPgibwC8Ik2Am5Tg1nUc62TSu7SMiNl0QkAJZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773451198; c=relaxed/simple;
	bh=OjzMSu2KhyaCo8K8a1ANAnf4ZUU5k2/wM5k/t4KymQQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=U1ul2c/mScN9+H7c0fP6T15usc8rSwCUgSUSdDgLhlu32o2AcqG3Ca0UFXVTs2zE5DQZ301ZKpuBunzYbljCUrz/aLeqXjI09VmzcZx/UljUawjysNeOWJoW0p1fy4jIHgUeDOFOGN6SMq1YAX5Wz1FoExDEs2W72jTWEUz+xnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PPXJcpFw; arc=fail smtp.client-ip=40.93.198.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PPXJcpFw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLi5ddPaLQoK/bZ928wUY8Mc1H7lTfjtSn6CGAdmYJF5EkrrX99lbjbyDsuBf3RZmV6aFPI8aVG3ZkBw9InkpzPTqpDB/GR/ZY4pPDsJtiIhm2UGeygEVsyOZXxhjSVaGiEXjCw/f4flBUlEB3KxcDf363N8rBEgfdNNkgx8hBg6u8OPX8xWg7QODzMUU4Bc7IUVO4rdJKyglMolLRgOEVHWLev3UHxFvA87Z7BNdS4KzGQqJimc7TFNaqEMk3dhAuXAVAol65wYfec64D4kPXtPfTqVVPkuT/gjbsP2kKwvcMLsvCEhPr+53CLn8+MvsjT6AeFpY2PnbB/sveE6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjx5SvGNUc3M0HdTx3sZoxcRxKiwRsbb2W0XvMM/DHQ=;
 b=iygiSefhBfB8HJjdDjXeQaWL43KEGpC9UMwBRFYOes1CFYs4xkTpFBfBB0ItZG5Y4BrJnJFQ5k0gHP9EIhUSIo3AILo1SxPk7YZJHB6Uc/GcWQqaEi3pFgAOcdGeGgeXi3o+CuNiSpKzT5vbpceLukS+3LK8cuA4TShoU+ixopwK9KlJKHb1UAuTlPg9mVdwiYGrCVMNQY4rrg8kFwmuPyHPGx888+nEKUfFYHC5rgS8cB+5zpFGSSTvDs/wGJGrOtmx2ei//nQON1YSmhcxcdUnN+gQNFf9vC1hKDFu5vAzN/WZqclvGzgC2LbJsaE9gISPFi6ecAZ0Esgsc1TNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjx5SvGNUc3M0HdTx3sZoxcRxKiwRsbb2W0XvMM/DHQ=;
 b=PPXJcpFwPgbLps1KbfvPdilO3h3YRfUw73g/bF2gMfqpMB03sd9nEuM3FsEkF11wD3R3CRoDGMPJExbnzrxNOIlmWEmqIC1obf098U7TGCwDAGV1lu3F2zWNjy+yAwZcwb4t4ufx9xPc6MCZX3ZDJ/c+yVoHJ692/6fDe8FKeRgHNRbAsPART34Jqy5ZSuak4Phvgyw/EvudKgAke249AQxebEpF4e2/OqeGhDa/6j/tr5B3fDPWBD2Rj5EnNwzrRZL/XjOtnKiON5osCEwAj8HM2xGVIJc5tB+HagWPrEyhiunVNno287IW9xOhe7cnPO+i0XxKhfLUWmDj4YAPrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPFB8FBD73EA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Sat, 14 Mar
 2026 01:19:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:19:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 10:19:48 +0900
Message-Id: <DH23Z8W9TRR4.2V6W990QAHDYG@nvidia.com>
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
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
 <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
 <DH0UR584E7YD.1A41R0UEVJK1D@nvidia.com>
 <DH0XBLXZD81K.22SWIZ1ZAOW1@kernel.org>
In-Reply-To: <DH0XBLXZD81K.22SWIZ1ZAOW1@kernel.org>
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPFB8FBD73EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f2044b-a240-49e3-3971-08de8167cab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rabhcF7Cds4/t6NyE8ltJuBZKrqoCF5Ok/OK6KGh/N5naizMrqEBOgCcUsnXli4pv5WvGc71B/LLqNb7EK38mmRrR9poYWVev99ygXvorDkGVvEX14xSee1PIl4FsDz34IJZO6bQL2gHrbkDnsa8GIudRzcEm0sPcM3j6gqDaMwiK8h+bdcthWBIPJlGEuc5MKMKLaJSF8oo0s6nzWnOEnnNjl1qxgjeVU/zV754Klwn5ndB4uH3F7EY7hezrwGH+cGxbE2QZ+dPfnVj9vGIb55Bs7DmiWZudOIGHRZianMhfBNfTXmVMJ2HH3meSvOOuzIsh2uaMXPPFFwTKUpm0s8pUWk82tioGOpzR9e21/2Fft6VnJoyvp9Px9EWJESl5MZMleEhL0mrMShW4AQivEX460N61G1AabHCADaGXRlrWNyIEdKCRJ8MLlJS6dIyiVHiHRRCn+vbuwXFw5Bo/MEsMd/H8a/ZPun3e60Mzyj3m8hkS6hSTNXWzSnwfpvyPjqHQBHf3s/Ae1ZMVzBp6uGv+9yFI/2H/B8OvowvH1CRhEMQmdv0sswCMnW0EQzDc6jvnrXTH/Bn7MPdGtaUdlv7W90M24pXDPuyI9pIAZHHbAuRb8hBrn4ytE9cSfkXLVEj7d0jW2FA/YekSTWs8XG/qNnxHTFai5Yk5vzcGKzddXz5AbLVav/9TsSkJuLAu1ZJhv2iHxt0G/iCnhh8ZIetC+dDpFKYrqbwhJkd2s8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elJQU28rNjZScVpZdUtpUTRWWTZFNzlhOVh5TDZnUUZwTHlFdWZZYkp1MW50?=
 =?utf-8?B?K0pUU3h6bVRESWIyN2RaZ2FhQlFOSHRYTkxQRjhVTTlFS0lOdnpqQktXdTZz?=
 =?utf-8?B?RWtrcTE3YWpRdDRkcG9zZnk0ZGtJWElPeXYxQmtiZitRUWJDaGhIWXpITE5v?=
 =?utf-8?B?dk1tN0V3RmMrTWVDMDNMRkRzYTlXN1doc2xCQTVBaEYwM2doSGJEcmlmb1BB?=
 =?utf-8?B?WVhaVTczOExBdGlibmhuVkpNdXkya2E0MU1xUjVIQ1M4UjBMNEwrc3Jrcjc1?=
 =?utf-8?B?RGNRVm9QZDBLbXN5SWJtL0NtQ0x4a0JXZ3NDUU5TeFV6bGdlUFVkSUZsaTRl?=
 =?utf-8?B?U1NNc0NEbGVTNjJwUHdtQUIybk11Ukt3dEVLM3l6aG1UQTVvSEVROTRabjl3?=
 =?utf-8?B?MmI0SDFDUnJnZ21Kemo2NkFiV1BIaTI2Z3M2OGE3VWlCcHc5V2tvTzArdGpz?=
 =?utf-8?B?Ukhpejh0M0tackVydStpQlJTd1pnRVg1aFhJUThZbUlyL2dzMGZ0VHRqclR5?=
 =?utf-8?B?VzlhYmM4S3ZxRXJIdWZJbXN0bVozeVkzVUxWRzRKYytPMHFYN2JtNzYvd1pz?=
 =?utf-8?B?SjZjclBabDJCMlYvZzd1UnJEWXFoRlNKa0RQTzA2N3puVXNPb2V1UnN6YWpY?=
 =?utf-8?B?MFQ4bWU5alQ5eUtlSzJtbHV1TytpRmNadWdzNmpza0hMb3JQbzVtcWlxQW9u?=
 =?utf-8?B?NGRHZHRpYnlMQUFDRGg5R1RjM21ONm1uMVp0ZmcyNmZFczZIZVNFZFNWdHRp?=
 =?utf-8?B?aGRKZWpmODY4SzBEUTdyTFNONCtWSHVMb2xUUDlBWFNtaDRyZENRSUFnK0gr?=
 =?utf-8?B?V01rcWViYS81Y2UzS1BJNDVGOVdiS2Z5K1ZvM052eGFMQlZ0U3BqTTNJMjMy?=
 =?utf-8?B?SGFMaUhhcGtCeTBqNUhPYlBabTZpcEVzTTlyNGc1cW80Z3EyL0ozQzFJUkJz?=
 =?utf-8?B?aVRtb1JreENETmU3cVhZaFBqTXVSblBwQ3FmWjVlWEhJRHI2aXlGMndwVFBR?=
 =?utf-8?B?MnNJeHU1THhid2IxczdYMXRDNm1yeGhIMmluR2JwNVZJb1kvdkVNbEpJTFRY?=
 =?utf-8?B?eGhzV0dBTzRRa0VSam5kRldaUHJaSnhjQ3laa0xYRmFkQ0tteko5MUFVaCtK?=
 =?utf-8?B?b091YWhTTHVjY1hqVnhVcVp0dXloVDZsZUZDbnJMZnFhUUV3U2dFRGp6UFE3?=
 =?utf-8?B?VjdhNElDcm1makZpQ0pNa0lnUHhTTG5WMHh5RDRWbFg1eWlOVi8rck8ya2pY?=
 =?utf-8?B?QlRHNkMxektxREw3NkZOTzlBa0k4dFpaMm4vbGlmNnBkWm1ReFFicEtyaG8r?=
 =?utf-8?B?MmdpcEM3Q1JHcTY3YjI1cTZzd3lmVENIN213ZnlHZGlNb3RNbVRab0E2b2lj?=
 =?utf-8?B?Nm9UbjRhSk9yOEFGWStZMEMvbVpSeE05Z0g4SGdvNnVKT2FFeEtaQWJnamNM?=
 =?utf-8?B?a042Q0prU3VCM2RubXBlT1lBeDlMbkdrSWQ0bCt1RWl0NU50TS9IR3JwQnZn?=
 =?utf-8?B?NVZSbHNFWjRDcjA4ZGdndHpnNUVrMWNod2ZLblh2VlgweFpVQW4xTTUwYXFh?=
 =?utf-8?B?S1hjNTZwSGNXeDdxRmtRU2RDeEtJclpZUTlDbkRCd2phdWNWWitqMUEyU0xB?=
 =?utf-8?B?TWZueGpicFJZYjUyVitNN1A0YjFGUjk4RVpPdUhNTkNDSDFJa2FNZjFzNitZ?=
 =?utf-8?B?WHB6ZlQrKzMzbnoyRFJUVWVNSXZqT0hOV0tFaUVxL1hSSUl3UktoT1hka0R2?=
 =?utf-8?B?S3A3SmJZdkIxMjRJcE1HU3FFWWxEalRsaVpNN3prOFpVYnRRcDZBRjdISDNS?=
 =?utf-8?B?MTYxZGY3am9ZNmdlZG9PeWcwdWszTElNV2ViMUcvTVlocnk2OTBiRmRCcmlD?=
 =?utf-8?B?UEZ6WmNjdzUwbExIeXh3M09leW1DZFd4SkdFUWFkejgzUU5ZQ0hIMjNCSElM?=
 =?utf-8?B?a2lmaUg1VEQ0ZlArR1FHQUFabm9lNloveVRpakc5WXg0L1p2cDhUUmM4bGZj?=
 =?utf-8?B?aVU4eG16aGhicnVzVmYrY1J1Q01kdFk2VGdVYUEwZDB0V0NlSHFZblhvRHpE?=
 =?utf-8?B?T0ppbS8vVEkyVUNITGs3Q3NVUXNuZXY2R1cyVUZIc1ZodHNsYmpZOC80QXVl?=
 =?utf-8?B?NUxoRWFuN0NmRFR0bjF1NkZRS3ovVzVTTi9oZmFOU29XV0VVYlAvbWNwdVZ5?=
 =?utf-8?B?UCtEOVpzaTZ3dG80MGgveHlsOURtNGF6K2U3S3lZRzdYRlNBRVB4NEJqV2dL?=
 =?utf-8?B?T0VpcWFOcHpEdjJzM3RUaE1EYTFvZmlTbzBJQm5UZ3c4b3hrbUtPdFZwSkpr?=
 =?utf-8?B?NExTRG5STDU3N0tYUmp5d1RCcTMrei9KeDJuaWxJZXlBcno1UU9PR1cyemlo?=
 =?utf-8?Q?2aqeqALoxdvEtVBXdJ3SDS1fn8hkLPhJ7z1Dpxd/Ph0CR?=
X-MS-Exchange-AntiSpam-MessageData-1: OT/bcg+du/zTXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f2044b-a240-49e3-3971-08de8167cab1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:19:52.3805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5ZZeJs7PPTO0S2olL2zBLDjY3RbU68NRZksCS/JQASea423lvz4CQZTIhknA1K2oiV70Lyjq811PgPKbivfHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB8FBD73EA

On Fri Mar 13, 2026 at 12:54 AM JST, Danilo Krummrich wrote:
<snip>
>>>> which is exactly the same length as the `write_val` equivalent - it's
>>>> just that you need to remember that `()` can be used in this case. But
>>>> if you can remember that your register type can be used with
>>>> `write_val`, then why not this? This actually makes me doubt that
>>>> `write_val` is needed at all, and if we get rid of it, then we have a
>>>> symmetric API.
>>>
>>> Still not symmetric, and I also don't think we will have a lot of fun e=
xplaining
>>> people why they have to call it as bar.write((), reg). :(
>>>
>>> OOC, how would you explain it when the question is raised without argui=
ng with
>>> implementation details?
>>
>> This seems to indicate that instead of a `Io::write_val` method in `io.r=
s`,
>> we might need a `Io::write_reg` method in `register.rs` that is
>> dedicated to writing unambiguous registers exclusively. How does that
>> sound to you?
>
> I don't see it adds any value to factor it out with an extention trait, r=
ename
> to write_reg() seems fine.
>
> Additionally, I'd like to leave it open for the future to add read_reg() =
method
> returning a generic (loc, val) tuple dereferencing to the value in case w=
e see a
> repetition of the following pattern.
>
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	// modify reg
>
> 	bar.write(WithBase::of::<E>(), reg)
>
> The reason is the same as mentioned above. In most cases drivers don't wa=
nt to
> switch the base location between a read and a write, i.e. write the value=
 from A
> to B.

That's definitely a pattern we are seeing a lot already. I agree there
is a use-case for that.

>
> The most common case is to read from A and write back to A. For instance,
> talking to the Tyr folks, they told me that for the array registers they =
will
> have, they will never have the case that they want to write a register va=
lue
> from A to B.
>
> So, I still think it would be good to provide an option for drivers to pr=
event
> any mistakes in the first place.
>
> Now, obviously this would require that we also provide register accessors=
 that
> take a mutable reference for this to work, but that doesn't seem like a b=
ig
> deal.
>
> I also don't think we have to do this now, but I'd like to have something=
 like
> this in the future.

There are several ways we can achieve this. One would be to use the
macro to forward the bitfield setter methods to the containing type and
return an updated one. Or, we implement `Deref` on the containing type,
and add a set of `set_<field>` methods that modify the value in-place.

That way `read_reg` and `write_reg` should be symmetric and we remove
another cause of typos and mistakes.

I'l start thinking about it once I post the extracted `bitfield`
patches, as it makes it easier to look at the problem space.
