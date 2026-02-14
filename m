Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020140.outbound.protection.outlook.com [52.101.195.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796514C97;
	Sat, 14 Feb 2026 00:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027653; cv=fail; b=hFGgHGDSTDAeW6r84XUkzoxqPk01h/GTpJ7UAVuUcFCTuGb7LFtGhtAe/hqhNYPS72WTSMG9LyxfgHU6ZWfyCz+TP5Z5zmD5pimiG7BvysFpkcspjv35ZzQAnP0WVtogTbM25XU1uK5RHEty78dDCkX+RAOkRQ8vwEavWexCfYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027653; c=relaxed/simple;
	bh=LBxYxCPEQWLNcDxttl8ZRx2f/DR6wo++4mmtaVISehs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=AOASaRJ2f/IUlUE5ok41hU9PT1Rdnpczrce5C80Fov7WTbFoFhFRRNyKnOf6/hMQGsobiDlyLPd7t7KsN8VWtQ8GMYQ0LNwrfY0Ihy5JhYKODj1g3vBzqXy0LYrU73XTN5/NHTAqwMTB49hNmF3H8OpLn5ke6f5xq0tZhN7sfo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iUHxO/QB; arc=fail smtp.client-ip=52.101.195.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iUHxO/QB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmj2SbL65mQIbIB8kiVXav+DQ0GJCPBgpy+yh4lQhovKFA82LOaw28H6LkKRPVQgaVSAETCmKWgGJplt16QSzro5YhG1ELCCs44lYk7coMXxiDTNfsrX10+/+zbpsFxf8AH3r/iu+D1f3BN89dcZoIjvqlYpOZZBS/YlfReyzW/D0+MJdzWHVCPtiGCo/Z0vpplmZGaITSh70xj2NdId4ZnO7RKMOiM+20E5dmOOkLAJ5Q5qF153BlQ3yqnHFkAje6tplZ43I8dUVm9lDj2W4Xg2F7GunKpkFYdNBzNM8IVRXGvnOejmqkZ9e5CSs33CG2PisDUAlWEx6rfq64K57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+EaaBe4em+ML2s6CynuxwSevGbFApP3x9FcdvLdru8=;
 b=rbONJC3A6OWEpeWPtHqL6C1fKK+iriVOcTiVdrlydFOnyMTqS1aNDs+3dmuIWoCl/kWyviBqSBLYCGvAp9BLJxPj111WNke0T8R1EK9MNLxs/A/ukKgGnXw2w1DpNDHr8ZM5BINEGBkAWXrNqqFMIRBFUdOrOxLEoyxtinLoP5Hdnft1AUHBpcGbPVwJqzDk8dTvo+emX995OKeuT0RK+9yMIt6NY9Jh+pVcf3i6d3UkzgL1YhTLnGNqGyqqKoJUrA7wwZwznL8JBbXfJnvcEjjkijD8WwIpOmcJCvvZ6ds+LlQ2vPVcfR1IWjJmEGO6gENhG73fc4psKSMzgvCdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+EaaBe4em+ML2s6CynuxwSevGbFApP3x9FcdvLdru8=;
 b=iUHxO/QBZ5D5uSTOVa9ztoeD9QWta+4xU9ZmUXgb1F3nAR7pceprsAFZ2LssAGo9wLn8G4fzDVnxhyXSKfmR91DnypKEmnpLYk4MUvZIpzp5B89opsN2qstPrky0uFbhbhvBgkFdON6Dt6+A0W1dN13KaX1pcV5Um+5mgyAlWnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3083.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 00:07:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 00:07:28 +0000
Date: Sat, 14 Feb 2026 00:07:27 +0000
From: Gary Guo <gary@garyguo.net>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andreas Hindborg
 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <2026021311-shorten-veal-532c@gregkh>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh> <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh> <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
Message-ID: <abbb50aef531e9e72defac8b976c5ccf@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::36) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3083:EE_
X-MS-Office365-Filtering-Correlation-Id: 345d16a7-4f1f-4522-ca8c-08de6b5d0a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+gjZmbuCUQUJkcXhg1p5jorql3NDJS3Fz0cjzCcXdulcIb5Uqowu5l+XFznk?=
 =?us-ascii?Q?0vtqMyFCqVE5SldyLxjNHWPHAWvLoNI82KyFQ0p5MRr+bY+/b+dzSuK48hp6?=
 =?us-ascii?Q?WnfdD/NEbc2A3pvGOFrW2yg7EuUrtbGajGOpVOlMG/8+va1WRPILzT5k/BBm?=
 =?us-ascii?Q?n+sPuE65x+7XzzuhABjvULsWSiu3hQa5KfHvQVEUhFmwnyIisZ4sAJ9AYI09?=
 =?us-ascii?Q?7Z/Yae4wB9o6wlEuw4rFJdZ/QgLF8tx1pKtJ9yCSyCSTm2tSubUN9c5cKQsa?=
 =?us-ascii?Q?ql6P/fkaU23l9k0A0FJE4JrOQxlxqPuCjyqh+MR0OevZgRxJz2dGyrT/uMSC?=
 =?us-ascii?Q?wB5X2Po98iqcNfGSP4E3fubrpc1v1S3sja2nD1rv5XYYSWmtoFlg7zblndUX?=
 =?us-ascii?Q?MjuRyYL15QxG1Y5w0VF13Gz5xjwcIYMBrG0KI7N60RPBfrtSVa2I8c9cXBTB?=
 =?us-ascii?Q?cnmg1Pi2UrU3v+wrcuh1wJJlQKqnYiPxL04gxSYo22agnG6RGuIpkeMth6bb?=
 =?us-ascii?Q?cA2oBFGqRksLwIae78HWfVAVJmsfCLBW8MBKPEdeQPn2cPwURknFTPr5xjBy?=
 =?us-ascii?Q?9CwlefNfLl2Xf3edB9B3l01JcheImwyj7JZx4LYH+5bWsI4a2WdbbevBFLiA?=
 =?us-ascii?Q?WX6qCY0pxWS4fCpaChS5SnB9XD22aijNZo7mPOcaWQ/iCWqNYdujaYixMKFL?=
 =?us-ascii?Q?OZUvJYmR4+dZ+lQTUTE8gfACM4njVSq/VJnqNzVYPNPbESqTvzL9PiQd6X66?=
 =?us-ascii?Q?fCgmYhobQK18D27ObGVIVOMfqGXd4MI2Wh4hCnfTRDy1YZzFRnNRydx9fOQc?=
 =?us-ascii?Q?X2ekmOrPT72Q/EKQBW/D5V5M5h5ebGRDZk+I0c3WfgI+P1Dxjx6G/zmx70LJ?=
 =?us-ascii?Q?k9F9NI5HdAsuqPu7i4J1YGPCgEpnLSlV0+ZO6iMnweZcyuw3rXoMwMfC0bjM?=
 =?us-ascii?Q?151ymy7uqy01ilIgXFSfr51JB3rOSFKIgWB/EHAtoPnP3A+DeoCaHkegYWtV?=
 =?us-ascii?Q?rR3b3EBf1h35wWPjLJQca5CNCdU2wCC8A4f12MbubdRq82uYepDcKevP8E3q?=
 =?us-ascii?Q?z90EYZVPOPVyI2LriAZXgBPLedvqkFEcCxyaGYYbvKeOOQXUuSehUuMBb0m1?=
 =?us-ascii?Q?mo3IMJ1aR9jnEzGlI1rZnKKdOXbyNHhJm7uuCTrJoVRimab8T5vvjrJHB2Hj?=
 =?us-ascii?Q?5Kmh4Jo0oTw9Kvd7AOixRchLWAlJypJqegV/e+Ct4mHXh/dhOXP/RW/P2MwD?=
 =?us-ascii?Q?fulihGXF1bK3Fma23S8yTGNH6IEEEY6/ATUVMsBzjVgywHCtzQi+3FPsTELW?=
 =?us-ascii?Q?s/bRAyur2xt6EaiSqICN/UvcCl/tEAtelM6IyDO2pbAtxgJNkNuP4yHiLXqQ?=
 =?us-ascii?Q?RAHScjCY5Dx6iXFsAlLbri5gVkyCXn1z55ZxMQFu6aO1w/i8w9g9HSyMVrsX?=
 =?us-ascii?Q?kMV/ypI80nHaHzslWnB1/DMRFpU0OtGHI43VgOhdxrT4p+sNqlHVHtzzHE5G?=
 =?us-ascii?Q?sO97YiiXJVeBCXvVco5FniMInNMBRcR8KMn/sXXrra3xgj7nUQ1QxwGpS/Mf?=
 =?us-ascii?Q?Yojskm05GwIjvO2GIcQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KWvW2XV+XJtz2VlFuDgzo/VYurnlLCy1OhoOHGpXD8M2xut+1cLWZ4FD6cPx?=
 =?us-ascii?Q?f5PljZavIW9g3w6AZbHqTXYejRZrA/Sq5qExdY0HDGGHqcFlM7fESSJ/Eeht?=
 =?us-ascii?Q?jFtmxTRYgmiSa5RgN2sWy+aa7tKA59ZjwTdtecW+0EI5adbTINmVKgegpw//?=
 =?us-ascii?Q?d6I7j959ohRQxNjQ5UeZTOvMaKKLhtQU5qr0lNDCThGE8B5QADLWdcg5JI0X?=
 =?us-ascii?Q?vil18AVu7jWMPZwxWbiYf8o/W8RCz5abfLXVYNDGdW8UA8o90Lqz7xa25DAg?=
 =?us-ascii?Q?7mQmEKDuRT9C0VIszoqId2Vb/HYvRQFusUhZoWPdGcmpYRMBLBmMRiYFenEU?=
 =?us-ascii?Q?+bg1or6ID7TKTMs3GsvAJM7KgS1SQ7ybQX8RfTDz7s5aPhODOJeEeMf9CdX1?=
 =?us-ascii?Q?c8U+AghU5HuXsx5fUcOvgVh8uTk5lkX6sRjJHK+uZJDHcjqD8qdaAFnT+oNg?=
 =?us-ascii?Q?tVkEC1fq2q1Hg44F5XrsuYad+deXwwBoA2HU7MyOSbFJpDn5PvmfvQMRIVLK?=
 =?us-ascii?Q?hQwbdWwW3HkOIHPaWR5a2UWVgDqm6ZX1kncyc/8zRNAV4azHztnHcVlSf6P/?=
 =?us-ascii?Q?PICdgbB6EZQg0+FqXKwZl/SiX5VPUhU7tasOlU8OAcodSW6wTuppF9nUaPVO?=
 =?us-ascii?Q?140rteO+rXOV0nTwCKphtHouMG/7gAaVYfSUJ+ffZf3Pz4AaHpKmRHX52KZl?=
 =?us-ascii?Q?qeCsKf7uswmBUw05dB4Sjx2ggy4PpfxXXfmrg3oZkDltZ7e6eKXBRZMC4cC2?=
 =?us-ascii?Q?hKzZWxvhtKCV0uE2u6aj+PUK7OlbUEBgnqp5LdQe887Ec3TG8AdELpi4JXU+?=
 =?us-ascii?Q?bdd9XYG7biCjSaLE9pUqaYhlP9SVpesqBzaWDS2lD/iam4b+7keQ9tp9kOpI?=
 =?us-ascii?Q?rMvGDDxCHl0Y6+CiGPCPSXNNA5CTSxLdPGCZqhu+3i4qk6r/fhX08QJ65UQ4?=
 =?us-ascii?Q?Q7GY+kAEPIRxbNETp23KDb42KvRE3T9e2gCO4U7qVJmhs0bIaqBlejFpsXrq?=
 =?us-ascii?Q?7SfVkuAxa7JLnyUaXKnlawBGAKOgmlNsYsWtCBTqee1uJ0HtGYasE4R05y7T?=
 =?us-ascii?Q?qAlJOPuij0FFZxrJbFofdDda1ivLPV5OkYKf7qWZQE9bcYz0ROqeFjrmrjAA?=
 =?us-ascii?Q?tiVs6qG312UNCjEYNX3gPVocsddqOXX+W0o+gPzwDJfa/xZvhB1mLe1pAUa8?=
 =?us-ascii?Q?mCSTbS7eC5ix1namBo/tMHC9NSdyjBeSPQcnh6ODLOT1bHKxSstyRNRsUm9m?=
 =?us-ascii?Q?rY9N15FFbDw9vwAbo8Q2Ha1XxR8n4tezglFrtRfhQzU4ys9SfNfaCKooed83?=
 =?us-ascii?Q?O6SYeL2g05YuNDtbuPbRLPg22y/2B/U37W5oRUWfr9xxbKWMtWpRW4SjTY38?=
 =?us-ascii?Q?1vAC6UFM9d+n336Et5PDHAuMYwDNrjAvX413gB1UAz8HDFYiaYDFI1Yy+mD9?=
 =?us-ascii?Q?o2VCsQzLLWDtlQyqN/5suC0fOKG+KVZXM/q31eUJwCpWUh4Vq9ID8Ll413Sv?=
 =?us-ascii?Q?L8MU1wwqSdNpUV8Ik7mi6rdGCT3V4DJKV4GJEQOV2H4ldiUaF7Jl4ksE9Z60?=
 =?us-ascii?Q?25Sb6L/PNvzKvU8fJHtfzP0n6dywT0K//8UO2m2z1y23b595s+P9SPXViBIq?=
 =?us-ascii?Q?iXuWYG4+syZvUIWR7DVz1IptaUXSG2gQ9kHZlWXJsVViOY9U64dMGB3XFYXn?=
 =?us-ascii?Q?B5qeGUe/fkZDZzZEOLAkMOPqis++o0lqkkBA1+wQ4ge8uec79GOvcArMy84K?=
 =?us-ascii?Q?omQi5iycww=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 345d16a7-4f1f-4522-ca8c-08de6b5d0a40
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 00:07:28.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRjD2pdzKxdG+VH2Voj7BumIatcixzt5E/3A7nQaiOTddoRlfV/tSI7gasynWKMR6JoK0xa+D593kIl18y0rYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3083

On 2026-02-13 15:34, Greg KH wrote:
> On Fri, Feb 13, 2026 at 03:26:08PM +0100, Peter Zijlstra wrote:
>> On Fri, Feb 13, 2026 at 03:13:01PM +0100, Andreas Hindborg wrote:
>> 
>> > C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
>> > driver [2].
>> 
>> Right. And that is *fine*.
>> 
>> > Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
>> > informed these are not safe to use if source or destination may incur
>> > data races, and that we need an operation that is volatile or byte-wise
>> > atomic [3].
>> 
>> Safe how? It should just copy N bytes. Whatever it thinks those bytes
>> are.
>> 
>> Nothing can guard against concurrent modification. If there is, you get
>> to keep the pieces. Pretending anything else is delusional.
>> 
>> Suppose the memory was 'AAAA' and while you're reading it, it is written
>> to be 'BBBB'. The resulting copy can be any combination of
>> '[AB][AB][AB][AB]'. Not one of them is better than the other.
>> 
>> No byte wise volatile barrier using nonsense is going to make this any
>> better.
>> 
> 
> I'm with Peter, just call memcpy() like the C code does, and you will be
> "fine" (with a note that "fine" better include checking the data really
> is what you think it is if you are going to do anything based on it and
> not just pass it off to the hardware.)

As Boqun already pointed out in other thread, this *is* the direction that we're
heading for. We're not going to add a new implementation, just to add an API
with documented semantics which is distinct from existing Rsut
"copy_nonoverlapping", which in many cases is lowered to memcpy, but does not
have the correct semantics, as it is a compiler builtin, so compiler can
optimize on it and understand it as non-atomic non-volatile operation.

BTW, note that calling "memcpy" from C side doesn't actually have the right
semantics, as C, unlike Rust where compiler builtins are explicit, recognize
them by function names. So if you write "memcpy" without adding `-fno-builtin`
(or `-fno-builtin-memcpy`) flag, it *is* recognized by compiler as a normal,
non-atomic and non-volatile memcpy. The compiler is free to turn it to something
that is not an actual function call to "memcpy". It happens that when doing BIO
and copying a page, this is large enough that compilers always defer to actual
"memcpy" implementation, but this is another case that "it works in practice".

Best,
Gary

> 
> thanks,
> 
> greg k-h
