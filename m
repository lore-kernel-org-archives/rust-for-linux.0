Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969A207A32;
	Tue, 10 Mar 2026 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110213; cv=fail; b=bpONs1eOzss4FzDT2fJno05+/h3FNh76UL9cdrJeIIC1dxNE8LQvYLty8f/CCyajM6qZ3bXiW8yUtnk7N0cQcV0mWPEdJTKuqrYDqvNrQx0ecBhcGcM7cL/5Xql6978G6vAgRNsWV3108fM9ZE2ji91Ng7ryOT7Dqlqd02nleIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110213; c=relaxed/simple;
	bh=OAYgIEPiDtfyT7qo6pfpJdNCoaYK2tvSj3vllWtbV+U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fBpbrRFza28qFGZ7xsBHSxuEV8VHv9hYF4NfC4YYLCfx+Fyo6D4WQiwDWIyHvCSyk6BDpw3rOFsxUMQ7r9wmVJnPk4PAiyd1o3/9Q6HvpdG0JU3eG+Dd9lTYKHlnP/DKQyWPVTuTiZ4kuZWpDLuVqAwfdsMWZWOxbL5fjtrUyps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qfYaEPCF; arc=fail smtp.client-ip=52.101.85.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qfYaEPCF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdC9B/NG9gWT49iwFfIlCq7dPbFQpT59IzwRcPk9C7IExz8xtMnJGcZQMT0EDsMJVmuxifpfiL/jvVQl2wVAT36w4fyu/JwMfeaTPnFslVERxezrH/f1wtZ0TysUdgDmAdUo8UFLi8sjo3Btw54okj03un7Cjmr0HlVMA7Ct7fYENEdds5fhkxHv3sLYThFXXjPDN2VQuN/2QAQ5uKQ3yQCaw+5so57degEnZ1brytx+DIgAEC7kjx8izLfL7jnNxrn4NsoEdeW7plWNa9Oj467ujAnitepphoOEO0xz8SbI4AUT5K4VHbpsjGUKKusCX9nxQgClLePO2ACuwzFASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiThGwux01eBL5Nb5cwDmDTc2Ki+G20WQCY7HU26uHI=;
 b=JeRs8Sz6rzmOM5Y+3nMo2JXFLV1M9qAPl8r5d2IhOB/0ueN6+/SlWjXqOl8P8itZ/kkCHxllfizky9aG0NkHoy33ihEZf16oVywH20WTUs9Hne+fnMD/i0rgOePwWOghL/VyHb1aBgnl6IrITE9exV/m4xcEdtlYaECO8wvIDAK3pqxry6vEi0xoOgGNzvFbm0cr2RBVozXwJvG01uuRWKCwfUIRf+3/w6eKr0nBgGZBctJPO9ThStZ2mwzKgiVWrS2lzDKg09cqLMWJFWwhfvCGZ/adtg8SRgbSOI9BKWt2piqBwNNbdd4isWJZKIxcFmwII4VaB6FtlO06sn+9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiThGwux01eBL5Nb5cwDmDTc2Ki+G20WQCY7HU26uHI=;
 b=qfYaEPCFc5odVVksJm7GBy8tptGq/8atApa64ZSyIFI2E55pkHlUW3uOSphmc/7cwUQDXUsi4gLvD5dGT+64W+F/NzWRzw4dy5wjkoVJ/dZ5dvQA9Vwkc69k5n6hrMYUgnwXK6ruTX4B6JTcNgUEXuX2Q2IwqrLjukaZti8cu5J7BmKVfyy+XFjW8TKQkexMa5HX1s9pekU1ZFKMoj7fvzwjNoSYw7TXMZ38SyQ8PFws2SM6G4mUfyx38T0/LIea6t57xYr2Z0FDpZ4Fhw5IDCSQF2Pd1FWDWu8UM99rRoHvWrH3eHtX3FCrPMdAa7ajE42JOHXtTnpgNfJy991iPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 02:36:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 02:36:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:36:45 +0900
Message-Id: <DGYR3ZICOYFB.2ZHQ2CTUO2UIP@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
 <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
In-Reply-To: <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c7f74b-13b0-401b-590d-08de7e4de146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	vATzUG1SRVc3zrjCYDHc9mRp9KGej4n3yuvNts7M0+crhXGNrtHIA84qeXTr6HCBV9owpd6eHQImLrAzWbG/0zh2dUhuoJ5c9gh3Cdx+2RHWveOVpNEhTOGKlYxOy8sJJ3jSORJ4BnMhIvkMLxDs9yFFasyovx83UYY+YBKoRD5xHT29QELdH77eN/EQH1qa40z7yoV8qAhnL1vy3F5g6Ev0NvNbhU3WbYu8NexmqM1HK5VETZvDvUACiuz5scEpk12JIBuM/Epw5UjmSO+UivIvmF/SN04KBtQ9ElVi555vTNHc5uuNNiqVBjWbpKC6kEOto64wS8Bu1ehL5MYJwa2qGHCxNYAQhYH6B5JGLPGGjTpuckzrKl85bcuq2a+NnfTy4KEid/KJvp0VPOkFHtVRvMqOAZeXcraZZWL/K/xycRa0nn/gHEvDNTUea1Q+Deyv7t6xK5VDToyp1FR44CaFaV4rZOebvOJqsHP+4eEeDR7l0YhDrl0kGuq7m/RqnPkHMTW7a/XSmfB3qtLPsSRrL4npdtjHkESxr3Dwe97Fh/IS6kVDs4CmWRVZzyEcoHsxXMemvnL91KsHk1E/zmL3q0yuyi4qlZKofAliFRLUSiUYDhF4hqNPIoDlVgULSuumlr7N713aUEn1hdiCvbkw6S2uUHsvycaKAUHSkS3fsIbIHQWWMJbPPgI3SzXjABo3Z1bY93jt0cI/FDGWLujt8uG5tzkRqEYk5iM3Efo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0hkOVJuUkdJclJ6SzZBcGF0cWNQWFdZb1lKNlNDTjBaZzZyTjFNempvbVYx?=
 =?utf-8?B?WFZTM3EvejFtVjB3cE5HblpSWFFYdVpZcVBZemlzaXZwOGg2dDM3cElNKyt0?=
 =?utf-8?B?bTR6WlY3WHZGckRlVDQyL1cvaGtaTDI4TVhXOTFlUGNaMlJFOHZoS3F6K0o4?=
 =?utf-8?B?QWt0Y1ZwMmxjaDlkcW1xTUgwZVNhOUtGL0g4bE81OEJqUGdtRG11aGViZEhM?=
 =?utf-8?B?bTdQd1RJalN2dGRWZFJUM1RFMFJqQnhSUWNkWVFSQ0RuUkU2czVzclBFbG13?=
 =?utf-8?B?dk1aYmVGR3JaeHdrRnlwYy8vdnlNMTh2UllhN0d1bVYzUG0rRzdoSXRsSDEw?=
 =?utf-8?B?TGdlcW90bkp1NElHeDlJRzU2U0JGWVJtY0ZyTzNaa1VRQnFScDNNa3RsRWJm?=
 =?utf-8?B?aW84U1FiQ2lWaHVSWVRuWldtUUlRWDhqelpRdEFjQzdBajFFUkc4bEdVNzBa?=
 =?utf-8?B?WFh2SGVlcHJBSGJnUmtyejB6azEyNHd3eUxJZjJ1STFyVjBpdDBQTmxiTEdC?=
 =?utf-8?B?YmlLako0b2gzSGo1cWp1R0VxbEVkRHdaSWF0czllY3o3cnlhTWxFQ3FTRTcz?=
 =?utf-8?B?TERlU05qMnk1cG84NmlTNlREUHQxdWxuVmUvTzVGUmZuOHRBaWRtaXpTcVJF?=
 =?utf-8?B?U0ZVcDlYT0ZoaEpXTGJwRE8wbkJ6WE42ckRRN3VZT25RYlZ1NGdpSHZ0M0Yw?=
 =?utf-8?B?SkY2TGRRdGhUYTMrU2RxQ0JXRGNKSmtpMGg0OXhmU08xZVhYdkxRbG1Rbi8w?=
 =?utf-8?B?QW1aa2NpbGF2SDJoQWxYTHJzWEJFa3lRU2p6cnFsdkxydVFXejgyc3NTcFBM?=
 =?utf-8?B?UTFHYXdITXR3MExkUFVPYmhXazJwNFc3eExnUTRORWZuRmZ3NGdZOUdjMWtM?=
 =?utf-8?B?OUR1NnZMaVc0Q3F3WmxuWDFiMXlBelgyS21CSThUMHpQKzlpL3c2eHVNZjM3?=
 =?utf-8?B?VHhyZ3JrVU91OWtDTTlOZ2plK25wK1Y4Y2taS0NLNCtxRjlPU0hvaktYaUM2?=
 =?utf-8?B?K0l4VEZoUjBjODc5VGx2QTY4OEUySDExWHpRc2l3TlA3aVBhRU9GakJwVkp6?=
 =?utf-8?B?U0xHZWkzclpIZ3U1UnJzUXUzNU1ZelNsUzJxZDlOZVlaUERweGh0WDQzaDls?=
 =?utf-8?B?V1NPSENTNmdadzByWXpTWFFLcDkrNXlDcGhTeS85ZDY3dngycW5MYk1kNGhq?=
 =?utf-8?B?N0FoMkxQR2JmUzVzQnZtV1JtQlBqcUJRSklML2krZmdTbmdaM2E5d3BjcElT?=
 =?utf-8?B?M1JOV2pWLzNzNDFVbTN3UWNPbDRkOE5nS2FmbE9CMmJvbGxPMW9XMWZ0dTlF?=
 =?utf-8?B?OVR3aXNPYTRxL2hCM0V6U2dkaGsxWU1HWjZoWTZCYlhBTW9wRXVXYWFiUjBT?=
 =?utf-8?B?dGVtVURGaDdadURza2ZhellmT2xwL09IczJ5cVFNa3VmakpFRmYvaVJqZFdS?=
 =?utf-8?B?VENaaytxam9SVldDTFc0c2VNejN2QjJGa0VDL3lGR1lkQ2RKa3EraElRL0hl?=
 =?utf-8?B?a0RUS21Ec0RWb3ltcWNLd1M2WjF4bGVWWDZ5ajlXckFGTXphQzY0K2xkR1hD?=
 =?utf-8?B?YjNON3NOWXptTVR5M3RFZ3A5a0pZZDgzMkFEQmgybUNxWmV4Zm56b3ZXOFBT?=
 =?utf-8?B?T2RDdTlJSlJML01FcEFvc05MT1B1SzVjOVMrSVozL2ZOSy9LZUpEbWJja2Js?=
 =?utf-8?B?S3ZqMENOZXB6UVEvMWFFb24zZWhZZUdHVy8zRzBlbzkyTUxrTGVNTFdDVFVt?=
 =?utf-8?B?bmNDK21sWjF2M01mS25vSlE5elpRNWVaNFp4bCtLT3ZjVkdGSEE0ZDRuYWps?=
 =?utf-8?B?bk14RmJFalRMMEIxVG5uZlZEUkxsYWJoWm0vR3dRL1pERjgzckNRQStUaUsx?=
 =?utf-8?B?WUZTUzAwaEJjejNhNE1UdjA0MVVVcUJpM20zcTc3UjRLeTNVdFQvY1g4YS9q?=
 =?utf-8?B?K2lEMXlCMHpqMlhvRzRzRkxDQk5GNE00clNlMDJ0QmhSYVNFbCtCWi9ubWJP?=
 =?utf-8?B?enhSRnljSlozV3h6bUlDN2kyVzMwZ01lQklCQVk4dHpJUURYeDJMSXZXOEhI?=
 =?utf-8?B?aFZMeSt1TGViU2VESW40OHk1NFJuMzJFWnhtVnM1Rmkyc2ZtK0I4K05ON0FK?=
 =?utf-8?B?dmhiY1lRcitISm5ENHN3TitxN0ZmWHQ2VElmSmphRkNLQk1lZGh1OEpKSjR5?=
 =?utf-8?B?RkszaXliaU5uMnUzcUhHenluVzFCenpKVytlVTdGRUx3R1lrVHZaRUZoaUsx?=
 =?utf-8?B?N0krNFhlSW9RSXdqaXo2ODhTd0VPeHR3eWxGOFRGbmN5c3F4QmtPV3JGQmtB?=
 =?utf-8?B?YlQ3VTcvUnZRNWd2bDFkYW95Zm0vdC9uajU5dmZ1S0Z4Q0FiRU1rTHBNSFVy?=
 =?utf-8?Q?q4Yqg9GUm+8XEGfGDko4YOBBfaTZPNkzkvDcWwVUcVubn?=
X-MS-Exchange-AntiSpam-MessageData-1: P5qlpmabkWFPqA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c7f74b-13b0-401b-590d-08de7e4de146
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:36:49.1705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRaUQ6RzbO2w5RUssBMXK/rCec8lVk3KVIJYmYgHdbhvjodjUnlstkf5F7nyAYhBBPhH1Tv5cYi5QOBIVqCBxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284

On Tue Mar 10, 2026 at 11:17 AM JST, Joel Fernandes wrote:
> Hi John,
>
>> On Mar 9, 2026, at 8:06=E2=80=AFPM, John Hubbard <jhubbard@nvidia.com> w=
rote:
>>=20
>> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>>> On Mar 9, 2026, at 5:22=E2=80=AFPM, Joel Fernandes <joelagnelf@nvidia=
.com> wrote:
>>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These =
are
>>>>> needed for RM control calls.
>>>>>=20
>>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>>>> ---
>>>>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>>>>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>>>>> 2 files changed, 26 insertions(+)
>>>>>=20
>>>>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova=
-core/gsp/commands.rs
>>>>> index 4740cda0b51c..2cadfcaf9a8a 100644
>>>>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>>>>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>>>>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::=
InitError> {
>>>>> /// The reply from the GSP to the [`GetGspInfo`] command.
>>>>> pub(crate) struct GetGspStaticInfoReply {
>>>>>    gpu_name: [u8; 64],
>>>>> +    h_client: u32,
>>>>> +    h_subdevice: u32,
>>>>=20
>>>> I would rather have more descriptive names please. 'client_handle',
>>=20
>> Maybe it's better to mirror the Open RM names, which are ancient and
>> well known in those circles. Changing them at this point is probably
>> going to result in a slightly worse situation, because there are
>> probably millions of lines of code out there that use the existing
>> nomenclature.
>
> I have to disagree a bit here. Saying h_ in code is a bit meaningless:
> there is no mention of the word "handle" anywhere near these fields.
> h_ could mean "higher", "hardware", or any number of things. The only
> reason I know it means "handle" is because of expertise with Nvidia
> drivers. The `_handle` suffix is self-documenting; `h_` is not.

I tend to agree with Joel that we should try to avoid NVisms when they
get in the way of clarity - that's what we did so far actually. We can
always mention the RM name of fields in the doccomments.

The only exception being generated bindings, but they reside in their
own module and are opaque to the rest of the driver.

