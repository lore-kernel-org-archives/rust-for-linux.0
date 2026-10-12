Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFE330B3F;
	Mon, 12 Oct 2026 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818422; cv=fail; b=doA2mozMOAaI3XPohCPwPmOCmjP4pGLiSH1nb0gkZvyMDmygQgnSkgajraaCIMZUuv1sk9+UNEpc9lnWO3TrjkBtnmJOrMMJJH/nRe7ZxXAa0Te+0tIxFw31Q2ux4ZygS3hBjTiaHaGo8j0YeRcjvK/nh7Oq3jehK2jzG79MR1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818422; c=relaxed/simple;
	bh=g2mQlrfSRO+0ZR6GM9Fy/mQ4/nEzLT/+Bv/lRJWhX/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BD0EE+you2atW4JzEZ8GYVX9j9iLHhKSFDF5HCJk6gduhXFqZCrgGnRv05lDECXDxIJoHKTehmoi8ng5aaa5S5AnZAI9mIe0ukAjQ52MwNZcAr1UdmvPDyNiFFHjRzGFXInrCl+TmNYHO+LJnrP5IYhg+LHy/TpvT1bXnsIBDro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qNtEQzO6; arc=fail smtp.client-ip=40.93.195.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qNtEQzO6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFWrINMBCu3tvhcJWUqT6fuUAz95q8GCKwhw+YIayg3l8Qkg0ERN3eMMHd1RbEYk86ipISuSSUwkaKL/F82iQ1iiOWwLNO+cloP4iPyQaSX/Cf1svDDB/WpDcT1eteUwaKqcbY388OHZksPcxBjlASFN1d462jiePTjVTHvj5EG4O6EAIswpvM33idNlKHHYpxs+4GA6fgkhAeW9RFD9Z5NUgzN9tysk6Wp3hrabM2/zojZ+pJWqr/ELZEjsFbDoeh5lk0LYUNNrmDVmaqJBg9tnLRMz8wJH2ri24pAI+7vMbgoi3Wx/nf8/zXtJJgW+VJ73AG4C5YEAlkRXUawvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwWjK8bL7nlLqc7Ibsl+Wu/067/YdKesdP6h9KOsf7Q=;
 b=rBo+9Q4+J70d8CyqAHCFmwNmML/0GSTRWijp8RcevfMncrxDzaFjSQn9IqggEVfFc6l5GrdLhZNmFSHnKczwbzUPqder1AGf9dlM0ilzwfLn0EC6pDKLSZXavVvzPewMhShsprz1newyqPKLsHgzn5F5WN/8B4p7gy6Fr1nPQTNDBOr+rvY5jM1nbLUZ8PiA/VgSO604XvzJnEPKFavzFywxvKqXWCqBg6JvvSf7s+irdfH66m0eEDsHi0Jm/w79gX+AqHqt1CfWxUSZtOPssDcCE9etVWK7miDfMKJRnuAJ7L2Vzhk/r988Q1Yt92u/UxNBE3rRJH/Hna5QPlig/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwWjK8bL7nlLqc7Ibsl+Wu/067/YdKesdP6h9KOsf7Q=;
 b=qNtEQzO6DJNqHzvkV49FxaQoZ8F0MESOsUafDLRUWBxpCgjR+7btnOWtJkuA8MGFjhX+9bMifXfOTJ4/wVJK3qpxJyTBxPF6BTUIi9zlvNTNwWGTB5MgYpICdLDicFoT7lpnE3ok2RRO9oEbznr5BDbKLyTKgpX/gAHOrBONhr2lP/u7NKIV56IbAZKLEz+AifxRROtSInR3uPqkw+18NTJwko/BiEKfvPlZa2Eh90PphrtYfVGMJV9Ws0qSwuIZZegI58SdVVmpKZ3mBTtI6/neqWzIkv3ixNXlVrmq/ip1aOtHqt6IF8fleh6FSvLPIBO11CXrm29klAfA6/xpUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV5PR12MB9825.namprd12.prod.outlook.com (2603:10b6:408:2ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 15:20:16 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 15:20:16 +0000
Date: Mon, 12 Oct 2026 11:20:15 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Linux-MM <linux-mm@kvack.org>
Subject: Re: [PATCH v3 2/3] rust: add a wrapper for the `nr_online_nodes` C
 function
Message-ID: <asz6r8sJ4PzYEPdl@yury>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
 <CANiq72moeX-F-XkOWewwSEJHX6F5j+7NxNis7qhPU4aDOFRRpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72moeX-F-XkOWewwSEJHX6F5j+7NxNis7qhPU4aDOFRRpA@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0615.namprd03.prod.outlook.com
 (2603:10b6:408:106::20) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV5PR12MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc5c58c-ef66-42be-3bec-08df287451e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/cqFiIwA4b19gB52HSpTxac19kpUvM0MRg9398By8KMcvppjaMplm2XG0PmLI5I/izPpmN6m6pMUq7FrwN0UQf1A+PcH1tbRW+jCelsFfWKGJ5MUuJr+blcBZq5xzianWA+4SEdBSp3tRk8wyt64+fDARD2jbfIZNz+TJPU1T3Mc4RMswgq5aaTh/V0AH+r72VZJzO+A39gY6k/Q233IgAz6loRQwtlNcWJ6HnUsm3P3kpTv20ki7gYC0ot0YUKEULFixf3DxC1k0Z/GaN6E4e+KyTRyv195DKq5iTcfpbwTe3eICF7GEsFQ7siE+M4R1H4mZNhRIXmX6xUF/3kwuVxb1Nuo3nokedaKvNK/A02ZiBKYn5pYitcIrvvVc1Al0cipzWHTrAOtgHEqD5L8IankMSOTiBQQ39PANfV7nmvRqN0pj2JrA94BfCl4a4fqDfzB76IEW0dlnwv4K2/eFrqXmZsTvEJEFgItXXLlyune2eNON9lYP4vbAPSIhtBIryo8SsTHG4cR9GT6laq30q72Qw+5KzGjb0l1QZZm9uNgDsyZZZ/7w9ZajRRwM7Inv7/mcDdkEnEpRkhx6JRtKq1Pk0qsT22YtJ4XaUPrz4/Uq2S2O9u2jopszQgveL1v8xLa9twGs7sLZXjSocFZKnuiP7Osw6zgKXtg0EU55qI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzFVbFpUbmRESHFPcVVEUXNZN0xJUTZnZzAyS1BUazZXb3pHZDY5ZllvWXg1?=
 =?utf-8?B?Z3EyNmRQUTRyT1JUTGhPMHZQY3NFbXRHVHpMM0JMQmdSY1lYUFBCV3c2YytX?=
 =?utf-8?B?bXFXbVNGL045c2krVEJXMDVvOUQ3UjlYL21TMlpoV3dJdEhSa0JrcGNKVWI3?=
 =?utf-8?B?Rko2eFVyUkxVWXhSS29ESnBtVHR0aDlmWjR6S2VuN2o2bmFieWcwTTZsSkFr?=
 =?utf-8?B?bTR2blBRVmhTemxoWkNCQ2VvVGpzUHl3K3lKSzBJa3dyL3p1c1EwdkFTQndD?=
 =?utf-8?B?Z2dOTUkxUFVubTJkK0tDMVB3elZkbW1YcGFuUWx2Y3Fhejg4OWtlZnFYMGE2?=
 =?utf-8?B?SEdTdmVVbWcrSFB3SVRITDFFZ2doT1RGa3VieW1TOHVnVEE2czlHWFlpdHVp?=
 =?utf-8?B?c0lCUkZMSlZBU05mdXpHbWVGUkw0c1MzdzN1MXk4OSthTHZ1aTlCa1hPR3NM?=
 =?utf-8?B?Z3NueGtKT1hObnJPR1YvdEg0SWVpa3NvY1RXOXk5ZGVyR082U3ArS2lZek5v?=
 =?utf-8?B?Z2FUcXUxbTZqMEdZaWJQU1d1dUE0a0xiUVp2eDRtVUdXU3JHWElLVHQzUVA1?=
 =?utf-8?B?OFZyWkdoVHNnR3FOQThmYkV5dHhXMFQ2c0Nuc1BuWlI2TkRDaXM0amsxa1J3?=
 =?utf-8?B?QmdBL1BRYm5tNDcvOVBSUUVuVy9xeEJiWENaN0dPQlNibzJOVXpHL2xNNkEw?=
 =?utf-8?B?ZHBsZHgxSUFIWVFMamNSQVhvd1pvUlA2NlIvVnlRNTNwVlFJV0IvbG0rT1hY?=
 =?utf-8?B?M1FDL2R6RDZlLyt6SEtzNnhvbk12L2MxYktmY3AwWi9TSnRaaEdDOHhKNjRE?=
 =?utf-8?B?b2czeVpBbzVFK3ZZeXV3K1lGMW93VEJ5YnFRMjJrSEFSS3gwcEYvbEIwbXRs?=
 =?utf-8?B?VlZ4dW5HRnhqWkF5ZlIrSkhEeVY3VkFwdXVobk5QbWErRFRSa25Cai81RW94?=
 =?utf-8?B?QnpSQ2o4SCtlcUVNSllMWExKVi9IOVYwNktsbmVjOW9DWUVYNVJGWVlrSlVl?=
 =?utf-8?B?dmR3WDZpdmZnWFl5RXJhUHQyYVBGbWJKMzlRRlZlY1N1UmtURUlIeGpNK05l?=
 =?utf-8?B?Y3RHNlVNNnQyR0lnRnFKWk0xSjIwTTJLcTNOeFpCa1RnUkF3amE0ajlkOGp5?=
 =?utf-8?B?bEdUVGFnNjB6RkpQNGo2ZEozZlRWWnpMcXVTdHRPeDBaTGJhai9uemdMa2Jv?=
 =?utf-8?B?YlRHRWZteE9FUGoyOElKV28wWUllRFc2NjlNcWtMV25HbEk0YnZLTnZmdHZR?=
 =?utf-8?B?TDdHVnJQMHJHMDRXMGNFcnlqWXNQaWxJY1lwT2xPb1NVNjE2RW5PTld2UGFu?=
 =?utf-8?B?elhHVFNBSnFYWTBlK2FseUNsZExuNWR0amY5WTB1bXBQbFkxcEZPcnJldW4z?=
 =?utf-8?B?dlRmZjVWYVVHMnNLZXdqaHJVL0Q5MGoxUXg2NjVJS2NNNitSZGlTNDBNWDlz?=
 =?utf-8?B?RUNUQldSaHNnWUplTm1INXFSZW95Rk9Ta3VzSGxxZ1lxNlN3MEUyd3NtSFE0?=
 =?utf-8?B?RHZvNTFJay96UDVVckFOeDR6UXkxQzJhT2RhbVVvSUNPQWJJcEZ2NDg4WkNw?=
 =?utf-8?B?TUI3bHpLQ2ZOaDhvYVNxU0FNMHJvdDNiRXlLMFN1VUJMSXdvMzBHaXFPL0pa?=
 =?utf-8?B?YXowVEw5b2JzYjhJYjY5UGFrNDMzWXAvTmUxQ09DaFdra0RxR3liSDFIV05r?=
 =?utf-8?B?UDQzWFVPRDdYMkYyUXdtdkh1RGw4QXdtUHFoSVNCUlQyM0l4dWF0VFBWOGVO?=
 =?utf-8?B?L3pkY21jOGJFSmdJcmRjZmQ3K3lTVm11bS8vcVprZVh0YUs5VWdxYkJ4QXhB?=
 =?utf-8?B?NU5YODV0TU9NN2NTSDFCeTJzcUI0a2sxSG81cGcveUhic213QTllM0RxQloz?=
 =?utf-8?B?dWZ4Qkd4TEJYVUJwb2duSmNZd2xLVE9rL0xFVGxRTEpFVFNRbi95azNaK1lx?=
 =?utf-8?B?NnQzU3pERlpGSGtINytXeDdvam11WVFTeFpaNms2cE9NeDkvNmc4T3NYWUdL?=
 =?utf-8?B?S3J2cEJnVUlRY0ZabWRwY25CcUJkVytUN3B2SjBaSjZ4dW1uYXB2aUpRRTc2?=
 =?utf-8?B?NHRWYUpiU2NlNVlkK0dNemE0S04zNVVjVjVROFRudDM1b0VyeEZIWnMyalVL?=
 =?utf-8?B?THVGU3dxWmlTYk9SV3B1MnAwMmZJRUJtSmQvNDJoRW9JMUJCVmxrNUEzZzBB?=
 =?utf-8?B?aTNkWUloUjcyWnhSNVFJTnBUQzM1SmZaVzJiR2RQbVNOTVlrNHo3Y1Bkbnp2?=
 =?utf-8?B?UzdNYVgzUGovckk3UlBlTzFPSzVrL3cvRjFrMHk2VUs0aUtoYy9MK3BYeE44?=
 =?utf-8?B?QlRHK1NRWDMrMGNEQUVma2UrbkpMMHJoM1RFQTBRUzFhOGNTUnRGK2xPN0l0?=
 =?utf-8?Q?QMGnXBii5G7itOAyHDBZRCLpa8X4FjNwxKkb+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc5c58c-ef66-42be-3bec-08df287451e7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:20:16.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghiM3d/6h//1/0h+7/2PUrqWX7AWkxG8TJlnmebG9TfSuOXTn2JDae84Klz3yXNfmEf5VGfNNE+gxNnooT06aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9825

On Mon, Oct 12, 2026 at 05:04:35PM +0200, Miguel Ojeda wrote:
> On Tue, Sep 29, 2026 at 7:58 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > +//! NUMA topology utilities.
> > +//!
> > +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
> 
> Cc'ing Yury and Rasmus since it refers to this file.

Thanks, Miguel.
 
> `page_alloc.c` also has the definition of the variable in the
> `MAX_NUMNODES > 1` case, so I guess the MM page alloc folks should
> also be Cc'd -- doing it too here.
> 
> In any case, I am happy to pick this one up if they are OK with it.

Let me walk through the series. If everything is OK, I'll take it
myself.
