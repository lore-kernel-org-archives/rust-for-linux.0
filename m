Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C235D3D1A9A;
	Thu,  8 Oct 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487615; cv=fail; b=ZKxS0+dL3wBnzuakYoBOOIwbGh2suCPhqB+fhGVVjtLKDvUMxBahpKmpSiVCS15OGlr5veIgPZpouApXC/hP2knmHtzd9Q/tEu59ycnG63zbxvlpN/8Rcf4QBZdioOEdUvRagcwUwMcE2OO61+uBMDctJGz6qK9gBpdknTSQmhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487615; c=relaxed/simple;
	bh=uOhjg+tOYCxicnVW7T9oy676K6peQyInk+oLezxtsBU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ONcYgqo5ilO0UyIyALcxW9hl9veiSREhnKhxEqZ7wt3olyc7zSW+V2h0KbInVnL0WJiROOOjPx3hxXAkR2xo+EDSiQ1iBZRwFKELoxDBh3l4x3TtGI8skgH7RrDi8j2OyEPynheA306wxAf6kidGqpAiJkrkDYBn9W7e2rJSICs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=orXf5CUQ; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="orXf5CUQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYTKCHW+mjobWwzTy0fPJN9eBJBztlClq3ogCXagCPDn1GzDkcZGrtDU55udUNiM0ZatM58LSC+IHtByyUFviTaNGHmCNpMYcXJT+dvG8sjM2cpD/P+5J19Og1HNX99t4zLrryk1eZYpJCIAFiYOP5XlFmNgqZ8xfSBZ9W77BwlZFsZ+P+qW0uS84tHjGhMV/jyPVoy8KfRs5pM7h1OzuiWRa6niieC4sf6ux6jAik5Yy1sq4ND5twGNXFVuGNwiUJrjDlOND44drvF5QOzC4S0C2O33vd1g+adcaDGm7bfDNWqknt7TlHr0DlgzE3ryMNfM1kzFkGNsdEH6TckPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NvBRtod2B6E40ia/VbEsszm2PWKNcQrnv6pGXa3CXA=;
 b=QjXqEjGZRJfq3Fyu98ifvTp1TCfdHFfGuA40pRlE9LDHiCqyjxRt0KRt/3O42k2FQcZwwl6bPshV4RhuO214PYKhyEJguhC8dGvuxld1vWGBcxqryUZ/gp+kPgSk69zjHCA0vwwECPaAekaSWscLCWBqItxE4aWpUkYWCPkI7O8elc3TsnLeECZvTvp+NW14sMirfklbFEzHJtx7X0L9M3so8bc5lp6oEYRmRhSUnEig603bxIsL/wexLyoeUa9LCjNH+LMDazCSjUkRYImQyssbWGoI/oE0pGK7I7cb8IOe/1AaCRsd6AVpqpRGaGpjUaPyk8UwLLcP7nwia5jAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NvBRtod2B6E40ia/VbEsszm2PWKNcQrnv6pGXa3CXA=;
 b=orXf5CUQtCr+7xHNFhoeZwuf0GgOHrr7yTzFWvUOaMcGpDNPqQvNkB+m3eCXp3ZEpRfBycQ5XYm7Yy/uLdElfiEjOB8cK83mtSg2S6Gf9VS+z0QbRPQJ2l6Us7mAA+vxGHaUyeykG6Gx6tvxyiXtJs8t4CJyFGqck80oZzUqbZk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:42 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:42 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 00/20] rust: pin-init: create self references safely
Date: Thu, 08 Oct 2026 20:24:24 +0100
Message-Id: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjtx2oC/1WNQQ7CIBREr9L8tRhApa0r72G6oPRDMaY1QIlNw
 92FGhcu32TmzQYenUUP12oDh9F6O08Z+KECNcrJILFDZuCUC0apIANG4vGpHWrCa3WqZa9lc24
 hL145tO/ddu++7Jf+gSoURWmM1ofZrftdZKX3Mzd/5sgIJUIx7LloNV7qm5FuNct8nDBAl1L6A
 NbW9CS6AAAA
X-Change-ID: 20261006-dev-selfref-27c37abfa849
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4954; i=gary@garyguo.net;
 h=from:subject:message-id; bh=uOhjg+tOYCxicnVW7T9oy676K6peQyInk+oLezxtsBU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffuX34U5x7VPBraAfXtwNqc7tzNsiE7hHVOPXR+
 N3OHa+4wxU6SlkYxLgYZMUUWTy6GdM2Mc6WvaxV/hJmDisTyBAGLk4BmIipMcP/gnT5XUy2emsf
 lpxtLPNyEd53b45m15VjK2dx3C37kzdRnOF/dF/pt3/LnB818Mpc3Lukcnfpbz+bbIfb6aeLlx6
 adlqGHQAZ60ts
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7fb59d-f9f5-4b96-faa7-08df25721528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|7136999003|11062099010|18002099003|10067099003|3023799007|921020|260925022911599003|260925021911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EX/kEeXMQjE347tuX9DvK4xXi85ir/0ibgJnzTH8VarUHay6SDCvgQxyFIFLlr1hVvOvUsLielQcthSl2WFPJauPQQOPMDU6u9iTQOh+A7Fctol9gYvpYSKu3fInQgg6UnbYMvLH4YdJmks//IXWVb7myiiExTxQzyZuJefvUOEvjqDViPH9iN0kAv8hsV9YUOZU+KtLQ97neKtQdFHmCpE7AIW6E6Oy/M9UhRecq5thy11HpNC3oEJGDlQ7ejnS7H9BUYGXFwdlwhf6uPbGRI+g56d2hcxywT8v3edfYzeWlne+k+qbd/8KrGhZlRqo5ozs5+gCXjd3slQzzp52rMZ3Eh9N+sGafBu/d5SPQpkyPqwtnFWou6ZkPas+wg1Lcyg28mJlmLDdFbmk0yHRTukWsTYBLlboOu0OlVgTMqiH0XMUh1Bzu+rw9wT5OYD7NajNk0DZAstMTmFbX0IZyThVobhTMb7e/m0EP25ymevr4tLHi4Z1BH1gtTcK+Cdn1sQQLk8Lnr0sOLPd9Pmc6GOmRBQo0ZGewQTRJr68NQyC92zdkvO5ujBIv60yTLGMDg1uGrNcQmdkE1akztp8ATHWKemkYI1V8WhT6KP3FbhKp+q9K+FrJoujUtZlReTiCmnFUx7QX+kRZM6NEMiLa/DXTRUGlfCMQUJVcRtmVHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(7136999003)(11062099010)(18002099003)(10067099003)(3023799007)(921020)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3pkQktnZ2sxdk41YVNNUzNJUFdsVHhGdzc0UW5yT0VVYmFQaXJuUzZXWU4w?=
 =?utf-8?B?RHFEaVRqeGR2aU04aG1PaHVGYTZQcjZlaURoaThmZ1lSak4vKzdhbjVOaksr?=
 =?utf-8?B?Tk0yeksyMGlhWUZybFlEQ1F0cUJWSG1YZGlWSy9Kd3kxODZNdEZLUldSZGdq?=
 =?utf-8?B?M1hnaWFJeE5EU2ljOVl1QWNmZlRGcFRwdFFSblNnNHpwWm0rMkgzWGo0M2RU?=
 =?utf-8?B?SlUxMm9HTzF4M2l2T3VoZmRiODc2R3grdWVrc2tGeHRvOStSc1ZqQmUzdE5w?=
 =?utf-8?B?OGdvcE9CNDNYV3VRSGFKOFFQcmFEd1MxdFIwR2lYK0xnYnB2M0dDc09yZ25i?=
 =?utf-8?B?L2plR0RRdHpZNlFpWXJFazY5SW92UzQyNjQydVR5OUxEMXY3UjdhOUtDb2tH?=
 =?utf-8?B?UlpRakJpbGt0Q0EvQzROOEFMdTl6S0poQkZtN2dtaG9taGZ2VkJUMTBBaTBz?=
 =?utf-8?B?dncvcTk4a1dVeGM1cGZWYlREYkhIR05PTGV2czNiUFRlcWFndTZFQ1VLZWNY?=
 =?utf-8?B?MFBzeFhlZ0RxNXljQS9MRmFzL0FFS2dvWEQ1b09lUW5vRUdGTjBncjNRQ3pT?=
 =?utf-8?B?V0REL0crZlNNR1QwQkdNVWFRU3FRc0VLdjVTK1htbzZCM2VOVjdOQUpMc0N4?=
 =?utf-8?B?R201ZFVhWE85ODlvZVZBSTNkNEZXdk1iQVJ5Nzh1RGJxWStPc3ovRmdtcnhs?=
 =?utf-8?B?di9xOFVtWmdpaTZhbjRoNko1MjhVdkVmRXpYV2tSdGVLYVl0OFhFbnMyL042?=
 =?utf-8?B?bWlZbTliTDBKenYzUytXcytGR242SXlGbndUcjU0STJBRERkT1h3U3RLQW9u?=
 =?utf-8?B?UFI2ak44M3BRQ0lFdHFkZzNoN3gwa0xEcXFFYXVTdkhBNlBwVXJ2NWRMMmEv?=
 =?utf-8?B?ODRncFg3ZEpGeXJBWUxOL0RqM09PcE1MQnR1TEtpS2orcXN3Sk42TlZjSGI4?=
 =?utf-8?B?SGx3ZDNsU3p0WlJtMjM0MlYwak9IcjFOKzQzRyt4ekxXcS9VL3FmNEh1TVNB?=
 =?utf-8?B?djJsQm5EcUJsVy9lRDN6NVU0U0k4NUN4U0sxR0l5elk0N0w2VENRVFFOOVM3?=
 =?utf-8?B?VGJ2YkM4dlM1VHFNNDZWNGY4Q1drZUZ6M1JqcGxnY0N0U25ENUNvREFKU3Bh?=
 =?utf-8?B?TzkwZ3lRSkk5bWNWWU5lbFpoeW5MN0dTZnlkUXNjNzQ0a3I4NTBTSUV4cDJ3?=
 =?utf-8?B?V3YzMllaQXpKS3NVTDNsaHhXSEt0Wmp1Ym5aM3NrZG9vSjh3THFIbzBrWVZ2?=
 =?utf-8?B?N2ZyVFdlTzVWbGpZR2x5TmZVL2ZrSjJoeU5ad0FVMmk1c2tjUU40TUdpck93?=
 =?utf-8?B?TUJCc2ZkdjBWOVVtemdYWUpPVEZ3citxSDVIMm1wbFpaUlJISVhOTTRuMi9Q?=
 =?utf-8?B?dHFWUlFwZFZSOEh1WURSajg2aExkcGVlWCs2dGdWMTByNm45NEZXR3M0U1k4?=
 =?utf-8?B?UTV2WW1FM2xNZU5FVDRpMUtEWW01QTBvdUQyMktqQkdYdXhEVE12c25TQVg1?=
 =?utf-8?B?V0huUCswRWR0cDhkWUNMSTJDaGgyUnQzWUxOYnBiR3hnRUw1TFBtS01kRXFG?=
 =?utf-8?B?NzVCZHl1aVFDaFdsdGMwMXFCd2FZTE1GWDd4dlZXb0lPRS9kdmRISWo0amFq?=
 =?utf-8?B?NGFHSS9NN2o1Q09MM010TWd4QkJoVjBGaXRFdVg5dUorelVVbWxCWlBYL1FJ?=
 =?utf-8?B?cTZYbms0NTlPZGZHaUxLc29GZVhYRUYxN1hFdGNSdk9qangyYUhybkYvSVNS?=
 =?utf-8?B?STdnVXJKMzk2ZlpnWUpKaXREU3JDakdXUUw2bkd6R25CUy9BbWlvY3BZTlk4?=
 =?utf-8?B?NmR2NVlCM21uNDVIQkZJcG03NXNBbjV3MGtHUitjL3BqM0NlZWRNOXlYY20x?=
 =?utf-8?B?Wm9keHFnOWJhWDRoSXMzK2svblBIUktTU3VQVmlYNmdWR3R1dUJMMVFMUmtY?=
 =?utf-8?B?QnN3OWtQMm9KdlF5aG5NcFlTdDVnckNPdVhCY0FHSXBWTGZ6THRncDA5dzBS?=
 =?utf-8?B?Tjd3T0YwK2tMZXd3WkEzTm4wNEprYWRlbHQvVEREUWw1di9WaFZDQXpkMGZH?=
 =?utf-8?B?MVRMQS9NaVZWSzQ4R29QVlhRQVNKWXl6SmtWZy9QWHFnL0JacEx2RVlEWlBa?=
 =?utf-8?B?MWRPTzJHdTRJLzJ2cFRJcFZ5WG9tNUxlejhjUS9rWGg2TTVDeUhKMEVBTDZC?=
 =?utf-8?B?UWpWaGliSFpJYm5VUktBS1RlZW1uMWpFYnBrdEtTV1E1TjUrd0hCbVRRc05p?=
 =?utf-8?B?bEYvOXFqNVV1UzQwRWZTTzZEQXc5YTVCZ3A4NUxrNzliOFdjUWVnRWZPZElH?=
 =?utf-8?B?UzRHZzVQZ21idG1Eb0dsZGVzcUpaa1Urd0VTZU5wTGF3dTBUNUlVSWRmTkpL?=
 =?utf-8?Q?FnJkmQzN7Oyw3sIx5hlroiJCiKh65OGVrLx0HUCRfltwo?=
X-MS-Exchange-AntiSpam-MessageData-1: ZKvsdfKUDifUdQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7fb59d-f9f5-4b96-faa7-08df25721528
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:42.2206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPgggSSfvkOgwhQb2SFup7Z6qZi5Owkdp30BKJw4sbW1/MpK+PQ/fj12dpLChG/A0ayoD++H2ZqzviFUcRO2+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

This is a big series that add support for one field to reference a sibling
field in a safe and ergnonomic way. Unlike many other crates in the
userspace Rust ecosystem, no additional allocation is required, thus it
requires the struct to be pinned, which is exactly what pin-init provides.

This is a very powerful feature, and thus can raise concerns about whether
it is sound. I spent a lot of time studying the rules to make this sound,
and presented durirng Kangrejos [1].

The simple use case looks like this:

    #[pin_data]
    struct MyDriver<'bound> {
        dev: &'bound Device,
        #[pin]
        irq: irq::Registration<'bound, MyIrqHandler<'bound, 'bar>>,
        bar: Bar<'bound, BAR_SIZE>,
    }

You simply need to mention a lifetime that shares the name with the field.
There are more advanced use cases which require annotations like

    #[uses('bar: invariant)]

to explicitly declare that the lifetime is used in invariant manner, and
also

    where
        exists<'dev>: 'a

to create new existential lifetimes as a way to erase invariant lifetimes
that would otherwise bubble up to users. More info can be seen in my
Plumbers slide [2]. Note that the syntax for explicit variance annotation
has changed following discussions during Plumbers.

The initial plan was to upstream the simple use case only and iron out the
advanced features subsequently; however it turns out that DRM jobqueue
would need the variance annotation feature, and Nova `Cmdq` would need to
use the existential lifetime feature.

During Plumbers the upstream schedule is discussed, and instead it was
agreed that all the features should be upstreamed at once, but the usage of
the advanced feature usage limited to the pre-agreed users only to limit
the blast radius in case the feature needs to be reworked.

Detailed documentation about the pin-init self-reference feature would be
added the following cycle, when the usage of them become more clear.

The pull request on GitHub [3] has a bunch of test suites, which are not
synchronized to kernel tree.

Link: https://kangrejos.com/2026/Self%20referential%20pin-init.pdf [1]
Link: https://lpc.events/event/20/contributions/2498/attachments/2200/4855/presentation.pdf [2]
Link: https://github.com/Rust-for-Linux/pin-init/pull/181 [3]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes in v2:
- Add where bounds to covariance check (Sashiko)
- Use `NotVisible` mechanism for `with_project_ref` instead of filtering (Sashiko)
- Drop `pub` from `SelfRefSlot` (Sashiko)
- Fixed some stale comments (Sashiko)
- Picked up Benno's Ack.
- Link to v1: https://patch.msgid.link/20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net

---
Gary Guo (20):
      kbuild: rust: allow `clippy::comparison_chain` globally
      rust: pin-init: internal: pin_data: infer self-referential struct
      rust: pin-init: internal: pin_data: rewrite fields that borrow others
      rust: pin-init: internal: pin_data: pin borrowed fields with wrapper
      rust: pin-init: internal: pin_data: teach drop check about generics that cannot dangle
      rust: pin-init: internal: pin_data: self-referential drop order checks
      rust: pin-init: internal: pin_data: check covariance of self-referential fields
      rust: pin-init: internal: pin_data: implement initialization of borrowed structs
      rust: pin-init: internal: pin_data: project self-referential fields
      rust: pin-init: internal: pin_data: add `with_project` method
      rust: pin-init: internal: pin_data: enable self-referential support
      rust: pin-init: internal: pin_data: allow lifetime to be shortened per field drop order
      rust: pin-init: internal: pin_data: parse explicit `#[borrowed]` annotation
      rust: pin-init: internal: pin_data: support mutable borrows
      rust: pin-init: internal: pin_data: parse explicit `#[uses]` annotation
      rust: pin-init: internal: pin_data: make field lifetime invariance imply type invariance
      rust: pin-init: internal: pin_data: complete invariant borrow support
      rust: pin-init: internal: pin_data: perform AST lifetime replacement if possible
      rust: pin-init: internal: pin_data: support shared projection
      rust: pin-init: internal: pin_data: support existential lifetimes

 Makefile                               |    2 +
 rust/pin-init/examples/selfref.rs      |   60 ++
 rust/pin-init/internal/src/init.rs     |   42 +-
 rust/pin-init/internal/src/pin_data.rs | 1563 +++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     |  269 +++++-
 rust/pin-init/src/__internal.rs        |  357 +++++++-
 rust/pin-init/src/lib.rs               |    1 +
 7 files changed, 2246 insertions(+), 48 deletions(-)
---
base-commit: 0d9aa4b994379c6e0099737221ed421deb7e1a31
change-id: 20261006-dev-selfref-27c37abfa849

Best regards,
--  
Gary Guo <gary@garyguo.net>

