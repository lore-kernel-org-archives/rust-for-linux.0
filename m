Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011054.outbound.protection.outlook.com [40.93.194.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338F12D1F1;
	Sat,  4 Apr 2026 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339395; cv=fail; b=iKBX6bkMBxy9aMODpSngqTO179DSUQNLZLMUKwjTAc+XPcb7FUA7GyHniwV0C8NryFyYe1V/IIUErhJfi+ZCsuJIfuhIJATRjFI5bQyTmuH4gE+pQ3M+UosvL3wB61xhHUDwPlz9D4O71L7ZBTpOEt5tdJNHb5Ub8fwMZOZAXZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339395; c=relaxed/simple;
	bh=bpkuqbhfz4HnvLuQopD73iFsqEKoHM4uPB7gCI9Ej0A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gjkklD7qqyOh85fl/rU3i/OrYh/cYxdSHQfiy9rvViGEKnqE+pFX5UhN7dUIk8M5HJHS3AgiDcYPV/pvUon+HyIMTU9myU3Blz0dtV/BulAp0z5KOdr2yW0+OUha7RGS0DD1hgCXj2Rls2aRIXfAsD6fNAYsWZtZJZAiJ8b2IpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZmarLGt6; arc=fail smtp.client-ip=40.93.194.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZmarLGt6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAGQvoi7Dl+DlIzMzU9wT10yM9Ue1cBpDR2RJOvwh/8wIpWtxHm/SName4aTkFYdjd26/R7HS3TzyWHTTgnQhx2T7jZFmUQl6VWm77xw8QwGRt51Xv32MS2XDrOlWhQRKSCA6Q0C9pG6/xoFUDLbT+oChDVZF1GM8SUZFIAFEvoqjQq1gb80R7CrcopuzJ0EVD5OZiawTpDlhzOj7v5d9SVlpdiiQtDLD6AauleD6xlrtj2xFWj4qhIyzHp2r3hgOUdvvP4VEJE5OVwQJ8LpWu1fn+eL5u461OS2f1AfYCl9miji3FBUHQex+E3TX88ySQ96UavsFAILFCLJn3Y6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oJNt3r+wA/bv0fCjuL88XXVG5iED+AGKA+EHeiDb0Q=;
 b=K/pvIU+N67EChpgw6Uy8reXxIgrps0mMmpdOd53bil8NhoigshWCaBJ9Fh2XFyPsHNV1MbsWL/7dIZDKlK1iddJV9eRqUIQnNRzNid7ZUsaNWIHm5m4YSZEmpuMetmgMZNe6gAjoR8Ji0FPF52g4DstpYWyI9wtPFlDPJkrNysMh8nozV+htgl7us4/oYaqCQ/05J8cB6dohE93n5lIuvh7rjyXZaXL1wAtSIMFwBsmWYuhe7lqNGTLrG42OaQ6wyE2L2rmmyV1PzUtlpV4C+OuHlhapQtzT11Ez77W7LSYpTfAGSLMl/SZQfysB7Ly56EsM6a/VJ/26MF8I+hvPdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oJNt3r+wA/bv0fCjuL88XXVG5iED+AGKA+EHeiDb0Q=;
 b=ZmarLGt6X/LiWpoNe3leGKpfqzWPAfvLfnyaL1okzljzkQv24ZQs9VAeYrK3Kri3O3UDXchI8rQsmrt5KG+EOzDF0cZdGfBuLd3WeeafuKmW9oSSai9UO7Ee8PcKE6ntVt8g8jqKuaW1foaDq9iZQKpx/Tcmb9M67DUW54AuJaZqzEeLK0mK7tmdXLtfc3E9ZFYkjugxj25DOuogZOE9A0vjSN8P+1xXqcdkGoW7GQoszkK/RrTXY3rfnm6/HTjmhEa5Xa7Sdp3aIGXW+FtHjLHi2pdUuWj0O/h/okkpBOjoqza0SUMf6ENbAF77WdKkmdlQ7ilvrLFEgRdie1iftA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 21:49:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:49:50 +0000
Message-ID: <8d8b120e-be8b-409d-9a40-db0f2aa08d6a@nvidia.com>
Date: Sat, 4 Apr 2026 14:49:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for
 slice_ptr_len
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-4-jhubbard@nvidia.com>
 <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 4549c4a2-04c1-4598-efef-08de929418a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3t7CvzA2OVIvP16AcLM3Riywt/0t3yAe5ymYbtTHR8zMcwT3UC3dDlqo31OrHhJUan0clsfRFAK9Y5FWOQurYmKaVXE/SPFxCJU+lF+HAtIroCI4X3+Uq8WJfMPfFeO9sITv3ofecY0rJEmtUzWh47sJT0SW8b1DZmAgfFf2B2S2A3Y2CfG8q+5zWQm6J1f0zK7MTWoqqvFa/xmW06c2R8Dpb6wHXlF7aKgoQsKU0O8Oeq6c5nU1E+NDpLtcVX3fMMFXwhHvTHKhWIeqpucKabbhPW7pL8HFtmn6qwwDV9I5h5EgQT+fOGNpqwONUdl4mHqv2RLorQhOxN1pPvNIg8CSG0po8SBTsBKPp2Tqx8xC257xha0LjW/BxukHQvUv8XTCUSlnlwr9gtYK4sr4hUllVpo6YBP5e+RbodhfH8qvcH0my2NI/2Y3JzhUlBnfsG9qk1jGUpfbuoambfWFuc3KmaBRfsOBrgec0hhklkZNLUQs7KzlCGpwpk3XvRuONUr5+cj8e6W64cWQCc/AhHBpoDLSUbEnbznAk1hsIj/BM/dEkEc1d07zMwKGn0C6iiKvjnAS47xdkaOzrF3s4KsaSTkxbPAhEid0wv9GE+smdrx0Uake60C9CI0fkcMZWbtO27sDbdKS6km/4koEvp4/M6MsDq2gaiMR2PNaahMD8t2Kq8Q7QI45SS6aTe8vp0kl89Kcg8YL2zO9Yc2vS+g5vGB92xSEjCKPZ1g2fc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm0vU29IU2QvdUo2NkQxdUw3U2tBeVNMKy9tSS9KOXB3NERXM1QxY3J0SHJw?=
 =?utf-8?B?TGpFN0dmQ3czeFBRSjJORDdwMEJPSzgyVnZIQnU1MUdlWHFoTEZNdVMyY0NO?=
 =?utf-8?B?T2dKUFhzaWh6TWx3NXM2ZDhPR3FJMlZuZHhWdDUwMUYrT2VRUXdGcUFSRGZG?=
 =?utf-8?B?RFcvNWUzcUtVYWJHZEFpNjc5K00wNnhTYUtsUTh3eE8xWVB0YTltUURNREc5?=
 =?utf-8?B?WXoxaEwrYzNXWmdHZVZKV3lzaFRoQWUvb09ybjhyeUZxZERTa2hURlpXSHRI?=
 =?utf-8?B?Y05vYyt5cUNZeVQ0SXlMTThPaWRjZm1DaWgvMFh1NmdUd2JFNGtuUXo4bHRQ?=
 =?utf-8?B?SUoyOG9kaXJEd2lxbTQzdkJ0M0ZCWFRLamhsendLTXJRN1lPZ2t1MEsxU0hU?=
 =?utf-8?B?VFIwekJyN2x5ZG1zR1dmU1VkMStSbWRJZDVwSFlZbDhzT1prM3dUbERKODFx?=
 =?utf-8?B?OVhRQ3Z6MExEYWovZEpqdGxBdzlWNXphKzZiZC9pYUwzZEczaDhjRHRTdkRF?=
 =?utf-8?B?UW5uZjRjQmcwWVRHZzZDaitDZGNrMkY1a2FsMS9JREdjR0NTN1dSMWFVeE5U?=
 =?utf-8?B?ZDBzZHliQVp4MVoxMUlRYjhKdkxhdmQvOXhtUVZiV0VMK3k1ZHBvbms2UlFM?=
 =?utf-8?B?N2NqdXVCR3QxaS93UHJ1cHBNSjFUOEV0ZzYvNThXME1FQkIra3Y3VUszWHVP?=
 =?utf-8?B?MTBrNjROR3FTTjBsQitHVDRPeEdDdk1qMGlSNkUwaGRVVXphQXdyUyttY0lR?=
 =?utf-8?B?bjRpREpFQjVTWXlhZjZ2KzR4ODY4U1NoT0JIcDlxY3dDTmNjdlQ4ZmQ3RVhB?=
 =?utf-8?B?ekE3Rzg0T25VSndIN3F4cy8zNENrbXN4WWhvbmFhTWduYjRSREVNbFdEY1JS?=
 =?utf-8?B?cWlRSGl4TjdIc0FEOHBMOER5d2wwSHhxb1Rwc0JNYlR0UjZLRlBZODJvUjJu?=
 =?utf-8?B?dDBzNXlQMENTbG1BQzdvQXJvK2hTUVVHRHNpK09VenBKL3JGQlpMTjJXeHdh?=
 =?utf-8?B?c0kydkM4T3pPRXNoOTJtWlFrMlRyMGtwUk92Qy9MaWhIQ2F3L2tsRHZ6WVpJ?=
 =?utf-8?B?VUZ0QUNoRUhwNVMrUkpTaDVaMWNMTUV1UkZFb3dWSlh4TUdJNUI4d1R2SmxP?=
 =?utf-8?B?QWpYZzcxQnlzTHVJQVQyeERVV1MxdGtlNVZOZkRMU3FmMVU0NjlyWU5ySGN2?=
 =?utf-8?B?Sno4NmxGcnRVaXBobzRLYmtlWkhZSVFuWlRncTRManpnWkxWcS9KNXloQ2VF?=
 =?utf-8?B?U2VXcUs4ZldHaERqQ2J3TTI0VDVGZ00wV3JHQ1NRaWFSU05vV2hqSy9TcHQ4?=
 =?utf-8?B?d0dPNmRoYjNuYjVNcFRlcEpQQjNkQlNmQmJGLzF0VEx2OU04TldiUzBYeTZF?=
 =?utf-8?B?OWhPTE1uL04ydGwvazJtRTMrNDlOMmxaZTdXUmpUK3gxdmVmaEVmRmpETU1U?=
 =?utf-8?B?V08rdGVXSzZaTlFuNHhMczRtUUt5dlc2OHlhNWhuQ0FuNlRkOXZJbGFhT2g4?=
 =?utf-8?B?NUNTUXFhcExCaVFwYUZkdUo2aFBlSjBrQkJLc09SSElvUmdIMUFvVlVwTlor?=
 =?utf-8?B?aHpvaWFuOFJPVWRtTEl3bHl6a2hZYlBTNnBkZjhKdFVtQStxZkFEWGp6V3dE?=
 =?utf-8?B?TVhNc1daaGlDbnhHUjBlZmJ1MGNYWmJWSGttSng0dzBpamg5V0dkSFZKb2JF?=
 =?utf-8?B?VnlBVWlQWGhrTHNhVnFUQ1FIWW0zTE9MQS9uR0xPZ0dOcElUN3dDYm52K240?=
 =?utf-8?B?MW9GdUFXZUJLdUxpODV1MFcraUhUMndiTXgzOWlsYzJyeExJdUpBT1NRM1NF?=
 =?utf-8?B?NGlFZEFVQjdkZXgxWHh3NU9IWmZBeHFMb2ZrZFdWWDBWRDRKWWwrMmRET0gx?=
 =?utf-8?B?S0QwdVpJaHBEdXZWemV2Y2lBZGNUN1ZsOU5MWmZDUUE5d3hjT2d4VnVZSHBS?=
 =?utf-8?B?aTY4Z2dhaG9NcU5tV0VaMGhzQzVTVHZGdFNFU3IrMzM1M3RVWEI0UGUxQU5H?=
 =?utf-8?B?U0IrUjFCV1RscDB1SmlYRXVwVUpvU2hDdktBL3FtTlBPdUpKUFVtS3RBc1Nw?=
 =?utf-8?B?ck1TcjFTbWFueHRlRk5mb2lUVy94WVc4K1pncGZJUHRJNkVYaXhHQjFGUUV1?=
 =?utf-8?B?QTZXS0UydlNMKzhENEFLT1NscWcxUVZJaFByTTRZbVd3Um9xanZvaksvb2wx?=
 =?utf-8?B?TlJUdUFiWlY3MHZzQ3FEelJuS1UzeGhDOVAveXBzQ1lBNmFBNnc1NjhrNzRx?=
 =?utf-8?B?WmxOSzRmeWUzNkZYN1JISXNqU0NJeUlzYituZzdQTVZ6SGNjM1Q1MGQ1REtD?=
 =?utf-8?B?czA4WlNyR2pOekUxQngrTnZTK1hOVG1DV2VPb1ZmZnRwKzhsVmJhUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4549c4a2-04c1-4598-efef-08de929418a4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:49:50.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CcrWjXH2uXy4YFFrkwmyov2vew/qibTI1kRb7E2Lsd4hyk1eEQ6PSiH5gXo9d+zksvjQWfTtEDdIe1sOPDfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602

On 4/4/26 2:46 PM, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 11:28 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> Clippy reports four warnings when building with CLIPPY=1:
>>
>>   warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
>>     --> rust/kernel/ptr/projection.rs:79:26
>>      |
>>   79 |         if self >= slice.len() {
>>      |                          ^^^^^
> 
> This will also go away with the bump:
> 
>   https://lore.kernel.org/rust-for-linux/20260401114540.30108-3-ojeda@kernel.org/
> 

And that bump is destined for this merge window, right?

I'm also wondering how much, if any of this series here is needed
soon, to remain warnings-free.

thanks,
-- 
John Hubbard

