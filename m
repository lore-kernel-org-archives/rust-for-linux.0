Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022101.outbound.protection.outlook.com [52.101.101.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D5D3AEB39
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474779; cv=fail; b=OCD5JCmCsqyJ2i9VN9s+u08onZkrdcyiW+n+5iD9eYIhfnDujg8Qn1XR0fn+jcWRPRfQRg8HYSpRUH3SeLzM12E89tCLMGScuJV6a7QWhrHsIDh1cHIHJVDn6IILM0ZD3jFrfqQ32G37DaKH2NHAC41AKro27q4SYvJoZAbCuYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474779; c=relaxed/simple;
	bh=6kqnIOVWA6/hPBA559CW6aLNNlarQPDCaCtttRWIyQs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=XltM58ByT3pYuJ4IYEd+otltUXiPwFgkk6CugAwfIIDgX6FY7FyIl7ym4MPmkRlmoWtpC1j/x7LKSq5R5tbZ6v1704a9IiYkv7O9pmkEwunQhXVqaWt56b9UNetmZbEsNaUaHwPDR6s3JZOmuYN/+6bcsbGJ0CPnla0e7UYPbi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=er0WiwiI; arc=fail smtp.client-ip=52.101.101.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="er0WiwiI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3JR7nqFwfeFsePQqGvlVvyOFA5aUK5JbTiOtEfiKZc2rNfKUSgQhVYFRHRCmlAsjPvpicAnJvVHKyb0p0H03n2Ixwr1HmgOEVQPIDie1xS85e3kpkVnh6FaKAHBzGvhor02yfUuyfe2OR92b+L2WC8d/FzxBZ4AqAEfDQxmB5srU3nhBqp8V4lc545c9znELY4CEzi/H8wFXGgxq6Q9/qIKnxU3SmZwX9q1tvz+L3hGCMs3bDC2k+HCO+HysXAt+qaZ6ndsxC4qLbcsYzFdzRUQYdyx28jww84McskR9eYioFgMVfbtWNZX+qOyxYOwLUbvUazWIdyuJUw478ifrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqKYxw2yBmVrqqjlX/flmPpzONi6ZpF2nQOOE5PNQj0=;
 b=JyrilfYzhMS0fPJuf9SC9qItqGw2HUYadpPG//Mo2J/SCuecun68Njr/KvdGaMq0UUaQI4IhY0E48heGER3ZxeVUWX3Kiq61ZJB9KkSe9LJ4QEbSxZBEgHy05k/rUaY1qZsAZYPq6n8ecA3aAls9ucv+quVxgLTu8JLbg0WrwxLp1h15+2xm64HuTh2Ecr00qBXrMZYgEPda6pcTUZu8riPcEqWHaxS2USKf0xsWXcYlHsPu7MIEVRm26nXsI3S0wWP5DinpNwcmeKemeH2G9zd57B1AeXAthlQMAkoMAVcYshQpblnWAnQjDG5s27Cu2OxdS+KvB3G9erciPXSSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqKYxw2yBmVrqqjlX/flmPpzONi6ZpF2nQOOE5PNQj0=;
 b=er0WiwiI2OVIqgjf+HiavFJWAPbn7db8PKa3TAmg3xP60Mn3DsG6wIg/4KQjIO16XMCjgjMa8mSxPHbnUo8i87X96sayHXCQON4klsag6UAlh3rACCy0Mewo0K6Ai+g12jxdrF8cQYwXIpSvtAboWIEteYLdPzQkf9aFHOZqdiI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB2267.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 15:52:53 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 15:52:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 16:52:51 +0100
Message-Id: <DLZKT0KCED3C.2XOP0UCKDOF4M@garyguo.net>
Subject: Re: [PATCH 16/20] rust: pin-init: internal: pin_data: make field
 lifetime invariance imply type invariance
From: "Gary Guo" <gary@garyguo.net>
To: <sashiko-reviews@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
 <20261008-dev-selfref-v1-16-6c1eb269fe57@garyguo.net>
 <sashiko-outbox-164164@kernel.org>
In-Reply-To: <sashiko-outbox-164164@kernel.org>
X-ClientProxiedBy: PR1P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB2267:EE_
X-MS-Office365-Filtering-Correlation-Id: 820b5574-3079-496d-fea5-08df25543653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|7136999003|18002099003|22082099003|11062099010|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	q9P1t5nVFZvI4sOXU+ymLBYHFnczuw2xBcywZ5Xs/zOXnqYd41hrsRV19jvAXEDXobhfLpBspRFqnnRZewqhK58Vm47jTh4vKqLrXcPeGNSY6WfFFE2RlooSW+2H+iyMkr1sigRUYf+WYdV17kp0paDXBX7GSoW5J/1l3GcqtZKKE8dGhPi5SODCcbola2Rok+Oi6/A6gGr69KZ49HHVuS9hDfKqIqDGGggjb0MZ0Pn3AbbFCvzWzczt4xgTYrLq7Ku+MCPA8rZ2jlN4eQxyYGEFmB6bwHz4FyPK8I6Uvz/k2r9RJSPh0ZmRU3QSKC6K0Xd2Vzuk+BNP14BJ5Y/f4svQrxbXUv7fFhYe9WeczQZJ6JQIm4vxZoy5VO2bt67TURt72l6HLF1wSrszmB0BEG+XZiQ5n7BgzGPYIfFYjkAYR61rQTjvUvEYfnsZ8RazTEWcCKnPzYbixjMXwdVsdSM0iRa/9Mm94LCmTam+NCCgiltU7flr4BNsfKuld9wc2rM5VM5I6F4WWCSr/x59GkzIvaR8l9PR+KnHrZvF4Dnt8NvoZxv23+JHvD2FWe6J8rMf/NdQxnsScHIRCv+C2SWA6NEwJZmAzzbaE9DSHZkj19LksbHLFES4832eMwbM5r3H37dDsbuYkUoSSyzMsAw771xEo6vXo1PxGHqoZSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(7136999003)(18002099003)(22082099003)(11062099010)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkMycCs1NFJJVDdxMk5YRS9QdmNreWNwTkdsNWlaZ05GTHlGM0JQdGt4cmlM?=
 =?utf-8?B?TUl1ckRTQ2U2RmROZjR2cGMxRVpRUGpMZGJZd2tLUUdHT2hObGZrWURiOU9P?=
 =?utf-8?B?eUVpRnNQNTU0MFd4aGRCby9YMysxQkVPVGRNaStucGdGWEZLRVdzSG81WCtG?=
 =?utf-8?B?QVF1VkpncGU2bHZZUHc1NFlBVkF5ZWhzempETnVnRC96a0lzZnFsLzRLamxT?=
 =?utf-8?B?QWZnbTlwSmVLVURPS05waGFMY3RwMEE1TEZKRk5EdzdtWUV4NHdScnREVVNR?=
 =?utf-8?B?SXNVQW5LWFJBZElwN0NCbk9RdSt3bk40bEhxVG10M0N3MTE2ZlFQbm8wMXl4?=
 =?utf-8?B?T2VhRUlBMktlTDNPdFA5SzNlWEpxbjZVN0dZdmtBV0VXaFRJN05FQlpSWGZk?=
 =?utf-8?B?VDF6bXU0RENmTkZuU1JEV2k5bDF6c1dQV2lNVU4yM3hLSXRFY3hiNFFQVTBV?=
 =?utf-8?B?YUY3aDR4STZ6WjBrNWNQOTFsTVZ0T3E5d2l0dGk3K25tRzVvNzlqazk5ZkIz?=
 =?utf-8?B?ZzRaTVRBalJpOEdYZW5UNFNtWXNzYWhYSy9ubFdsR1ZLaVgxbVZxRG1LUFJD?=
 =?utf-8?B?Tkt3M3BTU3NWaFRMbEpmclVLMGJDS0pxV1IvSVRIclFqQzhSZmMyTEZFa0lt?=
 =?utf-8?B?N0hTYVhDSXJ6clVhNHl4aVlFdHM4dWZRZE1ncjI4RGJrVVYxUFZRbC9iQWRu?=
 =?utf-8?B?dndxb1BXazEwUVF6d2lPa0d2a091ZVpRTUxabzR3L2JMNkVSOE1QU2ZVdHZn?=
 =?utf-8?B?UTVqdjk1Y1lHdkRJeXN0TzFNODBERnl3SFM4c1JIdUUzWWtpb21kUjJDZU5Q?=
 =?utf-8?B?bHVKWmRwM3hkdkQ5YVNJcndlM2RNYTJOYTRCVzhHK0g5Vk9KNXljMkYrbXpY?=
 =?utf-8?B?SjhJYWMyMFJxbXFhSDlWcy8yT1BZNjc5cWNyMnhiZkhvUGZtbmcyVWhhYXBy?=
 =?utf-8?B?Y2J2Z3piZmg0c0EydkNBQ2N3MjJlS1FMSFMrMXRUUDNwRE14R3BLbjMyOFVo?=
 =?utf-8?B?b0o1bzlDSkQ3bHBvYkJrZ3dNWFpRTG4rZnEwbW54V3dyU0t6cFVYaWFkMUk1?=
 =?utf-8?B?Y0pOaFZOZWtJR3hEOEZuelFNcGw2V0dwa0hFVlRLNkF0czRCRVFrbWFGTGlh?=
 =?utf-8?B?T2hhUDBLUmt4SzJPTnJ2VEFrTi9IQ2FPWDVhQUREazBVMWtSV3pWUWl6Tjl2?=
 =?utf-8?B?eDlXQmI5VkpIcjlKbURSYmJKdXI4RFVnQjMwOWkvWFZPWE5VT2FyWnNEUGVV?=
 =?utf-8?B?aDNCWm9zUVl6V215Wlg1am0vM0dRajNvQ2ZqVUdtRnY0eGFrWkhNOTcyQ0pX?=
 =?utf-8?B?K2k4dTczSGNFbHgyT2FxWlo3T3k5ME5OeW5iK3BXTUsyblRnbnVJM3FIeUIw?=
 =?utf-8?B?UktwQmpPaG5vRGF1eTJWaHIrekpEMTJXYytwNGdvajNKcGdqeXBPUFpZRENO?=
 =?utf-8?B?L3M3amtxY3lZNTc2SExhZkJpa09jUG9zN00vZ2VnaitlSFRFYWFZeW1uekFw?=
 =?utf-8?B?bEdkQTZ5V0VpL3k0Y3RQaU1iRnFTYUE1dWQ0NUNzMTV1b0ZaakN4MWpYMXFN?=
 =?utf-8?B?TlNxeUVvSmY0RDQyYXZHYnFza1pHTzQ4VHdvRGl4UFdZVjJoY3FwclpDbEJz?=
 =?utf-8?B?Z1pOTThJRWd3ODQ5WG9FOVhWZjFCZUxUYUNVSk15SGszcVZNeXhKRk1KeXJ0?=
 =?utf-8?B?WGFWOHJoRTh5SjFMRFV1NlYxdlFqbTcrSUpQT0lneFA1QUN4RnR1U3VrTmVi?=
 =?utf-8?B?aTNqREkzMjgyam01Q0FTaEV2Z2drVjhFSG5NYXRvWU1UNmE1akVzZTVYMU9X?=
 =?utf-8?B?eHJGQVloOVlaa2JQSWpzVkRTSmtZZHJ5RTRKTTVKejF3OGtOamRDcHBvdldF?=
 =?utf-8?B?RkxOMTRFTXZhTTMwRUNpUWRtOFJycTBjSzJ3d2hjUVNnMjJ0VmFteHpZVkl3?=
 =?utf-8?B?SkxKYlk3YmNGek1oZVUycEtRemxXTWVRa1NUdy9KcVV4M2lmQXlSVDd0Ky9z?=
 =?utf-8?B?WXprOUsxYmxOa1ppa3JPMnk0bzdGVVRrZWw3NnFxOE1TeWFPbEJPRlptc0xJ?=
 =?utf-8?B?OVFNendvc29QdlVTd1JOTnQxWmp2QTJJVUc0cTlZS2FmaHAwSThUOWtLNFN6?=
 =?utf-8?B?aU9vREgvOWdDTlEzR3pRc1BNaHlOQjBIbDRhdjBBK2xVL2o3ZlBWL25lOXJw?=
 =?utf-8?B?c0hMUXFqMExMak1CNzJzRHdvM3RkVjBiRENhR1FkZGFwSzRGYzlIUzUxekVO?=
 =?utf-8?B?czQ0UGxwT3IrcWt0ckZqejByc1oxOXFLNjk4YlFkbDV3algxMiszT0JtT2My?=
 =?utf-8?Q?SF3ygkibqffQ8x19E8?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 820b5574-3079-496d-fea5-08df25543653
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 15:52:52.9716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfu2DzaEmf5relhisRtp9q/SbGN9Nj+RcmmU2RneJOC+M8LFocnrhRMVGnnDvlUPENh1hA1m3qq0GSeLY/3qfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2267

(Cc list)

TLDR: false positive. Explanations below.

On Thu Oct 8, 2026 at 1:40 PM BST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] rust: pin_data macro drop order check bypassed for covariant=
 fields
> --
>
> commit f9d502571fb94f74de22024871d23b994623a8b0
> Author: Gary Guo <gary@garyguo.net>
>
> rust: pin-init: internal: pin_data: make field lifetime invariance imply =
type invariance
>
> The commit modifies pin_data to ensure invariant capturing of fields.
> It splits the outlive chain into covariant and invariant fields to avoid
> outlive relationships issues. It calculates an invariant closure and
> handles type invariance.
>
>> diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/inte=
rnal/src/pin_data.rs
>> index d42d86ffd8538..b35d32ff2bb2d 100644
>> --- a/rust/pin-init/internal/src/pin_data.rs
>> +++ b/rust/pin-init/internal/src/pin_data.rs
>
> [ ... ]
>
>> @@ -520,6 +581,96 @@ fn expand(
>>          }
>>      }
>> =20
>> +    let mut field_lts_split_variance_outlive_chain =3D Generics {
>> +        lt_token: Some(Default::default()),
>> +        params: borrowed_covariant_fields
>
> [Severity: Critical]
> Does splitting the chains by variance in expand() erase the relative
> declaration-order bounds between covariant and invariant fields?
>
> The drop-order check relies on the outlive chains, and without
> declaration-order bounds, the compiler might not be able to safely enforc=
e
> drop ordering.

Omitting a bound can never cause soundness issue (at most they will cause
something that is safe fail to compile).

Here, these bounds are deliberately split, so we cannot arrive with a `Para=
m:
'invariant_field` bound transitively.

>
>> +            .iter()
>> +            .zip(std::iter::once(None).chain(borrowed_covariant_fields.=
iter().map(Some)))
>
> [ ... ]
>
>> +        for capture in field.captures.iter() {
>> +            let Some(&idx) =3D field_idx_map.get(&capture.lifetime.iden=
t) else {
>> +                continue;
>> +            };
>> +
>> +            let prev_borrowed =3D fields[idx].borrowed.as_ref().unwrap(=
);
>> +
>> +            // If borrowed field is covariant, it's already captured in
>> +            // `field_lts_split_variance_outlive_chain`.
>> +            if prev_borrowed.lt_variance =3D=3D Variance::Invariant {
>> +                // Covariant field borrowing an invariant field. This i=
s not captured in the chain
>> +                // so we need to add additional bound. This bound is ok=
ay, as the invariant lifetime
>> +                // is the longer living one, so arbitrary shortening of=
 the covariant one does not
>> +                // violate their relation.
>> +                let param =3D field_lts_split_variance_outlive_chain
>> +                    .lifetimes_mut()
>> +                    .find(|l| l.lifetime =3D=3D prev_borrowed.lifetime)
>> +                    .unwrap();
>> +                param.bounds.push(borrowed.lifetime.clone());
>
> [Severity: Critical]
> By injecting this bound unconditionally in expand(), is the declaration o=
rder
> check bypassed?
>
> This could effectively blind the compiler to drop-order inversions betwee=
n
> these fields, potentially allowing fields to access freed memory during D=
rop.

The field-lifetime-outliving-captured-lifetime check is a custom check in
drop_order_check and not bypassed. We do not rely on compiler to capture th=
is.

Best,
Gary

>
>> +            }
>> +        }
>> +    }


