Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A03E7156;
	Mon, 16 Mar 2026 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687260; cv=fail; b=aKDYAzKwkB+Id84t0xo5Z3I3bHbcA7ZdQYBjZD+mXiL6KEbPbh9y5O3mQa7g1o/aaD9l/pas4f3uBpb5PLIPdyjuBSZAkmDNnf+9eBpA6iAHTjOPQGqD+ADDAyZ8m1mzA5uaJs/s8bIabynws0Rh2T1nnzKBZtfoivsqwCCHl/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687260; c=relaxed/simple;
	bh=jfMhDXeIlSwX6H3wL1WmpbO+OQjn5aTipsQu0jZ9WUA=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QcaZaA/aP2GkXB0rnC8be1gL7JwR/ocnjpxFjuxvgEHIP5b8iFvJVBbwXsMq4AOGkoHZ9OgDwJX0iCFjrrnp2WAi2Bf++3IEhA+gHbteAxqsTDbdbYgxv9wMvHZgTI6KAj2pw+V27iGbB1lrVPAPol62FF7GKV2P9BbUG63OoUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pvIJ6kf6; arc=fail smtp.client-ip=40.93.196.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pvIJ6kf6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLh25/gscaarzPJowp+1+sTRjROTFB3k1FJPv7/5z0wUIm9bpju6Eq9wMVEgieN/+vf4Qg3Kun42bLIh+pXJOmjWDdhHL1lysvzhQ/x1uHrvtN5l/QRYL+7gJd/NzM+Or85vcb0aUD9P4Uu1lqCayH6GBsasNsHw7ms4Yj86AEapXbfwjrC9Y+PFOHAU06AzhcY6ODJFl6hvXnfVo4IpI+8KJiMDh53TU3ylZHkiFGiBRedEDXik2P2rh9Kqpbyu0IdPu0/AogEUHg3ZoCSCjpV8xcVdJz7Qm17st3/iTEp5rQy2duNBJG2Nw8ktKIhdkx8/ARbqWlcn/QRID5Lw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Vg8FHY15kKdcBS/3vs/jh1SeqJfLlz6wmIh9J22N0=;
 b=TAqE04hdD6DkZtFn6PLsmIv3u6OOo8NfuGW+WsQ+qUIQNcV+0u0NosYFpvmH3EKwFmUb2U6H19lMruRVIvuT8vJ5jvIlxvnjqssdUtZAxRECiSERfaannd5MOp5xbf6ewUBSZqwvK1ZgQfvi52Otkn50+UNQ+4VjU95bZHbvlVcgOrEndcUcHvlzGUmhUwqbxYfurf/CxXETofHBGYPQFEL5Fbq7ZzGDy19dlTaEQdlgJGSH7kNiZqPnzkySyYW4mOMUXcYeGNd5SUZQ5vzT69io3sDP41OAxvyufvTpfntmOjfeRSjuig86QxdByMOPr0gBW263LprCaqq6ctlMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/Vg8FHY15kKdcBS/3vs/jh1SeqJfLlz6wmIh9J22N0=;
 b=pvIJ6kf6AGxiaZ/4HGxiMhChUgWIfYEvLzuBP1HX91+3DYCTWgkVNdyCOM02/n6/hXxYoGWxg/n9jsnGiSE3TLfJkyctvCJ+eFA7U8M+QsRBDZuuevWb/opH9nXO3JanH1pzCtRUOyp5v3CwuqGf65LUfOlA0cWNUNDOlCbhGdLgJXttQNQOPUYh8Iwam9kQp6UyXj+CM+l/EZr/jNqoeBYs4fRjqQIzWb7CVvuOwjMoY9YV0jhehFIQAzPyEaZwnsat0xGiJKKRKi5eDY60HCUroOjRKLvjukZELd9F8l7Z1glAOpID2rtyE1qTNvp5kN2DMTbTzJnNWpz7qsbZ8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 18:54:14 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 18:54:14 +0000
Message-ID: <9a70c268-23d7-4cf3-a88a-d6a7aa1489fc@nvidia.com>
Date: Mon, 16 Mar 2026 14:54:12 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list
 interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0271.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc6496b-a33a-4fb1-06a5-08de838d6abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IajmY2xUS6ka6EEzPShb04Qzk/QNdC5bFQkOJHQd/+11BUkR6tPn1nJqfR6BVb2OcrPejozA9+h09t1DIChU7H7WqR8c5lS/VoMoxQnrutqZ6La8DCoS5COR15/ipjUcLwO4rxxQfVfmw7oKxcDbL4ObO9E6HvAXnpHnuwJm2PaWgg2YQTlbF+2SouySt0mbX7zUlkWerM76b7yHY99GJyi1IWawl0ccKv+5FNxnhpwHaV+quL2sVg5cdThc5bciR80bnP+WSbzMpOXz0PiVUOdsRw38ga/nhTXbsglk3zTB9ewEIAlLy61OUs3ea3GSRylx5QOObvrrh8bcpu0j1sF85S4upVIsJI+ciEjz2xPx+TCIXh85Tt+i61ing8tCbJL74YlQz6JtqwpKtojuEVBD46Qng/A4yJG3k3XBOBTt0/9SfatKFtQwtz862VZYgGSTodwPobyz0QBbj08PoQ3BjF2WppuIavWiIXJttYGODOUokgy4gAlqI0KPPmYxVrJ8n+1sZjwXVkkNBJ+VUCMztmBKjwTYMRfnQ/tH7rnrvzRGWBMvXzT+i593F3OQB/mf8UT2iTWwMxkq9dif6Zzw1ZTZJcaYtopFiKyl3tBxB/QUTrpuaGeS6hvnt6t+DMkfgV5X7XP6EPb/L9b1agukNtm72pLTR3yPGzqSDkKEdD23s2DsZVGhU+Ov0qD/cWt5wICKhGlQ+IEpL66q9EpACEtUKCrYNdzxyN1anI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUE3ZzBvVnlGZi90RElrYTlLbGZ2bkoyRkRXK294VjRJWGRmVmo5N3kyTDYv?=
 =?utf-8?B?UGFlbS9YRUpTZ3Voak4yWHkvaEUzT0RqaUVqQkhnb1VMK3M5OFdXN2FLSHhR?=
 =?utf-8?B?V2oxSm52bXozb3NPVXRFSDVSNUQzR3hKS1V5YSszdjdmM2M3dmJXZlFJa2cy?=
 =?utf-8?B?NWVrblJyUGMybmZlTFRjUTEydkJ3YXM5ZVBYbUFvbUh5VTNSY05aNmFndUp2?=
 =?utf-8?B?STBPZ255Nkp5cHlETGRmZVpyOXYrNkFoMS9OY2ltcUg0UWJUekIvd2ZjZ28y?=
 =?utf-8?B?Y3VtSUFpM2hlSHJzZjlsczhQV1F4bGZXUE5IOHFLc2pGUnBlc1Y0bUVCY3d3?=
 =?utf-8?B?NURXR3lGc1ZYc1kvVDA2RFh6Q3NSMk9hT2xUeFd3di9OZ0ZBeEFPVmd2U1Nr?=
 =?utf-8?B?K2xYL3JzRlRxOHkrNWVvMERnZ1VuTUxrT21EdnZqQktaNWhNRGFGZDNKOTRS?=
 =?utf-8?B?bURpWGdLZXVscTRmdmYwUURZdHBlMHpyZVZBazRlRUFiQnExWlZ5RXhzMFBp?=
 =?utf-8?B?bmdIaFZyTk5ITklISXRyOE9EQUZhSW90a1BiYmw0S0xJU1UxRlZUckk4a0xF?=
 =?utf-8?B?Wi9rMDhWNU5leDJPOEZoZmcxNjBsWXVwSGVOc0kxOEd3Q0NldGdzL3JyTm9M?=
 =?utf-8?B?SC91UGx4a1hJQUx0NmFqZXpzSUtySFlGSG5SRFR0dG1NS1M3enIyR0FEayt4?=
 =?utf-8?B?clRMNU8yNXlZZCt4V1pYekIvMStyczIyMEhzUmN6R1Vuc3c2emJNN3RXQXVt?=
 =?utf-8?B?RGJLRFJST2FORndvL1ljcDVrYXlicklhWE9yUUtVd1BiNVlrOFF5eUtZeFRT?=
 =?utf-8?B?MGFzQmlqYkV3QlFRZ1h2RWloNWxlVWJXNmIrbWdyamI2NCsxL2hGNjh2V28r?=
 =?utf-8?B?NlZwaGdlSWZOKzZ1MHNLOFJzQkNaei82YlBSUTZ3OWZCUHk2NTN3akxnSzZC?=
 =?utf-8?B?SjMzRGV3VzloMVZhTzR1eDdzY1dWbkxPZmVQSzRxKzhoUk1GNXdMbTA1THlT?=
 =?utf-8?B?Z2I2ZDIzZUVEVlJsR1pDdDc1Wk1JbThmYURpSHkwS0MyT3UrQ2hkTjFrWjlG?=
 =?utf-8?B?Sm53S2MwOTltRFdLM2VWRjY2L2p6WU9yRlFKSUdLQkhKelAxRlFUMkhJbHdl?=
 =?utf-8?B?c0M3QWJBeGJwa254ck0rNFRRNkg4cERBeDNSQm1wWUI1WXlRSS9WYzRROW5R?=
 =?utf-8?B?ZmVKNmo5Z0pjRVdNTDdVZkJtcWZoK0Q4WEo3V2F6UXE2QW5SUWFZcXM5UHpO?=
 =?utf-8?B?ODlJNU1ES2I2YXNVR1FHdkhiTVhwWjVIY0xrdk5CanlueGdBQlliYmtZMzA0?=
 =?utf-8?B?enZuSWp4SmU0bkpiTmtPaVhnaTFlcFpGUHNpQitNWTlOUlg0YnFZKytaRmh4?=
 =?utf-8?B?bjNOSVhGRFVJNE1NcnV6bml6L3plSTZ2WjR6RzBkT1J0eWFSaWxtR1dRVG1I?=
 =?utf-8?B?ZkFvZ05oN09yL3FqL2sxVTkxZ0RXWGNvZUd6ZGFDd3FPTWZlRGN2MldGT0Jy?=
 =?utf-8?B?WUYwaDNOblR6UXRSRUsrYVd0TFpiSGxMZVFyTE5FeGFyZzhnZ2VwN24wTlc4?=
 =?utf-8?B?em5FTDZqanJEeTZvSUtSWVhSdWs5L3NtYSsrR3NUWEJEWmRqZGk2RmphN3NV?=
 =?utf-8?B?ZUVZNmxhNkNuYkdKTXN3YU43WXJKbHQvSkYxcVJZZ0o3U0Q5YllacWUxNXFG?=
 =?utf-8?B?Z3I3ZE1RTERzQkJWYUNNZ0pLQlZrZHUzK0FXSHpGQWdTQUxxbUhuRWdScCtO?=
 =?utf-8?B?bDlDaTZSMjhjbis3YWh0alBpMzhwNVJHamhCd0J4VkhTVHRjM2N5aVB1OGw0?=
 =?utf-8?B?QkRodFRwaHpTUWxLUlpHTUVaLzdkdFhXY3A5MHZkTVg2ekwzaHdGVzhGMWVT?=
 =?utf-8?B?b042WE5FN1dCazQxQXUyNlRwRFZhMkxPZi8zTWRTT2N2SmIwN0ZsdHc5OWpY?=
 =?utf-8?B?R2lnLytZckU4QjAzcEZiYjhxb2lDK2VzYmk0d3I1MTIvRXVwRG9qQ0twVzY5?=
 =?utf-8?B?dTNFVGJmNklCSC9ndDRQRzB0Um8wSEwrWkNOQjVPL0RyZ3hJRVQvTjdoKzJ1?=
 =?utf-8?B?a2VJWENrWksyTkg4b2NDY2Fqb0JhUkltQTlnZHZSVDBlSTBOK1RkRFBIcGFL?=
 =?utf-8?B?NHpHMEY0NjRVdzhoeEJPdWhTVVV5RkxqU2ZHTk1seFNKVGEvdTJiUDAxMTRD?=
 =?utf-8?B?c2RmNWJ3dW9rVnpFNEJKZWdkRlBURlY2aFdzNnpEeTRxUXFUR0M5T21FM2dL?=
 =?utf-8?B?aE9RcmFKVHk4MVRheUEzVjJ4UHdhWEoxcWhZMG5KYm8rM0F2aWtNbWhwbGtE?=
 =?utf-8?B?T3VhWVNFc0xJUWJWeEJnMSs1dzNLbG52MjFyN0VrVkdadlUzY3hpZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc6496b-a33a-4fb1-06a5-08de838d6abf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 18:54:13.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAwVxF/CPFK2kYoQTTk3djnSKXyV7ewkPrvwplMav17G/msVxPpcv0ZE/SzzsD79BgdAadEXjNCjHBVAR2WY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620

On Thu, 12 Mar 2026 20:20:10 +0100, Miguel Ojeda wrote:
> Was the patch tested with Clippy? It has several issues.
>
> The worst news is that it seems the "supposed to be `unsafe` block"
> does not count as one for Clippy, i.e.:
>
>     let list = clist_create!(unsafe { head, Item, SampleItemC, link });
>
> So we get:
>
>     error: statement has unnecessary safety comment
>
> For this, we could write them as a `// SAFETY*: ` comment or similar,
> to make progress for now, but it would best to request upstream Clippy
> to detect this or to rework the macro to force the `unsafe` block
> outside.

Used `// SAFETY*:` for now as you suggested.

>     error: unsafe block missing a safety comment
>        --> rust/kernel/interop/list.rs:357:17
>         |
>     357 |             |p| unsafe { &raw const (*p).$($field).+ };
>
> So this needs a `// SAFETY:` comment on top of the closure.

Fixed. Added:

    // SAFETY: `p` is a valid pointer to `$c_type`.

>     error: this macro expands metavariables in an unsafe block
>        --> rust/kernel/interop/list.rs:362:9
>         |
>     362 |         unsafe { $crate::interop::list::CList::<$rust_type,
>     OFFSET>::from_raw($head) }
>
> For this one, to begin with, do we expect to have actual expressions
> for $head, or could we constrain it for now to an identifier for
> instance?
>
> With an identifier there is no issue then -- the example currently has
> just an identifier anyway.

Yes, identifier should be Ok. Changed to it.

thanks,

--
Joel Fernandes
