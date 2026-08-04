Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021114.outbound.protection.outlook.com [52.101.95.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1113C199B;
	Tue,  4 Aug 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838257; cv=fail; b=sqk3rubffHmjZAdtms/oH+pvYqTCbuheWD7LtiYtkMZHMmbRaGbecnkLUDPcIyWIh1x0HP7a1atJccxgIfLCCqeHdsO6fFBXM4YcWm1YUC2TN4s0ycyCEenXahT8/sFg4q2Tm0RaNGGHF2pbBbV2fnqBBdD4mccF8tLZzjkfGNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838257; c=relaxed/simple;
	bh=mZcCp5u05w9Zmszv9ry+c0zC829SeV9e+0MuN8q/1Gg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YvsNrH8SR0hUAz1Q7PPtz2VSEd7V2+MCr9cr6tNY04LlleZxQOdS10qN4pRWspWaSfeXRd87uwFX4X14BgVYwG7PQuSVGzxWcrNru/rfIx5ml6sT1iH0TV2+y7M9stbTtxQSPGQSY+N66o48PuNMLUkZjIZztTci4R0pYjf4sbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cs4igfu+; arc=fail smtp.client-ip=52.101.95.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cs4igfu+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wT3M6vjbJD6Ftp4hkYbqHlfjNbFSvLgdT5UBY8WcDWCz15edzJ9C98KwlX2fCTZvdOto/8QfrBVlr8n8Pbuug0K+IZIp2HBl8P4QdnRTHyVTyijSrh29x7vV3tSTgiXZQWZMjM9t2SJcY3BRMXTdJf910wwGzict3wi9giIiVlvoG18q/qG6WUQBE9ek9mr28eTEJYN0ScD6uGKRT2vLtV95UAuxK5hN7WNSkaUwZzvucHBQO9X9Ce2f0nuSX6x4j4LH0zyJJkacLGFeqzIioDrCqPOesSyNf1tI7GTeZ5p3rGhWdES6Jqt66LgjAhu23Y2T6dNyX64spcA58CORew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1t1scHRhVhveZVTA5wd5RdlxTGEMGgvMIBwctfz7Fc=;
 b=bs+xRaAUcLYH4QMoNJQh8Epchv+4NqEpJsqxql8EL64gxa/Fi08JA5flCVVvAAJPbjveigmxSopQVSkZOQOqGgIMxvd8Ud39qBAiB4kGukOdOOfefXBP2Hx9ughlMHHaURrY3EP84SUV+lRaYspPmGmuE9ccaOo2/3vglUzaevUT38ezJaoVwdG1gAgr7aBqmNwCPpv70/Ghg8p1mFj9hgigoYYOihvHH6Y4IfWgEc1aMx0Cct7bgYDe1tcsdBr3w3IPMH2mTK7Jmxrn48Gh8DthgxWCrtmN3dvMfdC9napLbc8gISTZuu6eTBudc2m6AH8iJVqCbHq38C+vwODBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1t1scHRhVhveZVTA5wd5RdlxTGEMGgvMIBwctfz7Fc=;
 b=cs4igfu+TqBlKjoaxW6BiqGeFGpyixbzM7sG7ecR94E+/k1CrUZwzjs5SK5niZ7ZylPXc2DcWSoWdVFxQE2XlSihiJHrMGq5eBZmq1e+UoF/evzFvrunm6gIBzCfVH2jq9Nhsqn6F0nG0cvQjLZrj8DpVcyzpFPB9Y3Xn5thu4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6624.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:303::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.19; Tue, 4 Aug
 2026 10:10:50 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 10:10:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 11:10:49 +0100
Message-Id: <DKG2TQ94TGLB.3EO7ZNVKB50KY@garyguo.net>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Bert Karwatzki"
 <spasswolf@web.de>, "Harry Yoo" <harry@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: rust compile failure in next-20260730
From: "Gary Guo" <gary@garyguo.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162> <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
 <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
 <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org>
In-Reply-To: <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org>
X-ClientProxiedBy: LO4P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::12) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f3d81b-4e72-4200-1acc-08def210a926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|23010399003|6133799003|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Xp86UXkPG0q3PkSSgItq0PJwjuNUQlzizM9HEhxM7Vl4AnEYZL1Azn1ULgqOjMgiZyiDefGj4uXXylZ+DV37DbGOudpEJABGMel4c7O4J2HOp2ReTihkNALDCBnUct5MO9Y3DA9NqQnHr8KotiM0N97Yr/h+Jnp1JUryNnU3KmE//AowUGO4QloDGtg2CjiKFE/yiEr7xzsbE2Pwd0SKL3VlN4mkjGiBuo8WLfpv6aYCOYxI/IrRfS7cd9EugRyWLqL3+RWXONE08wejSyTROLYcwqYqYhHveBbqt8t0CBNWlqT0rxLhvCqVl6G1KpPhYhBb+WW3z3PuFgV31i3CBF197CyAKX+JHSGbzUejfLs+Zcel0AQ1sGs1z8DF2zYG3nQ1390/jMsMrXpLsoscVQhc2+d6GsvqOWi7KFNoApO1Y1qDkvEg2kYPGXRYNbJ1uSCMMh00IkQ8fgNKTEIBDOUPOow5KD+SC5cWmY+yaA9PmLCh1S2NI50yIt6w15CvMFaglGM7HPafzUJ/oaYut02kKpu5wFwEFOAUMZR7zolJJEoeYrCXgEHzwZfErHa3YUiRkjVqnZ+2n6mSBMgQzgYuvszoYfVTNk3/IUaUcaGUGcxDeYVetYEmxCxePehukTeLpWyk+khAi86scVAshQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(23010399003)(6133799003)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhUYVN1MHJvbUcyZmpITktzcFBwTHZLTlN5b1hGRjdsRmF0LzJuUGJIQjAz?=
 =?utf-8?B?YTNKZTNRaEcrYnRNVmI3azVTZ2ZHL0lycmRza0t6dkFrK2FmMWtBRWprOElK?=
 =?utf-8?B?VThUUUdKOHV5a2VML0YvMSszMEg4ZGFEcnB1ZS9VN0NxY3lxNkd2VHBqeThP?=
 =?utf-8?B?dmcyV0FxdjJaVTlUbEV6MGx4b3lVLyszTSsxZE5qWWM1dWpURVdPcmMxdVBl?=
 =?utf-8?B?a2lwUXlmeXZMMkRjcktmaGZXVlFhMDVUZEZnOEFOdnIzMjZTa25jNjFPb0N2?=
 =?utf-8?B?eVBzekxIL094NElIVVRsa3FFRWI1MHgyYXgrL283bXp1RzdTa3NGTXR3Tk81?=
 =?utf-8?B?THZoQjdmRlNkbTlxZ0ZUU05JeUpvZnZ6TmNCVEd6amF3K3cxSXlBbG4xQWZp?=
 =?utf-8?B?d2llcFk0SlkzN2F2a0I2UVJyWUZod3lENUtJNDEwN1dyV25mZzJrSmZaVTFG?=
 =?utf-8?B?eGJNZk4zM0k1N3N5eU9qQWF6Q3p4WTV4eGhVUEU4bFJ4bDhUb3U5TWpIZENy?=
 =?utf-8?B?d1I0S05MWHlqZ3plYWNYelRFeXFndWhTalBUaVBQazFHaXY4aXZhV3drOXRu?=
 =?utf-8?B?TUwzRzA4S0QxaUlGN2ZOdWpwZzB6ZHZzc3oyTzFHRU0ySGMyYVdneEk5VzJY?=
 =?utf-8?B?OUl5cmtaRng1VVlzbmVXVS9jTCtkRCtOL1J3MGRCWUUxczhadlkyKy9oUFF4?=
 =?utf-8?B?cHYyM2dmZGRNS2lUdExLbmVxZE1jZXdTL0tEeTJMN01ETEtvb3dONHJXVVhw?=
 =?utf-8?B?azdCRlJpc2dOR0pyMTcrR2JiWHNUN0ErQ0x5UkNTb05vOUdzNk9CN1hlWXc2?=
 =?utf-8?B?ZnZtakpmeGRncVpLSm1QcnkxRDBrR0tpTTFnTk9JVFBwQ0t6R04rTVVEMHdh?=
 =?utf-8?B?L01WN3VCbkFFQTBhRk8vK2dKVFl6d3BwQlpGMk8xT2dGTFBDVllNV05pOHVH?=
 =?utf-8?B?MXpQM3RzWk1zUU9yU3hma1pvS05WM0Z4aWFkM0ZaTFZjbGF5K3h1OW5VOHRI?=
 =?utf-8?B?UW5kdEY0ejhjblRWVlRaRlFidC93WHkwTkYrV2FRY1dpS3R1SzFveWNYT0pO?=
 =?utf-8?B?T2FrZ3l4SlViYVRadCtxTVRZblZGTVl4cS9lNmhaUG1BZ0FYZm9aUTZ2bDF1?=
 =?utf-8?B?T2NFdm0rMWttOXhHREJoakdMUUwzRnJFTmpRUThUSHRIRWdMd1FDY0ZiNGNG?=
 =?utf-8?B?VmN0U2h2NE5lUGNwTEtMcDFsN3M4cG9mSFJ4dmE4SmJCK094cHlJWnl5MFdQ?=
 =?utf-8?B?QUFXQy9IQWhDRi9tRlpBOEhMY3Y4SDBvdHJ6b1paeGhzbU1rTmgwNzIrVG16?=
 =?utf-8?B?eUNCd2p2WW1vbWQxSE9RV1RCenRJRGR5bzhjM3p2VzVNRnhvYXJ0NVFnaStI?=
 =?utf-8?B?ZFdHOTlkN2VkMlFjb2YwNjhadm9GaTBoN1JxbUJCZHNJSDRuUy93R1JmRHFq?=
 =?utf-8?B?SkpXL0lnK040d0o3TDlGR1pOSExzbjZFdTgvWVpKWkpjS2lmRU9JL1hWSWJO?=
 =?utf-8?B?YkxkeDhnK2FKdnFzblRwRUhYV2RWRGhqT0pyVGZubjVIYWc0enFXc2d1Y1Ja?=
 =?utf-8?B?K3o2dUJxL0pCcGMxNEFjUFZYQVFUT3F0bUl4R0NOL0J1SmMvcnRPdW1kd3ox?=
 =?utf-8?B?SDVydjBicGp5VDNqREZUbmd3bi9Bcjl0VEdlU0w0Y3Z3aE9Kb3dkdlpHRlQ3?=
 =?utf-8?B?ZHpIK1g4a0RoTGJ6d1ZCTDVCQmtJaEhaeWp2NGNTSG5KZ2puUkNvMnN4RG9S?=
 =?utf-8?B?UkNMKzRNd2kzYUd3ZVVqM1psVDlMK3U5dG9Tb3BHdTZKTW1rVHVobEpwTlVT?=
 =?utf-8?B?dU51VmF3b2o2V0REMTROeWgwYmVvQiswaFg1MFhBS0xrME4rY2llS3lSYjh6?=
 =?utf-8?B?MXZDczZsaTBSQ01tdHVwQUJNQ2phU0pkNVJxSUtNSGtEVCtmQk56Mml2b0Jl?=
 =?utf-8?B?ZzUwY2hnNkNDTVVYSWpzUVpib2hNRFZlek1ycEE2VklRNVoydjNLY0pzb3ZB?=
 =?utf-8?B?UzlUcllhZ29MMTNMeWNGY2x0RUpIQUFINlFVZ1lvNHhJcjJpYkEyb3UrNCt4?=
 =?utf-8?B?dEJxRWVsRU1TVjVvVklMTFF0cWtEUDh4eVo4dFRMVWZ5ZlhWbmpISXhuSFNk?=
 =?utf-8?B?bzQrSm1GNStqMnNVUWFFNmJkZjNzei9OVVFiaUcxc0t0eTU4cGF0dDhmL3ZY?=
 =?utf-8?B?RFhrQXpFWDFKc0d1d2ZvbGFtRkd3aTlqU2d4QzExL2d3ZmgxYmJwa3RYZjFW?=
 =?utf-8?B?dmRPT1JPakczamp6d3YxUHlyaWk2SVUyNzZqWGJyM2VkZEpOejlRbGIyQnVZ?=
 =?utf-8?B?dVNpajB1RXlyOTRrZFhLc2hmNTlhM0VTM2pmVHA0Sm8vVGJpKzNiUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f3d81b-4e72-4200-1acc-08def210a926
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:10:50.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs31eRRJ54FkprPUd2iueqzu51qG50iAgtqZ1iG3fnL8PGF091G7EVD0WFDwU1UaGbA6U08nBTWI+om61o9jEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6624

On Mon Aug 3, 2026 at 10:04 PM BST, Vlastimil Babka (SUSE) wrote:
> On 8/3/26 17:32, Gary Guo wrote:
>> On Mon Aug 3, 2026 at 4:10 PM BST, Vlastimil Babka (SUSE) wrote:
>>> On 8/3/26 16:23, Boqun Feng wrote:
>>>> On Mon, Aug 03, 2026 at 02:57:49PM +0100, Gary Guo wrote:
>>>>>=20
>>>>> We could also unconditionally use `kvfree_rcu_head` here, and
>>>>> add
>>>>>=20
>>>>>     #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
>>>>>     pub type kvfree_rcu_head =3D callback_head;
>>>>>=20
>>>>> to bindings.rs?
>>>>>=20
>>>>=20
>>>> This option is currently not maintainable unless it becomes a
>>>> maintainer-aware way to handle things like this.
>>>>=20
>>>>> (Or even better, changing `#define` to `typedef` so bindgen takes car=
e of
>>>>> everything).
>>>>>=20
>>>>=20
>>>> Yes, this is better IMO, but it's up to slab maintainers. :-)
>>>
>>> Can you elaborate a bit please, how would that look like?
>>=20
>> I was thinking of doing `typedef struct rcu_head kvfree_rcu_head;` but o=
f course
>> that didn't work because you can't use typedef to create `kvfree_rcu_hea=
d` :)
>>=20
>> However, something like this could work?
>>=20
>>     #ifdef CONFIG_KVFREE_RCU_BATCHED
>>     ...
>>     #else
>>     struct kvfree_rcu_head {
>>         struct rcu_head head;
>>     };
>>     #endif
>>=20
>> and everywhere add a cast everywhere that expects kvfree_rcu_head =3D=3D=
 rcu_head.
>>=20
>> but this would indeed be more complex :(
>
> So you mean like this? Doesn't seem so complex and seems to compile here
> with CONFIG_KVFREE_RCU_BATCHED both disabled and enabled.

I thought that a lot more places have to be updated, but it looks from your=
 diff
below that this is simple enough.

Best,
Gary

> I can apply the slab part in slab tree, but AFAICS the poll.rs
> change still needs to be done in the merge commit. Unless there's
> some way to make things conditional on whether kvfree_rcu_head exists?
>
> diff --git a/include/linux/types.h b/include/linux/types.h
> index 79bf419c69e4..53e0adca4b9f 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -262,7 +262,9 @@ struct kvfree_rcu_head {
>  	struct kvfree_rcu_head *next;
>  };
>  #else
> -#define kvfree_rcu_head rcu_head
> +struct kvfree_rcu_head {
> +	struct rcu_head head;
> +};
>  #endif
> =20
>  typedef void (*rcu_callback_t)(struct rcu_head *head);
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 64845ac81b79..aecbe9b9df4c 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1325,11 +1325,11 @@ EXPORT_SYMBOL_GPL(kfree_call_rcu_nolock);
> =20
>  #ifndef CONFIG_KVFREE_RCU_BATCHED
> =20
> -void kvfree_call_rcu(struct rcu_head *head, void *ptr)
> +void kvfree_call_rcu(struct kvfree_rcu_head *head, void *ptr)
>  {
>  	if (head) {
>  		kasan_record_aux_stack(ptr);
> -		call_rcu(head, kvfree_rcu_cb);
> +		call_rcu(&head->head, kvfree_rcu_cb);
>  		return;
>  	}
> =20
> diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> index 684dfa242b1a..f3cdf95db12d 100644
> --- a/rust/kernel/sync/poll.rs
> +++ b/rust/kernel/sync/poll.rs
> @@ -124,7 +124,7 @@ pub struct PollCondVarBox {
>  struct PollCondVarBoxInner {
>      #[pin]
>      inner: PollCondVar,
> -    rcu: Opaque<bindings::callback_head>,
> +    rcu: Opaque<bindings::kvfree_rcu_head>,
>  }
> =20
>  // SAFETY: PollCondVar is Send


