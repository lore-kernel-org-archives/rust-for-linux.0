Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B0D1E1A05;
	Wed, 15 Jan 2025 01:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736906074; cv=fail; b=ei7c5vsS++lpPcHKRCTxaxjLZAJZ17jBoz0AMumTF5p0MuMJsaxZ4kWowZeipCfd5emFFGe/xX4sAJ5pt6OxY4JmsdAH1sJSVTRYmtds4pDOsItW0b6yU/1pFsH6z3UiUHr/2dgFj6q6RE56PEs1DulSpDJU0hgPG5gKcb4SDU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736906074; c=relaxed/simple;
	bh=26Ip4oBNrum7PBWklsjPHxhdxmMlm+QIyM8/kG6gMjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L9SBmtHqTKHJpAAIyNOJbdCbLyF2NoGjvpbNUzKE9iBKEKrcN1Cti8WGuHjsYiimhQVEB45a3gXSpetMEZXvuuxQqYiu33TabYSrQdw5momdkQtvszJWwLilzEakDfKqIpOGpETT/seOnnd14kceikioppegrzXSda5NlJk0600=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GUKvMuaB; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GUKvMuaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0t18ZN9xgQXrTFRNWu2CgwPXZiyx1uuHO8CX2jyV70QdLKchoQ6kDZTOkf7XZLBc2MFO1/pEBhkPw+k/IOY2J8ZHXbisqnR9jZvaxWy6sSYuZ7gI57KVs5Ukphny0gnuyBsar5MToHr+vo3VqsMEM/EwuFQMeUFzuAvIzuZco7idf4kgf02OMtXqMqYQ2rHemYLPOYslWhZDhE28MAXUxW88dPH6bZJnamSp5N9w/dR1yTo3RkBVrgWapsgX1HResdxYbrgIkiNHYDTymaj/HG89Lyjp1G1xQbqa1GvFQ1Vd/CXCmjCFUpTMvp1n+ttr4C2j5ZU0v1f/sFYCEwLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjNvjIGk81kGgytkT8dcQbHlxoP3EiHF51/QTLMVETY=;
 b=XY19jTPIDVYGN74tBye5MamCuZbY+cT3w4+JPhfy1wse1jyNOfKqpCTlmDnymqBztWXH6uunVFo+sL7Hks7HTkrR83fv75ESqyDvPoMaQ7sRoI96KQVqsw5Ng2I5ZT7pQi54qxCyt1SEEIpy3/qIhwpx4QYuhd3MS7ccwsOg6SOswy2YM+HlP1gz3AgyD7n0J6TfjEQBngprBmOPjgR+lMSOe9moRbwG8oyQcLe463RgRRBJufL9BhMZSIk0H3XVmtQBtt9o9AfBU03gcmSulvt49a8dUG3PZyQQdBZVK8CyYuDigD2nuPAdn2X9HmcKG/sURZfpOUMGK3Rki0f8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oracle.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjNvjIGk81kGgytkT8dcQbHlxoP3EiHF51/QTLMVETY=;
 b=GUKvMuaBDElZ0DnrqnzFG2qAbvS47ptbpmdv24ccgMMk/ahSBM/0t+o8RqCO3tcbt05U6uWeHyP9A9M1InJofnLDqozrumYuJJS1fjls8Nefo8jf7xgUU7BIhVieWEdQK5TQw9gF7iSEf/eaEIqf+Q9caA3o+TN3h2NzOoDy26GCL4GWI15oIieb8V9u1K718hCQEJgIFgXHWNfv0JYQxSN+jJaAOWCjBntY6Mah8SNKpnQRkpQLl/HpBCwBfPgDgqHvV+s8btEWNHsL7Id0owcMGchV/jO6P9L0DUu4zstSsNfOisEFRJiIj8rwaN8aiFi/7OhOWnzgbBA8tlUiXQ==
Received: from SJ0PR13CA0210.namprd13.prod.outlook.com (2603:10b6:a03:2c3::35)
 by PH7PR12MB6908.namprd12.prod.outlook.com (2603:10b6:510:1ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 01:54:27 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::51) by SJ0PR13CA0210.outlook.office365.com
 (2603:10b6:a03:2c3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.12 via Frontend Transport; Wed,
 15 Jan 2025 01:54:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 01:54:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 14 Jan
 2025 17:54:16 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 14 Jan
 2025 17:54:16 -0800
Message-ID: <275ab6d2-3db3-4d2c-80b0-1ece4fd6fba1@nvidia.com>
Date: Tue, 14 Jan 2025 17:54:15 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Alice Ryhl
	<aliceryhl@google.com>
CC: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton
	<akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, "Jann
 Horn" <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Trevor
 Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <ZzO0HNA5jlZZgU1ib_SP36HWHny8QNidES3cXM_ogVTtqArMPzPfDlQCFslPrZAVESJzfzFOVfOkoZHKiG-ivQ==@protonmail.internalid>
 <20241211-vma-v11-1-466640428fc3@google.com> <878qsfdftg.fsf@kernel.org>
 <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
 <082c3703-c540-49ee-a5b3-554fdec50825@lucifer.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <082c3703-c540-49ee-a5b3-554fdec50825@lucifer.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|PH7PR12MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 85504a06-d740-49b9-f7e0-08dd35078b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3FsMk15aGJGdEt5eDAvbmh3TzQ0Ykt0bjd1dTJqOWhmRGpnOSswYjdzOCtI?=
 =?utf-8?B?djB1am1sR2lyVkpsRmRhZDJPbTEvT3RjRXYyeUtmaExDeGNIQnB0d3BEVDV5?=
 =?utf-8?B?TTkwNnF2YzNjNXJ4dmpZN0I1NENsT2RoUk1ETGJUc1JQY3A1ejl3UnUzejcv?=
 =?utf-8?B?WTRicFFFVmRKUUMwTmhzTHpXMGh3K20zM2RrTkxlSE82WEg3VEN1d2xwQUFC?=
 =?utf-8?B?WlNtM2x5YkpmaElWYk9xTDhINlNaN0xHbk0wdzhvY3QxMHZSQWdRc1pQMFhN?=
 =?utf-8?B?eUhZRS9jKzhkZDF4S240MVZoaDQzVWc5d3FoOWQyeTB1a3RueFl5RnRpU1B1?=
 =?utf-8?B?OGthclp2QWNhOHJ5NGRKOU40amNrVTkveXExZFdCK3RBN2FKeFEyRE1JNVkx?=
 =?utf-8?B?bHBxZDJYRC9ybHIyV2h4RVZCMkczMWhWYnhGTkcrOFJWM1dDWVFhUHZscTRh?=
 =?utf-8?B?N01qNmlncVlYbEVVNHZvbDA2WGhycnJDdzVCYzAwSG9vcDRWR3V0YWljemlL?=
 =?utf-8?B?eUVKSDlubnZtSWpwand2d1pCQjh6Tks1cVFkZ2pvSnoyOWt1bjNuRno4RXdL?=
 =?utf-8?B?RVRqTjNVUTFrTURkT25qcDBPVDVDM2U2dUZOOTh5TnBmWkJVd2FxWkNrR2JM?=
 =?utf-8?B?dkhwSUU5bFA1eWxXSTI5dlp5WFgxeWJNaHVVUWdsbHNTVUZpTWZBV3FRbzlC?=
 =?utf-8?B?aDBWVVZ6bXhjalBVVENPeTFrbENiSklmUHVPeU5XTFpFMXR6ZHBGL3A0TTJS?=
 =?utf-8?B?VHRwRWZwVlNrTllQa2xGL3FiazJubUY5SXdvd3Yrdk4rcjZxRnRTRkNtREhj?=
 =?utf-8?B?b01LNHU1NFh6Sit2emxrSE9pNjRhUnFxVmUxNUZFRm5XaUsyZTI2aFB2TFdv?=
 =?utf-8?B?NHFMVmxVcERGWC9PdnpaSHBSTU1QM0F2a0FJU0c0SFVnelRqWHdoU3o1QnVs?=
 =?utf-8?B?Uld5UkRlVjRjVWNtRnU1SUVEWW43a3RvLzJlSlNEVU9XTHZNbjIzTUhiWHRT?=
 =?utf-8?B?TVVLRGNvbnJEczlKNkN2NzNjbUR4VWc4RHUxSlVlVHBDZ1l0OEkrYW9FV240?=
 =?utf-8?B?ZS9YRDlXYVJJa2tlZjdzREROOEw2djA4eFFMTi9tdUtOdEFTaVcxM0g2Ulcv?=
 =?utf-8?B?azJWUGFVSEdjS0NoUU5oTmJSWlVEbGxJWXNNanUvTm1nRGYvUmMxaGhHR0pa?=
 =?utf-8?B?Z3VwWHpCK2lvaEV4aHFlcDNrRUxVUWQzem1KYkN3M2tibXBqQ3QvV3hhNTA3?=
 =?utf-8?B?akFWbXJGem5vRk1oQUN5QzZnZEhnMmZodDIwVXVnTWVoMXhSME5IbDB0NFU1?=
 =?utf-8?B?ZkhWR1NHT3lVYmtucVY0cTRpMmZlaFcwVEpPaWcyd3BXOElCMDJNY1RxcHM3?=
 =?utf-8?B?b0pza2NWRWRwbEV0dkR3RVFVV2FjblZyQ3MxR3k2eVJ6YlBJTUl6c3JacW9T?=
 =?utf-8?B?bVJydjJoV2dodmJKTUZBVnREd29sYW5DN0l2d2tlYkNBc0RqbGc0Nm42M3k3?=
 =?utf-8?B?MnI4Zzg1ZThIOGpHWTEzMjJoNzNSTDBWOWhZL3VGYmpqakxJMmtHRnd2K05r?=
 =?utf-8?B?WTJzcEZJNi9sdmxrM2N1WFk1a0lmSzdNblUzQzgzMFoySXdGVitRWHFiWE5j?=
 =?utf-8?B?aHBaMzl0WXl5Vlo2bVpxd3RvbFU2YkQ1KzErckhXQXRUYnhNUUhNejNkZGM0?=
 =?utf-8?B?SEZVWnB0cmFWNHVUVFgvTFJiVzVpNFRhWE1sakJHQkprR0lUZlcyb1hkaGRn?=
 =?utf-8?B?TURFejdhT01QcklqK0VCdEY0QnI3RzFSTnBsYXZXdmc0TFpwZmVaQzVMUXlH?=
 =?utf-8?B?Y0JkM201TnpsUng2RVFhWHh2MG8xajU4NGVJeEJUUitlQ3VDWUFqVjlFcWdh?=
 =?utf-8?B?QzdTcTNCR3o1eWdsaTV6OGNSbkY3MU1BQ2dNUmhIMjZkRzdUSWlaUWZmMGFL?=
 =?utf-8?B?MENuUVVBTm5GQjNCN0k3blQxd0F3S3ZOMFJpSmdWenlBS0xmSU5TUURBTHk0?=
 =?utf-8?Q?UE9PDcLU2KeBidd9narzMZN6syI8Pg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 01:54:27.3983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85504a06-d740-49b9-f7e0-08dd35078b45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6908

On 1/14/25 7:48 AM, Lorenzo Stoakes wrote:
> On Mon, Jan 13, 2025 at 10:53:33AM +0100, Alice Ryhl wrote:
>> On Mon, Dec 16, 2024 at 3:50 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>> "Alice Ryhl" <aliceryhl@google.com> writes:
...
>>>> +/// [`mmget_not_zero`]: Mm::mmget_not_zero
>>>> +#[repr(transparent)]
>>>> +pub struct Mm {
>>>
>>> Could we come up with a better name? `MemoryMap` or `MemoryMapping`?. You
>>> use `MMapReadGuard` later.
>>
>> Those names seem really confusing to me. The mmap syscall creates a
>> new VMA, but MemoryMap sounds like it's the thing that mmap creates.
>>
>> Lorenzo, what do you think? I'm inclined to just call it Mm since
>> that's what C calls it.
> 
> I think Mm is better just for aligment with the C stuff, I mean the alternative
> is MmStruct or something and... yuck.

For what it's worth, I think using the C naming here is a very good approach.
Because if you come up with a "good" name that is different than what C has
been calling it for 30+ years, then we have to be very thorough in associating
that new name with the C name. And it's hard.

And "mm struct" goes waaay back. Just use that name and everyone will know
what it means.

For less well-established areas, with fewer callers, there is much more
freedom to come up with new, better names.

> 
> And like, here I am TOTALLY onboard with Andreas here, because this naming
> SUCKS. But it sucks on the C side too (we're experts at bad naming :). So for
> consistency, let's suck everywhere...
> 
> Feel free to put a comment about this being a bad name if you like
> though... (not obligatory :)

For mm struct? Maybe let's not! Explanation without the criticism seems
more appropriate imho. :)

btw, I'm very excited to see all of this Rust for Linux progress, it is
wonderful! Thank you for this!


thanks,
-- 
John Hubbard

