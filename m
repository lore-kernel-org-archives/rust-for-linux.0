Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7635919E992;
	Tue, 31 Mar 2026 00:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774916352; cv=fail; b=nKrbsN/JroLZILcvJWEGZjm3PZFL2+ZdtPLNKqJq4OKvuwTgwXzmHlF+AjqfroP1PwUzkqekP6ANG+w94rCPjgKzdPsihi2GTvTNMzfS187MlLPK6ego8c0ofVxsjGreyJZcshg+NfSgCvC/JQeb1/mwWK+3HRnFlrL0KHgr6xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774916352; c=relaxed/simple;
	bh=xRCcsOJpxDHHen3NGjnsclSKW4xyr2k+sxjJVgrIcnc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GpFIbg2x6D2x4FGj/gTVhYVkIC3Wu/s88/aEtoS7IYwWn39ZNythe/DbeefsvmneOuk5JGYkG7GDQSqNxWkCdfnvltxBuS3DBSTnmnTZO1/6+Gz1BwefFOUbSs5akt4pmt9eNYh1RGUC04ahTH4ftKpLtxez2PzTaGyuSIA8taE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YUWX3xYc; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YUWX3xYc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y43V+kamiklNoAKJzMsLyVqGBhV4Zh9dlax4vAz2zD4h3MAYf4+UD0s9zWPN5t/gKAXTyUYcqCSfLmvMQ14IyIdL1d7bOHo/a0OlESQCGnYoItHG1rcecWFFgZNztAgje10iLZbWTqmwWAqMXIBvN4FxtpV2y2e021npv2gHkpFYDK8dGs0ee155dzv0XQAxf85LyMUU4/VnY6eBSLzywaNSKuXgSuN9TBIkg5bGxSFxoNQnAMFm3kOjcniT4EoqG0IN8XIODhpYxJ2u2PfdTAYx4d4kFcoJjTV55u6/zV/05I8NrDcmfcCpskXmbYyMWHIeU5wYZKvFPMh0W4UNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nW0eOWGxzai8S1kJcrqR7o1NIwr6FWbr/mw7y4rXvI0=;
 b=btWSWHN4qKivyjMjrgAWF2nMinFIh97SNypiEuxkYA44EOs0CuJuTOsVAmRWx+29byxmLgxh4nNF0bPvuXrBWqNmueAPqb5vkBNAby/Z5hpY/EjEHqFrRXK+CSwTD57WSU5Q6z5PwABAXPaCbKOol0u5jSAjQttjE2/lqkpWcsADASOtm8lBs/WlBzOD81+gUP5GCg4iFIRjrgrANbeN8d0eiWyupwGMqjxogf1tHbQz5+t7TEfJNJnKKIY2HvGdXSe07DQkb0qfZ2WK8fpoqvF+x6Ih0ppawwiiugVDR1d/Lr0n23zw5IREaBcBSVMTtbmYkV0aXatY/d9IgxpQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nW0eOWGxzai8S1kJcrqR7o1NIwr6FWbr/mw7y4rXvI0=;
 b=YUWX3xYcXabll44OXOU84mrItX9JXfe9NQR7AyljeNh577xijAtZMWelCgFoc3KBum5EVmLEsNVrafoaJacxAcRS6V84+JBfQvdh6cxUiAUpvRoAxo7iHZsMeXXUpl5fEboN+U/5K5bfq/ttGfoloENGhvAxZFEL8Tih2LBtFtKdeChy39O4odZVnDXv7DZzi0AWAtfO+erx7jJ1eSgaKY08NONXSIoJjd+W1e8pGDJI1eH4mIld1NWbPlhf1TJEuw+kY9HylymreqXpMg6y0jVZmahNrg7MMnINL8H/vcSXzmDfOEOSAK408xk4I2P+iGGd9BvfAIzM8vj22XO6PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Tue, 31 Mar
 2026 00:19:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 00:19:02 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 09:18:56 +0900
Message-Id: <DHGJBWGJVJPP.1HSRO21R5RH79@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-7-jhubbard@nvidia.com>
 <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
 <79c3a1f1-50f4-475b-8a56-282289164ee3@nvidia.com>
In-Reply-To: <79c3a1f1-50f4-475b-8a56-282289164ee3@nvidia.com>
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cf1376-b11c-489e-91dc-08de8ebb1c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qiG9oTIEZwuccbtmwkwJ0ECrivknqs/E5N0+g+FrT7B421mP+OVwJgrWxUR+4OaBNaluasHzTtBDJGaQ+SpcMTud6OGKnKiKkK63mXBtJz+WNZbH95lkLHr7WLkAtvKTTx39U2nSFMU/326ZqKyRAqqP217Fexdc46QWzpqOorr6exC0k2N8+WIZafSR3O5qrjWMNUI6RXV4k0ehGmRYYqul/2hxq5Bhxcy8epbeNJ42DmB22uhcyrX8fykpW3KnItIXJcsOm7Tx8bgJWLLVMDCRbZ0NRJcNj3e1N2BWlne2Ef8ldMqVGHHR5jvjJ3mSSrglnz1aUhbrM5nUqUTxxJryRBXQJOTqtohNYQ1tkWyNu1QzQCDJeSrtMaQYM3JSRwvvdd6/MxrLf/j/U7ROzwbLnP4VzOcBwSk11ps+6tX0EtTEa+eiTdeHv9EZ33+z5JhckbJ7gyCsFUey6KkpFOLPN60hgbdC1HlWJ0CuyhGlS51uagrIO8uyHSIjdBTitFfns26gzHrTK0ESJ/N8H73LAmUEjx2q2y8pPctcOdWoqahgu6PDrc+oe+1xVpYXkbc7glDr01FJ3TnAGjhbqHrfRHsg0eZFDMulB+ScRgCUT/c3kONBOeHA2jqN9IlsmQu/saFRR1vcaRzLLZRInUXjHhi21PSiFW3unR7QbriN4PwaTZ4BX4VGEoMhoIArOOmEo9QvPlZ/FSVWZvaWbLW6NGI7BQ8up6eoK70DueM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVRKcnhGc0RzVmVjUC9PdWxsa3RKTEtXakplSnFxNmVOTlM1NGl6WnFsVW9E?=
 =?utf-8?B?SzVkQ3ZOU1VtemNqUGRMQXJPWjNESjA5aDBaNjc4eDc1ZHdJTkpMR3lpdXVh?=
 =?utf-8?B?dkJLcmJhbnFXeFllQXdERVVGU1JEb0tma0ZHNUF1UmtvemtlVkVBUDFXK21U?=
 =?utf-8?B?SFpZSHdNdTJGRXFNMzIzeHJCQ09YZ256TGNPNlh4WHdsRGN3Sk4yTFJ5YlFY?=
 =?utf-8?B?a1p0TTYxZWxQZVl1TU9QTkN1YjhTTTBrWGV5eE5tKzcyS3FVcCtjT3l2WTNC?=
 =?utf-8?B?OThWOE9sZ1hQODJUam5BeVhLbi9TOXo2bUNHNk1Ub1JBb1duU1AybHZzM1R2?=
 =?utf-8?B?UTd0VC9OSTNJTm5TVEdxdXNOWkUyNlRrblVkbGtHQVg0Qys4RWVkQ1laeWtP?=
 =?utf-8?B?WjI4amxaemc1VnpMNXBhVVhpOE9iby9FM3YyL2k1NDQ2YS9QWlFTSWp0YWM2?=
 =?utf-8?B?NHBsTU5ZTDZzcVRkU1Z0ZHQ2emd5aGE1R29xb1FNRzdXc3Z2V3RVMlR1aUNW?=
 =?utf-8?B?RmUvbTN5ZmsxcGJZbnExWEtYOFNIcFh1VXhPUng4aEJKNmk1MkE3Z1JSem5W?=
 =?utf-8?B?bG9BMzhiQWpEeUpLVkxLeW5KT2NYNXkxalhIMTZrYmJJaWtFVVVkamwvUzl0?=
 =?utf-8?B?RVBwZENxdnM5ZENIRCtHT1ErOXdHNjhGZjhuR29wbFo0M3BDUVpyZlhIQkZK?=
 =?utf-8?B?OVdVZWFyYnlGWjk1MGt5aGJmOTN6MTV3dG55MWdaOThFSmNpYjBWYXUrOHp0?=
 =?utf-8?B?Mnh4TlhydzJ0VmpNQWVqNVR5TUxrUktJd1JTajY2VGhWTVlPOE9ZTVFJS3dZ?=
 =?utf-8?B?WUVGT3RYRE43YWczRmduUXdTdFJ4bnZrSEQ3NmtHUlRHSUFLcEg1eFZoS1B5?=
 =?utf-8?B?dHNFRkRGQmJ0dC9JanFEM0w3bng4clBFYldPVUpxUTRCeUVRU2J3QytkREdp?=
 =?utf-8?B?azl3WmN6VzdFMVJTcCtPU1BTMWNRMWlvYnQ0eFlmN1FGeHNZV1hQUTNQbERX?=
 =?utf-8?B?UC9JRlhuOW11UHFFdDcra0ZrT0VScmR0R2Y3cERRRCtrVkEwdEV2Yk9VbVpy?=
 =?utf-8?B?aUozMklzcUYyb0N3RU9STWNyelVrdkM3dGdabmN0OFEvTGx6YkpnNXAybWNl?=
 =?utf-8?B?cHZ3NmhvQ0twMGdHYTBkcm1KMzFvRCtTVHFwMFp1MXBXRFRWRVpRTlR0VFFR?=
 =?utf-8?B?UlVTTFVJSHJ2UXpWTHlXK1hiQ21NTG9vbnJKT2NTdWZkSkhOQ2UrMEVGVUxq?=
 =?utf-8?B?WlBKNVk0eWN3eUhPaUMvY1FsT0IvU1BQdjRnbWFEbndVd1c1MEszMk1RUVJ6?=
 =?utf-8?B?NGNwMnZJd21zZHRMNWI0Q3M5bFppL3FoNjRzbUo1YVhtaGtmbk1KdnhZTi82?=
 =?utf-8?B?OUgrTGRsKzNWcHZrZklxTzIrUlBRaDR2WkJvcmZXeGE1Z0k1SnZlb1ZCTWEr?=
 =?utf-8?B?WlJNYm82Rm1DWmdpV1B0ZjhxS1hLVW1qMU82dk41azYyRXF0a0NRQUh0QWFz?=
 =?utf-8?B?ZkFJZXZDdEV1Vmx2U3ljelZ5MDlMZVh5UHBIYnllOHI0QVZveDhDWmlkV3Rn?=
 =?utf-8?B?dmlnVHYvUGJoS1VYbkw2clJCVzNCaVVPYWNDTmx1eGlvTk4rVjBnL3hvM1Fu?=
 =?utf-8?B?N1M5RFhSOFNITXZmK2dPSkN1WUE5cTVoMEVXTnV1TGgxR3dveVFwaEJhM1FI?=
 =?utf-8?B?ZFg5MUp6a2hkZzgwS0d1QWVLdHdXUTlDdDdvY1NKVExTTjhuYXZxcDRlLzJO?=
 =?utf-8?B?SGlmYUtvUlNwWmQzU1FLbW9qd25NeU96N3FVcVRSdEZ6ajFRdXlEZkxzWlJU?=
 =?utf-8?B?Qk93dWZlUTNod1lpWUtDQXQvNlVxUVhiMnJqbTFkYXN5WXVXa3UwNEUwZlYz?=
 =?utf-8?B?SmlvMnJMOWUyZW1nK0FCMkxpMU1lSFpjRzlNWE1HeWRtVEJSeVc5VDdBbWYv?=
 =?utf-8?B?VFV1eUV4aHc1R1hLYm9vVHZib3lmQUNJaWpwVWpmbzdHcC9uTXVjcU9QaDF6?=
 =?utf-8?B?TWJETml6bG5ZbGdTUVRKK2JWQVpyOXQyS1Q4U2V4amE4ampjRy9DK2VxRlRx?=
 =?utf-8?B?bnJkSHZIK0pCTUFWZWcwYU9qUnlUM2JoRTkzZzZ0d0thdUJLeXRpeWgxZi9h?=
 =?utf-8?B?VU40QUV4elBsSWo5RGNUbzNSMEdzSzU2SEg3a2FFdGorZWZvajIxVU9SNWhm?=
 =?utf-8?B?OENrRENWVFhMWmFjcFRxeHM0WFlHRU9PYis0LzFDemJpdnFCdzdxMFVremdN?=
 =?utf-8?B?ZjVNRzZHRG82a3YxVS9HRE9aWHNxcVZ0VnZiTDVBNzlvcUd1TEhKVWhaZXUx?=
 =?utf-8?B?RUZGRzl1Sm9ESEprRnBPU2wySmpwSzRxZ3dUdWY0MEZrWW41bDdtaGtoVW1F?=
 =?utf-8?Q?UuwLNEgXQqI33KUKNrcvTCtmN92PqxjyEUvmqMok90MoT?=
X-MS-Exchange-AntiSpam-MessageData-1: ja4wxHAJIsprqg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cf1376-b11c-489e-91dc-08de8ebb1c28
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 00:19:01.8137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubckOnxqW2I9TCwgFZ6ZSbwn5Kz4R/JUmAL2AaWRQ4wIrLrT5Ab3R1pxC80nNOtErDXaB9W72zalTOMrmShOcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163

On Tue Mar 31, 2026 at 3:33 AM JST, Joel Fernandes wrote:
>
>
> On 3/30/2026 10:52 AM, Alexandre Courbot wrote:
>> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>>> Hopper and Blackwell GPUs use FSP-based secure boot and do not
>>> require waiting for GFW_BOOT completion. Move the GFW_BOOT wait
>>> into a GPU HAL so the decision and the wait both live in the HAL.
>>>
>>> Pre-Hopper families (Tu102 HAL) wait for GFW_BOOT completion.
>>> Hopper and later (Gh100 HAL) skip it and boot via FSP instead.
>>>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/gpu.rs     |  6 +++--
>>>  drivers/gpu/nova-core/gpu/hal.rs | 41 ++++++++++++++++++++++++++++++++
>>>  2 files changed, 45 insertions(+), 2 deletions(-)
>>>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>>>
>>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.r=
s
>>> index f70bfbda1614..8332ad67c0af 100644
>>> --- a/drivers/gpu/nova-core/gpu.rs
>>> +++ b/drivers/gpu/nova-core/gpu.rs
>>> @@ -21,11 +21,12 @@
>>>          Falcon, //
>>>      },
>>>      fb::SysmemFlush,
>>> -    gfw,
>>>      gsp::Gsp,
>>>      regs,
>>>  };
>>> =20
>>> +mod hal;
>>> +
>>>  macro_rules! define_chipset {
>>>      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
>>>      {
>>> @@ -311,6 +312,7 @@ pub(crate) fn new<'a>(
>>>          spec: Spec,
>>>      ) -> impl PinInit<Self, Error> + 'a {
>>>          let dma_mask =3D spec.chipset().arch().dma_mask();
>>> +        let hal =3D hal::gpu_hal(spec.chipset());
>>> =20
>>>          try_pin_init!(Self {
>>>              // We must wait for GFW_BOOT completion before doing any s=
ignificant setup on the GPU.
>>> @@ -319,7 +321,7 @@ pub(crate) fn new<'a>(
>>>                  // still constructing it, so no concurrent DMA allocat=
ions can exist.
>>>                  unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
>>> =20
>>> -                gfw::wait_gfw_boot_completion(bar)
>>> +                hal.wait_gfw_boot_completion(bar)
>>>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not =
complete\n"))?;
>>>              },
>>> =20
>>> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/g=
pu/hal.rs
>>> new file mode 100644
>>> index 000000000000..164410992659
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/gpu/hal.rs
>>> @@ -0,0 +1,41 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +use kernel::prelude::*;
>>> +
>>> +use crate::{
>>> +    driver::Bar0,
>>> +    gfw,
>>> +    gpu::{
>>> +        Architecture,
>>> +        Chipset, //
>>> +    },
>>> +};
>>> +
>>> +pub(crate) trait GpuHal {
>>> +    /// Waits for GFW_BOOT completion if required by this hardware fam=
ily.
>>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
>>> +}
>>> +
>>> +struct Tu102;
>>> +struct Gh100;
>>> +
>>> +impl GpuHal for Tu102 {
>>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
>>> +        gfw::wait_gfw_boot_completion(bar)
>>> +    }
>>> +}
>>> +
>>> +impl GpuHal for Gh100 {
>>> +    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
>>> +        Ok(())
>>> +    }
>>> +}
>>=20
>> Please take a look at how other HALs are implemented: each HAL instance
>> is in its own module. That's not just a cosmetic choice; it allows us to
>> keep the chipset's specific HAL struct and its helpers completely
>> private and forces us to make code-sharing explicit. Furthermore, this
>> particular HAL is bound to grow, so let's split it properly from the
>> start.
>>=20
>> If you do that it also makes more sense to use constants (contrary to
>> Gary's feedback on v8), if only to align with the rest of the driver.
>>=20
>> Once this is done, making `gpu::hal::tu102` absorb the `gfw` module is
>> trivial, so let's do that while we are at it - having `gfw` as being
>> driver-wide makes little sense since it has a very limited role for a
>> specific subset of the chips we support.
>
> I feel a HAL might be overkill for this. Looking at the series, this is a=
lso the
> only method. I am doubtful future architectures will have to once again w=
ait for
> GFW boot (is that expected?).
>
> If not, we can just match or conditional on .arch(). We do that already i=
n other
> places.
>
> Something like:
>   if spec.chipset().arch() < Architecture::Hopper {
>       gfw::wait_gfw_boot_completion(bar)?;
>   }

It's not about the size, it's whether the code paths diverge enough. In
this case they clearly do, and using a HAL lets us get rid of a
minor module that was at the root of the project (`gfw.rs`) entirely.

I expect this HAL to further grow with the different boot paths as well.
Not sure if that will happen in this series, but it will eventually.
