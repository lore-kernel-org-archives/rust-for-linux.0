Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021117.outbound.protection.outlook.com [52.101.100.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6D39B945;
	Wed,  4 Mar 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623566; cv=fail; b=G0D+CYxZyeiBuqcQ9bURZo0+tAYkeQhMRD41hKI6+NTjRoQK9stTe44yc7zJDbIRdG+Bq35faAlrb0bBMLtMcCDZUTNp/0djJbcbeouqL7JpbsuZwuw04EzsMs9HTETld/h8V3B2CkIZe6z7A8+OJC1si812PJoudBnIX2XlfIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623566; c=relaxed/simple;
	bh=VXJn2rT9yeIM3X2Umc1t8CQJwGFWQyvdOlUTcS+6KgY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RNwPAyEd8aMdVP0Ig1efSXX4JnDg5mMf76LHAqxxDEcJOCBaEsq2m78KFkpZi2nJ4DnJNiITPWXDyRC7HvXZEtuzjG2NMTKLZpEtgrJoli1Ti/JkO9JvUnxedj65a8F2bYY8IjU9pQCJLLeu2CD4uP2NvhIUrvzf9v2tfVcMIn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UHPqv4rn; arc=fail smtp.client-ip=52.101.100.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UHPqv4rn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lo2TSZBBI15s2MrZJeb1Bh2NlGFdqsNqiAfjr8wymobt8TEuOOqwWUANw3AbuLaWX5jNZHhZ+5qVqF126nGaR8kvXbZz+TPfJ50qN3WwoJasSGYkl3H+clH2wM0LYdH5SS9nkpc/iHEfLdgPsLjEg2nog8R5F6LY9BPUVOl0VNrbQWZiUytAqHT5H7PyzjVIGks2VaBrpT9xpGltGx6tuHFRSSv8nzenACYPB5fKD6DrGlaIOX50oLROKgb/UbXjT+cgAEfyfgPvFmL7P6RT3l8jkZWsY3bmC090PUMlysRRGSsocON16psMvqs5sazd4v3+YP3VZMwbLQQRaxDD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t45WpS6qZ2bugJ/nApbAnHw36+/NTKQfhOFicA+lWE=;
 b=n1K420NAZpRsi/37gecdDh8BJ9Raa3cPhvEx19DTrhKK+JrT2LP47oS1/Y+xhG5m4KiJJ6exeQBtjRXAmLKUaE4di+V3H1BSWs39oXbxP3JC+X1U9wBv4KXa6qqwYcbz6+WuNEh7yBHFPSOrVOS0bhnzC/9KK+2NGmCIkkThdNHRjv+Fj5bv3DNgN+RKN0aWF3gbyTF+zwLQp+ZACvj8N1mrdJ9gUo4paYcI5/aDMdJMg/p2sf1gwVqou8gZAln9wwW0R56KqpxDYFN9WJxpa1iHv/7/d8cX8E0VP61Ia6HvbGi3nt+Ydr0X7RozEvMjzK/z4qnyb9VhzsvkXX9EaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t45WpS6qZ2bugJ/nApbAnHw36+/NTKQfhOFicA+lWE=;
 b=UHPqv4rnsRjyhu++SL/4LpapJ23Y3LCUIw6BzDtsu8JIFU3jR+oD7HsKyKlH/g8rkmo6FWmMc96gVTwnzBBdjfDBkQudnjjiqAbi3pHnF8jdwGUgbtkeqqolqQnqGEaYBaefbuTupo4HFs8ISl8pkUBJnNrh24BVQrfoD/oNHIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6634.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:25:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:25:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 11:25:55 +0000
Message-Id: <DGTYLVMRI3BQ.1Y7XCE37MU2H5@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 2/5] gpu: nova-core: gsp: add `RECEIVE_TIMEOUT`
 constant for command queue
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
X-ClientProxiedBy: LO4P123CA0230.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 13401414-cd68-4b52-9218-08de79e0cdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	xEPbbQQQAqLXpM4pNLVF4HiLmJip9Vz4qbOtq46dIBu0H4bLLI3kWC+rNrjYUrI7I9RPdbl4UuEvg0XvvbgXeBY6shJzHaJQuvSo53La0xRSCABZEZaaJcH4wP8D6DeSd1MMa/q6tWpBKhCFmaKEeI8Kbgw2hyKQnVLLUMxQ+VPJUH5IePC4Hudob9p8rGurtadQHpYEeh72SX70Izv27fgBOLhTOM8+9LZzKLOJxy2cj9Z/jGXj3Rc0vtHA03xibic3dJAtasAEbIysQ6s1FU+SCfOGiKTf3VhqvTGG/AozN/uhY4AA7eMotE5c95C46xofj6KNoIgqMVApTC7xcyAAAPKpKi18Vt5dmqBZu2mksHYOCYijtlSp7cj2zj5kLhFc1lBZ58EKLDyxuQVR+7g86GQm0Jf4Dm0IZdev1WvCs+3Pdc7vjwl/Lg/ZFuuTT0shrEfejhfroUCkSVlqGW4Me4CdEPQMgE/qQvbV+mJ/Zdi5C1D66japWC5UHR+4KvccnpWkc3D+lHtfMobdrzqVjN+1o4Bc3Ud01A77l3Z07ElZj1ptu1dYu0cPwe3fN61XPpHlbeoIIIUG+KwVDCkemy0k5aMUtJ4NtQvwDnrrlPiGMT6oVZkvf5WNtqlsDjfRh4WSm3peSzacFuAjTKyjYLmt93841bbTMAOqY/Th6vAAFWGiLoBP+yLI9FMtijiye37+u1PyMPxJ/ILRKBiT+8tqdQBkF2HBeqqX990=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU5YcmF1RFhmZ1FLNVZQdUM3YkMySlZHcnZDYTZqb28vNTkzazZXSjN4bkhC?=
 =?utf-8?B?QzlOaVl4RHZFMWt6L1JSelNWcTBUUW1JU2hiTmJ5bG1kbFowSktZdi8rVmVO?=
 =?utf-8?B?RU00c1EwYmhNaEkraVZuYlZPT2hzSkk5UU12TENCK0NhOGx2RUxIYlFpTkR0?=
 =?utf-8?B?L0EwR2RBb2QwcVl0ZW9yZ2xySzFHNUdEWlRTY3htM2dMMUlyOFhBNzlhQWFS?=
 =?utf-8?B?OVlHMHNWSFVHb1U2TlNHZEZwU1c1RFo4ZTNwNHNjMUhkMzkvL3lFaGw1V0Q2?=
 =?utf-8?B?eXhCNHNuVXJzU1lHQkJpRkFqN0Mxck02ekdoUDh2ZVg1NEpjb3FOZllWWFN4?=
 =?utf-8?B?ZnE2bmpPMmIyQTRRZXllN3NleWV6WGgwY2RLOTRUdVArczFaNWlYNjhOd3lX?=
 =?utf-8?B?eU5iYllVOG1lVzRCLzlpdUtjdFpwdkZyUFRvVmp2aG81MVF5ek5tb2RuT2pB?=
 =?utf-8?B?TWNVeG52WWRGTWp1b0gxbWZEU04vdVovdTFRV0s5bmRMNHR2MVRDdUI4ckdK?=
 =?utf-8?B?dk1NZUlkZWxlUGFrOTJIV0VYem1adzN3YWd3TlVrRWtRVXJ1czE2dWErYy96?=
 =?utf-8?B?Y0h2RmgvQUtpbFNBd3hZR29PVi8zL3BWd3pPOXVFa0FIbWw0QnVTN2lHOXg2?=
 =?utf-8?B?bU9zeXg3UXI1cTM4ejZhUlZOUWJWNzB1N25idkxxRy9aZW5RREJ4YzZJLzhS?=
 =?utf-8?B?ek1rRE5vQ3ZmK213N3NGY3lwZmNQajJIQytnOEJmWTBVOXhHMnZRYTBRNUxq?=
 =?utf-8?B?TTRUZWJVRUhxbkVqdzZnUjBiS0tmeUlCV0c2a1U4Q29wai9NQUVLc3lmQVVu?=
 =?utf-8?B?ZmgxTXZGUnBBRW5LTnpkNHYvaEZ0c0orZmhUQVJucWl0NHhIb2ZPQ2hzOWpO?=
 =?utf-8?B?VWhwcExDYTZCVVdCVmxZU3d0OTh2bEw3S3lXeUJpV1FqOGRDVTIwdEYxRjFY?=
 =?utf-8?B?bGcxQUpUYnoyUU4rWVMzSElYQjVqMFpVdDN5VnlvUHg5dWVpZzJpTUZGaGRv?=
 =?utf-8?B?ZXVGbFIyWlNpZzlGT2pORHNhT2o5OTdLU1JLOFJ5T0orNGV5cStrVVFlV3B3?=
 =?utf-8?B?MVh1QVdtUzdXRlZnUG5yN05QVDhsalBDWlpYN2NMWnNYZkxtc1d3b01TMmx4?=
 =?utf-8?B?Z0pYZ3M3aHFmWEhJTW9HMW40Y29mUjA4YnVmVDMzRk5aSEVaNFBwUitQRk13?=
 =?utf-8?B?Sjd3eUdoSlViSUpkcGxSZ3grcmRpOFJwQ0IvNE5sNjhFY1BINlBzVmsxdUJx?=
 =?utf-8?B?ckFVdDJmSGhRYlMzclNpeVJFQjRCUjlwQThPMmtHZnJzalZoUURldUN2SVY3?=
 =?utf-8?B?SmNKc2RSMks3bWJmYXVZOGZLQU9FdENhRE9OelFhNEoxZjQ1YS9nVFBxc0lX?=
 =?utf-8?B?b21LVHppUmRabERHTW9RVjB2Lzk0alhiTDFmTWVUVzNQOTZQQy8ya09ybE9V?=
 =?utf-8?B?MDNIRkJSZVI0ejRqT1dYcWFjQkNoajRUdXYrZHlGb0xQakFZenBMazA0TG9P?=
 =?utf-8?B?WU01M1ZKYU5pUGxsRzFtMkVEOGxRcnROay9EcDg0ZHEzbVJsTDVBeGxNekJR?=
 =?utf-8?B?a09oOXo3OHNKNDhsM2ROMjgxZTBnajhYaFV5eHp0d096S01hcEwzTFJMV0NY?=
 =?utf-8?B?Yk56YTI2eHhVOVFKVVBOclFGSzJ5MEhFaHptaUwwNm84MkR6VlBDK2VFY0po?=
 =?utf-8?B?QXcrN3JnVCs2K0RhWWJMejVRTU5TZVk0RzJWUDlQcUhlUXMxK2JNVDNnN1Fa?=
 =?utf-8?B?TThsUEUyNFVQVC9SMmhJaHFkMVViWDJnekVPZW83QUdocjUrNDlvNnRUMGQx?=
 =?utf-8?B?MlZ6elNLSmV6MmFNSmRKSExaMkxrRmhoU0NjZW9aMWVJZXZ2ZW14b2kzQTZU?=
 =?utf-8?B?ZkRQTS90RHlFTXlsUTM4UVpzaHN3eHppeUNybTJXWkZHVUIramVndjllenN0?=
 =?utf-8?B?dVJ0Vytkekx3TFNHL0RwdWsrbHVTWklDY3A5K1pEcm1QSENlS01qUU0yN3ly?=
 =?utf-8?B?STJGKzZqYUIzbUsyamg5MXRLMkV3U0xFVGZxVzBtMjlLUmp3RFp3UmwvUUwx?=
 =?utf-8?B?a1BPVC94YjZldXRnVTVUNk8vcmMrdmtITE94R1A3MHkydTFXR1RySStLakdZ?=
 =?utf-8?B?U3RQQzRjaGd2dE1IMy9US2FleHZES2tPRTFzWVFGbUROQUFvZHYvN3IzeTVj?=
 =?utf-8?B?eHA5bnZlcER6Q3Y0ek94S0VOYmduYk1qaXV4WDZma2MzbStMKzNRbEFwbnRs?=
 =?utf-8?B?SVJuU3VNWHBxMVE4RFZxQzhTVExxTFZNa3dud2I0Q0NYd1N2WGI0dG5Nck1u?=
 =?utf-8?B?TDhTalRtMlBqRHYzMTNJT2dwbG9NUCtuUGg3Z3dGcW8vM3NKTlZlUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 13401414-cd68-4b52-9218-08de79e0cdbb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:25:56.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 099hdC3FGjvvUowjsg654JUCr2yhWD6Vzi3iYW0010P360WrPjKLu7meDaJGn3yP86tVVOxXHU6Wl9wuSmh3Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6634

On Wed Mar 4, 2026 at 2:46 AM GMT, Eliot Courtney wrote:
> Remove magic numbers and add a default timeout for callers to use.
>=20
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 3 +++
>  drivers/gpu/nova-core/gsp/commands.rs  | 5 ++---
>  drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)

