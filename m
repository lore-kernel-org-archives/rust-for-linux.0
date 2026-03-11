Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD923D7F0;
	Wed, 11 Mar 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235729; cv=fail; b=ltGnwDGHU1ruAIkExRG0vR1VzT6G46I6gKiqaGwLlCO0jaECkaoX5xYL0EWOhXsV9mjrblChpWfTcsDttYjy7/DVxihUxjd06PjKnNmufkzTtfJe16xhpWfmRJziWpfTlgJwFFCMmM6hVoqCztimoSAnZet5zByq6Z6grV2wBec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235729; c=relaxed/simple;
	bh=Uz3XpqJbL0RgJAItQ/1Tej5pxbcJ8QPfxtpJQU150EQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iZLRT7+FSnj0cGN5bsVvqRHteCcP5HAV2AEoIYYjasSZO9i/SiT4Yrw20N85ucArGAii5gEIiO4PxhmDUp0VIcw0c+p3EHrJtpvnC0eFwbBoJWbMyCSYtv35CmfJ95YXBJFL0DbAIqZyUjuWe0uQvmg+lpxqd07zRk7kTZPNqb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W6M0avvF; arc=fail smtp.client-ip=52.101.61.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W6M0avvF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bG+T9rDcqPdAO0JERE8ekNexv3vT3JFI3pfqkORH7SHvbvb7of8g450lAlE4kGDFzHpan7e/W4JsgsWmF0ydjQpuwgPBNYQHJDZEUg0bgNURf35G2nJCrpgdSEPGx1n2bojVrlinwr69O+Sjuu9Jv8Mqfx1ZO6KUlb1439v/G+3IELlfsSug98oHSs1umlqScfjm4rXvZay2Yf/VPN8tK2/o6yDgTowbL/2VF+tg/sKC5cosKP7FQHyvkXgEZvr2opjaXhPF+v75Tav9PiEiOikiivoWJXdN6NPDxhx1JukZJtpWe/GK7mXrcpUgKUVNOXPIB5x4BpEwUhxIrhpGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYkQFUfsbD9ig5GWcxP+TxXpqGxOpvmz23R8T7zKkhw=;
 b=ZDEYOFZsrjPe+qNaHBc5Ll9lXCW0geQiOM9bw3acFl6sdnr8/QtVnPVtjbyGouTrz7y0iaqMCQgQX/nea1N1oLI3VAjisIrvJwkJvmYcNO0QZJgGlPIC3FR2tGhO6wNrb00rdcgsYYe92x9o+NosgROxyC2MedUhOBEanRcXm90wsOlrlpm9bDO8vClabOwudka2Nst2zMLsdd5qn0NGKOG4VZ6piMr5sI9epXCeeebOo4xjx52W+7C7fhzrrzfc5rHsRwi0bPS9XQnvhvpri28PpucOVWAfaBHGIimxA593AXFDyRR+ISH7ovv3zp0xqfgfwBMnxzu0rqFsXRbNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYkQFUfsbD9ig5GWcxP+TxXpqGxOpvmz23R8T7zKkhw=;
 b=W6M0avvFZ85qd+UAl3si+VL4dKkHwXa7kKkkTIGsHVjGiN4b4xeHcIYuhtGtgahtqTotIjvIrqdmsurMAQdjnBbT2HQLv+6x1shToctrEF5Y1tdaoz49mSiO0GC9anXXPI7fB0A+9un2X2dMzc9BMd7Ac1uJqTTnKemXnNE6YhoJ4J+34WMZ64iNCPfCaKRpAKNoSr94wPwX+ybeXwyzfEQATxf/WaakVbo9gQUmoXZZs2D2M7CXqulXsbmjXUFoYlj778MjG+TvV4EZLH+PZ+H9gDCIFzNRs49fMMaAYaqZGZSvyTkMZkz74dnj9gKHfytbkE6Up9gARp8JQPVDCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 13:28:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 13:28:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 22:28:38 +0900
Message-Id: <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
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
In-Reply-To: <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a0b862-bd94-4b14-1af1-08de7f721ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fnh8Cu6G1KxJZLUyN2KCQg64sEwkAx13QGUJNkDigG2imuTxfdPAcBLk8HNtRsRKi862HKZSyG7eXDrzDfILycaeHXUJQAdUu7XfcLUff7oOUS+s+dAL19BWf1dxXHeGoTyCpD/2MBRFIJR+mr9seM+zu9tG10iLq02h86OfKGTg2L90BqV48trsMz17LLk7Z6QsGO+FDQ5E4+xfapsFR640xxh6+giKgmHkMyOmcDVYifLreIY/lVvTcenuJ7BTTShNPfDsZzZGTE1pqi6W2Pj85p+FCURNAa729j8Jmklw5kmunSE85ayoE67i8b3V9RKRKoNWijsmjiwFMsvrHQqTIpIKFnaUGiAZVASzzCgb2gLHT9QgpuO0fje/ga5TyNZgbVQUox1JRqwBlyf80/ARF+uPQ4czFVTbHYUt93uTeDQNqQsiylc514k1k15NnB4uuNcntSF5i8IoLFfItFhGoWsULa0qtQe9bgXt470e+U5fkywz/0UmZAURMbO85Odck/8ZbWzfqhGQvjRTGNFz+s/f01hfWqhC4RGvyPSQiakiUlmR6fijhUi3xPHxzKly/g6CGKPqxGp0fHlitbQ9NayfocsnlDJ9tdPzncWL6Q+6z4zOwnHqLfIpxS3f6wtCGrDmphostDpXUFy8SxLQjpr0UijTp2ZxEQnUqcPkHVveUAgC3tAY8g7CIjDgjtIzSNRMnkgginMGhSafwE+s5cR3evDGM8EJis70BSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rncwc3Y1YUJPNXVSbUp4bjlYUmtyTytuVDdNbFpBbUd6OEVSbnRLNkxiaG1W?=
 =?utf-8?B?d3Z5Y1prazBpZFpkZjhxU3dlL3dGcjJZT0VPRCtBR3B0V1FLV2g4N0VyUmNm?=
 =?utf-8?B?TjVuZzQwMGh4REVmZ1U5SXNOOXBtZDErRzRGck9ZRmlLSy8wNGVtcmpNRFpx?=
 =?utf-8?B?QitCWVZFa0t2OFJPZzdRSW5QTmZ4bXdOYVVSRmhVUHYxREtqNzE2UWtoK0JT?=
 =?utf-8?B?WDE3SEkrdzdweWJiTVZIdVFmaWZaWjgybHkvMytFZUNuVUMvb3hXTDhIckZY?=
 =?utf-8?B?eFlncTU1RzU0NitwUkZ0SEtFVnc2bG8zZGNxOGFpNldjNE5TUGZEd2Fkb01K?=
 =?utf-8?B?dE5CYzV4UzZFRTlKSmZzYlpEVmdVZWNHMUlXSG9PTUY2dzZUb1UxeHpMaU4r?=
 =?utf-8?B?QndDMFIvSU8zSWJWeHUvOC8wNHpWS1RLcTZrNlVORFUzTU9zY2Nia2ZZUVcw?=
 =?utf-8?B?SUdtOEF3aWhTYXo3NG1ma1drdDNXQU1QQm4wK09aUnYxTXJHZjZiWVFQeVZH?=
 =?utf-8?B?b1F2aGp5cjR1NktXZ1dCaEltTnROQ0FLYzQ1QVpLZ292YSs4NENHQmF6QnpE?=
 =?utf-8?B?anJiOWoya0ZCUWdtZEFrWUtSZnIxSXEwam1VNlhpbndBOFBWUCszMzRSNGkx?=
 =?utf-8?B?UEg3eUZySDZGcm5SU2ZnTWRheDZnZ0tuNkxHWGdCVjBpelpxYnY1QlRHVnph?=
 =?utf-8?B?K3dvQ2RIM09qZk1XS2NsbHJLZVZKdEdGeHU2Z2tJOWVpbmx5OVhXdS9rR0tF?=
 =?utf-8?B?WlFrcXl4TVlMQkw2cUFoRlBORVg3ZzhLVGxkWnRaZ2xRZTFwM3JDRmhwWVdn?=
 =?utf-8?B?UUxNL0JNRW1jeXlGd0FjM2k1SDdkTlBNQ0R3cDVidWo2K00wQWIraUtuT0c5?=
 =?utf-8?B?alBFWFhXNkw2emQzM1RXaDFmNEJnbnhCODFvWG43L0VLTEx3N21OVUs3SDFZ?=
 =?utf-8?B?YjlIUnB1dW9tTEZ2WWFDYmpSSXlvcWhRdXg5N01Rbk1hQ2E2WEF0YmZLTWE2?=
 =?utf-8?B?NzNLejFyVEYxd3JCU1Z4V2RjY3lXempSLzc3bXNtR3VjOVBGY1d5eW1sdnhu?=
 =?utf-8?B?RC8yQUR4VDRWY1lxTDI0NWNFNEZFcTJoMmdrekw5R1ZrdWZQTUk2NGpzSS9t?=
 =?utf-8?B?NFlSd2cwbXRYUGxpaGVxUGRUSi80a1ZVUDlSNHVaM29ndXFhUE1RQXlKNkxO?=
 =?utf-8?B?TUJiRS96RHFRK01GWCtHNndESm0vcUpDeXh4MUdxY1Y2dDFZNGxKVUorb2U1?=
 =?utf-8?B?YzQ3VEtrcjc0MzN2OEhoWGpQMGJpODJaMHpQT2VwREU1RmxVVDFQdzV2S1ZO?=
 =?utf-8?B?NDBEaUNyRTloVFYwOHFDckNCTS9qallDNW9GSXBzWGpuZ0hyS1ZFYkEwWFZO?=
 =?utf-8?B?YWs4YlYwVEI1YURxMlA2ZzJ6cktHRHcwZ0QveTZBcGNSWEZnZmd1OHNtakV6?=
 =?utf-8?B?RlRJM0hVTXZYZEhZMHJWdmszYnNCNXVML24xdHBqUVNiVUhPc1lmNmFBckZu?=
 =?utf-8?B?ZXNqR21TVHArUURPMk1tVDlnMjF6d1VYYkN5TVM2L3VYM203Nkd0M1NrYmVk?=
 =?utf-8?B?L0ZyQmZNeFl2dS8rM09RK3JGeDVhQWVrdUg4OXE2a3NWWktlZmRXUmN6SlFN?=
 =?utf-8?B?NTN0UXlpNCtzekQ1VmtBcFBLbE5zSytnT0lSL1NOeWg3ejJIWmFBUzRiU1Zr?=
 =?utf-8?B?eE1ubHAxRE1VU1FvOVptQjU2eXNxd0ozRGYyTDFvckQ5Z1NsclBXTTd4TjVk?=
 =?utf-8?B?bTB6cmh2S2dKdFJmdk5HNytpeWo3bU5haWQrUU9VOVpBNzh3UjhWMy82cWlP?=
 =?utf-8?B?VGtJV1dEdlhlbThaY0lGVVRqVlNoQW01aEZIcmNudUJlbG5GOUNlZ0VtNVJW?=
 =?utf-8?B?cys3UHN0cUN6eUM3ekEzODFXTGpJMEJuVW1YR1Nkc0FFTDhBYzR0bUNwV0JD?=
 =?utf-8?B?Mmk3QUdUYkR1cTh0aWE3Qi9yR0VqYkYranJQS1l5aG9ydm5sK2xCY25lYmNS?=
 =?utf-8?B?dXF3QUx5am5oWTdjRG5pREM2U3hGd250aFBoOXk2S0ViaTdqU000QlBJcVo4?=
 =?utf-8?B?YzAzYVhPQ1VmOXBWMmxRVHRQL3J6MUpNSUNJTThpbnEwaXQ3cG00UmpLRzBl?=
 =?utf-8?B?L0plNWc4V1JpRitQUDFlZHVuRlpYalh1NCtabk9XQzdaSGZPc2NxRnFzZHJI?=
 =?utf-8?B?UFJPUlFEWG9WSVJCcGhNbmNpMkZpbG9xTGk0K2dYU24veGFQWHl5SG1nS1RY?=
 =?utf-8?B?eTdKa3Y3N3MzS01QcHdxaEduZ3JNaHUvNjg0Q2UxZ3ROTFgyTjBNRGpkYnBo?=
 =?utf-8?B?Rng5K0YyYnJsRUxGdHUxc2JvTjB4TytDdS84UGxURWdxRUZkdEltYmhvN1Nn?=
 =?utf-8?Q?b2j9w7i07SgSU4pXWIk0wtefDKQuNAPHkzqu/avS0xhmC?=
X-MS-Exchange-AntiSpam-MessageData-1: NKRiPwh/29Rpgw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a0b862-bd94-4b14-1af1-08de7f721ce4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:28:42.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vpnp1MQ4DuC8GkzYCFdZPj9J4FcVVealW+4tVSq4kk6dDNphbIohl92+ULQ17+CB3lRFb+mW8mmJQiaCWAj5Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792

On Wed Mar 11, 2026 at 1:34 AM JST, Danilo Krummrich wrote:
> On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
>> +    /// Generic infallible write of value bearing its location, with co=
mpile-time bounds check.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// Tuples carrying a location and a value can be used with this me=
thod:
>> +    ///
>> +    /// ```no_run
>> +    /// use kernel::io::{Io, Mmio};
>> +    ///
>> +    /// fn do_writes(io: &Mmio) {
>> +    ///     // 32-bit write of value `1` at address `0x10`.
>> +    ///     io.write_val((0x10, 1u32));
>> +    /// }
>> +    /// ```
>> +    #[inline(always)]
>> +    fn write_val<T, L, V>(&self, value: V)
>
> Still not super satisfied with the name write_val() plus I have some more
> considerations, sorry. :)
>
> Let's look at this:
>
> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>
> 	// Pass around, do some modifications, etc.
>
> 	bar.write_val(reg);
>
> In this case read() returns an object that encodes the absolute location =
and
> value, i.e. read() pairs with write_val(), which is a bit odd.
>
> In this example:
>
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	// Pass around, do some modifications, etc.
>
> 	bar.write(WithBase::of::<E>(), reg);
>
> read() pairs with write(), since the object returned by read() does only =
encode
> a relative location, so we have to supply the base location through the f=
irst
> argument of write().
>
> Well, technically it also pairs with write_val(), as we could also pass t=
his as
> tuple to write_val().
>
> 	bar.write_val((WithBase::of::<E>(), reg));
>
> However, my point is that this is a bit inconsistent and I think a user w=
ould
> expect something more symmetric.
>
> For instance, let's say write() would become the single argument one, the=
n
> read() could return an impl of IntoIoVal, so we would have
>
> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
> 	bar.write(reg);
>
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
> 	bar.write(reg);
>
> and additionally we can have
>
> 	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
> 	bar.write_val(WithBase::of::<E>(), val);
>
> The same goes for
>
> 	let val =3D bar.read_val(regs::NV_PMC_BOOT_0);
> 	bar.write_val(regs::NV_PMC_BOOT_0, val);
>
> which for complex values does not achieve anything, but makes sense for t=
he FIFO
> register use-case, as val could also be a primitive, e.g. u32.
>
> With a dynamic base, and a single field we could just do the following to
> support such primitives:
>
> 	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
> 	bar.write_val(regs::NV_PFALCON_FALCON_RM::of::<E>(), val);
>
> I think adding this symmetry should be trivial, as most of this already c=
ompiles
> with the current code.

Not quite, if I understood your idea correctly.

The new `read` would need to return some new type (except for fixed
offset registers) that contains the corresponding `IoLoc`, creating
overhead for the default I/O methods (so at the very least, I think they
should be the ones with the suffix). Accessing the value of that new
type would require some indirection, and probably the return of
closures. And having two pairs of read/write methods that work eerily
similarly but are marginally distinct sounds to me like it could itself
become a source of confusion.

>
> Also, let's not get into a discussion whether we name on or the other wri=
te()
> vs.  write_foo(). I just turned it around as I think with the specific na=
me
> write_val() it makes more sense this way around.
>
> But I'm perfectly happy either way as long as we find descriptive names t=
hat
> actually make sense.
>
> Unfortunately, I can't really think of a good name for write_val() with i=
ts
> current semantics. If we flip it around as in my examples above, the _val=
()
> prefix seems fine. Maybe write_reg() and read_reg()?

The fact is, there is a symmetry between `read` and `write`:

- `read` takes a location and returns a value,
- `write` takes a location and a value.

`write_val` is really nothing but a convenience shortcut that has
technically no strong reason to exist. As Gary pointed out, the
counterpart of

    let reg =3D bar.read(regs::NV_PMC_BOOT_0);

is

    bar.write(regs::NV_PMC_BOOT_0, reg);

... and we introduced `write_val` for those cases where the value
in itself provides its location, as `NV_PMC_BOOT_0` is redundant. But
the above statement could also be written:

    bar.write((), reg);

which is exactly the same length as the `write_val` equivalent - it's
just that you need to remember that `()` can be used in this case. But
if you can remember that your register type can be used with
`write_val`, then why not this? This actually makes me doubt that
`write_val` is needed at all, and if we get rid of it, then we have a
symmetric API.

We were so focused on this single issue for the last few revisions that
the single-argument write variant sounded like the only way to handle
this properly, but the `()` use proposed by Gary actually fulfills the
same role and doesn't introduce more burden when you think of it.

So why not try without `write_val` at first? We can always add it later
if we feel the need (and the same applies to a `(location, value)`
symmetric read/write API).

And most importantly, that way we also don't have to worry about its
name. :)
