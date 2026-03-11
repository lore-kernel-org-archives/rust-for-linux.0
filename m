Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020094.outbound.protection.outlook.com [52.101.196.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819D2DB7BE;
	Wed, 11 Mar 2026 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234008; cv=fail; b=H4QMChMDcZixk9i6YklngMB8XJ9G5XsrwkvGU9wPMJHPFqiXfUh4jw5SqjWFUAAmXPAxaW7PNsJOelGpwN/gH/gbXyCOx4yJSFxw9sXgedDjuyNwervWeVDKIbnPN1gT8ljBLH1hf8dbFYdznuaduG36XLiFch17fivX8vfXvDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234008; c=relaxed/simple;
	bh=I1huMmagBJZZ1q3sSurxcO3Vvdyd2eRr8vrZPTAHfuM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ue0BbOqx+iqqAN+7P3YCyeARudJOzvOKscR2MtZ+lSvbzuf57vMIBMxk2l6mpGuPMcLbJbLRPL7BELpvfiFCzE7+47kGVr0fMjcU/MFc1HKiqb52qaTzidA3Xl9X+uGSv6+Gvs7fXxuFtxf5+FVLB8MEP31Z79+wqy6boLfCwDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HLfbA0s8; arc=fail smtp.client-ip=52.101.196.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HLfbA0s8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V38sml0boBeTuUL3PoUy+U8bcCoUUXBMTsxGQPimV2hYRdnI0HQBE+2bt33gXhp9hLdWXLv6MCoYwqU9KQxffiNY7/Zj7Jqru/09yuCdcxVS1/DpsqjWMYLIuu1fTAn95PT/5f+9Y97JfYSL7g4KlgB2wi5Pk2NAsbFhI6nyL7f0qoQM9u0yCLd6l4R4rjRS8bEOBaRs9QXWmgJab50mDCuroaJ8xhqovFn6VXYoj2nzUTcqQxZJj9Od11obf18K4qRiPstKUyrbbVd13VJq/sSFYm7dOcJrjS4D9fkko7ZyoewYukYecQfC/Q1ahtMThdWiiR8RzOyl9WTfAH//5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8AEw8H2PdRYpYPISWrVy+1I91HDv2GV9fKpAKpkTdQ=;
 b=eRp9ey6Gj319AMNvD62sLCZxZrv0cnQNM5hDfH8Lg3gaQ6I2IoDfttrTSiM28jLUWMQ1h0MuG7/iBxrJDoq5gMr8cy32vBZf07TM2x5lnpL+dTtEk7MMkGtEL68/40eOM0y6mrAAYmvFy4ksgE2vSXhkBuk5cXaNEnCs9HknfqThf1xy536zrfjHWOvWqBwwCt1QBy6tY26Jd7u1OB4emLZQ/zwVEVcqZtAwZ6hvLqwdIKRylgVHvkxX+PLrQLnoPv5y7P/Pk2p+bLuZ6SdHFVprYK6pA/oOyaOTvMhBvil/dL3V+BFZ7lbtzCD/ozkCeUTkyVKSX95WeEiZ5vsZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8AEw8H2PdRYpYPISWrVy+1I91HDv2GV9fKpAKpkTdQ=;
 b=HLfbA0s8hsp4+mvfRAJ/JYucOQomQqPQOlVpvLaIhVd+NixA5LD8SnDYJ66lCcmwv99mAr333w755JIHTAT0YIgYMG2UO87W60rh0keC0hzB8FqOPcfXIFNP1//z3YpA2kUnUHJmXteJIDrxi/qa88f5oNeIaM4NdSkpk+HfkGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6999.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:59:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:59:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 12:59:58 +0000
Message-Id: <DGZYZOXZE7XU.YV5O6SOIR6KS@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
X-Mailer: aerc 0.21.0
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGZ1SFR07FY8.26IXX819VFGC5@kernel.org>
In-Reply-To: <DGZ1SFR07FY8.26IXX819VFGC5@kernel.org>
X-ClientProxiedBy: LO4P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: f403740a-df3c-4995-efe3-08de7f6e199c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PCWoQbNAHrGX2RQgYb3PiAip+xgeQqDFHJ15UIMzoLXu6SlnlsNUvYnFVNpw/neQFAefCcjaMKRCOtmcFBCleo34M/nEjtq0PjGB5Ac3o6VTJHqQHw5RanPK+7ZCJHCNBQw7nMyBbT9oJrx8WZH0jMiQxP3aGb7XbWuYZQPMUeJm7IOArK/341gOzI3IecJLNuMBnRbqZZR1JjfXgFnoeJg8b1ToIk41w32B9z/f5rb9pZ/Q2odTragc7yaLK10XPG0uT1c3HQh40nyjrNS4X1+XJkjWXlKiitmAJd7YZzv/T/ksMqDUIUs7SVdBemSe1T8g4j9emUNpJBixrBynx/D0CH59Li22rj7fjGhZ+B5jHq2BSPhlvhJ7XLQ2UOHWQqH6C37QPSj4hEP7pkb9ejZnFY+fdtcnWohCGcpublZ7xfHJpr4a3ZScJcS+8geJzazTCBf7KS1EGBMGksgtOYr+FFxpVeOHY8wgCWwLkuIdDwWWT5+1HaSLiEo5TEdEpjw8BOCo7ddJNknWEwFr0Xj+F5Srv9gt1OFLx2VSBDcxi/lGwqhV3pp4NogzwMWb8HPPNZ9hFdh9meAbEtkRF+7nsl2pP8fjkeYythMOVacjHQFmfbXW81WUrKIdOagaZO306uczmUY5DUZDao9aTFFX+MuT/fziS1MA8GDYRC2ZABEFAcICqhhv3LzXouKtugja7rI79FcT4TV5jmY3Bz7WEWwxFlx8ur6E56kAi0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm9MRTdKcmo4eFlLK3ZOclhmZ3FnZllCemRrbVg5UlVaK1oyMFk1OS90QzBi?=
 =?utf-8?B?N0JJc2MwSS9ZU1k2V09FVDNlRFBvUzdSZm82M2FEOHVPRUJUT3RvK0prNG96?=
 =?utf-8?B?bUk2OUg5c1A2MWpxbityTFoyaWg2Q1Y2YUY1S1JuOFBWVy8vblpDTHl0NnFI?=
 =?utf-8?B?bDI4aThydkVHaFpDSyt2WUUwRU4zYXM0OXltN3hYWWhienZvVWdtc25lZWxu?=
 =?utf-8?B?RFBmazFsYU5qT2M4WUdsa0lkYktaQnJ5MnFKMDRTUk9Ba1RaSTJqQWtURXRi?=
 =?utf-8?B?MVF0M1hWUy9FSGUyOWJubnRlcFM3YVFZZTJQSmxncGNZNkUrViszWVlrSkoy?=
 =?utf-8?B?V1FFQjJRZGxaeXZvWXhFNU1jYzBOc2hZSEJGK1RRY2N3Z2s5cFRsM1huMDJn?=
 =?utf-8?B?ZTdwNlc5bGIzblo0ZGZEMCtrbUNoZit1MldaT3lGTldiQ29tRWF3V0x4dkV3?=
 =?utf-8?B?MVRPMDZaK0ErdnNyWHpxUDBUM3lPeGJDVzYyTnUyU01ZL1lOcjhNaHpaTk5w?=
 =?utf-8?B?WExrdmxtTzBxZWp6UTlKemVnNmQxZlUzdm16aXZiQi9ZUlZ2RkwzY1VDVm9E?=
 =?utf-8?B?Sk5aVnRBQm5UY254SCtNbCtLbjM2UjR5VnhhZFNWZ3R2M1JzUGNrNE9IZFdB?=
 =?utf-8?B?VDN2YjJmT2xpbnYvU1NsNVRNaW5lRmthNFBVVEt3MSsvaXNyblpZSmphZ0hW?=
 =?utf-8?B?SFFiWkN3SVlMaXF3ekYzTkdKY1BYZU5PYXl0ZGFZRFliSHNnVHpSOEU0VWRi?=
 =?utf-8?B?eTh1STdWM21xblFqSVBZQndSby9KNVduVXpyU2xxaTE0NVprRjVqcVQyRFJP?=
 =?utf-8?B?QWF5aDNoMUMwUkVPbTFBakRtZFhNa0xYMmttbURIdGFKbXIyQmNvV0N3RWtX?=
 =?utf-8?B?ZnRPL0o3NVBweXF0MkVIR3hMcFU4WnJVeUE0YkxmSWJTOG5xV1FqOE85S0Iy?=
 =?utf-8?B?YVhISTlnTWZudHpxcklFRGNqY0Y2Z2JPckEwRWpCWkFDcGF3WHdMQjU1RGVF?=
 =?utf-8?B?dVlnVm9selIrUnRzYWxPRU13di83Z1pzamhrTmV5RW9RKzM2cFN6QzZWRU9j?=
 =?utf-8?B?Y2RzVXdhWmdhOVZmZGxDTDQyWWNYN2FxT1hpU29Fb1VReXhKU1pyRFEwNzJ1?=
 =?utf-8?B?WTE2dXhUUVN5c3hObEpGZDRjUjJURFF5NDM3WkphMkM4aWRWQlZHV3N4cmRr?=
 =?utf-8?B?ZENmemhibnBoSUVhQ0xQdCtYMTR2NHFoUWwxOWgzajRsZjBzclJHNXFOa0Nt?=
 =?utf-8?B?d1FrbzZEN2g3TnlKM05EVTVzNTBIY2JuWURPeW1zM3RIckY5ZDlpUkhDYXdk?=
 =?utf-8?B?c29kRTZGd0tOUXJsRVJCU2pyc2NKVlJraGh2WGQvdUcxQ21aVUV0U0NuSzhT?=
 =?utf-8?B?aUcyaXQ4eFcvU0ROSWwxTEkyVWRudzk4ZWVSMUdrMlZSdDJObXNYczIzVmZI?=
 =?utf-8?B?WTVBZ2xRKzZRYmJVWERnK0lGMTY0QnU4MUFTbU9XZkEwdTUxb1hHUzZzQU14?=
 =?utf-8?B?SWNQSENKdzZ6Mi9vakdyN1ZDOWZDdTg4aVQvZXV4ZUpJaXJpOUEvQzRrVXBW?=
 =?utf-8?B?b2FBeFJ6Zi80SWo1SkYwSDNwUEE4Y25sZWtuaDBYbm04cjNobWlqUWhyL2g2?=
 =?utf-8?B?cmQ0eHdlbmNMUmk1RWVFdkVxcEpxT2czQjJpSVhzOGx2MkxDOFVpSUFkdWVu?=
 =?utf-8?B?UVMyV2VUTHgrYmhxWUNXa0hRQjRGR3V4VllwOHcyeldIb0JZWk1FcmNiNC9C?=
 =?utf-8?B?UlpZY0h0UndjWVVqYnVPVWNkK0RlTFlDVFM4YWZ2NTlUZWcvbW5kWmVQaUYv?=
 =?utf-8?B?Tk9YM3h6bGNxdWN4WG1QZEtaZlJSc2pmb2pDSDhTUVdUSXBVZFpZcE5WU0FP?=
 =?utf-8?B?aUpFZ0RpRkkzc1ZrdGxvQjF6NlhQbEVaTHVwdk9VWHY5dHBjTGpUNGVuRDB1?=
 =?utf-8?B?UWdtYkpreHNMRTNWUFdLSm9KNVRDWVJYZFE1dmttYU9RRFpra3JGRzVvZFlL?=
 =?utf-8?B?QlM1b1UvbVErU2o4TXZRWlExVDRodVJXbXNwcWs2K0hZR09Rby9Bc0NlaVgy?=
 =?utf-8?B?M2VIandQZ2twSzZpT0FLTEhsdGJOb3RjZVBoWFZrY0NVSmdrUThoMU1MSDFi?=
 =?utf-8?B?cFIzK0gyRlltTnQ5RmVFMDlvbGYrZjJKUlQxWnVwRlBTWnRqSFhaZnI2VTNi?=
 =?utf-8?B?N1Rqb0NMQXJieHhvd2lHK0ROMnQ4elBpazBjYVFhaEhYbzg1UUhTa2FDYW01?=
 =?utf-8?B?NEdQVVNGUnpnMlg2UURSM0tnZ0JkNVFYdHczZEdsS25sVTc1Y09GVW5VMmRm?=
 =?utf-8?B?VmpZY1V1NjdTb0U0dFlZTldiL1FQbWZTZ1d2aGNncW1qM1I4bW1nUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f403740a-df3c-4995-efe3-08de7f6e199c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:59:58.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEUTSiZKeLvkMpyPwhIP9pDWijj7Y8osbQBbMS/NZyY9FlAzUXwCmIGEvnnIzY2C4aj4povbjweAMCKAM2aihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6999

On Tue Mar 10, 2026 at 10:58 AM GMT, Danilo Krummrich wrote:
> On Tue Mar 10, 2026 at 3:01 AM CET, Gary Guo wrote:
>>> +// TODO: Revert to private once `IoView` projections replace the `gsp_=
mem` module.
>>> +pub(in crate::gsp) struct Msgq {
>>
>> These could all be `(in super)`?
>
> Yes, or just pub(super). However, that's not the case for the functions i=
n the
> gsp_mem module, they could be pub(in super::super) though. But I think I =
prefer
> pub(in crate::gsp) for those.
>
>>> +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem=
>) -> u32 {
>>> +        // PANIC: A `dma::CoherentAllocation` always contains at least=
 one element.
>>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) =
% MSGQ_NUM_PAGES) }().unwrap()
>>
>> I wonder if I should add a panicking variant of index projection for thi=
s case.
>> Perhaps of syntax `[index]!`.
>>
>> We could also make the existing `[index]` becoming a panicking one inste=
ad of
>> `build_error!` one. It is more consistent with Rust index operator that =
way.
>
> I thought the same, as something like this `[n]?.ptes[i]` looks a bit odd=
.
>
> However, I think we ideally want both variants (I like your `[i]!` propos=
al
> above), since generally users should have the choice (as they also have w=
ith a
> slice through get()). For instance, the index could come from userspace. =
Sure,
> you can always validate the index in advance, but having a fallible varia=
nt is a
> bit nicer.

I'm not proposing removal of the fallible variant, just that we can make th=
e
infallible one use panicking instead of `build_error!`.

best,
Gary
