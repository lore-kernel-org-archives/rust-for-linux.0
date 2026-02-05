Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9C3A9621;
	Thu,  5 Feb 2026 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297847; cv=fail; b=Wh1cRxeolYtOSEJFXMCWqUVWSHrHSKA9Krkwm6L9275zmRE8dPljlbphvVtDbOHjc8jWkkkEpqBMA4JcWZUSPJ0gcq2k6qmICPjp/aaHr1eiSiagArZRIb2EHiw+yr8E2uuTaJTafX/K81/0rp4lxZckCU7eN6jNWS05ldyv1m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297847; c=relaxed/simple;
	bh=DdqeNGHrIU4tq41L4MSde1BProGdlTXV2yBBYMKHg/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=muvqkFDbibXJcktuJ7rQjNVTznFkQsGQvDNU8zEBl5hbhNx51NcVUdEUTFT6pAiIXw15cfnJcYO3mfzXEK75egIWyTyDNPbzAUEbRe1axuwxcXB3OGkJasjBU1Y8c+yhLaLEJkNsVEdHRL9/z4nLgY3C1aSTxBfC53lQVEDZ2ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=rQorK5Uq; arc=fail smtp.client-ip=52.101.83.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="rQorK5Uq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGsuh0oyVyh+u8G0QDjt3/U0Q+jn6j9BVfB7/C7z8+PODKDRWjcLFHMFA4SZp6CTn9oJOnnxA1loLlY0j8trOaYtyXkkkuPZD1cQZHkmxb2/yyr1M6+H7YBZeRIrCkjE+c3kzaxoAqhwrTeWVrkZ2WTdDK0B0z4JMCs6UkfwXme8PoTKn6Yt/ZWSBebiiW2U8OgGPKAeThFIz7DmMIE7IN7eOmLSQ+MY8AwqOWkF2TAzG8pAsC3+Wn1nGJ30lU56HyLqIofAeA84tDFsds3t4q22J5N0oQjSSezCyEprq696kC6vz6kcvk6iPQudtXS/bOC8ccZSo6FVO7Y+Oozoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl3wHTvatO1i2vrujGequJqRDJ28G4n1DFslS4k76mU=;
 b=O2U69xjGYiFPGCCbTmBmRFWweSeGQ4J5TVQfxjj6kmGU2B5/ff5u9tfHQ/une1VDsYSySungt5IWzlMXxRNLOa3ihlPfZAgmrIFUUqQq1XxSi6LV/KSX7mMQbozBkXgZIf140pmnthLzWbJnB1R5sfaQufFU3ClL0pE4TJGTRgy0KD9Qb82Cc9MoyuTKxZK3ipYH+RA2ieolwVRGRNXShLS3z3YD9P0LbuaEHGtLdHcgtPU27BffqiS2T1GLWSqFuKu2wvOVzQild2yVzdafDAoSOfgPHbb2Z/L9QI0IWd/OyX1GR3b6jOVhSb0Q6D3yMBhiocQEs1C3aHIwUGXz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl3wHTvatO1i2vrujGequJqRDJ28G4n1DFslS4k76mU=;
 b=rQorK5UqgaAONjTL1k9VYKsCzSTkQ2SvNoEKuZ2xgg3zsZ77XhONHfHOrkzgD04zB7T6zp59sSrVWwBJemuIJPFVMosccsDLZ1vIcO/L+mRGl68PN7j88OkF/NsXu65J3A1Wb8vvDqugnzcIJgviDO4XfV6WA6j/38HRlt/TfQ7wl+q5AFOoL+ORQv1NuazKc0A0Q4YOJ3z774MxtiM5VZFZ1Ycl8qvEAaolhET70Jvt34IZNmI0Kv3X/ODNoEiDvrjpiIZwDnAC2Jl442CYmOHNcJ71yKvUSaJymNluKQrrlBMRMMyWksnMT/eKGaKCD4bG6j7VNMCAdvcge23fRw==
Received: from AM8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::22)
 by AS2PR10MB7226.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 13:23:59 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::52) by AM8P251CA0017.outlook.office365.com
 (2603:10a6:20b:21b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 13:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:23:59 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 5 Feb
 2026 14:23:53 +0100
Received: from [10.34.184.244] (10.34.184.244) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 5 Feb
 2026 14:23:52 +0100
Message-ID: <1ef96145-9d58-4b61-a3bb-045dee6e4fd5@de.bosch.com>
Date: Thu, 5 Feb 2026 14:23:41 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Dirk Behme
	<dirk.behme@gmail.com>
CC: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?=
	<work@onurozkan.dev>, Jkhall81 <jason.kei.hall@gmail.com>, <joe@perches.com>,
	<ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com>
 <20260203184933.23c92f8f@nimda> <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
 <20260203193240.68bb136e@nimda> <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net>
 <c150ba95-a60b-404d-823a-316710035dfd@gmail.com>
 <CANiq72=J5LBxfawu3MtQpcukaXcw+pRyMWd9ueDE=od4X99R3w@mail.gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72=J5LBxfawu3MtQpcukaXcw+pRyMWd9ueDE=od4X99R3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B4:EE_|AS2PR10MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: c75a5fc5-07a7-456d-2097-08de64b9d280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlNoK1ZSVjhEYlIxNzVlRGNoSkQwOG9CbGhuUmZldExFNjc2RlhScTlIZWJI?=
 =?utf-8?B?eGxGb2t4ZDQ4QnMxMlU3a0hPZkVTNDI5OFVRSkwrZDZ0RE9ndW4zQTEwUWNK?=
 =?utf-8?B?SG1NQUh5WE1kMzNML1V1VTJxNnh6MnFWWktSWU9BZFlIb2xhUkY1NUp4Z0JD?=
 =?utf-8?B?SEFLQ3IyY1c3emZ6c3JpQkZ1WExaUWp1OXRRSHdZVTFRRHRBM2RtOG5EcG1R?=
 =?utf-8?B?bUptWjk1VVkvZXVRZmE2SHYrNHFYdVExOU1nZmcwN3lvMXNOTk4wRTEzZFV2?=
 =?utf-8?B?SjhjbGpZaTYyYy8yWFg1dFF0WGc5dGpUd0Z1ODMvQzM2SFpjcDNEZWJTRk4w?=
 =?utf-8?B?dG8vU3JzVWJEMjdVK1VLaGNuQmRNeEdaSFhRSXhSM2VVWU43Y0hMNVpuSHhD?=
 =?utf-8?B?NlZ3TTllY29EWnJuczFrK1diMEFXTmxtUm9nRUZxMmhYYWdsYkphUE5VSTFt?=
 =?utf-8?B?N29PNlVxSkRMWkg0Q3ZWTUZWOUZLbndtZmFmMUhyYzRleWNKMjJvNlZCeDdp?=
 =?utf-8?B?UDF1Zk9wSG5rZU1jT1p3b2xLS0tPS29yMTkvaU9HTFVEa3lMd01BaGRycE1P?=
 =?utf-8?B?MnFGK2s3b1ZZYzl1dU9VRStjRDZ3aVQ4ajlLUTBBL3NBdjliRFVoNTdpM1Zx?=
 =?utf-8?B?bDg5R2tXTldhYVFhYnRPSUFYR2hxby85NmV1U2VodlRpNndKL2haZWpLVUxM?=
 =?utf-8?B?dkFZU0t0djd3eVZkTk9tZFNHMFkxRDIramVHNWgxeWgwQlN2dlllaVY3OWJY?=
 =?utf-8?B?VVRwYW1IUUdwRE83OEg4bElvaWVsN0d4a2JxNS9seXZaZXQvUUJtOFFMS2RQ?=
 =?utf-8?B?bFlwcWppN0htN2k0VGNUbEI3S0FiVmU2bzE5akxYWUtYUG85U1hZNUZKOFZ4?=
 =?utf-8?B?aGJxeDV3bTlMdlVHNFl3a0VzNmdBZ1VJcjVKL3h4SUswYk1HcFd1LzEySHgx?=
 =?utf-8?B?UHg4NHFuYk1VWUtocUV3S2dacDhKSE5NNzQ3bmRDcmsxQUg2RkVIbjN6SEhK?=
 =?utf-8?B?K2ZkRU5Fc3BVeGVxbEh6Y1VCVXJqRFZZRXlSVzBpM0tYUmZ3WTJ3Z2NnUkow?=
 =?utf-8?B?TWRCNUZDNk01R2NkU3c3bUo2aWpCZFcyR3FMZnlqbnFZdlU4ZnNZWVoxdjE3?=
 =?utf-8?B?NmlaQ04wTGE4Y0ZuUGd6QVNMWU81cTZnb2F3eHFlS011UzB0Uk00bHBBL1Z0?=
 =?utf-8?B?eDBrR2UrM3daV2VVZlBRRHV0clJ5WDl5dWd3K1dkaUhrellaNWFELzVGQ0pB?=
 =?utf-8?B?NlN1NG83RW8vdUIrU0p6eUUybDZrdDRmNGFXYjcvaERaaXdBWFNIbnlvU2VN?=
 =?utf-8?B?UmFEVDBuV1pBMmNRclJCUWpHZ0VCT2U1UkdjQTd4VWRlbVRselRxM2dTaCt5?=
 =?utf-8?B?K2Z4N2pUWGM5Y1VlemxRaE96V0lnQzV0K0FBM1J3QmloVkE0Q1I2YXZKdGJk?=
 =?utf-8?B?eVFYN0RvcHNWZnpoN3NxczZwMjZ0cHJtUmFOWUVkbDdkbGpSOElzeEY0Z3o5?=
 =?utf-8?B?ZklOQWFqbGVWeFprdXp0bFNYVFU3blZhVmovcytXL0hOdFRLSlpETGpmZWFm?=
 =?utf-8?B?MTJ3TGxNVGxMODFsTW5ucHZrU1hRb3dzNTEwNmNnaU1OcWQreERDOE1weTRD?=
 =?utf-8?B?YWNTYkY5dlZjM2pGZ3c0R3kxay9yeXlnRGppY2ZHMld0b0RUc1ZCRk1XS3lx?=
 =?utf-8?B?RFdkUG1vaS9naHZlN29SUWdlcStJbFc1amVEcHhWcmV3WW5uYkdKQlZnQVVZ?=
 =?utf-8?B?US9GOGN5OGt2NzB4Z0xiM0EzOUJpQW5tT2RJUXQ0UFJXTDFQV0h0UnVLVnBL?=
 =?utf-8?B?OFV2V0c4S1VVTnVtV20rZzNCU3kyWlFqM0dWSlRWZlpRby8wdmNweUw2aVE3?=
 =?utf-8?B?eHk1RzJFWjJMbVBuZ3ZweVdGcEpSenR4Y1VwMGpzcnNxeVBENkpIQUZhMFlj?=
 =?utf-8?B?SDU3TlExN1BZaXRwZlUrTTBYUDFuZjJKaEZNaFlBQmEzTWIxK29FVVJuR0hS?=
 =?utf-8?B?dlFScFRqWjFKTTNiZU1SejYzOURNL3RsTnZDSktkRlI3dXh0dmlYakFGaURr?=
 =?utf-8?B?WGpOTkgrNS8zR3FoUjd0VWJPdjlXMHcyc1hPNjB0MkFwUnZuc0Flc2V4dTlq?=
 =?utf-8?B?ajNMdmZQRjV0RkhtU1B5cG1FdUk5aDhVWkRWaStNb2ZBdkJWWWd6N1NLZ25F?=
 =?utf-8?B?Rjc1KzRCNmNmK04zYWFpUVFDUkcvVHc2NSs3ckFHOU94Q3Q0enhzaHl2dHpq?=
 =?utf-8?Q?WwslZq1bZc83VdeU3tC5Hbh41MyNNX3pIfiRd/m3P8=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yNjyIiVgRqtlU9ApD5o7kFbsrUoCUrHq+x4KnuKRKq732uL2nmSjamFPbtqAPl4pyDm5Pq3upbMJa/ZSN3i7F7qCHSafKAqfGgu/I+g1XJhPNi8btLUcaCt0/BW5Tu/dPuk/MKj0lygmTP0AWrZ9Un9qXlvGnAZXmhVYORul4JCVKMOqzAm3h/j8gTmIvbrHzguGNgKajzKRRcIXpcgOTF7+b5Ye3WmrhdL9SleB4qaBPk4WfgxJM6F+a2mQyQTS30NGCnRbtHc8AWf8STcZAjjMdAp+NmR7nTIM25RP4SqsZPf81qk07W9sjKiP8UvDAefS4fly4eMvmvoRnV3OZOJ5CKK69V3E8IiW2pRBbJL2EmmSaolhTAL2H/qgO0rbjjDM2szcbafqjGuj6eKRIPQVaEY1G6F+vy+Zh5VBi+nfXqsOQkS8rnrcojCSQnRi
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:23:59.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75a5fc5-07a7-456d-2097-08de64b9d280
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7226

On 04.02.2026 19:10, Miguel Ojeda wrote:
> On Wed, Feb 4, 2026 at 4:56 PM Dirk Behme <dirk.behme@gmail.com> wrote:
>>
>> The question is if we could find a way to make it *consistent*?
>>
>> I mean how should a developer know if the warning (he gets once, or
>> even if he checks an existing file with -f always) is relevant or not?
>> We introduce the warning because we want to discourage the use of
>> `unwrap()`. At the same time there are places where its usage is
>> allowed or even needed. How to know what is valid? The warning or the
>> usage?
> 
> I think usually developers use `checkpatch.pl` mostly on patches, not
> existing files; plus it doesn't make the build fail. Thus I see
> `checkpatch.pl` as a tool that can have way more false positives than
> a linter that we need to keep strictly clean.

And how would a developer know that a `checkpatch.pl` warning on 
`unwrap()` is a false positive or not (i.e. is to be fixed)?

Thanks

Dirk


> The idea with the `checkpatch.pl` warning was to have something we
> could land easily before we got the new Clippy lints, and perhaps to
> apply it in more cases than the eventual Clippy lint (since false
> positives are not as concerning).
> 
> I have some context in
> https://github.com/rust-lang/rust-clippy/issues/15895 -> "Additional
> context", and a few other issues linked in
> https://github.com/Rust-for-Linux/linux/issues/349 for the new lints.
> 
> Cheers,
> Miguel

