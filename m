Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB62BEC2E;
	Wed, 28 Jan 2026 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623979; cv=fail; b=e2re+MRaWTgDR0/yVkFK9ubpeq5Eo47l0NWVeWomn1y0wP2DKufYXoBKKJX0KOw9gF+In79nAa5rW++RCV3LlU2QLe6HuB2e+6HdWMrTt2SUjZNKiuEH5yfL6umHdvaPxES1xN7uHUZfZMUyKJ6G4ajytSkcGL88FT/2IRczNN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623979; c=relaxed/simple;
	bh=+mqscGxU6gagv1yoOD7FFGWnB5H6DLDNf8Nj2AMHjgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Js3YS8BeqhNF17JStNwGnLR7JU5Y3FJ99OD+wuX1umZbFX5c+WkcHt2DWo+n7pUZBbgzcmfcp6txRSCd/uBbfWYTc6+rQr86n7OfYVVI8mN/Rwop8eLKzimqtmDKKpPJT2WyeKTO7bogYtQlk3M/vTjkc4Yo0k0YwpGg20e75Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N+w4zxge; arc=fail smtp.client-ip=52.101.61.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N+w4zxge"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9NL1yEEmYcmRrikaBo/GY3M/pPwYQVUPCfvH43fnsKZ40ZILg8MSpZsPth6fePqFmxb6rE+yE7p54bTYhIm+0MrHL927EAS3DDGigikZ/13hs+x5vasarFZPQSs4/ceTvvLNwZoVg+S/NE7yw7RDj/AxgHNP698oy7Tc0HLOtkwiGXBQII5H14K23KP2py4/gDFCZGG3JjA4kRAQgsHJ4ydpIJvGlqsj0YSXF36LvAZpokxh6EpOu8sPtMFH5KJ8wVAiEZcYsD/7wWaRNFTGqc48Wpdd0ugImUMRg9oeOrZ7zEQWYD9WwDEcIKevCrhNEq/UPt2m/fO+2miSIRePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKIe7Dnolbu+FVJCclqrbK4mAVT2r0viCKW107GNzj0=;
 b=UCVZ0aTJmJbHwQWMnammhibPL+oKh5XjlvkqOcS5XQUVOCfj6ycK2pcro62AgD/baI7F61ZTeEoBeyJUc6KnxIF2CIDIHEl66uEuonJsV/luKwfHqvinETd01ZBEx9IyVwMT8/+f19l1IBgY985WOwCNKgIm4VrwQfF9Xvts3ptvxtNN1E+j481XaS/+VTcDBdCXq/8xQ3XEU8zzxZb59zBOQD9uHBVvorQa3GdqrE154XpIo/fKLQWSDHVG4XrDttwiSfq/nIlyJYEoq5+dYeNXm4jg5V2k//ZRz3c+XAIG3Qh2XPXtUA5ZCtCZmrQr/2d2S46oDB8XlJTVlwp57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKIe7Dnolbu+FVJCclqrbK4mAVT2r0viCKW107GNzj0=;
 b=N+w4zxgezqvWJdn+foER+3AlawJpMV5ToQdVyv3wl4M+bNmsb6Khcc8NI+f4vISOgPoMVNr/9vGYIk9eyiTktDPozP75D0NismeHe/SwXFZZNONAoUFBhCh7OMrHUzmEe3twIZESIC5xubulBKQT+e1anQQAw+e0O23FTFJqqchPlUBeD8C5qh9yxnbhHtKSG2wKaFHrnhRBY+ChLuiajDGPm1uXhvV7OqcqOIO+1KBRq9AdIoFCnXePz5HmkMwygVqGyjGc5IGMqUUWSSlmyvAlIInzgUjgRtep7yv/oTeL1+aLDB9UajqCgV6ts7/N/1FNqOM+MHmI3HNaL17KIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 18:12:53 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 18:12:53 +0000
Date: Wed, 28 Jan 2026 13:12:50 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
Message-ID: <aXpRor7ULMnYG_p_@yury>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <DFZGOCV6VP2N.28M0CWIONBGMW@garyguo.net>
 <DFZTVMUBOHH2.39WYY2O0F48NH@nvidia.com>
 <aXmRqzkKq0bAQaV4@yury>
 <DG0A0CPEYCIR.1ZMN457FUXZXM@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG0A0CPEYCIR.1ZMN457FUXZXM@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0865.namprd03.prod.outlook.com
 (2603:10b6:408:13d::30) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e461080-f0dc-45de-04f4-08de5e98dab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zYds+hiaTkiz79H4nAbRTUPoZhMsfTpsJQXZ1Qv0ec+GJ/RJxUjqhUTed0em?=
 =?us-ascii?Q?5PZdt8RvrSdtNKWGGfzNRJElQdm6S5HL95xWP2qF0Qw5nNBRJO3g117Q9L5Q?=
 =?us-ascii?Q?6CEf6sA9wXetdNdbMyOz1Wra+7QItfGBCyZ5yMi02LYE/7eUQVxJfvO5JQ7K?=
 =?us-ascii?Q?AaQh2DnyZH35UrfrP99x5qSOhGqdInYUkTg4qm1//Zvsd7hSiiCJEV0sQRoM?=
 =?us-ascii?Q?i73bc/ebBXVW2tjYXhLGWqKMCGgyJDlyxyvXrtmIPFIn/SRf4oXLUfuhm1aG?=
 =?us-ascii?Q?z34s/JJRKbP+sV0xQIpWScztVGE+pmBA3WXrKSzrNE4vhAjipWcD6UP1gmz0?=
 =?us-ascii?Q?5NG6D6MosTLvlKbGoCVGf19YZ7YypyRlYI+MzcxJWNyhhkCdCy0MQSy0rpDE?=
 =?us-ascii?Q?KTRGjGfAqIPnUNkKeS0WfFDu4BorerFK9SDFfOvVJDg/zdm0qweu4SPthw0b?=
 =?us-ascii?Q?p+sU4kPwgyPhEvb5AoENaEYx86xdbQXb8FLGwSGKREklPT9tzn5okFlPKZu4?=
 =?us-ascii?Q?t3hEonKf9uIj3XHsrHyvGG4HlzR4BERU05w5fBRSKsf8w+mj6irUVtwPwUpi?=
 =?us-ascii?Q?rR64wJ3SXb3hb8A/EuSmj64wZtnc8tNxmW3ZLLL+oUDQmTwptsjKWYZTtz+E?=
 =?us-ascii?Q?UwYwH+vWd9o0m5Cnu20RfyrmfGSQ8idjxU47EczJL/yy+98Sm8sYnrQ5/yTC?=
 =?us-ascii?Q?AssNxwgssGDBqj5ZGzu2yeZI6dmxSbiqw+ko+VftbzGXT0c88qZu23iZeKG7?=
 =?us-ascii?Q?YwZYZxLMdyGe72iFrewyIDxVp9bt61YAE1tib7/RzPzXvAnEo6FeFwF7/EJ7?=
 =?us-ascii?Q?+DvPsGkHsHeCEBnTEBv6BT5l0un/lX0bh5BeyO6Hxisn8dPsmgZUBKKPEprt?=
 =?us-ascii?Q?iDo8W4SprtpRGI+Tk6q7ueL/uVba7rsWr+MsfKI4FqP6vNY8y4BsEv21B5RG?=
 =?us-ascii?Q?forkOzMoiCWEpaejFCxkxjXea8/eqO+HoS2G7ZI0GKAejj8+RIcyzS6xZJlr?=
 =?us-ascii?Q?K2TGhROXfze+l1t5U3HKMeIjIbUG2M1ontCh7jZHY0DttPQySiBwDVDezhVH?=
 =?us-ascii?Q?uLgoRo8n/gXWBzy4NvUnbxyVtAav3GBLeTQmHI7jbxRh+Z3ZCkEDtyFCpnYI?=
 =?us-ascii?Q?qSsnyfzkw41cMvp+i3pJCAIynESEJfNfi0ssX5kXWRvBPOInOmIw1/jeUT+1?=
 =?us-ascii?Q?n1tQwa/CB65bquwtlrv6PwJ4zilrXjHyAU/VsV479G39uedkC6hmG7LJFPvS?=
 =?us-ascii?Q?52VIq+muUJR3iJR18ksfvoIKxueMbjJGZEJYSWnUDXPZ7wYT2c22O+5QdAXJ?=
 =?us-ascii?Q?ZekAnWC7Flob37IaXjP0wwEDFy1kQq3y0xtn1BRAMucA1rAYnYN8ry0x61FG?=
 =?us-ascii?Q?DJGgY/Oxb3tNThE70OSbjc7trCQ/mB6Nc6JnywWiom9tUVzV1pUYBNB9O147?=
 =?us-ascii?Q?vEmQU5ptSqGg9h/TTZB/EJ4NLOhN8NTLaLavUlpzTM3WDRownWJ6tm3mubLP?=
 =?us-ascii?Q?cXu42ZdCs7FPog6KWGRZt8u0IcCehsxQAtcvNpYDi52fcPq2+Fn8+T+O/ipb?=
 =?us-ascii?Q?8yZBHVPdCUo8wOJGXmA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gCWK+CB5eySK+7JDyjxJGVY4KCLLLHoke/0IXycG94ZVRxa2de9NaPg62XsR?=
 =?us-ascii?Q?Ha2kWhFlJVBWmYoHAXNEbpzBCuVE1Cj41ZAevrKh6mjU+wN9H8VuD9iavkD/?=
 =?us-ascii?Q?XKjmk5VgKMsMN6SEaufownURdkfq097ey8keH3vZyUM6kHM3Xvm2j7+Hmaiy?=
 =?us-ascii?Q?NOjjlXK7fOrbvhHuE8ptMHDPmy4heK08hC0CMCOCdD6RwE6HW2fl5J3UHcqP?=
 =?us-ascii?Q?ZYsqkR2DjddOb6IqNhIGPnSoYYqmnJESpFMKzo+ZOiM0HLVMRpdaWqtKWYc0?=
 =?us-ascii?Q?kBrlXYUCso2tGfJwHLVSD1s/Yj0dGsB3mpDunGZx3JzY26HbSC/oC/VydNEr?=
 =?us-ascii?Q?0gM527R6QVi4X/TxAMZ6IIQ3hoVJ8rwdqEOAJx34tRjnjzA2eU6QclOMCZI3?=
 =?us-ascii?Q?gUYRS5dwcwIp1Bb9rXz969WKOeT+YedO1pqYRmRsWz3IuspnoyheV+WrFLnT?=
 =?us-ascii?Q?sNQXCM0jYoq7HhvsH4IpnZoiBPs+/hDu3+XaiZjlHKJRI2O6Xe/9v3UJwgQc?=
 =?us-ascii?Q?jNh7alhLtIaB3iBxk064zPPrIRh0F2c0gVzU4oT8E78XtmildONy3BQy7Fy6?=
 =?us-ascii?Q?jm6+hbkz85I4qgJNxS2KJaCRYexWVnTBS+NxlDIf4FXXnwOP0OgF/8aqJ+pc?=
 =?us-ascii?Q?rFU0o0K4RaQM604iD9A160jJ6ZvvVSINr39kqU9a/b1QcfXDrgaqeBwElw+F?=
 =?us-ascii?Q?aZakVQfIA9ornX55bG9CgKY0JqxefymUw0wwDipcM+ZvLFUovVR+VgmvE+sP?=
 =?us-ascii?Q?VS8I+ZX/aleqkzEWZ0lCgc0002HYft1GDtJfwORQENQ7+a9TOHd1v3t5++Tr?=
 =?us-ascii?Q?NmDNHY0iAGb3OQpIMTf6dVzBgWrQrSKZNht+f1tvj8eq0U5EbpR1YQ/Dk2Pg?=
 =?us-ascii?Q?jLwduS45RITBBYsyV/kogjnbUhAlP2U0JL36ANIb53OEYCu1DN53z866KjGn?=
 =?us-ascii?Q?pRquSEp6d5QqMHW/ttgn6Bmn92D5K4M65d0wB24GKFy/2ASyyz5xK1peYkLu?=
 =?us-ascii?Q?XwYwQQp/wQCPOCSoqDMvMQiXU3tuNVx5GG2s22kS12uYleuKFip2FfAJgBSR?=
 =?us-ascii?Q?PXoQfwuZw9/nd00ud2QVE8Rk+Yftb9pjpNtjI/A/HZX8LcjL/T3K2gGcg/mz?=
 =?us-ascii?Q?d7Au4fEEjKVxYQb/Qp4bp4TOHSCwfa6H2yEiiD+PnJi6JC/oB3zZqCXJo64G?=
 =?us-ascii?Q?o6s5v2v6Bgyaolbi5HCP5VjMCS2x/+yWx/uLD3P7yyLTgwNn7ZZQVeQhTI5f?=
 =?us-ascii?Q?sLDsXqCTFFGzHYzPoh7j6ctyusSDFkhWqPiao5dgDQ8TMFjsSOnguZ7fp9eY?=
 =?us-ascii?Q?BSZhwe1JuHyoDpXSuuwXKl1gni7QtiHYaQjJUohBxzJLho5//QETuffodave?=
 =?us-ascii?Q?gCvI3mjmeOBraCtIC77CNYotR2ANEZ/l7C6aVkY7Vq7XkKHkFxKCRZNBkVw6?=
 =?us-ascii?Q?JXx0ahHQPnxNqOm7cmPjhiwXeYbNdE+8wi05lOdXA3FhHu0J5QqxLhLK4VB9?=
 =?us-ascii?Q?eYnxaM6hUAlnDZT9Vk5W2md2xfL59desVfrNtuKSUkjpy58sqKSUkf7nyrcI?=
 =?us-ascii?Q?7qjUHdpUcN3+a44Ye5sPvzJJuWXdI+Xg12Bm1iXfNMoSqsDATQcinIste1S4?=
 =?us-ascii?Q?oP+PgnwVIEF+fH44zyz+0PE8G+aSnJFAUAZolrNWXIEebtYjW3lnJ2Vdu3BV?=
 =?us-ascii?Q?gSS4EMxFYcV+QsTSSYb8Zn2Dx5wRPepQb+c3QQM4BHrQAnibNc15L/CMhQHh?=
 =?us-ascii?Q?64Q+1LiJ4T6057y+msT6mli11BovuVKsjT6IXI2bN1hI5MrDnZ2J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e461080-f0dc-45de-04f4-08de5e98dab8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:12:53.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BxihMTBnR3MW3/Nj/DTnzWU3QhGNT3e5xeJ4G4UmHUFlDRQKr3wt0IdLwmvNI7Bmy2OMFq8Z38NgWcY5DA/fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604

On Wed, Jan 28, 2026 at 11:02:03PM +0900, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 1:33 PM JST, Yury Norov wrote:
> > On Wed, Jan 28, 2026 at 10:23:36AM +0900, Alexandre Courbot wrote:
> >> tatus: O
> >> Content-Length: 4095
> >> Lines: 108
> >> 
> >> On Wed Jan 28, 2026 at 12:02 AM JST, Gary Guo wrote:
> >> > On Tue Jan 27, 2026 at 3:25 AM GMT, Joel Fernandes wrote:
> >> >> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
> >> >>> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
> >> >>> > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> >> >>> > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> >> >>> > > > Add a macro for defining bitfield structs with bounds-checked accessors.
> >> >>> > > >
> >> >>> > > > Each field is represented as a `Bounded` of the appropriate bit width,
> >> >>> > > > ensuring field values are never silently truncated.
> >> >>> > > >
> >> >>> > > > Fields can optionally be converted to/from custom types, either fallibly
> >> >>> > > > or infallibly.
> >> >>> > > >
> >> >>> > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> >>> > > > ---
> >> >>> > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
> >> >>> > > > rust/kernel/lib.rs      |   1 +
> >> >>> > > > 2 files changed, 504 insertions(+)
> >> >> [...]
> >> >>> > > > +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> >> >>> > > > +/// let color = Rgb::default()
> >> >>> > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> >> >>> > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> >> >>> > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
> >> >>> > >
> >> >>> > > Is there a way to just say:
> >> >>> > >
> >> >>> > >    let color = Rgb::default().
> >> >>> > >            .set_red(0x10)
> >> >>> > >            .set_green(0x1f)
> >> >>> > >            .set_blue(0x18)
> >> >>> > >
> >> >>> > > I think it should be the default style. Later in the patch you say:
> >> >>> > >
> >> >>> > >    Each field is internally represented as a [`Bounded`]
> >> >>> > >
> >> >>> > > So, let's keep implementation decoupled from an interface?
> >> >>> >
> >> >>> > That is unfortunately not feasible, but the syntax above should seldomly
> >> >>> > be used outside of examples.
> >> >>>
> >> >>> The above short syntax is definitely more desired over that wordy and
> >> >>> non-trivial version that exposes implementation internals.
> >> >>>
> >> >>> A regular user doesn't care of the exact mechanism that protects the
> >> >>> bitfields. He wants to just assign numbers to the fields, and let
> >> >>> your machinery to take care of the integrity.
> >> >>>
> >> >>> Can you please explain in details why that's not feasible, please
> >> >>> do it in commit message. If it's an implementation constraint,
> >> >>> please consider to re-implement.
> >> >>
> >> >> If the issue is the excessive turbofish syntax, how about a macro? For
> >> >> example:
> >> >>
> >> >>     let color = Rgb::default()
> >> >>         .set_red(bounded!(u16, 0x10))
> >> >>         .set_green(bounded!(u16, 0x1f))
> >> >>         .set_blue(bounded!(u16, 0x18));
> >> >>
> >> >> This hides the turbofish and Bounded internals while still providing
> >> >> compile-time bounds checking.
> >> >
> >> > I think this could be the way forward, if we also get type inference working
> >> > properly.
> >> >
> >> >     Rgb::default()
> >> >         .set_read(bounded!(0x10))
> >> >         .set_green(bounded!(0x1f))
> >> >         .set_blue(bounded!(0x18))
> >> >
> >> > is roughly the limit that I find acceptable (`Bounded::<u16, _>::new::<0x10>()`
> >> > is something way too verbose so I find it unacceptable).
> >
> > I agree, this version is on the edge. It probably may be acceptable
> > because it highlights that the numbers passed in setters are some
> > special numbers. But yeah, it's a weak excuse.
> >
> > If it was C, it could be just as simple as 
> >
> >         #define set_red(v) __set_red(bounded(v))
> >
> > So...
> >
> > I'm not a rust professional, but I've been told many times that macro
> > rules in rust are so powerful that they can do any magic, even mimic
> > another languages.
> >
> > For fun, I asked AI to draw an example where rust structure is
> > initialized just like normal python does, and that's what I've got:
> >
> >   struct Foo {
> >       bar: i32,
> >       baz: String,
> >   }
> >   
> >   // Your specific constructor logic
> >   fn construct_bar(v: i32) -> i32 { v * 2 }
> >   fn construct_baz(v: i32) -> String { v.to_string() }
> >   
> >   // Helper macro to select the right function for a single field
> >   macro_rules! get_ctor {
> >       (bar, $val:expr) => { construct_bar($val) };
> >       (baz, $val:expr) => { construct_baz($val) };
> >   }
> >   
> >   macro_rules! python_init {
> >       ($t:ident { $($field:ident = $val:expr),* $(,)? }) => {
> >           $t {
> >               // For each field, we call the dispatcher separately
> >               $($field: get_ctor!($field, $val)),*
> >           }
> >       };
> >   }
> >   
> >   fn main() {
> >       let foo = python_init!(Foo { bar = 10, baz = 500 });
> >   
> >       println!("bar: {}", foo.bar); // Output: 20
> >       println!("baz: {}", foo.baz); // Output: "500"
> >   }
> >
> > Indeed it's possible!
> 
> Oh yeah you can do all sorts of crazy sh** with Rust macros. :)
> 
> >
> > Again, I'm not a rust professional and I can't evaluate quality of the
> > AI-generated code, neither I can ensure there's no nasty pitfalls.
> >
> > But as a user, I can say that 
> >         
> >         let rgb = bitfield!(Rgb { red: 0x10, green: 0x1f, blue: 0x18 })
> >
> > would be way more readable than this beast:
> >
> >    let color = Rgb::default()
> >        .set_red(Bounded::<u16, _>::new::<0x10>())
> >        .set_green(Bounded::<u16, _>::new::<0x1f>())
> >        .set_blue(Bounded::<u16, _>::new::<0x18>());
> 
> Without having tested the idea, a macro wrapping the whole bitfield (and
> not just trying to create a bounded) looks doable. Of course, it would
> have to rely on some underlying mechanism to set the fields, which could
> be the abomination above, or something a bit more convenient.

As soon as it's not exposed, it's fine.
 
> It looks like we are converging towards introducing the
> `with_const_field` setter for now with registers ; when we extract the
> `bitfield!` I think I would like to entertain the introduction of a
> macro close to what you suggested above.

Good. Happy you find it useful.

Thanks,
Yury
