Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2040630CDAB;
	Tue, 31 Mar 2026 02:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774924588; cv=fail; b=a1k4ERSjqxBC7n5GhZM3WlGsfQPhtAYEciJyquj3wLBYzTyK02HDzb22S7ppfCm4GkidrZlppWV/Z0cFQt9s0Ev897WFmay1XV+1heq/QNGorH8ehilrRPvScj+0JUBI6iA0NBegLbZ4h87bk2DXpBcWakWJheJxXfyYDPYRnxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774924588; c=relaxed/simple;
	bh=YTXIKs9QSLuusHww08J+PAuPx2DzhmqUrjsJwxJU7xc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WOLGcRSszFqpolAyzxzuQKohz6yOQV2LFclTbja4lvPKJsSDVaJ/uUidy8p2e/143uMuCZVPI1yZLMS1vR3rDpO0VBsivszuwX76K0kUL7Ib7IIOfBwTVcdor9FpJ4dFalwUP8EJQMBWIDprJVzEdhekqhrRllXXFkYvaYZKiIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dlJI3qdt; arc=fail smtp.client-ip=52.101.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dlJI3qdt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfo4j7683t9lC6of5nh3M4w0G4F06cnTmjWZZV0Na/Bf++BB7b2y+MEwM5xqXfYj0Prpf7MaDhGKW9x9hZwSsTriNOu5rnXDwMkuA1vZmbjVmXIPTFYEjamTmTLmt+DZUGIf9X9sEfKi3O7WMVBIg9VaXSSkOyxOGQn/Csx6rRDQirhgB1ko4BZO847UhbaZUwbgJ+0YJ/cxi5H7q0rOCa7WDpVBgNFZqoeHYDbta2i08jrP4qQLw4nxticsAscmxzZt771EaCBNc6kj8TEeMSpRNwNyKa8NMXMIBKD9vjXjjoQdc24Qs8WXPN57N3JPm4BMqXN+6IUU0yAyWs5blQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSgcENx4xiWKUlfk46pMPEy5PdjkVjitw/5K69HeFqw=;
 b=DC7z2vQ0sIxhXlA5U8mAT2EfMyiwVcr9wOYT/aithLzOwQmcLyYvCA4wMvFTeuNxpj3mR0JNuNwK3UtkmRdoXJvUPdnldA+xEYGZkHHXNNkoYBCL3O1cqF21HCY9zrTxxWypchExfMPb83bNf0hD2u5svtSwIEqkWvGMD/08c3PnBD29CdsV0zk+W1IrDR7R46u8x3NlGNeIO7wCR77yCgfsjuFrLjgqHDh6vc00ncnNnPvILaiSA4gEdq+jIVK6LePAYHWmvPgwjJ1hN+KGfDdGYtK+ugccYcoH0fjnfyDikixxBCFdbVpYBqehHjiXRPmixMOfoVAyLGtVUoZ5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSgcENx4xiWKUlfk46pMPEy5PdjkVjitw/5K69HeFqw=;
 b=dlJI3qdtwnFFvrapjeU6XFPZHHzwoug8TGIH7QLa4VWHJNY22dJCd1S4CAwGg10rNvhI9/mNpRftDQ8LrKtvClOLSYZegohFKzgWGFCep2bYHupkF6LFaqQiITzylCTZVIiXUGVbFs6hPtV1XsRC5Ur/Gl31fg8WDN7VdK+vDNHAep1F3hAuKOOn7sJvuY2iCP4JjbNaQkQ7Hrvz/sb4EBrMhpcTIDfZZVLNZHqt4YO8AcLVfV+bkXNdx/t+OYtjxvs2axHL7w+HS4npJe/uJIi4R5E+NmhGQxVKK8kjEQ7QhIZydq36wRtxZa7qHNep4M6MTUgxWLi/mFby/TMqFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Tue, 31 Mar 2026 02:36:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Tue, 31 Mar 2026
 02:36:22 +0000
Message-ID: <dc9aea56-d95c-4cb8-a94b-5195d16eb4a6@nvidia.com>
Date: Mon, 30 Mar 2026 19:36:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-17-jhubbard@nvidia.com>
 <DHGLXL0DVBAJ.2M58T9RSK5OO7@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHGLXL0DVBAJ.2M58T9RSK5OO7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 84822d0c-d4df-4534-cd6e-08de8ece4bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FCWriYyHRqmfP1EjOnYYinXXOg0kuNfG/9LFu39Lsri+/Ygv85gPBrgtiSL3rsbCbV5ZALMpZYtm7Qtfm1awXeQfVeSkqKalIjcULY2Aw25O5DxabwZkkrtgOaOrmM786afgoUGqShafzRhEJJJHxt8tskFRI1Hh7KCnr2yaxWzdbNvzxKSaNrK0eSV/Ao014cy4+Lqws29nOlA1ixHI+1mhnj9E4LgeFVCdohcmehVGT1uhm0EqqBQLgPpIPMtB0bAhdY28g6INWCW0z3r4X76SUdxjk8Z989dYIBI4K1Dj2aUFcih5dtG/1obJ1R9X7m8J0upFRoegNzkAyJM7wJb57O3tyAeX5wXuHkMAIoYcqXzRHX6Dc8Bf1sfUuAP8i7TeEKfAfCWtj9butp7heMTdP7Zu1uGdA3498WILyG5bU6UNlR2d7BxHnEAz3t4MSNi+7gFZw9TUIh3+fMjnUNwZbvu18LlLRoLHWG/UQI7YGDvosdRstGBGi7qzkgnM2j3un+aV9Jz6xDHhbL1RpLpKZDUO+n6qIXnvQFWfMSrSjo8HIOcgPw+DEv/l044XZMuKbe57bi/kLAdM6U2NpPlYoNfQMUuwjKdkgkrG0fBqi9LEcvsbk4BketkHmmI72wuImCJbnVTui8VMFsrgpjStIVUK/fVOloQfRNWnb3dgGp4V67o/8GRDczG/92UEuH4BYKkMQ0w+OC7SqrPayKrtcfk5oIQZGvDBfnjlcpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHhoNlE3dEloNFcrdTRJNExSWHM3T3dJN2ZFNVUwWGdCZEh3bWVaZ2FrL0VC?=
 =?utf-8?B?eFh0Y3RybkFNOXhTWGNUU1VOd1QyQnU1MVFweEZ3eWhienFjV1lkTHdTR00v?=
 =?utf-8?B?cU40RktGZERZTFJlWEM4K1E1S2ZrYTRKNVFpUEw3RzIyMzFoVnpPV1dSVHdy?=
 =?utf-8?B?M05najFhRFhXelQ3V3RQQWVVNksxeXpOcFpUTGpGUVNmUzFSVU92aWlaTENj?=
 =?utf-8?B?MURRdDBoY3BHZExycWFBYnYzb0d6aGtDQkwxanM4a1NPZnVqVXpjTmdSRitj?=
 =?utf-8?B?WjNsR1BBSnpmRjd6TmpQSmhRbzBqVDlEU0NBcnJ5bFNvYkMvYWpUL0QzQ3Fu?=
 =?utf-8?B?S2I1TVBRdWxaNlJBOGljUzA0MkowZFgyZUFzUnR4OFN0NEdyMUk2OE9pNm42?=
 =?utf-8?B?ZFhMdGNGbTYrSk5JM2ZrT3Z2ZXNZMkhOR01CRDE0d1VNV0htWmJLZVp0Mkda?=
 =?utf-8?B?R2VVV3daRVg3b3N1eE5KaWFUaEJWSi84TmUrQy9hVFpIYUxleklOUnc5OGFD?=
 =?utf-8?B?YTN3a1BHb2dralMxS2p4bHpxR0d4STIrd1JOMVpWcmFlTSs1RjY1REtKY1ZD?=
 =?utf-8?B?cWFJRlZPN3ltMXhqOW42ZU9XY0dQcEhPUTNrQkI3ai83WDZMMDM3aHdXaGJ4?=
 =?utf-8?B?NWQ0ejlsckVVVFVVdmZRZFBwT01YeUFVYitBRUJxL1E0UXlNTTFUVGtuaGMr?=
 =?utf-8?B?MWlZcWE4R2Z5b1loU3R2dHFiYzQxTjV5cC81VC9CaUF2RFVseGFhbW1IQUNO?=
 =?utf-8?B?TE5SUDRvU0lpa05ZeGtFWldtUlZPUFA1c2pMVXhiSkEyUUhPeHd2clBqRlEz?=
 =?utf-8?B?VzNwQkV6SWtFay9DcEpGS1d4NHhmR2RodStkeTBZVU0xZHBZUTNHRm15QWxu?=
 =?utf-8?B?S1doNTR0bVVrb041a0U4RURpVE5PYitNdmVPdFZGcVcrNlkzZnJCeDYwYzhi?=
 =?utf-8?B?SE5QeXR0d1hlcENRdFB5ZXV1TjN0eXdQT3hQTjl4R3V1Q1IySnVibzRXVEpC?=
 =?utf-8?B?WUVXMlUrakJlNmh3Q05ZazMyUm90ZVZuQ0RlY2M4MDVyWWFDOXV0ekgwNmhR?=
 =?utf-8?B?VERnMGtqMFJoenVWUDNoWk1USXZXV3QwSm1lUFhZMit5SHkxejdCd2RsVEQ0?=
 =?utf-8?B?TlZQSGZ5NjNxUVM2cDcvSVN3aWgySGtnOGFjWDE3UEZZVWkrN05XMGliL1Zi?=
 =?utf-8?B?MHgvSlRyS2YxK2JrcDRXYlowakxZYXowbTVIUmNrKzlqVFRPY01HandVdElM?=
 =?utf-8?B?WmxQUlhMSjF5MkExZXFGdWorNkRQeHdRb2FyUWYxTzZUU0FRdWR4S05ER1g4?=
 =?utf-8?B?YVY1cDUrUW93d3pwVDN6enAwZDhDV3M5d3Bvak5ya1gwRGdkcTNEaHNFM1A3?=
 =?utf-8?B?V0YzcHRlSFdZMUUzbFhzcXFCR1pKZUpXSVdxU1p4cTZ5OEh3MWo0b1RvcWR6?=
 =?utf-8?B?cFlZL3ZraURNSk4wUXJNRnNyZXROOXhHckZCbk1ubVFFV205SUIvWGp3dTE1?=
 =?utf-8?B?c1Q2NUFVem5uTXR0Y2pDRW1PUDRpWEszMnA5SUowSXc5SmdRekpaM3F3azU5?=
 =?utf-8?B?Q1pZNmFTbkZ5Z2l2WTFHcWJZNjJ3eUJuYmE0enhVMEgySFJTa0lVVnliVGV0?=
 =?utf-8?B?b1NtdFRySCtuTDFqWWYrQnhBdjJCSmZJa2R6YjEyeG9mYXBvZy9aSTNGUGkx?=
 =?utf-8?B?K1QyZnI3VWxYRUk0bmt2SUN4Q0VkSjBvNXpJTnJHaWxnODU3dStOdlM0Ky9l?=
 =?utf-8?B?TitWbzZ5Y2hhRDg2WnBtaWdDczBwNVBzbDFUSkdmVkMyL05ObmNUT3Z4a2JD?=
 =?utf-8?B?Wkp1L2dEMjBDOWVtajgyOXQ4aFhPQ0pjMzFNYmd2OUJHbU9QWUZJcllqSjZX?=
 =?utf-8?B?S1gxTS9TbDM1WFNWZDdJTGR5OFM4Tk03UzlWcEhnVk54V0pMRlpMTy9KSFhF?=
 =?utf-8?B?L25SMEJsckFaVTNKNVV5NGROUGUrZTVCOFVmWERNR25EN0VvNnhnTEdESTVj?=
 =?utf-8?B?WFlVd1VETWQrbk13ZjV1cllNdFhmNlJMTmFxNnhRbS9OWU1qQzA1RDNxajZR?=
 =?utf-8?B?WStpZEdBY0FPR0toZnlmeGc3NnVuWmpuU0lFdi94bVdEMXRvYWowUXhPdmFa?=
 =?utf-8?B?am0wbm1Pdmk5S2ZsWnROUkxrYlkwdDNDWmczYUM5MG9WUExjK0ZuRTRkSytB?=
 =?utf-8?B?d3o1UjB0MmxUbjIzTUtNbGhXUmxFTXcwbjFXTWIxL2l6YnR1Yjc2UmhLZXB3?=
 =?utf-8?B?UXVLNHdLVkt5S0dWNUZRTGhXSVEvRmx6VGFXMmowTUJZdE1kUGpQRXViWmw4?=
 =?utf-8?B?WDlNdnFBVnp1WktiRlMyOWYydVJ6KzlmRDNDRjlVcGVQdXVrQWgwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84822d0c-d4df-4534-cd6e-08de8ece4bdf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:36:22.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOsJlIWO4XIA1OaIxEMgCmF7dy3x+ADW9xb8k01qcv8rPhzvAKwwCefWYSk+Guys9poLnK+7oDUxYn2MiZewzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

On 3/30/26 7:21 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
...
>> +/// Aligns `value` up to `align`.
>> +///
>> +/// This is the const-compatible equivalent of [`Alignable::align_up`].
>> +///
>> +/// Returns [`None`] on overflow.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// use kernel::ptr::{const_align_up, Alignment};
> 
> IIUC we use the one-import-per-line style (minus the unneeded `//`) in
> examples as well (I suppose this can be fixed when applying).
> 

Actually no, it's the opposite! Rust for Linux code overwhelmingly
(I counted ~200 cases) prefers the "put it all in one line" style,
in examples.

In fact, I did both grep and AI-powered searches, and failed to find
even a single example of the one-import-per-line style in doc comment
examples.


> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks for the review!

thanks,
-- 
John Hubbard

