Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0758D425CDC;
	Tue, 20 Jan 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913278; cv=fail; b=JMKhmUMuMlP9RnLoOSA7VyisOxzvOZAhdoOgAOnem6I/yOcVRf2SK2VFp9V64iv7iN1t45uLdm1XPDIsSPkmiEzdlVZKzY4sa48dMDvGvuQhViO+cc5uGQIEYcsO6kO4oy2TLD5pOzwP3Bb2JwjIYjwOiqbNXGkirLvKMRsfQhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913278; c=relaxed/simple;
	bh=QV1hibOy01qfRUVTPBPxbjQv3h7GOTE5mIO0/px/RTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GxDLPtpPyBiLIi1TBIEV47Y0v9cFgwYD6BN3XGtA7+PTr+IoMF3SzKnwyG3gpDK/rU31RYuxRF11esTv8vkV4/tX1GSYPpgjIPEtCekwaJNonx5Fo5yNBrp0ZsKR7oN+4UHLmm/t4aOG/+Lhbwehy9GEHZ/l9VJNBb/aYFIH65M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Ucj6NZwZ; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Ucj6NZwZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFIjkDDWfsEag4vo7VpJ2r/kXEPfvUtPrGy9N5BWITLLsicS7oSn7A6IzsHUwOBTmb47k5UcsO2muc95AtqOZ36wUo5zwcy9NFWGhE7wS+wKFAxh5xKQLUmaHqYYFW5Bh2cLTlB1q2bfAAew2a0Pvugivsk3LeVLJuqlYAgcQIGtfctl2fM18A1I98Mluu/IgAAXeD82YDdDRqBK6d/JYvqeNR7e1c+wSGNGx0gWMDYhMB4izCJsyrFSgUg3GfAHFPEL6iN6bDpBZ2rL2Tsp25V8Gh9TAQdElOf9cv+Txhvx3uQZf9CBt81qIDvxWlrqJN+nqOqWlTMznEBVI0/HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZAW4i7JKTFmN8ZMCgLsHBQWN6KVvIq6k4bUTQ7488Q=;
 b=mLtfr4giiJo4IwC+NcMcvtHFzfUsxZYSoSuqCowMlsUyxHpj/m3zhAOlfvJ5WWpJ1V2vaB16fVyoT0s3Wjd/f2Q/mnUBWyXEXv/C1NhB/PtbgiXX+KY7PS7nrYr87uF1A1teEIhjQIHj9wLnETPOHsW3WYygeb983O2qkkwlymhbvX42I9v1T6enZjOeYGaP+6cZRn2UmeBhoN//BosAS34ER2CmEa6xEf4xYMnYzjfTKSOREu8v+ZO0qsOARCb2kbsvfQbaxBKJEpzmPfcBYEZtBwiFQPVO1ZRDBMnxkT/VOBHhTDVol476alf83+kv0uJcXx2ERsSol5yXUSClGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZAW4i7JKTFmN8ZMCgLsHBQWN6KVvIq6k4bUTQ7488Q=;
 b=Ucj6NZwZv5CohW7wiS+JHdfIVjvL8aVfrJMnyGT994d82Evu8aNvIWfUIrage9Bf64HU8S42JsBZGNZp/llMjA1HrsT8VO3f7r3JsQ3Cvp4cvDefCTNkKFNW/3zy7kf4eeunlZhW2XQL0gzToocH5ZKySgn/8X0atq+jYbJIoOJwsRAUI/WJBXyiE9I7ZCgLqAh4xEnLS95Jrtii9AQvNHpPk0f773X4N2D1Q6F/8/k2ft+XVBz0KAtlV1mm8AgwLj0rVkL4rhK4ucBycDeeJXyqJ5wu+uZBv74YEsNT9cHZULWvwdLfllP/7LgZHcFDZpLASMEdgahoAr1LNkXXJA==
Received: from DB3PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:8:1::15) by
 DU2PR10MB7679.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:495::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 12:47:50 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::ce) by DB3PR06CA0002.outlook.office365.com
 (2603:10a6:8:1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 12:47:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 12:47:50 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 20 Jan
 2026 13:47:36 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 20 Jan
 2026 13:47:36 +0100
Message-ID: <c17c1506-6ac5-49d4-b5ef-34d90dcaa41b@de.bosch.com>
Date: Tue, 20 Jan 2026 13:47:28 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, John Hubbard
	<jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
	<epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida
	<daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com>
 <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
 <CANiq72kEVrYWbs9zOtP-h83TTmrOBBqkKEETUqSLZJ47=L6sFA@mail.gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72kEVrYWbs9zOtP-h83TTmrOBBqkKEETUqSLZJ47=L6sFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|DU2PR10MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: aa75b180-4bba-400e-1370-08de58221efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3pSTjZ3QkZ2b2QvbEdER0Y4VW5ZUmdKQis4Zngxc1JZNEZGODJ0bWtkSlZH?=
 =?utf-8?B?TW5FYWREQ3kxd3FXTUZwd0d0L290Q0NrcEV1TGk3eXJNNFBiVXVjR1g5RTZG?=
 =?utf-8?B?Y3JuQ3YxWlE3QnVHa29BTzRXVFR6T2taRmxlUURDZWFDSGZPaWozUmhIVnkw?=
 =?utf-8?B?Tm14elMxSTNxVXZjdVNodlFxbUYzSVZ0dXQvVkIwY3JGaDlJUjJ5eGhMM2kr?=
 =?utf-8?B?bVdVWWhDd1VBcGVxV2hJNDFxUmV3L1V4bGw1aWE3U3Q4TCsxL0pZWUJmNm5r?=
 =?utf-8?B?SHlFdnRiZ3hCVnRBa1VkZ3A4bHJRbWgxd2pyN1QvNHZKZE9vaXIvOUdvdzRi?=
 =?utf-8?B?ZXZ4RVZoMCtDYWlqeS96VHBOSElrSm1qdGgxdENIWkRTeHFBanVxZWlHZGtk?=
 =?utf-8?B?YXkzakJWa0pRQU41YkxPYVlLcmRaSTltTHk1Y09QUWxkMGNoV1NKcndFSUtu?=
 =?utf-8?B?Y0VWRmZ5N1JsbDEzdnMvLzNPYzRnRTN2NXFTSFkzaXV2N0tMalBndzRFWnBL?=
 =?utf-8?B?UTZVNm13YlZTN29ucndSeVZqMGRyRXVIQ1QxSm0xYkNVTCtiWENEMW5uNmp6?=
 =?utf-8?B?QWt1WDd6M0JxWUcyd0lCYlZpeCtpWExlNEpsaW9UOVM1dVptejFSQ1Jwd050?=
 =?utf-8?B?ODg0YXd6SHd3bHcrTGtMNm4zVGVoMzgrVnp0QmcwOExsNURPaWl0QjVsMHBX?=
 =?utf-8?B?V1Y4dUh0enNjSzNPc1gwV0VsaitQc3lDWm1YeWI5NisxNmVVSHdhQ1FnVmow?=
 =?utf-8?B?OEVkQ2RMS0pvL0RURmpmS3c4VEtpZTRMSnhWSjluYUtmeWNzVWs1Nllpc0hi?=
 =?utf-8?B?MXEzU2Y5enMzdGNJNjdzOXU5ckdJTnNTMmtoa0RBbjFxZlRqQWg1bS9ua2Q0?=
 =?utf-8?B?dXFlKzRJcXgrNFBnamljZFgwSEtDUDZzMldVS1hQc25TTTZlYWY5YzAydUFS?=
 =?utf-8?B?OS91SkZ4R0k4cmt3U1hjOG5jeDhTUFFwNEFyU2JTUDBiV3l1Q3dORzE3OEc2?=
 =?utf-8?B?S2UzMVFSSWJlYW9WQzR2Sk5KVytLRGhMMnVtYWxCVHFmQ1RWeGhGYUowNWJ0?=
 =?utf-8?B?YmlabjdBTjZLMW1oQ1lSM3M0ekJEWlpvOWlqbzFjTmJtdm9DRWJzWWxjcjRY?=
 =?utf-8?B?Ti9nOUZBZ3Q4clRtTXhCNVlGUEdYTm1oRFV1V25WT3JpQjg3T2hzRmlMNlBK?=
 =?utf-8?B?TTRybU1GVlVUOTJaczRydUZLa0Z6VjJNd051R1BKb1RabjV1SUJkUGJxdEZ4?=
 =?utf-8?B?WFQ0WFJuZmRYM3FvTHBLVS9xbnZxeUZFNFc1ZWZBSWUzc2hiK2psTkZhTHVY?=
 =?utf-8?B?cXNxRmJ6dVNHTzNBUDZrM0pCQmJFeUJ0OUd0WWlVTFA5Wkh1ano0UlJBTEsv?=
 =?utf-8?B?bGYrSHZVeDIrNC9VY3FXbURaY3pIcWN5QndrTHpHVVl3cFpmN3R0dnR3b3NN?=
 =?utf-8?B?LzU3UXMwNG1ZSXFHVi9ObVYreE5XSDNZTlNMY1RHVjR5emlkdjlWOUkrOE1V?=
 =?utf-8?B?K245a1VoQjdRaVJ1VDBuWnlLT1NJWjAxR1lJamRGSDdaR1BRMG4wazA3b0dK?=
 =?utf-8?B?bVFPZlBRUW1lUEpRMFZ4Q2FyVXRLczJUTjJidVZoRTN5R3YxMFVBcjZHd3h0?=
 =?utf-8?B?b2VYRnltYU1sWmEvZWdRMkswREJTaEo3dEE4YmJocEpmcVRCNW9BbmNOZTdu?=
 =?utf-8?B?L0FjWDNyNWY2VytVbm5Ia1Q4REpTRnNnRWEvNE0wRTRYd2dkWnRnK0pORW8z?=
 =?utf-8?B?cjJPblY3eTR0aVZlRnBuQ1dyWU9rT21IUVgwUDVQYzBGWXpqZ0s2VDdDWlJL?=
 =?utf-8?B?cWx1WFNHUG9Cb0RMOFJsbDlyUmdtSHRyTDNuVEhmSGw3aFJJNUJhM2lXdnNa?=
 =?utf-8?B?cFRiOWJrVmVMS1hCT2FvdTdvd2c1dncrcDlFN29JTCt5bUdHK0hZMy9QeFAv?=
 =?utf-8?B?aGY3akxJNms1RnB3OXZ5bGFVTXFjdnY0WUZLQzdSblRMWmFucHRxa3BOZjNv?=
 =?utf-8?B?SHpwRnNKK01DN3hHcktHMmRSNTJNSDV5QXpPY0VqaXJzWWdaOXRmNUJEa0pp?=
 =?utf-8?B?VXVOYkhoQWowZ0laZ2diVWhNTTUrenZsUUlQWFlkV0kvaXhjSk04M1V0MUND?=
 =?utf-8?B?QWNkb2VDMjFVN0RXb2JKMVg5Q29hZjI3dHRTeDNRZldkNWM5WVEzcmtPQU0r?=
 =?utf-8?B?YVdIMTNwNjY0clhDR1RyeHNoOUJ1V0ZHRndRWVdWaldzdXAwZTluNDJtcXpI?=
 =?utf-8?B?Q1hQeGtqUmtBTkFoVG1NYWlER3BBPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:47:50.4004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa75b180-4bba-400e-1370-08de58221efd
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7679

On 20/01/2026 13:37, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 12:45 PM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>
>> What have I missed?
> 
> I think the patch is missing enabling the (already stable by now)
> feature. If you add it at the top of `rust/kernel/lib.rs`, does it
> work for you?

Yes :)

And I think we need the same for the doctests where it fails as well then:

error[E0747]: type provided when a constant was expected
     --> rust/doctests_kernel_generated.rs:2758:1
      |
2758 | / bitfield! {
2759 | |     pub struct Config(u8) {
2760 | |         3:0 nibble;
2761 | |     }
2762 | | }
      | |_^
      |
      = help: const arguments cannot yet be inferred with `_`
      = help: add `#![feature(generic_arg_infer)]` to the crate 
attributes to enable
      = note: this error originates in the macro `::kernel::bitfield` 
which comes from the expansion of the macro `bitfield` (in Nightly 
builds, run with -Z macro-backtrace for more info)

error[E0747]: type provided when a constant was expected
     --> rust/doctests_kernel_generated.rs:2846:1
      |
2846 | / bitfield! {
2847 | |     pub struct Control(u32) {
2848 | |         0:0 power => Power;
2849 | |     }
2850 | | }
      | |_^
      |
      = help: const arguments cannot yet be inferred with `_`
      = help: add `#![feature(generic_arg_infer)]` to the crate 
attributes to enable
      = note: this error originates in the macro `::kernel::bitfield` 
which comes from the expansion of the macro `bitfield` (in Nightly 
builds, run with -Z macro-backtrace for more info)

error[E0747]: type provided when a constant was expected
     --> rust/doctests_kernel_generated.rs:2934:41
      |
2934 |             Mode::Low => Bounded::<u32, _>::new::<0>(),
      |                                         ^
      |
      = help: const arguments cannot yet be inferred with `_`
      = help: add `#![feature(generic_arg_infer)]` to the crate 
attributes to enable

...


Thanks!

Dirk

