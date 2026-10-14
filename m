Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020128.outbound.protection.outlook.com [52.101.195.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98314D990C;
	Wed, 14 Oct 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969683; cv=fail; b=X5c52+krA5V+Uu/NBrPKwVw2uLenuRWWJVTFR1Jetw+rx4+mu1kzW/gXyq4gl9XIlsFxhhJOoWLtmhs1JvJArvHyLvMRGOYtKjmvRA9GCo/1zSrKP8BZPUKlGQUfrf3TzMKctVq/mMBZaYBlbg9/1b5kS9xLZax6upU2joRDVIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969683; c=relaxed/simple;
	bh=XqQb4Oy2+9Kxgd3ypo6o7o9NxE+wpUNMOWVTv5aY3Xo=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=j9rMhqPyPrZmAubg/CJc4QrQsb27G0i6v5mJVgHxhC3LuqHVQ+sXZq2/TXEDamhJQKJUJjKhcG6y70E8t41PYdS6xCmzotFvzwZBsgEWdjpYKUX7O/L4T4JPT/oHEWrS3AgLySJ8C6dIETTSXf2ewScoywZpu8+cCsnhLQcei+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nB8MqsM/; arc=fail smtp.client-ip=52.101.195.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nB8MqsM/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNVxIXaKwdmPuHxjuTklFnfNckIaiocZvjbkdr8yinu2m+nmmFk5/YWM6NR0RFxJUOXMhYPykSQmwbl5HOA+erG1/XXQq6dUvgY/VWkTNrcG4nBkyqDQcI1ed0vP3qa+5dn2Khks8X42Euxe0y7jxenlB1C+CDZ5xvZ3TcdzxwYmjX2gjLxFl+LBL5tnki5tTMu23AE+2sSteqyyui74IsVbybESXzKdIgurATizT/NkGl9id2lmU+MQTiFADQkiBztQw4u1+s4Ju4+9ByCUlFgzj0/84BGYZxE6+PdfeGlRTTw8wm2uX4/SBBRxGUIxgjgf+aajLia3IEsKLmp8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/8oNiASt4ZCq8fvxfS3W3Iv7pp6xRqGdGXxKptLLsg=;
 b=wJ2Si42vTFI3zPE3BXbdakpTEUeJB58LuKQO3FPxQbnJc67g4Y9eSHrjYbA2DmPusv6Grnd2FN0fUU/ipBnIy4LuRUgud2keCAJr9vXbhUCAk7FlrlUNNdnHCXmVD18J+kvrzHFhbIMrOvxppd/AEjf9PQgOzmjHq2+OBe2EFv9XRKFOL6ZFHBwBPMmpeqQRI7uA5oaebiud+XF77I7KfdFUIoUDhjliJCbz33K1Bu9xHbJwFx0lijiTyahn+EBSl/je+7m/Tc3nUkIXyecy3HxOqwass0hB2Hwxd8ekEiONGXqfhOhIREU4X5Oo5mdymNL7cURVofeh6n120M8AJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/8oNiASt4ZCq8fvxfS3W3Iv7pp6xRqGdGXxKptLLsg=;
 b=nB8MqsM/MkR/iBpNZC/lW8LY4ue1L3V4oU39IRdeGqkkb/A1mV14PCxIot6S5NSOXuh8kPpJmgKwEYefNAqrs3/uekX7syTRo8gX7BCaMEcwUe5sq9R2nKFXFVztU0Vbx1GaHTHoBdb0G8hR+oWXiOOz1YfxihXZWOfw/pIDG4E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8605.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 09:21:18 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 09:21:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 10:21:16 +0100
Message-Id: <DM4G8GOS4MGC.2HZWOWO0Q2X3H@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Alex
 Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang
 Mu" <dzm91@hust.edu.cn>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Carlos Llamas" <cmllamas@google.com>, "Marco Crivellari"
 <marco.crivellari@suse.com>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with
 system_{percpu,dfl}_wq
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
X-ClientProxiedBy: LO4P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da24dac-9410-4ab2-dcdc-08df29d4802e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|10070799003|366016|23010399003|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YMwTG5PDaBM/RotGO16iRhIYySdHDHQfN4WHlWj83/ylughvgU4JloLcWafvRi4MPsUK6BMYP7kvUocnwJZ3MM8TbVzHm6fumgFaDXSLAKT188q+F92g7+E88dis2s+kej4okpQhv0pA838qG6+TmP7SwCZb9qBH9MgywRlTjea6YWyR1Q7Kcb8Mi9AR93bsBCdV5XbRQx5TkaR/rs1BkjjtGDybHyoP89azn4/KRGmFsbSmyNeVuuMX5qTGtn0sNcFy3/dcZ1y8/NxtDP4jXBI5it4OzbxddhDdTtYA9zEwtf8rbOEeThBNPOnSjkDJCdExZWVrt4ak6Wz/AnyvR7dFBkexjih/aba81Fxm2FOkRaEdh6qArz5CXHF124snp9wr/BijZGrhx5DwVMVL4WWLMbPqo6uA8LByEt/Z8nUz4otMbqbIVn47uL0wez3wgBRhFfi+d/u8u6scutjXzD88Q02BvtvGkkZOPEO+T1JL5U4N0u3K51nLAbaQElLi1yUqJqMhsr3Dy1ngg4QIDHnZGm6Fts3j7MF+e8YGGT5qfDvjJbWLe/dMKHx2puhBWfpPmez5u0L6v9mg1HsnPUO4AB7c+MZnLhDUYl/liW58pWhjh5g3TDmufPfPyt9B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(10070799003)(366016)(23010399003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1ZjTmdMaldlQndValBlYjIvU2t0TGpjNVhpbkg3SFRxWlZSbjJSbHBqeVRY?=
 =?utf-8?B?cVpkUll3UEVIM0NydDJzNlRrSUI2NEEzbFlWV2FiODFqeUFLWmIwTWdlUzkr?=
 =?utf-8?B?WkxOcFk4WElFN1JEeEIrai9HdFR2bHBrNGRWUEkrVjNDNVZZUjVkTUhYUWZh?=
 =?utf-8?B?eThZTXVEWkM1Q1ROWUdic2NYdWxzVnhBUHFFS3huUjNwRVdxVHc1ZHk0b1FE?=
 =?utf-8?B?Y1FXWW43bVJNZkZmcU5NR0o0dDlKL2p0UjUzb1dwVjRWQ0owM09SMVpIV1R4?=
 =?utf-8?B?SDFMdWV1UkxtNUk3WTV1ekFsM3dlYk51dDJuRTlYV2RFWFpiamVWSU9sVkJt?=
 =?utf-8?B?YVRXYkF5clB2YnRmMGpnTC9qYnRPc2w4dmU5ekZMTEwxK3d3bFkvTXNJMFZN?=
 =?utf-8?B?VTkvSHJHZ2NOVFZrRVpzZld0MnZTdUwwUXRTWU9PeXRtZUNCNWg4T1FkRmFv?=
 =?utf-8?B?Y25IVkxKV2tGMkw1dnZ1aDdkdkNpN3J3WlZGaHd3dy9tREpPQVdGaVQzNlRD?=
 =?utf-8?B?ODZsRnYwTDhzNUtpWk10Vmlpa2tTUGdyTW1PcWcwS25EaTNHUHJmNGZLQUIx?=
 =?utf-8?B?YVRheHlTZHRQQmt3WjIrZG5xOUN3ZnBZVjR4VHlJWnUxWW0yY0pyS25VOC9h?=
 =?utf-8?B?Ync4UnkzS1BFczZxTnVha0gyS1hSVEZpd2pMYmRDNDQ5Ti8yQlQ3SEI4N2R4?=
 =?utf-8?B?QmEwb25sVG8rOURuUk9YZElvRllNRDg3Q1pFTHY0eldVTEUvY09TaE5mcWls?=
 =?utf-8?B?djlUMUZiTk1lcW1RcVJYdnVJbEJoTXlKZXlkZVFieGlvdHZBNnRESnhOakpJ?=
 =?utf-8?B?VlBvVHhsaHUwZzU2bGdnK093RVBRMUZQQzdBbUlZVFkyZkdtb2ZaTER0U01K?=
 =?utf-8?B?SzFXMHhTd29HWnFKRzQvMkVZcUl1b1FmQTRxdStZQmtwZFF6WmZaKy9rL1hx?=
 =?utf-8?B?SG1aSlFodkdScm15a2hWcDhYZU5IdVZRNlo4UkR3R2ZlSnhveUZnN1JOZ3c3?=
 =?utf-8?B?NEkrU2FnRnRHTHNEWTF2ZnF1c0pucVhRbG5zQWt4c2JUSEFpVElhc0RwVE5x?=
 =?utf-8?B?RDl6UGk5UTdLWDFvTVRFZ05QeCttMnVlaWcrdWc3YytoOUcwbXpnanlJRVdk?=
 =?utf-8?B?V0pVM3VXZm1sNDJpZTJJamc4TDdzb3FzU3hnM04rT3BuUGFLdlRTOVVheTZH?=
 =?utf-8?B?bEJnNU5aYjZka01KU2hTRVFQNllxSTJVYUtUUTVzVE5JczJlK2VjUUI3dit6?=
 =?utf-8?B?cjdFbEVzL1E1R1hCRGEySXY3Wkc5YmdMOGxDb2tibHFhSTdocllhK0J0Q3Vj?=
 =?utf-8?B?WHdqcUw2WVFJeHpGRzBhR3g2WDBtNzdvWDZ5U04vMEJxMHREQWlnSUpnWE5Q?=
 =?utf-8?B?TnBtZFBtU3o2dmtDQStuNk1JYlQwRlRLOHhrSitZQjV5eDR2QVFxVmJ2UG5z?=
 =?utf-8?B?UHpiR2ZscndQOEhLOGhLMU1oWW1yYWpDb0gzN3J5bFVmQzBLYkxyYWNoakty?=
 =?utf-8?B?Y1FhbmVtdUJFakdISG9zaEFJTUlqN2pFaENra3MzU3VCQUIrbTU2SEFxcno4?=
 =?utf-8?B?YngvUVgyS1BCUTBvdDFKT0IvRDFETHBiT21tMCtKTExEOXdhbWZwL3VPaEg4?=
 =?utf-8?B?OHNwQVowbGt3aVBnWlN1K2F1WWxld2hDSVVnOWowVkZEV3FJUkdQdXJnRWw4?=
 =?utf-8?B?UW84dndQQVV1K0o4N2xFa0RVN3BrbTAyQkhmWGp0dFpWUjYxd2ZiVWM1R0Rm?=
 =?utf-8?B?SkFOclRrcDFjQmFnMmZ1eEJncVJhZ3RZNW9vemtpTTdVY2hKWSt0bCtUOFBl?=
 =?utf-8?B?cy9UWlhPVXlJNDlkTExsS3NpK3FSUTZFcjVxVjFJbWZaNGZjU29jNy9JbUpF?=
 =?utf-8?B?RHVCdjl6T1JZdGZUbzRCZFVhY1FMejIzUEo1RFp2RnYvbmpVYVZsQ0ZKc2hJ?=
 =?utf-8?B?MkJOaEFHSjRtL0tQWVFOeGViQTIxUDZRS2cvVWh4RURGNHhRRDZ2MzM2K2JH?=
 =?utf-8?B?NnlMYlZHeGQ0S05iL0JrTzdYUWpLNGpWSHNrTEZpek03dmpjYzdxM0NWRFNP?=
 =?utf-8?B?ZFJXYnFyWHRkc0o0Y0tpNndZVVZ3YVgvZDhDTWpFWDRNN2FCVzdBME43S0xU?=
 =?utf-8?B?TlQxSWRmYWR6dWlFZmdjcFJkYTFTditjdld0dlBhc1hzZEw2NGlFODkzRWg3?=
 =?utf-8?B?aHF2SDgzT3pZVXFrMk9GcUc2OHVpb1NYN3Y5M1pvWWZLRjV3MjEva2hvLzdZ?=
 =?utf-8?B?WkdKTXR4enhIMzRCcEhVelphWUtELzdvbHdZU2pPNlJWM25yOTQ0T0dEbnU3?=
 =?utf-8?B?bFFmdGU4bjRibEV3Tm05ejBocjhSR2xhN3QxNExyaFI4YnlpWTJnQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da24dac-9410-4ab2-dcdc-08df29d4802e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:21:17.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrlPcqs4L2wHCTT6lec/s2tlnK4H3MUnjPRYnFskXvGz9U263kBZ7T7VCw73pWLnmRab1GCjDytCyVCLDmBe/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8605

On Wed Oct 14, 2026 at 10:08 AM BST, Alice Ryhl wrote:
> From: Danilo Krummrich <dakr@kernel.org>
>=20
> system_wq is deprecated and triggers a runtime warning:
>=20
> 	[    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7_ enque=
ued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>=20
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>=20
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>=20
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> This patch was previously sent as part of other workqueue series [1][2].
> However it's a fix that is independent of those series, so it's sent on
> its own here.
>=20
> [1] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org
> [2] https://lore.kernel.org/all/20260807165252.3849875-2-dakr@kernel.org
> ---
> Changes in v2:
> - Also remove system_unbound(), which is deprecated in the same way
>   and has no users. (Gary)
> - Collect Reviewed-by from Boqun and Dongliang.
> - Link to v1: https://lore.kernel.org/r/20261013-rust-workqueue-system-fi=
x-v1-1-e9ec616e402b@google.com
>=20
> Changes since [2]:
> - Rebase on v7.3-rc7 and also convert the new SpinLockIrq KUnit test,
>   which calls workqueue::system() and otherwise fails to build.
> - Add Fixes: tag for the commit that made system_wq warn.
> - Collect Reviewed-by from Daniel.
> ---
>  Documentation/rust/testing.rst                    |  2 +-
>  Documentation/translations/zh_CN/rust/testing.rst |  2 +-
>  drivers/android/binder/process.rs                 |  4 +-
>  rust/kernel/sync/completion.rs                    |  2 +-
>  rust/kernel/sync/lock/spinlock.rs                 |  2 +-
>  rust/kernel/workqueue.rs                          | 52 ++++++++++++-----=
------
>  6 files changed, 33 insertions(+), 31 deletions(-)

