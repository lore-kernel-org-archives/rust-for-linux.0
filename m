Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC7327BFB;
	Wed,  4 Mar 2026 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650418; cv=fail; b=Ffqia3My+XwoWlFV3/viyMpw05k6R9sRHU1vU8wE/L84YJsY4+gIvSrhFyfLJaCFAaxBRLPobjbKc3/vpFhC4YeNJCXqmdPttZK696NcwLIYci2ortyjyBuypYfTdjRbKLgeiVY4k4ilecYsmaonZWFnijtoesXPmCRg1lkBOwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650418; c=relaxed/simple;
	bh=SqNX+iIDpYk/xHFOYvk8XLZ0GyExSuttSxAEmz1BaTA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IG6veJ5y4jppRGJNREGuETidIAB+kLMSZAM6ouvmlsGdvz56sJcVVtJDrqukwrCaOy+ecwqPR/j6VGZi2iwZqH1T+K9XDSn0X6fvak9+dX4dFt9oSVCCNspLu4tNI0badE9RIUgOevmSMVK7WWfSD2HiPnwSRjcnX6WyfVn32I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ljTJNRAK; arc=fail smtp.client-ip=40.107.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ljTJNRAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnYKg81U+er324/3BrgeRwba+UcOtam4C4EVkC86p19AT4xzErT7nBDVg8SHCKVi6IzdYTA4fahtOW2hDUN4hJOmwPw1EFbpe7zoNVM9mVm2FrZxeTz5z8pKfagoszdLWvyenhfF/Ith0pnaOrD8Mg7/RewzjhnlAqb//D+XX4BTGu/3LeIzK3mPJPrjqkey124jpbCCITKkLaR9PM21KyuAX1ZGknRWedPgsVbLeFvzVj3sklN/44kAPgKrZxgY2clKVgbgyH6gDCoMkeLoihd+mhHL/aQFn2EGVY0GEZ1hY81CmOi49FUSbqiTCmxjfSxgdimbAWOJXk6fteO2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8r6s+D0TOPU7KROVLk4J9/9xqL36DSyhJY8T0RwYOI=;
 b=kVhKPV0FdyE5XqyFP37w8HkHZgWtvHN2nj2VkMylWZaHx9FoUUqto2s9UPXirscdz7jqtSbu4ZBHG3UvGutW/iflIl30bGZEVtkBBq7d2zQrYVa4sDrXVfhsIHzebgsIf2xihVOMU3Hgb+L7q+c06AgtqOrbZfDF+TWiURFbA9cIADQd/svE9Fv+D+hDisweyLQPfE47t3mJ7MzyHP8pXzk+w87WPIE/oav1SsJcydwfUEfHWOJyuBTJctQJ1s/NRZzFLUQZp8YoOS5zfZHFEs8ubwyXEDLEN3snCK4JD4NM7T6MiG+MraUYBEvmcc0jOZJM13Dwik3rFdAzOsbWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8r6s+D0TOPU7KROVLk4J9/9xqL36DSyhJY8T0RwYOI=;
 b=ljTJNRAKoXiRqIbZprTWw6IxhrqkS9u/VmNCp480/kqG2Zxthhitd57EXYgfUhOD/wkUiV593U0/uf4Lbq+7NYTdjeQthPhlFHS70UcPN9aOIFxH3zT9qvs+qjRIW8EzbrcD47WLpWE2YuxnNOg9RNte4wVSC3/79EO43kbcY33Cddn6BBzEMqnSa1rJRUpnYMwD6CVfEohQkvNT1lReqCRmiqcQh4rMbQStdEq4m+FqsKmx7gUTCrmsD2Nmpm3d6eGs1XLIBFAPOE3R7gdSgd3B9cMQELcxYRLz93lAibdPGGZdCwgV11EZitXHlH/S7xcAwY7I/YeANeAH8v2/eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 18:53:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:53:32 +0000
Message-ID: <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
Date: Wed, 4 Mar 2026 10:53:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bcc46b-7013-4903-f435-08de7a1f551f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	H1FVcgMmLzY62xyj6HvCzbDR19iFn6uQMCIAXQyeeVcS/62FPBsHpZyRmiajQWYzoYFbG/y7tjllcvPVH1Mm5lOMNy3fWh8NOuJhjriA2rqISAPXHP+oFEvfzCAbwy661kFsm//YqX3tTy5tufUUMO9qJacZGQoBAUP7FI198GSUBPYypQYcLi6C5wsbcidPtaNxFXobxNuihCn2A0joKmsoMsjqhJuzAuE+f9qy1punhYu37bfRLLrOCV2q0i/KNmevnyNtdJlss8oKuO0xj8cVArf0EfXuWkL8fMphtngl/3xqKt+J9qXz/y5SU+6BsFBKwuNpmwBxdr473x3Ypmyb+lotx8yjmf54N3YOH2hPgDkxJjYj9bEBI2O+MJNWselc/q4wmJBQzXYFTg1lSvc2NAiGtHYHu4E88Qus4cc/F01PVDe1px4fvAgWXENuBw6jm2aHIv5tj9Bzb2ZeZDgXiTjvroau6JVEM602KvfRUWee3XU9pnK4NdbIFP69TsYleviF04iOV8BBa3hCBuI+fxrPB+xev7mFx7mvfOZhPswOJDkvuIxH1W5TICqi4mw8w9YxuWfV9fs55GUhIt5MtHQP2hJG6W4qiG/HPHPG8mw15Pd+lpWHDjY93voYQuhi5EaudDQ9Oq6ZynL53ZcKtrS1aDcMS65tnpNak1albo+sBQj6QZbvV7h0Oo7e54pwX3ATZ9NmQ+uJBG9DI6xtRGPu2J8YGIkhyxXymHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDM0bGpDUG9scUs0cFF5ajdrandXTjcwVGhjQUx2WkJxODdGZVIyalRlN0to?=
 =?utf-8?B?Ris4QzhQclQ5V2ZUdFVjbm5hNmRjVVJtTDVSOWZYOXg2LzIwMXZwVTBraTlv?=
 =?utf-8?B?VVVzc25mNG5YU1NoU1dwZ1FEMnZLekkwUGRIN2M1dDFTc2dNNDZsVnQzQXpk?=
 =?utf-8?B?bXIzQVB1ODIrelFxMCsyVnl4RHNJMFovZ2VVaEJwNExkZmFoZlhSdWxkaHU4?=
 =?utf-8?B?bEYxcEFEM1h3Z3FBR3IvalB1c25CdHZyWUpPd2ZtK1ZBTEMydEh5bkthYWdp?=
 =?utf-8?B?UzU2eHN2UHlkRUlkQ2JCQjdBdnM1R0kzWEpLNEtMcmlzc3lab1hoRFI2RWJZ?=
 =?utf-8?B?Q095ZHpmNmRjb3k1alIxOTczdm1VaHByUUljVUpVN0RTYUVPaWNScFZ2U21N?=
 =?utf-8?B?d3RVcDl2U3hsVTVTUjRzRk1HUW1XVDFXbjUyOC95ZEQ0MTJhRlBCZVRhblFJ?=
 =?utf-8?B?dnIvYm55UGlWZmFXR0FpME0vekJma0ZDcTlSWDhVZjNlSUJUZUVlaVkzRWE3?=
 =?utf-8?B?aGpXNnI3dy9XS09HQmpDK3pRWVVRRHJsNllucXNrZlhwVGlTd3A1TDNoZTBK?=
 =?utf-8?B?Q2lEN3h5em5XRUcrdlJicStsSGd0eVNXRzJ4YjRzMDB5eWhoNmxXTm82MHJ5?=
 =?utf-8?B?dVgwUUZQdnc0NDZMejNYdFRyeFV3YS9GWkpqWFRqWlczQURNRVVYT3l1QkJ4?=
 =?utf-8?B?bk51SzJhQWRGbmN0RDNwTWFrRk1IZW0vWEpxYllNSDYwWW13bkcyNGZHY3I3?=
 =?utf-8?B?K296c1VyYngvNHoydmU3c2dOV2NSVkY1Slo5c2Q5SVMvS1lGY3VjU2RERGJL?=
 =?utf-8?B?N2prVkxZQXp6VFdBenhDSmJGc3FUdFlqQUwwMWt3dzVyZVd3TWVWYWdCUmJm?=
 =?utf-8?B?eDliNWprNmtsYkh2VWhxWWRiR0FIakdXSlh2aTRwU0pMb3VHa0hVcG9rT0da?=
 =?utf-8?B?RVRrME9jb1FJeTk3b3k5dDR0enFMTUFnNVRvOXkwSmdBZzdscmx2VWZjMVJl?=
 =?utf-8?B?N2lESWhXWElNeWxRc3B1MTJnLzc4UW14SjhaYUYyaEdNeitGeWNIVlpINUdL?=
 =?utf-8?B?eFBvNDBqNWFRd1lsUEpQa0NNdUxQckFyT3hRRWp3WTRXVFQwNnNjZ29kV1Ev?=
 =?utf-8?B?d3JsdnRONmcxU3NlbTJ5cnhIYUg2UDlWbW5IWVF4NEdMZER2cWUzazFsZ0pN?=
 =?utf-8?B?Y0p4RmhZZng4KzBBanUzTUFrQ1l0V2k4YzFxK2YyM2Z0eThicFhSa3U4Rm1p?=
 =?utf-8?B?Yk9wQkt4Ylh1RnB1Q0JJWjQwbkxVQys1RzdUaHJFbHAycVBvRGFXMU9aTnpH?=
 =?utf-8?B?c05MV25YYTF2bDBwVkR5WmpxUUp1VUNUMmxmY0ZTSEQxdUh3TWwyVlIvbGtN?=
 =?utf-8?B?WS9qZ0Z4ZkZwZkNoVzByWUxPU1lxa1NnZ25BTmRDVVExNzVOTCtjR2oxdE5U?=
 =?utf-8?B?S0tIaGNoYzRkZFo1NlpIVUQ0VmEvcU1md2lKcFRGZS96d2tyU1FVV0thbUg3?=
 =?utf-8?B?VHpyU3QzVVpjTG11WjM0MWhuRkpqWUVhTG5lU2Q2ZWdSaEdTcTF2ZzRWY2VK?=
 =?utf-8?B?VDNNVFowT2gzUDI0Z1RSU0JGS2R5T0dwM0ZxWDVvYU9xemRTY2RzbmFFeGRS?=
 =?utf-8?B?MmFUTUxsMFFsMEh4amR2WjRBS3VHYW0rS0xaSTBIbVZMTzU3cVhzZjB6TzB2?=
 =?utf-8?B?TGdkZWNXUXk3TDIvc1cvMit6bTFmd2k0RDFZcW1uYnhhT0MrV0xtcVRIcEVz?=
 =?utf-8?B?Ynp6ZFQrYXhBUkZrdUdQWWplNkNHZ1d4U3pjSHh5RkpQL0JMYk40ZHJXM3VQ?=
 =?utf-8?B?dWgrMWxPNkVsODZTUVJmNkszUEhsa0srUDN0ZnVsVTE1djNWNlhnVWttMU8w?=
 =?utf-8?B?Z2RXeURwM2F3ZUJhQ3BIY0F2VEpBdWJranJ5eW1GV09JbzJHKzF0Y2h6cE5q?=
 =?utf-8?B?L0NxOU4rUGtERW5aRG9zY3RiZHhqTGowcGZGL3A3dEtGdStsZWE1Y2hkTVk3?=
 =?utf-8?B?V1JTQjlmVWV4S3JKaWtHY0RGR3NyamFPU24vVHdUK04yeW84MmVjSlR2ZlhU?=
 =?utf-8?B?dVJiZGhxNzB1OFlxaHEyWmlsYll1VnE5MEFnNjRkTEtSM3dXMVliQlBYWHZC?=
 =?utf-8?B?eUNPKzNQYXZtM0lUVW10Q1NZVnI4U25GdENob01kdDZlMHVaeUhjZUNPV05E?=
 =?utf-8?B?eWUwcEloYXFOWWVVTXluUGIyNVJadXlJYVJGa3cvbm9XdVJHMDg1SmxGaWRK?=
 =?utf-8?B?cHpTQVQrM21pNTVtdzBDeWJYZlhCUlJ5Q0hieDdoVmgzOVBwUWNBR2hqZUta?=
 =?utf-8?B?V3R2V09qazh6cERWSWorSVFTQTM3d0dxRXY2K21CWVNpblViNEx0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bcc46b-7013-4903-f435-08de7a1f551f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:53:32.6189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR4av8+IJmmw8OOX1+1dxKRRDuo+gVH2VJJRCwXXGg6Vc2+0nUwP/p3VHiHXk5Nhr7XJs27EXcRuStQfVkPTzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

On 3/4/26 3:18 AM, Gary Guo wrote:
> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
...
> The implementation doesn't address any of my original comment and all my points
> still apply.
> 

OK, so that implies that you want to return an Option, I believe,
like this?

commit b41512390999f85bcb2a3809c68f392e936b09ab
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Thu Feb 19 14:44:02 2026 -0800

    rust: ptr: add const_align_up()
    
    Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
    equivalent of Alignable::align_up(). This uses inline_const to validate
    the alignment at compile time with a clear error message.
    
    Suggested-by: Danilo Krummrich <dakr@kernel.org>
    Suggested-by: Gary Guo <gary@garyguo.net>
    Suggested-by: Miguel Ojeda <ojeda@kernel.org>
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..7e86429a9cb5 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -225,3 +225,29 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+///
+/// Returns [`None`] on overflow.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::ptr::const_align_up;
+/// use kernel::sizes::SZ_4K;
+///
+/// assert_eq!(const_align_up::<16>(0x4f), Some(0x50));
+/// assert_eq!(const_align_up::<16>(0x40), Some(0x40));
+/// assert_eq!(const_align_up::<SZ_4K>(1), Some(SZ_4K));
+/// ```
+#[inline(always)]
+pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Option<usize> {
+    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
+    match value.checked_add(ALIGN - 1) {
+        Some(v) => Some(v & !(ALIGN - 1)),
+        None => None,
+    }
+}


thanks,
-- 
John Hubbard

