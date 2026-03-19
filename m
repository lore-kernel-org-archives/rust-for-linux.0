Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9688262A6
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773882712; cv=fail; b=T1a+NdGojugxQ/hJe3PkJBosKhCniRz+QJf6EyEEvy3voyowXx5qvyMPGss76ZVQM0hr+VBkHhK7UxfUGbpm6pvWJBctleO15OgUTW9+HopSRP9VImyP4kvRq4QYlBapVHcUJYT7iQLlzBKIndV7XvT6WX/jTiR/dfRB+1t+xBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773882712; c=relaxed/simple;
	bh=s3rTYOmQkDYK4L5GiiGuGTzrPGWX5sydOv54KW6MWiM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U/NnDcKh/csMuJHZYC3/UJywGVXl8T+OE5ZvK2Cu6HyHpbJ+t2xYhrewk+CyuRpjZLpx9p1f1dLRzHc7R5Q5niDNNubE04Qdke84K7bXH48ZKCvbCuJ1kkARqaMrJrjJdqC9rBYv8sldkDtMhxUTygbqvLHyDSelgEqfQ8i56XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c4UnGjzc; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c4UnGjzc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3N1C9ezVDf71e8Wf+D/s7Vscv2R1Oi48Me3synXzNL3ojB+2ileD/t9ISZcjoAQFOpMbxrlKDsY10TylBY2qsOA4yeb8KN3DN0vCqvBsIXlI6t+aj/Z6KcWTgEgNXXapgpcjF0rKUjJ1H7SdzFEs+KJC4Gij4VFFXt7hNat6sfH6E2lrFBTYiw2WBBpPZdtiFZWSXUnQ7RebbeMaOiFurGfVEY3lTcHfanki6bPyH760vvHEFXm7Sg4qjeIbaRi0WyzGDafZVrA9ZnjYQo54iJwaoL63miJ8mtiNsRQmMj2woykdX1k+d6U0Hjc0rhP236fHSit6hiXdPvxRfK//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbABdDHVYw9uGFpbdObNSOgbgb11E/1BpC4tWMM6auQ=;
 b=fFQtr+ev2GTJqN6A24q9FYj0nL4r6cS6NoAZ2yzo+6U+8O3y/YRchfnWO+dUMqaZbJxIsLa8oEO+iGr0tD4dxfOLhkEOpQn6ajqWZjtVjFAbsMCM9X1I0ZRQf4JY8UYVislRb9zDNMt+V9VUiZDOXkZSwey8ShAAhegQeedw6HZp6ONpylGwGuF+MeSQc8Z6OTvk7vZjdLWXXqRnHk0QwnESsIwU9e0ObAhqGeDQarWrYMD539E3wMb1Ewj5HqoXlGUY7Q79xKj91DmYAKPQpBAMx5abR0dyg+KUDNsQP8N4O7OGGut/QoTHEWZv0aGNochd/WXwsVFuqlH8A4wRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbABdDHVYw9uGFpbdObNSOgbgb11E/1BpC4tWMM6auQ=;
 b=c4UnGjzcakVt0h9v3VP/a6RsShnQLk5AVZshkaUFvsh8UtUgUyJ6Lg0pZ75K4CZ0HDHjTJ2QewIpt4aMY9VNoEDe9Qiw9EggFsAoreFYSbOc/34sbKaVgoMq3BtY0x+o7hEtcIqu8ue9BU17usybneUhgtPFJ3wj8pha9DSc/Vs3hYdyF7Dj1IGZokUx2l64+TRvFhyFogs972TA+Eajq4KtTM798243WASbQuoYiMlgTeqqg83qXYYEs2tv+YV5oEWRZlmUxoJWwC32gwCAa01dC30YjyXyWCD5rW01ueoKDjyiqX+shG6JbaWoBybjS9VB/qhXZijZweabWYhQDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 01:11:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 01:11:47 +0000
Message-ID: <7e5027ff-7203-44d7-b9f0-b2d74c3aa130@nvidia.com>
Date: Wed, 18 Mar 2026 18:11:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org
References: <20260317235403.1094713-1-ttabi@nvidia.com>
 <20260317235403.1094713-7-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260317235403.1094713-7-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ae3161-b0b8-4708-e90d-08de85547e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	ocyHYz974v35fbynelsatr8okUdEOpODdbBp1xD7QMyHWX0qepVyh7oY99blylFCcLUzqrPZEGl2T9OsOd0ChAGRltQpv8n1PgMdN8mvVMu/nBngEvJwBhGCQ0SgNGCpuVR9Dyq1wTRKgqZYuO9S7XPPDAggyIJnvAM4gwYHb4twVFxzD7gi81/SgXhE22LIBibD3pjtnivzeTi2FxUAR+XYHbdwj0BqQHuHntnRSOUS6VrkRFkei5LfLN8GVGyJtVNFyJPWW2VmFDWmbR0KVE0b6LEDl9Sd6zh33YNo1WTXVc0nGBRV8pcFTGMmFfoJ1Qr1bZAdxr9uyPwAKFBjgq2d9Rap3Bj3i0VegQBFH1hwWQ+pvS+w2ERhZhZxAJVi2Vu9Kuh7FWCGceXginR3tquduNLBdi2qBIlGzFS5bgEcZbRt8S+Htyn5H/m8mhq4PVK3qMdT+Y/xN6o228mZ6U4/AQwCRD116C62nIMF7ipOShbbSBqGLjThbxAvc04E05rb64bv6GdPktvHNlx3z6A/X0RarsgJzUGDMBd6TxnaFGVkpvWpVGWpRtQprA++dxXcq30DVdipApz2MoshRIo9Tib26OsEQzdboWSAqBjqHXg4ZbsivSb4VmLQFivIavYE9A+kBiEAbSlZPHhCkBY2GV7lxd+EfWgtRy7tHY7t1kTN3cbmWLzz3iF+fZdYiJK4srVjb7E0AQ2/I1LOv3VSzHEaOhYdIJs8/QOGtPrFhI0V07W9epwjvaUV3Of9yQ7N8i2aMZoAL1GMRy/21w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlFTV2dwQW5pbzFyVmRBZk51T3J4SjUvMXpnYUZBbzFjTUNpbHh3c3hRSjRJ?=
 =?utf-8?B?TGd4R2dBaW04d3loOUJ0endaaTFFZFdHVUh0UkxjZGNYeDQ3SjRTNW1qOHpP?=
 =?utf-8?B?eHlKWG1STmpqRWhyS0pWYUhQQ0s5TDlhb25vQW50elV2YVMyQUlhcWl5SVor?=
 =?utf-8?B?WU9sL3kwNEwyK1diWkViWXphWlRRUEhreGxBa1l4RFByUVh1SWRrR1RhSFBo?=
 =?utf-8?B?bTZXVFBSSy9ueUhMVnVLMERVeldkTXlrcXRxaHBPRXdVcDB6dWIxZ1ViSUMz?=
 =?utf-8?B?dzVSVFRvN0FxUDRmeXZmRktQcDBraFFqMnZxYzNsa1drQzVLVzJsZEdZTDZi?=
 =?utf-8?B?ci9DRU9iTnFMV3d5TGRoMDlpZ1ZpV3F2RENJaVR2NjVoSURNRWRGdForTDRv?=
 =?utf-8?B?TWJzL0NzQTQza1B3RHQvdFRacUlYRVNVdFJwbkUrRjkzOEVFTm1XcTBWSkFZ?=
 =?utf-8?B?c2Fkc0VQUEZsMEdzUndWbTNFWi9Nek43V3gwcXNuSFJGS3doTkg1VlRUamlC?=
 =?utf-8?B?RGdmVEt5eGtKY0hoZzNvczJiNWpuMFJxQWlPYTk2OXU5NFlNRndhVkF6dXpr?=
 =?utf-8?B?S0lRUkV0UXMxNVFDbmx1cFhseWU0U1F6SjBJZ1haTk1PZmlyclBpWHdyc3JO?=
 =?utf-8?B?YU52QjdBYUkza25jUlJVa1g0dU9yRWVRV3ZKYkxrOHE2Q2E3d05hZnJNUzNi?=
 =?utf-8?B?alY5YVdXR1JrMFk4amYwR29LNk84Z00xZ2lTQXVIaWpSZ0d1MVgzLzNlMGVh?=
 =?utf-8?B?am1vRjlMb29QY2VHQVUrV2J4WnYxTm1RcE5uckVLTG5xTmtZejMyRk03SDhM?=
 =?utf-8?B?ek1lblpMSGJtSHoyeTdlZWcvRG9nT085bmczdnlnaU02RWVFQlVzNUQyQzFK?=
 =?utf-8?B?eEhpU0JjcElxOVBpdlRDUjF0M3VvMHEzbUU4Zk1nRW9YM1Npc0ZzekJrZGh5?=
 =?utf-8?B?eW43M0VDamJSZE5JV2xYSTNtb2RsaS9VaWd6VmNLeERabStMZHkxcEZjVk1S?=
 =?utf-8?B?ZU5pU0d5ajVGSTRTNTlqdHozZzcyc0EvVGwzRUZ5d3pSU0RFdzBaa2Nzcm55?=
 =?utf-8?B?bEE0SzYrbW9NQ3NDVmVINlF6ek9nM1IxeWhTUTYxU3BrTlZZNUtuc1JRQm1n?=
 =?utf-8?B?Nk84dk16ZUwzTkRiVVpMWWRTWFBUMDNZNGpwdGpEdGVOcENYWkkxaGtlUENP?=
 =?utf-8?B?dGIreUhFbk9nNXY4enFIbWhpb3VXbUgxV2Fid2RYQmJyemQvNXRvc2NMYU4z?=
 =?utf-8?B?eU9lZXBqeU9NbjNKUHdNUkU2OUdtM0hyZ1BoSU1xUlhIZ1VOZnNjVXlITnNF?=
 =?utf-8?B?aEU0YUpCVVRZMGlvQk81OThDNzk4aFltRDQxZ0JiOWhkUUwxWEpyM21CVE5P?=
 =?utf-8?B?a3RhUkhBNzJ2bU1ZSTk5dTZuTjZ4SDVjLzFwOTVOaWtEY1AwYXB2ZXdYVGpw?=
 =?utf-8?B?aGRDclFEUVJ2a3BkVGJVbUwrdDhLSkphSDlEZGU0blpNRThPNHdvVWo4cXV5?=
 =?utf-8?B?ZlRIVjFObXJaQWQxYTNVTTBRWHVNYXIrYU45UCtIQnNkMEcvZFBWcFY0SldT?=
 =?utf-8?B?ZkprM3RobWZGNHllSHA4UnRPOSs5KzF1aldvdDNWRmFURzBPMi8wWmV6d0JE?=
 =?utf-8?B?RnEzbjNHbk1TSE9VWk51L1c0c1pmRmtJMmFCdzhadlpNMnN2ZTlWSEpWc1hX?=
 =?utf-8?B?OVNQYUhidW5lQXJ0ZmJvanpSM1pFZC9tUXFWVG9HTWRhd1B6d04zcmd2dndw?=
 =?utf-8?B?bFdVVjV2WW9wWXUwbW1wa2xKWDUrRzVBSFFuYlgwWFl4QU9sNmJySFd1UWpI?=
 =?utf-8?B?UFVqdGJ6TXlnWjlRQkY0VzQwa1pqSzJkRUt2Qy9Cc2YvbXUxTFJRSTMxMUZJ?=
 =?utf-8?B?N241Z1BMTmFlTG9Bbm0vWkVEZDZ4OVhzNm4xMnI0WnB4RFhycXA3Wk9xL2M4?=
 =?utf-8?B?VDBkeGxXc1lZanYxRXA3L2ZyYjJYWUVzd0NsT3lvbEIrbC8wR0VLaXNZZ2FH?=
 =?utf-8?B?RHBSMk1zOTk1V2hHSzNRNkE2REQ2YlVCN0NzRUUrYVc0Z2VDZEptMGViWjNx?=
 =?utf-8?B?VkExQXZSV0l1WThKRlhsM3VWVjF3b3EybXVCQkx0UVNxbGRZMEVuVDhheEtM?=
 =?utf-8?B?WnFCS0huelVBbHk0S3U0UzNRWG5tendqRzkzMFhvcDkxeGRXSEtBdTRvcGtC?=
 =?utf-8?B?ZGtxeG1lMXdoNWlNRlhiWlhxVnBEVFVHczY2Y1drMUQzQTJuZ1dHSHFneHVL?=
 =?utf-8?B?R2JLV0JBTXNaSUM4T0VkVUw2c2RBYkw1NUtnSHUrYmVvSjF6eVJRQnpOSzZI?=
 =?utf-8?B?aUVjRTYxVkEwTkFmYTNESlVrcTBpbEt2cXhmSXNOVFA4a3BSWTlQdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ae3161-b0b8-4708-e90d-08de85547e35
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 01:11:47.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVUTHIDlR0TGoFN8w46xcjx3mYPJSd4glWbUrsXCSmeu8/nfVpsqOhIB6dEmcsFDwAxccQw+T2lpAunEkrp/KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On 3/17/26 4:54 PM, Timur Tabi wrote:
> Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
> are the three primary printf logging buffers from GSP-RM.  LOGPMU will
> be added at a later date, as it requires it support for its RPC message
> first.
> 
> This patch uses the `pin_init_scope` feature to create the entries.
> `pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
> reference by delaying its acquisition until the time the entry is
> actually initialized.
> 
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Tested-by: John Hubbard <jhubbard@nvidia.com>

(This patch lacked that tag, so I took a moment to retest the v10
series overall, while I'm here.)

I had to resolve a bunch of conflicts, because Eliot's patches still
are against an older branch, while this branch has moved ahead.

But anyway, it passes: decodes a Turing log file with this v10
applied.

thanks,
-- 
John Hubbard

> ---
>  drivers/gpu/nova-core/gsp.rs | 48 ++++++++++++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 72f173726f87..9399783ccb8d 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
>  
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -102,17 +103,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
>      }
>  }
>  
> -/// GSP runtime data.
> -#[pin_data]
> -pub(crate) struct Gsp {
> -    /// Libos arguments.
> -    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +/// Log buffers used by GSP-RM for debug logging.
> +struct LogBuffers {
>      /// Init log buffer.
>      loginit: LogBuffer,
>      /// Interrupts log buffer.
>      logintr: LogBuffer,
>      /// RM log buffer.
>      logrm: LogBuffer,
> +}
> +
> +/// GSP runtime data.
> +#[pin_data]
> +pub(crate) struct Gsp {
> +    /// Libos arguments.
> +    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    /// Log buffers, optionally exposed via debugfs.
> +    #[pin]
> +    logs: debugfs::Scope<LogBuffers>,
>      /// Command queue.
>      #[pin]
>      pub(crate) cmdq: Cmdq,
> @@ -126,15 +134,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
>          pin_init::pin_init_scope(move || {
>              let dev = pdev.as_ref();
>  
> +            // Create log buffers before try_pin_init! so they're accessible throughout
> +            let loginit = LogBuffer::new(dev)?;
> +            let logintr = LogBuffer::new(dev)?;
> +            let logrm = LogBuffer::new(dev)?;
> +
>              Ok(try_pin_init!(Self {
>                  libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
>                      dev,
>                      GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
>                      GFP_KERNEL | __GFP_ZERO,
>                  )?,
> -                loginit: LogBuffer::new(dev)?,
> -                logintr: LogBuffer::new(dev)?,
> -                logrm: LogBuffer::new(dev)?,
>                  cmdq <- Cmdq::new(dev),
>                  rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
>                      dev,
> @@ -155,6 +165,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
>                      dma_write!(rmargs, [0]?.inner, fw::GspArgumentsCached::new(&cmdq));
>                      dma_write!(libos, [3]?, LibosMemoryRegionInitArgument::new("RMARGS", rmargs));
>                  },
> +                logs <- {
> +                    let log_buffers = LogBuffers {
> +                        loginit,
> +                        logintr,
> +                        logrm,
> +                    };
> +
> +                    #[allow(static_mut_refs)]
> +                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
> +                    // after driver unregistration, so no probe() can race with its modification.
> +                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
> +                    // registration and cleared after driver unregistration, so it is always
> +                    // `Some` for the entire lifetime that probe() can be called.
> +                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
> +                        .expect("DEBUGFS_ROOT not initialized");
> +
> +                    log_parent.scope(log_buffers, dev.name(), |logs, dir| {
> +                        dir.read_binary_file(c"loginit", &logs.loginit.0);
> +                        dir.read_binary_file(c"logintr", &logs.logintr.0);
> +                        dir.read_binary_file(c"logrm", &logs.logrm.0);
> +                    })
> +                },
>              }))
>          })
>      }


